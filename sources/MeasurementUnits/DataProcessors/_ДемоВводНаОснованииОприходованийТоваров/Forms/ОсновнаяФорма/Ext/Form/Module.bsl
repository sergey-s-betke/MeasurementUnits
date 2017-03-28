﻿#Область ПрограммныйИнтерфейс

// Обработчик клиентской назначаемой команды.
//
// Параметры:
//   ИдентификаторКоманды - Строка - Имя команды, как оно задано в функции СведенияОВнешнейОбработке модуля объекта.
//   ОбъектыНазначения - Массив - Ссылки, для которых выполняется команда.
//   СозданныеОбъекты - Массив - Объекты, которые были созданы в процессе выполнения команды.
//
&НаКлиенте
Процедура ВыполнитьКоманду(ИдентификаторКоманды, ОбъектыНазначения, СозданныеОбъекты) Экспорт
	Параметры.ИдентификаторКоманды = ИдентификаторКоманды;
	
	СопровождающийТекст = НСтр("ru = 'Создание списаний товаров'");
	
	ПараметрыКоманды = ДополнительныеОтчетыИОбработкиКлиент.ПараметрыВыполненияКомандыВФоне(Параметры.ДополнительнаяОбработкаСсылка);
	ПараметрыКоманды.ОбъектыНазначения   = ОбъектыНазначения;
	ПараметрыКоманды.СозданныеОбъекты    = СозданныеОбъекты;
	ПараметрыКоманды.СопровождающийТекст = СопровождающийТекст + "...";
	
	Состояние(ПараметрыКоманды.СопровождающийТекст, , , БиблиотекаКартинок.ДлительнаяОперация48);
	Операция = ВыполнитьКомандуНапрямую(ПараметрыКоманды);
	ПослеЗавершенияДлительнойОперации(Операция, СопровождающийТекст);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если Параметры.Свойство("АвтоТест") Тогда // Возврат при получении формы для анализа.
		Возврат;
	КонецЕсли;
	Для Каждого ЭлементОбъектыНазначения Из Параметры.ОбъектыНазначения Цикл
		ОбъектыНазначения.Добавить(ЭлементОбъектыНазначения);
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаВыбора(ВыбранноеЗначение, ИсточникВыбора)
	Если ИсточникВыбора.ИмяФормы = ДополнительныеОтчетыИОбработкиКлиент.ИмяФормыДлительнойОперации() Тогда
		ВызватьИсключение ЗначениеВСтрокуXML(ВыбранноеЗначение);
		ПрочитатьИЗакрыть();
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура СоздатьПеремещения(Команда)
	ВыполнитьКомандуВФоне(НСтр("ru = 'Создание документов'"));
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ВыполнитьКомандуВФоне(СопровождающийТекст)
	ПараметрыКоманды = ДополнительныеОтчетыИОбработкиКлиент.ПараметрыВыполненияКомандыВФоне(Параметры.ДополнительнаяОбработкаСсылка);
	ПараметрыКоманды.ОбъектыНазначения = ОбъектыНазначения.ВыгрузитьЗначения();
	ПараметрыКоманды.СозданныеОбъекты = Новый Массив;
	ПараметрыКоманды.СопровождающийТекст = СопровождающийТекст + "...";
	ПараметрыКоманды.Вставить("МестоХраненияПриемник", МестоХраненияПриемник);
	
	Обработчик = Новый ОписаниеОповещения("ПослеЗавершенияДлительнойОперации", ЭтотОбъект, СопровождающийТекст);
	Если ЗначениеЗаполнено(Параметры.ДополнительнаяОбработкаСсылка) Тогда // Обработка подключена.
		ДополнительныеОтчетыИОбработкиКлиент.ВыполнитьКомандуВФоне(Параметры.ИдентификаторКоманды, ПараметрыКоманды, Обработчик);
	Иначе
		Состояние(ПараметрыКоманды.СопровождающийТекст, , , БиблиотекаКартинок.ДлительнаяОперация48);
		Операция = ВыполнитьКомандуНапрямую(ПараметрыКоманды);
		ВыполнитьОбработкуОповещения(Обработчик, Операция);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Функция ВыполнитьКомандуНапрямую(ПараметрыКоманды)
	Операция = Новый Структура("Статус, КраткоеПредставлениеОшибки, ПодробноеПредставлениеОшибки");
	Попытка
		ДополнительныеОтчетыИОбработки.ВыполнитьКомандуИзФормыВнешнегоОбъекта(Параметры.ИдентификаторКоманды, ПараметрыКоманды, ЭтотОбъект);
		Операция.Статус = "Выполнено";
	Исключение
		Операция.КраткоеПредставлениеОшибки   = КраткоеПредставлениеОшибки(ИнформацияОбОшибке());
		Операция.ПодробноеПредставлениеОшибки = ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
	КонецПопытки;
	Возврат Операция;
КонецФункции

&НаКлиенте
Процедура ПослеЗавершенияДлительнойОперации(Операция, СопровождающийТекст) Экспорт
	ПрочитатьИЗакрыть();
	Если Операция.Статус = "Выполнено" Тогда
		ПоказатьОповещениеПользователя(НСтр("ru = 'Успешное завершение'"), , СопровождающийТекст, БиблиотекаКартинок.Успешно32);
	Иначе
		Предупреждение = Новый Структура;
		Предупреждение.Вставить("Текст",    Операция.КраткоеПредставлениеОшибки);
		Предупреждение.Вставить("Подробно", Операция.ПодробноеПредставлениеОшибки);
		СтандартныеПодсистемыКлиент.ВывестиПредупреждение(ВладелецФормы, Предупреждение);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПрочитатьИЗакрыть()
	Если ТипЗнч(ВладелецФормы) = Тип("УправляемаяФорма") И Не ВладелецФормы.Модифицированность Тогда
		Попытка
			ВладелецФормы.Прочитать();
		Исключение
			// Значит это форма списка.
		КонецПопытки;
	КонецЕсли;
	Если Открыта() Тогда
		Закрыть();
	КонецЕсли;
КонецПроцедуры

&НаСервереБезКонтекста
Функция ЗначениеВСтрокуXML(Значение)
	Возврат ОбщегоНазначения.ЗначениеВСтрокуXML(Значение);
КонецФункции

#КонецОбласти
