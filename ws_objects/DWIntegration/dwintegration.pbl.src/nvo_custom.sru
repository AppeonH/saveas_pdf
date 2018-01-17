$PBExportHeader$nvo_custom.sru
forward
global type nvo_custom from nonvisualobject
end type
end forward

global type nvo_custom from nonvisualobject
end type
global nvo_custom nvo_custom

forward prototypes
public subroutine nvo_message (string nvo_s)
end prototypes

public subroutine nvo_message (string nvo_s);messagebox("this is from custom_class message", nvo_s)
end subroutine

on nvo_custom.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_custom.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

