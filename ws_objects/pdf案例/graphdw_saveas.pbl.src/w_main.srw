$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_15 from commandbutton within w_main
end type
type cb_14 from commandbutton within w_main
end type
type cb_13 from uo_saveas within w_main
end type
type cbx_4 from checkbox within w_main
end type
type em_4 from editmask within w_main
end type
type cb_12 from commandbutton within w_main
end type
type cbx_3 from checkbox within w_main
end type
type cbx_2 from checkbox within w_main
end type
type cb_11 from commandbutton within w_main
end type
type htb_1 from htrackbar within w_main
end type
type st_1 from statictext within w_main
end type
type cbx_1 from checkbox within w_main
end type
type cb_10 from commandbutton within w_main
end type
type cb_9 from commandbutton within w_main
end type
type cb_8 from commandbutton within w_main
end type
type cb_7 from commandbutton within w_main
end type
type em_3 from editmask within w_main
end type
type cb_6 from commandbutton within w_main
end type
type cb_5 from commandbutton within w_main
end type
type em_2 from editmask within w_main
end type
type cb_4 from commandbutton within w_main
end type
type dw_2 from datawindow within w_main
end type
type cb_3 from commandbutton within w_main
end type
type em_1 from editmask within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
type dw_1 from datawindow within w_main
end type
type gb_1 from groupbox within w_main
end type
end forward

global type w_main from window
integer width = 4119
integer height = 2352
boolean titlebar = true
string title = "Graph&free"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_15 cb_15
cb_14 cb_14
cb_13 cb_13
cbx_4 cbx_4
em_4 em_4
cb_12 cb_12
cbx_3 cbx_3
cbx_2 cbx_2
cb_11 cb_11
htb_1 htb_1
st_1 st_1
cbx_1 cbx_1
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
em_3 em_3
cb_6 cb_6
cb_5 cb_5
em_2 em_2
cb_4 cb_4
dw_2 dw_2
cb_3 cb_3
em_1 em_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_main w_main

type variables
eon_appeon_resize  ieon_resize
end variables

