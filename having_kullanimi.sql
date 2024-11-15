-- !!!!! having group by dan sonra orderdan önce kullanılır
    -- having : yapılan mat işleminden sonra filtreleme yapar
    -- where : başta filtreleme yapıyor


-- HAVING / WHERE Kullanımı
-- HAVING ifadesini kullanarak gruplama sonrası filtreleme yapar.
-- WHERE ifadesini kullanarak gruplama öncesi filtreleme yapar.
select * from hr.employees;

-- 5 ten fazla çalışanı bulunan depertman
select department_id,
    count(employee_id)
from hr.employees
group by 1
having  count(employee_id) >= 5
order by 1
;

-- maasi 5000 den büyük olan çalışanalrın depertmanlarına göre sayıları
select department_id,

       count(employee_id)
       from hr.employees
       where salary >= 5000
group by department_id;

select department_id,
    count(employee_id) as count_emp
from hr.employees
where salary >= 5000
group by 1
having  count(employee_id) >= 5
--önce maaşa sonra çalışan sayısına göre çıktı üretti

--NOT: having  count_emp >= 5  bu işlem postgress de çalışmaz
-- çünkü postgress tüm işlemleri yaptıktan sonra
-- sütun adını ekliyor.bazı yazılımlarda çalışır!!!!

;
