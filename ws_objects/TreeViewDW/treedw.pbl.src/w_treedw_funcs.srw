$PBExportHeader$w_treedw_funcs.srw
forward
global type w_treedw_funcs from window
end type
type cb_8 from commandbutton within w_treedw_funcs
end type
type cb_7 from commandbutton within w_treedw_funcs
end type
type cb_6 from commandbutton within w_treedw_funcs
end type
type sle_msg from multilineedit within w_treedw_funcs
end type
type sle_grouplevel from singlelineedit within w_treedw_funcs
end type
type sle_row from singlelineedit within w_treedw_funcs
end type
type cb_5 from commandbutton within w_treedw_funcs
end type
type st_3 from statictext within w_treedw_funcs
end type
type cb_4 from commandbutton within w_treedw_funcs
end type
type cbx_selectnodebymouse from checkbox within w_treedw_funcs
end type
type cbx_eventcancel from checkbox within w_treedw_funcs
end type
type cbx_selecttreenode from checkbox within w_treedw_funcs
end type
type cb_3 from commandbutton within w_treedw_funcs
end type
type cb_2 from commandbutton within w_treedw_funcs
end type
type cb_1 from commandbutton within w_treedw_funcs
end type
type cb_expandlevel from commandbutton within w_treedw_funcs
end type
type cb_collapseallchildren from commandbutton within w_treedw_funcs
end type
type cb_expandallchildren from commandbutton within w_treedw_funcs
end type
type cb_collapseall from commandbutton within w_treedw_funcs
end type
type cb_expandall from commandbutton within w_treedw_funcs
end type
type cb_collapse from commandbutton within w_treedw_funcs
end type
type cb_expand from commandbutton within w_treedw_funcs
end type
type st_2 from statictext within w_treedw_funcs
end type
type st_1 from statictext within w_treedw_funcs
end type
type cb_collapselevel from commandbutton within w_treedw_funcs
end type
type dw_1 from datawindow within w_treedw_funcs
end type
end forward

global type w_treedw_funcs from window
integer width = 2656
integer height = 2756
boolean titlebar = true
string title = "TreeViewDW Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
sle_msg sle_msg
sle_grouplevel sle_grouplevel
sle_row sle_row
cb_5 cb_5
st_3 st_3
cb_4 cb_4
cbx_selectnodebymouse cbx_selectnodebymouse
cbx_eventcancel cbx_eventcancel
cbx_selecttreenode cbx_selecttreenode
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_expandlevel cb_expandlevel
cb_collapseallchildren cb_collapseallchildren
cb_expandallchildren cb_expandallchildren
cb_collapseall cb_collapseall
cb_expandall cb_expandall
cb_collapse cb_collapse
cb_expand cb_expand
st_2 st_2
st_1 st_1
cb_collapselevel cb_collapselevel
dw_1 dw_1
end type
global w_treedw_funcs w_treedw_funcs

type variables
long i_Row,i_GroupLevel
end variables

on w_treedw_funcs.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.sle_msg=create sle_msg
this.sle_grouplevel=create sle_grouplevel
this.sle_row=create sle_row
this.cb_5=create cb_5
this.st_3=create st_3
this.cb_4=create cb_4
this.cbx_selectnodebymouse=create cbx_selectnodebymouse
this.cbx_eventcancel=create cbx_eventcancel
this.cbx_selecttreenode=create cbx_selecttreenode
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_expandlevel=create cb_expandlevel
this.cb_collapseallchildren=create cb_collapseallchildren
this.cb_expandallchildren=create cb_expandallchildren
this.cb_collapseall=create cb_collapseall
this.cb_expandall=create cb_expandall
this.cb_collapse=create cb_collapse
this.cb_expand=create cb_expand
this.st_2=create st_2
this.st_1=create st_1
this.cb_collapselevel=create cb_collapselevel
this.dw_1=create dw_1
this.Control[]={this.cb_8,&
this.cb_7,&
this.cb_6,&
this.sle_msg,&
this.sle_grouplevel,&
this.sle_row,&
this.cb_5,&
this.st_3,&
this.cb_4,&
this.cbx_selectnodebymouse,&
this.cbx_eventcancel,&
this.cbx_selecttreenode,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_expandlevel,&
this.cb_collapseallchildren,&
this.cb_expandallchildren,&
this.cb_collapseall,&
this.cb_expandall,&
this.cb_collapse,&
this.cb_expand,&
this.st_2,&
this.st_1,&
this.cb_collapselevel,&
this.dw_1}
end on

