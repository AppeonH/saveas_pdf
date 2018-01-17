$PBExportHeader$uo_treeview.sru
forward
global type uo_treeview from userobject
end type
type tv_1 from treeview within uo_treeview
end type
end forward

global type uo_treeview from userobject
integer width = 718
integer height = 528
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_output ( string as_message )
tv_1 tv_1
end type
global uo_treeview uo_treeview

on uo_treeview.create
this.tv_1=create tv_1
this.Control[]={this.tv_1}
end on

on uo_treeview.destroy
destroy(this.tv_1)
end on

event dragdrop;//this.Event ue_OutPut('uo_treeview.window Event Dragdrop : Source ='+source.classname() )
end event

event dragenter;//this.Event ue_OutPut('uo_treeview.window Event Dragenter : Source ='+source.classname() )
end event

event dragleave;//this.Event ue_OutPut('uo_treeview.window Event Dragleave : Source ='+source.classname() )
end event

event dragwithin;//this.Event ue_OutPut('uo_treeview.window Event Dragwithin : Source ='+source.classname() )
end event

type tv_1 from treeview within uo_treeview
integer x = 37
integer y = 36
integer width = 631
integer height = 452
integer taborder = 10
boolean dragauto = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean disabledragdrop = false
string picturename[] = {"UserObject5!","Custom028!","Custom029!"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event constructor;treeviewitem lti_item
long ll_root

lti_item.data ='xnl'
lti_item.label = 'Custom Visual'
lti_item.pictureindex = 1
lti_item.children = True

ll_root = this.InsertItemLast(0, lti_item)

this.ExpandItem ( ll_root )
end event

event itempopulate;treeviewitem lti_item
int i
for i = 1 to 4
	 lti_item.data = 'xnl'
	 lti_item.label = 'drap-'+string(i)
	 lti_item.selectedpictureindex = 3
	 lti_item.pictureindex = 2
	 lti_item.children = false
	 
	 this.insertitemlast(handle,lti_item)
next
end event

event dragenter;Parent.Event ue_OutPut('uo_treeview.tv_1 Event Dragenter : Source ='+source.classname() )
end event

event dragdrop;Parent.Event ue_OutPut('uo_treeview.tv_1 Event Dragdrop : Source ='+source.classname() )
end event

event dragleave;Parent.Event ue_OutPut('uo_treeview.tv_1 Event Dragleave : Source ='+source.classname() )
end event

event dragwithin;Parent.Event ue_OutPut('uo_treeview.tv_1 Event Dragwithin : Source ='+source.classname() )
end event

