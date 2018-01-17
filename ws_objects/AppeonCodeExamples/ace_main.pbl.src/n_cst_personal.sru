$PBExportHeader$n_cst_personal.sru
forward
global type n_cst_personal from nonvisualobject
end type
end forward

global type n_cst_personal from nonvisualobject
end type
global n_cst_personal n_cst_personal

on n_cst_personal.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_personal.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

