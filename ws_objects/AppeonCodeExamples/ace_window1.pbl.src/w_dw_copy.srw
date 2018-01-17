$PBExportHeader$w_dw_copy.srw
$PBExportComments$Copy data from one DataWindow to another using an array of structures
forward
global type w_dw_copy from window
end type
type cb_1 from commandbutton within w_dw_copy
end type
type st_item from statictext within w_dw_copy
end type
type st_11 from statictext within w_dw_copy
end type
type st_10 from statictext within w_dw_copy
end type
type st_col from statictext within w_dw_copy
end type
type st_8 from statictext within w_dw_copy
end type
type st_row from statictext within w_dw_copy
end type
type st_3 from statictext within w_dw_copy
end type
type st_all from statictext within w_dw_copy
end type
type cb_dot_byitem from commandbutton within w_dw_copy
end type
type cb_dot_bycol from commandbutton within w_dw_copy
end type
type cb_dot_byrow from commandbutton within w_dw_copy
end type
type cb_dot_byall from commandbutton within w_dw_copy
end type
type cb_rowscopy from commandbutton within w_dw_copy
end type
type st_rowscopy from statictext within w_dw_copy
end type
type st_5 from statictext within w_dw_copy
end type
type st_7 from statictext within w_dw_copy
end type
type st_6 from statictext within w_dw_copy
end type
type st_getitem from statictext within w_dw_copy
end type
type st_1 from statictext within w_dw_copy
end type
type cb_getitem from commandbutton within w_dw_copy
end type
type cb_close from commandbutton within w_dw_copy
end type
type cb_reset from commandbutton within w_dw_copy
end type
type dw_dest from datawindow within w_dw_copy
end type
type dw_source from datawindow within w_dw_copy
end type
type os_data from structure within w_dw_copy
end type
end forward

type os_data from structure
	integer		id
	integer		line_id
	integer		prod_id
	integer		quantity
	datetime		ship_date
end type

global type w_dw_copy from window
integer x = 5
integer y = 4
integer width = 2793
integer height = 1536
boolean titlebar = true
string title = "Copy DataWindow"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
cb_1 cb_1
st_item st_item
st_11 st_11
st_10 st_10
st_col st_col
st_8 st_8
st_row st_row
st_3 st_3
st_all st_all
cb_dot_byitem cb_dot_byitem
cb_dot_bycol cb_dot_bycol
cb_dot_byrow cb_dot_byrow
cb_dot_byall cb_dot_byall
cb_rowscopy cb_rowscopy
st_rowscopy st_rowscopy
st_5 st_5
st_7 st_7
st_6 st_6
st_getitem st_getitem
st_1 st_1
cb_getitem cb_getitem
cb_close cb_close
cb_reset cb_reset
dw_dest dw_dest
dw_source dw_source
end type
global w_dw_copy w_dw_copy

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long	il_Begin, il_Rows

end variables

event ue_postopen();//====================================================================
// Event: ue_postopen()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
SetPointer(HourGlass!)

dw_source.SetTransObject(sqlca)
il_Rows = dw_source.Retrieve()


end event

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.X = 0
This.Y = 0

Post Event ue_postopen()


end event

on w_dw_copy.create
this.cb_1=create cb_1
this.st_item=create st_item
this.st_11=create st_11
this.st_10=create st_10
this.st_col=create st_col
this.st_8=create st_8
this.st_row=create st_row
this.st_3=create st_3
this.st_all=create st_all
this.cb_dot_byitem=create cb_dot_byitem
this.cb_dot_bycol=create cb_dot_bycol
this.cb_dot_byrow=create cb_dot_byrow
this.cb_dot_byall=create cb_dot_byall
this.cb_rowscopy=create cb_rowscopy
this.st_rowscopy=create st_rowscopy
this.st_5=create st_5
this.st_7=create st_7
this.st_6=create st_6
this.st_getitem=create st_getitem
this.st_1=create st_1
this.cb_getitem=create cb_getitem
this.cb_close=create cb_close
this.cb_reset=create cb_reset
this.dw_dest=create dw_dest
this.dw_source=create dw_source
this.Control[]={this.cb_1,&
this.st_item,&
this.st_11,&
this.st_10,&
this.st_col,&
this.st_8,&
this.st_row,&
this.st_3,&
this.st_all,&
this.cb_dot_byitem,&
this.cb_dot_bycol,&
this.cb_dot_byrow,&
this.cb_dot_byall,&
this.cb_rowscopy,&
this.st_rowscopy,&
this.st_5,&
this.st_7,&
this.st_6,&
this.st_getitem,&
this.st_1,&
this.cb_getitem,&
this.cb_close,&
this.cb_reset,&
this.dw_dest,&
this.dw_source}
end on

