﻿////////////////////////////////////////////////////////////////////////////////
// Подсистема "Метрологическая служба. Единицы величин".
// ОбщийМодуль.МСЕдиницыВеличинКлиентСервер.
//
////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Возвращает номер версии библиотеки.
//
// Возвращаемое значение:
//	Строка - номер версии библиотеки.
//
Функция ВерсияБиблиотеки() Экспорт
	
	Возврат "1.0.2.25";
	
КонецФункции

// Возвращает наименование единицы величины или приставки.
//
// Параметры:
// 	ЕдиницаВеличиныИлиПриставка	- Ссылка, Объект, Структура - Сссылка, объект, структура приставки,
//    единицы величины.
// 	ОбозначениеЕдиницыВеличин - МСЕдиницыВеличинОбозначения	- Вариант обозначения единиц величин.
//
// Возвращаемое значение: Строка
//
Функция ПолучитьНаименование(Знач ЕдиницаВеличиныИлиПриставка, Знач ОбозначениеЕдиницыВеличин = Неопределено) Экспорт

	ОбщегоНазначенияКлиентСервер.ПроверитьПараметр(
		"МСЕдиницыВеличинКлиентСервер.ПолучитьНаименование",
		"ЕдиницаВеличиныИлиПриставка",
		ЕдиницаВеличиныИлиПриставка,
		Новый ОписаниеТипов(
			"СправочникСсылка.ЕдиницыВеличин, СправочникОбъект.ЕдиницыВеличин,
			|СправочникСсылка.ПриставкиЕдиницыВеличин, СправочникОбъект.ПриставкиЕдиницыВеличин,
			|ДанныеФормыСтруктура, Структура"),
		МСЕдиницыВеличинКлиентСерверПовтИсп.ПолучитьТипыСвойствНаименованияИОбозначения());
		
	Если ЗначениеЗаполнено(ЕдиницаВеличиныИлиПриставка) Тогда
		Возврат ЕдиницаВеличиныИлиПриставка[МСЕдиницыВеличинКлиентСерверПовтИсп.ПолучитьРеквизитНаименования(ОбозначениеЕдиницыВеличин)];
	Иначе
		Возврат "";
	КонецЕсли;

КонецФункции

// Возвращает обозначение единицы величины или приставки.
//
// Параметры:
// 	ЕдиницаВеличиныИлиПриставка	- Ссылка, Объект, Структура - Сссылка, объект, структура приставки,
//    единицы величины.
// 	ОбозначениеЕдиницыВеличин - МСЕдиницыВеличинОбозначения	- Вариант обозначения единиц величин.
//
// Возвращаемое значение: Строка
//
Функция ПолучитьОбозначение(Знач ЕдиницаВеличиныИлиПриставка, Знач ОбозначениеЕдиницыВеличин = Неопределено) Экспорт

	ОбщегоНазначенияКлиентСервер.ПроверитьПараметр(
		"МСЕдиницыВеличинКлиентСервер.ПолучитьОбозначение",
		"ЕдиницаВеличиныИлиПриставка",
		ЕдиницаВеличиныИлиПриставка,
		Новый ОписаниеТипов(
			"СправочникСсылка.ЕдиницыВеличин, СправочникОбъект.ЕдиницыВеличин,
			|СправочникСсылка.ПриставкиЕдиницыВеличин, СправочникОбъект.ПриставкиЕдиницыВеличин,
			|ДанныеФормыСтруктура, Структура"),
		МСЕдиницыВеличинКлиентСерверПовтИсп.ПолучитьТипыСвойствНаименованияИОбозначения());

	Если ЗначениеЗаполнено(ЕдиницаВеличиныИлиПриставка) Тогда
		Возврат ЕдиницаВеличиныИлиПриставка[МСЕдиницыВеличинКлиентСерверПовтИсп.ПолучитьРеквизитОбозначения(ОбозначениеЕдиницыВеличин)];
	Иначе
		Возврат "";
	КонецЕсли;

КонецФункции

// Возвращает предлог, используемый перед единицей величины в знаменателе производной единицы.
//
// Параметры:
// 	ЕдиницаВеличины	- Ссылка, Объект, Структура - Сссылка, объект, структура единицы величины.
// 	ОбозначениеЕдиницыВеличин - МСЕдиницыВеличинОбозначения	- Вариант обозначения единиц величин.
//
// Возвращаемое значение: Строка
//
Функция ПолучитьПредлогДляЗнаменателя(Знач ЕдиницаВеличины, Знач ОбозначениеЕдиницыВеличин = Неопределено) Экспорт

	ОбщегоНазначенияКлиентСервер.ПроверитьПараметр(
		"МСЕдиницыВеличинКлиентСервер.ПолучитьПредлогДляЗнаменателя",
		"ЕдиницаВеличины",
		ЕдиницаВеличины,
		Новый ОписаниеТипов(
			"СправочникСсылка.ЕдиницыВеличин, СправочникОбъект.ЕдиницыВеличин,
			|ДанныеФормыСтруктура, Структура"),
		МСЕдиницыВеличинКлиентСерверПовтИсп.ПолучитьТипыСвойствНаименованияИОбозначения());

	Если ЗначениеЗаполнено(ЕдиницаВеличины) Тогда
		Возврат ЕдиницаВеличины[МСЕдиницыВеличинКлиентСерверПовтИсп.ПолучитьРеквизитПредлогаДляЗнаменателя(ОбозначениеЕдиницыВеличин)];
	Иначе
		Возврат "";
	КонецЕсли;

КонецФункции

// Возвращает признак необходимости пробела после значения и перед обозначением единицы величины.
//
// Параметры:
// 	ЕдиницаВеличины	- Ссылка, Объект, Структура - Сссылка, объект, структура единицы величины.
// 	ОбозначениеЕдиницыВеличин - МСЕдиницыВеличинОбозначения	- Вариант обозначения единиц величин.
//
// Возвращаемое значение: Булево
//
Функция ПолучитьПробелПередОбозначением(Знач ЕдиницаВеличины, Знач ОбозначениеЕдиницыВеличин = Неопределено) Экспорт

	ОбщегоНазначенияКлиентСервер.ПроверитьПараметр(
		"МСЕдиницыВеличинКлиентСервер.ПолучитьПредлогДляЗнаменателя",
		"ЕдиницаВеличины",
		ЕдиницаВеличины,
		Новый ОписаниеТипов(
			"СправочникСсылка.ЕдиницыВеличин, СправочникОбъект.ЕдиницыВеличин,
			|ДанныеФормыСтруктура, Структура"),
		МСЕдиницыВеличинКлиентСерверПовтИсп.ПолучитьТипыСвойствНаименованияИОбозначения());

	Если ЗначениеЗаполнено(ЕдиницаВеличины) Тогда
		Возврат ЕдиницаВеличины[МСЕдиницыВеличинКлиентСерверПовтИсп.ПолучитьРеквизитПробелПередОбозначением(ОбозначениеЕдиницыВеличин)];
	Иначе
		Возврат "";
	КонецЕсли;

КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

#КонецОбласти
