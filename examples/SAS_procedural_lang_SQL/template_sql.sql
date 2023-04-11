/* Generated Code (IMPORT) */
/* Source File: iot_cost_code.csv */
/* Source Path: /export/viya/homes/aswinkv28@gmail.com/data/klinterai/dataset/iot_cost_code.csv */
/* Code generated on: Apr 9, 2023, 4:39:17 PM */

proc sql;
%if %sysfunc(exist(WORK.IOT_COST)) %then %do;
    drop table WORK.IOT_COST;
%end;
%if %sysfunc(exist(WORK.IOT_COST,VIEW)) %then %do;
    drop view WORK.IOT_COST;
%end;
quit;
