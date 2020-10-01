CREATE OR REPLACE PROCEDURE process_customer
( c_id IN customer.customer_id%TYPE)
IS
TYPE CUSTOMER_REC IS RECORD
(first_name VARCHAR2(50), last_name VARCHAR2(50) );
--c_rec customer%rowtype; --composite record datatype
BEGIN
	SELECT first_name, last_name
	INTO c_rec
	FROM customer
	WHERE customer_id = c_id;
	
	DBMS_OUTPUT.PUT_LINE('First: ' c_rec.first_name);
	DBMS_OUTPUT.PUT_LINE('Last: ' c_rec.last_name);
	--c_rec.first_name := 'sonu';
	
	--show_customer(c_rec);
END;
/

/*
CREATE OR REPLACE PROCEDURE show_customer
(customer_in IN customer%ROWTYPE) --Identical as c_rec
IS
BEGIN
	--INSERT INTO CUSTOMER VALUES CUSTOMER_IN;
	UPDATE customer SET ROW = customer_in 
	WHERE customer_id = customer_in.customer_id;
	COMMIT;
END;
/
*/

EXECUTE PROCESS_CUSTOMER(11);

SELECT * FROM CUSTOMER;
