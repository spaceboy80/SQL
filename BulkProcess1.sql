CREATE OR REPLACE PROCEDURE update_tax(tax_rate IN number)
AS
l_eligible BOOLEAN;
TYPE orderid_type IS TABLE OF sales.order_id%TYPE INDEX BY PLS_INTEGER;
l_order_ids orderid_type;
l_eligible_orders orderid_type;

BEGIN

	SELECT DISTINCT order_id BULK COLLECT
	INTO l_order_ids
	FROM sales;

	FOR indx IN 1 .. l_order_ids.COUNT
    	LOOP
		check_eligible(l_order_ids (indx), l_eligible);

		IF l_eligible
		THEN l_eligible_orders (l_eligible_orders.COUNT + 1) := l_order_ids (indx);
		END IF;
	END LOOP;

COMMIT;

END;
/
