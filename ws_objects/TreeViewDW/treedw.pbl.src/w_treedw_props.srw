$PBExportHeader$w_treedw_props.srw
forward
global type w_treedw_props from window
end type
type cb_14 from commandbutton within w_treedw_props
end type
type st_col_band from singlelineedit within w_treedw_props
end type
type em_indent from singlelineedit within w_treedw_props
end type
type em_defaultexpandtolevel from singlelineedit within w_treedw_props
end type
type cb_13 from commandbutton within w_treedw_props
end type
type cb_12 from commandbutton within w_treedw_props
end type
type cb_11 from commandbutton within w_treedw_props
end type
type cb_10 from commandbutton within w_treedw_props
end type
type cb_9 from commandbutton within w_treedw_props
end type
type cb_8 from commandbutton within w_treedw_props
end type
type cbx_selectnodebymouse from checkbox within w_treedw_props
end type
type cb_7 from commandbutton within w_treedw_props
end type
type cbx_1 from checkbox within w_treedw_props
end type
type ddlb_gridlines from dropdownlistbox within w_treedw_props
end type
type st_7 from statictext within w_treedw_props
end type
type cbx_rowresize from checkbox within w_treedw_props
end type
type cbx_gridcolumnmove from checkbox within w_treedw_props
end type
type cb_print from commandbutton within w_treedw_props
end type
type ddlb_stateiconalignmode from dropdownlistbox within w_treedw_props
end type
type st_6 from statictext within w_treedw_props
end type
type st_5 from statictext within w_treedw_props
end type
type cb_6 from commandbutton within w_treedw_props
end type
type cb_5 from commandbutton within w_treedw_props
end type
type cb_4 from commandbutton within w_treedw_props
end type
type cb_3 from commandbutton within w_treedw_props
end type
type cb_2 from commandbutton within w_treedw_props
end type
type cb_1 from commandbutton within w_treedw_props
end type
type cb_close from commandbutton within w_treedw_props
end type
type cb_modify from commandbutton within w_treedw_props
end type
type cb_describe from commandbutton within w_treedw_props
end type
type cb_set from commandbutton within w_treedw_props
end type
type cb_get from commandbutton within w_treedw_props
end type
type sle_collapseicon from singlelineedit within w_treedw_props
end type
type sle_expandicon from singlelineedit within w_treedw_props
end type
type st_4 from statictext within w_treedw_props
end type
type st_3 from statictext within w_treedw_props
end type
type sle_leaficonname from singlelineedit within w_treedw_props
end type
type st_2 from statictext within w_treedw_props
end type
type st_1 from statictext within w_treedw_props
end type
type cbx_treenodeicon from checkbox within w_treedw_props
end type
type cbx_connectleaf from checkbox within w_treedw_props
end type
type cbx_showlines from checkbox within w_treedw_props
end type
type dw_1 from datawindow within w_treedw_props
end type
end forward

global type w_treedw_props from window
integer width = 3360
integer height = 2644
boolean titlebar = true
string title = "TreeViewDW Properties"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_14 cb_14
st_col_band st_col_band
em_indent em_indent
em_defaultexpandtolevel em_defaultexpandtolevel
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cbx_selectnodebymouse cbx_selectnodebymouse
cb_7 cb_7
cbx_1 cbx_1
ddlb_gridlines ddlb_gridlines
st_7 st_7
cbx_rowresize cbx_rowresize
cbx_gridcolumnmove cbx_gridcolumnmove
cb_print cb_print
ddlb_stateiconalignmode ddlb_stateiconalignmode
st_6 st_6
st_5 st_5
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_close cb_close
cb_modify cb_modify
cb_describe cb_describe
cb_set cb_set
cb_get cb_get
sle_collapseicon sle_collapseicon
sle_expandicon sle_expandicon
st_4 st_4
st_3 st_3
sle_leaficonname sle_leaficonname
st_2 st_2
st_1 st_1
cbx_treenodeicon cbx_treenodeicon
cbx_connectleaf cbx_connectleaf
cbx_showlines cbx_showlines
dw_1 dw_1
end type
global w_treedw_props w_treedw_props

type variables
integer ii_StateIconAlignMode
integer ii_GridLines
end variables

