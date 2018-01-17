$PBExportHeader$w_dw_stored_proc.srw
$PBExportComments$Stored Procedure source DataWindows example
forward
global type w_dw_stored_proc from window
end type
type cb_3 from commandbutton within w_dw_stored_proc
end type
type cb_2 from commandbutton within w_dw_stored_proc
end type
type cb_1 from commandbutton within w_dw_stored_proc
end type
type st_1 from statictext within w_dw_stored_proc
end type
type st_name from statictext within w_dw_stored_proc
end type
type dw_cust from datawindow within w_dw_stored_proc
end type
type cb_close from commandbutton within w_dw_stored_proc
end type
type dw_prod_info from datawindow within w_dw_stored_proc
end type
type dw_prod_ordered from datawindow within w_dw_stored_proc
end type
type dw_sales_orders from datawindow within w_dw_stored_proc
end type
end forward

global type w_dw_stored_proc from window
integer x = 5
integer y = 16
integer width = 2834
integer height = 1860
boolean titlebar = true
string title = "Stored Procedure Source DataWindows"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
event ue_open pbm_custom01
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_1 st_1
st_name st_name
dw_cust dw_cust
cb_close cb_close
dw_prod_info dw_prod_info
dw_prod_ordered dw_prod_ordered
dw_sales_orders dw_sales_orders
end type
global w_dw_stored_proc w_dw_stored_proc

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
Integer   ii_cust_id

end variables

event ue_open;//====================================================================
// Event: ue_open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		unsignedlong	wparam		
//		long        	lparam		
//--------------------------------------------------------------------
// Returns: long [pbm_custom01]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
DataWindowChild	ldw_child


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Set transaction objects
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_prod_ordered.SetTransObject (sqlca)
dw_prod_info.SetTransObject (sqlca)
dw_sales_orders.SetTransObject (sqlca)

//set datawindow dw_prod_ordered readonly
dw_prod_ordered.Object.datawindow.Readonly = True

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve customers list
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_cust.GetChild ("cust_id", ldw_child)
ldw_child.SetTransObject (sqlca)
ldw_child.Retrieve()

dw_cust.InsertRow (0)




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

This.PostEvent ("ue_open")

end event

on w_dw_stored_proc.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.st_name=create st_name
this.dw_cust=create dw_cust
this.cb_close=create cb_close
this.dw_prod_info=create dw_prod_info
this.dw_prod_ordered=create dw_prod_ordered
this.dw_sales_orders=create dw_sales_orders
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.st_name,&
this.dw_cust,&
this.cb_close,&
this.dw_prod_info,&
this.dw_prod_ordered,&
this.dw_sales_orders}
end on

on w_dw_stored_proc.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.st_name)
destroy(this.dw_cust)
destroy(this.cb_close)
destroy(this.dw_prod_info)
destroy(this.dw_prod_ordered)
destroy(this.dw_sales_orders)
end on

type cb_3 from commandbutton within w_dw_stored_proc
integer x = 2263
integer y = 100
integer width = 361
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas3"
boolean cancel = true
end type

event clicked;dw_prod_ordered.saveas( )
end event

type cb_2 from commandbutton within w_dw_stored_proc
integer x = 1280
integer y = 1620
integer width = 361
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas1"
boolean cancel = true
end type

event clicked;dw_sales_orders.saveas( )
end event

type cb_1 from commandbutton within w_dw_stored_proc
integer x = 649
integer y = 1616
integer width = 361
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas2"
boolean cancel = true
end type

event clicked;dw_prod_info.saveas( )
end event

type st_1 from statictext within w_dw_stored_proc
integer x = 55
integer y = 40
integer width = 2126
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "All the DataWindows in this example were created with a stored procedure data source."
boolean focusrectangle = false
end type

type st_name from statictext within w_dw_stored_proc
integer x = 763
integer y = 132
integer width = 1499
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_cust from datawindow within w_dw_stored_proc
integer x = 46
integer y = 104
integer width = 718
integer height = 104
integer taborder = 40
string dataobject = "d_dw_sp_customer"
boolean border = false
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

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// A new customer has been selected, retrieve the product orders graph
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

ii_cust_id = Integer (This.GetText())

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Reset the product info and sales orders DataWindows
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//reset error
dw_prod_info.Reset()
dw_sales_orders.Reset()

String  ls_FirstName,ls_LastName
SELECT "customer"."fname",
	"customer"."lname"
	INTO :ls_FirstName,
	:ls_LastName
	FROM "customer"
	Where "customer"."id" = :ii_cust_id;
	
st_Name.Text = "First Name: "+ls_FirstName+", Last Name: "+ls_LastName
dw_prod_ordered.Retrieve (ii_cust_id)


end event

type cb_close from commandbutton within w_dw_stored_proc
integer x = 2382
integer y = 1620
integer width = 361
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
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
CLOSE (Parent)

end event

type dw_prod_info from datawindow within w_dw_stored_proc
integer x = 41
integer y = 872
integer width = 1056
integer height = 720
integer taborder = 10
string dataobject = "d_dw_product_info"
borderstyle borderstyle = stylelowered!
end type

type dw_prod_ordered from datawindow within w_dw_stored_proc
integer x = 41
integer y = 220
integer width = 2706
integer height = 620
integer taborder = 20
string dataobject = "d_sp_cust_products"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;// Retrieve the product and sales order data for the category (product) 
int			li_product_id

If currentrow = 0 Then 
	Return
End If

// retrieve the product information and sales orders
li_product_id  = This.object.id[currentrow]
this.selectrow(0,false)
this.selectrow(currentrow,true)

SetPointer (hourglass!)
dw_prod_info.Retrieve (li_product_id)
dw_sales_orders.Retrieve (ii_cust_id, li_product_id)

end event

event retrieveend;//====================================================================
// Event: retrieveend()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	rowcount		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnretrieveend]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
If RowCount > 0 Then
	This.Event RowFocusChanged(1)
End If

end event

type dw_sales_orders from datawindow within w_dw_stored_proc
integer x = 1125
integer y = 872
integer width = 1623
integer height = 720
integer taborder = 30
string dataobject = "d_dw_sp_orders"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

