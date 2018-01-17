$PBExportHeader$signature.sra
$PBExportComments$Generated Application Object
forward
global type signature from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type signature from application
string appname = "signature"
end type
global signature signature

on signature.create
appname="signature"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on signature.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Profile en_sql2000
//SQLCA.DBMS = "SNC SQL Native Client(OLE DB)"
//SQLCA.LogPass = 'admin'
//SQLCA.ServerName = "192.0.1.102"
//SQLCA.LogId = "sa"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "Provider='SQLNCLI11',Database='en_sql2000'"

SQLCA.DBMS = "OLE DB"
SQLCA.LogPass = "admin"
SQLCA.LogId = "sa"
SQLCA.AutoCommit = False
SQLCA.DBParm = "PROVIDER='SQLOLEDB',DATASOURCE='192.0.1.102',PROVIDERSTRING='database=en_sql2000'"



connect;

if sqlca.sqlcode <> 0 then
	messagebox("DB Error",sqlca.sqlerrtext)
	return
end if

open(w_sign)
end event