on w_treedw_funcs.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.sle_msg)
destroy(this.sle_grouplevel)
destroy(this.sle_row)
destroy(this.cb_5)
destroy(this.st_3)
destroy(this.cb_4)
destroy(this.cbx_selectnodebymouse)
destroy(this.cbx_eventcancel)
destroy(this.cbx_selecttreenode)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_expandlevel)
destroy(this.cb_collapseallchildren)
destroy(this.cb_expandallchildren)
destroy(this.cb_collapseall)
destroy(this.cb_expandall)
destroy(this.cb_collapse)
destroy(this.cb_expand)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_collapselevel)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type cb_8 from commandbutton within w_treedw_funcs
integer x = 2181
integer y = 416
integer width = 402
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;OpenWithparm( w_newfeature,dw_1)
end event

type cb_7 from commandbutton within w_treedw_funcs
integer x = 91
integer y = 2468
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;dw_1.triggerevent(collapsed!)
end event

type cb_6 from commandbutton within w_treedw_funcs
integer x = 101
integer y = 2264
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Reset"
end type

event clicked;sle_msg.text=""
end event

type sle_msg from multilineedit within w_treedw_funcs
integer x = 594
integer y = 2100
integer width = 1792
integer height = 456
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type sle_grouplevel from singlelineedit within w_treedw_funcs
integer x = 485
integer y = 188
integer width = 402
integer height = 96
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;i_GroupLevel= long(this.text)
end event

type sle_row from singlelineedit within w_treedw_funcs
integer x = 485
integer y = 64
integer width = 402
integer height = 100
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;i_row= long(this.text)
end event

type cb_5 from commandbutton within w_treedw_funcs
integer x = 1682
integer y = 424
integer width = 471
integer height = 92
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "IsSelected"
end type

event clicked;if dw_1.isselected(i_row) then
	sle_msg.text= string(i_row) +" is selected"
else
	sle_msg.text= string(i_row) +" is unselected"
end if
end event

type st_3 from statictext within w_treedw_funcs
integer x = 78
integer y = 2104
integer width = 494
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Event Message:"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_treedw_funcs
integer x = 1189
integer y = 424
integer width = 407
integer height = 92
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SelectRow"
end type

event clicked;if cbx_eventcancel.checked then
	dw_1.selectrow(i_row,false)
else
	dw_1.selectrow(i_row,true)
end if

end event

type cbx_selectnodebymouse from checkbox within w_treedw_funcs
integer x = 82
integer y = 420
integer width = 603
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SelectNodeByMouse"
boolean lefttext = true
end type

event clicked;string ls_SelectNodeByMouse
if cbx_SelectNodeByMouse.checked then
	ls_SelectNodeByMouse='yes'
else
	ls_SelectNodeByMouse='no'
end if
dw_1.object.datawindow.tree.SelectNodeByMouse=ls_SelectNodeByMouse

end event

type cbx_eventcancel from checkbox within w_treedw_funcs
integer x = 663
integer y = 312
integer width = 279
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cancel"
boolean lefttext = true
end type

type cbx_selecttreenode from checkbox within w_treedw_funcs
integer x = 82
integer y = 312
integer width = 498
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SelectTreeNode"
boolean lefttext = true
end type

type cb_3 from commandbutton within w_treedw_funcs
integer x = 1623
integer y = 308
integer width = 471
integer height = 92
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SelectTreeNode"
end type

