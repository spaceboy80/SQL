SELECT * FROM RAILSTOP
ORDER BY stncode --NULLS last in ASCENDING order
OFFSET 5 ROWS FETCH next 50 PERCENT ROWS ONLY --based on entire table not based on offset

SELECT * FROM RAILSTOP
ORDER BY stncode
FETCH FIRST 5 ROWS ONLY --excluding ties

SELECT * FROM RAILSTOP
ORDER BY stncode
FETCH FIRST 5 ROWS WITH TIES