on w_dw_copy.destroy
destroy(this.cb_1)
destroy(this.st_item)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_col)
destroy(this.st_8)
destroy(this.st_row)
destroy(this.st_3)
destroy(this.st_all)
destroy(this.cb_dot_byitem)
destroy(this.cb_dot_bycol)
destroy(this.cb_dot_byrow)
destroy(this.cb_dot_byall)
destroy(this.cb_rowscopy)
destroy(this.st_rowscopy)
destroy(this.st_5)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_getitem)
destroy(this.st_1)
destroy(this.cb_getitem)
destroy(this.cb_close)
destroy(this.cb_reset)
destroy(this.dw_dest)
destroy(this.dw_source)
end on

type cb_1 from commandbutton within w_dw_copy
integer x = 1591
integer y = 1316
integer width = 334
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_source.saveas( )
end event

type st_item from statictext within w_dw_copy
integer x = 2258
integer y = 232
integer width = 206
integer height = 88
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_11 from statictext within w_dw_copy
integer x = 2473
integer y = 252
integer width = 219
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "rows"
boolean focusrectangle = false
end type

type st_10 from statictext within w_dw_copy
integer x = 2473
integer y = 148
integer width = 219
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "rows"
boolean focusrectangle = false
end type

type st_col from statictext within w_dw_copy
integer x = 2258
integer y = 132
integer width = 206
integer height = 88
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_dw_copy
integer x = 2478
integer y = 52
integer width = 219
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "rows"
boolean focusrectangle = false
end type

type st_row from statictext within w_dw_copy
integer x = 2258
integer y = 32
integer width = 206
integer height = 88
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_dw_copy
integer x = 1120
integer y = 240
integer width = 219
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "rows"
boolean focusrectangle = false
end type

type st_all from statictext within w_dw_copy
integer x = 901
integer y = 228
integer width = 206
integer height = 88
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_dot_byitem from commandbutton within w_dw_copy
integer x = 1394
integer y = 232
integer width = 855
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy Using Dot Notation by Item"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long			ll_Cnt,ll_New
Integer		li_Data
Date	ldt_Data

SetPointer(HourGlass!)

dw_dest.Reset()
il_Rows = dw_source.RowCount()
For ll_Cnt = 1 To il_Rows
	
	dw_dest.Object.id[ll_Cnt] = dw_source.Object.id[ll_Cnt]
	dw_dest.Object.line_id[ll_Cnt] = dw_source.Object.line_id[ll_Cnt]
	dw_dest.Object.prod_id[ll_Cnt] = dw_source.Object.prod_id[ll_Cnt]
	dw_dest.Object.quantity[ll_Cnt] = dw_source.Object.quantity[ll_Cnt]
	dw_dest.Object.ship_date[ll_Cnt] = dw_source.Object.ship_date[ll_Cnt]
	// Display Rows
	st_item.Text = String(ll_Cnt)
	
Next



end event

type cb_dot_bycol from commandbutton within w_dw_copy
integer x = 1394
integer y = 132
integer width = 855
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy Using Dot Notation by Column"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long			ll_Cnt,ll_New
Integer		li_Data
Date	ldt_Data

SetPointer(HourGlass!)

dw_dest.Reset()
il_Rows = dw_source.RowCount()
dw_dest.Object.id[1,il_rows] = dw_source.Object.id[1,il_rows]
dw_dest.Object.line_id[1,il_rows] = dw_source.Object.line_id[1,il_rows]
dw_dest.Object.prod_id[1,il_rows] = dw_source.Object.prod_id[1,il_rows]
dw_dest.Object.quantity[1,il_rows] = dw_source.Object.quantity[1,il_rows]
dw_dest.Object.ship_date[1,il_rows] = dw_source.Object.ship_date[1,il_rows]

st_col.Text = String(dw_dest.RowCount())



end event

type cb_dot_byrow from commandbutton within w_dw_copy
integer x = 1394
integer y = 32
integer width = 855
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy Using Dot Notation by Row"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long			ll_Cnt,ll_New
Integer		li_Data
Date	ldt_Data

SetPointer(HourGlass!)

