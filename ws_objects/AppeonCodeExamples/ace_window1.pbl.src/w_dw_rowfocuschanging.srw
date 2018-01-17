$PBExportHeader$w_dw_rowfocuschanging.srw
$PBExportComments$Example of using rowfocuchanging event
forward
global type w_dw_rowfocuschanging from window
end type
type cb_1 from commandbutton within w_dw_rowfocuschanging
end type
type cb_close from commandbutton within w_dw_rowfocuschanging
end type
type cb_save from commandbutton within w_dw_rowfocuschanging
end type
type cb_delete from commandbutton within w_dw_rowfocuschanging
end type
type cb_add from commandbutton within w_dw_rowfocuschanging
end type
type dw_items from datawindow within w_dw_rowfocuschanging
end type
type dw_order from datawindow within w_dw_rowfocuschanging
end type
end forward

global type w_dw_rowfocuschanging from window
integer x = 370
integer y = 348
integer width = 2240
integer height = 1064
boolean titlebar = true
string title = "Update Sales Order"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
boolean center = true
cb_1 cb_1
cb_close cb_close
cb_save cb_save
cb_delete cb_delete
cb_add cb_add
dw_items dw_items
dw_order dw_order
end type
global w_dw_rowfocuschanging w_dw_rowfocuschanging

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
Boolean	ib_RowChanged = False, &
	ib_SaveNeeded = False
Integer	ii_OrderNo //current Order Number

end variables

forward prototypes
public function integer of_retrieve ()
public function integer of_get_max_line ()
public function integer of_validate_data (integer ai_row)
public function integer of_save ()
end prototypes

public function integer of_retrieve ();//====================================================================
// Function: of_retrieve()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer		li_Order, li_RC,li_Row

li_Row = dw_order.GetRow()
li_Order = dw_order.Object.id[li_Row]

li_RC = dw_order.Retrieve(li_Order)

If li_RC < 1 Then Return li_RC

ii_OrderNo = li_Order

Return dw_items.Retrieve(li_Order)


end function

public function integer of_get_max_line ();//====================================================================
// Function: of_get_max_line()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer		li_Max, li_Cnt, li_Rows, li_Line

li_Rows = dw_items.RowCount()
For li_Cnt = 1 To li_Rows
	li_Line = Integer(dw_items.Object.line_id[li_Cnt])
	If li_Line > li_Max Then
		li_Max = li_Line
	End If
Next

Return li_Max

end function

public function integer of_validate_data (integer ai_row);//====================================================================
// Function: of_validate_data()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	ai_row		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//check row number validation
DateTime		ldt_shipdate,ldt_orderdate
Long			ll_row

If ai_row = 0 Then
	Return 0
End If

ll_row = dw_order.GetRow()

If IsNull(dw_items.Object.prod_id[ai_row]) Or (dw_items.Object.prod_id[ai_row] = 0) Then
	MessageBox("Invalid Data", "Please select a product ID.", Exclamation!)
	Return 1
End If

ldt_shipdate = dw_items.Object.ship_date[ai_row]
ldt_orderdate = dw_order.Object.order_date[ll_row]
If Not DateTime(ldt_shipdate) >= DateTime(ldt_orderdate) Then
	MessageBox("Invalid Data", "The Ship Date must be greater than or equal to the Order Date.", Exclamation!)
	Return 1
End If

If Not dw_items.Object.quantity[ai_row] > 0 Then
	MessageBox("Invalid Data", "Quantity must be greater than 0.", Exclamation!)
	Return 1
End If

Return 0


end function

public function integer of_save ();//====================================================================
// Function: of_save()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_order.UPDATE()
dw_items.UPDATE()

ib_RowChanged = False
ib_SaveNeeded = False

Return 1


end function

