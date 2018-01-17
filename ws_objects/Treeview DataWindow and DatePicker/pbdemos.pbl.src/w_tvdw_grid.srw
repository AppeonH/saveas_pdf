$PBExportHeader$w_tvdw_grid.srw
forward
global type w_tvdw_grid from w_basesheet
end type
type cb_1 from commandbutton within w_tvdw_grid
end type
type dw_tv from datawindow within w_tvdw_grid
end type
end forward

global type w_tvdw_grid from w_basesheet
integer width = 2907
integer height = 2168
string title = "Employee Manager"
long backcolor = 67108864
string icon = "AppIcon!"
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
cb_1 cb_1
dw_tv dw_tv
end type
global w_tvdw_grid w_tvdw_grid

type variables
integer ii_SelectTreeNode
end variables

forward prototypes
public function str_dw_band wf_parse_bandinfo (string dw_band)
public subroutine of_set_selecttreenode (integer ai_selecttreenodemode)
end prototypes

public function str_dw_band wf_parse_bandinfo (string dw_band);str_dw_band my_dw_band
long pos 

pos = pos(dw_band , "~t")

if pos > 0 then 
	my_dw_band.band = mid(dw_band , 1 , pos - 1)
	my_dw_band.row = long (mid (dw_band, pos + 1 , len(dw_band)))
end if
return my_dw_band
end function

public subroutine of_set_selecttreenode (integer ai_selecttreenodemode);ii_SelectTreeNode = ai_selecttreenodemode
end subroutine

on w_tvdw_grid.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_tv=create dw_tv
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_tv
end on

on w_tvdw_grid.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_tv)
end on

event open;dw_tv.SetTransObject(sqlca)
dw_tv.Retrieve()

end event

event resize;dw_tv.width = this.width - 150 
dw_tv.height = this.height - 200 
end event

type cb_1 from commandbutton within w_tvdw_grid
integer x = 631
integer y = 1940
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "saveas"
end type

event clicked;//dw_tv.object.datawindow.export.pdf.method = distill!
//dw_tv.object.datawindow.printer = "Ghostscript PDF"
//dw_tv.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

dw_tv.object.datawindow.export.pdf.method =nativepdf!
dw_tv.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=2
dw_tv.Object.DataWindow.Export.PDF.NativePDF.CustomSize=3
dw_tv.saveas( )
end event

type dw_tv from datawindow within w_tvdw_grid
event treenodeselecting pbm_dwntreenodeselecting
integer x = 50
integer y = 36
integer width = 2757
integer height = 1900
integer taborder = 10
string title = "DataWindow TreeView"
string dataobject = "d_emp_demo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event treenodeselecting;Return ii_SelectTreeNode
end event

event clicked;string obj_name , obj_type , dw_band
str_dw_band my_band

obj_name = dwo.name
obj_type = dwo.type
dw_band = this.GetBandAtPointer()
my_band = wf_parse_bandinfo (dw_band)
choose case   my_band.band //obj_name
	case 'tree.level.1' // 'dept_name
		this.SelectTreeNode( my_band.row,1,true)
	case 'tree.level.2'  //'sex'
		this.SelectTreeNode(my_band.row,2,true)
	case 'tree.level.3' //'status'
		this.SelectTreeNode(my_band.row,3,true)
	case else
		
end choose

end event

event rbuttondown;popmenu_grid mymenu


mymenu = create popmenu_grid 
//messagebox("",PixelsToUnits(xpos, XPixelsToUnits! ))
mymenu.PopMenu (PixelsToUnits(xpos , XPixelsToUnits! ) + this.x + Parent.x +30 , PixelsToUnits(ypos, YPixelsToUnits! ) +this.y + parent.y + 130)
end event

