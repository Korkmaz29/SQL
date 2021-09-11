/*
=============================== ALTER TABLE ==================================
    --iç kaporta için UPDATE (DML), dýþ kaporta için ALTER (DDL)
    ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS islemleri icin
    kullanilir.
    ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de
    kullanilir.
==========================================================
*/

CREATE TABLE personel1
    (
        id NUMBER(9),
        isim VARCHAR2(50),
        sehir VARCHAR2(50),
        maas NUMBER(20),
        sirket VARCHAR2(20)
    );
    INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
    INSERT INTO personel1 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
    INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
    INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
    INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel1 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
    select * from insan_kaynaklari;
/* -----------------------------------------------------------------------------
  ORNEK1: personel tablosuna ulke_isim adinda ve default degeri 'Turkiye' olan
  yeni bir sutun ekleyiniz.
------------------------------------------------------------------------------*/
alter table personel1
add ulke_isim varchar(20)
DEFAULT 'TURKIYE';

--ORNEK2: personel tablosuna cinsiyet Varchar2(20) ve yas Number(3) seklinde yeni sutunlar ekleyiniz.

alter table personel1
add (cinsiyet varchar(20),yas number(3));

--ORNEK3: personel tablosundan yas sutununu siliniz.

alter table personel1
drop column yas;


--ORNEK4: personel tablosundaki ulke_isim sutununun adini ulke_adi olarak degistiriniz.

alter table personel1
RENAME column ulke_isim TO ulke_adi;

--ORNEK5: personel tablosunun adini insan_kaynaklari olarak degistiriniz.
alter table personel1
rename to insan_kaynaklari;

--ORNEK6: isciler tablosundaki ulke_adi sutununa NOT NULL kisitlamasi ve varchar(30) ekleyiniz.

alter table insan_kaynaklari
MODIFY ulke_adi varchar(30)NOT NULL;

--maasý unique yap

alter table insan_kaynaklari
MODIFY maas UNIQUE;--tekrarlý maaþlar(4500) olduðu için unique olmaz. eþþiz olmasý lazým

--check kýsýtlamasý ekleyelim.. if gibi

alter table insan_kaynaklari
MODIFY maas CHECK (maas>3000);--bundan sonra 3000den düþük maas veremem.

