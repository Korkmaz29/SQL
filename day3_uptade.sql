-------UPDATE SET------------
/*
Aþaðýdaki gibi tedarikciler adýnda bir tablo oluþturunuz ve vergi_no
   sutununu primary key yapýnýz. Ayrýca aþaðýdaki verileri tabloya giriniz.
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
	INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
	INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
    Sonrasýnda aþaðýdaki gibi urunler adýnda bir baþka tablo oluþturunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutunu
    iliþkilendiriniz. Verileri giriniz.
    ted_vergino NUMBER(3),
    urun_id NUMBER(11),
    urun_isim VARCHAR2(50),
    musteri_isim VARCHAR2(50),
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayþe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yýlmaz');*/
    
    create table tedarikciler1(
    
    vergi_no NUMBER(3) PRIMARY KEY,
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50)
    );
    
    INSERT INTO tedarikciler1 VALUES (101, 'IBM', 'Kim Yon');
	INSERT INTO tedarikciler1 VALUES (102, 'Huawei', 'Çin Li');
	INSERT INTO tedarikciler1 VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler1 VALUES (104, 'Apple', 'Adam Eve');
    
    create table urunler1(
    ted_vergino NUMBER(3),
    urun_id NUMBER(11),
    urun_isim VARCHAR2(50),
    musteri_isim VARCHAR2(50),
    CONSTRAINT urunler_fk FOREIGN KEY(ted_vergino)REFERENCES tedarikciler1 (vergi_no)
    );
    
    INSERT INTO urunler1 VALUES(101, 1001,'Laptop', 'Ayþe Can');
    INSERT INTO urunler1 VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler1 VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler1 VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler1 VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler1 VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler1 VALUES(104, 1007,'Phone', 'Aslan Yýlmaz');
    select * from urunler1;
    select * from tedarikciler1;
    
    --SYNTAX 
    -----
    --UPDATE tablo_adi
    --SET sutun1=yeni_deger, sutun=yeni_deger2
    --WHERE koþul;
    
    --ORNEK : Vergi nosu 101 olan tedarikcinin firmaismini 'LG' olarak guncelleyin
    
    UPDATE tedarikciler1 
    SET firma_ismi='LG'
    WHERE vergý_no=101;
    
    select * from tedarikciler1;
    
    --ORNEK 2: tedarikciler tablosundaki tðm firma isimlerini samsung olark guncelle
    
    UPDATE tedarikciler1
    SET fýrma_ismi='Samsung';--yer belirtmezsek (where ile)tüm firma isimlerini deðiþtirir
    
        select * from tedarikciler1;
        
        --ORNEK 3: vergi_no’su 102 olan tedarikcinin ismini 'Samsung' ve irtibat_ismi’ni
  --'Ali Veli' olarak güncelleyeniz.
  
  UPDATE tedarikciler1
  SET firma_ismi='LENOVO',irtibat_ismi='Ali Veli'
  WHERE vergi_no=102;
  
          select * from tedarikciler1;
          
--ORNEK 4: firma ismi samsung olan tedarikcilerin  irtibat ismini ayþe yýlmaz yapýnýz

UPDATE tedarikciler1
SET irtibat_ismi='Ayþe Yýlmaz'
WHERE firma_ismi='Samsung';

select * from tedarikciler1;

--ORNEK 6: urunler tablosundaki urun_id deðeri 1004'ten büyük olanlarýn urun_id
          --deðerlerini bir arttýrýnýz
  
  UPDATE urunler1
  SET urun_ýd=urun_id+1
  WHERE urun_ýd>1004;
  select * from urunler1;
  
  
--ORNEK 6 : urunler tablosundaki tüm ürünlerin urun_id deðerini ted_vergino
            --sutun deðeri ile toplayarak güncelleyiniz.
            
UPDATE urunler1
SET urun_ýd=urun_id+ted_vergino;
            
select * from urunler1;

--ORNEK 7 : urunler tablosundan Ali Bak’in aldigi urunun ismini, TEDARÝKCÝ
 --TABLOSUNDA ÝRTÝBAT_ÝSMÝ 'Adam Eve' OLAN FÝRMANIN ÝSMÝ (FÝRMA_ÝSMÝ) ile
 --degistiriniz.
 
 UPDATE urunler1
 SET urun_ýsým=(SELECT firma_ismi FROM tedarikciler1 WHERE irtibat_ismi='Adam Eve')
 WHERE musterý_ýsým='Ali Bak';
 select * from urunler1;
 
 --ORNEK 8: Laptop satýn alan müsterilerin ismini Appleýn irtibat_isimi ile deðiþtirin
 
 UPDATE urunler1
SET musteri_isim=(SELECT irtibat_ismi FROM tedarikciler1 WHERE firma_ismi='Apple')
WHERE urun_isim='Laptop';
select * from urunler1;

 

 

            
  






    
    