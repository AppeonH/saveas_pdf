$PBExportHeader$w_dw_functions.srw
$PBExportComments$Shows common datawindow functions of Update, InsertRow, and DeleteRow.  Also shows RowCount functions.
forward
global type w_dw_functions from window
end type
type cb_3 from commandbutton within w_dw_functions
end type
type cb_2 from commandbutton within w_dw_functions
end type
type cb_1 from commandbutton within w_dw_functions
end type
type cb_close from commandbutton within w_dw_functions
end type
type cb_reset_mod from commandbutton within w_dw_functions
end type
type cb_display_mod from commandbutton within w_dw_functions
end type
type cb_delete from commandbutton within w_dw_functions
end type
type cb_retrieve from commandbutton within w_dw_functions
end type
type cb_new from commandbutton within w_dw_functions
end type
type cb_apply from commandbutton within w_dw_functions
end type
type dw_cust from datawindow within w_dw_functions
end type
type st_4 from statictext within w_dw_functions
end type
type st_3 from statictext within w_dw_functions
end type
type st_2 from statictext within w_dw_functions
end type
type st_displayed from statictext within w_dw_functions
end type
type st_modified from statictext within w_dw_functions
end type
type st_deleted from statictext within w_dw_functions
end type
type gb_1 from groupbox within w_dw_functions
end type
end forward

global type w_dw_functions from window
integer y = 24
integer width = 3031
integer height = 1708
boolean titlebar = true
string title = "DataWindow Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_close cb_close
cb_reset_mod cb_reset_mod
cb_display_mod cb_display_mod
cb_delete cb_delete
cb_retrieve cb_retrieve
cb_new cb_new
cb_apply cb_apply
dw_cust dw_cust
st_4 st_4
st_3 st_3
st_2 st_2
st_displayed st_displayed
st_modified st_modified
st_deleted st_deleted
gb_1 gb_1
end type
global w_dw_functions w_dw_functions

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
Boolean cancel_retrieval

end variables

forward prototypes
protected subroutine wf_set_counts ()
end prototypes

protected subroutine wf_set_counts ();//====================================================================
// Function: wf_set_counts()
//--------------------------------------------------------------------
// Description: set the displayed row counts (rowcount, modified count,
//				deleted count) of dw_cust
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

st_displayed.Text = String (dw_cust.RowCount())
st_deleted.Text   = String (dw_cust.DeletedCount())
st_modified.Text  = String (dw_cust.ModifiedCount())

end subroutine

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: open script for w_dw_functions
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

This.X = 0
This.Y = 0

dw_cust.SetTransObject (sqlca)


end event

on w_dw_functions.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_close=create cb_close
this.cb_reset_mod=create cb_reset_mod
this.cb_display_mod=create cb_display_mod
this.cb_delete=create cb_delete
this.cb_retrieve=create cb_retrieve
this.cb_new=create cb_new
this.cb_apply=create cb_apply
this.dw_cust=create dw_cust
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_displayed=create st_displayed
this.st_modified=create st_modified
this.st_deleted=create st_deleted
this.gb_1=create gb_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_close,&
this.cb_reset_mod,&
this.cb_display_mod,&
this.cb_delete,&
this.cb_retrieve,&
this.cb_new,&
this.cb_apply,&
this.dw_cust,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_displayed,&
this.st_modified,&
this.st_deleted,&
this.gb_1}
end on

on w_dw_functions.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.cb_reset_mod)
destroy(this.cb_display_mod)
destroy(this.cb_delete)
destroy(this.cb_retrieve)
destroy(this.cb_new)
destroy(this.cb_apply)
destroy(this.dw_cust)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_displayed)
destroy(this.st_modified)
destroy(this.st_deleted)
destroy(this.gb_1)
end on

type cb_3 from commandbutton within w_dw_functions
integer x = 2510
integer y = 1252
integer width = 434
integer height = 108
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_cust.saveas( )
end event

type cb_2 from commandbutton within w_dw_functions
integer x = 2510
integer y = 1124
integer width = 434
integer height = 108
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get Row From ID"
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
Long ll_id
ll_id = dw_cust.GetRowIDfromrow(dw_cust.GetRow())
MessageBox("Appeon Code Examples","Row Number : "+String(dw_cust.GetRowFromRowID(ll_id)))

end event

type cb_1 from commandbutton within w_dw_functions
integer x = 2510
integer y = 1000
integer width = 434
integer height = 108
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get ID From Row"
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
MessageBox("Appeon Code Examples","Row ID : "+String(dw_cust.GetRowIDFromRow(dw_cust.GetRow())))

end event

type cb_close from commandbutton within w_dw_functions
integer x = 2505
integer y = 1452
integer width = 434
integer height = 108
integer taborder = 90
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

