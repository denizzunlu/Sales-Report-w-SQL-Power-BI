-- Temizlenmiþ DIM_Products Tablosu --
SELECT 
  p.[ProductKey],  -- Her ürün için benzersiz anahtar (ID).
  p.[ProductAlternateKey] AS ProductItemCode,  -- Ürünün alternatif anahtarý, 'ProductItemCode' olarak yeniden adlandýrýldý.
  -- [ProductSubcategoryKey],  -- Ürün alt kategori anahtarý. Bu sütun devre dýþý býrakýldý.
  -- [WeightUnitMeasureCode],  -- Aðýrlýk birim ölçü kodu. Bu sütun devre dýþý býrakýldý.
  -- [SizeUnitMeasureCode],  -- Boyut birim ölçü kodu. Bu sütun devre dýþý býrakýldý.
  p.[EnglishProductName] AS [Product Name],  -- Ürünün Ýngilizce adý, 'Product Name' olarak yeniden adlandýrýldý.
  ps.EnglishProductSubcategoryName AS [Sub Category],  -- Ürün alt kategori adý, alt kategori tablosundan birleþtirildi ve 'Sub Category' olarak yeniden adlandýrýldý.
  pc.EnglishProductCategoryName AS [Product Category],  -- Ürün kategori adý, kategori tablosundan birleþtirildi ve 'Product Category' olarak yeniden adlandýrýldý.
  -- [SpanishProductName],  -- Ürünün Ýspanyolca adý. Bu sütun devre dýþý býrakýldý.
  -- [FrenchProductName],  -- Ürünün Fransýzca adý. Bu sütun devre dýþý býrakýldý.
  -- [StandardCost],  -- Standart maliyet. Bu sütun devre dýþý býrakýldý.
  -- [FinishedGoodsFlag],  -- Mamul ürün bayraðý. Bu sütun devre dýþý býrakýldý.
  p.[Color] AS [Product Color],  -- Ürün rengi, 'Product Color' olarak yeniden adlandýrýldý.
  -- [SafetyStockLevel],  -- Güvenlik stok seviyesi. Bu sütun devre dýþý býrakýldý.
  -- [ReorderPoint],  -- Yeniden sipariþ noktasý. Bu sütun devre dýþý býrakýldý.
  -- [ListPrice],  -- Liste fiyatý. Bu sütun devre dýþý býrakýldý.
  p.[Size] AS [Product Size],  -- Ürün boyutu, 'Product Size' olarak yeniden adlandýrýldý.
  -- [SizeRange],  -- Boyut aralýðý. Bu sütun devre dýþý býrakýldý.
  -- [Weight],  -- Ürün aðýrlýðý. Bu sütun devre dýþý býrakýldý.
  -- [DaysToManufacture],  -- Üretim gün sayýsý. Bu sütun devre dýþý býrakýldý.
  p.[ProductLine] AS [Product Line],  -- Ürün hattý, 'Product Line' olarak yeniden adlandýrýldý.
  -- [DealerPrice],  -- Bayi fiyatý. Bu sütun devre dýþý býrakýldý.
  -- [Class],  -- Ürün sýnýfý. Bu sütun devre dýþý býrakýldý.
  -- [Style],  -- Ürün stili. Bu sütun devre dýþý býrakýldý.
  p.[ModelName] AS [Product Model Name],  -- Ürün model adý, 'Product Model Name' olarak yeniden adlandýrýldý.
  -- [LargePhoto],  -- Büyük fotoðraf. Bu sütun devre dýþý býrakýldý.
  p.[EnglishDescription] AS [Product Description],  -- Ürünün Ýngilizce açýklamasý, 'Product Description' olarak yeniden adlandýrýldý.
  -- [FrenchDescription],  -- Ürünün Fransýzca açýklamasý. Bu sütun devre dýþý býrakýldý.
  -- [ChineseDescription],  -- Ürünün Çince açýklamasý. Bu sütun devre dýþý býrakýldý.
  -- [ArabicDescription],  -- Ürünün Arapça açýklamasý. Bu sütun devre dýþý býrakýldý.
  -- [HebrewDescription],  -- Ürünün Ýbranice açýklamasý. Bu sütun devre dýþý býrakýldý.
  -- [ThaiDescription],  -- Ürünün Tayca açýklamasý. Bu sütun devre dýþý býrakýldý.
  -- [GermanDescription],  -- Ürünün Almanca açýklamasý. Bu sütun devre dýþý býrakýldý.
  -- [JapaneseDescription],  -- Ürünün Japonca açýklamasý. Bu sütun devre dýþý býrakýldý.
  -- [TurkishDescription],  -- Ürünün Türkçe açýklamasý. Bu sütun devre dýþý býrakýldý.
  -- [StartDate],  -- Baþlangýç tarihi. Bu sütun devre dýþý býrakýldý.
  -- [EndDate],  -- Bitiþ tarihi. Bu sütun devre dýþý býrakýldý.
  ISNULL(p.Status, 'Outdated') AS [Product Status]  -- Ürün durumu, null ise 'Outdated' olarak atanýr ve 'Product Status' olarak yeniden adlandýrýldý.
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] AS p  -- Verilerin alýndýðý ürün tablosu.
  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey  -- Alt kategori tablosuyla sol birleþtirme, alt kategori anahtarýna göre.
  LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey  -- Kategori tablosuyla sol birleþtirme, kategori anahtarýna göre.
ORDER BY 
  p.ProductKey ASC  -- Ürün anahtarýna göre artan sýrada sýralama.
