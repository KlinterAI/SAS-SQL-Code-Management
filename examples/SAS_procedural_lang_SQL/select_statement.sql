-- SQL that Works

PROC SQL;
	SELECT * FROM IOTMETAD.IOT_META;
RUN;

PROC CONTENTS DATA=IOTMETAD.IOT_META; RUN;