on w_treedw_props.create
this.cb_14=create cb_14
this.st_col_band=create st_col_band
this.em_indent=create em_indent
this.em_defaultexpandtolevel=create em_defaultexpandtolevel
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cbx_selectnodebymouse=create cbx_selectnodebymouse
this.cb_7=create cb_7
this.cbx_1=create cbx_1
this.ddlb_gridlines=create ddlb_gridlines
this.st_7=create st_7
this.cbx_rowresize=create cbx_rowresize
this.cbx_gridcolumnmove=create cbx_gridcolumnmove
this.cb_print=create cb_print
this.ddlb_stateiconalignmode=create ddlb_stateiconalignmode
this.st_6=create st_6
this.st_5=create st_5
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_close=create cb_close
this.cb_modify=create cb_modify
this.cb_describe=create cb_describe
this.cb_set=create cb_set
this.cb_get=create cb_get
this.sle_collapseicon=create sle_collapseicon
this.sle_expandicon=create sle_expandicon
this.st_4=create st_4
this.st_3=create st_3
this.sle_leaficonname=create sle_leaficonname
this.st_2=create st_2
this.st_1=create st_1
this.cbx_treenodeicon=create cbx_treenodeicon
this.cbx_connectleaf=create cbx_connectleaf
this.cbx_showlines=create cbx_showlines
this.dw_1=create dw_1
this.Control[]={this.cb_14,&
this.st_col_band,&
this.em_indent,&
this.em_defaultexpandtolevel,&
this.cb_13,&
this.cb_12,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cbx_selectnodebymouse,&
this.cb_7,&
this.cbx_1,&
this.ddlb_gridlines,&
this.st_7,&
this.cbx_rowresize,&
this.cbx_gridcolumnmove,&
this.cb_print,&
this.ddlb_stateiconalignmode,&
this.st_6,&
this.st_5,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_close,&
this.cb_modify,&
this.cb_describe,&
this.cb_set,&
this.cb_get,&
this.sle_collapseicon,&
this.sle_expandicon,&
this.st_4,&
this.st_3,&
this.sle_leaficonname,&
this.st_2,&
this.st_1,&
this.cbx_treenodeicon,&
this.cbx_connectleaf,&
this.cbx_showlines,&
this.dw_1}
end on

on w_treedw_props.destroy
destroy(this.cb_14)
destroy(this.st_col_band)
destroy(this.em_indent)
destroy(this.em_defaultexpandtolevel)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cbx_selectnodebymouse)
destroy(this.cb_7)
destroy(this.cbx_1)
destroy(this.ddlb_gridlines)
destroy(this.st_7)
destroy(this.cbx_rowresize)
destroy(this.cbx_gridcolumnmove)
destroy(this.cb_print)
destroy(this.ddlb_stateiconalignmode)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.cb_modify)
destroy(this.cb_describe)
destroy(this.cb_set)
destroy(this.cb_get)
destroy(this.sle_collapseicon)
destroy(this.sle_expandicon)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_leaficonname)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cbx_treenodeicon)
destroy(this.cbx_connectleaf)
destroy(this.cbx_showlines)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type cb_14 from commandbutton within w_treedw_props
integer x = 2921
integer y = 664
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

event clicked;OpenWithparm( w_newfeature,dw_1)
end event

type st_col_band from singlelineedit within w_treedw_props
integer x = 2158
integer y = 784
integer width = 997
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type em_indent from singlelineedit within w_treedw_props
integer x = 1806
integer y = 20
integer width = 311
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type em_defaultexpandtolevel from singlelineedit within w_treedw_props
integer x = 759
integer y = 136
integer width = 297
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_13 from commandbutton within w_treedw_props
integer x = 2592
integer y = 568
integer width = 622
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Trailer&Footer&Summary"
end type

event clicked;string ls_color
string ret
ls_color=dw_1.Describe("datawindow.trailer.2.color")
ret=dw_1.Modify("datawindow.trailer.2.color=65535")
ret=dw_1.Modify("datawindow.summary.color=65280")
ret=dw_1.Modify("datawindow.footer.color=16711680")
ret=dw_1.Modify("datawindow.trailer.2.height=100")
ret=dw_1.Modify("datawindow.summary.height=100")
ret=dw_1.Modify("datawindow.footer.height=100")
end event

