$PBExportHeader$w_empl_detail.srw
forward
global type w_empl_detail from window
end type
type cb_apply from commandbutton within w_empl_detail
end type
type cb_delete from commandbutton within w_empl_detail
end type
type cb_cancel from commandbutton within w_empl_detail
end type
type dw_empl from datawindow within w_empl_detail
end type
end forward

global type w_empl_detail from window
integer width = 2478
integer height = 1680
boolean titlebar = true
string title = "Employee Details"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_apply cb_apply
cb_delete cb_delete
cb_cancel cb_cancel
dw_empl dw_empl
end type
global w_empl_detail w_empl_detail

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
s_employee   istr_info

Integer   ii_dept

end variables

forward prototypes
public function integer wf_update (boolean ab_accept)
end prototypes

public function integer wf_update (boolean ab_accept);//====================================================================
// Function: wf_update()
//--------------------------------------------------------------------
// Description: updates the employee detail datawindow and 'refreshes'
//				the department and employee lists
//--------------------------------------------------------------------
// Arguments: 
//		boolean	ab_accept		
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

Integer	li_dept
Long		li_emp


// perform accepttext if ab_accept argument is true
If ab_accept Then
	If dw_empl.AcceptText() = -1 Then
		Return -2
	End If
End If

// Employee deletion
If dw_empl.RowCount() > 0 Then
	// obtain data from primary buffer
	li_dept = dw_empl.Object.dept_id[1]
	li_emp  = dw_empl.Object.emp_id[1]
Else
	// obtain information from the delete buffer
	li_dept = dw_empl.Object.dept_id.DELETE.current[1]
	li_emp  = dw_empl.Object.emp_id.DELETE.current[1]
End If

If dw_empl.UPDATE (False) = 1 Then
	COMMIT;
Else
	ROLLBACK;
	Return -1
End If


//////////////////////////////////////////////////////////////////////
// if update was successful, refresh the department and employee
// datawindows on the parent windows.
//////////////////////////////////////////////////////////////////////
//w_eis_dept.wf_refresh_dept(li_dept)
w_eis_emp.wf_refresh_emp(li_dept, li_emp)

Return 1


end function

on w_empl_detail.create
this.cb_apply=create cb_apply
this.cb_delete=create cb_delete
this.cb_cancel=create cb_cancel
this.dw_empl=create dw_empl
this.Control[]={this.cb_apply,&
this.cb_delete,&
this.cb_cancel,&
this.dw_empl}
end on

on w_empl_detail.destroy
destroy(this.cb_apply)
destroy(this.cb_delete)
destroy(this.cb_cancel)
destroy(this.dw_empl)
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

//////////////////////////////////////////////////////////////////////
// get values from the message object
//////////////////////////////////////////////////////////////////////
istr_info = Message.PowerObjectParm

dw_empl.SetTransObject (sqlca)

//////////////////////////////////////////////////////////////////////
// if this window is being called from another example, check to see
// if we want to disallow the updating capabilities
//////////////////////////////////////////////////////////////////////
If istr_info.no_edit Then
	cb_delete.Enabled = False
End If
//////////////////////////////////////////////////////////////////////
// if employee id is zero, insert a row in the datawindow for a new
// employee.  If not, then retrieve the employee.
//////////////////////////////////////////////////////////////////////
If istr_info.employee_id = 0 Then
	
	dw_empl.DataObject = "d_empl_f_arg_new"
	dw_empl.SetTransObject(sqlca)
	
	cb_delete.Enabled = False
	cb_apply.Enabled = True
	
	dw_empl.InsertRow (0)
	
	dw_empl.Object.dept_id[1] = istr_info.department
	dw_empl.Object.manager_id[1] = istr_info.manager_id
Else
	If	dw_empl.Retrieve (istr_info.employee_id) <= 0 Then
		CLOSE (This)
		Return
	Else
		String ls_emp_fname, ls_emp_lname
		ls_emp_lname = dw_empl.Object.emp_lname[1]
		ls_emp_fname = dw_empl.Object.emp_fname[1]
	End If
End If


end event

event closequery;//====================================================================
// Event: closequery()
//--------------------------------------------------------------------
// Description: Check to see if changes were made and provide ability to update
// before closing the details window
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_closequery]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dwItemStatus	l_mod
// Check the rowcount first, if employee has been deleted then the
// row count will be zero.

