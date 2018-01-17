$PBExportHeader$w_eis_emp.srw
forward
global type w_eis_emp from window
end type
type cb_close from commandbutton within w_eis_emp
end type
type cb_new from commandbutton within w_eis_emp
end type
type cb_ok from commandbutton within w_eis_emp
end type
type dw_emp_list from datawindow within w_eis_emp
end type
type st_1 from statictext within w_eis_emp
end type
end forward

global type w_eis_emp from window
integer width = 1577
integer height = 1132
boolean titlebar = true
string title = "Employees for department"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_close cb_close
cb_new cb_new
cb_ok cb_ok
dw_emp_list dw_emp_list
st_1 st_1
end type
global w_eis_emp w_eis_emp

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: structure which holds the department, manager id, 
// and employee id
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
s_employee    istr_info


end variables

forward prototypes
public function integer wf_refresh_emp (integer ai_dept, integer ai_emp)
end prototypes

public function integer wf_refresh_emp (integer ai_dept, integer ai_emp);//====================================================================
// Function: wf_refresh_emp()
//--------------------------------------------------------------------
// Description: retrieves the employees datawindow, 
//				selects the desired employee id,
//				changes the title of the window to match department argument
//
//--------------------------------------------------------------------
// Arguments: 
//		integer	ai_dept		
//		integer	ai_emp 		
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

Int		li_rc, &
	li_row, &
	li_rowcount
String	ls_dept_name


li_rc = dw_emp_list.Retrieve (ai_dept)

If li_rc = -1 Then
	Return li_rc
Else
	// select the department name and
	// change the window title to match the department name argument
	
	//	select department.dept_name
	//	into :ls_dept_name
	//	from department
	//	where dept_id = :ai_dept;
	//
	//this.title = 'Employees for department ' + ls_dept_name
	
	
	// select the employee 
	li_rowcount = dw_emp_list.RowCount()
	If li_rowcount > 0 Then
		li_row = dw_emp_list.Find ('emp_id = ' + String (ai_emp), 1, li_rowcount)
		dw_emp_list.SelectRow (0, False)
		If li_row > 0 Then
			dw_emp_list.SelectRow (li_row, True)
			dw_emp_list.ScrollToRow (li_row)
		End If
	End If
	
	Return li_rc
End If


end function

on w_eis_emp.create
this.cb_close=create cb_close
this.cb_new=create cb_new
this.cb_ok=create cb_ok
this.dw_emp_list=create dw_emp_list
this.st_1=create st_1
this.Control[]={this.cb_close,&
this.cb_new,&
this.cb_ok,&
this.dw_emp_list,&
this.st_1}
end on

on w_eis_emp.destroy
destroy(this.cb_close)
destroy(this.cb_new)
destroy(this.cb_ok)
destroy(this.dw_emp_list)
destroy(this.st_1)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Get the department number and manager id from the message object
// and retrieve the employees for department.
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

Int	li_rc

dw_emp_list.SetTransObject (SQLCA)

istr_info = Message.PowerObjectParm


// update the title of this window with the department name
//this.title = this.title + istr_info.dept_name + ' department'


// if the auto_new field is true, then the user wants to enter a new
// employee without having to click the 'New Employee' button.
If istr_info.auto_new Then
	cb_new.PostEvent (Clicked!)
Else
	li_rc = dw_emp_list.Retrieve (istr_info.department)
End If



end event

type cb_close from commandbutton within w_eis_emp
integer x = 1120
integer y = 896
integer width = 389
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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

// close the window and pass 1 to the parent window
// In the parent window, if a 1 is returned, no errors occured.

long ll_row,ll_empid

ll_row = dw_emp_list.getrow()
ll_empid = dw_emp_list.getitemnumber(ll_row,'emp_id')
CloseWithReturn (Parent, ll_empid)

end event

type cb_new from commandbutton within w_eis_emp
integer x = 690
integer y = 896
integer width = 389
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "New Employee"
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
// open the employee detail window, passing a 0 for employee id
// to signify a new employee to the detail window.
//////////////////////////////////////////////////////////////////////

istr_info.employee_id = 0
OpenWithParm (w_empl_detail, istr_info)



end event

type cb_ok from commandbutton within w_eis_emp
integer x = 256
integer y = 896
integer width = 389
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Open"
boolean default = true
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
dw_emp_list.TriggerEvent (DoubleClicked!)

end event

type dw_emp_list from datawindow within w_eis_emp
integer x = 50
integer y = 96
integer width = 1458
integer height = 756
integer taborder = 10
string title = "none"
string dataobject = "d_emplist"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer 	xpos		
//		integer 	ypos		
//		long    	row 		
//		dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnlbuttondblclk]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//////////////////////////////////////////////////////////////////////
// When an employee is doubleclicked, pass the employee id
// to the employee detail window.
//////////////////////////////////////////////////////////////////////

Int			li_row

// get clicked row number
li_row = dw_emp_list.GetRow()
If li_row > 0 Then
	
	SetPointer(HourGlass!)
	
	// deselect old row, select new row
	dw_emp_list.SelectRow (0, False)
	dw_emp_list.SelectRow (li_row, True)
	
	// pass the employee id to the employee detail window
	istr_info.employee_id = dw_emp_list.Object.emp_id[li_row]
	istr_info.department = dw_emp_list.Object.dept_id[li_row]
	istr_info.manager_id = dw_emp_list.Object.manager_id[li_row]
	OpenWithParm (w_empl_detail, istr_info)
	
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
f_select_current_row (This)

end event

type st_1 from statictext within w_eis_emp
integer x = 50
integer y = 28
integer width = 1303
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Double-click an employee or enter a new employee."
boolean focusrectangle = false
end type

