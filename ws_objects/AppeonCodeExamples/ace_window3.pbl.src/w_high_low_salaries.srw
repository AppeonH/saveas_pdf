$PBExportHeader$w_high_low_salaries.srw
$PBExportComments$Shows a bitmap indicator in DataWindow conditional on value of salary
forward
global type w_high_low_salaries from window
end type
type dw_employee_compensation from datawindow within w_high_low_salaries
end type
type cb_close from commandbutton within w_high_low_salaries
end type
end forward

global type w_high_low_salaries from window
integer x = 361
integer y = 300
integer width = 1897
integer height = 1148
boolean titlebar = true
string title = "Conditional Bitmaps"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
dw_employee_compensation dw_employee_compensation
cb_close cb_close
end type
global w_high_low_salaries w_high_low_salaries

event open;//Open script for w_high_low_salaries
This.x = 0
This.y = 0
dw_employee_compensation.SetTransObject(sqlca)
dw_employee_compensation.Retrieve( )
end event

on w_high_low_salaries.create
this.dw_employee_compensation=create dw_employee_compensation
this.cb_close=create cb_close
this.Control[]={this.dw_employee_compensation,&
this.cb_close}
end on

on w_high_low_salaries.destroy
destroy(this.dw_employee_compensation)
destroy(this.cb_close)
end on

type dw_employee_compensation from datawindow within w_high_low_salaries
integer x = 37
integer y = 36
integer width = 1783
integer height = 868
integer taborder = 10
string dataobject = "d_employee_salary"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_close from commandbutton within w_high_low_salaries
integer x = 823
integer y = 932
integer width = 274
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean default = true
end type

on clicked;//Clicked script for cb_close

Close(parent)
end on

