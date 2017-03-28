﻿#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область СлужебныеПроцедурыИФункции

// Процедура заполняет номер картинки для события 152-ФЗ журнала регистрации.
//
Процедура УстановитьНомерРисунка(СобытиеЖурнала) Экспорт
	
	НомераКартинокСобытий = ЗащитаПерсональныхДанныхПовтИсп.НомераКартинокСобытий152ФЗ();
	
	// Установка номера картинки по особым правилам.
	СобытиеЖурнала.НомерРисунка = НомераКартинокСобытий[СобытиеЖурнала["Событие"]];
	
КонецПроцедуры

// Процедура выполняет заполнение колонок, 
//  которые имеют смысл только для формы Защита персональных данных.
//
Процедура ЗаполнитьДополнительныеКолонкиСобытия(СобытиеЖурнала) Экспорт
	
	Если СобытиеЖурнала.Событие = "_$Access$_.Access" Тогда
		
		ПредставлениеМетаданных = "";
		
		Для Каждого ЭлементМассива Из СобытиеЖурнала.ПредставлениеМетаданных Цикл
			// Выбираем представление самого объекта без имени метаданных.
			ЧастиПредставленияЭлемента = СтрРазделить(ЭлементМассива, ".");
			Если ЧастиПредставленияЭлемента.Количество() < 2 Тогда
				ПредставлениеЭлемента = СокрЛП(ЧастиПредставленияЭлемента[0]);
			Иначе
				ПредставлениеЭлемента = СокрЛП(ЧастиПредставленияЭлемента[1]);
			КонецЕсли;
			ПредставлениеМетаданных = ПредставлениеМетаданных + ПредставлениеЭлемента + ", ";
		КонецЦикла;
		
		СтроковыеФункцииКлиентСервер.УдалитьПоследнийСимволВСтроке(ПредставлениеМетаданных, 2);
		
		СобытиеЖурнала.СведенияОСобытии = ПредставлениеМетаданных;
		
	ИначеЕсли СобытиеЖурнала.Событие = "_$Access$_.AccessDenied"
		  ИЛИ СобытиеЖурнала.Событие = "_$Session$_.Authentication"
	      ИЛИ СобытиеЖурнала.Событие = "_$Session$_.AuthenticationError" Тогда
		  
		СобытиеЖурналаДанные = "";
		Если СобытиеЖурнала.Данные <> Неопределено Тогда
			Для каждого КлючИЗначение Из СобытиеЖурнала.Данные Цикл
				СобытиеЖурналаДанные = КлючИЗначение.Ключ + ": " + КлючИЗначение.Значение + ", ";
			КонецЦикла;
		КонецЕсли;
		СтроковыеФункцииКлиентСервер.УдалитьПоследнийСимволВСтроке(СобытиеЖурналаДанные, 2);
		
		СобытиеЖурнала.СведенияОСобытии = СобытиеЖурналаДанные;
		
	КонецЕсли;

КонецПроцедуры

// Процедура добавляет колонки, 
//  которые имеют смысл только для формы Защита персональных данных.
//
Процедура ДобавитьДополнительныеКолонкиСобытия(ЖурналСобытий) Экспорт
	
	ЖурналСобытий.Колонки.Добавить("СведенияОСобытии", Новый ОписаниеТипов("Строка"));
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли