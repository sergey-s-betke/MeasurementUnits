﻿////////////////////////////////////////////////////////////////////////////////
// Обновление информационной базы конфигурации.
// Метрологическая служба. Подсистема единиц величин.
// ОбщийМодуль.ОбновлениеИнформационнойБазыМСЕдиницыВеличин.
//
////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

////////////////////////////////////////////////////////////////////////////////
// Сведения о библиотеке (или конфигурации).

// См. описание в общем модуле ОбновлениеИнформационнойБазыБСП.
Процедура ПриДобавленииПодсистемы(Описание) Экспорт

	Описание.Имя    = "МетрологическаяСлужба.ЕдиницыВеличин";
	Описание.Версия = МСЕдиницыВеличинКлиентСервер.ВерсияБиблиотеки();
	Описание.РежимВыполненияОтложенныхОбработчиков = "Последовательно";

	// Требуется библиотека стандартных подсистем.
	Описание.ТребуемыеПодсистемы.Добавить("СтандартныеПодсистемы");

КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// Обработчики обновления информационной базы.

// Возвращает список процедур-обработчиков обновления ИБ для всех поддерживаемых версий ИБ.
//
// Пример добавления процедуры-обработчика в список:
//    Обработчик = Обработчики.Добавить();
//    Обработчик.Версия = "1.0.0.0";
//    Обработчик.Процедура = "ОбновлениеИБ.ПерейтиНаВерсию_1_0_0_0";
//
// Вызывается перед началом обновления данных ИБ.
//
Процедура ПриДобавленииОбработчиковОбновления(Обработчики) Экспорт
	
	Обработчик = Обработчики.Добавить();
	Обработчик.Процедура =
		"МСЕдиницыВеличинОбновлениеИнформационнойБазы.НачальноеЗаполнение";
	Обработчик.ОбщиеДанные 		   = Истина;
	Обработчик.НачальноеЗаполнение = Истина;
	Обработчик.РежимВыполнения     = "Монопольно";
	
	Обработчик = Обработчики.Добавить();
	Обработчик.Версия    = "1.0.2.19";
	Обработчик.Процедура =
		"МСЕдиницыВеличинОбновлениеИнформационнойБазы.ЗаполнитьПриставкиЕдиницВеличин";
	Обработчик.ОбщиеДанные 		   = Истина;
	Обработчик.РежимВыполнения     = "Монопольно";
	
	Обработчик = Обработчики.Добавить();
	Обработчик.Версия    = "1.0.1.15";
	Обработчик.Процедура =
		"МСЕдиницыВеличинОбновлениеИнформационнойБазы.ЗаполнитьКонстантуМСЕдиницыВеличинОбозначения";
	Обработчик.РежимВыполнения     = "Монопольно";
	
	Обработчик = Обработчики.Добавить();
	Обработчик.Версия    = "1.0.2.20";
	Обработчик.Процедура =
		"МСЕдиницыВеличинОбновлениеИнформационнойБазы.ПерейтиНаВерсию_1_0_2_20";
	Обработчик.РежимВыполнения     = "Монопольно";
	
КонецПроцедуры

// Вызывается перед обработчиками обновления данных ИБ.
//
Процедура ПередОбновлениемИнформационнойБазы() Экспорт
	
	
	
КонецПроцедуры

// Вызывается после завершении обновления данных ИБ.
//
// Параметры:
//   ПредыдущаяВерсияИБ     - Строка - версия ИБ до обновления. "0.0.0.0" для "пустой" ИБ.
//   ТекущаяВерсияИБ        - Строка - версия ИБ после обновления.
//   ВыполненныеОбработчики - ДеревоЗначений - список выполненных процедур-обработчиков
//                                             обновления, сгруппированных по номеру версии.
//  Итерирование по выполненным обработчикам:
//		Для Каждого Версия Из ВыполненныеОбработчики.Строки Цикл
//
//			Если Версия.Версия = "*" Тогда
//				группа обработчиков, которые выполняются всегда
//			Иначе
//				группа обработчиков, которые выполняются для определенной версии
//			КонецЕсли;
//
//			Для Каждого Обработчик Из Версия.Строки Цикл
//				...
//			КонецЦикла;
//
//		КонецЦикла;
//
//   ВыводитьОписаниеОбновлений - Булево -	если Истина, то выводить форму с описанием
//											обновлений.
//   МонопольныйРежим           - Булево - признак выполнения обновления в монопольном режиме.
//                                Истина - обновление выполнялось в монопольном режиме.
//
Процедура ПослеОбновленияИнформационнойБазы(Знач ПредыдущаяВерсияИБ, Знач ТекущаяВерсияИБ,
		Знач ВыполненныеОбработчики, ВыводитьОписаниеОбновлений, МонопольныйРежим) Экспорт
	
	
	
