$PBExportHeader$test_pdf_pic.sra
$PBExportComments$Generated Application Object
forward
global type test_pdf_pic from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type test_pdf_pic from application
string appname = "test_pdf_pic"
end type
global test_pdf_pic test_pdf_pic

on test_pdf_pic.create
appname="test_pdf_pic"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on test_pdf_pic.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//// Profile PB Demo DB V2017
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017;UID=dba;PWD=sql'"

// Profile PB Demo DB V2017R2
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017R2;UID=dba;PWD=sql'"


connect;

open(w_1)

end event