// First, reset the destination DataWindow and turn redraw off
dw_dest.Reset()
il_Rows = dw_source.RowCount()
For ll_Cnt = 1 To il_Rows
	
	// Insert a blank row
	//ll_New = dw_dest.InsertRow(0)
	dw_dest.Object.Data[ll_Cnt] = dw_source.Object.Data[ll_Cnt]
	
	st_row.Text = String(ll_Cnt)
	
Next





end event

type cb_dot_byall from commandbutton within w_dw_copy
integer x = 37
integer y = 228
integer width = 855
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy Using Dot Notation by All"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
SetPointer(HourGlass!)

// First, reset the destination DataWindow
dw_dest.Reset()

// Copy the data to the destination DataWindow

dw_dest.Object.Data = dw_source.Object.Data
// Display Rows
st_all.Text = String(dw_dest.RowCount())

end event

type cb_rowscopy from commandbutton within w_dw_copy
event clicked pbm_bnclicked
integer x = 37
integer y = 128
integer width = 855
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy Using RowsCopy()"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
SetPointer(HourGlass!)

// First, reset the destination DataWindow
dw_dest.Reset()
il_Rows = dw_source.RowCount()
// Copy the data to the destination DataWindow
dw_source.RowsCopy(1, il_Rows, Primary!, dw_dest, 1, Primary!)

// Display Rows
st_rowscopy.Text = String(dw_dest.RowCount())


end event

type st_rowscopy from statictext within w_dw_copy
integer x = 901
integer y = 124
integer width = 206
integer height = 88
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_dw_copy
integer x = 1120
integer y = 140
integer width = 219
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "rows"
boolean focusrectangle = false
end type

type st_7 from statictext within w_dw_copy
integer x = 1390
integer y = 344
integer width = 658
integer height = 64
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 33554432
long backcolor = 74481808
string text = "Destination DataWindow"
boolean focusrectangle = false
end type

type st_6 from statictext within w_dw_copy
integer x = 23
integer y = 344
integer width = 549
integer height = 64
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 33554432
long backcolor = 74481808
string text = "Source DataWindow"
boolean focusrectangle = false
end type

type st_getitem from statictext within w_dw_copy
integer x = 901
integer y = 28
integer width = 206
integer height = 88
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_dw_copy
integer x = 1120
integer y = 40
integer width = 219
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "rows"
boolean focusrectangle = false
end type

type cb_getitem from commandbutton within w_dw_copy
event clicked pbm_bnclicked
integer x = 37
integer y = 28
integer width = 855
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy Using GetItem/SetItem"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long			ll_Cnt,ll_New
Integer		li_Data
Date	ldt_Data

SetPointer(HourGlass!)

// First, reset the destination DataWindow and turn redraw off
dw_dest.Reset()

il_Rows = dw_source.RowCount()
For ll_Cnt = 1 To il_Rows
	
	// Insert a blank row
	ll_New = dw_dest.InsertRow(0)
	
	// Copy data from the source DataWindow using GetItem...
	// And write it to the destination DataWindow using SetItem
	li_Data = dw_source.GetItemNumber(ll_Cnt, "id")
	dw_dest.SetItem(ll_New, "id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "line_id")
	dw_dest.SetItem(ll_New, "line_id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "prod_id")
	dw_dest.SetItem(ll_New, "prod_id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "quantity")
	dw_dest.SetItem(ll_New, "quantity", li_Data)
	
	ldt_Data = dw_source.GetItemDate(ll_Cnt, "ship_date")
	dw_dest.SetItem(ll_New, "ship_date", ldt_Data)
	
	// Display Rows
	st_getitem.Text = String(ll_Cnt)
	
Next





end event

type cb_close from commandbutton within w_dw_copy
integer x = 2368
integer y = 1312
integer width = 334
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
CLOSE(Parent)


end event

type cb_reset from commandbutton within w_dw_copy
integer x = 2002
integer y = 1312
integer width = 334
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//Reset Dw
dw_dest.Reset()
st_getitem.Text = ''
st_rowscopy.Text = ''
st_item.Text = ''
st_all.Text = ''
st_row.Text = ''
st_col.Text = ''


end event

type dw_dest from datawindow within w_dw_copy
integer x = 1376
integer y = 428
integer width = 1326
integer height = 852
string dataobject = "d_items"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_source from datawindow within w_dw_copy
integer x = 23
integer y = 428
integer width = 1317
integer height = 852
string dataobject = "d_items"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

