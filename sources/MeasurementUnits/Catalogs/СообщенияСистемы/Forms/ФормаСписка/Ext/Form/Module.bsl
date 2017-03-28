﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	УстановитьУсловноеОформление();
	
	Если Параметры.Свойство("АвтоТест") Тогда // Возврат при получении формы для анализа.
		Возврат;
	КонецЕсли;
	
	ЭтоСеансСУстановленнымиЗначениямиРазделителей = ОбщегоНазначенияПовтИсп.РазделениеВключено() 
		И ОбщегоНазначенияПовтИсп.ДоступноИспользованиеРазделенныхДанных();
	
	// Начальная настройка группировки.
	ГруппировкаДанных = Список.КомпоновщикНастроек.Настройки.Структура.Добавить(Тип("ГруппировкаКомпоновкиДанных"));
	ГруппировкаДанных.ИдентификаторПользовательскойНастройки = "ОсновнаяГруппировка";
	ГруппировкаДанных.РежимОтображения = РежимОтображенияЭлементаНастройкиКомпоновкиДанных.Недоступный;
	
	ПоляГруппировки = ГруппировкаДанных.ПоляГруппировки;
	
	ЭлементГруппировкиДанных = ПоляГруппировки.Элементы.Добавить(Тип("ПолеГруппировкиКомпоновкиДанных"));
	ЭлементГруппировкиДанных.Поле = Новый ПолеКомпоновкиДанных("Получатель");
	ЭлементГруппировкиДанных.Использование = Истина;
	
	ЭлементГруппировкиДанных = ПоляГруппировки.Элементы.Добавить(Тип("ПолеГруппировкиКомпоновкиДанных"));
	ЭлементГруппировкиДанных.Поле = Новый ПолеКомпоновкиДанных("Отправитель");
	ЭлементГруппировкиДанных.Использование = Ложь;
	
	// Условная настройка группировки.
	ВариантГруппировки = "ПоПолучателю";
	УстановитьГруппировкуСписка();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ВариантГруппировкиПриИзменении(Элемент)
	
	УстановитьГруппировкуСписка();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ОтправитьИПолучитьСообщения(Команда)
	
	Если ЭтоСеансСУстановленнымиЗначениямиРазделителей Тогда
		ТекстСообщения = НСтр("ru = 'Обработка сообщений возможна только в неразделенном сеансе администратора сервиса.'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(ТекстСообщения);
		Возврат;
	КонецЕсли;

	ОбменСообщениямиКлиент.ОтправитьИПолучитьСообщения();
	Элементы.Список.Обновить();
	
КонецПроцедуры

&НаКлиенте
Процедура Настройка(Команда)
	
	ОткрытьФорму("ОбщаяФорма.НастройкаОбменаСообщениями",, ЭтотОбъект);
	
КонецПроцедуры

&НаКлиенте
Процедура Удалить(Команда)
	
	Если Элементы.Список.ТекущиеДанные <> Неопределено Тогда
		
		Если Элементы.Список.ТекущиеДанные.Свойство("ГруппировкаСтроки")
			И ТипЗнч(Элементы.Список.ТекущиеДанные.ГруппировкаСтроки) = Тип("СтрокаГруппировкиДинамическогоСписка") Тогда
			
			ПоказатьПредупреждение(, НСтр("ru = 'Действие недоступно для строки группировки списка.'"));
			
		Иначе
			
			Если Элементы.Список.ВыделенныеСтроки.Количество() > 1 Тогда
				
				СтрокаВопроса = НСтр("ru = 'Удалить выделенные сообщения?'");
				
			Иначе
				
				СтрокаВопроса = НСтр("ru = 'Удалить сообщение ""[Сообщение]""?'");
				СтрокаВопроса = СтрЗаменить(СтрокаВопроса, "[Сообщение]", Элементы.Список.ТекущиеДанные.Наименование);
				
			КонецЕсли;
			
			ОписаниеОповещения = Новый ОписаниеОповещения("УдалитьЗавершение", ЭтотОбъект);
			ПоказатьВопрос(ОписаниеОповещения, СтрокаВопроса, РежимДиалогаВопрос.ДаНет,, КодВозвратаДиалога.Да);
			
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура УдалитьЗавершение(Ответ, ДополнительныеПараметры) Экспорт
	
	Если Ответ = КодВозвратаДиалога.Да Тогда
		
		УдалитьСообщениеНепосредственно(Элементы.Список.ВыделенныеСтроки);
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура УстановитьУсловноеОформление()
	
	УсловноеОформление.Элементы.Очистить();
	
	// Оформление заблокированной записи.
	
	Элемент = УсловноеОформление.Элементы.Добавить();
	
	ПолеЭлемента = Элемент.Поля.Элементы.Добавить();
	ПолеЭлемента.Поле = Новый ПолеКомпоновкиДанных(Элементы.Список.Имя);
	
	ОтборЭлемента = Элемент.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	ОтборЭлемента.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Список.Заблокировано");
	ОтборЭлемента.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
	ОтборЭлемента.ПравоеЗначение = Истина;
	
	Элемент.Оформление.УстановитьЗначениеПараметра("ЦветТекста", ЦветаСтиля.ПоясняющийОшибкуТекст);
	
	// Оформление быстрого сообщения.
	
	Элемент = УсловноеОформление.Элементы.Добавить();
	
	ПолеЭлемента = Элемент.Поля.Элементы.Добавить();
	ПолеЭлемента.Поле = Новый ПолеКомпоновкиДанных(Элементы.Список.Имя);
	
	ГруппаЭлементовОтбора = Элемент.Отбор.Элементы.Добавить(Тип("ГруппаЭлементовОтбораКомпоновкиДанных"));
	ГруппаЭлементовОтбора.ТипГруппы = ТипГруппыЭлементовОтбораКомпоновкиДанных.ГруппаИ;
	
	ОтборЭлемента = ГруппаЭлементовОтбора.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	ОтборЭлемента.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Список.Заблокировано");
	ОтборЭлемента.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
	ОтборЭлемента.ПравоеЗначение = Ложь;
	
	ОтборЭлемента = ГруппаЭлементовОтбора.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	ОтборЭлемента.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Список.ЭтоБыстроеСообщение");
	ОтборЭлемента.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
	ОтборЭлемента.ПравоеЗначение = Истина;
	
	Элемент.Оформление.УстановитьЗначениеПараметра("ЦветТекста", ЦветаСтиля.РезультатУспехЦвет);
	
КонецПроцедуры

&НаСервере
Процедура УстановитьГруппировкуСписка()
	
	ГруппировкаПолучатель  = Список.КомпоновщикНастроек.Настройки.Структура[0].ПоляГруппировки.Элементы[0];
	ГруппировкаОтправитель = Список.КомпоновщикНастроек.Настройки.Структура[0].ПоляГруппировки.Элементы[1];
	
	Если ВариантГруппировки = "БезГруппировки" Тогда
		
		ГруппировкаПолучатель.Использование = Ложь;
		ГруппировкаОтправитель.Использование = Ложь;
		
		Элементы.Отправитель.Видимость = Истина;
		Элементы.Получатель.Видимость = Истина;
		
	Иначе
		
		Использование = (ВариантГруппировки = "ПоПолучателю");
		
		ГруппировкаПолучатель.Использование = Использование;
		ГруппировкаОтправитель.Использование = Не Использование;
		
		Элементы.Отправитель.Видимость = Использование;
		Элементы.Получатель.Видимость = Не Использование;
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура УдалитьСообщениеНепосредственно(Знач Сообщения)
	
	Для Каждого Сообщение Из Сообщения Цикл
		
		Если ТипЗнч(Сообщение) <> Тип("СправочникСсылка.СообщенияСистемы") Тогда
			Продолжить;
		КонецЕсли;
		
		ОбъектСообщения = Сообщение.ПолучитьОбъект();
		
		Если ОбъектСообщения <> Неопределено Тогда
			
			ОбъектСообщения.Заблокировать();
			
			Если ЗначениеЗаполнено(ОбъектСообщения.Отправитель)
				И ОбъектСообщения.Отправитель <> ОбменСообщениямиВнутренний.ЭтотУзел() Тогда
				
				ОбъектСообщения.ОбменДанными.Получатели.Добавить(ОбъектСообщения.Отправитель);
				ОбъектСообщения.ОбменДанными.Получатели.АвтоЗаполнение = Ложь;
				
			КонецЕсли;
			
			ОбъектСообщения.ОбменДанными.Загрузка = Истина; // Наличие ссылок на справочник не должно препятствовать или замедлять удаление элементов справочника.
			ОбъектСообщения.Удалить();
			
		КонецЕсли;
		
	КонецЦикла;
	
	Элементы.Список.Обновить();
	
КонецПроцедуры

#КонецОбласти
