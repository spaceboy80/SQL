CREATE TABLE VH1 ( COL1 int PRIMARY KEY, COL2 varchar(3), COL3 date default SYSDATE);

CREATE TABLE MTV ( COL1 int, COL2 varchar(3) CONSTRAINT C2NNull not null, COL3 int CONSTRAINT COL3_CH check (COL3 < 2));
--CREATE INDEX idx_mtv on MTV (COL1);
--ALTER TABLE MTV add CONSTRAINT COL1PK PRIMARY KEY (COL1);
--ALTER TABLE MTV add CONSTRAINT COL2_U UNIQUE (COL2);


SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'MTV2';

CREATE TABLE MTV2 as SELECT * FROM MTV;

INSERT INTO MTV2 values (1, 2, 3);

desc mtv;
drop table mtv;
drop constraint COL2_NN;

CREATE TABLE NIC ( COL1 int,
                  COL2 varchar(3) CONSTRAINT COL2_NN1 NOT NULL,
                  COL3 NUMBER,
                  CONSTRAINT col1_pk1 PRIMARY KEY(COL1),
                  CONSTRAINT  DCONSTRAINT1 CHECK (COL3 < 100));


ALTER TABLE MTV add check constraint notveryold (SYSDATE) SYSDATE - 100; 

drop table mtv;

desc nic;

rename VH1 COL2 to COLDOS;