 create or replace package d03_date_pkg
is
    function day(d date) 
      return varchar2 sql_macro(scalar);
    
    function month(d date) 
      return varchar2 sql_macro(scalar);
    
    function year(d date) 
      return varchar2 sql_macro(scalar);
    
    function datepart(part varchar2,d date) 
    return varchar2 sql_macro(scalar);

    function datefromparts(y int, m int, d int) 
      return varchar2 sql_macro(scalar);

     function datediff(part varchar2,d2 date, d1 date) 
       return varchar2 sql_macro(scalar);

     function elapsed(
       ts1 in timestamp,
       ts2 in timestamp
     ) return varchar2 sql_macro(scalar);

end d03_date_pkg;
/


  create or replace package  body d03_date_pkg
is

 function day(d date) return varchar2 sql_macro(scalar) is
 begin
    return q'{to_number(to_char(d,'DD'))}';
 end;
 
 function month(d date) return varchar2 sql_macro(scalar) is
 begin
    return q'{to_number(to_char(d,'MM'))}';
 end;
 
 function year(d date) return varchar2 sql_macro(scalar) is
 begin
    return q'{to_number(to_char(d,'YYYY'))}';
 end;
 
 function datepart(part varchar2,d date) return varchar2 sql_macro(scalar) is
 begin
    return q'{
   case
     when rtrim(upper(part),'S') = 'YEAR' then to_number(to_char(d,'YYYY'))
     when rtrim(upper(part),'S') = 'MONTH' then to_number(to_char(d,'MM'))
     when rtrim(upper(part),'S') = 'DAY' then to_number(to_char(d,'DD'))
     when rtrim(upper(part),'S') = 'HOUR' then to_number(to_char(d,'HH24'))
     when rtrim(upper(part),'S') = 'MINUTE' then to_number(to_char(d,'MI'))
     when rtrim(upper(part),'S') = 'SECOND' then to_number(to_char(d,'SS'))
   end
        }';
 end;
 
 function datefromparts(y int, m int, d int) return varchar2 sql_macro(scalar) is
 begin
    return q'{
      to_date(
        to_char(y,'fm0000')||to_char(m,'fm00')||to_char(d,'fm00'),
        'yyyymmdd'
        )
        }';
 end;

 function datediff(part varchar2,d2 date, d1 date) return varchar2 sql_macro(scalar) is
 begin
    return q'{
   case
     when rtrim(upper(part),'S') = 'YEAR' then to_number(to_char(d1,'YYYY'))-to_number(to_char(d2,'YYYY'))
     when rtrim(upper(part),'S') = 'MONTH' then months_between(d1,d2)
     when rtrim(upper(part),'S') = 'DAY' then trunc(d1-d2)
     when rtrim(upper(part),'S') = 'HOUR' then trunc(d1-d2)*24
     when rtrim(upper(part),'S') = 'MINUTE' then trunc(d1-d2)*1440
     when rtrim(upper(part),'S') = 'SECOND' then (d1-d2)*86400
   end
        }';
 end;

function elapsed(
       ts1 in timestamp,
       ts2 in timestamp
     ) return varchar2 sql_macro(scalar) is
 begin
   return q'{
     extract(day from (ts2-ts1))*86400+
     extract(hour from (ts2-ts1))*3600+
     extract(minute from (ts2-ts1))*60+
    extract(second from (ts2-ts1))
    }';
 end;

end d03_date_pkg;
/