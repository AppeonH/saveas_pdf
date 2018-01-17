$PBExportHeader$t_language.sra
$PBExportComments$Generated Application Object
forward
global type t_language from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type t_language from application
string appname = "t_language"
end type
global t_language t_language

on t_language.create
appname="t_language"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on t_language.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Profile en_sql80
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=en_asa80;UID=dba;PWD=sql'"
//
//connect;
//
//
//if sqlca.sqlcode <> 0 then
//	messagebox('',sqlca.sqlerrtext)
//	return
//end if

open(w_lan)

end event

