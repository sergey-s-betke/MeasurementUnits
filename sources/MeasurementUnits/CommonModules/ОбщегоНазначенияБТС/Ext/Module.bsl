﻿#Область ПрограммныйИнтерфейс

// Проверяет, является ли переданный объект метаданных объектом ОбъектМетаданныхКонфигурация.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоОбъектМетаданныхКонфигурация(Знач ОбъектМетаданных) Экспорт
	
	Возврат ТипЗнч(ОбъектМетаданных) = Тип("ОбъектМетаданныхКонфигурация");
	
КонецФункции

// Проверяет, является ли переданный объект метаданных подсистемой.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоПодсистема(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().Подсистемы);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных параметром сеанса.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоПараметрСеанса(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().ПараметрыСеанса);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных общим реквизитом.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоОбщийРеквизит(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().ОбщиеРеквизиты);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных константной.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоКонстанта(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().Константы);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных справочником.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоСправочник(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().Справочники);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных документом.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоДокумент(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().Документы);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных перечислением.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоПеречисление(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().Перечисления);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных бизнес-процессом.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоБизнесПроцесс(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().БизнесПроцессы);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных задачей.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоЗадача(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().Задачи);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных планом счетов.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоПланСчетов(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().ПланыСчетов);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных планом обмена.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоПланОбмена(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().ПланыОбмена);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных планом видов расчета.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоПланВидовРасчета(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().ПланыВидовРасчета);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных планом видов расчета.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоПланВидовХарактеристик(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().ПланыВидовХарактеристик);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных ссылочным.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоСсылочныеДанные(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоСправочник(ОбъектМетаданных)
		Или ЭтоДокумент(ОбъектМетаданных) 
		Или ЭтоБизнесПроцесс(ОбъектМетаданных) 
		Или ЭтоЗадача(ОбъектМетаданных) 
		Или ЭтоПланСчетов(ОбъектМетаданных) 
		Или ЭтоПланОбмена(ОбъектМетаданных) 
		Или ЭтоПланВидовХарактеристик(ОбъектМетаданных) 
		Или ЭтоПланВидовРасчета(ОбъектМетаданных)
		ИЛИ ЭтоПеречисление(ОбъектМетаданных);
		
КонецФункции