CLOSE (Parent)

end event

type cb_reset_mod from commandbutton within w_dw_functions
integer x = 2510
integer y = 876
integer width = 434
integer height = 108
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset Modified"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Reset the modified count on dw_cust
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

// ResetUpdate resets all modified flags; subsequently calling the
// function wf_set_counts refreshes all displayed row counts. At
// this point 'rows modified' should be 0.

dw_cust.ResetUpdate()
wf_set_counts()

// Select the current row of dw_cust
f_select_current_row (dw_cust)

end event

type cb_display_mod from commandbutton within w_dw_functions
integer x = 2510
integer y = 752
integer width = 434
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select Modified"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Select (highlight) all rows that have been modified
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

Long 	ll_row

If dw_cust.AcceptText() = -1 Then
	Return
End If

// Deselect everything
dw_cust.SelectRow (0, False)

// Loop thru all modified rows and select them
Do
	ll_row = dw_cust.GetNextModified (ll_row, primary!)
	If ll_row > 0 Then
		dw_cust.SelectRow (ll_row, True)
	End If
Loop Until ll_row < 1


end event

type cb_delete from commandbutton within w_dw_functions
integer x = 2510
integer y = 624
integer width = 434
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Row"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Delete the current row from dw_cust
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
dw_cust.DeleteRow (0)
wf_set_counts()

// Highlight the new current row
dw_cust.TriggerEvent (RowFocusChanged!)

end event

type cb_retrieve from commandbutton within w_dw_functions
integer x = 2510
integer y = 252
integer width = 434
integer height = 108
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
// Description: Retrieve the dw_cust datawindow
//				 Select the current row in the datawindow
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

If dw_cust.Retrieve() = -1 Then
	Return
End If

f_select_current_row (dw_cust)


end event

type cb_new from commandbutton within w_dw_functions
integer x = 2510
integer y = 500
integer width = 434
integer height = 108
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
// Description: insert a new row in dw_cust
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

Int	li_row, &
	li_cur_row


// Get the current and row
li_cur_row = dw_cust.GetRow()

// Insert new row prior to current row
li_row = dw_cust.InsertRow (li_cur_row)
dw_cust.ScrollToRow (li_row)
dw_cust.SetColumn ('id')

// update the displayed row counts of dw_cust
wf_set_counts()

end event

type cb_apply from commandbutton within w_dw_functions
integer x = 2510
integer y = 376
integer width = 434
integer height = 108
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

/////////////////////////////////////////////////////////////////////
// Purpose: Update dw_cust datawindow and reset the row counts
/////////////////////////////////////////////////////////////////////

If dw_cust.UPDATE() = -1 Then
	ROLLBACK;
Else
	COMMIT;
End If
wf_set_counts()

end event

type dw_cust from datawindow within w_dw_functions
integer x = 37
integer y = 252
integer width = 2432
integer height = 1308
integer taborder = 10
string dataobject = "d_cust"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable command buttons after retrieval of datawindow
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

cb_apply.enabled = true
cb_delete.enabled = true
cb_display_mod.enabled = true
cb_new.enabled = true
cb_reset_mod.enabled = true

st_displayed.text = String (dw_cust.RowCount())
end event

on rowfocuschanged;f_select_current_row (this)
end on

event itemfocuschanged;//====================================================================
// Event: itemfocuschanged()
//--------------------------------------------------------------------
// Description: Update the row counts of the dw_cust datawindow.
//				 The row counts will change when a row has been modified
//				 or deleted.
//--------------------------------------------------------------------
// Arguments: 
//		long    	row		
//		dwobject	dwo		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchangefocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

wf_set_counts ()

end event

event retrievestart;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Reset the displayed row counts to zero.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
st_displayed.text = '0'
st_deleted.text   = '0'
st_modified.text  = '0'

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Disable command buttons
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
cb_apply.enabled = false
cb_delete.enabled = false
cb_display_mod.enabled = false
cb_new.enabled = false
cb_reset_mod.enabled = false


end event

type st_4 from statictext within w_dw_functions
integer x = 1815
integer y = 76
integer width = 384
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Rows Deleted:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_dw_functions
integer x = 946
integer y = 76
integer width = 407
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Rows Modified:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_dw_functions
integer x = 96
integer y = 76
integer width = 389
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Rows Displayed:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_displayed from statictext within w_dw_functions
integer x = 507
integer y = 76
integer width = 357
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_modified from statictext within w_dw_functions
integer x = 1371
integer y = 76
integer width = 357
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_deleted from statictext within w_dw_functions
integer x = 2245
integer y = 76
integer width = 357
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_dw_functions
integer x = 37
integer width = 2903
integer height = 208
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
end type

