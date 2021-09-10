CREATE TABLE mart_satislar
    (
        urun_id number(10),
        musteri_isim varchar2(50),
        urun_isim varchar2(50)
    );
CREATE TABLE nisan_satislar
    (
        urun_id number(10),
        musteri_isim varchar2(50),
        urun_isim varchar2(50)
    );
    
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (20, 'John', 'Toyota');
    INSERT INTO mart_satislar VALUES (30, 'Amy', 'Ford');
    INSERT INTO mart_satislar VALUES (20, 'Mark', 'Toyota');
    INSERT INTO mart_satislar VALUES (10, 'Adem', 'Honda');
    INSERT INTO mart_satislar VALUES (40, 'John', 'Hyundai');
    INSERT INTO mart_satislar VALUES (20, 'Eddie', 'Toyota');
    INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
    INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
    INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
    INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
    INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');
    
select * from mart_satislar;
select * from nisan_satislar;

--ORNEK1: MART VE NÝSAN aylarýnda ayný URUN_ID ile satýlan ürünlerin
--URUN_ID’lerini listeleyen ve ayný zamanda bu ürünleri MART ayýnda alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazýnýz.

select urun_id,musteri_isim  FROM mart_satýslar
WHERE EXISTS(SELECT urun_id from nisan_satislar
                    where mart_satislar. urun_id=nisan_satislar. urun_id);
                    
--ORNEK2: Her iki ayda da satýlan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NÝSAN ayýnda satýn alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazýnýz.

select urun_isim, musteri_isim from nisan_satýslar n
where exists(SELECT urun_isim from mart_satislar m
            where m.urun_isim=n.urun_isim);
            
--ORNEK3: Her iki ayda da ortak olarak satýlmayan ürünlerin URUN_ISIM'lerini
--ve bu ürünleri NÝSAN ayýnda satýn alan MUSTERI_ISIM'lerini listeleyiniz.

select urun_isim,musteri_isim from nisan_satislar n
where not exists(select urun_isim from mart_satislar m
            where m.urun_isim=n.urun_isim);
            
===================== IS NULL, IS NOT NULL, COALESCE(kulesk=birleþmek) ========================
    IS NULL, ve IS NOT NULL BOOLEAN operatörleridir. Bir ifadenin NULL olup
    olmadýðýný kontrol ederler.
==============================================================================*/
    CREATE TABLE insanlar
    (
        ssn CHAR(9),
        isim VARCHAR2(50),
        adres VARCHAR2(50)
    );
    INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES('999111222');
    
    select * from insanlar;
    
    --Ornek 1-- isim i null olanlarý sorgulayýnýz
    
    select * from insanlar
    where isim IS NULL;
    
    select * from insanlar
    where adres='Bursa';
    
    --Ornek 2 --isimi null olmayanlarý sorgula
    select * from insanlar
    where isim is not null;
    
    --Ornek3--ismi null olan kiþilerin isminde NO NAME yazýsý atayýnýz
    
    UPDATE insanlar
    SET isim='NO NAME'
    WHERE isim IS NULL;
    
    SELECT COALESCE(isim,ssn, adres) from insanlar;
    

    --Ornek 4--tablodaki bütün null verileri güzerl birer cümlecikle deðiþtirin
    
    UPDATE insanlar
    SET isim=COALESCE(isim, 'henüz isim girilmedi'),
        adres=COALESCE (adres, 'henüz adres girilmedi'),
        ssn=COALESCE(ssn,'No SSN');
    
 /*   ================================ ORDER BY  ===================================
   ORDER BY cümleciði bir SORGU deyimi içerisinde belli bir SUTUN’a göre
   SIRALAMA yapmak için kullanýlýr.
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN
      ORDER BY sutun_adi DESC  -- AZALAN
=========================================*/
CREATE TABLE kisiler
    (
        ssn CHAR(9) PRIMARY KEY,
        isim VARCHAR2(50),
        soyisim VARCHAR2(50),
        maas NUMBER,
        adres VARCHAR2(50)
    );
    INSERT INTO kisiler VALUES(123456789, 'Ali','Can', 3000,'Istanbul');
    INSERT INTO kisiler VALUES(234567890, 'Veli','Cem', 2890,'Ankara');
    INSERT INTO kisiler VALUES(345678901, 'Mine','Bulut',4200,'Ankara');
    INSERT INTO kisiler VALUES(256789012, 'Mahmut','Bulut',3150,'Istanbul');
    INSERT INTO kisiler VALUES (344678901, 'Mine','Yasa', 5000,'Ankara');
    INSERT INTO kisiler VALUES (345458901, 'Veli','Yilmaz',7000,'Istanbul');
    SELECT * FROM kisiler;

---  ORNEK1: kisiler tablosunu adres'e göre sýralayarak sorgulayýnýz.
    
select * from kisiler
order by adres;

--Ornek 2-- kisiler tablosnu maasa göre ters sýralayalým

select * from kisiler
order by maas desc;

--ORNEK3: ismi Mine olanlarý, SSN'e göre AZALAN(DESC) sýrada sorgulayýnýz.

select * from kisiler
where isim='Mine'
order by ssn desc;

--ORNEK5: soyismi 'i Bulut olanlarý isim sýralý olarak sorgulayýnýz.

select * from kisiler
where soyisim='Bulut'
order by 2;  --isim yerine ismin sütun sýrasýný da yazabiliriz

/*
====================== FETCH NEXT, OFFSET (12C VE ÜSTÜ oracle larda çalýþýr, daha altsanýz çalýþmaz) ======================
   FETCH cümleciði ile listelenecek kayýtlarý sýnýrlandýrabiliriz. Ýstersek
   satýr sayýsýna göre istersek de toplam satýr sayýsýnýn belli bir yüzdesine
   göre sýnýrlandýrma koymak mümkündür. (þu kadar satýrý getir)
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   OFFSET Cümleciði ile de listenecek olan satýrlardan sýrasýyla istediðimiz
   kadarýný atlayabiliriz.
   Syntax
   ----------
   OFFSET satýr_sayisi ROWS;
==============================================================================*/
/* ----------------------------------------------------------------------------
  ORNEK1: MAAÞ'ý en yüksek 3 kiþinin bilgilerini listeleyen sorguyu yazýnýz.*/
  
  select * from kisiler
  order by maas desc
  fetch next 3 rows only;--  yeni sürümlerde çalýþýr 11den sonraki
  
  SELECT * FROM (SELECT * FROM kisiler
    ORDER BY maas DESC)--(1) kiþilerde maasa göre ters sýrala
    WHERE ROWNUM < 4;-- 1.2.ve 3. satýrý getir-- eski sürümlerde çalýþýr...
  

--ORNEK2: MAAÞ'ý en DÜÞÜK 2 kiþinin bilgilerini listeleyen sorguyu yazýnýz.
    
    select * from kisiler
    order by maas
    fetch next 2 rows only;
    
    SELECT * FROM (SELECT * FROM kisiler
    ORDER BY maas )
    WHERE ROWNUM < 3;
    
--ORNEK3: MAAÞ'a göre azalan sýralamada 4. 5. ve 6. kiþilerin bilgilerini listeleyen
--sorguyu yazýnýz.

select * from (select * from kisiler
order by maas desc )
offset 3 rows
fetch next 3 rows only;

SELECT * FROM-- eski çözüm
   (SELECT * FROM
   (SELECT *
            FROM   kisiler
            ORDER BY maas DESC)
        WHERE ROWNUM <=6)
WHERE  ROWNUM <=3;
    
                    
                    