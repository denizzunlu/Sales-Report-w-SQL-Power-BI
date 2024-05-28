-- Temizlenmi� DIM_Products Tablosu --
SELECT 
  p.[ProductKey],  -- Her �r�n i�in benzersiz anahtar (ID).
  p.[ProductAlternateKey] AS ProductItemCode,  -- �r�n�n alternatif anahtar�, 'ProductItemCode' olarak yeniden adland�r�ld�.
  -- [ProductSubcategoryKey],  -- �r�n alt kategori anahtar�. Bu s�tun devre d��� b�rak�ld�.
  -- [WeightUnitMeasureCode],  -- A��rl�k birim �l�� kodu. Bu s�tun devre d��� b�rak�ld�.
  -- [SizeUnitMeasureCode],  -- Boyut birim �l�� kodu. Bu s�tun devre d��� b�rak�ld�.
  p.[EnglishProductName] AS [Product Name],  -- �r�n�n �ngilizce ad�, 'Product Name' olarak yeniden adland�r�ld�.
  ps.EnglishProductSubcategoryName AS [Sub Category],  -- �r�n alt kategori ad�, alt kategori tablosundan birle�tirildi ve 'Sub Category' olarak yeniden adland�r�ld�.
  pc.EnglishProductCategoryName AS [Product Category],  -- �r�n kategori ad�, kategori tablosundan birle�tirildi ve 'Product Category' olarak yeniden adland�r�ld�.
  -- [SpanishProductName],  -- �r�n�n �spanyolca ad�. Bu s�tun devre d��� b�rak�ld�.
  -- [FrenchProductName],  -- �r�n�n Frans�zca ad�. Bu s�tun devre d��� b�rak�ld�.
  -- [StandardCost],  -- Standart maliyet. Bu s�tun devre d��� b�rak�ld�.
  -- [FinishedGoodsFlag],  -- Mamul �r�n bayra��. Bu s�tun devre d��� b�rak�ld�.
  p.[Color] AS [Product Color],  -- �r�n rengi, 'Product Color' olarak yeniden adland�r�ld�.
  -- [SafetyStockLevel],  -- G�venlik stok seviyesi. Bu s�tun devre d��� b�rak�ld�.
  -- [ReorderPoint],  -- Yeniden sipari� noktas�. Bu s�tun devre d��� b�rak�ld�.
  -- [ListPrice],  -- Liste fiyat�. Bu s�tun devre d��� b�rak�ld�.
  p.[Size] AS [Product Size],  -- �r�n boyutu, 'Product Size' olarak yeniden adland�r�ld�.
  -- [SizeRange],  -- Boyut aral���. Bu s�tun devre d��� b�rak�ld�.
  -- [Weight],  -- �r�n a��rl���. Bu s�tun devre d��� b�rak�ld�.
  -- [DaysToManufacture],  -- �retim g�n say�s�. Bu s�tun devre d��� b�rak�ld�.
  p.[ProductLine] AS [Product Line],  -- �r�n hatt�, 'Product Line' olarak yeniden adland�r�ld�.
  -- [DealerPrice],  -- Bayi fiyat�. Bu s�tun devre d��� b�rak�ld�.
  -- [Class],  -- �r�n s�n�f�. Bu s�tun devre d��� b�rak�ld�.
  -- [Style],  -- �r�n stili. Bu s�tun devre d��� b�rak�ld�.
  p.[ModelName] AS [Product Model Name],  -- �r�n model ad�, 'Product Model Name' olarak yeniden adland�r�ld�.
  -- [LargePhoto],  -- B�y�k foto�raf. Bu s�tun devre d��� b�rak�ld�.
  p.[EnglishDescription] AS [Product Description],  -- �r�n�n �ngilizce a��klamas�, 'Product Description' olarak yeniden adland�r�ld�.
  -- [FrenchDescription],  -- �r�n�n Frans�zca a��klamas�. Bu s�tun devre d��� b�rak�ld�.
  -- [ChineseDescription],  -- �r�n�n �ince a��klamas�. Bu s�tun devre d��� b�rak�ld�.
  -- [ArabicDescription],  -- �r�n�n Arap�a a��klamas�. Bu s�tun devre d��� b�rak�ld�.
  -- [HebrewDescription],  -- �r�n�n �branice a��klamas�. Bu s�tun devre d��� b�rak�ld�.
  -- [ThaiDescription],  -- �r�n�n Tayca a��klamas�. Bu s�tun devre d��� b�rak�ld�.
  -- [GermanDescription],  -- �r�n�n Almanca a��klamas�. Bu s�tun devre d��� b�rak�ld�.
  -- [JapaneseDescription],  -- �r�n�n Japonca a��klamas�. Bu s�tun devre d��� b�rak�ld�.
  -- [TurkishDescription],  -- �r�n�n T�rk�e a��klamas�. Bu s�tun devre d��� b�rak�ld�.
  -- [StartDate],  -- Ba�lang�� tarihi. Bu s�tun devre d��� b�rak�ld�.
  -- [EndDate],  -- Biti� tarihi. Bu s�tun devre d��� b�rak�ld�.
  ISNULL(p.Status, 'Outdated') AS [Product Status]  -- �r�n durumu, null ise 'Outdated' olarak atan�r ve 'Product Status' olarak yeniden adland�r�ld�.
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] AS p  -- Verilerin al�nd��� �r�n tablosu.
  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey  -- Alt kategori tablosuyla sol birle�tirme, alt kategori anahtar�na g�re.
  LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey  -- Kategori tablosuyla sol birle�tirme, kategori anahtar�na g�re.
ORDER BY 
  p.ProductKey ASC  -- �r�n anahtar�na g�re artan s�rada s�ralama.
