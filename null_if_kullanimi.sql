select * from hr.employees;

select
    first_name,
    last_name,
    salary,
    salary_new,
    ((salary_new-salary)/ nullif(salary,0)) as raise

    from hr.employees;

--[22012] ERROR: division by zero -> veri bozuk içinde 0 var ve 0 a bölmeye çalıştığı için hata alıyoruz. null olduğu zaman bi problem yok yine null döner
-- burada bizi NULLIF kurtarır  :nullif(salary,0) salary nin 0 a eşit olduğu yeri null a çevircek