create procedure DBA.dw_property_test(in id integer)
result(id integer,company_name char(35))
begin select id,company_name from customer where id = id end;
