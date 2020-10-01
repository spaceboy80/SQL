SET SERVEROUTPUT on
declare x varchar2(20);

BEGIN
  x := '&input';
  DBMS_OUTPUT.PUT_LINE(x);
END;

