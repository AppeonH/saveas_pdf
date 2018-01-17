$PBExportHeader$testtraining.sra
$PBExportComments$Generated Application Object
forward
global type testtraining from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type testtraining from application
string appname = "testtraining"
end type
global testtraining testtraining

on testtraining.create
appname="testtraining"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on testtraining.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_test)
end event

