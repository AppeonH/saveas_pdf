$PBExportHeader$w_employee_resume.srw
$PBExportComments$Employee resume
forward
global type w_employee_resume from window
end type
type cb_7 from commandbutton within w_employee_resume
end type
type cb_6 from commandbutton within w_employee_resume
end type
type cb_5 from commandbutton within w_employee_resume
end type
type st_1 from statictext within w_employee_resume
end type
type cb_4 from commandbutton within w_employee_resume
end type
type cb_3 from commandbutton within w_employee_resume
end type
type cb_2 from commandbutton within w_employee_resume
end type
type cb_1 from commandbutton within w_employee_resume
end type
type cb_close from commandbutton within w_employee_resume
end type
type cb_delete from commandbutton within w_employee_resume
end type
type cb_insert from commandbutton within w_employee_resume
end type
type cb_update from commandbutton within w_employee_resume
end type
type dw_1 from datawindow within w_employee_resume
end type
end forward

global type w_employee_resume from window
integer x = 210
integer y = 336
integer width = 2990
integer height = 1456
boolean titlebar = true
string title = "Employee Resume"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_close ( )
event type long ue_retrieve ( )
event type long ue_update ( )
event type long ue_insert_row ( )
event type long ue_delete_row ( )
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
st_1 st_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_close cb_close
cb_delete cb_delete
cb_insert cb_insert
cb_update cb_update
dw_1 dw_1
end type
global w_employee_resume w_employee_resume

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: Determine if data has been changed
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

Boolean   ib_changed


end variables

event ue_close();//====================================================================
// Event: ue_close()
//--------------------------------------------------------------------
// Description: Close the window
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


li_RC = dw_1.Retrieve()


If li_RC < 0 Then
	cb_delete.Enabled = False
Else
	ib_changed = False
	cb_update.Enabled = False
	If li_RC > 0 Then
		cb_delete.Enabled = True
	Else
		dw_1.InsertRow(0)
	End If
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


li_RC = dw_1.UPDATE()
If li_RC = 1 Then
	ib_changed = False
	cb_update.Enabled = False
	COMMIT;
Else
	ROLLBACK;
	MessageBox('Warning',"Can't save changes to database.",exclamation!)
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


If ll_cur_row >= 0 Then
	li_RC = dw_1.InsertRow (ll_cur_row)
	dw_1.ScrollToRow(li_RC)
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
	li_RC = dw_1.DeleteRow (0)
	
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

on w_employee_resume.create
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.st_1=create st_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_close=create cb_close
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.cb_update=create cb_update
this.dw_1=create dw_1
this.Control[]={this.cb_7,&
this.cb_6,&
this.cb_5,&
this.st_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_close,&
this.cb_delete,&
this.cb_insert,&
this.cb_update,&
this.dw_1}
end on

on w_employee_resume.destroy
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.cb_update)
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
this.TriggerEvent ("ue_retrieve")


end event

event closequery;//====================================================================
// Event: closequery()
//--------------------------------------------------------------------
// Description:  If data in the DataWindow has been changed but not saved, prompt user to save it.
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
			Return  1
		End If
	End If
End If

end event

type cb_7 from commandbutton within w_employee_resume
integer x = 2510
integer y = 88
integer width = 389
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Retrieve"
end type

event clicked;parent.TriggerEvent ("ue_retrieve")
end event

type cb_6 from commandbutton within w_employee_resume
integer x = 2510
integer y = 792
integer width = 389
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "SaveAS"
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
dw_1.SaveAs()

end event

type cb_5 from commandbutton within w_employee_resume
integer x = 2510
integer y = 676
integer width = 389
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
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
dw_1.Print()

end event

type st_1 from statictext within w_employee_resume
integer x = 46
integer y = 16
integer width = 2117
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example shows Appeon supporting SQL Server text datatype ( long varchar )."
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_employee_resume
integer x = 2798
integer y = 556
integer width = 101
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = ">|"
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
Int  li_Row

li_Row = dw_1.RowCount()
dw_1.ScrollToRow(li_Row)



end event

type cb_3 from commandbutton within w_employee_resume
integer x = 2702
integer y = 556
integer width = 101
integer height = 100
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = ">"
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
Int  li_Row