type cb_12 from commandbutton within w_treedw_props
integer x = 2592
integer y = 456
integer width = 498
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Pointer"
end type

event clicked;string ls_color,ls_ret

ls_ret=dw_1.Modify("datawindow.tree.level.2.pointer='Cross!'")
ls_color=dw_1.Describe("datawindow.tree.level.2.pointer")
st_col_band.text="tree.level.2.pointer:"+mid(ls_color,2,6)
//Messagebox("tree.Level.2.pointer",ls_color)
end event

type cb_11 from commandbutton within w_treedw_props
integer x = 2592
integer y = 344
integer width = 498
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Height.AutoSize"
end type

event clicked;string ls_color,ls_ret

ls_ret=dw_1.Modify("datawindow.tree.level.2.height.Autosize='yes'")
ls_color=dw_1.Describe("datawindow.tree.level.2.height.Autosize")
st_col_band.text="tree.level.2.height.Autosize:"+ls_color
//Messagebox(ls_ret,ls_color)
end event

type cb_10 from commandbutton within w_treedw_props
integer x = 2592
integer y = 224
integer width = 498
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Height"
end type

event clicked;string ls_color,ls_ret
ls_color=dw_1.Describe("datawindow.tree.level.2.height")
ls_ret=dw_1.Modify("datawindow.tree.level.2.height=200")
st_col_band.text="tree.level.2.height:"+ls_color
//Messagebox("tree.Level.2.height",ls_color)
end event

type cb_9 from commandbutton within w_treedw_props
integer x = 2592
integer y = 112
integer width = 498
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Color"
end type

event clicked;string ls_color,ls_ret
ls_color=dw_1.Describe("datawindow.tree.level.2.color")
ls_ret=dw_1.Modify("datawindow.tree.level.2.color=255")
st_col_band.text="tree.level.2.color:"+ls_color
//Messagebox("tree.Level.2.Color",ls_color)
end event

type cb_8 from commandbutton within w_treedw_props
integer x = 2592
integer width = 498
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "DW.Bands"
end type

event clicked;string ls_ret
ls_ret=dw_1.Object.DataWindow.Bands
st_col_band.text=ls_ret
//Messagebox("Dw.Bands",ls_ret)
end event

type cbx_selectnodebymouse from checkbox within w_treedw_props
integer x = 64
integer y = 264
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
end type

type cb_7 from commandbutton within w_treedw_props
integer x = 2153
integer y = 576
integer width = 402
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SaveAS"
end type

event clicked;//dw_1.object.datawindow.export.pdf.method = distill!
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

dw_1.object.datawindow.export.pdf.method =nativepdf!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=2
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=3
dw_1.saveas()
end event

type cbx_1 from checkbox within w_treedw_props
integer x = 2629
integer y = 684
integer width = 288
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "GridDw"
end type

event clicked;If this.Checked then
	dw_1.dataobject="d_treeview_demo_grid"
	
else
	dw_1.dataobject="d_treeview_demo"
end if
dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type ddlb_gridlines from dropdownlistbox within w_treedw_props
integer x = 1531
integer y = 792
integer width = 581
integer height = 400
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Display&Print","No Grid","No Print","No Display"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_GridLines= index - 1
end event

type st_7 from statictext within w_treedw_props
integer x = 1239
integer y = 792
integer width = 283
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "GridLines"
boolean focusrectangle = false
end type

type cbx_rowresize from checkbox within w_treedw_props
integer x = 677
integer y = 788
integer width = 521
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "GridRowResize"
end type

type cbx_gridcolumnmove from checkbox within w_treedw_props
integer x = 73
integer y = 792
integer width = 521
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "GridColumnMove"
end type

type cb_print from commandbutton within w_treedw_props
integer x = 2153
integer y = 460
integer width = 402
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print"
end type

event clicked;int li_ret

li_ret=dw_1.print()
st_col_band.text="Print return:"+string(li_ret)
end event

type ddlb_stateiconalignmode from dropdownlistbox within w_treedw_props
integer x = 1678
integer y = 136
integer width = 434
integer height = 420
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"middle","top","bottom"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_StateIconAlignMode= index - 1
end event

