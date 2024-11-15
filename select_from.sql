--SELECT öğreniyoruz
-- * = all tüm sütunlar
-- as sütun ismini verir kullanma zorunluluğu yok carpma işlemindeki gibide kullanılır  !

--SELECT country_id,country_name,region_id FROM hr.countries
SELECT * FROM countries;

-- Aritmetik Fonksiyonlar

--Toplama İşlemi
SELECT 3+5 as toplama;

--Çarpma
SELECT 5*10  carpma;

--Üstel
SELECT 5^2 as üstel;

--Metin
SELECT 'Veri Eğitimi' as metin;

--sütun adı değiştirme
-- country_id sutun adı no ile değişti
SELECT country_id as country_no FROM countries;
