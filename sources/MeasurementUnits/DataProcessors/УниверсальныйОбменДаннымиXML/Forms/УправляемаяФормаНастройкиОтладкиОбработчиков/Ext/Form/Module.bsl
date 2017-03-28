﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// Проверка прав доступа должна располагаться самой первой.
	Если Не ПравоДоступа("Администрирование", Метаданные) Тогда
		ВызватьИсключение НСтр("ru = 'Использование обработки в интерактивном режиме доступно только администратору.'");
	КонецЕсли;
	
	Если Параметры.Свойство("АвтоТест") Тогда // Возврат при получении формы для анализа.
		Возврат;
	КонецЕсли;
	
	Объект.ИмяФайлаОбмена = Параметры.ИмяФайлаОбмена;
	Объект.ИмяФайлаПравилОбмена = Параметры.ИмяФайлаПравилОбмена;
	Объект.ИмяФайлаВнешнейОбработкиОбработчиковСобытий = Параметры.ИмяФайлаВнешнейОбработкиОбработчиковСобытий;
	Объект.РежимОтладкиАлгоритмов = Параметры.РежимОтладкиАлгоритмов;
	Объект.ОбработчикиСобытийЧитаемИзФайлаПравилОбмена = Параметры.ОбработчикиСобытийЧитаемИзФайлаПравилОбмена;
	
	ЗаголовокФормы = НСтр("ru = 'Настройка отладки обработчиков при %Событие% данных'");	
	Событие = ?(Параметры.ОбработчикиСобытийЧитаемИзФайлаПравилОбмена, НСтр("ru = 'выгрузке'"), НСтр("ru = 'загрузке'"));
	ЗаголовокФормы = СтрЗаменить(ЗаголовокФормы, "%Событие%", Событие);
	Заголовок = ЗаголовокФормы;
	
	ЗаголовокКнопки = НСтр("ru = 'Сформировать модуль отладки %Событие%'");
	Событие = ?(Параметры.ОбработчикиСобытийЧитаемИзФайлаПравилОбмена, НСтр("ru = 'выгрузки'"), НСтр("ru = 'загрузки'"));
	ЗаголовокКнопки = СтрЗаменить(ЗаголовокКнопки, "%Событие%", Событие);
	Элементы.ВыгрузитьКодОбработчиков.Заголовок = ЗаголовокКнопки;
	
	УстановитьВидимость();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ОтладкаАлгоритмовПриИзменении(Элемент)
	
	ОтладкаАлгоритмовПриИзмененииНаСервере();
	
КонецПроцедуры

&НаКлиенте
Процедура ИмяФайлаВнешнейОбработкиОбработчиковСобытийНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	ДиалогВыбораФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	
	ДиалогВыбораФайла.Фильтр     = НСтр("ru = 'Файл внешней обработки обработчиков событий (*.epf)|*.epf'");
	ДиалогВыбораФайла.Расширение = "epf";
	ДиалогВыбораФайла.Заголовок = НСтр("ru = 'Выберите файл'");
	ДиалогВыбораФайла.ПредварительныйПросмотр = Ложь;
	ДиалогВыбораФайла.ИндексФильтра = 0;
	ДиалогВыбораФайла.ПолноеИмяФайла = Элемент.ТекстРедактирования;
	ДиалогВыбораФайла.ПроверятьСуществованиеФайла = Истина;
	
	Если ДиалогВыбораФайла.Выбрать() Тогда
		
		Объект.ИмяФайлаВнешнейОбработкиОбработчиковСобытий = ДиалогВыбораФайла.ПолноеИмяФайла;
		
		ИмяФайлаВнешнейОбработкиОбработчиковСобытийПриИзменении(Элемент)
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ИмяФайлаВнешнейОбработкиОбработчиковСобытийПриИзменении(Элемент)
	
	УстановитьВидимость();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Готово(Команда)
	
	ОчиститьСообщения();
	
	Если ПустаяСтрока(Объект.ИмяФайлаВнешнейОбработкиОбработчиковСобытий) Тогда
		
		СообщитьПользователю(НСтр("ru = 'Укажите имя файла внешней обработки.'"), "ИмяФайлаВнешнейОбработкиОбработчиковСобытий");
		Возврат;
		
	КонецЕсли;
	
	ФайлВнешнейОбработкиОбработчиковСобытий = Новый Файл(Объект.ИмяФайлаВнешнейОбработкиОбработчиковСобытий);
	Если Не ФайлВнешнейОбработкиОбработчиковСобытий.Существует() Тогда
		
		СообщитьПользователю(НСтр("ru = 'Указанный файл внешней обработки не существует.'"), "ИмяФайлаВнешнейОбработкиОбработчиковСобытий");
		Возврат;
		
	КонецЕсли;
	
	ПараметрыЗакрытия = Новый Структура;
	ПараметрыЗакрытия.Вставить("ИмяФайлаВнешнейОбработкиОбработчиковСобытий", Объект.ИмяФайлаВнешнейОбработкиОбработчиковСобытий);
	ПараметрыЗакрытия.Вставить("РежимОтладкиАлгоритмов", Объект.РежимОтладкиАлгоритмов);
	ПараметрыЗакрытия.Вставить("ИмяФайлаПравилОбмена", Объект.ИмяФайлаПравилОбмена);
	ПараметрыЗакрытия.Вставить("ИмяФайлаОбмена", Объект.ИмяФайлаОбмена);
	
	Закрыть(ПараметрыЗакрытия);
	
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьФайл(Команда)
	
	ПоказатьОбработчикиСобытийВОкне();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура УстановитьВидимость()
	
	ОтладкаАлгоритмовПриИзмененииНаСервере();
	
	// Выделение красным цветом шагов мастера, которые выполнены неправильно.
	УстановитьВыделениеРамки("Группа_Шаг_4", ПустаяСтрока(Объект.ИмяФайлаВнешнейОбработкиОбработчиковСобытий));
	
	Элементы.ОткрытьФайл.Доступность = Не ПустаяСтрока(Объект.ИмяВременногоФайлаОбработчиковСобытий);
	
