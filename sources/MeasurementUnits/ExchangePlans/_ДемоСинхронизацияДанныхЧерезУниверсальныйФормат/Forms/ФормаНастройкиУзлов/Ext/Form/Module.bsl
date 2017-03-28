﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Свойство("АвтоТест") Тогда // Возврат при получении формы для анализа.
		Возврат;
	КонецЕсли;
	
	Если Параметры.Свойство("ПараметрыПодключения") Тогда
		ПараметрыСоединения = Параметры.ПараметрыПодключения;
	КонецЕсли;
	
	ИменаРеквизитов                   = СтруктураСоответствияНастройкиОтборовРеквизитамФормы();
	ИменаРеквизитовБазыКорреспондента = СтруктураСоответствияНастройкиОтборовКорреспондентаРеквизитамФормы();
	
	Если Параметры.Свойство("ИдентификаторНастройки") Тогда
		ВариантНастройки = Параметры.ИдентификаторНастройки;
	КонецЕсли;
	
	ОбменДаннымиСервер.ФормаНастройкиУзловПриСозданииНаСервере(ЭтотОбъект, Отказ);
	
	СтруктураОтбора = Новый Структура("Использовать", Истина);
	Организации.Загрузить(Организации.Выгрузить(СтруктураОтбора));
	Для Каждого Строка Из Организации Цикл
		Строка.Представление = Справочники._ДемоОрганизации.ПолучитьСсылку(Новый УникальныйИдентификатор(Строка.УникальныйИдентификаторСсылки));
	КонецЦикла;
	
	Если Не ЗначениеЗаполнено(ПравилаОтправкиСправочников) Тогда
		ПравилаОтправкиСправочников = "АвтоматическаяСинхронизация";
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(ПравилаОтправкиСправочниковКорреспондента) Тогда
		ПравилаОтправкиСправочниковКорреспондента = "АвтоматическаяСинхронизация";
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(ПравилаОтправкиДокументов) Тогда
		ПравилаОтправкиДокументов = "АвтоматическаяСинхронизация";
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(ПравилаОтправкиДокументовКорреспондента) Тогда
		ПравилаОтправкиДокументовКорреспондента = "АвтоматическаяСинхронизация";
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(РежимВыгрузкиПриНеобходимости) Тогда
		РежимВыгрузкиПриНеобходимости = 
			Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьПриНеобходимости;
		КонецЕсли;
		
	Если Не ЗначениеЗаполнено(РежимВыгрузкиПриНеобходимостиКорреспондента) Тогда
		РежимВыгрузкиПриНеобходимостиКорреспондента = 
			Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьПриНеобходимости;
	КонецЕсли;
	
	ПравилоОтбораСправочников =
		?(ИспользоватьОтборПоОрганизациям, "СинхронизироватьДанныеТолькоПоВыбраннымОрганизациям", "СинхронизироватьДанныеПоВсемОрганизациям");
		
	ПравилоОтбораСправочниковКорреспондента =
		?(ИспользоватьОтборПоОрганизациямКорреспондента, "СинхронизироватьДанныеТолькоПоВыбраннымОрганизациям", "СинхронизироватьДанныеПоВсемОрганизациям");
	
	УстановитьВидимостьНаСервере();
	ОбновитьНаименованиеКомандФормы();
	ПолучитьОписаниеКонтекста();
	
КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	
	ОбменДаннымиКлиент.ФормаНастройкиПередЗакрытием(Отказ, ЭтотОбъект, ЗавершениеРаботы);
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаВыбора(ВыбранноеЗначение, ИсточникВыбора)
	ОбновитьДанныеОбъекта(ВыбранноеЗначение);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ПереключательОтправлятьНСИАвтоматическиПриИзменении(Элемент)
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательОтправлятьНСИПоНеобходимостиПриИзменении(Элемент)
	
	Если ПравилаОтправкиСправочников = "СинхронизироватьПоНеобходимости" 
		И ПравилаОтправкиДокументов = "НеСинхронизировать" Тогда
		
		ПравилаОтправкиДокументов = "АвтоматическаяСинхронизация";
		
	КонецЕсли;
	
	УстановитьВидимостьНаСервере();
	
