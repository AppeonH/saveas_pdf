$PBExportHeader$ap_pdf_psr_test.sra
$PBExportComments$Generated Application Object
forward
global type ap_pdf_psr_test from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type ap_pdf_psr_test from application
string appname = "ap_pdf_psr_test"
end type
global ap_pdf_psr_test ap_pdf_psr_test

on ap_pdf_psr_test.create
appname="ap_pdf_psr_test"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on ap_pdf_psr_test.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;
Open (wn_psr_test)
end event

