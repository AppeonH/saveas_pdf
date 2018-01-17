$PBExportHeader$w_dynsql_format2.srw
$PBExportComments$Dynamic SQL: Format 2 example
forward
global type w_dynsql_format2 from window
end type
type cb_3 from commandbutton within w_dynsql_format2
end type
type st_tip from statictext within w_dynsql_format2
end type
type cb_2 from commandbutton within w_dynsql_format2
end type
type cb_1 from commandbutton within w_dynsql_format2
end type
type st_1 from statictext within w_dynsql_format2
end type
type cbx_life from checkbox within w_dynsql_format2
end type
type cbx_health from checkbox within w_dynsql_format2
end type
type dw_manager from datawindow within w_dynsql_format2
end type
type dw_emp from datawindow within w_dynsql_format2
end type
type dw_dept from datawindow within w_dynsql_format2
end type
type gb_1 from groupbox within w_dynsql_format2
end type
end forward

global type w_dynsql_format2 from window
integer x = 247
integer y = 308
integer width = 2455
integer height = 1232
boolean titlebar = true
string title = "Dynamic SQL Format 2"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_execute pbm_custom01
event ue_open pbm_custom02
cb_3 cb_3
st_tip st_tip
cb_2 cb_2
cb_1 cb_1
st_1 st_1
cbx_life cbx_life
cbx_health cbx_health
dw_manager dw_manager
dw_emp dw_emp
dw_dept dw_dept
gb_1 gb_1
end type
global w_dynsql_format2 w_dynsql_format2

type variables

end variables

event ue_execute;//====================================================================
// Event: ue_execute()
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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Update the database using Format 2 of Dynamic SQL
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

String	ls_sql
Int		li_manager_id, &
	li_dept_id
window	lw_frame


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain input parameter for dynamic SQL statement
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_dept.AcceptText()
li_dept_id = dw_dept.Object.dept_id[1]
If IsNull (li_dept_id) Then
	MessageBox ("", "Please select a department first")
	Return
End If


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Build update syntax from the columns that were selected to be updated
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ls_sql = "update employee set "

// Manager ID
dw_manager.AcceptText()
li_manager_id = dw_manager.Object.manager_id[1]
If Not IsNull (li_manager_id) Then
	ls_sql = ls_sql + "manager_id = " + String (li_manager_id) + ", "
End If

// Health Insurance
If cbx_health.Checked Then
	ls_sql = ls_sql + "bene_health_ins = 'Y', "
Else
	ls_sql = ls_sql + "bene_health_ins = 'N', "
End If

// Life Insurance
If cbx_life.Checked Then
	ls_sql = ls_sql + "bene_life_ins = 'Y', "
Else
	ls_sql = ls_sql + "bene_life_ins = 'N', "
End If

// Strip off the unnecessary comma
ls_sql = LeftA (ls_sql, LenA (ls_sql) - 2)

// Add "where" clause for department that was chosen
ls_sql = ls_sql + " where dept_id = ?"


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Show the dynamic SQL statement in the st_tip.text
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
st_tip.Text = "Dynamic SQL Statement:  " + ls_sql



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Prepare and execute the SQL statement
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
PREPARE SQLSA From :ls_sql;
EXECUTE SQLSA Using :li_dept_id;

If sqlca.SQLCode = -1 Then
	MessageBox ("Error", String (sqlca.SQLDBCode) + ":  " + sqlca.SQLErrText)
End If


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Re-retrieve the employee DataWindow so changes made to the database are shown
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_emp.Retrieve (li_dept_id)

end event

event ue_open;//====================================================================
// Event: ue_open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		unsignedlong	wparam		
//		long        	lparam		
//--------------------------------------------------------------------
// Returns: long [pbm_custom02]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

DataWindowChild	ldw_dept, &
	ldw_manager


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain handles to child DataWindows
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_dept.GetChild ("dept_id", ldw_dept)
dw_manager.GetChild ("manager_id", ldw_manager)


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Set transaction objects
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_emp.SetTransObject (sqlca)
ldw_dept.SetTransObject (sqlca)
ldw_manager.SetTransObject (sqlca)


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retreive child DataWindows
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ldw_dept.Retrieve()
ldw_manager.Retrieve()

dw_dept.InsertRow(0)
dw_manager.InsertRow(0)




end event

on w_dynsql_format2.create
this.cb_3=create cb_3
this.st_tip=create st_tip
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.cbx_life=create cbx_life
this.cbx_health=create cbx_health
this.dw_manager=create dw_manager
this.dw_emp=create dw_emp
this.dw_dept=create dw_dept
this.gb_1=create gb_1
this.Control[]={this.cb_3,&
this.st_tip,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.cbx_life,&
this.cbx_health,&
this.dw_manager,&
this.dw_emp,&
this.dw_dept,&
this.gb_1}
end on

on w_dynsql_format2.destroy
destroy(this.cb_3)
destroy(this.st_tip)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cbx_life)
destroy(this.cbx_health)
destroy(this.dw_manager)
destroy(this.dw_emp)
destroy(this.dw_dept)
destroy(this.gb_1)
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

This.PostEvent ("ue_open")

end event

type cb_3 from commandbutton within w_dynsql_format2
integer x = 1408
integer y = 32
integer width = 347
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_emp.saveas( )
end event

type st_tip from statictext within w_dynsql_format2
integer x = 55
integer y = 964
integer width = 2318
integer height = 144
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_dynsql_format2
integer x = 1938
integer y = 852
integer width = 439
integer height = 96
integer taborder = 60
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
CLOSE(Parent)

end event

type cb_1 from commandbutton within w_dynsql_format2
integer x = 1938
integer y = 720
integer width = 439
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Execute"
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
Parent.TriggerEvent("ue_execute")

end event

type st_1 from statictext within w_dynsql_format2
integer x = 64
integer y = 48
integer width = 288
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Department:"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type cbx_life from checkbox within w_dynsql_format2
integer x = 1129
integer y = 820
integer width = 453
integer height = 72
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Life Insurance"
end type

type cbx_health from checkbox within w_dynsql_format2
integer x = 1129
integer y = 724
integer width = 521
integer height = 72
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Health Insurance"
end type

type dw_manager from datawindow within w_dynsql_format2
integer x = 91
integer y = 724
integer width = 987
integer height = 140
integer taborder = 40
string dataobject = "d_choose_manager"
boolean border = false
end type

type dw_emp from datawindow within w_dynsql_format2
integer x = 55
integer y = 144
integer width = 2322
integer height = 472
integer taborder = 20
string dataobject = "d_employee_dept_listing"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_dept from datawindow within w_dynsql_format2
integer x = 347
integer y = 32
integer width = 887
integer height = 120
integer taborder = 10
string dataobject = "d_choose_department"
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// When a department is selected, retrieve the employees for that department
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

String	ls_dept_id
Int		li_null
SetNull (li_null)


ls_dept_id = This.GetText()
dw_emp.Retrieve (Integer (ls_dept_id))

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Clear out the manager name and insurance benefits from the update group
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_manager.Object.manager_id[1] = li_null

cbx_health.Checked = False
cbx_life.Checked = False


end event

type gb_1 from groupbox within w_dynsql_format2
integer x = 55
integer y = 636
integer width = 1797
integer height = 312
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Update all Employees"
end type

