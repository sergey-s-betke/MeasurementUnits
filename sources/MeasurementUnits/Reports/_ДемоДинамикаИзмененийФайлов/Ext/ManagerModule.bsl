﻿#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

// Для подсистемы "Варианты отчетов" при работе в модели сервиса.
Функция ВариантыНастроек() Экспорт
	Результат = Новый Массив;
	Результат.Добавить(Новый Структура("Имя, Представление", "Основной", НСтр("ru = 'Демо: Динамика изменений файлов'")));
	Результат.Добавить(Новый Структура("Имя, Представление", "Дополнительный1", НСтр("ru = 'Демо: Дополнительный 1'")));
	Результат.Добавить(Новый Структура("Имя, Представление", "Дополнительный2", НСтр("ru = 'Демо: Дополнительный 2'")));
	Результат.Добавить(Новый Структура("Имя, Представление", "Дополнительный3", НСтр("ru = 'Демо: Дополнительный 3'")));
	Результат.Добавить(Новый Структура("Имя, Представление", "Дополнительный4", НСтр("ru = 'Демо: Дополнительный 4'")));
	Результат.Добавить(Новый Структура("Имя, Представление", "Дополнительный5", НСтр("ru = 'Демо: Дополнительный 5'")));
	Возврат Результат;
КонецФункции

// Настройки размещения в панели отчетов.
//
// Параметры:
//   Настройки - Коллекция - Передается "как есть" из ВариантыОтчетовПереопределяемый.НастроитьВариантыОтчетов().
//       Может использоваться для получения настроек варианта этого отчета при помощи функции ВариантыОтчетов.ОписаниеВарианта().
//   НастройкиОтчета - СтрокаДереваЗначений - Настройки этого отчета,
//       уже сформированные при помощи функции ВариантыОтчетов.ОписаниеОтчета() и готовые к изменению.
//       См. "Свойства для изменения" процедуры ВариантыОтчетовПереопределяемый.НастроитьВариантыОтчетов().
//
// Описание:
//   См. ВариантыОтчетовПереопределяемый.НастроитьВариантыОтчетов().
//
// Вспомогательные методы:
//	НастройкиВарианта = ВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "<ИмяВарианта>");
//	ВариантыОтчетов.УстановитьРежимВыводаВПанеляхОтчетов(Настройки, НастройкиОтчета, Истина/Ложь);
//
// Примеры:
//
//  1. Установка описания варианта.
//	НастройкиВарианта = ВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "<ИмяВарианта>");
//	НастройкиВарианта.Описание = НСтр("ru = '<Описание>'");
//
//  2. Отключение варианта отчета.
//	НастройкиВарианта = ВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "<ИмяВарианта>");
//	НастройкиВарианта.Включен = Ложь;
//
Процедура НастроитьВариантыОтчета(Настройки, НастройкиОтчета) Экспорт
	ВариантыОтчетов.УстановитьРежимВыводаВПанеляхОтчетов(Настройки, НастройкиОтчета, Ложь);
	НастройкиОтчета.ОпределитьНастройкиФормы = Истина;
	НастройкиОтчета.Размещение.Удалить(Метаданные.Подсистемы._ДемоОрганайзер.Подсистемы._ДемоРаботаСФайлами);
	
	НастройкиВарианта = ВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "Основной");
	НастройкиВарианта.Описание = НСтр("ru = 'Динамика изменений файлов в виде графика.'");
	НастройкиВарианта.ФункциональныеОпции.Добавить("ИспользоватьЗаметки");
	НастройкиВарианта.Размещение.Вставить(Метаданные.Подсистемы._ДемоОрганайзер.Подсистемы._ДемоВариантыОтчетов, "Важный");
	
	// Скрытие варианта отчета настройкой разработчика.
	НастройкиВарианта = ВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "Дополнительный1");
	НастройкиВарианта.Описание = НСтр("ru = 'Дополнительный 1.'");
	НастройкиВарианта.ВидимостьПоУмолчанию = Ложь;
	
	// Скрытие варианта отчета настройкой администратора.
	НастройкиВарианта = ВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "Дополнительный2");
	НастройкиВарианта.Описание = НСтр("ru = 'Дополнительный 2.'");
	НастройкиВарианта.ВидимостьПоУмолчанию = Истина;
	
	// Скрытие варианта отчета настройкой пользователя.
	НастройкиВарианта = ВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "Дополнительный3");
	НастройкиВарианта.Описание = НСтр("ru = 'Дополнительный 3.'");
	НастройкиВарианта.ВидимостьПоУмолчанию = Истина;
	
	// Отключение варианта отчета (безусловное).
	НастройкиВарианта = ВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "Дополнительный4");
	НастройкиВарианта.Описание = НСтр("ru = 'Дополнительный 4.'");
	НастройкиВарианта.Включен = Ложь;
	
	// Отключение варианта отчета (по ФО).
	НастройкиВарианта = ВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "Дополнительный5");
	НастройкиВарианта.Описание = НСтр("ru = 'Дополнительный 5.'");
	НастройкиВарианта.ФункциональныеОпции.Добавить("ИспользоватьВнешнихПользователей");
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли