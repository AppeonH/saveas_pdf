$PBExportHeader$w_test.srw
forward
global type w_test from window
end type
type cb_2 from commandbutton within w_test
end type
type cb_1 from commandbutton within w_test
end type
type dw_1 from datawindow within w_test
end type
end forward

global type w_test from window
integer width = 3378
integer height = 2352
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_test w_test

on w_test.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_test.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_2 from commandbutton within w_test
integer x = 2917
integer y = 412
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

event clicked;//str_dw  lstr_1
//
//lstr_1.adw_1 = dw_1 
//
OpenWithparm( w_newfeature,dw_1)
end event

type cb_1 from commandbutton within w_test
integer x = 2917
integer y = 220
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SaveAS"
end type

event clicked;int li_ret
dw_1.Object.DataWindow.Export.PDF.Method = NativePDF!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=0

li_ret = dw_1.SaveAs("", PDF!, true)

end event

type dw_1 from datawindow within w_test
integer x = 41
integer width = 2834
integer height = 2188
integer taborder = 10
string title = "none"
string dataobject = "dw_richhelp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.insertrow(0)
end event

