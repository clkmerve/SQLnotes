-- data/time functions

select current_date;
select current_time;
select now();

--date_trunc

select
    bookingdate,
    date_trunc('month', bookingdate),
date_trunc('day', bookingdate),
date_trunc('year', bookingdate),
date_trunc('year', bookingdate):: date
from bookings;

--extract
select extract(YEAR FROM '2024-06-01 12:03:25':: TIMESTAMP);
select extract(DAY FROM '2024-06-01 12:03:25':: TIMESTAMP);
select extract(HOUR FROM '2024-06-01 12:03:25':: TIMESTAMP);

select
    bookingdate,
    extract(month from bookingdate)
from bookings;

-- iki tarih arasındaki fark
--INTERVAL, belirli bir süreyi (örneğin gün, ay, yıl, saat) ifade eder
select age('2022-06-03 11:30:15':: timestamp,'2022-06-01 12:40:15'::timestamp);
select '2022-06-03 11:30:15':: timestamp - '2022-06-01 12:40:15'::timestamp;
select extract(day from  '2022-06-03 11:30:15':: timestamp - '2022-06-01 12:40:15'::timestamp );

-- müşterinin son siparişi üzerinden kaç gün geçmiş

select
    bookingdate,
    current_date,
    current_date - bookingdate,
    age(current_date,bookingdate),
    extract(day from current_date - bookingdate)
from bookings;

-- date-part
select date_part('month','2022-06-01 12:30:20':: timestamp);

-- interval
select('2022-06-01'::Date + interval '1 year')::date, '2022-06-01'::date;

-- bir hafta öncesinin rezervasyon listesi
select
    to_char(bookingdate,'yyyy-mm') as booking_month,
    count(*)
from bookings
--where bookingdate >= '2021-06-01 00:00:00':: timestamp - interval '1 week'
group by 1;