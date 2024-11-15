-- full outer join : bütün veriyi birleştirme
-- her iki tablodaki boş değerleride gösteririr
-- eksik veri kalmaz
-- veri kontrolünde kullanılır

select count(*)
from orders; -- 830

select *
from employees;

select count(*)
from orders
full outer join employees on orders.employee_id = employees.employee_id;
--831

select *
from orders
full outer join employees on orders.employee_id = employees.employee_id
where orders.employee_id is null ;


-- cross join : satır sayısına göre çoklama olur.
select *
from orders
cross join employees;

