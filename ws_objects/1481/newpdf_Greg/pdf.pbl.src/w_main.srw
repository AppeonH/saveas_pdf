$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_6 from commandbutton within w_main
end type
type cb_5 from commandbutton within w_main
end type
type cb_4 from commandbutton within w_main
end type
type cb_3 from commandbutton within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
type dw_1 from datawindow within w_main
end type
end forward

global type w_main from window
integer width = 3648
integer height = 2368
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_main w_main

on w_main.create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_main.destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_6 from commandbutton within w_main
integer x = 1207
integer y = 2016
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "retrieve39W"
end type

event clicked;dw_1.dataobject = "d_wo_work_order"
dw_1.settransobject( sqlca)
dw_1.retrieve( ) 


end event

type cb_5 from commandbutton within w_main
integer x = 645
integer y = 2020
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "retrieve10W"
end type

event clicked;dw_1.dataobject = "d_po_purchase_order"
dw_1.settransobject( sqlca)
dw_1.retrieve( ) 


end event

type cb_4 from commandbutton within w_main
integer x = 119
integer y = 2016
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "retrieve3W"
end type

event clicked;dw_1.dataobject = "d_eq_locations"
dw_1.settransobject( sqlca)
dw_1.retrieve( ) 


end event

type cb_3 from commandbutton within w_main
integer x = 1120
integer y = 1852
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "NativePDF"
end type

event clicked;int li_ret
dw_1.Object.DataWindow.Export.PDF.Method = NativePDF!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=0

li_ret = dw_1.SaveAs("custom.pdf", PDF!, true)

messagebox("li_ret",""+string(li_ret))
end event

type cb_2 from commandbutton within w_main
integer x = 640
integer y = 1856
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "saveas"
end type

event clicked;dw_1.saveas()
//dw_1.SaveAs("dw_test.pdf", PDF!, false)
end event

type cb_1 from commandbutton within w_main
integer x = 105
integer y = 1848
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "set"
end type

event clicked;string 	ls_temp
long ll_rowcount

dw_1.dataobject= "test_rech.psr"

 ls_temp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
end event

type dw_1 from datawindow within w_main
integer x = 18
integer y = 4
integer width = 3534
integer height = 1780
integer taborder = 10
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

