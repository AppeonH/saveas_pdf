$PBExportHeader$w_graph.srw
forward
global type w_graph from window
end type
type cb_11 from commandbutton within w_graph
end type
type ddlb_1 from dropdownlistbox within w_graph
end type
type cbx_1 from checkbox within w_graph
end type
type cb_10 from uo_saveas within w_graph
end type
type cb_9 from commandbutton within w_graph
end type
type sle_rgb from singlelineedit within w_graph
end type
type cb_8 from commandbutton within w_graph
end type
type sle_blue from singlelineedit within w_graph
end type
type sle_green from singlelineedit within w_graph
end type
type sle_red from singlelineedit within w_graph
end type
type cb_7 from commandbutton within w_graph
end type
type cb_6 from commandbutton within w_graph
end type
type cb_5 from commandbutton within w_graph
end type
type cb_4 from commandbutton within w_graph
end type
type dw_properties from datawindow within w_graph
end type
type cb_3 from commandbutton within w_graph
end type
type cb_2 from commandbutton within w_graph
end type
type cb_1 from commandbutton within w_graph
end type
type dw_graph from datawindow within w_graph
end type
type gb_1 from groupbox within w_graph
end type
end forward

global type w_graph from window
integer width = 3186
integer height = 3488
boolean titlebar = true
string title = "GraphDW"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean clientedge = true
boolean center = true
cb_11 cb_11
ddlb_1 ddlb_1
cbx_1 cbx_1
cb_10 cb_10
cb_9 cb_9
sle_rgb sle_rgb
cb_8 cb_8
sle_blue sle_blue
sle_green sle_green
sle_red sle_red
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
dw_properties dw_properties
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_graph dw_graph
gb_1 gb_1
end type
global w_graph w_graph

on w_graph.create
this.cb_11=create cb_11
this.ddlb_1=create ddlb_1
this.cbx_1=create cbx_1
this.cb_10=create cb_10
this.cb_9=create cb_9
this.sle_rgb=create sle_rgb
this.cb_8=create cb_8
this.sle_blue=create sle_blue
this.sle_green=create sle_green
this.sle_red=create sle_red
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.dw_properties=create dw_properties
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_graph=create dw_graph
this.gb_1=create gb_1
this.Control[]={this.cb_11,&
this.ddlb_1,&
this.cbx_1,&
this.cb_10,&
this.cb_9,&
this.sle_rgb,&
this.cb_8,&
this.sle_blue,&
this.sle_green,&
this.sle_red,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.dw_properties,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_graph,&
this.gb_1}
end on

on w_graph.destroy
destroy(this.cb_11)
destroy(this.ddlb_1)
destroy(this.cbx_1)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.sle_rgb)
destroy(this.cb_8)
destroy(this.sle_blue)
destroy(this.sle_green)
destroy(this.sle_red)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.dw_properties)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_graph)
destroy(this.gb_1)
end on

event open;dw_graph.settransobject(sqlca)
dw_graph.retrieve()
dw_properties.insertrow(0)

end event

type cb_11 from commandbutton within w_graph
integer x = 133
integer y = 2756
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF"
end type

event clicked;OpenWithparm( w_newfeature,dw_graph)
end event

type ddlb_1 from dropdownlistbox within w_graph
integer x = 1307
integer y = 2564
integer width = 640
integer height = 712
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"Arial","Tahoma","Microsoft Sans Serif","Times New Roman","宋体","黑体","楷体","微软雅黑","Batang","Calibri","MS Mincho","Webdings","Segoe UI","MS UI Gothic","MingLiU","Microsoft JhengHei","BatangChe","","","","","","","","","",""}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_temp 


//ls_temp = font.face="Comic Sans MS"
ls_temp = this.item[index]

dw_graph.modify( "t_1.font.face='"+ls_temp+"'")
end event

type cbx_1 from checkbox within w_graph
integer x = 750
integer y = 2616
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
string text = "pb"
end type

type cb_10 from uo_saveas within w_graph
integer x = 137
integer y = 2588
integer taborder = 50
end type

event clicked;call super::clicked;of_saveas(dw_graph,cbx_1.checked)  
end event

type cb_9 from commandbutton within w_graph
integer x = 1915
integer y = 2372
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "saveas"
end type

event clicked;//dw_graph.object.datawindow.export.pdf.method = distill!
//dw_graph.object.datawindow.printer = "Ghostscript PDF"
//dw_graph.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
dw_graph.object.datawindow.export.pdf.method =nativepdf!
dw_graph.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
dw_graph.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
dw_graph.saveas()
end event

type sle_rgb from singlelineedit within w_graph
integer x = 1449
integer y = 2368
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
string text = "RGB"
borderstyle borderstyle = stylelowered!
end type

type cb_8 from commandbutton within w_graph
integer x = 1010
integer y = 2372
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "RGB"
end type

event clicked;int red,green,blue
long ll_rgb
ll_rgb=RGB(integer(sle_red.text),integer(sle_green.text),integer(sle_blue.text))
sle_rgb.text=string(ll_rgb)
end event

type sle_blue from singlelineedit within w_graph
integer x = 736
integer y = 2368
integer width = 238
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Blue"
borderstyle borderstyle = stylelowered!
end type

type sle_green from singlelineedit within w_graph
integer x = 434
integer y = 2368
integer width = 238
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Green"
borderstyle borderstyle = stylelowered!
end type

type sle_red from singlelineedit within w_graph
integer x = 155
integer y = 2372
integer width = 238
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Red"
borderstyle borderstyle = stylelowered!
end type

