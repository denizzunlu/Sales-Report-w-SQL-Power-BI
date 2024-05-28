-- Temizlenmiþ DIM_Date Tablosu --
SELECT 
  [DateKey],  -- Her tarih için benzersiz anahtar (ID).
  [FullDateAlternateKey] AS Date,  -- Tarih bilgisi, daha kullanýcý dostu bir adla 'Date' olarak yeniden adlandýrýldý.
  --[DayNumberOfWeek],  -- Haftanýn gününün sayýsal deðeri (0=Pazar, 1=Pazartesi, vb.). Bu sütun devre dýþý býrakýldý.
  [EnglishDayNameOfWeek] AS Day,  -- Haftanýn gününün Ýngilizce adý, 'Day' olarak yeniden adlandýrýldý.
  --[SpanishDayNameOfWeek],  -- Haftanýn gününün Ýspanyolca adý. Bu sütun devre dýþý býrakýldý.
  --[FrenchDayNameOfWeek],  -- Haftanýn gününün Fransýzca adý. Bu sütun devre dýþý býrakýldý.
  --[DayNumberOfMonth],  -- Ay içindeki günün sayýsal deðeri. Bu sütun devre dýþý býrakýldý.
  --[DayNumberOfYear],  -- Yýl içindeki günün sayýsal deðeri. Bu sütun devre dýþý býrakýldý.
  --[WeekNumberOfYear],  -- Yýl içindeki hafta numarasý. Bu sütun devre dýþý býrakýldý.
  [EnglishMonthName] AS Month,  -- Ayýn Ýngilizce adý, 'Month' olarak yeniden adlandýrýldý.
  Left([EnglishMonthName], 3) AS MonthShort,  -- Ay adýnýn ilk üç harfi, 'MonthShort' olarak yeniden adlandýrýldý. Ön yüz tarih navigasyonu ve grafikler için kullanýþlýdýr.
  --[SpanishMonthName],  -- Ayýn Ýspanyolca adý. Bu sütun devre dýþý býrakýldý.
  --[FrenchMonthName],  -- Ayýn Fransýzca adý. Bu sütun devre dýþý býrakýldý.
  [MonthNumberOfYear] AS MonthNo,  -- Yýl içindeki ayýn sayýsal deðeri, 'MonthNo' olarak yeniden adlandýrýldý.
  [CalendarQuarter] AS Quarter,  -- Yýlýn çeyreði, 'Quarter' olarak yeniden adlandýrýldý.
  [CalendarYear] AS Year  -- Yýl, 'Year' olarak yeniden adlandýrýldý.
  --[CalendarSemester],  -- Yýlýn yarýyýlý. Bu sütun devre dýþý býrakýldý.
  --[FiscalQuarter],  -- Mali çeyrek. Bu sütun devre dýþý býrakýldý.
  --[FiscalYear],  -- Mali yýl. Bu sütun devre dýþý býrakýldý.
  --[FiscalSemester]  -- Mali yarýyýl. Bu sütun devre dýþý býrakýldý.
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate]  -- Verilerin alýndýðý tablo.
WHERE 
  CalendarYear >= 2019  -- Sadece 2019 ve sonrasý yýllara ait veriler seçilecek.