$PBExportHeader$w_treeview_issues.srw
forward
global type w_treeview_issues from window
end type
type cb_2 from commandbutton within w_treeview_issues
end type
type cb_1 from commandbutton within w_treeview_issues
end type
type dw_1 from datawindow within w_treeview_issues
end type
end forward

global type w_treeview_issues from window
integer width = 2533
integer height = 1408
boolean titlebar = true
string title = "TreeView Issues"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_treeview_issues w_treeview_issues

on w_treeview_issues.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_treeview_issues.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_2 from commandbutton within w_treeview_issues
integer x = 654
integer y = 1132
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

type cb_1 from commandbutton within w_treeview_issues
integer x = 73
integer y = 1112
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GetChild"
end type

event clicked;
dw_1.dataobject="d_dept_tvchild"
dw_1.settransobject(sqlca)
dw_1.retrieve()
DataWindowChild dwchild_tv

integer rtncode,ret
int i 
rtncode = dw_1.GetChild('dept_head_id', dwchild_tv)

IF rtncode = -1 THEN MessageBox( &
        "Error", "Not a DataWindowChild")
for i = 1 to 100
	ret=dwchild_tv.insertrow(0)
	dwchild_tv.setitem(ret,"num_col",ret)	
	dwchild_tv.setitem(ret,"char_col","test")
next
dwchild_tv.groupcalc()
end event

type dw_1 from datawindow within w_treeview_issues
integer x = 46
integer y = 56
integer width = 2226
integer height = 992
integer taborder = 10
string title = "none"
string dataobject = "d_dept_tvchild"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

