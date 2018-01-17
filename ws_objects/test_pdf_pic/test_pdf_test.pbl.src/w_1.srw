$PBExportHeader$w_1.srw
forward
global type w_1 from window
end type
type cb_3 from commandbutton within w_1
end type
type cb_2 from commandbutton within w_1
end type
type cbx_1 from checkbox within w_1
end type
type cb_1 from uo_saveas within w_1
end type
type dw_1 from datawindow within w_1
end type
end forward

global type w_1 from window
integer width = 4151
integer height = 2772
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
cbx_1 cbx_1
cb_1 cb_1
dw_1 dw_1
end type
global w_1 w_1

on w_1.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cbx_1,&
this.cb_1,&
this.dw_1}
end on

on w_1.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;//dw_1.dataobject="d_pdf_pic"
dw_1.settransobject(sqlca)

dw_1.retrieve()

end event

type cb_3 from commandbutton within w_1
integer x = 818
integer y = 2272
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;dw_1.Modify("DataWindow.Export.PDF.Method = NativePDF!")
dw_1.Saveas('', pdf!, TRUE)
end event

type cb_2 from commandbutton within w_1
integer x = 1527
integer y = 2212
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

type cbx_1 from checkbox within w_1
integer x = 1189
integer y = 2220
integer width = 192
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "pb"
end type

type cb_1 from uo_saveas within w_1
integer x = 261
integer y = 2220
integer taborder = 20
end type

event clicked;call super::clicked;of_saveas(dw_1,cbx_1.checked)

end event

type dw_1 from datawindow within w_1
integer x = 41
integer y = 24
integer width = 3749
integer height = 2088
integer taborder = 10
string title = "none"
string dataobject = "d_pdf_pic"
boolean hscrollbar = true
boolean vscrollbar = true
end type

