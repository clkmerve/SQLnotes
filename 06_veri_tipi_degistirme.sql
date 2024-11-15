-- veri tipi değiştirme (changing data type )
-- cast

-- en fazla rezervasyon yapılan tarih
-- postgress de cast(bookingdate as date) işlemini şöylede yapabiliriz
-- bookingdate::date
select
    cast(bookingdate as date),
    count(*)
from bookings
group by 1
order by 2 desc;

-- string int çevirme
select cast('555' as integer),'55';
select cast(123 as text);
select cast('hello' as varchar(7));--sınırdan küçükse o kadar yer kaplar
select cast('hello' as char(10)); -- sınır verdiğim kadar yer kaplar
select cast('true' as boolean);
select cast('2024-08-31' as date),'2024-08-31';
select cast('2024-08-31 15:30:00' as timestamp);

-- to_char
select
    bookingdate,
    bookingdate::date,
    to_char(bookingdate,'YYYY-MM'),
    to_char(bookingdate,'MM')
from bookings
limit 20;