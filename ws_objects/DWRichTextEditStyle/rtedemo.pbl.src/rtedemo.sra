$PBExportHeader$rtedemo.sra
$PBExportComments$Generated Application Object
forward
global type rtedemo from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type rtedemo from application
string appname = "rtedemo"
end type
global rtedemo rtedemo

on rtedemo.create
appname="rtedemo"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on rtedemo.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Profile PB Demo DB V2017
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017R2;UID=dba;PWD=SQL'"


Connect using sqlca;
open(w_main)
end event

