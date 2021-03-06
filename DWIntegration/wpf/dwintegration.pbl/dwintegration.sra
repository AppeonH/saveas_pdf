forward
global type dwintegration from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward


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
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=EAS Demo DB V125;UID=dba;PWD=sql'"

Connect using SQLCA;
open(w_main)
end event
