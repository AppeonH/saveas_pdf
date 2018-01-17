$PBExportHeader$nvo_results.sru
forward
global type nvo_results from nonvisualobject
end type
end forward

global type nvo_results from nonvisualobject
end type
global nvo_results nvo_results

type variables
w_test_controller iw_testcontroller
end variables

on nvo_results.create
TriggerEvent( this, "constructor" )
end on

on nvo_results.destroy
TriggerEvent( this, "destructor" )
end on

