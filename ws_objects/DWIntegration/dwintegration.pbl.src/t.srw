$PBExportHeader$t.srw
forward
global type t from window
end type
type dw_3 from datawindow within t
end type
type dw_2 from datawindow within t
end type
type cb_2 from commandbutton within t
end type
type dw_1 from datawindow within t
end type
type tab_1 from tab within t
end type
type tabpage_3 from userobject within tab_1
end type
type cb_grid_retrieve from commandbutton within tabpage_3
end type
type cb_filter from commandbutton within tabpage_3
end type
type cb_sort from commandbutton within tabpage_3
end type
type dw_grid from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_grid_retrieve cb_grid_retrieve
cb_filter cb_filter
cb_sort cb_sort
dw_grid dw_grid
end type
type tabpage_4 from userobject within tab_1
end type
type cb_composite_retrieve from commandbutton within tabpage_4
end type
type dw_composite from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_composite_retrieve cb_composite_retrieve
dw_composite dw_composite
end type
type tabpage_5 from userobject within tab_1
end type
type cb_cross_retrieve from commandbutton within tabpage_5
end type
type cb_1 from commandbutton within tabpage_5
end type
type dw_crosstab from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
cb_cross_retrieve cb_cross_retrieve
cb_1 cb_1
dw_crosstab dw_crosstab
end type
type tabpage_6 from userobject within tab_1
end type
type cb_name from commandbutton within tabpage_6
end type
type mle_1 from multilineedit within tabpage_6
end type
type cb_axis from commandbutton within tabpage_6
end type
type cb_graphtype from commandbutton within tabpage_6
end type
type ddlb_graph from dropdownlistbox within tabpage_6
end type
type rb_2 from radiobutton within tabpage_6
end type
type rb_1 from radiobutton within tabpage_6
end type
type dw_graph from datawindow within tabpage_6
end type
type tabpage_6 from userobject within tab_1
cb_name cb_name
mle_1 mle_1
cb_axis cb_axis
cb_graphtype cb_graphtype
ddlb_graph ddlb_graph
rb_2 rb_2
rb_1 rb_1
dw_graph dw_graph
end type
type tabpage_7 from userobject within tab_1
end type
type dw_tabular from vo_datawindow within tabpage_7
end type
type cb_label_retrieve from vo_button within tabpage_7
end type
type tabpage_7 from userobject within tab_1
dw_tabular dw_tabular
cb_label_retrieve cb_label_retrieve
end type
type tab_1 from tab within t
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type
type cb_close from commandbutton within t
end type
end forward

global type t from window
integer width = 4681
integer height = 2976
boolean titlebar = true
string title = "Untitled"
string menuname = "m_1"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_3 dw_3
dw_2 dw_2
cb_2 cb_2
dw_1 dw_1
tab_1 tab_1
cb_close cb_close
end type
global t t

type variables
integer i_mode=1
integer i_graphtype_index
//long i_Row,i_GroupLevel
end variables

on t.create
if this.MenuName = "m_1" then this.MenuID = create m_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.cb_2=create cb_2
this.dw_1=create dw_1
this.tab_1=create tab_1
this.cb_close=create cb_close
this.Control[]={this.dw_3,&
this.dw_2,&
this.cb_2,&
this.dw_1,&
this.tab_1,&
this.cb_close}
end on

on t.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.tab_1)
destroy(this.cb_close)
end on

type dw_3 from datawindow within t
integer x = 32
integer y = 1620
integer width = 1787
integer height = 760
integer taborder = 70
string title = "none"
string dataobject = "d_grid_grid"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within t
integer x = 32
integer y = 836
integer width = 1787
integer height = 760
integer taborder = 60
string title = "none"
string dataobject = "d_freeform_area"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within t
integer x = 146
integer y = 2512
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;dw_1.settransobject(sqlca)
dw_1.retrieve()

dw_2.settransobject(sqlca)
dw_2.retrieve()

dw_3.settransobject(sqlca)
dw_3.retrieve()
end event

type dw_1 from datawindow within t
integer x = 32
integer y = 52
integer width = 1787
integer height = 760
integer taborder = 60
string title = "none"
string dataobject = "d_crosstab_static"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within t
integer x = 1911
integer width = 2350
integer height = 2724
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type