type st_6 from statictext within w_treedw_props
integer x = 1088
integer y = 140
integer width = 558
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "StateIconAlignMode"
boolean focusrectangle = false
end type

type st_5 from statictext within w_treedw_props
integer x = 27
integer y = 140
integer width = 704
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ExpandToLevelByDefault:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_treedw_props
integer x = 1637
integer y = 628
integer width = 265
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Invalid"
end type

event clicked;sle_collapseicon.text= ".\test\folder.bmp"
sle_expandicon.text=".\jpg\test.jpeg"
sle_leaficonname.text= ""
end event

type cb_5 from commandbutton within w_treedw_props
integer x = 1317
integer y = 628
integer width = 265
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JPG"
end type

event clicked;sle_collapseicon.text= ".\jpg\Paradise.jpg"
sle_expandicon.text=".\jpg\chateau.jpeg"
sle_leaficonname.text= ".\jpg\bayshore.jpg"
end event

type cb_4 from commandbutton within w_treedw_props
integer x = 997
integer y = 628
integer width = 265
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "WMF"
end type

event clicked;sle_collapseicon.text= ".\wmf\d_group.wmf"
sle_expandicon.text=".\wmf\d_graph.wmf"
sle_leaficonname.text= ".\wmf\computer.wmf"
end event

type cb_3 from commandbutton within w_treedw_props
integer x = 672
integer y = 628
integer width = 265
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GIF"
end type

event clicked;sle_collapseicon.text= ".\gif\folder.gif"
sle_expandicon.text=".\gif\folderopen.gif"
sle_leaficonname.text= ".\gif\getstart.gif"
end event

type cb_2 from commandbutton within w_treedw_props
integer x = 352
integer y = 628
integer width = 265
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ICO"
end type

event clicked;sle_collapseicon.text= ".\ico\fn1000.ico"
sle_expandicon.text=".\ico\fn1002.ico"
sle_leaficonname.text= ".\ico\pbex.ico"
end event

type cb_1 from commandbutton within w_treedw_props
integer x = 27
integer y = 628
integer width = 265
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "BMP"
end type

event clicked;sle_collapseicon.text= ".\bmp\folder.bmp"
sle_expandicon.text=".\bmp\foldopen.bmp"
sle_leaficonname.text= ".\bmp\beach.bmp"
end event

type cb_close from commandbutton within w_treedw_props
integer x = 2153
integer y = 684
integer width = 402
integer height = 92
integer taborder = 50
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

type cb_modify from commandbutton within w_treedw_props
integer x = 2153
integer y = 344
integer width = 402
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Modify"
end type

event clicked;string ls_ShowLine,ls_ShowLeafLine,ls_ShowNodeIcon
long ll_indent
string ls_expandIcon, ls_collaspseIcon,ls_LeafIcon
string ls_ret,ls_DefaultExpandToLevel
string ls_SelectNodeByMouse
if cbx_showlines.checked then
	ls_ShowLine='yes'
else
	ls_ShowLine='no'
end if
ls_ret=dw_1.modify("datawindow.tree.ShowConnectLines='"+ls_ShowLine+"'")
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

if cbx_connectleaf.checked then
	ls_ShowLeafLine='yes'
else
	ls_ShowLeafLine='no'
end if
ls_ret=dw_1.modify("datawindow.tree.ShowLeafNodeConnectLines='"+ls_ShowLeafLine+"'")
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

if cbx_treenodeicon.checked then
	ls_showNodeIcon='yes'
else
	ls_showNodeIcon='no'
end if
ls_ret=dw_1.modify("datawindow.tree.ShowTreeNodeIcon='"+ls_ShowNodeIcon+"'")
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

if cbx_SelectNodeByMouse.checked then
	ls_SelectNodeByMouse='yes'
else
	ls_SelectNodeByMouse='no'
end if
ls_ret=dw_1.modify("datawindow.tree.SelectNodeByMouse='"+ls_SelectNodeByMouse+"'")
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

ll_indent=long(em_indent.text)
ls_ret=dw_1.modify("datawindow.tree.indent="+string(ll_indent))
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

