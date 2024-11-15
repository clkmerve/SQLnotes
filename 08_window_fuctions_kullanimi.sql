-- window functions: (wf) over (wSpecification)
--     hangi işlem yapılcak       nasıl oluşturulacak


-- her çalışan bilgisi ile ilgili depertmanın ortalama
-- maaş bilgisini getirin

select *
from hr.employees;

-- iki kee employees tablosuna gitmet maailiyeti arttırır
with avg_salary as (select department_id,
                           avg(salary) as d_avg_salary
                    from hr.employees
                    group by 1)

select e.first_name,
       e.department_id,
       d.department_name,
       e.salary,
       d_avg_salary
from hr.employees as e
         left join avg_salary as a_s on e.department_id = a_s.department_id
         left join hr.departments d on e.department_id = d.department_id;

select first_name,
       e.department_id,
       salary,
       avg(salary) over ()  as avg_salary,  -- tüm ortalama
       avg(salary) over (partition by e.department_id) as d_avg_salary,-- depertmana göre ort
       sum(salary) over (partition by e.department_id) as d_sum_salary
from hr.employees e
         left join hr.departments d on e.department_id = d.department_id;


--ROW NUMBER
-- her bir müşterinin siparişlerini tarih sırasına göre sırala
select
   e.employee_id,
    order_id,
    order_date,
    row_number() over (partition by e.employee_id order by order_date)
from northwind.employees e
left join northwind.orders o on e.employee_id=o.employee_id
limit 300;

-- RANK
select
    contactid,
    bookingdate,
    to_char(bookingdate, 'yyyy-mm-dd') as booking_day,
    row_number() over (partition by contactid order by to_char(bookingdate,'yyyy-mm-dd')) as row_n,
    rank() over (partition by contactid order by to_char(bookingdate,'yyyy-mm-dd')),
    dense_rank() over (partition by contactid order by to_char(bookingdate,'yyyy-mm-dd'))
from travels.bookings;