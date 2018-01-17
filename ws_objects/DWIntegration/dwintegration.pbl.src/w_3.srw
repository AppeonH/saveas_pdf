$PBExportHeader$w_3.srw
forward
global type w_3 from window
end type
type cb_1 from commandbutton within w_3
end type
end forward

global type w_3 from window
integer width = 4695
integer height = 2948
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
end type
global w_3 w_3

on w_3.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_3.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_3
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

event clicked;close(w_3)
end event

