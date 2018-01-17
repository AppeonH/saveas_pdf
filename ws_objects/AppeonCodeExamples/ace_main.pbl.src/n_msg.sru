$PBExportHeader$n_msg.sru
forward
global type n_msg from message
end type
end forward

global type n_msg from message
end type
global n_msg n_msg

type variables
//
end variables

on n_msg.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_msg.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