ls_collaspseIcon=sle_collapseicon.text
ls_ret=dw_1.modify("datawindow.tree.level.2.collapsedTreeNodeIconName='"+ls_collaspseIcon+"'")
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

ls_expandIcon=sle_expandicon.text
ls_ret=dw_1.modify("datawindow.tree.level.2.ExpandedTreeNodeIconName='"+ls_expandIcon +"'")
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

ls_LeafIcon=sle_leaficonname.text
ls_ret=dw_1.modify("datawindow.tree.leaf.TreeNodeIconName='"+ls_LeafIcon+"'")
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

ls_DefaultExpandToLevel=em_DefaultExpandToLevel.text
ls_ret=dw_1.modify("datawindow.tree.DefaultExpandToLevel="+ls_DefaultExpandToLevel)
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

ls_ret=dw_1.modify("datawindow.tree.StateIconAlignMode = "+string(ii_StateIconAlignMode) )
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

//Added for Grid Style
string ls_RowResize,ls_GridLine,ls_ColumnMove
if cbx_gridcolumnmove.checked then
	ls_ColumnMove='yes'
else
	ls_ColumnMove='no'
end if
ls_ret=dw_1.modify("datawindow.Grid.ColumnMove = '"+ls_ColumnMove +"'")
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

if cbx_rowresize.checked then
	ls_RowResize='1'
else
	ls_RowResize='0'
end if
ls_ret=dw_1.modify("datawindow.Row.Resize = '"+ls_RowResize +"'")
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if

ls_ret=dw_1.modify("datawindow.grid.lines= "+string(ii_GridLines) )
if len(ls_ret)>0 then
	Messagebox("",ls_ret)
end if
dw_1.retrieve()
end event

type cb_describe from commandbutton within w_treedw_props
integer x = 2153
integer y = 228
integer width = 402
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Describe"
end type

event clicked;string ls_ShowLine,ls_ShowLeafLine,ls_ShowNodeIcon
long ll_indent
string ls_indent
string ls_expandIcon, ls_collaspseIcon,ls_LeafIcon
string ls_DefaultExpandToLevel,ls_StateIconAlignMode
string ls_SelectNodeByMouse
ls_ShowLine=dw_1.Describe("datawindow.tree.ShowConnectLines")
if lower(ls_ShowLine)='no' then
	cbx_showlines.checked=false
else
	cbx_showlines.checked=true
end if

ls_ShowLeafLine=dw_1.Describe("datawindow.tree.ShowLeafNodeConnectLines")
if lower(ls_ShowLeafLine)='no' then
	cbx_connectleaf.checked=false
else
	cbx_connectleaf.checked=true
end if

ls_ShowNodeIcon=dw_1.Describe("datawindow.tree.ShowTreeNodeIcon")
if lower(ls_showNodeIcon)='no' then
	cbx_treenodeicon.checked=false
else
	cbx_treenodeicon.checked=true
end if

ls_SelectNodeByMouse=dw_1.Describe("datawindow.tree.SelectNodeByMouse")
if lower(ls_SelectNodeByMouse)='no' then
	cbx_SelectNodeByMouse.checked=false
else
	cbx_SelectNodeByMouse.checked=true
end if

ls_indent=dw_1.Describe("datawindow.tree.indent")
em_indent.text=ls_indent

ls_collaspseIcon=dw_1.Describe("datawindow.tree.level.2.collapsedTreeNodeIconName")
sle_collapseicon.text=ls_collaspseIcon

ls_expandIcon =dw_1.Describe("datawindow.tree.level.2.ExpandedTreeNodeIconName")
sle_expandicon.text=ls_expandIcon

ls_LeafIcon=dw_1.Describe("datawindow.tree.leaf.TreeNodeIconName")
sle_leaficonname.text=ls_LeafIcon

ls_DefaultExpandToLevel=dw_1.Describe("datawindow.tree.DefaultExpandToLevel")
em_DefaultExpandToLevel.text=ls_DefaultExpandToLevel

ls_StateIconAlignMode=dw_1.Describe("datawindow.tree.StateIconAlignMode")
ddlb_StateIconAlignMode.SelectItem(integer(ls_StateIconAlignMode)+1)

