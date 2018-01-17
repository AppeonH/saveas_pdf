$PBExportHeader$graphdw_saveas.sra
$PBExportComments$Generated Application Object
forward
global type graphdw_saveas from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

end variables

global type graphdw_saveas from application
string appname = "graphdw_saveas"
end type
global graphdw_saveas graphdw_saveas

on graphdw_saveas.create
appname="graphdw_saveas"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on graphdw_saveas.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=AppeonSample;UID=dba;PWD=sql'" 

CONNECT USING SQLCA;

IF SQLCA.SQLCODE <> 0 THEN
	messagebox("Warning","Connect database failed!")
	HALT CLOSE
END IF

open(w_main)
end event

