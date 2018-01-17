$PBExportHeader$testrapport.sra
$PBExportComments$Generated Application Object
forward
global type testrapport from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type testrapport from application
string appname = "testrapport"
end type
global testrapport testrapport

on testrapport.create
appname="testrapport"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on testrapport.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(win_rapport)
end event