event clicked;int ret
ret=dw_1.selecttreenode( i_Row, i_GroupLevel,cbx_SelectTreeNode.checked)
//ret=dw_1.selecttreenode( i_Row+1, i_GroupLevel,not(cbx_SelectTreeNode.checked))
if ret<>1 then
	Messagebox("return",ret)
end if
end event

type cb_2 from commandbutton within w_treedw_funcs
integer x = 2135
integer y = 308
integer width = 411
integer height = 92
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_treedw_funcs
integer x = 1184
integer y = 312
integer width = 411
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "IsExpanded"
end type

event clicked;int li_ret
boolean lb_ret
lb_ret= dw_1.IsExpanded(i_row,i_grouplevel)
if lb_ret then 
	Messagebox("Return","true")
else
      Messagebox("Return","false")
end if
end event

type cb_expandlevel from commandbutton within w_treedw_funcs
integer x = 2158
integer y = 68
integer width = 402
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ExpandLevel"
boolean cancel = true
end type

event clicked;int li_ret

li_ret= dw_1.expandlevel(i_grouplevel)
Messagebox("Return",li_ret)
end event

type cb_collapseallchildren from commandbutton within w_treedw_funcs
integer x = 1609
integer y = 176
integer width = 521
integer height = 92
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CollapseAllChildren"
end type

event clicked;int li_ret

li_ret= dw_1.collapseallchildren(i_row,i_grouplevel)
Messagebox("Return",li_ret)
end event

type cb_expandallchildren from commandbutton within w_treedw_funcs
integer x = 1609
integer y = 68
integer width = 521
integer height = 92
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ExpandAllChildren"
end type

event clicked;int li_ret

li_ret= dw_1.expandallchildren(i_row,i_grouplevel)
Messagebox("Return",li_ret)
end event

type cb_collapseall from commandbutton within w_treedw_funcs
integer x = 1248
integer y = 176
integer width = 338
integer height = 92
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CollapseAll"
end type

event clicked;int li_ret

li_ret= dw_1.collapseall()
Messagebox("Return",li_ret)
end event

type cb_expandall from commandbutton within w_treedw_funcs
integer x = 1248
integer y = 68
integer width = 338
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ExpandAll"
end type

event clicked;int li_ret

li_ret= dw_1.expandall()
Messagebox("Return",li_ret)
end event

type cb_collapse from commandbutton within w_treedw_funcs
integer x = 946
integer y = 180
integer width = 283
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Collapse"
end type

event clicked;int li_ret

li_ret= dw_1.collapse(i_row,i_grouplevel)
Messagebox("Return",li_ret)
end event

type cb_expand from commandbutton within w_treedw_funcs
integer x = 942
integer y = 68
integer width = 283
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Expand"
end type

event clicked;int li_ret

li_ret= dw_1.expand(i_row,i_grouplevel)
Messagebox("Return",li_ret)
end event

type st_2 from statictext within w_treedw_funcs
integer x = 78
integer y = 188
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "GroupLevel:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_treedw_funcs
integer x = 87
integer y = 80
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "RowValue:"
boolean focusrectangle = false
end type

type cb_collapselevel from commandbutton within w_treedw_funcs
integer x = 2158
integer y = 176
integer width = 407
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CollapseLevel"
end type

event clicked;int li_ret

li_ret= dw_1.collapselevel(i_grouplevel)
Messagebox("Return",li_ret)
end event

type dw_1 from datawindow within w_treedw_funcs
event ue_collapsed pbm_dwncollapsed
event ue_collapsing pbm_dwncollapsing
event ue_expanded pbm_dwnexpanded
event ue_expanding pbm_dwnexpanding
event ue_treenodeselecting pbm_dwntreenodeselecting
event ue_treenodeselected pbm_dwntreenodeselected
event ue_clicked pbm_dwnlbuttonclk
integer x = 27
integer y = 548
integer width = 2514
integer height = 1500
integer taborder = 10
string title = "none"
string dataobject = "d_treeview_demo_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_collapsed;//Messagebox("Collapsed:Row:GroupLevel",string(row)+":"+string(grouplevel))
sle_msg.text+= "Collapsed:Row:GroupLevel "+string(row)+":"+string(grouplevel)+"~r~n"
end event