on tab_1.create
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6,&
this.tabpage_7}
end on

on tab_1.destroy
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_7)
end on

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2313
integer height = 2596
long backcolor = 67108864
string text = "Grid"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_grid_retrieve cb_grid_retrieve
cb_filter cb_filter
cb_sort cb_sort
dw_grid dw_grid
end type

on tabpage_3.create
this.cb_grid_retrieve=create cb_grid_retrieve
this.cb_filter=create cb_filter
this.cb_sort=create cb_sort
this.dw_grid=create dw_grid
this.Control[]={this.cb_grid_retrieve,&
this.cb_filter,&
this.cb_sort,&
this.dw_grid}
end on

on tabpage_3.destroy
destroy(this.cb_grid_retrieve)
destroy(this.cb_filter)
destroy(this.cb_sort)
destroy(this.dw_grid)
end on

type cb_grid_retrieve from commandbutton within tabpage_3
integer x = 119
integer y = 48
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Retrieve"
end type

event clicked;dw_grid.settransobject(SQLCA)
dw_grid.retrieve()
end event

type cb_filter from commandbutton within tabpage_3
integer x = 1029
integer y = 48
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Filter"
end type

event clicked;int li_ret
string ls_str
setnull(ls_str)
li_ret=dw_grid.SetFilter(ls_str)
Messagebox("Return",li_ret)
dw_grid.Filter()

end event

type cb_sort from commandbutton within tabpage_3
integer x = 581
integer y = 52
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Sort"
end type

event clicked;integer li_ret
boolean lb_ret
string ls_str

//dw_1.retrieve(200,'F')
setnull(ls_str)
li_ret=dw_grid.SetSort(ls_str)
Messagebox("Return",li_ret)
dw_grid.sort()

end event

type dw_grid from datawindow within tabpage_3
integer x = 32
integer y = 200
integer width = 4082
integer height = 2352
integer taborder = 40
string title = "none"
string dataobject = "d_grid_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2313
integer height = 2596
long backcolor = 67108864
string text = "Composite"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_composite_retrieve cb_composite_retrieve
dw_composite dw_composite
end type

on tabpage_4.create
this.cb_composite_retrieve=create cb_composite_retrieve
this.dw_composite=create dw_composite
this.Control[]={this.cb_composite_retrieve,&
this.dw_composite}
end on

on tabpage_4.destroy
destroy(this.cb_composite_retrieve)
destroy(this.dw_composite)
end on

type cb_composite_retrieve from commandbutton within tabpage_4
integer x = 101
integer y = 40
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Retrieve"
end type

event clicked;dw_composite.settransobject(SQLCA)
dw_composite.retrieve()
end event

type dw_composite from datawindow within tabpage_4
integer x = 59
integer y = 176
integer width = 4059
integer height = 2384
integer taborder = 40
string title = "none"
string dataobject = "d_comp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2313
integer height = 2596
long backcolor = 67108864
string text = "Crosstab"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_cross_retrieve cb_cross_retrieve
cb_1 cb_1
dw_crosstab dw_crosstab
end type

on tabpage_5.create
this.cb_cross_retrieve=create cb_cross_retrieve
this.cb_1=create cb_1
this.dw_crosstab=create dw_crosstab
this.Control[]={this.cb_cross_retrieve,&
this.cb_1,&
this.dw_crosstab}
end on

on tabpage_5.destroy
destroy(this.cb_cross_retrieve)
destroy(this.cb_1)
destroy(this.dw_crosstab)
end on

type cb_cross_retrieve from commandbutton within tabpage_5
integer x = 142
integer y = 60
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Retrieve"
end type

event clicked;//dw_crosstab.dataobject="d_crosstab_static"
dw_crosstab.settransobject(sqlca)
dw_crosstab.retrieve()
end event

type cb_1 from commandbutton within tabpage_5
integer x = 635
integer y = 60
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Crosstab"
end type

event clicked;string ls_eval
integer li_ret

