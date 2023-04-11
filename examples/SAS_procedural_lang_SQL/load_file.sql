-- An example for loading SQL tables using CSV

FILENAME REFFILE DISK '/export/viya/homes/aswinkv28@gmail.com/data/klinterai/dataset/iot_cost_code.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IOT_COST;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IOT_COST; RUN;
