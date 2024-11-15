-- Right join: from daki main table dan deeğil join tablodan işlem yapar
-- karışıktır
--çok kullanılmaz

select
    *
from products as p
right join categories c on p.category_id = c.category_id;
