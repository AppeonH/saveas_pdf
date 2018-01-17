$PBExportHeader$treedw.sra
forward
global type treedw from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

end variables

global type treedw from application
string appname = "treedw"
end type
global treedw treedw

on treedw.create
appname="treedw"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on treedw.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;

//SQLCA.DBMS = "JDBC"
//SQLCA.LogPass = "sql"
//SQLCA.LogId = "dba"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "Driver='com.sybase.jdbc3.jdbc.SybDriver',URL='jdbc:sybase:Tds:192.0.3.202:2690/appeon_ykg'"
//CONNECT USING SQLCA;
open(w_main)
end event

