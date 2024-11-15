-- NTILE
-- bügüne 2021-05-27 tarihi dersek ve her bir müşteriyi gruplar mısın
-- buna yönelik bir pazarlama faaliyeti yapmak istiyoruz.

-- ntile(n) over (order by <order_sutunu>)

with t1 as ( select
                 id,
                 contactid,
                 bookingdate::DATE as date,
             row_number() over (partition by contactid order by bookingdate DESC ) as r_index --desc ile son siparişi 1 e yerleştirdik bana o lazım
            from travels.bookings)

select
    contactid,
    date,
    '2021-05-27':: date - date as days_since_last_booking,
    ntile(4) over (order by  '2021-05-27':: date - date  ) as group_no
from t1
where r_index= 1
order by 3

;