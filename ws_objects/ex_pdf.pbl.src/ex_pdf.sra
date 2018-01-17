$PBExportHeader$ex_pdf.sra
$PBExportComments$Generated Application Object
forward
global type ex_pdf from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type ex_pdf from application
string appname = "ex_pdf"
end type
global ex_pdf ex_pdf

on ex_pdf.create
appname = "ex_pdf"
message = create message
sqlca = create transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on ex_pdf.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

