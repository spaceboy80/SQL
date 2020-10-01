CREATE TABLE IDXFF (COL1 varchar(10) PRIMARY KEY);
INSERT INTO IDXFF VALUES ('ABC');
INSERT INTO IDXFF VALUES ('DEF');
INSERT INTO IDXFF VALUES ('GHI');
COMMIT;

DROP TABLE idxff;

DROP RESTORE POINT idx_0;
ALTER TABLE IDXORD DROP CONSTRAINT c_col2;

CREATE TABLE IDXORD ( COL1 INT, COL2 varchar2(10), COLX varchar2(100),
                      CONSTRAINT COL1A_PK PRIMARY KEY (COL1), 
                      CONSTRAINT numfk FOREIGN KEY (COL2) REFERENCES IDXFF(COL1) ) ENABLE ROW MOVEMENT;

CREATE RESTORE POINT pre_idx;
CREATE INDEX idxord_idx on IDXORD(COL2);
FLASHBACK TABLE IDXORD to restore point pre_idx;


INSERT INTO IDXORD (COL1, COL2) values (1, 'ABC');
INSERT INTO IDXORD (COL1, COL2) values (2, 'DEF');
INSERT INTO IDXORD (COL1, COL2) values (3, 'GHI');
COMMIT;

CREATE RESTORE POINT idx_0;


ALTER TABLE IDXORD add constraint c_col2 check (Col2 <> 'XYZ');

FLASHBACK TABLE IDXORD to restore point idx_0;

CREATE restore point idx_1;

ALTER TABLE IDXORD add col3 date;

drop restore point idx_1;

ALTER TABLE IDXORD drop COLUMN COLX;
FLASHBACK TABLE IDXORD to restore point idx_2;

DELETE FROM IDXORD;
COMMIT;

CREATE RESTORE POINT idx_3;
ALTER TABLE IDXORD modify COL2 varchar2(5);
FLASHBACK TABLE IDXORD to restore point idx_3;



SELECT * FROM THENUMBERS;

DROP TABLE IDXORD PURGE;

FLASHBACK TABLE IDXORD to before drop;

SELECT * FROM IDXORD;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION from user_constraints
WHERE TABLE_NAME = 'IDXORD';

SELECT INDEX_NAME FROM USER_INDEXES
WHERE TABLE_NAME = 'IDXORD';

desc IDXORD;