li_Row = dw_1.GetRow()
If li_Row < dw_1.RowCount() Then
	li_Row ++
	dw_1.ScrollToRow(li_Row)
End If


end event

type cb_2 from commandbutton within w_employee_resume
integer x = 2606
integer y = 556
integer width = 101
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "<"
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
Int  li_Row

li_Row = dw_1.GetRow()
If li_Row > 1 Then
	li_Row --
	dw_1.ScrollToRow(li_Row)
End If


end event

type cb_1 from commandbutton within w_employee_resume
integer x = 2510
integer y = 556
integer width = 101
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "|<"
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
dw_1.ScrollToRow(1)

end event

type cb_close from commandbutton within w_employee_resume
integer x = 2510
integer y = 1216
integer width = 389
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

type cb_delete from commandbutton within w_employee_resume
integer x = 2510
integer y = 440
integer width = 389
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

type cb_insert from commandbutton within w_employee_resume
integer x = 2510
integer y = 324
integer width = 389
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

type cb_update from commandbutton within w_employee_resume
integer x = 2510
integer y = 208
integer width = 389
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

type dw_1 from datawindow within w_employee_resume
integer x = 37
integer y = 92
integer width = 2437
integer height = 1224
integer taborder = 10
string dataobject = "d_employee_description"
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update instance variable indicating that data in the DataWindow has changed.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

ib_changed = True
cb_update.Enabled = True

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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update instance variable indicating that data in the DataWindow has changed.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
ib_changed = True
cb_update.Enabled = True

If dwo.Name <> 'emp_id' Then Return

long    ll_EmpID
String  ls_FName,ls_LName

ll_EmpID = long(Data)

SELECT emp_fname,emp_lname INTO :ls_FName,:ls_LName
	FROM employee
	Where emp_id = :ll_EmpID;
	
If sqlca.SQLCode = 0 Then
	This.SetItem(row,'emp_fname',ls_FName)
	This.SetItem(row,'emp_lname',ls_LName)
End If
*/
long    ll_OldEmpID
long    ll_NewEmpID
long    ll_FindRow
long    ll_InsertRow
long    ll_Null
string  ls_FName
string  ls_LName

if dwo.Name<>"emp_id" then 
	ib_changed = true
	cb_update.Enabled = true
	Return
end if

SetNull(ll_Null)
ll_NewEmpID = long(Data)
ll_OldEmpID = this.GetItemNumber(Row,"emp_id",Primary!,true)
ll_FindRow = this.Find("emp_id=" + String(ll_NewEmpID),1,this.RowCount())

if (not IsNull(ll_OldEmpID) and ll_FindRow>0) then//Query
	//MessageBox("1","Not Null and ll_FindRow>0")
	this.ScrollToRow(ll_FindRow)
	this.Post SetItem(Row,"emp_id",ll_OldEmpID)	
elseif (not IsNull(ll_OldEmpID) and ll_FindRow<=0) then//Add
	//MessageBox("2","Not Null and ll_FindRow<=0")
	ll_InsertRow = this.InsertRow(0)
	this.ScrollToRow(ll_InsertRow)
	this.SetItem(ll_InsertRow,"emp_id",ll_NewEmpID)
	this.Post SetItem(Row,"emp_id",ll_OldEmpID)
	ib_changed = true
	cb_update.Enabled = true
elseif (IsNull(ll_OldEmpID) and ll_FindRow>0) then//Query
	//MessageBox("3","Null and ll_FindRow>0")
	this.ScrollToRow(ll_FindRow)
	this.Post SetItem(Row,"emp_id",ll_Null)	
elseif (IsNull(ll_OldEmpID) and ll_FindRow<=0) then//Modify
	//MessageBox("4","Null and ll_FindRow<=0")
	ib_changed = true
	cb_update.Enabled = true	
end if

Select emp_fname,emp_lname Into :ls_FName,:ls_LName From employee Where emp_id = :ll_NewEmpID;	
If SQLCA.SQLCode = 0 Then
	this.SetItem(this.GetRow(),'emp_fname',ls_FName)
	this.SetItem(this.GetRow(),'emp_lname',ls_LName)
End If
end event

