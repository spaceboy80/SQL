 SELECT * FROM ADDSTOP;
 
 --Use of quotes flexible with quotes
 SELECT q'(This 'city' is in )' || ANAME FROM ADDSTOP;
 SELECT q'[This 'place' is ]' || ANAME FROM ADDSTOP;
 
 --Escape in quote
 SELECT * FROM ADDSTOP
 WHERE ANAME LIKE 'U/_%' ESCAPE '/'
 
 
