$PBExportHeader$uo_tabpage_dw.sru
forward
global type uo_tabpage_dw from userobject
end type
type dw_1 from datawindow within uo_tabpage_dw
end type
end forward

global type uo_tabpage_dw from userobject
integer width = 2423
integer height = 944
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
end type
global uo_tabpage_dw uo_tabpage_dw

on uo_tabpage_dw.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on uo_tabpage_dw.destroy
destroy(this.dw_1)
end on

event constructor;string ls_parm
int li_id
ls_parm = trim(message.stringparm)

if LenA(ls_parm) <= 0 then
	li_id = 102
end if
li_id = integer(ls_parm)
dw_1.settransobject(sqlca)
dw_1.retrieve(li_id)
end event

type dw_1 from datawindow within uo_tabpage_dw
integer x = 23
integer y = 24
integer width = 2363
integer height = 900
integer taborder = 10
string title = "none"
string dataobject = "d_tabpage"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

