-- JOINS: id şeklinde verilmiş değerlerin tam karşılığını bulma.
--örneğin mervenin işi 2 id diye gözüküyor 2 nin karşılığı ne

select *
from northwind.orders
limit 50;

select *
from order_details;

select *
from products;

-- INNER JOIN
-- hangi müşteri hangi siparişi vermiş ?
-- sipariş id müşteri name ,sipariş tarihi
-- not : en büyük tablo froma yazılır
select
    order_id,
    company_name,
    orders.customer_id, -- hangi tablo olduğunu belirt
    order_date
from orders -- main table
inner join customers on orders.customer_id = customers.customer_id ;

-- her ürünün ismini ve kategori ismini getir.
select
    p.product_name, -- iki tabloda da aynıysa hangi tablo olduğu belirtilmeli
    c.category_name
from products as p
inner join categories c on p.category_id = c.category_id
limit 100;
-- products a ve categoriese kısaltılmış harfler verdim ona göre isimlerimi güncelledeim
-- as yazmama gerek yoktu.


select *
from products;