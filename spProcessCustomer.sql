CREATE OR REPLACE PROCEDURE process_customer
( c_id IN customer.customer_id%TYPE)
IS
TYPE CUSTOMER_REC IS RECORD
(FIRST_NAME VARCHAR2(50), LAST_NAME VARCHAR2(50) );
c_rec CUSTOMER_REC; --composite record datatype
total_rows number;
BEGIN
	SELECT first_name, last_name
	INTO c_rec
	FROM customer
	WHERE customer_id = c_id;
	
	IF sql%found 
	THEN total_rows := sql%rowcount;
	DBMS_OUTPUT.PUT_LINE( total_rows || ' customers selected');
	END IF;

	DBMS_OUTPUT.PUT_LINE('First: '|| c_rec.first_name);
	DBMS_OUTPUT.PUT_LINE('Last: ' ||c_rec.last_name);
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

SET SERVEROUTPUT ON;
EXECUTE PROCESS_CUSTOMER(11);

SELECT * FROM CUSTOMER;
