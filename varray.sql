DECLARE 
TYPE customer_type IS VARRAY(4) OF VARCHAR2(100);
customer_table customer_type := customer_type(); --intialize collection
v_idx NUMBER;

BEGIN
	--Must extend table first, all inserts are sequential
	customer_table.EXTEND(4); 
	customer_table(1) := 'Mike';
	customer_table(2) := 'Jeff';
	customer_table(3) := 'John';
	customer_table(4) := 'King';
	
	--cannot delete an item

	v_idx := customer_table.FIRST;

	WHILE v_idx IS NOT NULL
	LOOP
		DBMS_OUTPUT.PUT_LINE('Customer: ' || customer_table(v_idx));
		v_idx := customer_table.NEXT(v_idx);
	END LOOP display_loop;
END;
/