on w_main.create
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cbx_4=create cbx_4
this.em_4=create em_4
this.cb_12=create cb_12
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cb_11=create cb_11
this.htb_1=create htb_1
this.st_1=create st_1
this.cbx_1=create cbx_1
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.em_3=create em_3
this.cb_6=create cb_6
this.cb_5=create cb_5
this.em_2=create em_2
this.cb_4=create cb_4
this.dw_2=create dw_2
this.cb_3=create cb_3
this.em_1=create em_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_15,&
this.cb_14,&
this.cb_13,&
this.cbx_4,&
this.em_4,&
this.cb_12,&
this.cbx_3,&
this.cbx_2,&
this.cb_11,&
this.htb_1,&
this.st_1,&
this.cbx_1,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.em_3,&
this.cb_6,&
this.cb_5,&
this.em_2,&
this.cb_4,&
this.dw_2,&
this.cb_3,&
this.em_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_main.destroy
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cbx_4)
destroy(this.em_4)
destroy(this.cb_12)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cb_11)
destroy(this.htb_1)
destroy(this.st_1)
destroy(this.cbx_1)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.em_3)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.em_2)
destroy(this.cb_4)
destroy(this.dw_2)
destroy(this.cb_3)
destroy(this.em_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;ieon_resize.of_init( this,false)
ieon_resize.of_zoom( true,3)
end event

event resize;ieon_resize.of_resize(this,newwidth,newheight,true)
end event

type cb_15 from commandbutton within w_main
integer x = 2921
integer y = 2080
integer width = 457
integer height = 132
integer taborder = 100
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF 2"
end type

event clicked;OpenWithparm( w_newfeature,dw_2)
end event

type cb_14 from commandbutton within w_main
integer x = 923
integer y = 2092
integer width = 457
integer height = 132
integer taborder = 90
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF"
end type

event clicked;OpenWithparm( w_newfeature,dw_1)
end event

type cb_13 from uo_saveas within w_main
integer x = 2290
integer y = 684
integer taborder = 30
end type

event clicked;call super::clicked;dw_2.object.p_2.filename = 'login_btn.jpg'

dw_2.object.p_2.width = 1000
dw_2.object.p_2.height = 200

of_saveas(dw_2,cbx_4.checked)
end event

type cbx_4 from checkbox within w_main
integer x = 3351
integer y = 1916
integer width = 402
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PB"
end type

type em_4 from editmask within w_main
integer x = 3337
integer y = 1548
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
double increment = 1
string minmax = "0~~4"
end type

type cb_12 from commandbutton within w_main
integer x = 3333
integer y = 1728
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "lenge"
end type

event clicked;dw_1.Modify("gr_1.Legend='"+em_4.text+"'")
end event

type cbx_3 from checkbox within w_main
integer x = 2341
integer y = 1928
integer width = 457
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Graph"
end type

type cbx_2 from checkbox within w_main
integer x = 2341
integer y = 1824
integer width = 457
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DataStore"
end type

type cb_11 from commandbutton within w_main
integer x = 1664
integer y = 1880
integer width = 466
integer height = 132
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "elevate"
end type

event clicked;long ll_elevate


ll_elevate = long(htb_1.position)

dw_1.modify( "gr_1.Elevation='"+string(ll_elevate)+"'")
end event

type htb_1 from htrackbar within w_main
integer x = 507
integer y = 1896
integer width = 1125
integer height = 136
integer minposition = -90
integer maxposition = 90
integer position = -90
integer tickfrequency = 10
end type

event moved;cb_11.triggerevent(clicked!)
end event

type st_1 from statictext within w_main
integer x = 69
integer y = 1932
integer width = 338
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Elevation"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_main
integer x = 2341
integer y = 1728
integer width = 416
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Render3D"
end type

type cb_10 from commandbutton within w_main
boolean visible = false
integer x = 2514
integer y = 1716
integer width = 265
integer height = 132
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Fill"
end type

event clicked;integer li_dw_set,li_ds_set
integer li_dw_get,li_ds_get
//Data point's colors
long ll_dw_data_color,ll_ds_data_color
//Line style and width used by the data point
LineStyle linestyle_dw_data,linestyle_ds_data
integer li_dw_data_linewidth,li_ds_data_linewidth
//Fill pattern for the data point 
FillPattern fp_dw_data,fp_ds_data
//Symbol for the data point 
grSymbolType symbol_type
//ResetDataColors
integer li_dw_reset,li_ds_reset
boolean lb_dw_setdata,lb_ds_setdata
boolean lb_dw_getdata,lb_ds_getdata
lb_dw_setdata=true
lb_ds_setdata=true
lb_dw_getdata=true
lb_ds_getdata=true
string a_s_graph
a_s_graph="gr_1"

//Data point's colors:LineColor
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,LineColor!,RGB(0,0,0))
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,LineColor!,ll_dw_data_color)
if li_dw_get<>1 or ll_dw_data_color<> RGB(0,0,0) then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),ll_dw_data_color)
end if
//Data point's colors:ForeGround
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,ForeGround!,RGB(255,255,255))
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,ForeGround!,ll_dw_data_color)
if li_dw_get<>1 or ll_dw_data_color<> RGB(255,255,255) then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),ll_dw_data_color)
end if
//Data point's colors:BackGround
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,BackGround!,RGB(192,192,192))
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,BackGround!,ll_dw_data_color)
if li_dw_get<>1 or ll_dw_data_color<> RGB(192,192,192) then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),ll_dw_data_color)
end if
//Data point's colors:Shade
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,shade!,RGB(0,0,192))
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,shade!,ll_dw_data_color)
if li_dw_get<>1 or ll_dw_data_color<> RGB(0,0,192) then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),ll_dw_data_color)
end if
//Line style and width used by the data point
//Continuous! Dash!	DashDot! DashDotDot!	Dot!	Transparent!
//Continuous
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,Continuous!,5)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,linestyle_dw_data,li_dw_data_linewidth)
if li_dw_get<>1 or li_dw_data_linewidth<> 5 or  linestyle_dw_data<>Continuous! then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),li_dw_data_linewidth)
end if
//Dash
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,Dash!,10)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,linestyle_dw_data,li_dw_data_linewidth)
if li_dw_get<>1 or li_dw_data_linewidth<> 10 or  linestyle_dw_data<>Dash! then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),li_dw_data_linewidth)
end if
//DashDot
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,DashDot!,5)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,linestyle_dw_data,li_dw_data_linewidth)
if li_dw_get<>1 or li_dw_data_linewidth<> 5 or  linestyle_dw_data<>DashDot! then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),li_dw_data_linewidth)
end if
//Dot
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,Dot!,10)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,linestyle_dw_data,li_dw_data_linewidth)
if li_dw_get<>1 or li_dw_data_linewidth<> 10 or  linestyle_dw_data<>Dot! then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),li_dw_data_linewidth)
end if
//Transparent
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,Transparent!,1)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,linestyle_dw_data,li_dw_data_linewidth)
if li_dw_get<>1 or li_dw_data_linewidth<> 0 or  linestyle_dw_data<>Transparent! then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),li_dw_data_linewidth)
end if
//Fill pattern for the data point 
//Solid!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,Solid!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,fp_dw_data)
if li_dw_get<>1 or fp_dw_data<>Solid! then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),"solid")
end if
//Horizontal!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,Horizontal!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,fp_dw_data)
if li_dw_get<>1 or fp_dw_data<>Horizontal! then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),"Horizontal")
end if
//Vertical!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,Vertical!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,fp_dw_data)
if li_dw_get<>1 or fp_dw_data<>Vertical! then
	lb_dw_getdata=false
