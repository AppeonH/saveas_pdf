$PBExportHeader$appeon_code_examples_server.sra
$PBExportComments$Generated Application Object
forward
global type appeon_code_examples_server from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

end variables

global type appeon_code_examples_server from application
string appname = "appeon_code_examples_server"
end type
global appeon_code_examples_server appeon_code_examples_server

on appeon_code_examples_server.create
appname="appeon_code_examples_server"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on appeon_code_examples_server.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