КонецПроцедуры

&НаКлиенте
Процедура ПереключательОтправлятьНСИНикогдаПриИзменении(Элемент)
	ПравилаОтправкиДокументов = "НеСинхронизировать";
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательДокументыОтправлятьАвтоматическиПриИзменении(Элемент)
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательДокументыОтправлятьВручнуюПриИзменении(Элемент)
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательДокументыНеОтправлятьПриИзменении(Элемент)
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательОтбораСправочниковСОтборомПриИзменении(Элемент)
	УсловияОграниченияСинхронизации();
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательОтбораСправочниковБезОтбораПриИзменении(Элемент)
	УсловияОграниченияСинхронизации();
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательОтправлятьНСИАвтоматическиКорреспондентаПриИзменении(Элемент)
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательОтправлятьНСИПоНеобходимостиКорреспондентаПриИзменении(Элемент)
	
	Если ПравилаОтправкиСправочниковКорреспондента = "СинхронизироватьПоНеобходимости" 
		И ПравилаОтправкиДокументовКорреспондента = "НеСинхронизировать" Тогда
		
		ПравилаОтправкиДокументовКорреспондента = "АвтоматическаяСинхронизация";
		
	КонецЕсли;
	
	УстановитьВидимостьНаСервере();
	
КонецПроцедуры

&НаКлиенте
Процедура ПереключательОтправлятьНСИНикогдаКорреспондентаПриИзменении(Элемент)
	ПравилаОтправкиДокументовКорреспондента = "НеСинхронизировать";
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательДокументыОтправлятьАвтоматическиКорреспондентаПриИзменении(Элемент)
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательДокументыОтправлятьВручнуюКорреспондентаПриИзменении(Элемент)
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательДокументыНеОтправлятьКорреспондентаПриИзменении(Элемент)
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательОтбораСправочниковСОтборомКорреспондентаПриИзменении(Элемент)
	УсловияОграниченияСинхронизации();
	УстановитьВидимостьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПереключательОтбораСправочниковБезОтбораКорреспондентаПриИзменении(Элемент)
	УсловияОграниченияСинхронизации();
	УстановитьВидимостьНаСервере();
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ЗаписатьИЗакрыть(Команда)
	
	Если Не ЗаписатьИЗакрытьНаСервере() Тогда
		Возврат;
	КонецЕсли;
	
	ОбменДаннымиКлиент.ФормаНастройкиУзловКомандаЗакрытьФорму(ЭтотОбъект);
	
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьСписокВыбранныхОрганизаций(Команда)
	
	КоллекцияФильтров = Неопределено;
	
	ПараметрыФормы = Новый Структура();
	
	Если ТекущийЭлемент.Имя = "ОткрытьСписокВыбранныхОрганизаций" Тогда
		ПараметрыФормы.Вставить("ИмяЭлементаФормыДляЗаполнения",          "Организации");
		ПараметрыФормы.Вставить("ИмяРеквизитаЭлементаФормыДляЗаполнения", "Представление");
		ПараметрыФормы.Вставить("ПараметрыВнешнегоСоединения",            Неопределено);
	ИначеЕсли ТекущийЭлемент.Имя = "ОткрытьСписокВыбранныхОрганизацийКорреспондента" Тогда
		ПараметрыФормы.Вставить("ИмяЭлементаФормыДляЗаполнения",          "ОрганизацииКорреспондента");
		ПараметрыФормы.Вставить("ИмяРеквизитаЭлементаФормыДляЗаполнения", "УникальныйИдентификаторСсылки");
		ПараметрыФормы.Вставить("ПараметрыВнешнегоСоединения",            ПараметрыСоединения);
	Иначе
		Возврат;
	КонецЕсли;
	
	ПараметрыФормы.Вставить("КоллекцияФильтров",                      КоллекцияФильтров);
	ПараметрыФормы.Вставить("ИмяТаблицыВыбора",                       "Справочник._ДемоОрганизации");
	ПараметрыФормы.Вставить("ЗаголовокФормыВыбора",                   НСтр("ru = 'Выберите организации для отбора:'"));
	ПараметрыФормы.Вставить("МассивВыбранныхЗначений",                СформироватьМассивВыбранныхЗначений(ПараметрыФормы));
	
	ОткрытьФорму("ОбщаяФорма._ДемоФормаВыбораДополнительныхУсловий",
		ПараметрыФормы,
		ЭтотОбъект);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ПолучитьОписаниеКонтекста()
	
	// Дата начала выгрузки документов.
	Если ЗначениеЗаполнено(ДатаНачалаВыгрузкиДокументов) Тогда
		ДатаНачалаВыгрузкиДокументовОписание = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
			НСтр("ru = 'Документы будут синхронизироваться, начиная с %1'"),
			Формат(ДатаНачалаВыгрузкиДокументов, "ДЛФ=DD"));
	Иначе
		ДатаНачалаВыгрузкиДокументовОписание = НСтр("ru = 'Данные будут синхронизироваться за весь период ведения учета'");
	КонецЕсли;
	
	Если Не ИспользоватьОтборПоОрганизациям И Не ИспользоватьОтборПоОрганизациямКорреспондента Тогда
		
		ОрганизацииОписание = НСтр("ru = 'Данные будут синхронизироваться по всем организациям.'");
		
	Иначе
		
		// Отбор по Организациям этой программы.
		Если ИспользоватьОтборПоОрганизациям Тогда
			ОрганизацииЭтойПрограммыОписание = НСтр("ru = 'Из этой программы данные будут отправляться только по организациям:'") + Символы.ПС + ИспользуемыеЭлементы("Организации");
		Иначе
			ОрганизацииЭтойПрограммыОписание = НСтр("ru = 'Из этой программы данные будут отправляться по всем организациям.'");
		КонецЕсли;
		
		// Отбор по Организациям корреспондента.
		Если ИспользоватьОтборПоОрганизациямКорреспондента Тогда
			ОрганизацииКорреспондентаОписание = НСтр("ru = 'Из другой программы данные будут отправляться только по организациям:'") + Символы.ПС + ИспользуемыеЭлементы("ОрганизацииКорреспондента");
		Иначе
			ОрганизацииКорреспондентаОписание = НСтр("ru = 'Из другой программы данные будут отправляться по всем организациям.'");
		КонецЕсли;
		
		ОрганизацииОписание = ОрганизацииЭтойПрограммыОписание + Символы.ПС + ОрганизацииКорреспондентаОписание;
		
	КонецЕсли;
	
	
	ЭтотОбъект.ОписаниеКонтекста = (""
		+ НСтр("ru = 'Через универсальный формат обмена EnterpriseData'")
		+ Символы.ПС
		+ ДатаНачалаВыгрузкиДокументовОписание
		+ Символы.ПС
		+ ОрганизацииОписание);
		
