-- COALESCE: ilk gördüğü dolu ise onu yazar ama boş değer varsa benim verdiğim kurala göre içini doldurmaya çalışır
select first_name,
       last_name,
       phone_number,
       phone_number_2
       from hr.employees;

select
    first_name || ' ' || last_name as first_last_name,
    phone_number,
    phone_number_2,
   -- COALESCE(phone_number,' ilk Telefon yok') as first_phone, -- null olduğu kısıma dair bir mesaj yazıyor.eğer ilk telefon varsa o değeri yazıyor
   -- COALESCE(phone_number,phone_number_2) as ilk_durum,
    COALESCE(phone_number,phone_number_2,'Telefon yok') as ikinci_durum
from hr.employees;