ls_eval = "CrosstabCount(1,1,'@sex')"
dw_crosstab.object.grand_sum_emp_id.expression = ls_eval
ls_eval = "CrosstabAvg(1,1,'@sex')"
dw_crosstab.object.grand_sum_emp_id.expression = ls_eval
ls_eval = "CrosstabMax(1,1,'@sex')"
dw_crosstab.object.grand_sum_emp_id.expression = ls_eval
ls_eval = "CrosstabSum(1,1,'@sex')"
dw_crosstab.object.grand_sum_emp_id.expression = ls_eval
ls_eval = "CrosstabMin(1,1,'@sex')"
dw_crosstab.object.grand_sum_emp_id.expression = ls_eval
li_ret=dw_crosstab.CrosstabDialog()
if li_ret<> 1 then
	Messagebox("Return",li_ret)
end if
end event

type dw_crosstab from datawindow within tabpage_5
integer x = 41
integer y = 212
integer width = 4064
integer height = 2348
integer taborder = 40
string title = "none"
string dataobject = "d_crosstab_static"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_6 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2313
integer height = 2596
long backcolor = 67108864
string text = "Graph"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_name cb_name
mle_1 mle_1
cb_axis cb_axis
cb_graphtype cb_graphtype
ddlb_graph ddlb_graph
rb_2 rb_2
rb_1 rb_1
dw_graph dw_graph
end type

on tabpage_6.create
this.cb_name=create cb_name
this.mle_1=create mle_1
this.cb_axis=create cb_axis
this.cb_graphtype=create cb_graphtype
this.ddlb_graph=create ddlb_graph
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_graph=create dw_graph
this.Control[]={this.cb_name,&
this.mle_1,&
this.cb_axis,&
this.cb_graphtype,&
this.ddlb_graph,&
this.rb_2,&
this.rb_1,&
this.dw_graph}
end on

on tabpage_6.destroy
destroy(this.cb_name)
destroy(this.mle_1)
destroy(this.cb_axis)
destroy(this.cb_graphtype)
destroy(this.ddlb_graph)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_graph)
end on

type cb_name from commandbutton within tabpage_6
integer x = 3054
integer y = 44
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Name"
end type

event clicked;mle_1.text = ""

string ls_name

ls_name = dw_graph.CategoryName("gr_1", 1)

mle_1.text = ls_name

string ls_SeriesName

ls_SeriesName = dw_graph.SeriesName("gr_1", 1)

mle_1.text = mle_1.text + "	" + ls_SeriesName


end event

type mle_1 from multilineedit within tabpage_6
integer x = 105
integer y = 164
integer width = 1294
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_axis from commandbutton within tabpage_6
integer x = 2482
integer y = 44
integer width = 576
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Axis object property"
end type

event clicked;mle_1.text = ""

string ls_data

/* Output data directly*/
//ls_data = dw_graph.Object.gr_1.Values
//dw_graph.Object.gr_1.Series = "100, 200"

/* Input data using describe and modify*/
ls_data = dw_graph.Describe("gr_1.Category")
mle_1.text = mle_1.text + "gr_1.Category:" + ls_data

ls_data = dw_graph.Describe("gr_1.Series")
mle_1.text = mle_1.text + "	" + "gr_1.Series:" + ls_data

ls_data = dw_graph.Describe("gr_1.Values")

mle_1.text = mle_1.text + "	" + "gr_1.Values:" + ls_data

//dw_graph.Modify("gr_1.Category='sex'")
//dw_graph.Modify("gr_1.Series='100, 200'")

end event

type cb_graphtype from commandbutton within tabpage_6
integer x = 1938
integer y = 44
integer width = 549
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Change graph type"
end type

event clicked;string setting

//setting = dw_graph.Object.gr_1.GraphType
//
//dw_graph.Object.gr_1.GraphType =  string(i_graphtype_index)
//
setting = dw_graph.Describe("gr_1.GraphType")

dw_graph.Modify("gr_1.GraphType=" + string(i_graphtype_index))