//Added for Grid Style
string ls_RowResize,ls_GridLine,ls_ColumnMove
ls_ColumnMove=dw_1.Describe("datawindow.Grid.ColumnMove")
if lower(ls_ColumnMove)='no' then
	cbx_gridcolumnmove.checked=false
else
	cbx_gridcolumnmove.checked=true
end if
ls_RowResize=dw_1.Describe("datawindow.Row.Resize")
if lower(ls_RowResize)='0' then
	cbx_rowresize.checked=false
else
	cbx_rowresize.checked=true
end if
ls_GridLine=dw_1.Describe("datawindow.grid.lines")
ddlb_GridLines.SelectItem(integer(ls_GridLine)+1)
end event

type cb_set from commandbutton within w_treedw_props
integer x = 2153
integer y = 116
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set"
end type

event clicked;string ls_ShowLine,ls_ShowLeafLine,ls_ShowNodeIcon
long ll_indent
string ls_expandIcon, ls_collaspseIcon,ls_LeafIcon
string ls_DefaultExpandToLevel,ls_StateIconAlignMode
if cbx_showlines.checked then
	ls_ShowLine='yes'
else
	ls_ShowLine='no'
end if
dw_1.object.datawindow.tree.ShowConnectLines=ls_ShowLine

if cbx_connectleaf.checked then
	ls_ShowLeafLine='yes'
else
	ls_ShowLeafLine='no'
end if
dw_1.object.datawindow.tree.ShowLeafNodeConnectLines=ls_ShowLeafLine

if cbx_treenodeicon.checked then
	ls_showNodeIcon='yes'
else
	ls_showNodeIcon='no'
end if
dw_1.object.datawindow.tree.ShowTreeNodeIcon=ls_ShowNodeIcon
string ls_SelectNodeByMouse
if cbx_SelectNodeByMouse.checked then
	ls_SelectNodeByMouse='yes'
else
	ls_SelectNodeByMouse='no'
end if
dw_1.object.datawindow.tree.SelectNodeByMouse=ls_SelectNodeByMouse


ll_indent=long(em_indent.text)
dw_1.object.datawindow.tree.indent=ll_indent

///*if(  employee_sex ='F', bitmap ('folder.bmp'), bitmap('folderopen.bmp') )*/
//ls_collaspseIcon=sle_collapseicon.text
//dw_1.object.datawindow.tree.level.1.collapseTreeNodeIconName=ls_collaspseIcon
//
//ls_expandIcon=sle_expandicon.text
//dw_1.object.datawindow.tree.level.1.ExpandTreeNodeIconName=ls_expandIcon 
//
ls_LeafIcon=sle_leaficonname.text
dw_1.object.datawindow.tree.leaf.TreeNodeIconName=ls_LeafIcon

ls_DefaultExpandToLevel=em_DefaultExpandToLevel.text
dw_1.object.datawindow.tree.DefaultExpandToLevel=ls_DefaultExpandToLevel

dw_1.object.datawindow.tree.StateIconAlignMode = ii_StateIconAlignMode

//Added for Grid Style
string ls_RowResize,ls_GridLine,ls_ColumnMove
if cbx_gridcolumnmove.checked then
	ls_ColumnMove='yes'
else
	ls_ColumnMove='no'
end if
dw_1.object.datawindow.Grid.ColumnMove=ls_ColumnMove
if cbx_rowresize.checked then
	ls_RowResize='1'
else
	ls_RowResize='0'
end if
dw_1.object.datawindow.Row.Resize=ls_RowResize

dw_1.object.datawindow.grid.lines=ii_GridLines

dw_1.retrieve()
end event

type cb_get from commandbutton within w_treedw_props
integer x = 2153
integer y = 4
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Get"
end type

event clicked;string ls_ShowLine,ls_ShowLeafLine,ls_ShowNodeIcon
long ll_indent
string ls_indent
string ls_expandIcon, ls_collaspseIcon,ls_LeafIcon
string ls_DefaultExpandToLevel,ls_StateIconAlignMode
string ls_SelectNodeByMouse
ls_ShowLine=dw_1.object.datawindow.tree.ShowConnectLines
if lower(ls_ShowLine)='no' then
	cbx_showlines.checked=false
else
	cbx_showlines.checked=true
