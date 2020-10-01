CREATE OR REPLACE PROCEDURE update_tax (tax_rate IN NUMBER)
AS
l_eligible BOOLEAN;
TYPE orderid_type IS TABLE OF sales.order_id%TYPE INDEX BY PLS_INTEGER;
l_order_ids orderid_type;

BEGIN

	SELECT DISTINCT order_id BULK COLLECT 
	INTO l_order_ids
	FROM SALES;

	FORALL indx IN 1 .. l_order_ids.count
	       UPDATE sales s
	       SET s.tax_amount = s.total_amount * tax_rate
	       WHERE s.order_id = l_order_ids(indx);
END;
/