//CHOOSE CASE i_graphtype_index
//		
//CASE 1, 13, 14
//	sle_depth.Enabled = false
//	sle_elevation.Enabled = false
//	sle_overlap.Enabled = false
//	sle_perspective.Enabled = false
//	sle_rotation.Enabled = false
//	sle_shadecolor.Enabled = false
//	sle_spacing.Enabled = false
//	cbx_plotnulldata.Enabled = false
//CASE 12
//	sle_depth.Enabled = false
//	sle_elevation.Enabled = false
//	sle_overlap.Enabled = false
//	sle_perspective.Enabled = false
//	sle_rotation.Enabled = false
//	sle_shadecolor.Enabled = false
//	sle_spacing.Enabled = false
//	cbx_plotnulldata.Enabled = true	
//CASE 2, 4, 5, 6, 9, 10, 11
//	sle_depth.Enabled = false
//	sle_elevation.Enabled = false
//	sle_overlap.Enabled = true
//	sle_perspective.Enabled = false
//	sle_rotation.Enabled = false
//	sle_shadecolor.Enabled = false
//	sle_spacing.Enabled = true
//	cbx_plotnulldata.Enabled = false	
//CASE 7
//	sle_depth.Enabled = false
//	sle_elevation.Enabled = false
//	sle_overlap.Enabled = true
//	sle_perspective.Enabled = false
//	sle_rotation.Enabled = false
//	sle_shadecolor.Enabled = false
//	sle_spacing.Enabled = true	
//	cbx_plotnulldata.Enabled = false
//CASE 3, 8, 15, 16, 17
//	sle_depth.Enabled = true
//	sle_elevation.Enabled = true
//	sle_overlap.Enabled = false
//	sle_perspective.Enabled = true
//	sle_rotation.Enabled = true
//	sle_shadecolor.Enabled = true
//	sle_spacing.Enabled = true
//	cbx_plotnulldata.Enabled = false
//
//END CHOOSE
//
//IF rb_graphcontrol.checked = true THEN
//	cbx_moveable.Enabled = true
//ELSE
//	cbx_moveable.Enabled = false
//END IF
end event

type ddlb_graph from dropdownlistbox within tabpage_6
integer x = 1074
integer y = 52
integer width = 823
integer height = 636
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Area","Bar","Bar3D","Bar3DObj","BarStacked","BarStacked3DObj","Col","Col3D","Col3DObj","ColStacked","ColStacked3DObj","Line","Pie","Scatter","Area3D","Line3D","Pie3D"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;i_graphtype_index = index
end event

type rb_2 from radiobutton within tabpage_6
integer x = 635
integer y = 56
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "graphDW"
end type

event clicked;dw_graph.reset()
IF this.checked = true THEN
	dw_graph.dataObject = "d_graph"
	dw_graph.setTransObject(sqlca)
	dw_graph.retrieve()
END IF
end event

type rb_1 from radiobutton within tabpage_6
integer x = 105
integer y = 56
integer width = 411
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "graphcontrol"
end type

event clicked;dw_graph.reset()
IF this.checked = true THEN
	dw_graph.dataObject = "d_freeform_area"
	dw_graph.setTransObject(sqlca)
	dw_graph.retrieve()
END IF

end event

type dw_graph from datawindow within tabpage_6
integer x = 55
integer y = 316
integer width = 4050
integer height = 2212
integer taborder = 50
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_7 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2313
integer height = 2596
long backcolor = 67108864
string text = "Tabular_uo"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_tabular dw_tabular
cb_label_retrieve cb_label_retrieve
end type

on tabpage_7.create
this.dw_tabular=create dw_tabular
this.cb_label_retrieve=create cb_label_retrieve
this.Control[]={this.dw_tabular,&
this.cb_label_retrieve}
end on

on tabpage_7.destroy
destroy(this.dw_tabular)
destroy(this.cb_label_retrieve)
end on

type dw_tabular from vo_datawindow within tabpage_7
integer x = 96
integer y = 224
integer width = 4023
integer height = 2308
integer taborder = 30
string dataobject = "d_tabular_button"
end type

type cb_label_retrieve from vo_button within tabpage_7
integer x = 91
integer y = 52
integer taborder = 50
string text = "Retrieve"
end type

event clicked;call super::clicked;dw_tabular.settransobject(SQLCA)
dw_tabular.retrieve()
end event

type cb_close from commandbutton within t
integer x = 4297
integer y = 2624
integer width = 320
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;Close(w_1)
end event

