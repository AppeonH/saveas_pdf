$PBExportHeader$uo_tabpage_single.sru
forward
global type uo_tabpage_single from userobject
end type
type st_1 from statictext within uo_tabpage_single
end type
type sle_1 from singlelineedit within uo_tabpage_single
end type
end forward

global type uo_tabpage_single from userobject
integer width = 1435
integer height = 884
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
sle_1 sle_1
end type
global uo_tabpage_single uo_tabpage_single

on uo_tabpage_single.create
this.st_1=create st_1
this.sle_1=create sle_1
this.Control[]={this.st_1,&
this.sle_1}
end on

on uo_tabpage_single.destroy
destroy(this.st_1)
destroy(this.sle_1)
end on

event constructor;string ls_param

ls_param = message.stringparm

sle_1.text = ls_param
end event

type st_1 from statictext within uo_tabpage_single
integer x = 101
integer y = 172
integer width = 251
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parameter:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within uo_tabpage_single
integer x = 361
integer y = 164
integer width = 617
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