on w_dw_rowfocuschanging.create
this.cb_1=create cb_1
this.cb_close=create cb_close
this.cb_save=create cb_save
this.cb_delete=create cb_delete
this.cb_add=create cb_add
this.dw_items=create dw_items
this.dw_order=create dw_order
this.Control[]={this.cb_1,&
this.cb_close,&
this.cb_save,&
this.cb_delete,&
this.cb_add,&
this.dw_items,&
this.dw_order}
end on

on w_dw_rowfocuschanging.destroy
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.cb_delete)
destroy(this.cb_add)
destroy(this.dw_items)
destroy(this.dw_order)
end on

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

dw_order.SetTransObject(sqlca)
dw_order.InsertRow(0)

dw_items.SetTransObject(sqlca)



end event

event closequery;//====================================================================
// Event: closequery()
//--------------------------------------------------------------------
// Description: close query datawindow
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_closequery]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Integer		li_RC

If ib_SaveNeeded Then
	li_RC = MessageBox("Warning", "You have made some changes.  Do you wish to save before closing?", Question!, YesNoCancel!, 1)
	If li_RC = 1 Then
		cb_save.Trigger Event clicked()
		Return 0
	ElseIf li_RC = 2 Then
		Return 0
	Else
		Return 1
	End If
End If

end event

type cb_1 from commandbutton within w_dw_rowfocuschanging
integer x = 1806
integer y = 380
integer width = 347
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_order.saveas( )
end event

type cb_close from commandbutton within w_dw_rowfocuschanging
integer x = 1806
integer y = 824
integer width = 347
integer height = 96
integer taborder = 60
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

type cb_save from commandbutton within w_dw_rowfocuschanging
integer x = 1806
integer y = 264
integer width = 347
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save"
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
If ib_RowChanged Then
	If of_validate_data(dw_items.GetRow()) = 0 Then
		of_save()
	Else
		dw_items.SetFocus()
	End If
Else
	of_save()
End If



end event

type cb_delete from commandbutton within w_dw_rowfocuschanging
integer x = 1806
integer y = 148
integer width = 347
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Item"
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
dw_items.DeleteRow(dw_items.GetRow())

ib_SaveNeeded = True


end event

type cb_add from commandbutton within w_dw_rowfocuschanging
integer x = 1806
integer y = 32
integer width = 347
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Item"
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
Integer		li_Row

li_Row = dw_items.InsertRow(0)

dw_items.Object.id[li_Row] = ii_OrderNo
dw_items.Object.line_id[li_Row] = of_get_max_line() + 1

dw_items.ScrollToRow(li_Row)

ib_SaveNeeded = True
ib_RowChanged = True


end event

type dw_items from datawindow within w_dw_rowfocuschanging
integer x = 32
integer y = 380
integer width = 1728
integer height = 540
integer taborder = 20
string dataobject = "d_sales_order_item_edit"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//====================================================================
// Event: itemchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row 		
//		dwobject	dwo 		
//		string  	data		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
ib_RowChanged = True
ib_SaveNeeded = True


end event

event rowfocuschanging;//====================================================================
// Event: rowfocuschanging()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	currentrow		
//		long	newrow    		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrowchanging]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
If ib_RowChanged Then
	Return of_validate_data(currentrow)
End If

end event

event rowfocuschanged;//====================================================================
// Event: rowfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	currentrow		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrowchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
ib_RowChanged = False


end event

event losefocus;//====================================================================
// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnkillfocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.AcceptText()


end event

type dw_order from datawindow within w_dw_rowfocuschanging
integer x = 32
integer y = 28
integer width = 1728
integer height = 340
integer taborder = 10
string dataobject = "d_sales_order_edit"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//====================================================================
// Event: itemchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row 		
//		dwobject	dwo 		
//		string  	data		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String	ls_Object

ls_Object = String(dwo.Name)

If ls_Object = "id" Then
	If ib_RowChanged Then
		If of_validate_data(dw_items.GetRow()) = 1 Then
			This.Object.id[This.GetRow()] = ii_OrderNo
			dw_items.SetFocus()
			Return
		End If
	End If
	
	Post of_retrieve()
End If




end event

