/*=========================================  LIKE  ================================================

LIKE ==> Gibi anlamına gelir. 

Örnek:
-----
'A' ile baslayan verileri listele
'n' ile biten verileri listele
ikinci harfi 'e' olan verileri listele  

örneklerindeki işlemler için LIKE komutu kullanılır.

LIKE, sorgulama yaparken belirli pattern'leri kullanmamıza olanak verir. 

Pattern:
-------

% ==> Sıfır veya daha fazla karakteri belirtir.
_ ==> Tek bir karakteri belirtir.

Syntax:
------

SELECT * FROM tablo_adi
WHERE sutun_adi like PATTERN
====================================================================================================*/


CREATE TABLE musteriler 
(
id int UNIQUE,
isim varchar(50) NOT NULL,
maas int
);



INSERT INTO musteriler (id, isim, maas) VALUES (1001, 'Ali', 100000);  
INSERT INTO musteriler (id, isim, maas) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, maas) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, maas) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, maas) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, maas) VALUES (1006, 'ahmet', 82000);


select * from musteriler;



--SORU1: isim'i 'A' harfi ile baslayan musterilerin tum bilgilerini listeleyiniz


select * from musteriler where isim like 'A%';



--SORU2: isim'i 'a' harfi ile baslayan musterilerin tum bilgilerini listeleyiniz

select * from musteriler where isim like 'a%';



--SORU3: isim'i buyuk harf kucuk harf gözetmeksizin 'A' ile baslayan tum bilgileri listeleyiniz

select * from musteriler where isim ilike 'A%';


-- NOT: büyük harf kücük harf gözetmeksizin listelemek istersek ilike kullanırız



--SORU4: isim'i 'e' harfi ile biten tum bilgileri listeleyiniz

select * from musteriler where isim like '%e';



--SORU5: isim'i icerisinde 'er' olan tum bilgileri listeleyiniz.

select * from musteriler where isim like '%er%';



--SORU6: isim'i 5 harfli olup son 4 harfi 'atma' olan tum bilgileri listeleyiniz.

select * from musteriler where isim like '_atma';



--SORU7: isim'in 2. harfi 'a' olan tum bilgileri listeleyiniz.

select * from musteriler where isim like '_a%';



--SORU8: isim'in 3. harfi 's' olan tum bilgileri listeleyiniz.


select * from musteriler where isim like '__s%';


--SORU9: isim'in 3. harfi 's' olup 4 harfli tum bilgileri listeleyiniz.


select * from musteriler where isim like '__s_';



--SORU10: isim'in ilk harfi 'F' olup en az 4 harfli tum bilgileri listeleyiniz.

select * from musteriler where isim like 'F___%';



--SORU11: isim'in ikinci harfi 'a' olup, 4.harfi 'm' olan en az 4 harfli tum bilgilerini listeleyiniz.

select * from musteriler where isim like '_a_m%';




--SORU12: isim'i icerisinde 'i' olmayan tum bilgileri listeleyiniz.

select * from musteriler where isim not like '%i%';



/* ==================================  REGEXP_LIKE  ==========================================

   REGEXP_LIKE: Gibi anlamına gelir. Daha karmaşık sorgulama işlemi için kullanılabilir.

		   ~ isareti ile ifade edilir.


    	Syntax:
    	--------

	SELECT * FROM tablo_adi
	WHERE sutun_adi ~ PATTERN

 ========================================================================================= */


create table exercises
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
harf_sayisi int
);


INSERT INTO exercises VALUES (1001, 'hot', 3);  
INSERT INTO exercises VALUES (1002, 'hat', 3);  
INSERT INTO exercises VALUES (1003, 'hit', 3);  
INSERT INTO exercises VALUES (1004, 'hbt', 3);  
INSERT INTO exercises VALUES (1008, 'hct', 3);  
INSERT INTO exercises VALUES (1005, 'adem', 4);  
INSERT INTO exercises VALUES (1006, 'selim', 5);  
INSERT INTO exercises VALUES (1007, 'yusuf', 5);
INSERT INTO exercises VALUES (1009, 'hAt', 3); 

select * from exercises;


-- SORU1 : ilk harfi 'h', son harfi 't' olup, 2. harfi 'a' veya 'i' olan 3 harfli kelimelerin tum bilgilerini listeleyiniz.

select * from exercises where kelime ~ 'h[ai]t';




-- SORU2 : ilk harfi 'h', son harfi 't' olup, 2. harfi 'a' veya 'i' olan 3 harfli kelimeleri
--buyuk harf kucuk harf gözetmeksizin tum bilgilerini listeleyiniz.


select * from exercises where kelime ~* 'h[ai]t';


-- NOT: büyük harf kücük harf gözetmeksizin listelemek istersek ~* kullanırız





-- SORU3 : ilk harfi 'h', son harfi 't' olup, 2.harfi 'a' ile 'k' arasinda olan 3 harfli kelimelerin  tum bilgilerini listeleyiniz


select * from exercises where kelime ~ 'h[a-k]t';


-- SORU4 : ilk harfi 'a' veya 's' ile baslayan kelimelerin tum bilgilerini listeleyiniz

select * from exercises where kelime ~ '^[as]';

--NOT: ^ isareti baslayan anlamında kullanılır



-- SORU5 : son harfi 'm' veya 'f' ile biten kelimelerin tum bilgilerini listeleyiniz.

select * from exercises where kelime ~ '[mf]$';


--NOT: $ isareti biten anlamında kullanılır




-- SORU6 : son harfi 'm' veya 'f' ile bitmeyen kelimelerin tum bilgilerini listeleyiniz.


select * from exercises where kelime !~ '[mf]$';



/*
TRANSACTİON: Verileri silinmeye karşı korur.

Tabloya ekledigimiz verileri silinmeye karşı korumak istiyorsak TRANSACTION işlemi kullanılmalıdır.


Begin: Transaction'ı başlatmak için kullanılır.

Savepoint: Verileri silinmeye karşı save eder.

Rollback: Silinen verileri geri getirir.

Commit: Transaction'ı sonlandırmak için kullanılır.

*/

create table evraklar
(
id int,
onem_derecesi varchar(40),
konusu varchar(100)
);

Begin;

insert into evraklar values(100,'Çok Önemli','Saglık');
insert into evraklar values(101,'Çok Önemli','Maliye');
insert into evraklar values(102,'Çok Önemli','Nüfus');
insert into evraklar values(103,'Çok Önemli','Mezuniyet');

savepoint x;

insert into evraklar values(104,'Önemsiz','Apartman Makbuzu');
insert into evraklar values(105,'Önemsiz','Su Faturası');

select * from evraklar;

delete from evraklar;

rollback to x;

select * from evraklar;

commit;

select * from evraklar;

delete from evraklar; 