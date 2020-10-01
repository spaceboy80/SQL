CREATE OR REPLACE PROCEDURE process_customer
( c_id IN customer.customer_id%TYPE )
IS
c_fname customer.first_name%type;
c_lname customer.last_name%type;
cursor c is --cursor declaration
SELECT first_name, last_name
FROM customer
WHERE customer_id = c_id;
BEGIN
OPEN c;
     LOOP
	FETCH c
     	INTO c_fname, c_lname;
	EXIT WHEN C%NOTFOUND;
     	dbms_output.put_line('First: ' || c_fname);
     	dbms_output.put_line('Last: ' || c_lname);
	END LOOP;
CLOSE c;
END;
/
