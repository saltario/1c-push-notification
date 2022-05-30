
Процедура ЗаписатьИнформациюОМобильномКлиенте(Знач Сведения) Экспорт
	
	НачатьТранзакцию();
		
	Попытка
			
		Блокировка = Новый БлокировкаДанных;
		ЭлементБлокировки = Блокировка.Добавить("РегистрСведений.СведенияОМобильныхКлиентах");
		ЭлементБлокировки.Режим = РежимБлокировкиДанных.Исключительный;
		Блокировка.Заблокировать();

		ЗаписьМобильныйКлиент = РегистрыСведений.СведенияОМобильныхКлиентах.СоздатьМенеджерЗаписи();
		ЗаписьМобильныйКлиент.ИдентификаторКлиента = Сведения.ИдентификаторКлиента;
		ЗаписьМобильныйКлиент.ИдентификаторПодписчикаУведомления = Новый ХранилищеЗначения(
			Сведения.ИдентификаторПодписчикаУведомления, Новый СжатиеДанных());
		ЗаписьМобильныйКлиент.Пользователь = Справочники.Пользователи.ПустаяСсылка();
		ЗаписьМобильныйКлиент.ДатаПоследнегоВхода = ТекущаяДатаСеанса();		
	
		ЗаписьМобильныйКлиент.Записать(Истина);
		ЗафиксироватьТранзакцию();
		
	Исключение
		
		ОтменитьТранзакцию();						
		ВызватьИсключение;
			
	КонецПопытки;
	
КонецПроцедуры