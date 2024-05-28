-- Temizlenmi� FACT_InternetSales Tablosu --
SELECT 
  [ProductKey],  -- �r�n anahtar�, her sat�� kayd�nda ilgili �r�n� belirtir.
  [OrderDateKey],  -- Sipari� tarihi anahtar�, sipari�in verildi�i tarihi belirtir.
  [DueDateKey],  -- Vade tarihi anahtar�, sipari�in �denmesi gereken tarihi belirtir.
  [ShipDateKey],  -- Kargo tarihi anahtar�, sipari�in g�nderildi�i tarihi belirtir.
  [CustomerKey],  -- M��teri anahtar�, sipari�i veren m��teriyi belirtir.
  -- [PromotionKey],  -- Promosyon anahtar�. Bu s�tun devre d��� b�rak�ld�.
  -- [CurrencyKey],  -- Para birimi anahtar�. Bu s�tun devre d��� b�rak�ld�.
  -- [SalesTerritoryKey],  -- Sat�� b�lgesi anahtar�. Bu s�tun devre d��� b�rak�ld�.
  [SalesOrderNumber],  -- Sat�� sipari� numaras�, her sat�� sipari�i i�in benzersiz bir numara.
  -- [SalesOrderLineNumber],  -- Sat�� sipari� sat�r numaras�. Bu s�tun devre d��� b�rak�ld�.
  -- [RevisionNumber],  -- Revizyon numaras�. Bu s�tun devre d��� b�rak�ld�.
  -- [OrderQuantity],  -- Sipari� miktar�. Bu s�tun devre d��� b�rak�ld�.
  -- [UnitPrice],  -- Birim fiyat. Bu s�tun devre d��� b�rak�ld�.
  -- [ExtendedAmount],  -- Geni�letilmi� tutar. Bu s�tun devre d��� b�rak�ld�.
  -- [UnitPriceDiscountPct],  -- Birim fiyat indirim y�zdesi. Bu s�tun devre d��� b�rak�ld�.
  -- [DiscountAmount],  -- �ndirim tutar�. Bu s�tun devre d��� b�rak�ld�.
  -- [ProductStandardCost],  -- �r�n standart maliyeti. Bu s�tun devre d��� b�rak�ld�.
  -- [TotalProductCost],  -- Toplam �r�n maliyeti. Bu s�tun devre d��� b�rak�ld�.
  [SalesAmount]  -- Sat�� tutar�, sipari�in toplam tutar�n� belirtir.
  -- [TaxAmt],  -- Vergi tutar�. Bu s�tun devre d��� b�rak�ld�.
  -- [Freight],  -- Nakliye tutar�. Bu s�tun devre d��� b�rak�ld�.
  -- [CarrierTrackingNumber],  -- Ta��y�c� takip numaras�. Bu s�tun devre d��� b�rak�ld�.
  -- [CustomerPONumber],  -- M��teri sipari� numaras�. Bu s�tun devre d��� b�rak�ld�.
  -- [OrderDate],  -- Sipari� tarihi. Bu s�tun devre d��� b�rak�ld�.
  -- [DueDate],  -- Vade tarihi. Bu s�tun devre d��� b�rak�ld�.
  -- [ShipDate],  -- Kargo tarihi. Bu s�tun devre d��� b�rak�ld�.
FROM 
  [AdventureWorksDW2019].[dbo].[FactInternetSales]  -- Verilerin al�nd��� internet sat��lar� tablosu.
WHERE 
  LEFT(OrderDateKey, 4) >= YEAR(GETDATE()) - 2  -- Yaln�zca son iki y�l�n verilerini getirir.
  -- Bu, her zaman g�ncel iki y�l�n verilerini �ekmemizi sa�lar.
ORDER BY
  OrderDateKey ASC  -- Sonu�lar� sipari� tarihine g�re artan s�rada s�ralar.
