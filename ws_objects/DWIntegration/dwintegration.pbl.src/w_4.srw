$PBExportHeader$w_4.srw
forward
global type w_4 from window
end type
type uo_1 from vo_custom within w_4
end type
type cb_1 from commandbutton within w_4
end type
end forward

global type w_4 from window
integer width = 4695
integer height = 2948
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
integer transparency = 50
uo_1 uo_1
cb_1 cb_1
end type
global w_4 w_4

on w_4.create
this.uo_1=create uo_1
this.cb_1=create cb_1
this.Control[]={this.uo_1,&
this.cb_1}
end on

on w_4.destroy
destroy(this.uo_1)
destroy(this.cb_1)
end on

event open;boolean iw_4
end event

type uo_1 from vo_custom within w_4
integer x = 32
integer y = 24
integer width = 4101
integer height = 2776
integer taborder = 20
end type

on uo_1.destroy
call vo_custom::destroy
end on

type cb_1 from commandbutton within w_4
integer x = 4192
integer y = 2528
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

event clicked;close(w_4)
end event

