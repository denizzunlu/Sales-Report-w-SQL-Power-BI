-- Temizlenmiþ FACT_InternetSales Tablosu --
SELECT 
  [ProductKey],  -- Ürün anahtarý, her satýþ kaydýnda ilgili ürünü belirtir.
  [OrderDateKey],  -- Sipariþ tarihi anahtarý, sipariþin verildiði tarihi belirtir.
  [DueDateKey],  -- Vade tarihi anahtarý, sipariþin ödenmesi gereken tarihi belirtir.
  [ShipDateKey],  -- Kargo tarihi anahtarý, sipariþin gönderildiði tarihi belirtir.
  [CustomerKey],  -- Müþteri anahtarý, sipariþi veren müþteriyi belirtir.
  -- [PromotionKey],  -- Promosyon anahtarý. Bu sütun devre dýþý býrakýldý.
  -- [CurrencyKey],  -- Para birimi anahtarý. Bu sütun devre dýþý býrakýldý.
  -- [SalesTerritoryKey],  -- Satýþ bölgesi anahtarý. Bu sütun devre dýþý býrakýldý.
  [SalesOrderNumber],  -- Satýþ sipariþ numarasý, her satýþ sipariþi için benzersiz bir numara.
  -- [SalesOrderLineNumber],  -- Satýþ sipariþ satýr numarasý. Bu sütun devre dýþý býrakýldý.
  -- [RevisionNumber],  -- Revizyon numarasý. Bu sütun devre dýþý býrakýldý.
  -- [OrderQuantity],  -- Sipariþ miktarý. Bu sütun devre dýþý býrakýldý.
  -- [UnitPrice],  -- Birim fiyat. Bu sütun devre dýþý býrakýldý.
  -- [ExtendedAmount],  -- Geniþletilmiþ tutar. Bu sütun devre dýþý býrakýldý.
  -- [UnitPriceDiscountPct],  -- Birim fiyat indirim yüzdesi. Bu sütun devre dýþý býrakýldý.
  -- [DiscountAmount],  -- Ýndirim tutarý. Bu sütun devre dýþý býrakýldý.
  -- [ProductStandardCost],  -- Ürün standart maliyeti. Bu sütun devre dýþý býrakýldý.
  -- [TotalProductCost],  -- Toplam ürün maliyeti. Bu sütun devre dýþý býrakýldý.
  [SalesAmount]  -- Satýþ tutarý, sipariþin toplam tutarýný belirtir.
  -- [TaxAmt],  -- Vergi tutarý. Bu sütun devre dýþý býrakýldý.
  -- [Freight],  -- Nakliye tutarý. Bu sütun devre dýþý býrakýldý.
  -- [CarrierTrackingNumber],  -- Taþýyýcý takip numarasý. Bu sütun devre dýþý býrakýldý.
  -- [CustomerPONumber],  -- Müþteri sipariþ numarasý. Bu sütun devre dýþý býrakýldý.
  -- [OrderDate],  -- Sipariþ tarihi. Bu sütun devre dýþý býrakýldý.
  -- [DueDate],  -- Vade tarihi. Bu sütun devre dýþý býrakýldý.
  -- [ShipDate],  -- Kargo tarihi. Bu sütun devre dýþý býrakýldý.
FROM 
  [AdventureWorksDW2019].[dbo].[FactInternetSales]  -- Verilerin alýndýðý internet satýþlarý tablosu.
WHERE 
  LEFT(OrderDateKey, 4) >= YEAR(GETDATE()) - 2  -- Yalnýzca son iki yýlýn verilerini getirir.
  -- Bu, her zaman güncel iki yýlýn verilerini çekmemizi saðlar.
ORDER BY
  OrderDateKey ASC  -- Sonuçlarý sipariþ tarihine göre artan sýrada sýralar.
