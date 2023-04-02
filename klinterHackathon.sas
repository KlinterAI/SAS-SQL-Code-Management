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
EPC_NO varchar(34),
MANUFACTURER varchar(30)
);

INSERT INTO teamref.IoT 
VALUES (1,'0693163682c45209e444865d32e9e1b6c47f67fe','Meevee')
VALUES (2,'91c1e5595b1494e457805900a3480242e3221ffd','Dabtype')
VALUES (3,'a4502b39f6797d4c66619bf705b1e0397f1b24ac','Voomm')
VALUES (4,'8b203f01a095016f18f9dc8f80c618799547ac71','Gabspot')
VALUES (5,'b895557ce48bb229731d474f01372c4e86952b41','Katz')
VALUES (6,'f0be2c2701ba42ed95be028d16e8b34968b49306','Flipbug')
VALUES (7,'d7eca44a4cd794c087f9af555c03faa13dc49760','Feedspan')
VALUES (8,'7e461c68b3085fda645ac20492e902f39c5e42e0','Flashset')
VALUES (9,'16e131a578f13dc12c15a01743c938d0455c5553','Lajo')
VALUES (10,'8bd2ececbbbad82a3fc8dfd829c822293b186389','Fanoodle');

UPDATE teamref.IoT 
    SET EPC_NO = (SELECT EPC_NO
                   FROM teamref.GENERAL
                   WHERE IoT.SERIAL_NO = GENERAL.SERIAL_NO
                  )
    WHERE EXISTS (SELECT EPC_NO
                   FROM teamref.GENERAL
                   WHERE IoT.SERIAL_NO = GENERAL.SERIAL_NO);

UPDATE teamref.IoT 
    SET MANUFACTURER = (SELECT MANUFACTURER
                    FROM teamref.MATERIAL
                    WHERE IoT.SERIAL_NO = MATERIAL.SERIAL_NO
                    )
    WHERE EXISTS (SELECT MANUFACTURER
                    FROM teamref.MATERIAL
                    WHERE IoT.SERIAL_NO = MATERIAL.SERIAL_NO);

CREATE TABLE teamref.SNMP(
SERIAL_NO int,
EPC_NO varchar(34),
SNMP_TOKEN varchar(128),
SNMP_LABEL varchar(10)
);

INSERT INTO teamref.SNMP
VALUES (1,'73630e43276dd01177fea738fa6623e73f2044e7','61.72.96.36'	'image/tiff')
VALUES (2,'ecda1f2679b95907cbd2f25c93da0e31326c6151','132.240.104.181','image/tiff')
VALUES (3,'fb60e5d7feb7c6a4f7e0320404d9b714c46a5ae9','68.233.95.129','image/png')
VALUES (4,'27086fcccf0a6b3a393552dedfac43b0b33b9755','83.40.233.213','text/plain')
VALUES (5,'d6c93a3864db0f3ae251c2effd3118d845006f6b','239.244.79.32','application/x-excel')
VALUES (6,'623e92efe0d901e38a359970192dbacff2a4e0be','190.41.34.52','application/mspowerpoint')
VALUES (7,'152347e88fb362b5c3fc8931cb2d4763f0eb5e85','230.17.238.158','text/plain')
VALUES (8,'e950b3deffe1e4acf5ec5cc4c3aeefb4d03fb73e','56.157.31.102','image/png')
VALUES (9,'5263cce2e2230fef71658292e33cc9b6e79cdd91','170.113.174.62','image/gif')
VALUES (10,'0c2c2b4581f7bce8a794f83b57d98336cf56ce0e','146.39.66.70','video/mpeg');

UPDATE teamref.SNMP 
    SET EPC_NO = (SELECT EPC_NO
                    FROM teamref.IoT
                    WHERE SNMP.SERIAL_NO = IoT.SERIAL_NO
                    )
    WHERE EXISTS (SELECT EPC_NO
                    FROM teamref.IoT
                    WHERE SNMP.SERIAL_NO = IoT.SERIAL_NO);

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

INSERT INTO teamref.REPORTED_ISSUES
VALUES ()
VALUES ()
VALUES ()
VALUES ()
VALUES ()
VALUES ()
VALUES ()
VALUES ()
VALUES ()
VALUES ();

QUIT;
