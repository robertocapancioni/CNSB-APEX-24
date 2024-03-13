 select d03_date_pkg.day(sysdate) dy from dual;
 select d03_date_pkg.month(sysdate) mm from dual;
 select d03_date_pkg.year(sysdate) yy from dual;

 select d03_date_pkg.datepart('DAY',sysdate) dp from dual;
 select d03_date_pkg.datefromparts(2023,1,17) dp from dual;

 select d03_date_pkg.datediff('year',sysdate,sysdate+500) dd from dual;
 select d03_date_pkg.datediff('months',sysdate,sysdate+500) dd from dual;
 select d03_date_pkg.datediff('days',sysdate,sysdate+500) dd from dual;
 select d03_date_pkg.datediff('hour',sysdate,sysdate+500) dd from dual;
 select d03_date_pkg.datediff('minutes',sysdate,sysdate+500) dd from dual;
 select d03_date_pkg.datediff('second',sysdate,sysdate+500) dd from dual;

 select
   d03_date_pkg.elapsed(
     systimestamp,
     systimestamp+numtodsinterval(123,'MINUTE')) ela
 from dual;

 with
        function datepart(part varchar2, d date)
        return varchar2 sql_macro(scalar) is
        begin
        return q'{ case
        when rtrim(upper(part),'S') = 'YEAR' then to_number(to_char(d,'YYYY'))
        when rtrim(upper(part),'S') = 'MONTH' then to_number(to_char(d,'MM'))
        when rtrim(upper(part),'S') = 'DAY' then to_number(to_char(d,'DD'))
        when rtrim(upper(part),'S') = 'HOUR' then to_number(to_char(d,'HH24'))
        when rtrim(upper(part),'S') = 'MINUTE' then to_number(to_char(d,'MI'))
        when rtrim(upper(part),'S') = 'SECOND' then to_number(to_char(d,'SS'))
        end }';
        end;
        function datefromparts(y int, m int, d int)
        return varchar2 sql_macro(scalar) is
        begin
        return q'{to_date(to_char(y,'fm0000')||to_char(m,'fm00')||to_char(d,'fm00'),'yyyymmdd')}';
        end;
select datepart('DAY',sysdate) dp, datefromparts(2024,2,25) dfp from dual;