$PBExportHeader$vo_custom.sru
forward
global type vo_custom from userobject
end type
type cb_1 from commandbutton within vo_custom
end type
type cb_insert from commandbutton within vo_custom
end type
type tab_1 from tab within vo_custom
end type
type tabpage_1 from userobject within tab_1
end type
type dw_1 from vo_datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_1 dw_1
end type
type tab_1 from tab within vo_custom
tabpage_1 tabpage_1
end type
type cb_retrieve from vo_button within vo_custom
end type
end forward

global type vo_custom from userobject
integer width = 4160
integer height = 2484
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_1 cb_1
cb_insert cb_insert
tab_1 tab_1
cb_retrieve cb_retrieve
end type
global vo_custom vo_custom

on vo_custom.create
this.cb_1=create cb_1
this.cb_insert=create cb_insert
this.tab_1=create tab_1
this.cb_retrieve=create cb_retrieve
this.Control[]={this.cb_1,&
this.cb_insert,&
this.tab_1,&
this.cb_retrieve}
end on

on vo_custom.destroy
destroy(this.cb_1)
destroy(this.cb_insert)
destroy(this.tab_1)
destroy(this.cb_retrieve)
end on

type cb_1 from commandbutton within vo_custom
integer x = 1280
integer y = 20
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Sort"
end type

event clicked;string null_str
setnull(null_str)
tab_1.tabpage_1.dw_1.SetFilter(null_str)
tab_1.tabpage_1.dw_1.Filter()
end event

type cb_insert from commandbutton within vo_custom
integer x = 613
integer y = 24
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Insert"
end type

event clicked;int ll_cur_row, ll_new_row

ll_cur_row = tab_1.tabpage_1.dw_1.GetRow()
ll_new_row = tab_1.tabpage_1.dw_1.InsertRow(ll_cur_row)
tab_1.tabpage_1.dw_1.ScrollToRow(ll_new_row)
messagebox("row",tab_1.tabpage_1.dw_1.getrow())
tab_1.tabpage_1.dw_1.SetColumn(1)
messagebox("column",tab_1.tabpage_1.dw_1.getcolumn())
//tab_1.tabpage_1.dw_1.setfocus()
end event

type tab_1 from tab within vo_custom
event create ( )
event destroy ( )
integer x = 55
integer y = 188
integer width = 4037
integer height = 2276
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 124
integer width = 4000
integer height = 2136
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from vo_datawindow within tabpage_1
integer x = 18
integer y = 4
integer width = 3945
integer height = 2104
integer taborder = 20
string dataobject = "d_tabular_button"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type cb_retrieve from vo_button within vo_custom
integer x = 137
integer y = 36
integer taborder = 10
string text = "Retrieve"
end type

event clicked;call super::clicked;tab_1.tabpage_1.dw_1.settransobject(SQLCA)
tab_1.tabpage_1.dw_1.SetRowFocusIndicator(hand!)
tab_1.tabpage_1.dw_1.retrieve()

//tab_1.tabpage_1.dw_1.SetFocus ( )
end event