end if
if  lb_dw_getdata =false then
	//messagebox(string(li_dw_get),"Horizontal")
end if
//FDiagonal!
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,FDiagonal!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,fp_dw_data)
if li_dw_get<>1 or fp_dw_data<>FDiagonal! then
	lb_dw_getdata=false
end if
//BDiagonal!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,BDiagonal!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,fp_dw_data)
if li_dw_get<>1 or fp_dw_data<>BDiagonal! then
	lb_dw_getdata=false
end if
//Square!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,Square!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,fp_dw_data)
if li_dw_get<>1 or fp_dw_data<>Square! then
	lb_dw_getdata=false
end if
//Diamond!
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,Diamond!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,fp_dw_data)
if li_dw_get<>1 or fp_dw_data<>Diamond! then
	lb_dw_getdata=false
end if

////Symbol for the data point :grSymbolType symbol_type
//NoSymbol!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,NoSymbol!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>NoSymbol! then
	lb_dw_getdata=false
end if
//SymbolHollowBox!
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolHollowBox!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolHollowBox! then
	lb_dw_getdata=false
end if
//SymbolX!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolX!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolX! then
	lb_dw_getdata=false
end if
//SymbolStar!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolStar!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolStar! then
	lb_dw_getdata=false
end if
//SymbolHollowUpArrow!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolHollowUpArrow!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolHollowUpArrow! then
	lb_dw_getdata=false
end if
//SymbolHollowDownArrow!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolHollowDownArrow!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolHollowDownArrow! then
	lb_dw_getdata=false
end if
//SymbolHollowCircle!
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolHollowCircle!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolHollowCircle! then
	lb_dw_getdata=false
end if
//SymbolHollowDiamond!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolHollowDiamond!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolHollowDiamond! then
	lb_dw_getdata=false
end if
//SymbolSolidBox!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolSolidBox!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolSolidBox! then
	lb_dw_getdata=false
end if
//SymbolSolidDownArrow!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolSolidDownArrow!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolSolidDownArrow! then
	lb_dw_getdata=false
end if
//SymbolSolidUpArrow!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolSolidUpArrow!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolSolidUpArrow! then
	lb_dw_getdata=false
end if
//SymbolSolidDiamond!
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolSolidDiamond!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolSolidDiamond! then
	lb_dw_getdata=false
end if
//SymbolSolidCircle!	
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolSolidCircle!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolSolidCircle! then
	lb_dw_getdata=false
