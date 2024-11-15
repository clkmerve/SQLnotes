-- Order by kullanımı
select * from hr.employees;

-- desc = büyükten küçüğe sıralama . asc yazmaya gerek yok otomatik küçükten - büyüğe ayarlanır
select first_name,last_name,salary from hr.employees
        where employees.salary is not null
        order by salary desc
        limit 10
;