-- first_value
-- bir sütunda bulunan değerlerin ilk değerini döndürür

select
    id,
    contactid,
    bookingdate,
    first_value(bookingdate) over (partition by contactid order by bookingdate) as first_bookingDate,
    first_value(bookingdate) over (partition by contactid order by bookingdate desc ) as last_bookingDate
-- desc ile son değer başa geçmiş olcak ve ona göre sıralancak
from travels.bookings
order by 2,3;