КонецПроцедуры

&НаСервере
Процедура УстановитьВидимостьНаСервере()
	
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы,
		"ДатаНачалаВыгрузкиДокументов",
		"Доступность",
		ПравилаОтправкиДокументов = "АвтоматическаяСинхронизация");
		
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы,
		"ПереключательДокументыНеОтправлять",
		"Доступность",
		ПравилаОтправкиСправочников <> "СинхронизироватьПоНеобходимости");
		
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы,
		"ОписаниеДокументыНеОтправлять",
		"Доступность",
		ПравилаОтправкиСправочников <> "СинхронизироватьПоНеобходимости");
		
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы.ГруппаДокументы.ПодчиненныеЭлементы,
		"ГруппаРежимОтправкиДокументов",
		"Доступность",
		ПравилаОтправкиСправочников <> "НеСинхронизировать");
		
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы,
		"ГруппаНастройкаДополнительныхОтборов",
		"Видимость",
		ПравилаОтправкиСправочников <> "НеСинхронизировать" И ПолучитьФункциональнуюОпцию("_ДемоИспользоватьНесколькоОрганизаций"));
		
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы,
		"ОткрытьСписокВыбранныхОрганизаций",
		"Доступность",
		ИспользоватьОтборПоОрганизациям);
		