end if
//SymbolPlus!		
li_dw_set=dw_1.SetdataStyle(a_s_graph,3,1,SymbolPlus!)
if li_dw_set<>1 then
	lb_dw_setdata=false
end if
li_dw_get=dw_1.GetdataStyle(a_s_graph,3,1,symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolPlus! then
	lb_dw_getdata=false
end if

if lb_dw_setdata =false then
	messagebox("fail", "DataWindow SetdataStyle function failed .")
else
	//messagebox("pass", "DataWindow SetdataStyle function passed.")
end if
if lb_dw_getdata =false then
	messagebox("fail",  "DataWindow GetdataStyle function failed .")
else
	//messagebox("pass", "DataWindow GetdataStyle function passed.")
end if




end event

type cb_9 from commandbutton within w_main
integer x = 2853
integer y = 1876
integer width = 434
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "pieFill"
end type

event clicked;integer li_dw_set,li_ds_set
integer li_dw_get,li_ds_get
//Data point's colors
long ll_dw_series_color,ll_ds_series_color
//Line style and width used by the data point
LineStyle linestyle_dw_series,linestyle_ds_series
integer li_dw_series_linewidth,li_ds_series_linewidth
//Fill pattern for the data point 
FillPattern fp_dw_series,fp_ds_series
//Symbol for the data point 
grSymbolType symbol_type

boolean lb_dw_setseries,lb_ds_setseries
boolean lb_dw_getseries,lb_ds_getseries
lb_dw_setseries=true
lb_ds_setseries=true
lb_dw_getseries=true
lb_ds_getseries=true
string a_s_graph
a_s_graph="gr_1"

//Data point's colors:LineColor
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Black",LineColor!,RGB(0,0,0))
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Black",LineColor!,ll_dw_series_color)
if li_dw_get<>1 or ll_dw_series_color<> RGB(0,0,0) then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("a:"+string(li_dw_get),ll_dw_series_color)
end if

//Data point's colors:ForeGround
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Blue",ForeGround!,RGB(255,255,255))
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Blue",ForeGround!,ll_dw_series_color)
if li_dw_get<>1 or ll_dw_series_color<> RGB(255,255,255) then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("b:"+string(li_dw_get),ll_dw_series_color)
end if
//Data point's colors:BackGround
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Green",BackGround!,RGB(192,192,192))
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Green",BackGround!,ll_dw_series_color)
if li_dw_get<>1 or ll_dw_series_color<> RGB(192,192,192) then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("c:"+string(li_dw_get),ll_dw_series_color)
end if
//Data point's colors:Shade
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Orange",shade!,RGB(0,0,192))
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Orange",shade!,ll_dw_series_color)
if li_dw_get<>1 or ll_dw_series_color<> RGB(0,0,192) then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("d:"+string(li_dw_get),ll_dw_series_color)
end if
//Line style and width used by the data point
//Continuous! Dash!	DashDot! DashDotDot!	Dot!	Transparent!
//Continuous
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Orange",Continuous!,5)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Orange",linestyle_dw_series,li_dw_series_linewidth)
if li_dw_get<>1 or li_dw_series_linewidth<> 5 or  linestyle_dw_series<>Continuous! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("1:"+string(li_dw_get),li_dw_series_linewidth)
end if
//Dash
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"White",Dash!,10)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"White",linestyle_dw_series,li_dw_series_linewidth)
if li_dw_get<>1 or li_dw_series_linewidth<> 10 or  linestyle_dw_series<>Dash! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("2:"+string(li_dw_get),li_dw_series_linewidth)
end if
//DashDot
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Blue",DashDot!,5)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Blue",linestyle_dw_series,li_dw_series_linewidth)
if li_dw_get<>1 or li_dw_series_linewidth<> 5 or  linestyle_dw_series<>DashDot! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("3:"+string(li_dw_get),li_dw_series_linewidth)
end if
//Dot
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Green",Dot!,10)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Green",linestyle_dw_series,li_dw_series_linewidth)
if li_dw_get<>1 or li_dw_series_linewidth<> 10 or  linestyle_dw_series<>Dot! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("4:"+string(li_dw_get),li_dw_series_linewidth)
end if
//Transparent
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Black",Transparent!,1)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Black",linestyle_dw_series,li_dw_series_linewidth)
if li_dw_get<>1 or li_dw_series_linewidth<> 0 or  linestyle_dw_series<>Transparent! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("5:"+string(li_dw_get),string(li_dw_series_linewidth)+":"+string(linestyle_dw_series))
end if
//Fill pattern for the data point 
//Solid!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Black",Solid!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Black",fp_dw_series)
if li_dw_get<>1 or fp_dw_series<>Solid! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Fill pattern for the data point :"+string(li_dw_get),string(fp_dw_series))
end if
//Horizontal!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Blue",Horizontal!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Blue",fp_dw_series)
if li_dw_get<>1 or fp_dw_series<>Horizontal! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Fill pattern for the data point :"+string(li_dw_get),string(fp_dw_series))
end if
//Vertical!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Green",Vertical!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Green",fp_dw_series)
if li_dw_get<>1 or fp_dw_series<>Vertical! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Fill pattern for the data point :"+string(li_dw_get),string(fp_dw_series))
end if
//FDiagonal!
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Orange",FDiagonal!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Orange",fp_dw_series)
if li_dw_get<>1 or fp_dw_series<>FDiagonal! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Fill pattern for the data point :"+string(li_dw_get),string(fp_dw_series))
end if
//BDiagonal!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"White",BDiagonal!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"White",fp_dw_series)
if li_dw_get<>1 or fp_dw_series<>BDiagonal! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Fill pattern for the data point :"+string(li_dw_get),string(fp_dw_series))
end if
//Square!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Black",Square!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Black",fp_dw_series)
if li_dw_get<>1 or fp_dw_series<>Square! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Fill pattern for the data point :"+string(li_dw_get),string(fp_dw_series))
end if
//Diamond!
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Blue",Diamond!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Blue",fp_dw_series)
if li_dw_get<>1 or fp_dw_series<>Diamond! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Fill pattern for the data point :"+string(li_dw_get),string(fp_dw_series))
end if
////Symbol for the data point :grSymbolType symbol_type
//NoSymbol!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Black",NoSymbol!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Black",symbol_type)
if li_dw_get<>1 or symbol_type<>NoSymbol! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolHollowBox!
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Blue",SymbolHollowBox!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Blue",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolHollowBox! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolX!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Green",SymbolX!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Green",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolX! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolStar!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Orange",SymbolStar!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Orange",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolStar! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolHollowUpArrow!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"White",SymbolHollowUpArrow!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"White",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolHollowUpArrow! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolHollowDownArrow!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Black",SymbolHollowDownArrow!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Black",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolHollowDownArrow! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolHollowCircle!
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Blue",SymbolHollowCircle!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Blue",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolHollowCircle! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolHollowDiamond!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Green",SymbolHollowDiamond!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Green",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolHollowDiamond! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolSolidBox!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Orange",SymbolSolidBox!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Orange",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolSolidBox! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolSolidDownArrow!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"White",SymbolSolidDownArrow!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"White",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolSolidDownArrow! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolSolidUpArrow!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Black",SymbolSolidUpArrow!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Black",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolSolidUpArrow! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolSolidDiamond!
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Blue",SymbolSolidDiamond!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Blue",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolSolidDiamond! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolSolidCircle!	
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Green",SymbolSolidCircle!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Green",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolSolidCircle! then
	lb_dw_getseries=false
