-- Distinct Kullanımı : Eşsiz değerler (unique)

select * from hr.employees;


select
  count(distinct manager_id)
    from hr.employees; -- bu kullanım daha maaliyetli
-- aşağıdaki kullanım daha uygun


select manager_id,
       count(*)
from hr.employees
group by manager_id ;

select
    count(distinct manager_id),
    count(manager_id),
    count(*)
from hr.employees;