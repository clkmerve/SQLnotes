-- LEFT JOIN:
-- main table froma yazdığımız büyük tablo
-- froma yazdığım tüm veriler kalcak eğer diger tabloda verinin
-- karşılığı varsa onuda getirecek
-- karşılığı yoksa null dönecek ...


-- müşteriye ait siparişler (list of customer orders)
select
   company_name,
  count(order_id)  as count_order
from orders o
left join customers c on o.customer_id = c.customer_id
group by company_name
;

-- müşterilerin sipariş geçtiği toplam tutar

select count(*)
from orders; --cıktı : 830 satır - 830 siparis

select count(*)
from orders
left join order_details on orders.order_id = order_details.order_id;
-- 2155 satır

select
    company_name,
    sum (unit_price*quantity * (1-discount)) as sum_unit_quantity
from orders
left join order_details on orders.order_id = order_details.order_id
left join customers on customers.customer_id = orders.customer_id
group by company_name ;
