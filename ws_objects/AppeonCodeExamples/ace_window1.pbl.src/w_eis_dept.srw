$PBExportHeader$w_eis_dept.srw
forward
global type w_eis_dept from window
end type
type st_2 from statictext within w_eis_dept
end type
type cb_2 from commandbutton within w_eis_dept
end type
type cb_1 from commandbutton within w_eis_dept
end type
type dw_dept_list from datawindow within w_eis_dept
end type
type st_1 from statictext within w_eis_dept
end type
end forward

global type w_eis_dept from window
integer width = 1755
integer height = 1100
boolean titlebar = true
string title = "OpenWithParm and CloseWithReturn"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
cb_2 cb_2
cb_1 cb_1
dw_dept_list dw_dept_list
st_1 st_1
end type
global w_eis_dept w_eis_dept

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
Int mgrid
Int deptnum


end variables

forward prototypes
public function integer wf_refresh_dept (integer ai_dept)
end prototypes

public function integer wf_refresh_dept (integer ai_dept);//====================================================================
// Function: wf_refresh_dept()
//--------------------------------------------------------------------
// Description: retrieves the department datawindow, and selects the
//				desired row
//--------------------------------------------------------------------
// Arguments: 
//		integer	ai_dept		
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
Int	li_rc, &
	li_row, &
	li_rowcount


li_rc = dw_dept_list.Retrieve()
If li_rc = -1 Then
	Return li_rc
Else
	
	// select the row with department id = department argument (ai_dept)
	li_rowcount = dw_dept_list.RowCount()
	If li_rowcount > 0 Then
		li_row = dw_dept_list.Find ('dept_id = ' + String (ai_dept), 1, li_rowcount)
		dw_dept_list.SelectRow (0, False)
		If li_row > 0 Then
			dw_dept_list.SelectRow (li_row, True)
			dw_dept_list.ScrollToRow (li_row)
		End If
	End If
	
	Return li_rc
End If


end function

on w_eis_dept.create
this.st_2=create st_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_dept_list=create dw_dept_list
this.st_1=create st_1
this.Control[]={this.st_2,&
this.cb_2,&
this.cb_1,&
this.dw_dept_list,&
this.st_1}
end on

on w_eis_dept.destroy
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_dept_list)
destroy(this.st_1)
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
dw_dept_list.SetTransObject (SQLCA)
dw_dept_list.Retrieve()


end event

type st_2 from statictext within w_eis_dept
integer x = 46
integer y = 896
integer width = 919
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "CloseReturn Employee ID: "
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_eis_dept
integer x = 1367
integer y = 892
integer width = 325
integer height = 88
integer taborder = 30
integer textsize = -9
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
CLOSE (Parent)

end event

type cb_1 from commandbutton within w_eis_dept
integer x = 1015
integer y = 892
integer width = 325
integer height = 88
integer taborder = 20
integer textsize = -9
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
dw_dept_list.TriggerEvent(DoubleClicked!)

end event

type dw_dept_list from datawindow within w_eis_dept
integer x = 41
integer y = 104
integer width = 1646
integer height = 760
integer taborder = 10
string title = "none"
string dataobject = "d_dept"
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
// When a department is doubleclicked, pass the department number
// to the w_eis_emp window.  On the open event of the w_eis_emp
// window, the employees for the department that was doubleclicked
// will be retrieved.
//////////////////////////////////////////////////////////////////////

s_employee	lstr_info
Int			li_row, &
	li_rc,li_empid 
string ls_empid
// get clicked row number
li_row = dw_dept_list.GetRow()
If li_row > 0 Then
	
	SetPointer(HourGlass!)
	
	// deselect old row, select new row
	dw_dept_list.SelectRow (0, False)
	dw_dept_list.SelectRow (li_row, True)
	
	// pass the department number and manager id to the employees window.
	// The auto_new field specifies whether to immediately go to the 
	// employee detail window.
	lstr_info.dept_name = dw_dept_list.Object.dept_name[li_row]
	lstr_info.department = dw_dept_list.Object.dept_id[li_row]
	lstr_info.manager_id = dw_dept_list.Object.dept_head_id[li_row]
	lstr_info.auto_new = False
	OpenWithParm(w_eis_emp, lstr_info)
	li_empid = message.doubleparm
	st_2.text = LeftA(st_2.text,25) + string(li_empid) 
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

type st_1 from statictext within w_eis_dept
integer x = 46
integer y = 32
integer width = 1577
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Double-click a department to view or change employee information."
boolean focusrectangle = false
end type

