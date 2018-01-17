$PBExportHeader$w_test_treedwc.srw
forward
global type w_test_treedwc from window
end type
type cb_7 from commandbutton within w_test_treedwc
end type
type cb_6 from commandbutton within w_test_treedwc
end type
type cb_5 from commandbutton within w_test_treedwc
end type
type cb_4 from commandbutton within w_test_treedwc
end type
type cb_3 from commandbutton within w_test_treedwc
end type
type sle_level from singlelineedit within w_test_treedwc
end type
type st_2 from statictext within w_test_treedwc
end type
type st_1 from statictext within w_test_treedwc
end type
type sle_row from singlelineedit within w_test_treedwc
end type
type cb_2 from commandbutton within w_test_treedwc
end type
type cb_1 from commandbutton within w_test_treedwc
end type
type dw_1 from datawindow within w_test_treedwc
end type
end forward

global type w_test_treedwc from window
integer width = 2642
integer height = 2080
boolean titlebar = true
string title = "TreeView DataWindowChild"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
boolean center = true
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
sle_level sle_level
st_2 st_2
st_1 st_1
sle_row sle_row
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_test_treedwc w_test_treedwc

type variables
datawindowchild dwc_test
int i_row,i_grouplevel
end variables

event open;integer rtncode

rtncode = dw_1.GetChild('dw_1', dwc_test)

IF rtncode = -1 THEN MessageBox(  "Error", "Not a DataWindowChild")
dwc_Test.SetTransObject(SQLCA)
rtncode=dwc_test.Retrieve()
end event

on w_test_treedwc.create
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.sle_level=create sle_level
this.st_2=create st_2
this.st_1=create st_1
this.sle_row=create sle_row
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.sle_level,&
this.st_2,&
this.st_1,&
this.sle_row,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_test_treedwc.destroy
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.sle_level)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_row)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_7 from commandbutton within w_test_treedwc
integer x = 1294
integer y = 1840
integer width = 402
integer height = 112
integer taborder = 70
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

type cb_6 from commandbutton within w_test_treedwc
integer x = 1769
integer y = 1720
integer width = 517
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print"
end type

event clicked;dw_1.print()
end event

type cb_5 from commandbutton within w_test_treedwc
integer x = 1769
integer y = 1584
integer width = 517
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SelectTreeNode"
end type

event clicked;int ret
ret=dwc_test.selecttreenode( i_Row, i_GroupLevel,true)
if ret<>1 then
	Messagebox("return",ret)
end if
end event

type cb_4 from commandbutton within w_test_treedwc
integer x = 1289
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Collapse"
end type

event clicked;int li_ret

li_ret= dwc_test.collapse(i_row,i_grouplevel)
Messagebox("Return",li_ret)
end event

type cb_3 from commandbutton within w_test_treedwc
integer x = 832
integer y = 1712
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Expand"
end type

event clicked;int li_ret

li_ret= dwc_test.expand(i_row,i_grouplevel)
Messagebox("Return",li_ret)
end event

type sle_level from singlelineedit within w_test_treedwc
integer x = 389
integer y = 1716
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
end type

event modified;i_GroupLevel= long(this.text)
end event

type st_2 from statictext within w_test_treedwc
integer x = 14
integer y = 1752
integer width = 270
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "LevelNo:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_test_treedwc
integer x = 18
integer y = 1616
integer width = 270
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "RowNo:"
boolean focusrectangle = false
end type

type sle_row from singlelineedit within w_test_treedwc
integer x = 389
integer y = 1588
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
end type

event modified;i_row= long(this.text)
end event

type cb_2 from commandbutton within w_test_treedwc
integer x = 1289
integer y = 1580
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CollapseAll"
end type

event clicked;dwc_Test.collapseall()
end event

type cb_1 from commandbutton within w_test_treedwc
integer x = 832
integer y = 1584
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ExpandAll"
end type

event clicked;dwc_Test.expandall()
end event

type dw_1 from datawindow within w_test_treedwc
event ue_expanded pbm_dwnexpanded
integer x = 41
integer y = 76
integer width = 2528
integer height = 1420
integer taborder = 10
string title = "none"
string dataobject = "d_treeview_comp_nogrid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_expanded;messagebox("user expanded",string(row))
end event

event expanded;messagebox("expanded",string(row)+":"+string(grouplevel))
end event

