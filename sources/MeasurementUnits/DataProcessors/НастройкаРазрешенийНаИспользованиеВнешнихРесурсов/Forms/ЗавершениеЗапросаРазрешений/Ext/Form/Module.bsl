﻿&НаКлиенте
Перем РазрешитьЗакрытие;
&НаКлиенте
Перем ОжиданиеЗавершено;

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Свойство("АвтоТест") Тогда // Возврат при получении формы для анализа.
		Возврат;
	КонецЕсли;
	
	Длительность = Параметры.Длительность;
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	РазрешитьЗакрытие = Ложь;
	
	Если Длительность > 0 Тогда
		ОжиданиеЗавершено = Ложь;
		ПодключитьОбработчикОжидания("ПослеОжиданияПримененияНастроекВКластере", Длительность, Истина);
	Иначе
		ОжиданиеЗавершено = Истина;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	
	Если Не РазрешитьЗакрытие Тогда
		Отказ = Истина;
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПослеОжиданияПримененияНастроекВКластере()
	
	РазрешитьЗакрытие = Истина;
	Закрыть(КодВозвратаДиалога.ОК);
	
КонецПроцедуры

#КонецОбласти