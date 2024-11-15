--String functions (metinsel)
--Concat
select * from hr.employees;
select
    first_name,last_name,
    concat(first_name,' ',last_name) as first_last_name_concat ,
    first_name || ' ' || last_name as first_last_name
from hr.employees
where phone_number is null;

-- concat kullanımın amacı kullanıcı benzerliklerin önüne geçmek için her veriye kendi oluşturduğu bir id yi tanımlayabilir.
    select first_name,
           concat(first_name,'_',last_name,'_',email,'_',phone_number,'_',hire_date) as unique_id
    from hr.employees;

--LEFT : verinin ilk üç verisine bakma
select phone_number,
       left(phone_number,3)
from hr.employees;

--RIGHT: verinin son değerlerine bakar
select phone_number,
       right(phone_number,3)
from hr.employees
limit 20;

select email,
       right(email,16)
from hr.employees
limit 20;

--length
select first_name,
       length(first_name) as uzunluk
from hr.employees;

-- lower / upper
select first_name,
       lower(first_name), upper(first_name)
       from hr.employees;

-- Replace : veriyi değiştirme--> veritabanında herhangi bir değişiklik yapmaz
select email,
       replace(email,'veriegitimi.com','abc.com')
       from hr.employees;

-- Split Part: verdiğimiz referansa göre kesme işlmei yapılıyor
select email,split_part(email,'@',1),split_part(email,'@',2)
from hr.employees;