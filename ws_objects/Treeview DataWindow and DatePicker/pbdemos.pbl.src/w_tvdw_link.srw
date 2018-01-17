$PBExportHeader$w_tvdw_link.srw
forward
global type w_tvdw_link from w_basesheet
end type
type cb_1 from commandbutton within w_tvdw_link
end type
type st_vertical from statictext within w_tvdw_link
end type
type st_horizontal3 from statictext within w_tvdw_link
end type
type st_horizontal2 from statictext within w_tvdw_link
end type
type st_horizontal1 from statictext within w_tvdw_link
end type
type dw_4 from datawindow within w_tvdw_link
end type
type dw_3 from datawindow within w_tvdw_link
end type
type dw_2 from datawindow within w_tvdw_link
end type
type dw_1 from datawindow within w_tvdw_link
end type
type dw_tv from datawindow within w_tvdw_link
end type
end forward

global type w_tvdw_link from w_basesheet
integer width = 3378
integer height = 2352
string title = "TreeView DataWindow Linking"
long backcolor = 67108864
string icon = "AppIcon!"
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
cb_1 cb_1
st_vertical st_vertical
st_horizontal3 st_horizontal3
st_horizontal2 st_horizontal2
st_horizontal1 st_horizontal1
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
dw_tv dw_tv
end type
global w_tvdw_link w_tvdw_link

type variables
// The following are used for the resizing service
boolean		ib_debug=False	//Debug mode
long		il_hiddencolor=0	//Bar hidden color to match the window background
long		il_OldHeight	//Save the height of the window
integer		ii_barthickness=11	//Bar Thickness
integer		ii_windowborder=15	//Window border to be used on all sides
dragobject	idrg_Vertical	//Reference to the vertical control on the left of the window
dragobject	idrg_Horizontal[4]	//Reference to the horizontal controls on the right of the window
statictext		ist_Horizontal[3]	//Reference to the horizontal bars

DataWindow	idw_Data[4]

end variables

forward prototypes
public function str_dw_band wf_parse_bandinfo (string dw_band)
public function integer wf_resizebars ()
public function integer wf_refreshbars ()
public function integer wf_resizepanels ()
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

public function integer wf_resizebars ();//Resize Bars according to Bars themselves, WindowBorder, and BarThickness.

Integer	li_HX, li_HW, li_Cnt
st_vertical.Move(st_vertical.X, ii_WindowBorder)
st_vertical.Resize(ii_barthickness, 5 + This.WorkSpaceHeight() - (2 * ii_WindowBorder))

li_HX = st_vertical.X + ii_BarThickness
li_HW = This.WorkSpaceWidth() - li_HX - ii_WindowBorder

For li_Cnt = 1 To 3
	ist_Horizontal[li_Cnt].Move(li_HX, ist_Horizontal[li_Cnt].Y)
	ist_Horizontal[li_Cnt].Resize(li_HW, ii_BarThickness)
Next

wf_RefreshBars()

Return 1


end function

public function integer wf_refreshbars ();Integer	li_Cnt

//Force appropriate order
st_vertical.SetPosition(ToTop!)

//Make sure the Width is not lost
st_vertical.Width = ii_BarThickness

For li_Cnt = 1 To 3
	ist_Horizontal[li_Cnt].SetPosition(ToTop!)
	ist_Horizontal[li_Cnt].Height = ii_BarThickness
Next

Return 1

end function

public function integer wf_resizepanels ();//Resize the panels according to the Lines, 
//BarThickness, and WindowBorder.

Integer	li_Cnt, li_X, li_Y, li_HHeight, li_HWidth
Long		ll_Width, ll_Height

ll_Width = this.WorkSpaceWidth()
ll_Height = this.WorkspaceHeight()

If ll_Width < idrg_Vertical.X + 150 Then
	ll_Width = idrg_Vertical.X + 150
End If

If ll_Height < idrg_Vertical.Y + 150 Then
	ll_Height = Idrg_Vertical.Y + 150
End If

// Left vertical object processing
idrg_Vertical.Move (ii_WindowBorder, ii_WindowBorder)
idrg_Vertical.Resize (st_vertical.X - idrg_Vertical.X, ll_Height - idrg_Vertical.Y - ii_WindowBorder)

