-- Subquery (alt sorgu)
-- CTE (Common Table Expressions - Ortak tablo ifadeleri)
-- where gittiğin tabloda filtreleme yapar
    -- having hesaplama yapar sonra filtreler
--cte nin okunabilirliği daha iyi

-- 10 dan daha az ürünü olan kategorilerin isimlerini getir
select coalesce(category_name, 'NoName'),
       count(product_id)
       from products p
left join categories c on c.category_id=p.category_id
group by category_name
having count(product_id) <= 10;


-- having kullanmak yasak
select *
from (
select coalesce(category_name, 'NoName'),
       count(product_id) product_count
       from  products p
left join categories c on c.category_id=p.category_id
group by category_name) as t
where product_count <= 10;

-- CTE -- with ile tanımlama yaptım.
-- çıktının sonucu product_count içinde tutulur.
with product_count as (
    select coalesce(category_name, 'NoName'),
         count(product_id) product_count
         from  products p
    left join categories c on c.category_id=p.category_id
    group by category_name
)

select *
from product_count
where product_count <= 10 ;

-- cte 2 -- iki koşul tanımlama tekrar with yazmak yok
with product_count as (
    select category_id,
         count(product_id) product_count
    from  products p
    group by 1
),
    category_list as (
    select category_id,category_name from categories
    )
select *
from product_count pc
left join category_list cl on pc.category_id= cl.category_id
where product_count <= 10;


-- cte 3 -- iki koşul tanımlama tekrar with yazmak yok
with product_count as (
    select category_id,
         count(product_id) product_count
    from  products p
    group by 1
),
    category_list as (
    select category_id,category_name from categories
    ),
    final as (select *
from product_count pc
left join category_list cl on pc.category_id= cl.category_id
where product_count <= 10)

select *
from final;
;