end if
if  lb_dw_getseries =false then
	//messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
end if
//SymbolPlus!		
li_dw_set=dw_1.SetSeriesStyle(a_s_graph,"Orange",SymbolPlus!)
if li_dw_set<>1 then
	lb_dw_setseries=false
end if
li_dw_get=dw_1.GetSeriesStyle(a_s_graph,"Orange",symbol_type)
if li_dw_get<>1 or symbol_type<>SymbolPlus! then
	lb_dw_getseries=false
end if
//if  lb_dw_getseries =false then
//	messagebox("Symbol for the data point :"+string(li_dw_get),string(symbol_type))
//end if
if lb_dw_setseries =false then
	messagebox("fail", "DataWindow SetSeriesStyle function failed .")
else
	//messagebox("pass", "DataWindow SetSeriesStyle function passed.")
end if
if lb_dw_getseries =false then
	messagebox("fail", "DataWindow GetSeriesStyle function failed .")
else
	//messagebox("pass", "DataWindow GetSeriesStyle function passed.")
end if


end event

type cb_8 from commandbutton within w_main
integer x = 1664
integer y = 1728
integer width = 466
integer height = 132
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "print"
end type

event clicked;dw_1.print( )
end event

type cb_7 from commandbutton within w_main
integer x = 46
integer y = 1732
integer width = 457
integer height = 132
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "double"
end type

