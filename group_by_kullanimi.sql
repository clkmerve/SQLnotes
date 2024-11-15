-- AGGREGATE FUNCTIONS : TOPLAMA FONK
-- COUNT , SUM , MIN , MAX , AVG

-- COUNT : satirlari sayiyoruz
select * from hr.employees;
select count(*)
from hr.employees;
--40

select count(phone_number)  -- boş değerleri saymaz
from hr.employees;
--34

select count(*) from hr.employees
where phone_number is null ;

--soru : tüm çalışan sayısını ve 9000 dolardan fazla kazanan kişi sayısını ve oranını bul.
select count(*) as total_emp,
    count(case when salary >= 9000 then 1 else null end) as high_earners, -- kosulu saglayana 1 değeri veriliyor sağlamayana null ve daha sonra count ile bu birler sayılıyor.
    count(case when salary >= 9000 then 1 else null end)*1.0 / count(*) as ratio
from hr.employees
;

--departman bazında çalısan sayısını bul.
select
    department_id,
    count(employee_id)

from hr.employees
where department_id in (3,4,5)
group by 1
order by 1

;

select
    department_id,
    manager_id,
    count(employee_id) as count_emp
    from hr.employees
group by department_id, manager_id  -- GROUP BY 1, 2 = GROUP BY department_id, manager_id
order by 1;