// Видимость корреспондента
	
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы,
		"ДатаНачалаВыгрузкиДокументовКорреспондента",
		"Доступность",
		ПравилаОтправкиДокументовКорреспондента = "АвтоматическаяСинхронизация");
		
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы,
		"ПереключательДокументыНеОтправлятьКорреспондента",
		"Доступность",
		ПравилаОтправкиСправочниковКорреспондента <> "СинхронизироватьПоНеобходимости");
		
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы,
		"ОписаниеДокументыНеОтправлятьКорреспондента",
		"Доступность",
		ПравилаОтправкиСправочниковКорреспондента <> "СинхронизироватьПоНеобходимости");
		
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы.ГруппаДокументы.ПодчиненныеЭлементы,
		"ГруппаРежимОтправкиДокументовКорреспондента",
		"Доступность",
		ПравилаОтправкиСправочниковКорреспондента <> "НеСинхронизировать");
		
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы,
		"ГруппаНастройкаДополнительныхОтборовКорреспондента",
		"Видимость",
		ПравилаОтправкиСправочниковКорреспондента <> "НеСинхронизировать");
		
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(
		Элементы,
		"ОткрытьСписокВыбранныхОрганизацийКорреспондента",
		"Доступность",
		ИспользоватьОтборПоОрганизациямКорреспондента);
	
КонецПроцедуры

&НаСервере
Процедура ОбновитьДанныеОбъекта(СтруктураПараметров)
	
	ЭтотОбъект[СтруктураПараметров.ИмяТаблицыДляЗаполнения].Очистить();
	
	СписокВыбранныхЗначений = ПолучитьИзВременногоХранилища(СтруктураПараметров.АдресТаблицыВоВременномХранилище);
	
	Если СписокВыбранныхЗначений.Количество() > 0 Тогда
		СписокВыбранныхЗначений.Колонки.Идентификатор.Имя = "УникальныйИдентификаторСсылки";
		СписокВыбранныхЗначений.Колонки.Добавить("Использовать");
		СписокВыбранныхЗначений.ЗаполнитьЗначения( Истина, "Использовать");
		ЭтотОбъект[СтруктураПараметров.ИмяТаблицыДляЗаполнения].Загрузить(СписокВыбранныхЗначений);
	КонецЕсли;
	
	ОбновитьНаименованиеКомандФормы();
	
КонецПроцедуры

&НаСервере
Процедура ОбновитьНаименованиеКомандФормы()
	
	// Обновим заголовок выбранных организаций.
	Если Организации.Количество() > 0 Тогда
		
		ВыбранныеОрганизации = Организации.Выгрузить().ВыгрузитьКолонку("Представление");
		НовыйЗаголовокОрганизаций = СтрСоединить(ВыбранныеОрганизации, ",");
		
	Иначе
		
		НовыйЗаголовокОрганизаций = НСтр("ru = 'Выбрать организации'");
		
	КонецЕсли;
	
	Элементы.ОткрытьСписокВыбранныхОрганизаций.Заголовок = НовыйЗаголовокОрганизаций;
	
	// Обновим заголовок выбранных организаций.
	Если ОрганизацииКорреспондента.Количество() > 0 Тогда
		
		ВыбранныеОрганизации = ОрганизацииКорреспондента.Выгрузить().ВыгрузитьКолонку("Представление");
		НовыйЗаголовокОрганизаций = СтрСоединить(ВыбранныеОрганизации, ",");
		
	Иначе
		
		НовыйЗаголовокОрганизаций = НСтр("ru = 'Выбрать организации'");
		
	КонецЕсли;
	
	Элементы.ОткрытьСписокВыбранныхОрганизацийКорреспондента.Заголовок = НовыйЗаголовокОрганизаций;
	
КонецПроцедуры

&НаСервере
Функция СформироватьМассивВыбранныхЗначений(ПараметрыФормы)
	
	ТабличнаяЧасть           = ЭтотОбъект[ПараметрыФормы.ИмяЭлементаФормыДляЗаполнения];
	ТаблицаВыбранныхЗначений = ТабличнаяЧасть.Выгрузить(,ПараметрыФормы.ИмяРеквизитаЭлементаФормыДляЗаполнения);
	МассивВыбранныхЗначений  = ТаблицаВыбранныхЗначений.ВыгрузитьКолонку(ПараметрыФормы.ИмяРеквизитаЭлементаФормыДляЗаполнения);
	
	Возврат МассивВыбранныхЗначений;
	