type cb_7 from commandbutton within w_graph
integer x = 2551
integer y = 796
integer width = 407
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SetProperties"
end type

event clicked;string ls_ret
string ls_rotation,ls_elevation,ls_perspective
string ls_title,ls_shadecolor,ls_backcolor,ls_valuelabel
ls_rotation=dw_properties.getitemstring(1,"rotation")
ls_ret=dw_graph.Modify("gr_1.Rotation="+ls_rotation)

ls_elevation=dw_properties.getitemstring(1,"elevation")
ls_ret=dw_graph.Modify("gr_1.elevation="+ls_elevation)
	
ls_perspective=dw_properties.getitemstring(1,"perspective")
ls_ret=dw_graph.Modify("gr_1.perspective="+ls_perspective)
	
ls_title=dw_properties.getitemstring(1,"title")
ls_ret=dw_graph.Modify("gr_1.title='"+ls_title+"'")

ls_shadecolor=dw_properties.getitemstring(1,"shadecolor")
ls_ret=dw_graph.Modify("gr_1.shadecolor="+ls_shadecolor)

ls_backcolor=dw_properties.getitemstring(1,"backcolor")
ls_ret=dw_graph.Modify("gr_1.backcolor="+ls_backcolor)

ls_valuelabel=dw_properties.getitemstring(1,"valuelabel")
ls_ret=dw_graph.Modify("gr_1.values.label='"+ls_valuelabel+"'")
ls_ret=dw_graph.Modify("gr_1.category.label='"+ls_valuelabel+"'")

end event

type cb_6 from commandbutton within w_graph
integer x = 1719
integer y = 796
integer width = 398
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "FindCategory"
end type

event clicked;int ret1,ret2
ret1=dw_graph.findcategory("gr_1",200)
ret2=dw_graph.findcategory("gr_1",'M')
Messagebox("Find category dept_id:sex",string(ret1)+":"+string(ret2))
end event

type cb_5 from commandbutton within w_graph
integer x = 1266
integer y = 796
integer width = 439
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CategoryCount"
end type

event clicked;int ret
ret=dw_graph.categorycount("gr_1")
Messagebox("categorycount",ret)
end event

type cb_4 from commandbutton within w_graph
integer x = 859
integer y = 796
integer width = 398
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SeriesCount"
end type

event clicked;int ret
ret=dw_graph.seriescount("gr_1")
Messagebox("seriescount",ret)
end event

type dw_properties from datawindow within w_graph
integer x = 69
integer y = 96
integer width = 2880
integer height = 644
integer taborder = 30
string title = "none"
string dataobject = "d_graph_props"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;
if dwo.name="graphtype" then
	dw_graph.Modify("gr_1.GraphType="+data)
end if
if dwo.name="legend" then
	dw_graph.Modify("gr_1.Legend="+data)
end if
if dwo.name="category" then
	dw_graph.Modify("gr_1.category='"+data+"'")
end if
if dwo.name="series" then
	dw_graph.Modify("gr_1.series='"+data+"'")
end if
if dwo.name="value" then
	dw_graph.Modify("gr_1.values='"+data+"'")
end if
if dwo.name="categorysort" then
	dw_graph.Modify("gr_1.Category.sort="+data)
end if
end event

event editchanged;string ls_ret

if dwo.name="rotation" then
	ls_ret=dw_graph.Modify("gr_1.Rotation="+data)
end if
if dwo.name="elevation" then
	ls_ret=dw_graph.Modify("gr_1.elevation="+data)
end if
if dwo.name="perspective" then
	ls_ret=dw_graph.Modify("gr_1.perspective="+data)
end if
if dwo.name="title" then
	ls_ret=dw_graph.Modify("gr_1.title='"+data+"'")
end if
if dwo.name="shadecolor" then
	ls_ret=dw_graph.Modify("gr_1.shadecolor="+data)
end if
if dwo.name="backcolor" then
	ls_ret=dw_graph.Modify("gr_1.backcolor="+data)
end if
if dwo.name="valuelabel" then
	ls_ret=dw_graph.Modify("gr_1.values.label='"+data+"'")
	ls_ret=dw_graph.Modify("gr_1.category.label='"+data+"'")
end if



end event

type cb_3 from commandbutton within w_graph
integer x = 2130
integer y = 796
integer width = 398
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ImportFile"
end type

event clicked;//dw_graph.saveas("csv_graph.csv",CSV!,false,encodingutf8!)
//dw_graph.saveas("text_graph.txt",Text!,false,encodingutf16le!)
//dw_graph.saveas("xml_graph.xml",XML!,false)
dw_graph.importfile("text_graph.txt")
dw_graph.importfile("csv_graph.csv")
dw_graph.importfile("xml_graph.xml",XML!)


end event

type cb_2 from commandbutton within w_graph
integer x = 453
integer y = 796
integer width = 398
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Setredraw_T"
end type

event clicked;dw_graph.setredraw(true)
end event

type cb_1 from commandbutton within w_graph
integer x = 55
integer y = 796
integer width = 393
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Setredraw_F"
end type

event clicked;dw_graph.setredraw(false)
end event

type dw_graph from datawindow within w_graph
integer x = 59
integer y = 928
integer width = 2926
integer height = 1400
integer taborder = 10
string title = "none"
string dataobject = "d_graph"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_graph
integer x = 50
integer y = 24
integer width = 2958
integer height = 740
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Graph Properties"
end type