end if

ls_ShowLeafLine=dw_1.object.datawindow.tree.ShowLeafNodeConnectLines
if lower(ls_ShowLeafLine)='no' then
	cbx_connectleaf.checked=false
else
	cbx_connectleaf.checked=true
end if

ls_ShowNodeIcon=dw_1.object.datawindow.tree.ShowTreeNodeIcon
if lower(ls_showNodeIcon)='no' then
	cbx_treenodeicon.checked=false
else
	cbx_treenodeicon.checked=true
end if
ls_SelectNodeByMouse=dw_1.object.datawindow.tree.SelectNodeByMouse
if lower(ls_SelectNodeByMouse)='no' then
	cbx_SelectNodeByMouse.checked=false
else
	cbx_SelectNodeByMouse.checked=true
end if
ls_indent=dw_1.object.datawindow.tree.indent
em_indent.text=ls_indent
//
//ls_collaspseIcon=dw_1..datawindow.tree.level.1.collapseTreeNodeIconName
//sle_collapseicon.text=ls_collaspseIcon
//
//ls_expandIcon =dw_1.object.datawindow.tree.level.1.ExpandTreeNodeIconName
//sle_expandicon.text=ls_expandIcon

ls_LeafIcon=dw_1.object.datawindow.tree.leaf.TreeNodeIconName
sle_leaficonname.text=ls_LeafIcon

ls_DefaultExpandToLevel=dw_1.object.datawindow.tree.DefaultExpandToLevel
em_DefaultExpandToLevel.text=ls_DefaultExpandToLevel

ls_StateIconAlignMode=dw_1.object.datawindow.tree.StateIconAlignMode
ddlb_StateIconAlignMode.SelectItem(integer(ls_StateIconAlignMode)+1)

//Added for Grid Style
string ls_RowResize,ls_GridLine,ls_ColumnMove
ls_ColumnMove=dw_1.object.datawindow.Grid.ColumnMove
if lower(ls_ColumnMove)='no' then
	cbx_gridcolumnmove.checked=false
else
	cbx_gridcolumnmove.checked=true
end if
ls_RowResize=dw_1.object.datawindow.Row.Resize
if lower(ls_RowResize)='0' then
	cbx_rowresize.checked=false
else
	cbx_rowresize.checked=true
end if
ls_GridLine=dw_1.object.datawindow.grid.lines
ddlb_GridLines.SelectItem(integer(ls_GridLine)+1)
end event

type sle_collapseicon from singlelineedit within w_treedw_props
integer x = 1033
integer y = 508
integer width = 1074
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type sle_expandicon from singlelineedit within w_treedw_props
integer x = 1033
integer y = 380
integer width = 1074
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_treedw_props
integer x = 69
integer y = 512
integer width = 846
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Collapse Tree Node Icon Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_treedw_props
integer x = 73
integer y = 396
integer width = 818
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Expand Tree Node Icon Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_leaficonname from singlelineedit within w_treedw_props
integer x = 1271
integer y = 252
integer width = 841
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_treedw_props
integer x = 795
integer y = 264
integer width = 443
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Leaf Icon Name:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_treedw_props
integer x = 1605
integer y = 32
integer width = 206
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Indent:"
boolean focusrectangle = false
end type

type cbx_treenodeicon from checkbox within w_treedw_props
integer x = 960
integer y = 28
integer width = 594
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ShowTreeNodeIcon"
end type

type cbx_connectleaf from checkbox within w_treedw_props
integer x = 480
integer y = 24
integer width = 517
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ConnectLeaf"
end type

type cbx_showlines from checkbox within w_treedw_props
integer x = 64
integer y = 28
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
string text = "ShowLines"
end type

type dw_1 from datawindow within w_treedw_props
event collapsed pbm_dwncollapsed
event collapsing pbm_dwncollapsing
event expanded pbm_dwnexpanded
event expanding pbm_dwnexpanding
integer y = 928
integer width = 3182
integer height = 1536
integer taborder = 10
string title = "none"
string dataobject = "d_treeview_demo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_ret
string ls_object
ls_object=dwo.name
ls_ret=dw_1.describe(ls_object+".Band")
st_col_band.text=ls_ret
end event