КонецПроцедуры

&НаСервере
Процедура УстановитьВыделениеРамки(ИмяРамки, НадоВыделитьРамку = Ложь) 
	
	РамкаШагаМастера = Элементы[ИмяРамки];
	
	Если НадоВыделитьРамку Тогда
		
		РамкаШагаМастера.ЦветТекстаЗаголовка = ЦветаСтиля.ЦветОсобогоТекста;
		
	Иначе
		
		РамкаШагаМастера.ЦветТекстаЗаголовка = Новый Цвет;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьКодОбработчиков(Команда)
	
	// Возможно выгрузку уже совершали ранее...
	Если Не ПустаяСтрока(Объект.ИмяВременногоФайлаОбработчиковСобытий) Тогда
		
		СписокКнопок = Новый СписокЗначений;
		СписокКнопок.Добавить(КодВозвратаДиалога.Да, НСтр("ru = 'Выгрузить повторно'"));
		СписокКнопок.Добавить(КодВозвратаДиалога.Нет, НСтр("ru = 'Открыть модуль'"));
		СписокКнопок.Добавить(КодВозвратаДиалога.Отмена);
		
		ОписаниеОповещения = Новый ОписаниеОповещения("ВыгрузитьКодОбработчиковЗавершение", ЭтотОбъект);
		ПоказатьВопрос(ОписаниеОповещения, НСтр("ru = 'Модуль отладки с кодом обработчиков уже выгружен.'"), СписокКнопок,,КодВозвратаДиалога.Нет);
		
	Иначе
		
		ВыгрузитьКодОбработчиковЗавершение(КодВозвратаДиалога.Да, Неопределено);
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьКодОбработчиковЗавершение(Результат, ДополнительныеПараметры) Экспорт
	
	ЕстьОшибкиВыгрузки = Ложь;
	
	Если Результат = КодВозвратаДиалога.Да Тогда
		
		ВыгруженоСОшибками = Ложь;
		ВыгрузитьОбработчикиСобытийНаСервере(ВыгруженоСОшибками);
		
	ИначеЕсли Результат = КодВозвратаДиалога.Отмена Тогда
		
		Возврат;
		
	КонецЕсли;
	
	Если Не ЕстьОшибкиВыгрузки Тогда
		
		УстановитьВидимость();
		
		ПоказатьОбработчикиСобытийВОкне();
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПоказатьОбработчикиСобытийВОкне()
	
	ОбработчикиСобытий = ОбработчикиСобытий();
	Если ОбработчикиСобытий <> Неопределено Тогда
		ОбработчикиСобытий.Показать(НСтр("ru = 'Модуль отладки обработчиков'"));
	КонецЕсли;
	
	
	ПротоколОбмена = ПротоколОбмена();
	Если ПротоколОбмена <> Неопределено Тогда
		ПротоколОбмена.Показать(НСтр("ru = 'Ошибки выгрузки модуля обработчиков'"));
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Функция ОбработчикиСобытий()
	
	ОбработчикиСобытий = Неопределено;
	
	ФайлОбработчиков = Новый Файл(Объект.ИмяВременногоФайлаОбработчиковСобытий);
	Если ФайлОбработчиков.Существует() И ФайлОбработчиков.Размер() <> 0 Тогда
		ОбработчикиСобытий = Новый ТекстовыйДокумент;
		ОбработчикиСобытий.Прочитать(Объект.ИмяВременногоФайлаОбработчиковСобытий);
	КонецЕсли;
	
	Возврат ОбработчикиСобытий;
	
КонецФункции

&НаСервере
Функция ПротоколОбмена()
	
	ПротоколОбмена = Неопределено;
	
	ФайлОшибок = Новый Файл(Объект.ИмяВременногоФайлаПротоколаОбмена);
	Если ФайлОшибок.Существует() И ФайлОшибок.Размер() <> 0 Тогда
		ПротоколОбмена = Новый ТекстовыйДокумент;
		ПротоколОбмена.Прочитать(Объект.ИмяВременногоФайлаОбработчиковСобытий);
	КонецЕсли;
	
	Возврат ПротоколОбмена;
	
КонецФункции

&НаСервере
Процедура ВыгрузитьОбработчикиСобытийНаСервере(Отказ)
	
	ОбъектДляСервера = РеквизитФормыВЗначение("Объект");
	ЗаполнитьЗначенияСвойств(ОбъектДляСервера, Объект);
	ОбъектДляСервера.ВыгрузитьОбработчикиСобытий(Отказ);
	ЗначениеВРеквизитФормы(ОбъектДляСервера, "Объект");
	
КонецПроцедуры

&НаСервере
Процедура ОтладкаАлгоритмовПриИзмененииНаСервере()
	
	Подсказка = Элементы.ПодсказкаОтладкаАлгоритмов;
	
	Подсказка.ТекущаяСтраница = Подсказка.ПодчиненныеЭлементы["Группа_"+Объект.РежимОтладкиАлгоритмов];
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура СообщитьПользователю(Текст, ПутьКДанным = "")
	
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = Текст;
	Сообщение.ПутьКДанным = ПутьКДанным;
	Сообщение.Сообщить();
	
КонецПроцедуры

#КонецОбласти