// Horizontal object processing
For li_Cnt = 1 To 4
	li_X = st_vertical.X + ii_BarThickness
	If li_Cnt = 1 Then
		li_Y = ii_WindowBorder
	Else
		li_Y = ist_Horizontal[li_Cnt - 1].Y + ii_BarThickness
	End If
	
	idrg_Horizontal[li_Cnt].Move (li_X, li_Y)
	
	li_HWidth = ist_Horizontal[1].Width
	If li_Cnt = 1 Then
		li_HHeight = ist_Horizontal[1].Y - ii_WindowBorder
	ElseIf li_Cnt = 4 Then
		li_HHeight = ll_Height - (ist_Horizontal[3].Y + ii_BarThickness) - ii_WindowBorder
	Else		
		li_HHeight = ist_Horizontal[li_Cnt].Y - (ist_Horizontal[li_Cnt - 1].Y + ii_BarThickness)
	End If

	idrg_Horizontal[li_Cnt].Resize (li_HWidth, li_HHeight)
Next

Return 1

end function

on w_tvdw_link.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_vertical=create st_vertical
this.st_horizontal3=create st_horizontal3
this.st_horizontal2=create st_horizontal2
this.st_horizontal1=create st_horizontal1
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.dw_tv=create dw_tv
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_vertical
this.Control[iCurrent+3]=this.st_horizontal3
this.Control[iCurrent+4]=this.st_horizontal2
this.Control[iCurrent+5]=this.st_horizontal1
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.dw_2
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.dw_tv
end on

on w_tvdw_link.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_vertical)
destroy(this.st_horizontal3)
destroy(this.st_horizontal2)
destroy(this.st_horizontal1)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.dw_tv)
end on

event open;Integer	li_Cnt

SetPointer(HourGlass!)

// Set DataWindow objects in array
idw_Data[1] = dw_1
idw_Data[2] = dw_2
idw_Data[3] = dw_3
idw_Data[4] = dw_4

// The following lines are for setting up the resizing service
il_OldHeight = This.WorkspaceHeight()

idrg_Vertical = dw_tv

For li_Cnt = 1 To 4
	idrg_Horizontal[li_Cnt] = idw_Data[li_Cnt]
Next

ist_Horizontal[1] = st_horizontal1
ist_Horizontal[2] = st_horizontal2
ist_Horizontal[3] = st_horizontal3

// Set the color of the bars to make them invisible
il_HiddenColor = This.BackColor
st_Vertical.BackColor = il_HiddenColor
For li_Cnt = 1 To 3
	ist_Horizontal[li_Cnt].BackColor = il_HiddenColor
Next

//Resize Bars
wf_ResizeBars()

//Resize the panels
wf_ResizePanels()


dw_tv.SetTransObject(sqlca)
dw_tv.Retrieve()
dw_1.SetTransObject(sqlca)
dw_2.SetTransObject(sqlca)
dw_3.SetTransObject(sqlca)
dw_4.SetTransObject(sqlca)
//dw_tv.collapseall( )

end event

event resize;Integer		li_Delta, li_Cnt

// Do not run the first time the window is opened.
If IsValid(idrg_Vertical) Then
	// Move the horizontal bars porportionally
	li_Delta = newheight - il_OldHeight
	il_OldHeight = newheight
	
	For li_Cnt = 1 To 3
		ist_Horizontal[li_Cnt].Y = ist_Horizontal[li_Cnt].Y + (li_Cnt * (li_Delta / 4))
	Next
	
	//Resize Bars
	wf_ResizeBars()

	//Resize the panels
	wf_ResizePanels()
End If

end event

type cb_1 from commandbutton within w_tvdw_link
integer x = 279
integer y = 2136
integer width = 402
integer height = 112
integer taborder = 60
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

type st_vertical from statictext within w_tvdw_link
event ue_mousemove pbm_mousemove
event ue_mouseup pbm_lbuttonup
event ue_mousedown pbm_lbuttondown
integer x = 1097
integer y = 112
integer width = 41
integer height = 220
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

event ue_mousemove;If KeyDown(keyLeftButton!) Then
	This.x = Parent.Pointerx()
End If



end event

event ue_mouseup; This.BackColor = il_HiddenColor
 //Resize Bars
wf_ResizeBars()

//Resize the panels
wf_ResizePanels()
end event

event ue_mousedown;This.BackColor = 0
end event

