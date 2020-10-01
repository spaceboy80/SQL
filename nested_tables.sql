DECLARE
TYPE 
customer_type IS TABLE OF VARCHAR2(100);
customer_table customer_type := customer_type(); --collection has to be initialized
v_idx NUMBER;
BEGIN
	customer_table.EXTEND(4); --length of table has to be extended
	
	customer_table(1) := 'Mike';
	customer_table(2) := 'John';
	customer_table(3) := 'Jeff';
	customer_table(4) := 'King'; --must be sequential

	customer_table.DELETE(3);

	DBMS_OUTPUT.PUT_LINE('Customer First: ' || customer_table(customer_table.first));
	DBMS_OUTPUT.PUT_LINE('Customer Last: ' || customer_table(customer_table.last));

	v_idx := customer_table.FIRST; -- traverse dense collection

	WHILE v_idx IS NOT NULL
	LOOP
		DBMS_OUTPUT.PUT_LINE('Customer Name: ' || customer_table(v_idx));
		v_idx := customer_table.NEXT(v_idx);
	END LOOP display_loop;
END;
/