event clicked;double  ld_1 = 0.0

string ls_mess

ls_mess = string(ld_1,"#0.0")

messagebox("",ls_mess)
end event

type em_3 from editmask within w_main
integer x = 2912
integer y = 1560
integer width = 343
integer height = 132
integer taborder = 90
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "100"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 50
string minmax = "100~~999"
end type

type cb_6 from commandbutton within w_main
integer x = 2322
integer y = 1560
integer width = 466
integer height = 132
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "escapement"
end type

event clicked;string ls_modify,ls_error

ls_modify = "dept_id_t.font.escapement='"+em_3.text+"' "
ls_modify += "dept_id.font.escapement='"+em_3.text+"' "
ls_modify += "dept_name_t.font.escapement='"+em_3.text+"' "
ls_modify += "dept_name.font.escapement='"+em_3.text+"' "
ls_modify += "dept_head_id_t.font.escapement='"+em_3.text+"' "
ls_modify += "dept_head_id.font.escapement='"+em_3.text+"' "

ls_error = dw_2.modify(ls_modify)


end event

type cb_5 from commandbutton within w_main
integer x = 2843
integer y = 1716
integer width = 466
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Saveas_free"
end type

event clicked;string ls_error
//ls_error = dw_2.Modify("DataWindow.Export.PDF.Method=XSLFOP!")
//ls_error = dw_2.Modify("DataWindow.Export.PDF.Method=Native!")
//ls_error = dw_2.Modify("DataWindow.Export.PDF.Method=NATIVE!")
//
//if not isnull(ls_error) and len(ls_error) > 0 then
//	messagebox("Error",ls_error)
//end if

dw_2.object.datawindow.printer = "Ghostscript PDF"
dw_2.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
if cbx_4.checked then
	dw_2.object.datawindow.export.pdf.method = distill!
	dw_2.object.datawindow.printer = "Ghostscript PDF"
	dw_2.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
	dw_2.saveas("gr_1","d:\testpb.pdf",pdf!,false)
else	
	dw_2.object.datawindow.export.pdf.method = NativePDF!
	dw_2.saveas("gr_1","d:\testpbnew.pdf",pdf!,false)
end if
//

//dw_2.object.datawindow.export.pdf.method = NativePDF!
//dw_2.saveas()
end event

type em_2 from editmask within w_main
integer x = 1202
integer y = 1736
integer width = 343
integer height = 132
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "100"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 50
string minmax = "100~~999"
end type

type cb_4 from commandbutton within w_main
integer x = 613
integer y = 1736
integer width = 466
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "escapement"
end type

event clicked;
string ls_modify

if em_1.text = "13" or em_1.text = "17" then
	ls_modify = "gr_1.pie.dispattr.font.escapement='"+em_2.text+"'"
else
	ls_modify = "gr_1.category.labeldispattr.font.escapement='"+em_2.text+"'"
end if

dw_1.modify(ls_modify)
end event

type dw_2 from datawindow within w_main
integer x = 2222
integer width = 1774
integer height = 1480
integer taborder = 20
boolean titlebar = true
string title = "Free"
string dataobject = "d_test"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject( sqlca)
this.retrieve( )
end event

type cb_3 from commandbutton within w_main
integer x = 1664
integer y = 1576
integer width = 466
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Saveas"
end type

