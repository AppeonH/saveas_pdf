$PBExportHeader$w_test.srw
forward
global type w_test from window
end type
type dw_1 from datawindow within w_test
end type
type cb_2 from commandbutton within w_test
end type
type mle_1 from multilineedit within w_test
end type
type cb_1 from commandbutton within w_test
end type
type timing_1 from timing within w_test
end type
end forward

global type w_test from window
integer width = 2533
integer height = 1408
boolean titlebar = true
string title = "Test "
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
cb_2 cb_2
mle_1 mle_1
cb_1 cb_1
timing_1 timing_1
end type
global w_test w_test

on w_test.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.mle_1=create mle_1
this.cb_1=create cb_1
this.timing_1=create timing_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.mle_1,&
this.cb_1}
end on

on w_test.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.timing_1)
end on

event timer;//


end event

type dw_1 from datawindow within w_test
integer x = 402
integer y = 36
integer width = 832
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "d_test1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_test
integer x = 393
integer y = 756
integer width = 457
integer height = 212
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Control"
end type

event clicked;long  ll_count
string ls_output

string ls_pos,ls_new
for ll_count=1 to upperbound(parent.control)
	//
	ls_output += string(ll_count)+" of "+parent.classname()+" = "+parent.control[ll_count].classname()+"~r~n"
next

mle_1.text = ls_output

ls_pos = this.classname()

if pos(mle_1.text,ls_pos) > 0 then
	messagebox("Exist","success")
	ls_new = mid(mle_1.text,pos(mle_1.text,ls_pos),len(ls_pos))
	messagebox("",ls_new)
	mle_1.text = mid(mle_1.text,pos(mle_1.text,ls_pos)+len(ls_pos)+1)
else
	messagebox("Not Exist","failed")
end if



end event

type mle_1 from multilineedit within w_test
integer x = 1531
integer y = 204
integer width = 549
integer height = 612
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_test
integer x = 393
integer y = 524
integer width = 457
integer height = 212
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;//

messagebox("Test",this.classname()+" was clicked!")
end event

type timing_1 from timing within w_test descriptor "pb_nvo" = "true" 
end type

event constructor;//

end event

on timing_1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on timing_1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;//


end event

