$PBExportHeader$graphintegration.sra
$PBExportComments$Generated Application Object
forward
global type graphintegration from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type graphintegration from application
string appname = "graphintegration"
end type
global graphintegration graphintegration

on graphintegration.create
appname="graphintegration"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on graphintegration.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Profile PB Demo DB V2017R2 Unicode
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017R2 Unicode;UID=dba;PWD=sql'"

Connect;
open(w_graph)
end event

event close;disconnect;
end event

