create or replace procedure  check_eligible(p_orderid number, l_eligible out boolean)
AS
l_total number;
BEGIN
	SELECT SUM(TOTAL_AMOUNT) INTO l_total FROM SALES
	WHERE order_id = p_orderid;
	
	IF l_total >= 1000 
	THEN l_eligible:=TRUE;
	END IF;
END;
/
