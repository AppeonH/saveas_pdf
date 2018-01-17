$PBExportHeader$w_treeview_sample.srw
forward
global type w_treeview_sample from w_basesheet
end type
type cb_1 from commandbutton within w_treeview_sample
end type
type st_vertical from statictext within w_treeview_sample
end type
type dw_2 from datawindow within w_treeview_sample
end type
type dw_1 from datawindow within w_treeview_sample
end type
end forward

global type w_treeview_sample from w_basesheet
integer width = 3918
integer height = 2588
string title = "Data Explorer"
long backcolor = 67108864
string icon = "AppIcon!"
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
event ue_refresh ( )
cb_1 cb_1
st_vertical st_vertical
dw_2 dw_2
dw_1 dw_1
end type
global w_treeview_sample w_treeview_sample

type variables
boolean		ib_debug=False	//Debug mode
dragobject	idrg_Vertical[2]	//Reference to the vertical controls on the window
integer		ii_windowborder=25	//Window border to be used on all sides
integer		ii_barthickness=11	//Bar Thickness
long		il_hiddencolor=0	//Bar hidden color to match the window background

long i_xpos , i_ypos , i_row
dwobject i_dwo

boolean i_activate = false
end variables

forward prototypes
public function integer wf_resizepanels ()
public function integer wf_resizebars ()
public function integer wf_refreshbars ()
public function str_dw_band wf_parse_bandinfo (string dw_band)
end prototypes

event ue_refresh();dw_1.event clicked( i_xpos , i_ypos , i_row , i_dwo)
end event

public function integer wf_resizepanels ();//Resize the panels according to the Lines, 
//BarThickness, and WindowBorder.

Integer	li_Cnt, li_X, li_Y, li_HHeight, li_HWidth
Long		ll_Width, ll_Height

ll_Width = this.WorkSpaceWidth()
ll_Height = this.WorkspaceHeight()

If ll_Width < idrg_Vertical[2].X + 150 Then
	ll_Width = idrg_Vertical[2].X + 150
End If

If ll_Height < idrg_Vertical[1].Y + 150 Then
	ll_Height = Idrg_Vertical[1].Y + 150
End If

// Left vertical object processing
idrg_Vertical[1].Move (ii_WindowBorder, ii_WindowBorder)
idrg_Vertical[1].Resize (st_vertical.X - idrg_Vertical[1].X, ll_Height - idrg_Vertical[1].Y - ii_WindowBorder)

// Right vertical object processing
idrg_Vertical[2].Move (st_vertical.X + ii_BarThickness, ii_WindowBorder)
idrg_Vertical[2].Resize (ll_Width - idrg_Vertical[2].X - ii_WindowBorder, ll_Height - idrg_Vertical[2].Y - ii_WindowBorder)

Return 1

end function

public function integer wf_resizebars ();//Resize Bars according to Bars themselves, WindowBorder, and BarThickness.

Integer	li_HX, li_HW, li_Cnt

st_vertical.Move(st_vertical.X, ii_WindowBorder)
st_vertical.Resize(ii_barthickness, 5 + This.WorkSpaceHeight() - (2 * ii_WindowBorder))

wf_RefreshBars()

Return 1
end function

public function integer wf_refreshbars ();Integer	li_Cnt

//Force appropriate order
st_vertical.SetPosition(ToTop!)

//Make sure the Width is not lost
st_vertical.Width = ii_BarThickness

Return 1

end function

public function str_dw_band wf_parse_bandinfo (string dw_band);str_dw_band my_dw_band
long pos 

pos = pos(dw_band , "~t")

if pos > 0 then 
	my_dw_band.band = mid(dw_band , 1 , pos - 1)
	my_dw_band.row = long (mid (dw_band, pos + 1 , len(dw_band)))
end if
return my_dw_band
end function

on w_treeview_sample.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_vertical=create st_vertical
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_vertical
this.Control[iCurrent+3]=this.dw_2
this.Control[iCurrent+4]=this.dw_1
end on

on w_treeview_sample.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_vertical)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;

