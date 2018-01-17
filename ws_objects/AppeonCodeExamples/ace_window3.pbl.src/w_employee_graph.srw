$PBExportHeader$w_employee_graph.srw
$PBExportComments$Window to show the datawindow of employee salaries and graph them in a graph object
forward
global type w_employee_graph from w_graph_sheet
end type
type cb_1 from commandbutton within w_employee_graph
end type
type cb_2 from commandbutton within w_employee_graph
end type
type cb_3 from commandbutton within w_employee_graph
end type
type cb_5 from commandbutton within w_employee_graph
end type
end forward

global type w_employee_graph from w_graph_sheet
integer width = 2766
integer height = 1676
boolean titlebar = true
string title = "Open the Employee Salary by Department graph"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
end type
global w_employee_graph w_employee_graph

on open;// Create a new series calles "Total Salaries"
int series_num
series_num = gr_1.addseries ( "Total Salaries" )
if series_num < 1 then return
Call super::open
end on

on w_employee_graph.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_5
end on

on w_employee_graph.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
end on

type gr_1 from w_graph_sheet`gr_1 within w_employee_graph
integer x = 23
integer y = 524
integer height = 848
string title = "Total Employee Salaries by Department"
end type

on gr_1.create
call super::create
Category.DispAttr.TextSize=-11
Category.DispAttr.AutoSize=false
Category.LabelDispAttr.TextSize=-15
Category.LabelDispAttr.AutoSize=false
Values.DispAttr.Format="#,##0"
Values.LabelDispAttr.TextSize=-12
Values.LabelDispAttr.AutoSize=false
LegendDispAttr.TextSize=-11
LegendDispAttr.AutoSize=false
end on

type dw_1 from w_graph_sheet`dw_1 within w_employee_graph
integer width = 1472
integer height = 464
string dataobject = "d_total_employee_salary"
boolean vscrollbar = true
end type

type cb_1 from commandbutton within w_employee_graph
integer x = 590
integer y = 1428
integer width = 411
integer height = 104
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Graph T&ype..."
end type

event clicked;Parent.TriggerEvent ("graph_type")
end event

type cb_2 from commandbutton within w_employee_graph
integer x = 1029
integer y = 1428
integer width = 411
integer height = 104
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Title..."
end type

event clicked;Parent.TriggerEvent ( "graph_title")
end event

type cb_3 from commandbutton within w_employee_graph
integer x = 1467
integer y = 1428
integer width = 411
integer height = 104
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Color..."
end type

event clicked;Parent.TriggerEvent ( "graph_color")

end event

type cb_5 from commandbutton within w_employee_graph
integer x = 1906
integer y = 1428
integer width = 411
integer height = 104
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&lose"
end type

event clicked;Close(Parent)
end event

