-- Temizlenmiþ DIM_Customers Tablosu --
SELECT 
  c.customerkey AS CustomerKey,  -- Her müþteri için benzersiz anahtar (ID).
  -- [GeographyKey],  -- Coðrafya anahtarý. Bu sütun devre dýþý býrakýldý.
  -- [CustomerAlternateKey],  -- Alternatif müþteri anahtarý. Bu sütun devre dýþý býrakýldý.
  -- [Title],  -- Müþteri unvaný (Mr., Mrs., vb.). Bu sütun devre dýþý býrakýldý.
  c.firstname AS [First Name],  -- Müþterinin adý, 'First Name' olarak yeniden adlandýrýldý.
  -- [MiddleName],  -- Müþterinin ikinci adý. Bu sütun devre dýþý býrakýldý.
  c.lastname AS [Last Name],  -- Müþterinin soyadý, 'Last Name' olarak yeniden adlandýrýldý.
  c.firstname + ' ' + lastname AS [Full Name],  -- Müþterinin tam adý, ad ve soyad birleþtirilerek 'Full Name' olarak yeniden adlandýrýldý.
  -- Ýlk ve soyad birleþtirildi
  -- [NameStyle],  -- Ýsim stili. Bu sütun devre dýþý býrakýldý.
  -- [BirthDate],  -- Doðum tarihi. Bu sütun devre dýþý býrakýldý.
  -- [MaritalStatus],  -- Medeni durum. Bu sütun devre dýþý býrakýldý.
  -- [Suffix],  -- Ýsim son eki (Jr., Sr., vb.). Bu sütun devre dýþý býrakýldý.
  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,  -- Cinsiyet bilgisi, 'M' için 'Male', 'F' için 'Female' olarak dönüþtürüldü.
  -- [EmailAddress],  -- E-posta adresi. Bu sütun devre dýþý býrakýldý.
  -- [YearlyIncome],  -- Yýllýk gelir. Bu sütun devre dýþý býrakýldý.
  -- [TotalChildren],  -- Toplam çocuk sayýsý. Bu sütun devre dýþý býrakýldý.
  -- [NumberChildrenAtHome],  -- Evde yaþayan çocuk sayýsý. Bu sütun devre dýþý býrakýldý.
  -- [EnglishEducation],  -- Ýngilizce eðitim durumu. Bu sütun devre dýþý býrakýldý.
  -- [SpanishEducation],  -- Ýspanyolca eðitim durumu. Bu sütun devre dýþý býrakýldý.
  -- [FrenchEducation],  -- Fransýzca eðitim durumu. Bu sütun devre dýþý býrakýldý.
  -- [EnglishOccupation],  -- Ýngilizce meslek bilgisi. Bu sütun devre dýþý býrakýldý.
  -- [SpanishOccupation],  -- Ýspanyolca meslek bilgisi. Bu sütun devre dýþý býrakýldý.
  -- [FrenchOccupation],  -- Fransýzca meslek bilgisi. Bu sütun devre dýþý býrakýldý.
  -- [HouseOwnerFlag],  -- Ev sahibi olma durumu. Bu sütun devre dýþý býrakýldý.
  -- [NumberCarsOwned],  -- Sahip olunan araba sayýsý. Bu sütun devre dýþý býrakýldý.
  -- [AddressLine1],  -- Adres satýrý 1. Bu sütun devre dýþý býrakýldý.
  -- [AddressLine2],  -- Adres satýrý 2. Bu sütun devre dýþý býrakýldý.
  -- [Phone],  -- Telefon numarasý. Bu sütun devre dýþý býrakýldý.
  c.datefirstpurchase AS DateFirstPurchase,  -- Ýlk satýn alma tarihi, 'DateFirstPurchase' olarak yeniden adlandýrýldý.
  -- [CommuteDistance],  -- Ýþe gidip gelme mesafesi. Bu sütun devre dýþý býrakýldý.
  g.city AS [Customer City]  -- Coðrafya tablosundan müþteri þehri bilgisi, 'Customer City' olarak yeniden adlandýrýldý.
  -- Geography tablosundan müþteri þehri eklendi.
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] AS c  -- Verilerin alýndýðý müþteri tablosu.
  LEFT JOIN dbo.dimgeography AS g ON g.geographykey = c.geographykey  -- Coðrafya tablosuyla sol birleþtirme, coðrafya anahtarýna göre.
ORDER BY 
  CustomerKey ASC  -- Müþteri anahtarýna göre artan sýrada sýralama.
