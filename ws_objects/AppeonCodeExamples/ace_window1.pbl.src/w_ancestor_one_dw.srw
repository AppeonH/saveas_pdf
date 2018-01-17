$PBExportHeader$w_ancestor_one_dw.srw
$PBExportComments$Ancestor window with one DataWindow control.  Operations for retrieval, updating, deleting, inserting the DataWindow.
forward
global type w_ancestor_one_dw from window
end type
type cb_1 from uo_saveas within w_ancestor_one_dw
end type
type cbx_1 from checkbox within w_ancestor_one_dw
end type
type cb_saveas from commandbutton within w_ancestor_one_dw
end type
type cb_close from commandbutton within w_ancestor_one_dw
end type
type cb_delete from commandbutton within w_ancestor_one_dw
end type
type cb_insert from commandbutton within w_ancestor_one_dw
end type
type cb_update from commandbutton within w_ancestor_one_dw
end type
type cb_retrieve from commandbutton within w_ancestor_one_dw
end type
type dw_1 from datawindow within w_ancestor_one_dw
end type
end forward

global type w_ancestor_one_dw from window
integer x = 210
integer y = 336
integer width = 2505
integer height = 1456
boolean titlebar = true
string title = "w_ancestor_one_dw"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_close ( )
event type long ue_retrieve ( )
event type long ue_update ( )
event type long ue_insert_row ( )
event type long ue_delete_row ( )
event ue_create_businessobject ( )
cb_1 cb_1
cbx_1 cbx_1
cb_saveas cb_saveas
cb_close cb_close
cb_delete cb_delete
cb_insert cb_insert
cb_update cb_update
cb_retrieve cb_retrieve
dw_1 dw_1
end type
global w_ancestor_one_dw w_ancestor_one_dw

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

// Class object used for business rules
u_business_object   iuo_business_object

// Determine if data has been changed
Boolean   ib_changed


end variables

event ue_close();//====================================================================
// Event: ue_close()
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Close the window
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CLOSE (This)

end event

event type long ue_retrieve();//====================================================================
// Event: ue_retrieve()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer		li_RC

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Call business object function to retrieve the DataWindow
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

li_RC = iuo_business_object.uf_retrieve()


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable/Disable Delete command button, depending on success of the retrieve,
// also update instance variable showing that data has not been changed
// yet (we have just retrieved)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
If li_RC < 0 Then
	cb_delete.Enabled = False
Else
	ib_changed = False
	cb_update.Enabled = False
	If li_RC > 0 Then cb_delete.Enabled = True
End If

Return li_RC


end event

event type long ue_update();//====================================================================
// Event: ue_update()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer	li_RC

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Call business object function to update the DataWindow
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

li_RC = iuo_business_object.uf_update()
If li_RC = 1 Then
	ib_changed = False
	cb_update.Enabled = False
End If

Return li_RC


end event

event type long ue_insert_row();//====================================================================
// Event: ue_insert_row()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer	li_RC
Long	ll_cur_row


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the current row from the DataWindow
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ll_cur_row = dw_1.GetRow()


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Call business object function to insert a row into the DataWindow
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
If ll_cur_row >= 0 Then
	li_RC = iuo_business_object.uf_insert_row (ll_cur_row)
	If li_RC > 0 Then
		cb_delete.Enabled = True
	End If
End If

Return li_RC


end event

event type long ue_delete_row();//====================================================================
// Event: ue_delete_row()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Call business object function to delete the current row from the DataWindow
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

dwitemstatus	le_status
Long					ll_cur_row
Integer				li_RC


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the current row number
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ll_cur_row = dw_1.GetRow()

If ll_cur_row > 0 Then
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Obtain the row status of the current row
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	le_status = dw_1.GetItemStatus (ll_cur_row, 0, primary!)
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Call user object function to delete the row
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	li_RC = iuo_business_object.uf_delete_row (0)
	
	If li_RC = 1 Then
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Disable Delete command button if there are no more rows in the DataWindow
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		If dw_1.RowCount() = 0 Then
			cb_delete.Enabled = False
		End If
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Update the instance variable indicating that data in the DataWindow
		// has changed (if the row was not a new row)
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		If le_status <> new! And le_status <> newmodified! Then
			ib_changed = True
			cb_update.Enabled = True
		End If
	End If
End If

Return li_RC


end event

event ue_create_businessobject();//====================================================================
// Event: ue_create_businessobject()
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
iuo_business_object = Create u_business_object

