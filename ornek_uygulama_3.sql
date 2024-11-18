-- aylık satışların yıllık satıslara oranini hesaplayiniz.

select
    EXTRACT(year from o.order_date) as year,
    extract(month from o.order_date) as month,
    sum(unit_price * quantity * (1- discount)) as total_monthly_revenue,
    sum(sum(unit_price * quantity * (1- discount))) over (partition by EXTRACT(year from o.order_date)) as total_yearly_revenue,
   100 *  sum(unit_price * quantity * (1- discount)) /   sum(sum(unit_price * quantity * (1- discount))) over (partition by EXTRACT(year from o.order_date)) as percentage_of_annual_sales
from northwind.order_details od
left join northwind.orders o on od.order_id = o.order_id
group by 1,2
order by 1,2;