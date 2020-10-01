CREATE OR REPLACE PROCEDURE process_customer
(c_id IN customer.customer_id%TYPE )
IS
CURSOR c 
IS
	SELECT first_name, last_name
	FROM customer
	WHERE customer_id = c_id;

	c_rec c%ROWTYPE;
BEGIN

	OPEN c;
	LOOP
		FETCH c
		INTO c_rec;
		EXIT WHEN c%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE('First: ' || c_rec.first_name);
		DBMS_OUTPUT.PUT_LINE('Last: ' || c_rec.last_name);
	END LOOP;
	CLOSE c;
END;
/
