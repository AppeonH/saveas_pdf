$PBExportHeader$w_2.srw
forward
global type w_2 from window
end type
type cbx_1 from checkbox within w_2
end type
type cb_2 from uo_saveas within w_2
end type
type uo_1 from vo_custom within w_2
end type
type cb_1 from commandbutton within w_2
end type
end forward

global type w_2 from window
integer width = 4635
integer height = 2852
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_1 cbx_1
cb_2 cb_2
uo_1 uo_1
cb_1 cb_1
end type
global w_2 w_2

on w_2.create
this.cbx_1=create cbx_1
this.cb_2=create cb_2
this.uo_1=create uo_1
this.cb_1=create cb_1
this.Control[]={this.cbx_1,&
this.cb_2,&
this.uo_1,&
this.cb_1}
end on

on w_2.destroy
destroy(this.cbx_1)
destroy(this.cb_2)
destroy(this.uo_1)
destroy(this.cb_1)
end on

type cbx_1 from checkbox within w_2
integer x = 1161
integer y = 204
integer width = 402
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

type cb_2 from uo_saveas within w_2
integer x = 626
integer y = 192
integer taborder = 30
end type

event clicked;call super::clicked;//of_saveas(uo_1,cbx_1.checked)  
end event

type uo_1 from vo_custom within w_2
integer x = 32
integer y = 24
integer width = 4101
integer height = 2776
integer taborder = 20
end type

on uo_1.destroy
call vo_custom::destroy
end on

type cb_1 from commandbutton within w_2
integer x = 4155
integer y = 2496
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;close(w_2)
end event