If dw_empl.RowCount() > 0 Then
	l_mod = dw_empl.GetItemStatus (1, 0, primary!)
	If l_mod = DataModified! Or l_mod = NewModified! Then
		
		If MessageBox ('Employee Details', 'Apply changes before closing?', &
			question!, YesNo!) = 1 Then
			
			// if return value from wf_update is -2, then accepttext failed.
			// Do not close the window at this point if accepttext fails.
			If wf_update (True) = -2 Then
				Return  1
			End If
			
		End If
	End If
End If



end event

type cb_apply from commandbutton within w_empl_detail
integer x = 974
integer y = 1476
integer width = 453
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Apply Changes"
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

//////////////////////////////////////////////////////////////////////
//
// update the database with the changes to employee detail datawindow
//
//////////////////////////////////////////////////////////////////////


// call the window function wf_update with a true argument passed
// to specify that accepttext is to be performed.  The wf_update
// function will refresh the department and employee lists on the
// parent windows after updating the employee details datawindow.
wf_update (True)








end event

type cb_delete from commandbutton within w_empl_detail
integer x = 1467
integer y = 1476
integer width = 453
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Employee"
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

//////////////////////////////////////////////////////////////////////
// Delete the employee from the database
//////////////////////////////////////////////////////////////////////

String	ls_emp_fname, ls_emp_lname
String	ls_empname

ls_emp_fname = dw_empl.Object.emp_fname[1]
ls_emp_lname = dw_empl.Object.emp_lname[1]
ls_empname = ls_emp_fname + ' ' + ls_emp_lname

// Ask if it's ok to delete
If MessageBox ('Confirm Delete', 'Are you sure you want to delete employee ' + &
	ls_empname + '?', question!, YesNo!) = 1 Then
	dw_empl.DeleteRow (0)
	wf_update (False)
	If dw_empl.UPDATE () = 1 Then
		COMMIT;
	Else
		ROLLBACK;
		Return -1
	End If
	CLOSE (Parent)
End If


end event

type cb_cancel from commandbutton within w_empl_detail
integer x = 1961
integer y = 1476
integer width = 453
integer height = 96
integer taborder = 20
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
CLOSE(Parent)

end event

type dw_empl from datawindow within w_empl_detail
integer x = 37
integer y = 28
integer width = 2377
integer height = 1420
integer taborder = 10
string title = "none"
string dataobject = "d_empl_f_arg"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;//====================================================================
// Event: editchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row 		
//		dwobject	dwo 		
//		string  	data		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnchanging]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
cb_apply.Enabled = True

end event

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

//////////////////////////////////////////////////////////////////////
//
// If employee status changes to terminated, unprotect terminated date.
// If department id changes, manager id will change to correct value.
//
//////////////////////////////////////////////////////////////////////

String	ls_white, &
	ls_gray, &
	ls_tab
Integer	li_manager_id, &
	li_dept

//////////////////////////////////////////////////////////////////////
// get the white and gray RGB values to be used in Modify expressions
//////////////////////////////////////////////////////////////////////
ls_white = String (RGB (255, 255, 255))
ls_gray = String (RGB (192, 192, 192))


//////////////////////////////////////////////////////////////////////
// enable the apply button when data is changed on the datawindow
//////////////////////////////////////////////////////////////////////
cb_apply.Enabled = True


Choose Case This.GetColumnName()
	Case 'emp_status'
		If This.GetText() = 'T' Then
			dw_empl.Object.terminated_date.background.Color = 16777215 //ls_white 
			dw_empl.Object.terminated_date.tabsequence = '135'
		Else
			ls_tab = dw_empl.Object.terminated_date.tabsequence
			If ls_tab <> '0' Then
				dw_empl.Object.terminated_date.background.Color = 67108864 //ls_gray
				dw_empl.Object.terminated_date.tabsequence = '0'
			End If
		End If
		
		
	Case 'dept_id'
		// get the department
		If IsNumber (This.GetText()) Then
			li_dept = Integer (This.GetText())
			
			SELECT department.dept_head_id
				INTO :li_manager_id
				FROM department
				Where dept_id = :li_dept;
				
			// error handling
			If SQLCA.SQLCode = -1 Then
				MessageBox ('Error', SQLCA.SQLErrText)
			End If
			
			This.Object.manager_id[1] = li_manager_id
		End If
		
End Choose


end event

