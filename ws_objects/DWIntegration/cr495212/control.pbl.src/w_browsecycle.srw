$PBExportHeader$w_browsecycle.srw
forward
global type w_browsecycle from window
end type
type cb_close from commandbutton within w_browsecycle
end type
type dw_cyclebrowse from datawindow within w_browsecycle
end type
type st_microhelp from statictext within w_browsecycle
end type
end forward

global type w_browsecycle from window
integer x = 1801
integer y = 1200
integer width = 1833
integer height = 1312
boolean titlebar = true
string title = "Cycle Browser"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_close cb_close
dw_cyclebrowse dw_cyclebrowse
st_microhelp st_microhelp
end type
global w_browsecycle w_browsecycle

type variables
nvo_control_SQLCA nvo_SQLCA
end variables

on w_browsecycle.create
this.cb_close=create cb_close
this.dw_cyclebrowse=create dw_cyclebrowse
this.st_microhelp=create st_microhelp
this.Control[]={this.cb_close,&
this.dw_cyclebrowse,&
this.st_microhelp}
end on

on w_browsecycle.destroy
destroy(this.cb_close)
destroy(this.dw_cyclebrowse)
destroy(this.st_microhelp)
end on

event open;
//Create Transaction Object & Retrieve
nvo_SQLCA = Create nvo_control_SQLCA
nvo_SQLCA = Message.PowerObjectParm
dw_cycleBrowse.dataObject = 'd_test_cycle_browser'
dw_cycleBrowse.SetTransObject(nvo_SQLCA)
dw_cycleBrowse.Retrieve(Upper(GetApplication().appname))


end event

type cb_close from commandbutton within w_browsecycle
integer x = 1518
integer y = 1140
integer width = 265
integer height = 64
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Select"
boolean default = true
end type

event clicked;IF dw_cycleBrowse.GetRow() < 1 Then 
	CloseWithReturn(Parent, 1)
	Return
End IF
CloseWithReturn(Parent, dw_cycleBrowse.GetItemNumber(dw_cycleBrowse.GetRow(), 'cycleNo'))
end event

type dw_cyclebrowse from datawindow within w_browsecycle
integer width = 1806
integer height = 1100
integer taborder = 10
string title = "none"
string dataobject = "d_test_cycle_browser"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;

// Set current Row
This.SelectRow(This.GetSelectedRow(1), FALSE)
If row = 0 Then
	This.SetRow(1)
	This.SelectRow(1, TRUE)
Else
	This.SetRow(row)
	This.SelectRow(row, TRUE)
End IF
end event

event doubleclicked;

cb_Close.Trigger Event Clicked()
end event

type st_microhelp from statictext within w_browsecycle
integer y = 1140
integer width = 1513
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Double click to select cycle"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

