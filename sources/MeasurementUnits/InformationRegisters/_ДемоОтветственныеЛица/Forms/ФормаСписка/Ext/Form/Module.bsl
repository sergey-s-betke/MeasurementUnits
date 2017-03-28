﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Свойство("АвтоТест") Тогда // Возврат при получении формы для анализа.
		Возврат;
	КонецЕсли;
	
	Если Параметры.Свойство("Отбор") И Параметры.Отбор.Свойство("Организация") Тогда
		Массив = ОбщегоНазначенияКлиентСервер.ЗначениеВМассиве(Параметры.Отбор.Организация);
	КонецЕсли;
	
	ОтветственныеЛицаОрганизаций.Загрузить(РегистрыСведений._ДемоОтветственныеЛица.ОтветственныеЛицаОрганизаций(Массив));
	
КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	
	Оповещение = Новый ОписаниеОповещения("ВыбратьИЗакрыть", ЭтотОбъект);
	ОбщегоНазначенияКлиент.ПоказатьПодтверждениеЗакрытияФормы(Оповещение, Отказ, ЗавершениеРаботы);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ЗаписатьИЗакрыть(Команда)
	
	ЗаписатьСписокОтветственных();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ЗаписатьСписокОтветственных()
	
	Для Каждого Элемент Из ОтветственныеЛицаОрганизаций Цикл
		
		НаборЗаписей = РегистрыСведений._ДемоОтветственныеЛица.СоздатьНаборЗаписей();
		НаборЗаписей.Отбор.Организация.Установить(Элемент.Организация);
		НаборЗаписей.Прочитать();
		
		Если НаборЗаписей.Количество() <> 0 Тогда
			
			Для Каждого Запись Из НаборЗаписей Цикл
				
				Запись.ФизическоеЛицо = Элемент.Ответственный;
				
			КонецЦикла;
			
		Иначе
			
			Запись = НаборЗаписей.Добавить();
			Запись.Организация = Элемент.Организация;
			Запись.ФизическоеЛицо = Элемент.Ответственный;
			
		КонецЕсли;
		
		НаборЗаписей.Записать();
		
	КонецЦикла;
	
	Модифицированность = Ложь;
	
КонецПроцедуры

&НаКлиенте
Процедура ВыбратьИЗакрыть(Результат = Неопределено, ДополнительныеПараметры = Неопределено) Экспорт
	
	ЗаписатьСписокОтветственных();
	Модифицированность = Ложь;
	Закрыть();
	
КонецПроцедуры

#КонецОбласти