// The following lines are for setting up the resizing service
idrg_Vertical[1] = dw_1
idrg_Vertical[2] = dw_2

// Set the color of the bars to make them invisible
il_HiddenColor = This.BackColor
st_Vertical.BackColor = il_HiddenColor

//Resize Bars
wf_ResizeBars()

//Resize the panels
wf_ResizePanels()


dw_1.SetTransObject(sqlca)
dw_1.Retrieve()
//dw_1.collapseall( )
end event

event resize;// Do not run the first time the window is opened.
If IsValid(idrg_Vertical[1]) Then
	//Resize Bars
	wf_ResizeBars()

	//Resize the panels
	wf_ResizePanels()
End If

end event

type cb_1 from commandbutton within w_treeview_sample
integer x = 599
integer y = 2136
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "saveas"
end type

event clicked;//dw_1.object.datawindow.export.pdf.method = distill!
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

dw_1.object.datawindow.export.pdf.method =nativepdf!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=2
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=3
dw_1.saveas( )
end event

type st_vertical from statictext within w_treeview_sample
event ue_mousemove pbm_mousemove
event ue_mouseup pbm_lbuttonup
integer x = 1755
integer y = 84
integer width = 41
integer height = 468
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "SizeWE!"
long textcolor = 33554432
long backcolor = 0
boolean focusrectangle = false
end type

event ue_mousemove;//Check for move in progess
If KeyDown(keyLeftButton!) Then
	This.x = Parent.PointerX()
End If
end event

event ue_mouseup;//Hide the bar
If Not ib_debug Then This.BackColor = il_hiddencolor

//Resize the panels
wf_ResizePanels()

end event

type dw_2 from datawindow within w_treeview_sample
integer x = 1833
integer y = 44
integer width = 1472
integer height = 2064
integer taborder = 20
string title = "none"
string dataobject = "d_customs"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//
long line_id , order_id
if this.dataobject = "d_product" and row > 0 then
	line_id = this.GetItemNumber(row , 'sales_order_items_line_id')
	order_id = this.GetItemNumber(row , 'sales_order_items_id')
	openwithparm(w_data_edit , string(order_id) + "::" + string(line_id))
	//i_activate = true
	//this.SettransObject(sqlca)
	this.retrieve( order_id)

else
end if


end event

type dw_1 from datawindow within w_treeview_sample
event ue_collapsed pbm_dwncollapsed
integer x = 46
integer y = 44
integer width = 1710
integer height = 2056
integer taborder = 10
string dataobject = "d_sales_report"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string obj_name , obj_type , dw_band
str_dw_band my_band
long sales_id , cust_id , order_id

obj_name = dwo.name
obj_type = dwo.type
dw_band = this.GetBandAtPointer()
my_band = wf_parse_bandinfo (dw_band)

choose case obj_name
	case 'sales'
		sales_id = dw_1.GetItemNumber(my_band.row , 'employee_emp_id')
		dw_2.dataobject = 'd_customs'
		dw_2.SetTransObject(sqlca)
		dw_2.Retrieve(sales_id)
	case 'company_name'
		cust_id = dw_1.GetItemNumber(my_band.row , 'cust_id')
		sales_id = dw_1.GetItemNumber(my_band.row , 'employee_emp_id')
		dw_2.dataobject = 'd_sales_order'
		dw_2.SetTransObject(sqlca)
		dw_2.Retrieve(cust_id , sales_id)
	case 'id'
		order_id = dw_1.GetItemNumber(my_band.row , 'id')
		dw_2.dataobject = 'd_product'
		dw_2.SetTransObject(sqlca)
		dw_2.Retrieve(order_id)
		
	case else
		
end choose

end event

event rbuttondown;popmenu mymenu

mymenu = create popmenu 
//messagebox("",PixelsToUnits(xpos, XPixelsToUnits! ))
mymenu.PopMenu (PixelsToUnits(xpos , XPixelsToUnits! ) + this.x, PixelsToUnits(ypos, YPixelsToUnits! ) +this.y)
end event

