-- Temizlenmi� DIM_Date Tablosu --
SELECT 
  [DateKey],  -- Her tarih i�in benzersiz anahtar (ID).
  [FullDateAlternateKey] AS Date,  -- Tarih bilgisi, daha kullan�c� dostu bir adla 'Date' olarak yeniden adland�r�ld�.
  --[DayNumberOfWeek],  -- Haftan�n g�n�n�n say�sal de�eri (0=Pazar, 1=Pazartesi, vb.). Bu s�tun devre d��� b�rak�ld�.
  [EnglishDayNameOfWeek] AS Day,  -- Haftan�n g�n�n�n �ngilizce ad�, 'Day' olarak yeniden adland�r�ld�.
  --[SpanishDayNameOfWeek],  -- Haftan�n g�n�n�n �spanyolca ad�. Bu s�tun devre d��� b�rak�ld�.
  --[FrenchDayNameOfWeek],  -- Haftan�n g�n�n�n Frans�zca ad�. Bu s�tun devre d��� b�rak�ld�.
  --[DayNumberOfMonth],  -- Ay i�indeki g�n�n say�sal de�eri. Bu s�tun devre d��� b�rak�ld�.
  --[DayNumberOfYear],  -- Y�l i�indeki g�n�n say�sal de�eri. Bu s�tun devre d��� b�rak�ld�.
  --[WeekNumberOfYear],  -- Y�l i�indeki hafta numaras�. Bu s�tun devre d��� b�rak�ld�.
  [EnglishMonthName] AS Month,  -- Ay�n �ngilizce ad�, 'Month' olarak yeniden adland�r�ld�.
  Left([EnglishMonthName], 3) AS MonthShort,  -- Ay ad�n�n ilk �� harfi, 'MonthShort' olarak yeniden adland�r�ld�. �n y�z tarih navigasyonu ve grafikler i�in kullan��l�d�r.
  --[SpanishMonthName],  -- Ay�n �spanyolca ad�. Bu s�tun devre d��� b�rak�ld�.
  --[FrenchMonthName],  -- Ay�n Frans�zca ad�. Bu s�tun devre d��� b�rak�ld�.
  [MonthNumberOfYear] AS MonthNo,  -- Y�l i�indeki ay�n say�sal de�eri, 'MonthNo' olarak yeniden adland�r�ld�.
  [CalendarQuarter] AS Quarter,  -- Y�l�n �eyre�i, 'Quarter' olarak yeniden adland�r�ld�.
  [CalendarYear] AS Year  -- Y�l, 'Year' olarak yeniden adland�r�ld�.
  --[CalendarSemester],  -- Y�l�n yar�y�l�. Bu s�tun devre d��� b�rak�ld�.
  --[FiscalQuarter],  -- Mali �eyrek. Bu s�tun devre d��� b�rak�ld�.
  --[FiscalYear],  -- Mali y�l. Bu s�tun devre d��� b�rak�ld�.
  --[FiscalSemester]  -- Mali yar�y�l. Bu s�tun devre d��� b�rak�ld�.
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate]  -- Verilerin al�nd��� tablo.
WHERE 
  CalendarYear >= 2019  -- Sadece 2019 ve sonras� y�llara ait veriler se�ilecek.