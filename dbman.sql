DECLARE
  ordernumber1 number:=102;
  --orderid number default 10;
BEGIN
  dbms_output.put_line('Hello Outside World');
  dbms_output.put_line(ordernumber1);
  --dbms_output.put_line(orderid);
 
  DECLARE --Local variable
      ordernumber2 number:=103;
    BEGIN
      dbms_output.put_line(ordernumber1);
      dbms_output.put_line(ordernumber2);
    END;
  
  
END;