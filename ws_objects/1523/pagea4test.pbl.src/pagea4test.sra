$PBExportHeader$pagea4test.sra
$PBExportComments$Generated Application Object
forward
global type pagea4test from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type pagea4test from application
string appname = "pagea4test"
end type
global pagea4test pagea4test

on pagea4test.create
appname="pagea4test"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on pagea4test.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_main)
end event

