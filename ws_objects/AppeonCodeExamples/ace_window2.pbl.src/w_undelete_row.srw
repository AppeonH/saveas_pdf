$PBExportHeader$w_undelete_row.srw
$PBExportComments$An example of undeleting a DataWindow row using the dwRowsMove function.
forward
global type w_undelete_row from window
end type
type cb_1 from commandbutton within w_undelete_row
end type
type cb_undelete from commandbutton within w_undelete_row
end type
type cb_close from commandbutton within w_undelete_row
end type
type cb_delete from commandbutton within w_undelete_row
end type
type cb_retrieve from commandbutton within w_undelete_row
end type
type cb_apply from commandbutton within w_undelete_row
end type
type dw_1 from datawindow within w_undelete_row
end type
end forward

global type w_undelete_row from window
integer x = 32
integer y = 116
integer width = 2642
integer height = 1296
boolean titlebar = true
string title = "Undelete a Row"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
cb_undelete cb_undelete
cb_close cb_close
cb_delete cb_delete
cb_retrieve cb_retrieve
cb_apply cb_apply
dw_1 dw_1
end type
global w_undelete_row w_undelete_row

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long   il_row_deleted
end variables

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: open script for w_dw_functions
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y = 0
dw_1.SetTransObject(sqlca)

end event

on w_undelete_row.create
this.cb_1=create cb_1
this.cb_undelete=create cb_undelete
this.cb_close=create cb_close
this.cb_delete=create cb_delete
this.cb_retrieve=create cb_retrieve
this.cb_apply=create cb_apply
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.cb_undelete,&
this.cb_close,&
this.cb_delete,&
this.cb_retrieve,&
this.cb_apply,&
this.dw_1}
end on

on w_undelete_row.destroy
destroy(this.cb_1)
destroy(this.cb_undelete)
destroy(this.cb_close)
destroy(this.cb_delete)
destroy(this.cb_retrieve)
destroy(this.cb_apply)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_undelete_row
integer x = 2176
integer y = 496
integer width = 421
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas()
end event

type cb_undelete from commandbutton within w_undelete_row
integer x = 2176
integer y = 368
integer width = 421
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Undelete Row"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description:    "Undelete" the last row that was deleted from the DataWindow by using the RowsMove
//                 function to move the last row in the deleted buffer back to the primary buffer.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long	ll_row

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Get the last row in the deleted buffer
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ll_row = dw_1.DeletedCount()


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Move the last row in the deleted buffer to the primary buffer
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if dw_1.RowsMove(ll_row, ll_row, delete!, dw_1, il_row_deleted, primary!) = -1 then
	MessageBox("Error", "Failed to undo delete.", exclamation!)
else
	// Set focus to the row that was "restored"
	dw_1.SetFocus()
	dw_1.ScrollToRow(il_row_deleted)
	dw_1.SetColumn(1)
	dw_1.selectrow(0,FALSE)
	dw_1.selectrow(il_Row_deleted,TRUE)
end if

// Disable UnDelete Row button until another row is deleted
this.enabled = false

end event

type cb_close from commandbutton within w_undelete_row
integer x = 2176
integer y = 1068
integer width = 421
integer height = 96
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
// Description: Close the window
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Close (parent)
end event

type cb_delete from commandbutton within w_undelete_row
integer x = 2176
integer y = 252
integer width = 421
integer height = 96
integer taborder = 40
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
// Description:  Delete the current row from the DataWindow
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long	ll_row

if dw_1.AcceptText() = -1 then
	return
end if

il_row_deleted = dw_1.GetRow()
dw_1.DeleteRow(il_row_deleted)

// Enable the UnDelete Row button
cb_undelete.enabled = true

// Set focus to the current row
dw_1.SetFocus()
ll_row = dw_1.GetRow()
dw_1.ScrollToRow(ll_row)
dw_1.SetColumn(1)

dw_1.selectrow(dw_1.getrow(),TRUE)


end event

type cb_retrieve from commandbutton within w_undelete_row
integer x = 2176
integer y = 24
integer width = 421
integer height = 96
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
// Description: Retrieve the datawindow & select the current row in the datawindow
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if dw_1.Retrieve() = -1 then
	return
end if

dw_1.SetFocus()
dw_1.ScrollToRow(1)
dw_1.SetColumn(1)

end event

type cb_apply from commandbutton within w_undelete_row
integer x = 2176
integer y = 136
integer width = 421
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Update the datawindow
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if dw_1.Update() = -1 then
	rollback;
else
	commit;
end if

end event

type dw_1 from datawindow within w_undelete_row
integer x = 23
integer y = 28
integer width = 2121
integer height = 1136
integer taborder = 10
string dataobject = "d_contact_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;//====================================================================
// Event: retrieveend()
//--------------------------------------------------------------------
// Description: Enable command buttons after retrieval of datawindow
//--------------------------------------------------------------------
// Arguments: 
//		value	long	rowcount		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnretrieveend]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

cb_apply.enabled = true
cb_delete.enabled = true
cb_retrieve.enabled = true
end event

event retrievestart;//====================================================================
// Event: retrievestart()
//--------------------------------------------------------------------
// Description: Disable command buttons
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnretrievestart]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

cb_retrieve.enabled = false
cb_apply.enabled = false
cb_delete.enabled = false
cb_undelete.enabled = false


end event

event rowfocuschanged;//====================================================================
// Event: rowfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	long	currentrow		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrowchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

IF currentrow > 0 THEN
	this.selectrow(0,FALSE)
	this.selectrow(currentrow,TRUE)
END IF

end event