КонецПроцедуры

// Вызывается при подготовке табличного документа с описанием изменений системы.
//
// Параметры:
//   Макет - ТабличныйДокумент - описание обновлений.
//
// См. также общий макет ОписаниеИзмененийСистемы.
//
Процедура ПриПодготовкеМакетаОписанияОбновлений(Знач Макет) Экспорт
	
	
	
КонецПроцедуры

// Позволяет переопределить режим обновления данных информационной базы.
// Для использования в редких (нештатных) случаях перехода, не предусмотренных в
// стандартной процедуре определения режима обновления.
//
// Параметры:
//   РежимОбновленияДанных - Строка - в обработчике можно присвоить одно из значений:
//              "НачальноеЗаполнение"     - если это первый запуск пустой базы (области данных);
//              "ОбновлениеВерсии"        - если выполняется первый запуск после обновление конфигурации базы данных;
//              "ПереходСДругойПрограммы" - если выполняется первый запуск после обновление конфигурации базы данных, 
//                                          в которой изменилось имя основной конфигурации.
//
//   СтандартнаяОбработка  - Булево - если присвоить Ложь, то стандартная процедура
//                                    определения режима обновления не выполняется, 
//                                    а используется значение РежимОбновленияДанных.
//
Процедура ПриОпределенииРежимаОбновленияДанных(РежимОбновленияДанных, СтандартнаяОбработка) Экспорт
	
	
	
КонецПроцедуры

// Добавляет в список процедуры-обработчики перехода с другой программы (с другим именем конфигурации).
// Например, для перехода между разными, но родственными конфигурациями: базовая -> проф -> корп.
// Вызывается перед началом обновления данных ИБ.
//
// Параметры:
//  Обработчики - ТаблицаЗначений - с колонками:
//    * ПредыдущееИмяКонфигурации - Строка - имя конфигурации, с которой выполняется переход;
//                                           или "*", если нужно выполнять при переходе с любой конфигурации.
//    * Процедура                 - Строка - полное имя процедуры-обработчика перехода с программы ПредыдущееИмяКонфигурации. 
//                                  Например, "ОбновлениеИнформационнойБазыУПП.ЗаполнитьУчетнуюПолитику"
//                                  Обязательно должна быть экспортной.
//
// Пример добавления процедуры-обработчика в список:
//  Обработчик = Обработчики.Добавить();
//  Обработчик.ПредыдущееИмяКонфигурации  = "УправлениеТорговлей";
//  Обработчик.Процедура                  = "ОбновлениеИнформационнойБазыУПП.ЗаполнитьУчетнуюПолитику";
//
Процедура ПриДобавленииОбработчиковПереходаСДругойПрограммы(Обработчики) Экспорт
	
	
	
КонецПроцедуры

// Вызывается после выполнения всех процедур-обработчиков перехода с другой программы (с другим именем конфигурации),
// и до начала выполнения обновления данных ИБ.
//
// Параметры:
//  ПредыдущееИмяКонфигурации    - Строка - имя конфигурации до перехода.
//  ПредыдущаяВерсияКонфигурации - Строка - имя предыдущей конфигурации (до перехода).
//  Параметры                    - Структура - 
//    * ВыполнитьОбновлениеСВерсии   - Булево - по умолчанию Истина. Если установить Ложь, 
//        то будут выполнена только обязательные обработчики обновления (с версией "*").
//    * ВерсияКонфигурации           - Строка - номер версии после перехода. 
//        По умолчанию, равен значению версии конфигурации в свойствах метаданных.
//        Для того чтобы выполнить, например, все обработчики обновления с версии ПредыдущаяВерсияКонфигурации, 
//        следует установить значение параметра в ПредыдущаяВерсияКонфигурации.
//        Для того чтобы выполнить вообще все обработчики обновления, установить значение "0.0.0.1".
//    * ОчиститьСведенияОПредыдущейКонфигурации - Булево - по умолчанию Истина. 
//        Для случаев когда предыдущая конфигурация совпадает по имени с подсистемой текущей конфигурации, следует указать Ложь.
//
Процедура ПриЗавершенииПереходаСДругойПрограммы(Знач ПредыдущееИмяКонфигурации, 
	Знач ПредыдущаяВерсияКонфигурации, Параметры) Экспорт
	
	
	
КонецПроцедуры

#КонецОбласти


#Область ОбработчикиОбновления

Процедура НачальноеЗаполнение() Экспорт
	
	ЗаполнитьКонстантуМСЕдиницыВеличинОбозначения();
	ЗаполнитьПриставкиЕдиницВеличин();

КонецПроцедуры

