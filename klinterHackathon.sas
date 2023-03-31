LIBNAME teamref '/export/viya/homes/marcusphotoliles@gmail.com/data';

PROC SQL; * Code executes and runs on SAS Server using ProcSQL ;


* For code to run in SAS using GitHub, download the 'SAS' Extension. ;

CREATE TABLE teamref.GENERAL(
SERIAL_NO int,
MATERIAL_PO smallint,
EQUIPMENT_ID int,
MANUFACTURER varchar(30),
EPC_NO varchar(34),
SNMP_TOKEN varchar(128),
ACTIVITY_ID varchar(50)
);

INSERT INTO teamref.GENERAL
VALUES (1,1,8896445922,'Tagcat','16e7e3c86f2d966c6fc2b2d8cb0146ea','11.136.66.28','7-100 - Damproofing and Waterproofing')
VALUES (2,1,1713765551,'Vinder','1df34965beba232089078154f5c58574','2.173.141.119','2-625 - Retaining Wall Drainage Piping')
VALUES (3,0,4586149221,'Omba','f16bf34d7cb6414315f5ffbaf84041c3','171.90.163.68','13-260 - Sludge Conditioning Systems')
VALUES (4,0,6752521468,'Divape','9562152349d67b62c8073c7412d0312e','133.192.83.143','15-200 - Process Piping')
VALUES (5,0,0384443575,'Voonix','b9a41b1a5bffbb7d7dc6f346b68146ed','142.81.68.233','9-600 - Flooring')
VALUES (6,0,4965364163,'Photojam','cee4e5efc92dc23ff2d68d82bf68d600','182.34.205.236','1-530 - Temporary Construction')
VALUES (7,0,8806156691,'Rhynyx','ea72238d709dd88911bf41a5cd203d38','197.136.85.223','11-050 - Library Equipment')
VALUES (8,1,3573402445,'Wikizz','bee98925b520f4fce25c7b7ea52a3c5b','209.218.86.251','10-750 - Telephone Specialties')
VALUES (9,1,9942900861,'Janyx','f89c9b418c9f067eb5436fd15e43350a','207.142.0.216','2-823 - PVC Fences and Gates')
VALUES (10,0,4151283307,'Kwilith','421525f3d625911a95a4bef8283a97ee','223.170.137.108','9-100 - Metal Support Assemblies');

CREATE TABLE teamref.MATERIAL(
SERIAL_NO int,
MATERIAL_PO smallint,
MATERIAL_PO_DATE date,
MATERIAL_NO int,
MANUFACTURER varchar(30),
EQUIPMENT_ID int
);

INSERT INTO teamref.MATERIAL
VALUES (1,1,'25Jan2022'd,201627365,'Feedbug',900450273)
VALUES (2,1,'29Aug2022'd,557216435,'Browsedrive',38942752)
VALUES (3,0,'09Jan2023'd,162513977,'Mynte',960620889)
VALUES (4,1,'12Jan2023'd,734818448,'Oyoloo',305976417)
VALUES (5,0,'25Jul2022'd,414426546,'Fadeo',337458959)
VALUES (6,0,'23May2022'd,377767445,'Ozu',348588449)
VALUES (7,0,'06Sep2022'd,907707586,'Skaboo',400399229)
VALUES (8,0,'10Aug2022'd,243885486,'Skipstorm',219488739)
VALUES (9,1,'09Aug2022'd,837505753,'Demimbu',303907434)
VALUES (10,0,'02Apr2022'd,244211963,'Avaveo',663359900);

UPDATE teamref.MATERIAL 
    SET MATERIAL_PO = (SELECT MATERIAL_PO
                   FROM teamref.GENERAL
                   WHERE MATERIAL.SERIAL_NO = GENERAL.SERIAL_NO
                  )
    WHERE EXISTS (SELECT MATERIAL_PO
                   FROM teamref.GENERAL
                   WHERE MATERIAL.SERIAL_NO = GENERAL.SERIAL_NO);

UPDATE teamref.MATERIAL 
    SET MANUFACTURER = (SELECT MANUFACTURER
                   FROM teamref.GENERAL
                   WHERE MATERIAL.SERIAL_NO = GENERAL.SERIAL_NO
                  )
    WHERE EXISTS (SELECT MANUFACTURER
                   FROM teamref.GENERAL
                   WHERE MATERIAL.SERIAL_NO = GENERAL.SERIAL_NO);

UPDATE teamref.MATERIAL 
    SET EQUIPMENT_ID = (SELECT EQUIPMENT_ID
                   FROM teamref.GENERAL
                   WHERE MATERIAL.SERIAL_NO = GENERAL.SERIAL_NO
                  )
    WHERE EXISTS (SELECT EQUIPMENT_ID
                   FROM teamref.GENERAL
                   WHERE MATERIAL.SERIAL_NO = GENERAL.SERIAL_NO);

UPDATE teamref.MATERIAL
SET MATERIAL_PO_DATE = NULL, MATERIAL_NO = NULL
WHERE MATERIAL_PO = 0;


CREATE TABLE teamref.IoT(
SERIAL_NO int,
EPC_NO int,
MANUFACTURER varchar(30)
);

CREATE TABLE teamref.SNMP(
SERIAL_NO int,
EPC_NO int,
SNMP_TOKEN int,
SNMP_LABEL varchar(10)
);

CREATE TABLE teamref.REPORTED_ISSUES(
SERIAL_NO int,
NAME varchar(15),
METHOD varchar(20),
CATEGORY varchar(30),
OBJECT1 varchar(30),
OBJECT2 varchar(30),
OBJECT3 varchar(30),
OBJECT4 varchar(30),
OBJECT5 varchar(30),
OBJECT6 varchar(30),
OBJECT7 varchar(30),
OBJECT8 varchar(30),
OBJECT9 varchar(30),
OBJECT10 varchar(30),
OBJECT11 varchar(30),
OBJECT12 varchar(30),
OBJECT13 varchar(30),
OBJECT14 varchar(30),
OBJECT15 varchar(30)
);


QUIT;
