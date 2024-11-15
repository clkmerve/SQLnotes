-- müşterilerin son siparişini ve bu sipariş için ödenen kargo ücretini getir.

-- not using window function
with t1 as (select customer_id,
                   max(order_id) as last_order
            from northwind.orders
            group by 1)

select
    t1.customer_id,
    last_order,
    freight
from t1
left join northwind.orders o on t1.customer_id = o.customer_id and t1.last_order = o.order_id
order by 1
;


--using window function
with t2 as (select
                customer_id,
                order_id,
                freight,
                row_number() over (partition by customer_id order by order_id desc) as r_number
            from northwind.orders
)

select
    customer_id,
    freight
from t2
where r_number = 1
order by 1