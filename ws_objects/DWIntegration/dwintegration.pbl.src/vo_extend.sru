$PBExportHeader$vo_extend.sru
forward
global type vo_extend from userobject
end type
type nvo_custom_1 from nvo_custom within vo_extend
end type
type datastore_1 from datastore within vo_extend
end type
end forward

global type vo_extend from userobject
integer width = 635
integer height = 300
boolean hscrollbar = true
boolean vscrollbar = true
userobjects objecttype = externalvisual!
long backcolor = 67108864
string text = "hello"
nvo_custom_1 nvo_custom_1
datastore_1 datastore_1
end type
global vo_extend vo_extend

on vo_extend.create
this.nvo_custom_1=create nvo_custom_1
this.datastore_1=create datastore_1
end on

on vo_extend.destroy
destroy(this.nvo_custom_1)
destroy(this.datastore_1)
end on

type nvo_custom_1 from nvo_custom within vo_extend descriptor "pb_nvo" = "true" 
end type

on nvo_custom_1.create
call super::create
end on

on nvo_custom_1.destroy
call super::destroy
end on

type datastore_1 from datastore within vo_extend descriptor "pb_nvo" = "true" 
end type

event retrievestart;messagebox("message", "retrieve start")
end event

on datastore_1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on datastore_1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

