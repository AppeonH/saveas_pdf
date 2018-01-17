$PBExportHeader$w_test.srw
forward
global type w_test from window
end type
type cb_3 from commandbutton within w_test
end type
type cb_2 from commandbutton within w_test
end type
type dw_1 from datawindow within w_test
end type
type cb_1 from commandbutton within w_test
end type
end forward

global type w_test from window
integer width = 1728
integer height = 904
boolean titlebar = true
string title = "Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
end type
global w_test w_test

on w_test.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.dw_1,&
this.cb_1}
end on

on w_test.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;dw_1.insertrow(0)

dw_1.SetItem(1, 'text1', 'Test12345678901234567890')
dw_1.SetItem(1, 'text2', 'Test12345678901234567890')
end event

type cb_3 from commandbutton within w_test
integer x = 1088
integer y = 676
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF"
end type

event clicked;OpenWithparm( w_newfeature,dw_1)
end event

type cb_2 from commandbutton within w_test
integer x = 151
integer y = 560
integer width = 553
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save as distill PDF"
end type

event clicked;string ls_ret

ls_ret = dw_1.Modify("DataWindow.Export.PDF.Method=Distill!")
dw_1.Saveas('', pdf!, TRUE)
end event

type dw_1 from datawindow within w_test
integer x = 137
integer y = 104
integer width = 1486
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_test"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_test
integer x = 1061
integer y = 552
integer width = 553
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save as native PDF"
end type

event clicked;string ls_ret

ls_ret = dw_1.Modify("DataWindow.Export.PDF.Method = NativePDF!")
dw_1.Saveas('', pdf!, TRUE)
end event