КонецФункции

&НаКлиенте
Процедура УсловияОграниченияСинхронизации()
	ИспользоватьОтборПоОрганизациям               = ПравилоОтбораСправочников = "СинхронизироватьДанныеТолькоПоВыбраннымОрганизациям";
	ИспользоватьОтборПоОрганизациямКорреспондента = ПравилоОтбораСправочниковКорреспондента = "СинхронизироватьДанныеТолькоПоВыбраннымОрганизациям";
КонецПроцедуры

&НаСервере
Функция СтруктураСоответствияНастройкиОтборовРеквизитамФормы()
	
	СтруктураНастроек = Новый Структура;
	СтруктураНастроек.Вставить("ВерсияФорматаОбмена",             "ВерсияФорматаОбмена");
	СтруктураНастроек.Вставить("ДатаНачалаВыгрузкиДокументов",    "ДатаНачалаВыгрузкиДокументов");
	СтруктураНастроек.Вставить("ИспользоватьОтборПоОрганизациям", "ИспользоватьОтборПоОрганизациям");
	СтруктураНастроек.Вставить("Организации",                     "Организации");
	СтруктураНастроек.Вставить("ПравилаОтправкиДокументов",       "ПравилаОтправкиДокументов");
	СтруктураНастроек.Вставить("ПравилаОтправкиСправочников",     "ПравилаОтправкиСправочников");
	СтруктураНастроек.Вставить("РежимВыгрузкиДокументов",         "РежимВыгрузкиДокументов");
	СтруктураНастроек.Вставить("РежимВыгрузкиПриНеобходимости",   "РежимВыгрузкиПриНеобходимости");
	СтруктураНастроек.Вставить("РежимВыгрузкиСправочников",       "РежимВыгрузкиСправочников");
	
	Возврат СтруктураНастроек;
	
КонецФункции

&НаСервере
Функция СтруктураСоответствияНастройкиОтборовКорреспондентаРеквизитамФормы()
	
	СтруктураНастроек = Новый Структура;
	СтруктураНастроек.Вставить("ВерсияФорматаОбмена",             "ВерсияФорматаОбменаКорреспондента");
	СтруктураНастроек.Вставить("ДатаНачалаВыгрузкиДокументов",    "ДатаНачалаВыгрузкиДокументовКорреспондента");
	СтруктураНастроек.Вставить("ИспользоватьОтборПоОрганизациям", "ИспользоватьОтборПоОрганизациямКорреспондента");
	СтруктураНастроек.Вставить("Организации",                     "ОрганизацииКорреспондента");
	СтруктураНастроек.Вставить("ПравилаОтправкиДокументов",       "ПравилаОтправкиДокументовКорреспондента");
	СтруктураНастроек.Вставить("ПравилаОтправкиСправочников",     "ПравилаОтправкиСправочниковКорреспондента");
	СтруктураНастроек.Вставить("РежимВыгрузкиДокументов",         "РежимВыгрузкиДокументовКорреспондента");
	СтруктураНастроек.Вставить("РежимВыгрузкиПриНеобходимости",   "РежимВыгрузкиПриНеобходимостиКорреспондента");
	СтруктураНастроек.Вставить("РежимВыгрузкиСправочников",       "РежимВыгрузкиСправочниковКорреспондента");
	
	Возврат СтруктураНастроек;
	
КонецФункции

&НаСервере
Функция ИспользуемыеЭлементы(ИмяТаблицы)
	
	Возврат СтрСоединить(ЭтотОбъект[ИмяТаблицы].Выгрузить(Новый Структура(
		"Использовать", Истина)).ВыгрузитьКолонку("Представление"), ", ");
	
КонецФункции

