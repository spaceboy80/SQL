CREATE OR REPLACE PROCEDURE process_customer
( c_id IN customer.customer_id%TYPE)
IS
BEGIN

	FOR c_rec 
	in 
	( 
	  SELECT first_name, last_name 
	  FROM customer
	  WHERE customer_id = c_id)
	  
	  LOOP
		DBMS_OUTPUT.PUT_LINE('First: ' || c_rec.first_name);
		DBMS_OUTPUT.PUT_LINE('Last: ' || c_rec.last_name);
		DBMS_OUTPUT.PUT_LINE('-------');
	 END LOOP;
END;
/
	 
