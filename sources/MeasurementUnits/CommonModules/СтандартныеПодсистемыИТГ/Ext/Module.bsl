﻿////////////////////////////////////////////////////////////////////////////////
// Подсистема "Стандартные подсистемы ИТГ".
// ОбщийМодуль.СтандартныеПодсистемыИТГ.
//
////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

////////////////////////////////////////////////////////////////////////////////
// Интеграция с Библиотекой стандартных подсистем (БСП).
// Подсистема "Базовая функциональность".

////////////////////////////////////////////////////////////////////////////////
// Обработчики событий подсистемы ЗапретРедактированияРеквизитовОбъектов.

// См. комментарий к одноименной процедуре в общем модуле ЗапретРедактированияРеквизитовОбъектовПереопределяемый.
Процедура ПриОпределенииОбъектовСЗаблокированнымиРеквизитами(Объекты) Экспорт
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// Интерфейс для работы с подсистемой ГрупповоеИзменениеОбъектов.

// Определить объекты метаданных, в модулях менеджеров которых ограничивается возможность 
// редактирования реквизитов при групповом изменении.
//
// Параметры:
//   Объекты - Соответствие - в качестве ключа указать полное имя объекта метаданных,
//                            подключенного к подсистеме "Групповое изменение объектов". 
//                            Дополнительно в значении могут быть перечислены имена экспортных функций:
//                            "РеквизитыНеРедактируемыеВГрупповойОбработке",
//                            "РеквизитыРедактируемыеВГрупповойОбработке".
//                            Каждое имя должно начинаться с новой строки.
//                            Если указано "*", значит в модуле менеджера определены обе функции.
//
// Пример: 
//   Объекты.Вставить(Метаданные.Документы.ЗаказПокупателя.ПолноеИмя(), "*"); // определены обе функции.
//   Объекты.Вставить(Метаданные.БизнесПроцессы.ЗаданиеСРолевойАдресацией.ПолноеИмя(), "РеквизитыРедактируемыеВГрупповойОбработке");
//   Объекты.Вставить(Метаданные.Справочники.Партнеры.ПолноеИмя(), "РеквизитыРедактируемыеВГрупповойОбработке
//		|РеквизитыНеРедактируемыеВГрупповойОбработке");
//
Процедура ПриОпределенииОбъектовСРедактируемымиРеквизитами(Объекты) Экспорт
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Возвращает идентификатор подсистемы в в справочнике объектов
// метаданных.
//
Функция ИдентификаторПодсистемы() Экспорт
	
	Возврат ОбщегоНазначения.ИдентификаторОбъектаМетаданных(
		"Подсистема.СтандартныеПодсистемыИТГ");
	
КонецФункции

// Заполняет массив типов неразделенных данных, для которых поддерживается сопоставление ссылок
// при загрузке данных в другую информационную базу.
//
// Параметры:
//  Типы - Массив(ОбъектМетаданных).
//
Процедура ПриЗаполненииТиповОбщихДанныхПоддерживающихСопоставлениеСсылокПриЗагрузке(Типы) Экспорт
	
КонецПроцедуры

// Заполняет массив типов, исключаемых из выгрузки и загрузки данных.
//
// Параметры:
//  Типы - Массив - заполняется метаданными.
//
Процедура ПриЗаполненииТиповИсключаемыхИзВыгрузкиЗагрузки(Типы) Экспорт
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// Подсистема "Поиск и удаление дублей".

// Определить объекты, в модулях менеджеров которых предусмотрена возможность параметризации 
//   алгоритма поиска дублей с помощью экспортных процедур ПараметрыПоискаДублей, ПриПоискеДублей 
//   и ВозможностьЗаменыЭлементов.
//
// Параметры:
//   Объекты - Соответствие - Объекты, в модулях менеджеров которых размещены экспортные процедуры.
//       ** Ключ     - Строка - Полное имя объекта метаданных, подключенного к подсистеме "Поиск и удаление дублей".
//       ** Значение - Строка - Имена экспортных процедур, определенных в модуле менеджера.
//           Могут быть перечислены:
//           "ПараметрыПоискаДублей",
//           "ПриПоискеДублей",
//           "ВозможностьЗаменыЭлементов".
//           Каждое имя должно начинаться с новой строки.
//           Если указана пустая строка, значит в модуле менеджера определены все процедуры.
//
// Примеры:
//
//  1. Определены все процедуры.
//	Объекты.Вставить(Метаданные.Документы.ЗаказПокупателя.ПолноеИмя(), "");
//
//  2. Определены процедуры ПараметрыПоискаДублей и ПриПоискеДублей.
//	Объекты.Вставить(Метаданные.БизнесПроцессы.ЗаданиеСРолевойАдресацией.ПолноеИмя(), "ПараметрыПоискаДублей
//		|ПриПоискеДублей");
//
Процедура ПриОпределенииОбъектовСПоискомДублей(Объекты) Экспорт
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытий

#КонецОбласти