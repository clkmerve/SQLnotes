-- LAG
-- bir müşterinin son rezervasyon tarihinden bir önceki rez. tarihini getir
-- lag(bookingdate, 1, null ) over (partition by contactid order by bookingdate) as prev_bookingdate
-- lead : bu da sonraki rez getirir.
-- ikisi birbiriniz tersi .herhangi birinde desc i kullanırsan diğerine eşit olur


select
    id,
    contactid,
    bookingdate,
    lag(bookingdate) over (partition by contactid order by bookingdate)  as prev_bookingdate,
    lead(bookingdate , 2 ) over (partition by contactid order by bookingdate)  as next_bookingdate

from travels.bookings
order by 2, 3 ;