event ue_collapsing;//Messagebox("Collapsing:Row:GroupLevel",string(row)+":"+string(grouplevel))
sle_msg.text+= "Collapsing:Row:GroupLevel "+string(row)+":"+string(grouplevel)+"~r~n"
if cbx_eventcancel.checked then
	return 1
else
	return 0
end if
end event

event ue_expanded;//Messagebox("Expanded:Row:GroupLevel",string(row)+":"+string(grouplevel))
sle_msg.text+= "Expanded:Row:GroupLevel "+string(row)+":"+string(grouplevel)+"~r~n"
end event

event ue_expanding;//Messagebox("Expanding:Row:GroupLevel",string(row)+":"+string(grouplevel))
sle_msg.text+= "Expanding:Row:GroupLevel"+string(row)+":"+string(grouplevel)+"~r~n"
if cbx_eventcancel.checked then
	return 1
else
	return 0 
end if
end event

event ue_treenodeselecting;//Messagebox("treenodeselecting:Row:GroupLevel",string(row)+":"+string(grouplevel))
sle_msg.text+="treenodeselecting:Row:GroupLevel "+string(row)+":"+string(grouplevel)+"~r~n"
if cbx_eventcancel.checked then
	return 1
else
	return 0
end if
end event

event ue_treenodeselected;//Messagebox("treenodeselected:Row:GroupLevel",string(row)+":"+string(grouplevel))
sle_msg.text+= "treenodeselected:Row:GroupLevel"+string(row)+":"+string(grouplevel)+"~r~n"
end event

event ue_clicked;//sle_msg.text+="Clicked1: band "+this.GetBandAtPointer( )+"~r~n"
end event

event rowfocuschanging;//Messagebox("Rowfocuschanging:OldRow:NewRow",string(currentrow)+":"+string(newrow))
sle_msg.text+="Rowfocuschanging:OldRow:NewRow "+string(currentrow)+":"+string(newrow)+"~r~n"
end event

event clicked;sle_msg.text+="Clicked: band "+this.GetBandAtPointer( )+"~r~n"
end event

event editchanged;sle_msg.text+="EditChanged:  "+string(row)+"~r~n"
end event

event collapsing;sle_msg.text+= "Collapsing0:Row:GroupLevel "+string(row)+":"+string(grouplevel)+"~r~n"
if cbx_eventcancel.checked then
	return 1
else
	return 0
end if
end event

event collapsed;
sle_msg.text+= "Collapsed0:Row:GroupLevel "+string(row)+":"+string(grouplevel)+"~r~n"
if cbx_eventcancel.checked then
	return 1
else   
	return 0
end if  
 
end event

event treenodeselecting;sle_msg.text+="treenodeselecting0:Row:GroupLevel "+string(row)+":"+string(grouplevel)+"~r~n"
if cbx_eventcancel.checked then
	return 1
else
	return 0
end if
end event

event treenodeselected;sle_msg.text+="treenodeselected0:Row:GroupLevel "+string(row)+":"+string(grouplevel)+"~r~n"
if cbx_eventcancel.checked then
	return 1
else
	return 0
end if
end event

event expanding;//Messagebox("Expanding:Row:GroupLevel",string(row)+":"+string(grouplevel))
sle_msg.text+= "Expanding0:Row:GroupLevel"+string(row)+":"+string(grouplevel)+"~r~n"
if cbx_eventcancel.checked then
	return 1
else
	return 0 
end if
end event

event expanded;//Messagebox("Expanded:Row:GroupLevel",string(row)+":"+string(grouplevel))
sle_msg.text+= "Expanded0:Row:GroupLevel "+string(row)+":"+string(grouplevel)+"~r~n"
end event

