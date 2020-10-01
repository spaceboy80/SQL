create or replace procedure process_customer
(c_id IN customer.customer_id%type)
IS
c_rec customer%rowtype;
BEGIN
    SELECT * --customer_id, first_name, last_name 
    INTO c_rec
    from CUSTOMER
    where customer_id = c_id;

    show_customer(c_rec);
    --dbms_output.put_line('First: ' || c_rec.first_name);
    --dbms_output.put_line('Last: ' || c_rec.last_name);
END;

create or replace procedure show_customer
( customer_in IN customer%rowtype )
IS
BEGIN
    dbms_output.put_line('First: ' || customer_in.first_name);
    dbms_output.put_line('Last: ' || customer_in.last_name);
END;
/
execute process_customer(10);