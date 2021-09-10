------------SELECT WHERE------------sat�r silme

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
    
    select �s�m, adres from ogrenciler
    where adres='Ankara';
    
    --ORNEK3 : id si 124 olan ogrencilerin t�m bilgilerini sil
    
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
    INSERT INTO personel VALUES( '10002', 'Mehmet Y�lmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ay�e Can', 4000);
    SELECT * FROM personel;
    /* ======================= SELECT - IN ======================================
    IN birden fazla mant�ksal ifade ile tan�mlayabilece�imiz durumlar� 
    tek komutla yazabilme imk�n� verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_ad�
    WHERE sutun_ad� IN (deger1, deger2, ...);
/* ========================================================================== */

    
    --ORNEK4: id si 10002 ile 10005 aras�nda olan personelin bilgilerini listele
    
    --1.yontem----
    
    select * from personel
    where id between '10002' AND '10005';--ilk ve son de�er dahil
    
    
    --2.yontem-------
    
    select * from personel
    where id>='10002' and id<=10005;
    
    --ORNEK 5: Mehmet Y�lmaz ile  Veli Han aras�nda olan personel bilgilerini listele
    
    select * from personel
    where isim between 'Mehmet Y�lmaz' and 'Veli Han';
    
    --ORNEK 6: id si 10002-10004 aras�nda olmayan personeli listele
    
    select id,maas from personel
    where id not between '10002' and '10004';
    
    /* ----------SELECT-IN -------------
    
    --ORNEK 7: maa�� 4000,5000,7000 olan personelin bilgilerini listele
    
    select * from personel
    where maas IN (4000,5000,7000);
    
    select * from personel
    where isim IN('Veli Han','Ahmet Aslan');
    
    
    ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri
    kullanabilmemize olanak sa�lar.
    SYNTAX:
    -------
    SELECT sut�n1, sut�n2,�
    FROM  tablo_ad� WHERE s�tun LIKE pattern
    PATTERN ���N
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir.
    _    ---> Tek bir karakteri temsil eder.
/* ====================================================*/
    
    select * from personel
    where isim LIKE 'A%'; --ba�� A ile ba�layanlar. %A sonu a ile bitenler
    
-- ORNEK10:  ismi n harfi ile bitenleri listeleyiniz

select * from personel
where isim LIKE '%n';

-- ORNEK11:  isminin 2. harfi e olanlar� listeleyiniz

select * from personel
where isim LIKE '_e%';

-- ORNEK12:  isminin 2. harfi e olup di�er harflerinde y olanlar� listeleyiniz

select * from personel
where isim LIKE '_e%y%';

 -- ORNEK13:  ismi A ile ba�lamayanlar� listeleyiniz
 
 select * from personel
 where isim NOT LIKE 'A%';
 
 --   ORNEK15:  isminde a harfi olmayanlar� listeleyiniz
 
 select * from personel
 where isim NOT LIKE '%a%' ;
 
  --  ORNEK16:  maa��n�n son 2 hanesi 00 olmayanlar� listeleyiniz
  
  select * from personel
  where maas NOT LIKE '%00';
  
 -- ORNEK17:  maa��n�n 4000 olmayanlar� listeleyiniz
 
 select * from personel
 where maas NOT LIKE '4000';
 
 --   ORNEK18: maa�� 5 haneli olanlar� listeleyiniz
 
 select * from personel
 where maas LIKE '_____';
 
   -- ORNEK20: 1. harfi A ve 7.harfi A olan personeli listeleyiniz.
   
   select  * from personel
   where isim LIKE 'A_____A';
   
/*   ======================= SELECT - REGEXP_LIKE ================================
    Daha karma��k pattern ile sorgulama i�lemi i�in REGEXP_LIKE kullan�labilir.
    Syntax:
    --------
    REGEXP_LIKE(sutun_ad�, �pattern[] �, �c� ] )
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
    
    --ORNEK21: ��erisinde 'hi' bulunan kelimeleri listeleyeniz
    
    select * from kelimeler
    where REGEXP_LIKE (kelime, 'hi');
    
    select * from kelimeler
    where kelime LIKE '%hi%';--ikiside ayn�
    
 --   ORNEK22: ��erisinde 'ot' veya 'at' bulunan kelimeleri listele
 
 select * from kelimeler
 where REGEXP_LIKE(kelime, 'ot|at','i');-- veya i�lemi i�in | kullan�l�r.buyuk kucuk harfe duyars�z olmas� i�in 'i' konulur
 
 --ORNEK24: 'ho' veya 'hi' ile ba�layan kelimeleri b�y�k-k���k harfe dikkat etmeksizin listeleyeniz
 SELECT * FROM kelimeler
 where REGEXP_LIKE(kelime,'^ho|^hi' ,'i');--ba�lang�� oldu�unu belitmek i�in ^ i�areti kullan�l�r
 
 --ORNEK25: Sonu 't' veya 'm' ile bitenleri b�y�k-k���k harfe dikkat etmeksizin listeleyeniz
 
 select * from kelimeler
 where REGEXP_LIKE(kelime,'t$|m$','i');
 
-- ORNEK26: h ile ba�lay�p t ile biten 3 harfli kelimeleri b�y�k-k���k harfe
--dikkat etmeksizin listeleyeniz

select * from kelimeler
where REGEXP_LIKE(kelime, 'h[a-zA-Z0-9)]t','i');