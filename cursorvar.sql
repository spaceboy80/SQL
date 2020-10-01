CREATE OR REPLACE FUNCTION get_names
(custid IN NUMBER)
RETURN SYS_REFCURSOR
IS
	l_return SYS_REFCURSOR;
BEGIN
	OPEN l_return
	FOR
	SELECT first_name, last_name
	FROM customer
	WHERE customer_id = custid;

	RETURN l_return;
END get_names;
/

CREATE OR REPLACE PROCEDURE display_names
IS
	c_rec SYS_REFCURSOR;
	fname varchar2(50);
	lname varchar2(50);
BEGIN
c_rec := get_names(10);

LOOP
	FETCH c_rec 
	INTO fname, lname;
	EXIT WHEN c_rec%NOTFOUND;
	
	DBMS_OUTPUT.PUT_LINE(FNAME);
	DBMS_OUTPUT.PUT_LINE(LNAME);
	DBMS_OUTPUT.PUT_LINE('***********');
END LOOP;

CLOSE c_rec;

END;
/