Процедура ЗаполнитьПриставкиЕдиницВеличин() Экспорт
	
	Перем Приставки;
	Приставки = Справочники.МСЕдиницыВеличинПриставкиКратныхИДольных;
	
	Приставки.ЗаполнитьПредопределённый(10,  24, "иотта", "иотта", "И",  "yotta", "Y");
	Приставки.ЗаполнитьПредопределённый(10,  21, "зетта", "зетта", "З",  "zetta", "Z");
	Приставки.ЗаполнитьПредопределённый(10,  18, "экса",  "экса",  "Э",  "exa",   "E");
	Приставки.ЗаполнитьПредопределённый(10,  15, "пета",  "пета",  "П",  "peta",  "P");
	Приставки.ЗаполнитьПредопределённый(10,  12, "тера",  "тера",  "Т",  "tera",  "T");
	Приставки.ЗаполнитьПредопределённый(10,   9, "гига",  "гига",  "Г",  "giga",  "G");
	Приставки.ЗаполнитьПредопределённый(10,   6, "мега",  "мега",  "М",  "mega",  "M");
	Приставки.ЗаполнитьПредопределённый(10,   3, "кило",  "кило",  "к",  "kilo",  "k");
	Приставки.ЗаполнитьПредопределённый(10,   2, "гекто", "гекто", "г",  "hecto", "h");
	Приставки.ЗаполнитьПредопределённый(10,   1, "дека",  "дека",  "да", "deca",  "da");
	Приставки.ЗаполнитьПредопределённый(10,  -1, "деци",  "деци",  "д",  "deci",  "d");
	Приставки.ЗаполнитьПредопределённый(10,  -2, "санти", "санти", "с",  "centi", "c");
	Приставки.ЗаполнитьПредопределённый(10,  -3, "милли", "милли", "м",  "milli", "m");
	Приставки.ЗаполнитьПредопределённый(10,  -6, "микро", "микро", "мк", "micro", "µ");
	Приставки.ЗаполнитьПредопределённый(10,  -9, "нано",  "нано",  "н",  "nano",  "n");
	Приставки.ЗаполнитьПредопределённый(10, -12, "пико",  "пико",  "п",  "pico",  "p");
	Приставки.ЗаполнитьПредопределённый(10, -15, "фемто", "фемто", "ф",  "femto", "f");
	Приставки.ЗаполнитьПредопределённый(10, -18, "атто",  "атто",  "а",  "atto",  "a");
	Приставки.ЗаполнитьПредопределённый(10, -21, "зепто", "зепто", "з",  "zepto", "z");
	Приставки.ЗаполнитьПредопределённый(10, -24, "иокто", "иокто", "и",  "yocto", "y");
	
	Приставки.ЗаполнитьПредопределённый(2,   80, "иотто", "иотта", "И", "yotta", "Y", "йоби",  "Ии", "yobi", "Yi");
	Приставки.ЗаполнитьПредопределённый(2,   70, "зетта", "зетта", "З", "zetta", "Z", "зеби",  "Зи", "zebi", "Zi");
	Приставки.ЗаполнитьПредопределённый(2,   60, "экса",  "экса",  "Э", "exa",   "E", "эксби", "Эи", "exbi", "Ei");
	Приставки.ЗаполнитьПредопределённый(2,   50, "пета",  "пета",  "П", "peta",  "P", "пеби",  "Пи", "pebi", "Pi");
	Приставки.ЗаполнитьПредопределённый(2,   40, "тера",  "тера",  "Т", "tera",  "T", "теби",  "Ти", "tebi", "Ti");
	Приставки.ЗаполнитьПредопределённый(2,   30, "гига",  "гига",  "Г", "giga",  "G", "гиби",  "Ги", "gibi", "Gi");
	Приставки.ЗаполнитьПредопределённый(2,   20, "мега",  "мега",  "М", "mega",  "M", "меби",  "Ми", "mebi", "Mi");
	Приставки.ЗаполнитьПредопределённый(2,   10, "кило",  "кило",  "К", "kilo",  "K", "киби",  "Ки", "kibi", "Ki");
	
КонецПроцедуры

Процедура ЗаполнитьКонстантуМСЕдиницыВеличинОбозначения() Экспорт
	
	Константы.МСЕдиницыВеличинОбозначения.Установить(Перечисления.МСЕдиницыВеличинОбозначения.Рус);
	
КонецПроцедуры

// Меняем структуру кода для справочника приставок единиц величин (#37)
Процедура ПерейтиНаВерсию_1_0_2_20() Экспорт
	
	Перем Приставки;
	Приставки = Справочники.МСЕдиницыВеличинПриставкиКратныхИДольных.Выбрать();

	Пока Приставки.Следующий() Цикл
		ОбновлениеИнформационнойБазы.ЗаписатьДанные(Приставки.Ссылка.ПолучитьОбъект(), , Истина);
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти