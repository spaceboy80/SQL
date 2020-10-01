DECLARE
TYPE customer_type IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
customer_table customer_type;
v_idx NUMBER;

BEGIN

	customer_table(1) := 'MIKE';
	customer_table(2) := 'JEFF';
	customer_table(3) := 'JOHN';
	customer_table(6) := 'KING';

--	customer_table.DELETE(3);

	v_idx := customer_table.FIRST;

	WHILE v_idx IS NOT NULL
	LOOP
		DBMS_OUTPUT.PUT_LINE('Customer: ' || customer_table(v_idx));
		v_idx := customer_table.NEXT(v_idx);
	END LOOP display_loop;

END;
/
