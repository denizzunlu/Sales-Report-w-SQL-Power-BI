-- Temizlenmi� DIM_Customers Tablosu --
SELECT 
  c.customerkey AS CustomerKey,  -- Her m��teri i�in benzersiz anahtar (ID).
  -- [GeographyKey],  -- Co�rafya anahtar�. Bu s�tun devre d��� b�rak�ld�.
  -- [CustomerAlternateKey],  -- Alternatif m��teri anahtar�. Bu s�tun devre d��� b�rak�ld�.
  -- [Title],  -- M��teri unvan� (Mr., Mrs., vb.). Bu s�tun devre d��� b�rak�ld�.
  c.firstname AS [First Name],  -- M��terinin ad�, 'First Name' olarak yeniden adland�r�ld�.
  -- [MiddleName],  -- M��terinin ikinci ad�. Bu s�tun devre d��� b�rak�ld�.
  c.lastname AS [Last Name],  -- M��terinin soyad�, 'Last Name' olarak yeniden adland�r�ld�.
  c.firstname + ' ' + lastname AS [Full Name],  -- M��terinin tam ad�, ad ve soyad birle�tirilerek 'Full Name' olarak yeniden adland�r�ld�.
  -- �lk ve soyad birle�tirildi
  -- [NameStyle],  -- �sim stili. Bu s�tun devre d��� b�rak�ld�.
  -- [BirthDate],  -- Do�um tarihi. Bu s�tun devre d��� b�rak�ld�.
  -- [MaritalStatus],  -- Medeni durum. Bu s�tun devre d��� b�rak�ld�.
  -- [Suffix],  -- �sim son eki (Jr., Sr., vb.). Bu s�tun devre d��� b�rak�ld�.
  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,  -- Cinsiyet bilgisi, 'M' i�in 'Male', 'F' i�in 'Female' olarak d�n��t�r�ld�.
  -- [EmailAddress],  -- E-posta adresi. Bu s�tun devre d��� b�rak�ld�.
  -- [YearlyIncome],  -- Y�ll�k gelir. Bu s�tun devre d��� b�rak�ld�.
  -- [TotalChildren],  -- Toplam �ocuk say�s�. Bu s�tun devre d��� b�rak�ld�.
  -- [NumberChildrenAtHome],  -- Evde ya�ayan �ocuk say�s�. Bu s�tun devre d��� b�rak�ld�.
  -- [EnglishEducation],  -- �ngilizce e�itim durumu. Bu s�tun devre d��� b�rak�ld�.
  -- [SpanishEducation],  -- �spanyolca e�itim durumu. Bu s�tun devre d��� b�rak�ld�.
  -- [FrenchEducation],  -- Frans�zca e�itim durumu. Bu s�tun devre d��� b�rak�ld�.
  -- [EnglishOccupation],  -- �ngilizce meslek bilgisi. Bu s�tun devre d��� b�rak�ld�.
  -- [SpanishOccupation],  -- �spanyolca meslek bilgisi. Bu s�tun devre d��� b�rak�ld�.
  -- [FrenchOccupation],  -- Frans�zca meslek bilgisi. Bu s�tun devre d��� b�rak�ld�.
  -- [HouseOwnerFlag],  -- Ev sahibi olma durumu. Bu s�tun devre d��� b�rak�ld�.
  -- [NumberCarsOwned],  -- Sahip olunan araba say�s�. Bu s�tun devre d��� b�rak�ld�.
  -- [AddressLine1],  -- Adres sat�r� 1. Bu s�tun devre d��� b�rak�ld�.
  -- [AddressLine2],  -- Adres sat�r� 2. Bu s�tun devre d��� b�rak�ld�.
  -- [Phone],  -- Telefon numaras�. Bu s�tun devre d��� b�rak�ld�.
  c.datefirstpurchase AS DateFirstPurchase,  -- �lk sat�n alma tarihi, 'DateFirstPurchase' olarak yeniden adland�r�ld�.
  -- [CommuteDistance],  -- ��e gidip gelme mesafesi. Bu s�tun devre d��� b�rak�ld�.
  g.city AS [Customer City]  -- Co�rafya tablosundan m��teri �ehri bilgisi, 'Customer City' olarak yeniden adland�r�ld�.
  -- Geography tablosundan m��teri �ehri eklendi.
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] AS c  -- Verilerin al�nd��� m��teri tablosu.
  LEFT JOIN dbo.dimgeography AS g ON g.geographykey = c.geographykey  -- Co�rafya tablosuyla sol birle�tirme, co�rafya anahtar�na g�re.
ORDER BY 
  CustomerKey ASC  -- M��teri anahtar�na g�re artan s�rada s�ralama.