&НаСервере
Функция ЗаписатьИЗакрытьНаСервере()
	
	Если Не ПроверитьЗаполнение() Тогда
		Возврат Ложь;
	КонецЕсли;
	
	РежимВыгрузкиПриНеобходимости = Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьПриНеобходимости;
		
	Если ПравилаОтправкиСправочников = "НеСинхронизировать" Тогда
		ИспользоватьОтборПоОрганизациям = Ложь;
		РежимВыгрузкиСправочников = Перечисления.РежимыВыгрузкиОбъектовОбмена.НеВыгружать;
		РежимВыгрузкиДокументов = Перечисления.РежимыВыгрузкиОбъектовОбмена.НеВыгружать;
	Иначе
		Если ПравилаОтправкиСправочников = "СинхронизироватьПоНеобходимости" Тогда
			РежимВыгрузкиСправочников = Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьПриНеобходимости;
		Иначе
			РежимВыгрузкиСправочников = Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьПоУсловию;
		КонецЕсли;
		Если ПравилаОтправкиДокументов = "АвтоматическаяСинхронизация" Тогда
			РежимВыгрузкиДокументов = Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьПоУсловию;
		ИначеЕсли ПравилаОтправкиДокументов = "ИнтерактивнаяСинхронизация" Тогда
			РежимВыгрузкиДокументов = Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьВручную;
		Иначе
			РежимВыгрузкиДокументов = Перечисления.РежимыВыгрузкиОбъектовОбмена.НеВыгружать;
		КонецЕсли;
	КонецЕсли;
	
	РежимВыгрузкиПриНеобходимостиКорреспондента = Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьПриНеобходимости;
		
	Если ПравилаОтправкиСправочниковКорреспондента = "НеСинхронизировать" Тогда
		ИспользоватьОтборПоОрганизациямКорреспондента = Ложь;
		РежимВыгрузкиСправочниковКорреспондента = Перечисления.РежимыВыгрузкиОбъектовОбмена.НеВыгружать;
		РежимВыгрузкиДокументовКорреспондента = Перечисления.РежимыВыгрузкиОбъектовОбмена.НеВыгружать;
	Иначе
		Если ПравилаОтправкиСправочниковКорреспондента = "СинхронизироватьПоНеобходимости" Тогда
			РежимВыгрузкиСправочниковКорреспондента = Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьПриНеобходимости;
		Иначе
			РежимВыгрузкиСправочниковКорреспондента = Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьПоУсловию;
		КонецЕсли;
		Если ПравилаОтправкиДокументовКорреспондента = "АвтоматическаяСинхронизация" Тогда
			РежимВыгрузкиДокументовКорреспондента = Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьПоУсловию;
		ИначеЕсли ПравилаОтправкиДокументовКорреспондента = "ИнтерактивнаяСинхронизация" Тогда
			РежимВыгрузкиДокументовКорреспондента = Перечисления.РежимыВыгрузкиОбъектовОбмена.ВыгружатьВручную;
		Иначе
			РежимВыгрузкиДокументовКорреспондента = Перечисления.РежимыВыгрузкиОбъектовОбмена.НеВыгружать;
		КонецЕсли;
	КонецЕсли;
	
	Если Не ИспользоватьОтборПоОрганизациям И Организации.Количество() <> 0 Тогда
		Организации.Очистить();
	ИначеЕсли Организации.Количество() = 0 И ИспользоватьОтборПоОрганизациям Тогда
		ИспользоватьОтборПоОрганизациям = Ложь;
	КонецЕсли;
	
	Если Не ИспользоватьОтборПоОрганизациямКорреспондента И ОрганизацииКорреспондента.Количество() <> 0 Тогда
		ОрганизацииКорреспондента.Очистить();
	ИначеЕсли ОрганизацииКорреспондента.Количество() = 0 И ИспользоватьОтборПоОрганизациямКорреспондента Тогда
		ИспользоватьОтборПоОрганизациямКорреспондента = Ложь;
	КонецЕсли;
	
	Если ПравилаОтправкиДокументов <> "АвтоматическаяСинхронизация" Тогда
		ДатаНачалаВыгрузкиДокументов = Дата(1,1,1,0,0,0);
	КонецЕсли;
	
	Если ПравилаОтправкиДокументовКорреспондента <> "АвтоматическаяСинхронизация" Тогда
		ДатаНачалаВыгрузкиДокументовКорреспондента = Дата(1,1,1,0,0,0);
	КонецЕсли;
	
	ПолучитьОписаниеКонтекста();
	
	Возврат Истина;
	
КонецФункции

#КонецОбласти
