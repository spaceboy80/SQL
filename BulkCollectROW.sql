CREATE OR REPLACE PROCEDURE fetch_sales_cur (s_date DATE)
AS
CURSOR sale_cursor
IS
	SELECT sales_date, order_id, product_id, customer_id
	FROM sales
	WHERE sales_date = s_date;

TYPE l_salestable IS TABLE of sales%ROWTYPE;
l_sales l_salestable;

BEGIN

OPEN sale_cursor;

LOOP
	FETCH sale_cursor BULK COLLECT INTO l_sales
	LIMIT 100;

	FOR indx in 1 .. l_sales.count
    	    LOOP
	    DBMS_OUTPUT.PUT_LINE(l_sales(indx).sales_date);
	    DBMS_OUTPUT.PUT_LINE(l_sales(indx).order_id);
	    DBMS_OUTPUT.PUT_LINE(l_sales(indx).product_id);
	    DBMS_OUTPUT.PUT_LINE(l_sales(indx).customer_id);
	    END LOOP;

	EXIT WHEN sale_cursor%NOTFOUND;

END LOOP;

CLOSE sale_cursor;

END;
/