type st_horizontal3 from statictext within w_tvdw_link
event ue_mouseup pbm_lbuttonup
event ue_mousemove pbm_mousemove
event ue_mousedown pbm_lbuttondown
integer x = 1211
integer y = 1532
integer width = 402
integer height = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "SizeNS!"
long textcolor = 33554432
long backcolor = 0
string text = "none"
boolean focusrectangle = false
end type

event ue_mouseup; This.BackColor = il_HiddenColor
//Resize Bars
wf_ResizeBars()

//Resize the panels
wf_ResizePanels()

end event

event ue_mousemove;//Check for move in progess
If KeyDown(keyLeftButton!) Then
	This.Y = Parent.PointerY()
End If

end event

event ue_mousedown;This.BackColor = 0
end event

type st_horizontal2 from statictext within w_tvdw_link
event ue_mouseup pbm_lbuttonup
event ue_mousemove pbm_mousemove
event ue_mousedown pbm_lbuttondown
integer x = 1189
integer y = 1084
integer width = 402
integer height = 44
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "SizeNS!"
long textcolor = 33554432
long backcolor = 0
string text = "none"
boolean focusrectangle = false
end type

event ue_mouseup; This.BackColor = il_HiddenColor
 //Resize Bars
wf_ResizeBars()

//Resize the panels
wf_ResizePanels()

end event

event ue_mousemove;//Check for move in progess
If KeyDown(keyLeftButton!) Then
	This.Y = Parent.PointerY()
End If

end event

event ue_mousedown;This.BackColor = 0
end event

type st_horizontal1 from statictext within w_tvdw_link
event ue_mousemove pbm_mousemove
event ue_mouseup pbm_lbuttonup
event ue_mousedown pbm_lbuttondown
integer x = 1166
integer y = 500
integer width = 402
integer height = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "SizeNS!"
long textcolor = 33554432
long backcolor = 0
string text = "none"
boolean focusrectangle = false
end type

event ue_mousemove;//Check for move in progess
If KeyDown(keyLeftButton!) Then
	This.Y = Parent.PointerY()
End If

end event

event ue_mouseup; This.BackColor = il_HiddenColor
//Resize Bars
wf_ResizeBars()

//Resize the panels
wf_ResizePanels()

end event

event ue_mousedown;This.BackColor = 0
end event

type dw_4 from datawindow within w_tvdw_link
integer x = 1166
integer y = 1592
integer width = 2039
integer height = 532
integer taborder = 50
string dataobject = "d_salesorder_items"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_tvdw_link
integer x = 1166
integer y = 1132
integer width = 2107
integer height = 388
integer taborder = 40
string dataobject = "d_sales_rep_customer_orders"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_tvdw_link
integer x = 1161
integer y = 544
integer width = 2103
integer height = 532
integer taborder = 30
string dataobject = "d_sales_rep_customers"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_tvdw_link
integer x = 1143
integer y = 36
integer width = 2103
integer height = 456
integer taborder = 20
string dataobject = "d_sales_reps"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_tv from datawindow within w_tvdw_link
integer x = 37
integer y = 32
integer width = 1042
integer height = 2104
integer taborder = 10
string dataobject = "d_sales_report2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string obj_name , obj_type , dw_band
str_dw_band my_band
long sales_id , cust_id , order_id , line_id

obj_name = dwo.name
obj_type = dwo.type
dw_band = this.GetBandAtPointer()
my_band = wf_parse_bandinfo (dw_band)

choose case  my_band.band //obj_name
	case 'tree.level.1' // 'sales'
		sales_id = this.GetItemNumber(my_band.row , 'employee_emp_id')
		dw_1.Retrieve(sales_id)
	case 'tree.level.2'  //'company_name'
		cust_id = this.GetItemNumber(my_band.row , 'cust_id')
		sales_id = this.GetItemNumber(my_band.row , 'employee_emp_id')
		dw_2.Retrieve( sales_id  , cust_id)
	case 'tree.level.3' //'id'
		cust_id = this.GetItemNumber(my_band.row , 'cust_id')
		sales_id = this.GetItemNumber(my_band.row , 'employee_emp_id')
		dw_3.Retrieve(cust_id , sales_id)
	case 'detail'
		order_id = this.GetItemNumber(my_band.row , 'id')
		line_id = this.GetItemNumber(my_band.row , 'sales_order_items_line_id')
		dw_4.Retrieve(order_id , line_id)
		
	case else
		
end choose

end event

