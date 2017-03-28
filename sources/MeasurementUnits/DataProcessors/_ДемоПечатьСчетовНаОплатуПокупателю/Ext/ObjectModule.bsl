﻿#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

// Возвращает сведения о внешней обработке.
Функция СведенияОВнешнейОбработке() Экспорт
	ПараметрыРегистрации = ДополнительныеОтчетыИОбработки.СведенияОВнешнейОбработке("2.3.1.73");
	ПараметрыРегистрации.Информация = НСтр("ru = 'Обработка формирования печатной формы документа ""Демо: Счет на оплату покупателю"". Используется для демонстрации возможностей подсистемы ""Дополнительные отчеты и обработки"".'");
	ПараметрыРегистрации.Вид = ДополнительныеОтчетыИОбработкиКлиентСервер.ВидОбработкиПечатнаяФорма();
	ПараметрыРегистрации.Версия = "2.3.3.42";
	ПараметрыРегистрации.Назначение.Добавить("Документ._ДемоСчетНаОплатуПокупателю");
	
	Команда = ПараметрыРегистрации.Команды.Добавить();
	Команда.Представление = НСтр("ru = 'Счет на оплату (внешняя печатная форма)'");
	Команда.Идентификатор = "Счет";
	Команда.Использование = ДополнительныеОтчетыИОбработкиКлиентСервер.ТипКомандыВызовСерверногоМетода();
	Команда.ПоказыватьОповещение = Истина;
	Команда.Модификатор = "ПечатьMXL";
	Команда.ЗаменяемыеКоманды = "Счет,Квитанция";
	
	Команда = ПараметрыРегистрации.Команды.Добавить();
	Команда.Представление = НСтр("ru = 'Комплект документов (внешняя печатная форма)'");
	Команда.Идентификатор = "Счет,Счет,Заказ";
	Команда.Использование = ДополнительныеОтчетыИОбработкиКлиентСервер.ТипКомандыВызовСерверногоМетода();
	Команда.ПоказыватьОповещение = Истина;
	Команда.Модификатор = "ПечатьMXL";
	
	Команда = ПараметрыРегистрации.Команды.Добавить();
	Команда.Представление = НСтр("ru = 'Гарантийное письмо (внешняя печатная форма)'");
	Команда.Идентификатор = "ГарантийноеПисьмо";
	Команда.Использование = ДополнительныеОтчетыИОбработкиКлиентСервер.ТипКомандыВызовСерверногоМетода();
	Команда.ПоказыватьОповещение = Истина;
	Команда.Модификатор = "ПечатьMXL";
	
	Возврат ПараметрыРегистрации;
КонецФункции

// Интерфейс для выполнения команд обработки.
Процедура Печать(МассивОбъектов, КоллекцияПечатныхФорм, ОбъектыПечати, ПараметрыВывода) Экспорт
	
	ПечатнаяФорма = УправлениеПечатью.СведенияОПечатнойФорме(КоллекцияПечатныхФорм, "Счет");
	Если ПечатнаяФорма <> Неопределено Тогда
		ПечатнаяФорма.ТабличныйДокумент = Документы._ДемоСчетНаОплатуПокупателю.ПечатьСчетаЗаказа(МассивОбъектов, ОбъектыПечати, "Счет");
		ПечатнаяФорма.СинонимМакета = НСтр("ru = 'Счет на оплату (внешняя печатная форма)'");
		ПечатнаяФорма.ПолныйПутьКМакету = "Документ._ДемоСчетНаОплатуПокупателю.ПФ_MXL_СчетЗаказ";
	КонецЕсли;
	
	ПечатнаяФорма = УправлениеПечатью.СведенияОПечатнойФорме(КоллекцияПечатныхФорм, "Заказ");
	Если ПечатнаяФорма <> Неопределено Тогда
		ПечатнаяФорма.ТабличныйДокумент = Документы._ДемоСчетНаОплатуПокупателю.ПечатьСчетаЗаказа(МассивОбъектов, ОбъектыПечати, "Заказ");
		ПечатнаяФорма.СинонимМакета = НСтр("ru = 'Заказ покупателя (внешняя печатная форма)'");
		ПечатнаяФорма.ПолныйПутьКМакету = "Документ._ДемоСчетНаОплатуПокупателю.ПФ_MXL_СчетЗаказ";
	КонецЕсли;
	
	ПечатнаяФорма = УправлениеПечатью.СведенияОПечатнойФорме(КоллекцияПечатныхФорм, "ГарантийноеПисьмо");
	Если ПечатнаяФорма <> Неопределено Тогда
		ПечатнаяФорма.ТабличныйДокумент = Документы._ДемоСчетНаОплатуПокупателю.ПечатьГарантийногоПисьма(МассивОбъектов, ОбъектыПечати);
		ПечатнаяФорма.СинонимМакета = НСтр("ru = 'Гарантийное письмо (внешняя печатная форма)'");
		ПечатнаяФорма.ПолныйПутьКМакету = "Документ._ДемоСчетНаОплатуПокупателю.ПФ_MXL_ГарантийноеПисьмо";
	КонецЕсли;
	
	Документы._ДемоСчетНаОплатуПокупателю.ЗаполнитьПараметрыОтправки(ПараметрыВывода.ПараметрыОтправки, МассивОбъектов, КоллекцияПечатныхФорм);
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли