$PBExportHeader$pdf.sra
$PBExportComments$Generated Application Object
forward
global type pdf from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type pdf from application
string appname = "pdf"
end type
global pdf pdf

on pdf.create
appname="pdf"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on pdf.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//// Profile appeontestcase
//SQLCA.DBMS = "OLE DB"
//SQLCA.LogPass ="admin"
//SQLCA.LogId = "sa"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "PROVIDER='SQLOLEDB',DATASOURCE='192.0.1.102',PROVIDERSTRING='database=appeontestcase',PBMaxBlobSize=2147483647,PBMaxTextSize = 2147483647"
//

//// Profile PB Demo DB V2017
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017;UID=dba;PWD=sql'"
// Profile SQL2254
//SQLCA.DBMS = "OLE DB"
//SQLCA.LogPass = "admin"
//SQLCA.LogId = "sa"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "PROVIDER='SQLOLEDB',DATASOURCE='192.0.2.254',PROVIDERSTRING='database=apbtestcase'"
//
//
//CONNECT;
//
//If SQLCA.SQLCode <> 0 Then
//	MessageBox('Alert',"Connection to database failed.")
//	Halt CLOSE
//	Return
//End If

//open(w_main)
OPen(w_composite)
end event

