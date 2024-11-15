-- AGGREGATE FUNCTIONS : TOPLAMA FONK
-- COUNT , SUM , MIN , MAX , AVG

select * from hr.employees
limit 20;

-- salary IS NULL OR salary = 0: Bu kısım, maaş değeri NULL ya da 0 olan kayıtları arıyor.
-- THEN 1: Eğer koşul sağlanıyorsa, yani maaş NULL veya 0 ise, 1 döner.
-- ELSE NULL: Eğer koşul sağlanmıyorsa, yani maaş değeri NULL veya 0 değilse, NULL döner.


select
    department_id,
    sum(salary) as total_salary ,-- boş değeri 0 olarak kabul eder
    count(employee_id) as total_emp,
    count(case when salary is null or salary = 0 then 1 else null end ) as null_emp, -- count da null lar 0 döner
    sum(case when salary is null or salary = 0 then 1 else null end ) as null_emp_sum, -- sum da null lar null döner
    -- aşağıdaki kod ile sum sütununu count gibi yazmaya çalışıyoruz .
    coalesce(sum(case when salary is null or salary = 0 then 1 else null end ),0) as count_to_sum,
    min(salary) as min_salary,
    max(salary) as max_salary,
ROUND(AVG(salary), 2) AS avg_salary,
min(hire_date) as min_hire,
max(hire_date) as max_hire
from hr.employees
group by department_id
order by 1;