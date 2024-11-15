select salary from hr.employees;

-- çalışanları maaşlara göre sırala
-- <8000 ve >=8000

-- CASE WHEN EXPRESSION

 select
     first_name,
     last_name,
     salary,
 case
     when salary < 8000 then 'Low salary'
     when salary >= 8000 and salary < 10000 then 'high salary'
     --when salary >= 10000 then 'admin'
     else 'admin'
 end as salary_segment
 from hr.employees

