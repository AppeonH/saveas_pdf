$PBExportHeader$dwintegration.sra
$PBExportComments$Generated Application Object
forward
global type dwintegration from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

end variables

global type dwintegration from application
string appname = "dwintegration"
end type
global dwintegration dwintegration

on dwintegration.create
appname="dwintegration"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on dwintegration.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Profile EAS Demo DB V110 Unicode
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=EAS Demo DB V126;UID=dba;PWD=sql'"
//

/*SQLCA.DBMS = "JDBC"
SQLCA.LogPass = "sql"
SQLCA.LogId = "dba"
SQLCA.AutoCommit = False
SQLCA.DBParm = "Driver='com.sybase.jdbc3.jdbc.SybDriver',URL='jdbc:sybase:Tds:192.0.3.202:2690/appeon_ykg'"
*/
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=AppeonSample;UID=dba;PWD=sql'" 

// Profile PB Demo DB V2017R2
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017R2;UID=dba;PWD=sql'"


CONNECT USING SQLCA;

IF SQLCA.SQLCODE <> 0 THEN
	messagebox("Warning","Connect database failed!")
	HALT CLOSE
END IF

open(w_main)
end event

