------------SELECT WHERE------------satýr silme

CREATE TABLE ogrenciler
    (
        id NUMBER(9),
        isim VARCHAR2(50),
        adres VARCHAR2(100),
        sinav_notu NUMBER(3)
    );
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);
    
    select * from ogrenciler;
    
    --ORNEK1: sinav notu 80den buyuk olan tum ogrencilerin bilgilerini listele
    
    select * from ogrenciler 
    where sinav_notu >80;
    
    --ORNEK2 : Adresi ankara olan ogrencilerin isim ve adres bilgilerini listele
    
    select ýsým, adres from ogrenciler
    where adres='Ankara';
    
    --ORNEK3 : id si 124 olan ogrencilerin tüm bilgilerini sil
    
    delete from ogrenciler
    where id=124;
    
    -----------select -BETWEEN------------------
    
    CREATE TABLE personel
    (
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yýlmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayþe Can', 4000);
    SELECT * FROM personel;
    /* ======================= SELECT - IN ======================================
    IN birden fazla mantýksal ifade ile tanýmlayabileceðimiz durumlarý 
    tek komutla yazabilme imkâný verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adý
    WHERE sutun_adý IN (deger1, deger2, ...);
/* ========================================================================== */

    
    --ORNEK4: id si 10002 ile 10005 arasýnda olan personelin bilgilerini listele
    
    --1.yontem----
    
    select * from personel
    where id between '10002' AND '10005';--ilk ve son deðer dahil
    
    
    --2.yontem-------
    
    select * from personel
    where id>='10002' and id<=10005;
    
    --ORNEK 5: Mehmet Yýlmaz ile  Veli Han arasýnda olan personel bilgilerini listele
    
    select * from personel
    where isim between 'Mehmet Yýlmaz' and 'Veli Han';
    
    --ORNEK 6: id si 10002-10004 arasýnda olmayan personeli listele
    
    select id,maas from personel
    where id not between '10002' and '10004';
    
    /* ----------SELECT-IN -------------
    
    --ORNEK 7: maaþý 4000,5000,7000 olan personelin bilgilerini listele
    
    select * from personel
    where maas IN (4000,5000,7000);
    
    select * from personel
    where isim IN('Veli Han','Ahmet Aslan');
    
    
    ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri
    kullanabilmemize olanak saðlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adý WHERE sütun LIKE pattern
    PATTERN ÝÇÝN
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir.
    _    ---> Tek bir karakteri temsil eder.
/* ====================================================*/
    
    select * from personel
    where isim LIKE 'A%'; --baþý A ile baþlayanlar. %A sonu a ile bitenler
    
-- ORNEK10:  ismi n harfi ile bitenleri listeleyiniz

select * from personel
where isim LIKE '%n';

-- ORNEK11:  isminin 2. harfi e olanlarý listeleyiniz

select * from personel
where isim LIKE '_e%';

-- ORNEK12:  isminin 2. harfi e olup diðer harflerinde y olanlarý listeleyiniz

select * from personel
where isim LIKE '_e%y%';

 -- ORNEK13:  ismi A ile baþlamayanlarý listeleyiniz
 
 select * from personel
 where isim NOT LIKE 'A%';
 
 --   ORNEK15:  isminde a harfi olmayanlarý listeleyiniz
 
 select * from personel
 where isim NOT LIKE '%a%' ;
 
  --  ORNEK16:  maaþýnýn son 2 hanesi 00 olmayanlarý listeleyiniz
  
  select * from personel
  where maas NOT LIKE '%00';
  
 -- ORNEK17:  maaþýnýn 4000 olmayanlarý listeleyiniz
 
 select * from personel
 where maas NOT LIKE '4000';
 
 --   ORNEK18: maaþý 5 haneli olanlarý listeleyiniz
 
 select * from personel
 where maas LIKE '_____';
 
   -- ORNEK20: 1. harfi A ve 7.harfi A olan personeli listeleyiniz.
   
   select  * from personel
   where isim LIKE 'A_____A';
   
/*   ======================= SELECT - REGEXP_LIKE ================================
    Daha karmaþýk pattern ile sorgulama iþlemi için REGEXP_LIKE kullanýlabilir.
    Syntax:
    --------
    REGEXP_LIKE(sutun_adý, ‘pattern[] ‘, ‘c’ ] )
             -- 'c' => case-sentisitive demektir ve default case-sensitive aktiftir.
     -- 'i' => incase-sentisitive demektir.
/* ========================================================================== */
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    DROP TABLE kelimeler;
    
    --ORNEK21: Ýçerisinde 'hi' bulunan kelimeleri listeleyeniz
    
    select * from kelimeler
    where REGEXP_LIKE (kelime, 'hi');
    
    select * from kelimeler
    where kelime LIKE '%hi%';--ikiside ayný
    
 --   ORNEK22: Ýçerisinde 'ot' veya 'at' bulunan kelimeleri listele
 
 select * from kelimeler
 where REGEXP_LIKE(kelime, 'ot|at','i');-- veya iþlemi için | kullanýlýr.buyuk kucuk harfe duyarsýz olmasý için 'i' konulur
 
 --ORNEK24: 'ho' veya 'hi' ile baþlayan kelimeleri büyük-küçük harfe dikkat etmeksizin listeleyeniz
 SELECT * FROM kelimeler
 where REGEXP_LIKE(kelime,'^ho|^hi' ,'i');--baþlangýç olduðunu belitmek için ^ iþareti kullanýlýr
 
 --ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat etmeksizin listeleyeniz
 
 select * from kelimeler
 where REGEXP_LIKE(kelime,'t$|m$','i');
 
-- ORNEK26: h ile baþlayýp t ile biten 3 harfli kelimeleri büyük-küçük harfe
--dikkat etmeksizin listeleyeniz

select * from kelimeler
where REGEXP_LIKE(kelime, 'h[a-zA-Z0-9)]t','i');