end event

on w_ancestor_one_dw.create
this.cb_1=create cb_1
this.cbx_1=create cbx_1
this.cb_saveas=create cb_saveas
this.cb_close=create cb_close
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.cb_update=create cb_update
this.cb_retrieve=create cb_retrieve
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.cbx_1,&
this.cb_saveas,&
this.cb_close,&
this.cb_delete,&
this.cb_insert,&
this.cb_update,&
this.cb_retrieve,&
this.dw_1}
end on

on w_ancestor_one_dw.destroy
destroy(this.cb_1)
destroy(this.cbx_1)
destroy(this.cb_saveas)
destroy(this.cb_close)
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.cb_update)
destroy(this.cb_retrieve)
destroy(this.dw_1)
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Set transaction object for the DataWindow.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_1.SetTransObject (sqlca)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Create business object instance
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
This.Event ue_create_businessobject()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Let the business object know which DataWindow to use
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
iuo_business_object.uf_init (dw_1)



end event

event close;//====================================================================
// Event: close()
//--------------------------------------------------------------------
// Description: Destroy the business class object
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_close]
//--------------------------------------------------------------------
// Author: 			Date: 2003/12/31
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Destroy iuo_business_object

end event

event closequery;//====================================================================
// Event: closequery()
//--------------------------------------------------------------------
// Description: If data in the DataWindow has been changed but not saved, prompt user to save it.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_closequery]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// If data in the DataWindow has been changed but not saved, prompt user to save it.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Int	li_rc


If ib_changed Then
	li_rc = MessageBox ("Save Data", "Save changes to employee data before closing?", question!, yesnocancel!)
	
	// Yes
	If li_rc = 1 Then
		This.TriggerEvent ("ue_update")
		If ib_changed Then
			Return 1
		End If
	Else
		// Cancel
		If li_rc = 3 Then
			Return 1
		End If
	End If
End If

end event

type cb_1 from uo_saveas within w_ancestor_one_dw
integer x = 2075
integer y = 932
integer taborder = 80
end type

event clicked;call super::clicked;of_saveas(dw_1,cbx_1.checked)  
end event

type cbx_1 from checkbox within w_ancestor_one_dw
integer x = 2117
integer y = 832
integer width = 343
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "pb"
end type

type cb_saveas from commandbutton within w_ancestor_one_dw
integer x = 2107
integer y = 624
integer width = 352
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas( )
end event

type cb_close from commandbutton within w_ancestor_one_dw
integer x = 2089
integer y = 496
integer width = 352
integer height = 100
integer taborder = 60
integer textsize = -9
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
Parent.TriggerEvent ("ue_close")

end event

type cb_delete from commandbutton within w_ancestor_one_dw
integer x = 2089
integer y = 380
integer width = 352
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Delete Row"
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
Parent.TriggerEvent ("ue_delete_row")

end event

type cb_insert from commandbutton within w_ancestor_one_dw
integer x = 2089
integer y = 264
integer width = 352
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Insert Row"
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
Parent.TriggerEvent ("ue_insert_row")

end event

type cb_update from commandbutton within w_ancestor_one_dw
integer x = 2089
integer y = 148
integer width = 352
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Update"
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
Parent.TriggerEvent ("ue_update")

end event

type cb_retrieve from commandbutton within w_ancestor_one_dw
integer x = 2089
integer y = 32
integer width = 352
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Retrieve"
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
Parent.TriggerEvent ("ue_retrieve")

end event

type dw_1 from datawindow within w_ancestor_one_dw
integer x = 41
integer y = 36
integer width = 2002
integer height = 1080
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;//====================================================================
// Event: editchanged()
//--------------------------------------------------------------------
// Description: Update instance variable indicating that data in the DataWindow has changed.
//--------------------------------------------------------------------
// Arguments: 
//		value	long    	row 		
//		value	dwobject	dwo 		
//		value	string  	data		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnchanging]
//--------------------------------------------------------------------
// Author: 			Date: 2003/12/31
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

ib_changed = True
cb_update.Enabled = True

end event

event itemchanged;//====================================================================
// Event: itemchanged()
//--------------------------------------------------------------------
// Description: Update instance variable indicating that data in the DataWindow has changed.
//--------------------------------------------------------------------
// Arguments: 
//		value	long    	row 		
//		value	dwobject	dwo 		
//		value	string  	data		
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
ib_changed = True
cb_update.Enabled = True

end event