// Проверяет, является ли переданный объект метаданных ссылочным с поддержкой предопределенных элементов.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоСсылочныеДанныеПоддерживающиеПредопределенныеЭлементы(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоСправочник(ОбъектМетаданных)
		ИЛИ ЭтоПланСчетов(ОбъектМетаданных)
		ИЛИ ЭтоПланВидовХарактеристик(ОбъектМетаданных)
		ИЛИ ЭтоПланВидовРасчета(ОбъектМетаданных);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных регистром сведений.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоРегистрСведений(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().РегистрыСведений);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных регистром накопления.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоРегистрНакопления(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().РегистрыНакопления);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных регистром бухгалтерии.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоРегистрБухгалтерии(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().РегистрыБухгалтерии);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных регистром расчета.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоРегистрРасчета(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().РегистрыРасчета);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных перерасчетом.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоНаборЗаписейПерерасчета(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().Перерасчеты);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных последовательности.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоНаборЗаписейПоследовательности(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().Последовательности);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных набором записей.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоНаборЗаписей(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоРегистрСведений(ОбъектМетаданных)
		Или ЭтоРегистрНакопления(ОбъектМетаданных) 
		Или ЭтоРегистрБухгалтерии(ОбъектМетаданных) 
		Или ЭтоРегистрРасчета(ОбъектМетаданных) 
		Или ЭтоНаборЗаписейПоследовательности(ОбъектМетаданных) 
		Или ЭтоНаборЗаписейПерерасчета(ОбъектМетаданных);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных независимым набором записей.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоНезависимыйНаборЗаписей(Знач ОбъектМетаданных) Экспорт
	
	Если ТипЗнч(ОбъектМетаданных) = Тип("Строка") Тогда
		ОбъектМетаданных = Метаданные.НайтиПоПолномуИмени(ОбъектМетаданных);
	КонецЕсли;
	
	Возврат ЭтоРегистрСведений(ОбъектМетаданных)
		И ОбъектМетаданных.РежимЗаписи = Метаданные.СвойстваОбъектов.РежимЗаписиРегистра.Независимый;
	
КонецФункции

// Проверяет, является ли переданный объект метаданных набором записей, поддерживающим итоги.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоНаборЗаписейПоддерживающийИтоги(Знач ОбъектМетаданных) Экспорт
	
	Если ЭтоРегистрСведений(ОбъектМетаданных) Тогда
		
		Если ТипЗнч(ОбъектМетаданных) = Тип("Строка") Тогда
			ОбъектМетаданных = Метаданные.НайтиПоПолномуИмени(ОбъектМетаданных);
		КонецЕсли;
		
		Возврат (ОбъектМетаданных.РазрешитьИтогиСрезПервых ИЛИ ОбъектМетаданных.РазрешитьИтогиСрезПоследних);
		
	ИначеЕсли ЭтоРегистрНакопления(ОбъектМетаданных) Тогда
		
		Возврат Истина;
		
	ИначеЕсли ЭтоРегистрБухгалтерии(ОбъектМетаданных) Тогда
		
		Возврат Истина;
		
	Иначе
		
		Возврат Ложь;
		
	КонецЕсли;
	
КонецФункции

// Проверяет, является ли переданный объект метаданных журналом документов.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоЖурналДокументов(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().ЖурналыДокументов);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных регламентным заданием.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоРегламентноеЗадание(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().РегламентныеЗадания);
	
КонецФункции

// Проверяет, является ли переданный объект метаданных внешним источником данных.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоВнешнийИсточникДанных(Знач ОбъектМетаданных) Экспорт
	
	Возврат ЭтоОбъектМетаданныхКласса(ОбъектМетаданных, ОбщегоНазначенияБТСПовтИсп.КлассыМетаданныхВМоделиКонфигурации().ВнешниеИсточникиДанных);
	
КонецФункции

// Возвращает: примитивный ли это тип или нет.
//
// Параметры:
//  ПроверяемыйТип - Тип - проверяемый тип.
//
// Возвращаемое значение:
//  Истина - если тип примитивный.
//
Функция ЭтоПримитивныйТип(Знач ПроверяемыйТип) Экспорт
	
	Возврат ОбщегоНазначенияБТСПовтИсп.ОписаниеПримитивныхТипов().СодержитТип(ПроверяемыйТип);
	
КонецФункции

// Возвращает: ссылочный ли это тип или нет.
//
// Параметры:
//  ПроверяемыйТип - Тип - проверяемый тип.
//
// Возвращаемое значение:
//  Истина - если тип примитивный.
//
Функция ЭтоСсылочныйТип(Знач ПроверяемыйТип) Экспорт
	
	Возврат ОбщегоНазначенияБТСПовтИсп.ОписаниеСсылочныхТипов().СодержитТип(ПроверяемыйТип);
	
КонецФункции

// Проверяет, что тип содержит набор ссылочных типов.
//
// Параметры:
//  ОписаниеТипов - ОписаниеТипов.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоНаборТиповСсылок(Знач ОписаниеТипов) Экспорт
	
	Если ОписаниеТипов.Типы().Количество() < 2 Тогда
		Возврат Ложь;
	КонецЕсли;
	
	СериализацияОписанияТипов = СериализаторXDTO.ЗаписатьXDTO(ОписаниеТипов);
	
	Если СериализацияОписанияТипов.TypeSet.Количество() > 0 Тогда
		
		СодержитНаборыСсылок = Ложь;
		
		Для Каждого НаборТипов Из СериализацияОписанияТипов.TypeSet Цикл
			
			Если НаборТипов.URIПространстваИмен = "http://v8.1c.ru/8.1/data/enterprise/current-config" Тогда
				
				Если НаборТипов.ЛокальноеИмя = "AnyRef"
						ИЛИ НаборТипов.ЛокальноеИмя = "CatalogRef"
						ИЛИ НаборТипов.ЛокальноеИмя = "DocumentRef"
						ИЛИ НаборТипов.ЛокальноеИмя = "BusinessProcessRef"
						ИЛИ НаборТипов.ЛокальноеИмя = "TaskRef"
						ИЛИ НаборТипов.ЛокальноеИмя = "ChartOfAccountsRef"
						ИЛИ НаборТипов.ЛокальноеИмя = "ExchangePlanRef"
						ИЛИ НаборТипов.ЛокальноеИмя = "ChartOfCharacteristicTypesRef"
						ИЛИ НаборТипов.ЛокальноеИмя = "ChartOfCalculationTypesRef" Тогда
					
					СодержитНаборыСсылок = Истина;
					Прервать;
					
				КонецЕсли;
				
			КонецЕсли;
			
		КонецЦикла;
		
		Возврат СодержитНаборыСсылок;
		
	Иначе
		Возврат Ложь;
	КонецЕсли;
	
КонецФункции

// Возвращает объект метаданных по типу ссылки
//
// Параметры:
//  ТипСсылки - Тип,
//
// Возвращаемое значение: ОбъектМетаданных.
//
Функция ОбъектМетаданныхПоТипуСсылки(Знач ТипСсылки) Экспорт
	
	БизнесПроцесс = ОбщегоНазначенияБТСПовтИсп.СсылкиТочекМаршрутаБизнесПроцессов().Получить(ТипСсылки);
	Если БизнесПроцесс = Неопределено Тогда
		Ссылка = Новый(ТипСсылки);
		МетаданныеСсылки = Ссылка.Метаданные();
	Иначе
		МетаданныеСсылки = Метаданные.БизнесПроцессы[БизнесПроцесс];
	КонецЕсли;
	
	Возврат МетаданныеСсылки;
	
КонецФункции

// Проверяет включение объекта метаданных в состав разделителя в режиме, включающем разделение данных.
//
// Параметры:
//  ОбъектМетаданных - проверяемый объект метаданных,
//  ИмяРазделителя - Строка - имя общего реквизита - разделителя.
//
// Возвращаемое значение: Булево.
//
Функция ЭтоРазделенныйОбъектМетаданных(Знач ОбъектМетаданных, Знач ИмяРазделителя) Экспорт
	
	Свойства = СвойстваОбъектаМоделиКонфигурации(ОбщегоНазначенияБТСПовтИсп.ОписаниеМоделиДанныхКонфигурации(), ОбъектМетаданных);
	Возврат Свойства.РазделениеДанных.Свойство(ИмяРазделителя);
	
КонецФункции

// Возвращает перечень объектов, ссылки на которые содержатся в исходном объекте метаданных.
// Наборы ссылок и хранение ссылок в хранилище значения не учитываются.
//
// Параметры:
//  ОбъектМетаданных.
//
// Возвращаемое значение: Массив(Строка) - массив полных имен объектов метаданных.
//
Функция ЗависимостиОбъектаМетаданных(Знач ОбъектМетаданных) Экспорт
	
	Свойства = СвойстваОбъектаМоделиКонфигурации(ОбщегоНазначенияБТСПовтИсп.ОписаниеМоделиДанныхКонфигурации(), ОбъектМетаданных);
	Возврат Свойства.Зависимости;
	
КонецФункции

// Проверяет доступность объектов метаданных по текущим значениям функциональных опций.
//
// Параметры:
//  ОбъектМетаданных.
//
// Возвращаемое значение: Булево.
//
Функция ОбъектМетаданныхДоступенПоФункциональнымОпциям(Знач ОбъектМетаданных) Экспорт
	
	Свойства = СвойстваОбъектаМоделиКонфигурации(ОбщегоНазначенияБТСПовтИсп.ОписаниеМоделиДанныхКонфигурации(), ОбъектМетаданных);
	
	Если Свойства.ФункциональныеОпции.Количество() = 0 Тогда
		Возврат Истина;
	Иначе
		Результат = Ложь;
		Для Каждого ФункциональнаяОпция Из Свойства.ФункциональныеОпции Цикл
			Если ПолучитьФункциональнуюОпцию(ФункциональнаяОпция) Тогда
				Результат = Истина;
			КонецЕсли;
		КонецЦикла;
		Возврат Результат;
	КонецЕсли;
	
КонецФункции

// Возвращает представление объекта метаданных.
//
// Параметры:
//  ОбъектМетаданных.
//
// Возвращаемое значение: Строка - представление объекта метаданных.
//
Функция ПредставлениеОбъектаМетаданных(Знач ОбъектМетаданных) Экспорт
	
	Свойства = СвойстваОбъектаМоделиКонфигурации(ОбщегоНазначенияБТСПовтИсп.ОписаниеМоделиДанныхКонфигурации(), ОбъектМетаданных);
	Возврат Свойства.Представление;
	
КонецФункции

// Возвращает перечень (с классификацией) прав, допустимых для объекта метаданных.
//
// Параметры:
//  ОбъектМетаданных - ОбъектМетаданных, ОбъектМетаданныхКонфигурация.
//
// Возвращаемое значение: ТаблицаЗначений:
//                         * Имя - Строка, имя вида права, которое может использоваться
//                                    для функции ПравоДоступа(),
//                         * Интерактивное - Булево, флаг того, что право ограничивает возможность
//                                    выполнения интерактивных операций,
//                         * Чтение - Булево, флаг того, что право предоставляет или подразумевает
//                                    возможность чтения данных заданного объекта метаданных,
//                         * Изменение - Булево, флаг того, что право предоставляет или подразумевает
//                                    возможность изменения данных заданного объекта метаданных,
//                         * АдминистрированиеИнформационнойБазы - Булево, флаг того, что право
//                                    предоставляет или предполагает возможность администрирования
//                                    (глобального для информационной базы),
//                         * АдминистрированиеОбластиДанных - Булево, флаг того, что право предоставляет
//                                    или предполагает возможность администрирования (глобального для
//                                    текущей области данных).
//
Функция ДопустимыеПраваДляОбъектаМетаданных(Знач ОбъектМетаданных) Экспорт
	
	ВидыПрав = Новый ТаблицаЗначений();
	ВидыПрав.Колонки.Добавить("Имя", Новый ОписаниеТипов("Строка"));
	ВидыПрав.Колонки.Добавить("Интерактивное", Новый ОписаниеТипов("Булево"));
	ВидыПрав.Колонки.Добавить("Чтение", Новый ОписаниеТипов("Булево"));
	ВидыПрав.Колонки.Добавить("Изменение", Новый ОписаниеТипов("Булево"));
	ВидыПрав.Колонки.Добавить("АдминистрированиеИнформационнойБазы", Новый ОписаниеТипов("Булево"));
	ВидыПрав.Колонки.Добавить("АдминистрированиеОбластиДанных", Новый ОписаниеТипов("Булево"));
	
	Если ЭтоОбъектМетаданныхКонфигурация(ОбъектМетаданных) Тогда
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Администрирование";
		ВидПрава.АдминистрированиеИнформационнойБазы = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "АдминистрированиеДанных";
		ВидПрава.АдминистрированиеОбластиДанных = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ОбновлениеКонфигурацииБазыДанных";
		ВидПрава.АдминистрированиеИнформационнойБазы = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "МонопольныйРежим";
		ВидПрава.АдминистрированиеОбластиДанных = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "АктивныеПользователи";
		ВидПрава.АдминистрированиеОбластиДанных = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ЖурналРегистрации";
		ВидПрава.АдминистрированиеОбластиДанных = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ТонкийКлиент";
		ВидПрава.Интерактивное = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ВебКлиент";
		ВидПрава.Интерактивное = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ТолстыйКлиент";
		ВидПрава.АдминистрированиеИнформационнойБазы = Истина;
		ВидПрава.Интерактивное = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ВнешнееСоединение";
		ВидПрава.АдминистрированиеИнформационнойБазы = Истина;
		ВидПрава.Интерактивное = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Automation";
		ВидПрава.АдминистрированиеИнформационнойБазы = Истина;
		ВидПрава.Интерактивное = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "РежимВсеФункции";
		ВидПрава.АдминистрированиеИнформационнойБазы = Истина;
		ВидПрава.Интерактивное = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "СохранениеДанныхПользователя";
		ВидПрава.Интерактивное = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ИнтерактивноеОткрытиеВнешнихОбработок";
		ВидПрава.АдминистрированиеИнформационнойБазы = Истина;
		ВидПрава.Интерактивное = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ИнтерактивноеОткрытиеВнешнихОтчетов";
		ВидПрава.АдминистрированиеИнформационнойБазы = Истина;
		ВидПрава.Интерактивное = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Вывод";
		ВидПрава.Интерактивное = Истина;
		
	ИначеЕсли ЭтоПараметрСеанса(ОбъектМетаданных) Тогда
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Получение";
		ВидПрава.Чтение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Установка";
		ВидПрава.Изменение = Истина;
		
	ИначеЕсли ЭтоОбщийРеквизит(ОбъектМетаданных) Тогда
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава = "Просмотр";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Чтение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Редактирование";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Изменение = Истина;
		
	ИначеЕсли ЭтоКонстанта(ОбъектМетаданных) Тогда
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Чтение";
		ВидПрава.Чтение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Изменение";
		ВидПрава.Изменение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Просмотр";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Чтение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Редактирование";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Изменение = Истина;
		
	ИначеЕсли ЭтоСсылочныеДанные(ОбъектМетаданных) Тогда
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Чтение";
		ВидПрава.Чтение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Добавление";
		ВидПрава.Изменение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Изменение";
		ВидПрава.Изменение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Удаление";
		ВидПрава.Изменение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Просмотр";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Чтение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ИнтерактивноеДобавление";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Изменение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Редактирование";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Изменение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ИнтерактивноеУдаление";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Изменение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ИнтерактивнаяПометкаУдаления";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Изменение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ИнтерактивноеСнятиеПометкиУдаления";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Изменение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ИнтерактивноеУдалениеПомеченных";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Изменение = Истина;
		
		Если ЭтоДокумент(ОбъектМетаданных) Тогда
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "Проведение";
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ОтменаПроведения";
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивноеПроведение";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивноеПроведениеНеоперативное";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивнаяОтменаПроведения";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивноеИзменениеПроведенных";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
		КонецЕсли;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "ВводПоСтроке";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Чтение = Истина;
		
		Если ЭтоБизнесПроцесс(ОбъектМетаданных) Тогда
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивнаяАктивация";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "Старт";
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивныйСтарт";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
		КонецЕсли;
		
		Если ЭтоЗадача(ОбъектМетаданных) Тогда
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивнаяАктивация";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "Выполнение";
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивноеВыполнение";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
		КонецЕсли;
		
		Если ЭтоСсылочныеДанныеПоддерживающиеПредопределенныеЭлементы(ОбъектМетаданных) Тогда
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивноеУдалениеПредопределенныхДанных";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивнаяПометкаУдаленияПредопределенныхДанных";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивноеСнятиеПометкиУдаленияПредопределенныхДанных";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "ИнтерактивноеУдалениеПомеченныхПредопределенныхДанных";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
		КонецЕсли;
		
	ИначеЕсли ЭтоНаборЗаписей(ОбъектМетаданных) Тогда
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Чтение";
		ВидПрава.Чтение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Изменение";
		ВидПрава.Изменение = Истина;
		
		Если Не ЭтоНаборЗаписейПоследовательности(ОбъектМетаданных) И Не ЭтоНаборЗаписейПерерасчета(ОбъектМетаданных) Тогда
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "Просмотр";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Чтение = Истина;
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "Редактирование";
			ВидПрава.Интерактивное = Истина;
			ВидПрава.Изменение = Истина;
			
		КонецЕсли;
		
		Если ЭтоНаборЗаписейПоддерживающийИтоги(ОбъектМетаданных) Тогда
			
			ВидПрава = ВидыПрав.Добавить();
			ВидПрава.Имя = "УправлениеИтогами";
			ВидПрава.АдминистрированиеОбластиДанных = Истина;
			
		КонецЕсли;
		
	ИначеЕсли ЭтоЖурналДокументов(ОбъектМетаданных) Тогда
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Чтение";
		ВидПрава.Чтение = Истина;
		
		ВидПрава = ВидыПрав.Добавить();
		ВидПрава.Имя = "Просмотр";
		ВидПрава.Интерактивное = Истина;
		ВидПрава.Чтение = Истина;
		
	КонецЕсли;
	
	Возврат ВидыПрав;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Проверяет, содержит ли конфигурация БСП.
//
// Возвращаемое значение: Булево.
//
Функция КонфигурацияСодержитБСП()
	
	Возврат (Метаданные.Подсистемы.Найти("СтандартныеПодсистемы") <> Неопределено);
	
КонецФункции

// Проверяет, поддерживаются ли в текущей конфигурации программные события БСП.
//
// Возвращаемое значение: Булево.
//
Функция ПоддерживаютсяПрограммныеСобытия()
	
	Если Не КонфигурацияСодержитБСП() Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Попытка
		
		УстановитьБезопасныйРежим(Истина);
		Параметры = Вычислить("СтандартныеПодсистемыПовтИсп.ПараметрыПрограммныхСобытий()");
		Возврат Истина;
		
	Исключение
		Возврат Ложь;
	КонецПопытки;
	
КонецФункции

// Возвращает обработчики программных событий БСП.
//
// Параметры:
//  Событие - Строка - имя события.
//
Функция ПолучитьОбработчикиПрограммныхСобытийБСП(Знач Событие) Экспорт
	
	Если ПоддерживаютсяПрограммныеСобытия() Тогда
		
		УстановитьБезопасныйРежим(Истина);
		Возврат Вычислить("ОбщегоНазначения.ОбработчикиСлужебногоСобытия(Событие)");
		
	Иначе
		Возврат Новый Массив();
	КонецЕсли;
	
КонецФункции

Функция СвойстваОбъектаМоделиКонфигурации(Знач Модель, Знач ОбъектМетаданных) Экспорт
	
	Если ТипЗнч(ОбъектМетаданных) = Тип("ОбъектМетаданных") Тогда
		Имя = ОбъектМетаданных.Имя;
		ПолноеИмя = ОбъектМетаданных.ПолноеИмя();
	Иначе
		ПолноеИмя = ОбъектМетаданных;
		Имя = СтрРазделить(ПолноеИмя, ".").Получить(1);
	КонецЕсли;
	
	Для Каждого КлассМодели Из Модель Цикл
		
		ОписаниеОбъекта = КлассМодели.Значение.Получить(Имя);
		
		Если ОписаниеОбъекта <> Неопределено Тогда
			
			Если ПолноеИмя = ОписаниеОбъекта.ПолноеИмя Тогда
				
				Возврат ОписаниеОбъекта;
				
			КонецЕсли;
			
		КонецЕсли;
		
	КонецЦикла;
	
КонецФункции

Функция ЭтоОбъектМетаданныхКласса(Знач ОбъектМетаданных, Знач Класс)
	
	Если ТипЗнч(ОбъектМетаданных) = Тип("ОбъектМетаданных") Тогда
		Имя = ОбъектМетаданных.Имя;
		ПолноеИмя = ОбъектМетаданных.ПолноеИмя();
	Иначе
		ПолноеИмя = ОбъектМетаданных;
		Имя = СтрРазделить(ПолноеИмя, ".").Получить(1);
	КонецЕсли;
	
	ГруппаМодели = ОбщегоНазначенияБТСПовтИсп.ОписаниеМоделиДанныхКонфигурации().Получить(Класс);
	
	ОписаниеОбъекта = ГруппаМодели.Получить(Имя);
	
	Если ОписаниеОбъекта <> Неопределено Тогда
		
		Возврат ПолноеИмя = ОписаниеОбъекта.ПолноеИмя;
		
	Иначе
		
		Возврат Ложь;
		
	КонецЕсли;
	
КонецФункции

#КонецОбласти