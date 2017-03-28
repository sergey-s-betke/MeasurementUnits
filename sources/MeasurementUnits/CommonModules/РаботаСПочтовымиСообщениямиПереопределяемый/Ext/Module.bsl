﻿////////////////////////////////////////////////////////////////////////////////
// Подсистема "Работа с почтовыми сообщениями".
//
////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Позволяет выполнить дополнительные операции после отправки почтового сообщения.
//
// Параметры:
//  ПараметрыПисьма - Структура - содержит всю необходимую информацию о письме:
//   * Кому      - Массив структур, строка - (обязательный) Интернет адрес получателя письма.
//                 Адрес         - строка - почтовый адрес.
//                 Представление - строка - имя адресата.
//
//   * ПолучателиСообщения - Массив - массив структур, описывающий получателей:
//                            * ИсточникКонтактнойИнформации - СправочникСсылка - владелец контактной информации.
//                            * Адрес - Строка - Почтовый адрес получателя сообщения.
//                            * Представление - Строка - представление адресата.
//
//   * Копии      - Массив - коллекция структур адресов:
//                   * Адрес         - строка - почтовый адрес (должно быть обязательно заполнено).
//                   * Представление - строка - имя адресата.
//                  
//                - Строка - интернет адреса получателей письма, разделитель - ";".
//
//   * СлепыеКопии - Массив, Строка - см. описание поля Копии.
//
//   * Тема       - Строка - (обязательный) тема почтового сообщения.
//   * Тело       - Строка - (обязательный) текст почтового сообщения (простой текст в кодировке win-1251).
//   * Важность   - ВажностьИнтернетПочтовогоСообщения.
//   * Вложения   - Соответствие - список вложений, где:
//                   * ключ     - Строка - наименование вложения
//                   * значение - ДвоичныеДанные, АдресВоВременномХранилище - данные вложения;
//                              - Структура -    содержащая следующие свойства:
//                                 * ДвоичныеДанные - ДвоичныеДанные - двоичные данные вложения.
//                                 * Идентификатор  - Строка - идентификатор вложения, используется для хранения картинок,
//                                                             отображаемых в теле письма.
//
//   * АдресОтвета - Соответствие - см. описание поля Кому.
//   * Пароль      - Строка - пароль для доступа к учетной записи.
//   * ИдентификаторыОснований - Строка - идентификаторы оснований данного письма.
//   * ОбрабатыватьТексты  - Булево - необходимость обрабатывать тексты письма при отправке.
//   * УведомитьОДоставке  - Булево - необходимость запроса уведомления о доставке.
//   * УведомитьОПрочтении - Булево - необходимость запроса уведомления о прочтении.
//   * ТипТекста   - Строка, Перечисление.ТипыТекстовЭлектронныхПисем, ТипТекстаПочтовогоСообщения - определяет тип
//                  переданного теста допустимые значения:
//                  HTML/ТипыТекстовЭлектронныхПисем.HTML - текст почтового сообщения в формате HTML.
//                  ПростойТекст/ТипыТекстовЭлектронныхПисем.ПростойТекст - простой текст почтового сообщения.
//                                                                          Отображается "как есть" (значение по
//                                                                          умолчанию).
//                  РазмеченныйТекст/ТипыТекстовЭлектронныхПисем.РазмеченныйТекст - текст почтового сообщения в формате
//                                                                                  Rich Text.
//
Процедура ПослеОтправкиПисьма(ПараметрыПисьма) Экспорт
	
	// _Демо начало примера
	
	// Добавление введенного вручную адреса электронной почты в контактную информацию партнера.
	
	Если Не ПараметрыПисьма.Свойство("ПолучателиСообщения") Или Не ПараметрыПисьма.Свойство("Кому") Тогда
		Возврат;
	КонецЕсли;
	
	Если ПараметрыПисьма.ПолучателиСообщения.Количество() <> 1 Тогда
		Возврат;
	КонецЕсли;
	
	Ссылка = ПараметрыПисьма.ПолучателиСообщения[0].ИсточникКонтактнойИнформации;
	Если ТипЗнч(Ссылка) <> Тип("СправочникСсылка._ДемоПартнеры") Тогда
		Возврат;
	КонецЕсли;
	
	Если Не ПравоДоступа("Изменение", Метаданные.Справочники._ДемоПартнеры) Тогда
		Возврат;
	КонецЕсли;
	
	Объект = Ссылка.ПолучитьОбъект();
	ОбъектМодифицирован = Ложь;
	Для Каждого Адресат Из ПараметрыПисьма.Кому Цикл
		XMLПредставление = УправлениеКонтактнойИнформацией.КонтактнаяИнформацияXMLПоПредставлению(Адресат.Адрес, Справочники.ВидыКонтактнойИнформации._ДемоEmailПартнера);
		УправлениеКонтактнойИнформацией.ЗаписатьКонтактнуюИнформацию(Объект, XMLПредставление, 
			Справочники.ВидыКонтактнойИнформации._ДемоEmailПартнера, Перечисления.ТипыКонтактнойИнформации.АдресЭлектроннойПочты);
		ОбъектМодифицирован = Истина;
	КонецЦикла;
	
	Если ОбъектМодифицирован Тогда
		ЗаписьРазрешена = Истина;
		Попытка
			Объект.Записать();
		Исключение
			ЗаписьРазрешена = Ложь;
		КонецПопытки
	КонецЕсли;
	
	// _Демо конец примера
	
КонецПроцедуры

#КонецОбласти
