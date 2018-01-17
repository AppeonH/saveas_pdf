$PBExportHeader$w_data_edit.srw
$PBExportComments$Window used with the Data Explorer example to edit an item
forward
global type w_data_edit from window
end type
type cb_cancel from commandbutton within w_data_edit
end type
type cb_ok from commandbutton within w_data_edit
end type
type dw_1 from datawindow within w_data_edit
end type
end forward

global type w_data_edit from window
integer x = 5
integer y = 4
integer width = 1865
integer height = 880
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 75530304
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
cb_cancel cb_cancel
cb_ok cb_ok
dw_1 dw_1
end type
global w_data_edit w_data_edit

type variables

end variables

event open;string temp, line_id 
long  order_id , pos
temp = Message.stringparm
pos = pos(temp , "::" )

order_id = long(mid(temp , 1, pos - 1 ))
line_id = mid(temp ,  pos + 2 , len(temp))

dw_1.SetTransObject(sqlca)
dw_1.Retrieve(order_id , integer(line_id))

//dw_1.SetFilter("line_id="+line_id)
//dw_1.Filter()
end event

on w_data_edit.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.dw_1}
end on

on w_data_edit.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_1)
end on

type cb_cancel from commandbutton within w_data_edit
integer x = 951
integer y = 672
integer width = 229
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_ok from commandbutton within w_data_edit
integer x = 677
integer y = 672
integer width = 229
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

event clicked;dw_1.Update()
//commit;

//w_treeview_sample.trigger dynamic event ue_refresh()

//Close(Parent)
closewithreturn(parent , "")

end event

type dw_1 from datawindow within w_data_edit
integer x = 5
integer y = 4
integer width = 1801
integer height = 608
integer taborder = 10
string dataobject = "d_salesorder_items"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

