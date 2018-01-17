$PBExportHeader$u_employee_object.sru
$PBExportComments$Employee class
forward
global type u_employee_object from u_business_object
end type
end forward

global type u_employee_object from u_business_object
end type
global u_employee_object u_employee_object

forward prototypes
public function long uf_insert_row (long al_row)
public function integer uf_delete_row (long al_row)
end prototypes

public function long uf_insert_row (long al_row);//====================================================================
// Function: uf_insert_row()
//--------------------------------------------------------------------
// Description: Inserts a new row into the DataWindow.  If al_row = 0, the new row will be inserted
//		     after the last row.  Otherwise, the new row will be inserted prior to the value of al_row.
//		     New employees must be confirmed before they are added.
//
//--------------------------------------------------------------------
// Arguments: 
//		value	long	al_row		
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
If MessageBox ("New Employee", "Are you sure you want to add a new employee?", question!, yesno!) = 1 Then
	Return Super::uf_insert_row (al_row)
End If
Return 0


end function

public function integer uf_delete_row (long al_row);//====================================================================
// Function: uf_delete_row()
//--------------------------------------------------------------------
// Description: Deletes the row specified from the DataWindow.  If al_row = 0, the current row
//	will be deleted.Confirm before deleting.
//	Employees with active status cannot be deleted.
//
//--------------------------------------------------------------------
// Arguments: 
//		value	long	al_row		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Int				li_rc
String			ls_status
String			ls_last_name, ls_first_name
dwitemstatus	le_status


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the current row number, if necessary
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
If al_row = 0 Then
	al_row = idw_parm.GetRow()
	If al_row <= 0 Then
		Return -1
	End If
End If


If al_row > 0 And al_row <= idw_parm.RowCount() Then
	
	le_status = idw_parm.GetItemStatus (al_row, 0, primary!)
	If le_status <> new! And le_status <> newmodified! Then
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Confirm before deleting.
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ls_last_name = idw_parm.GetItemString (al_row, "emp_lname")
		ls_first_name = idw_parm.GetItemString (al_row, "emp_fname")
		If MessageBox ("Confirm Delete", "Delete " + ls_first_name + 	" " + ls_last_name + "?", question!, yesno!) = 2 Then
			Return 0
		End If
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		// Check employee status before deleting.
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ls_status = idw_parm.GetItemString (al_row, "status")
		If Upper (ls_status) = "A" Then
			Return -2
		End If
		
	End If
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Delete row
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	li_rc = idw_parm.DeleteRow (al_row)
	idw_parm.SetFocus()
	Return li_rc
Else
	Return -1
End If


end function

on u_employee_object.create
call super::create
end on

on u_employee_object.destroy
call super::destroy
end on

