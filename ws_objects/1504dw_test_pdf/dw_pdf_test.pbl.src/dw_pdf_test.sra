$PBExportHeader$dw_pdf_test.sra
$PBExportComments$Generated Application Object
forward
global type dw_pdf_test from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type dw_pdf_test from application
string appname = "dw_pdf_test"
end type
global dw_pdf_test dw_pdf_test

on dw_pdf_test.create
appname="dw_pdf_test"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on dw_pdf_test.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_test)
end event

