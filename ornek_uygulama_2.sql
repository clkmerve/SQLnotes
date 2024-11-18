-- aylık kümülatif navlun tutarı
-- bir öncei ayla toplanmış hali

select to_char(shipped_date, 'yyyy-mm')                              as date,
       freight,
       sum(freight) over (order by to_char(shipped_date, 'yyyy-mm')) as cum_freight
from northwind.orders
order by 1
;


select to_char(shipped_date, 'yyyy-mm')                                   as date,
       sum(freight)                                                       as sum_freight,
       sum(sum(freight)) over (order by to_char(shipped_date, 'yyyy-mm')) as cum_freight
from northwind.orders
group by 1
order by 1
;