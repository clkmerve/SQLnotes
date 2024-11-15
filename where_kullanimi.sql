-- Filtreleme işlemleri
--NOT: int türünden olan değerler sütunlarda sağa yaslı olur.string türünde olsaydı sola yaslanmış olurdu.
SELECT
    first_name,last_name,salary
from hr.employees
where salary = 6000;

--Büyüktür işlemi
SELECT
    first_name,last_name,salary
from hr.employees
where salary >= 6000;

--eşit değildir işlemi <> ve != işlemleri kullanılır
SELECT
    first_name,last_name,salary
from hr.employees
where salary <> 6000;

--telefon numarası null olanları getirme
Select
    first_name,last_name,phone_number
from hr.employees
where phone_number is null;

--telefon numarası null olmayanları ve maaş kriteri getirme and koşulu
Select * from hr.employees
where phone_number is not null --true olanları döner boş olan false dır ekrana gelmez
and salary >= 10000 -- and olduğu için iki durumunda sağlandığı verileri getirdi
;

--telefon numarası null olmayanları ve maaş kriteri getirme or koşulu
Select * from hr.employees
where phone_number is not null --true olanları döner boş olan false dır ekrana gelmez
or salary >= 10000 -- or olduğu için iki durumda ayrı olarak sağlandığı verileri getirdi
;

--depertmanı 3 veya 5 olanları getirme
select * from hr.employees
where department_id=3 or department_id= 5;
-- in kullanımı (yukarıdaki ile aynı )
select * from hr.employees
where department_id in (3,5);

--iki tarih arasındaki verileri
select * from hr.employees
where hire_date between '1997-01-01' and '1998-01-01';

--ismi j ile başlayanları getirme
select * from hr.employees
where first_name ilike 'JO%n';
--postgresde büyük küçük yazı duyarlılığını ortadan kaldırmak için 'ilike' kullanılır!