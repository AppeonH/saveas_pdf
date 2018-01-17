$PBExportHeader$dwproperty.sra
forward
global type dwproperty from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string gs_curdir 
end variables

global type dwproperty from application
string appname = "dwproperty"
end type
global dwproperty dwproperty

on dwproperty.create
appname="dwproperty"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on dwproperty.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//open(w_test_controller)
//w_test_controller.ready()
open(w_main)
end event

