﻿#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий

Процедура ПриЗаписи(Отказ)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	Если Не ЭтоГруппа И Не Константы._ДемоИспользоватьНесколькоОрганизаций.Получить()
		И Справочники._ДемоОрганизации.КоличествоОрганизаций() > 1 Тогда
		
		УстановитьПривилегированныйРежим(Истина);
		Константы._ДемоИспользоватьНесколькоОрганизаций.Установить(Истина);
		УстановитьПривилегированныйРежим(Ложь);
		
	КонецЕсли;
	
КонецПроцедуры
	
#КонецОбласти
	
#КонецЕсли