event clicked;//dw_1.object.datawindow.export.pdf.method = NativePDF!
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
string ls_modify
if cbx_4.checked then
	dw_1.object.datawindow.export.pdf.method = distill!
	dw_1.object.datawindow.printer = "Ghostscript PDF"
	dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
	if cbx_2.checked then
		datastore  lds_11
		lds_11 = create datastore
		lds_11.dataobject = dw_1.dataobject
		lds_11.settransobject(sqlca)
		lds_11.retrieve()
		ls_modify = "gr_1.graphtype='"+em_1.text+"'"
		lds_11.modify(ls_modify)
		lds_11.object.datawindow.export.pdf.method = distill!
		lds_11.object.datawindow.printer = "Ghostscript PDF"
		lds_11.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
		if cbx_3.checked then
			lds_11.saveas("gr_1","c:\Temp2\testds.pdf",pdf!,true)
		//	lds_1.saveas("gr_1")
		else
			lds_11.saveas("c:\Temp2\testds.pdf",pdf!,true)
		//	lds_1.saveas()
		end if
		destroy lds_11
	else
	//	dw_1.object.datawindow.export.pdf.method = NativePDF!
	//	dw_1.saveas("C:\Temp2\test.pdf",pdf!,true)
		if cbx_3.checked then
			dw_1.saveas("gr_1")
		else
			dw_1.saveas()
		end if
	end if
else
	if cbx_2.checked then
		datastore  lds_1
		lds_1 = create datastore
		lds_1.dataobject = dw_1.dataobject
		lds_1.settransobject(sqlca)
		lds_1.retrieve()
		lds_1.object.datawindow.export.pdf.method = NativePDF!
		ls_modify = "gr_1.graphtype='"+em_1.text+"'"
		lds_1.modify(ls_modify)
		if cbx_3.checked then
			lds_1.saveas("gr_1","c:\Temp2\testds.pdf",pdf!,true)
		//	lds_1.saveas("gr_1")
		else
			lds_1.saveas("c:\Temp2\testds.pdf",pdf!,true)
		//	lds_1.saveas()
		end if
		destroy lds_1
	else
		dw_1.object.datawindow.export.pdf.method = NativePDF!
		dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 1 
	//	dw_1.saveas("C:\Temp2\test.pdf",pdf!,true)
		if cbx_3.checked then
			dw_1.saveas("gr_1")
		else
			dw_1.saveas()
		end if
	end if
	
end if


	
end event

type em_1 from editmask within w_main
integer x = 1202
integer y = 1584
integer width = 343
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
string minmax = "1~~17"
end type

type cb_2 from commandbutton within w_main
integer x = 613
integer y = 1584
integer width = 466
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ChangeType"
end type

event clicked;string ls_modify

if em_1.text = "13" or em_1.text = "17" then
	dw_1.dataobject = "d_products_pie3d_graph"
	ls_modify = "gr_1.graphtype='"+em_1.text+"'"
	dw_1.modify(ls_modify)
elseif em_1.text = "14" then
	dw_1.dataobject = "d_products_line"
else
	dw_1.dataobject = "d_products_pie3d_graph_base"
	ls_modify = "gr_1.graphtype='"+em_1.text+"'"
	dw_1.modify(ls_modify)
end if

if cbx_1.checked then
	dw_1.Modify("gr_1.Render3D='1'")
end if
cb_1.event clicked()
end event

type cb_1 from commandbutton within w_main
integer x = 46
integer y = 1580
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Retrieve"
end type

event clicked;dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type dw_1 from datawindow within w_main
integer width = 2208
integer height = 1488
integer taborder = 10
boolean titlebar = true
string title = "Graph"
string dataobject = "d_products_pie3d_graph_base"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve()
end event

event clicked;integer series,datapoint
 
 This.ObjectAtPointer( 'gr_1',series, datapoint)
 
 messagebox("","series = "+string(series)+"~r~ndatapoint="+string(datapoint))
end event

type gb_1 from groupbox within w_main
integer y = 1488
integer width = 3323
integer height = 572
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operate"
end type

