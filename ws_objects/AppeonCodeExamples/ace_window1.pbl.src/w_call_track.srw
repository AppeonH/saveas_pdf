$PBExportHeader$w_call_track.srw
$PBExportComments$Call Tracking example showing use of autoincrement
forward
global type w_call_track from window
end type
type cb_1 from commandbutton within w_call_track
end type
type cb_cancel from commandbutton within w_call_track
end type
type cb_update from commandbutton within w_call_track
end type
type cb_delete from commandbutton within w_call_track
end type
type cb_add from commandbutton within w_call_track
end type
type dw_calls from datawindow within w_call_track
end type
type dw_add from datawindow within w_call_track
end type
end forward

global type w_call_track from window
integer x = 5
integer y = 4
integer width = 2606
integer height = 1580
boolean titlebar = true
string title = "Auto Increment - Call Track"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
cb_1 cb_1
cb_cancel cb_cancel
cb_update cb_update
cb_delete cb_delete
cb_add cb_add
dw_calls dw_calls
dw_add dw_add
end type
global w_call_track w_call_track

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
Boolean	ib_Changed

end variables

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

dw_add.SetTransObject(sqlca)
dw_calls.SetTransObject(sqlca)

dw_calls.Retrieve()


end event

on w_call_track.create
this.cb_1=create cb_1
this.cb_cancel=create cb_cancel
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.cb_add=create cb_add
this.dw_calls=create dw_calls
this.dw_add=create dw_add
this.Control[]={this.cb_1,&
this.cb_cancel,&
this.cb_update,&
this.cb_delete,&
this.cb_add,&
this.dw_calls,&
this.dw_add}
end on

on w_call_track.destroy
destroy(this.cb_1)
destroy(this.cb_cancel)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.cb_add)
destroy(this.dw_calls)
destroy(this.dw_add)
end on

type cb_1 from commandbutton within w_call_track
integer x = 2002
integer y = 32
integer width = 526
integer height = 100
integer taborder = 40
integer textsize = -8
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
dw_add.Reset()
dw_calls.Retrieve()
ib_Changed = False

end event

type cb_cancel from commandbutton within w_call_track
integer x = 2002
integer y = 524
integer width = 526
integer height = 100
integer taborder = 60
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
CLOSE(Parent)


end event

type cb_update from commandbutton within w_call_track
integer x = 2002
integer y = 400
integer width = 526
integer height = 100
integer taborder = 50
integer textsize = -8
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
String  ls_temp
Date   ld_date

dw_add.AcceptText()

If dw_add.DeletedCount()+dw_add.ModifiedCount() < 1 Then Return

If dw_add.GetRow() > 0 Then
	ld_date = dw_add.GetItemDate(1,'call_date')
	If IsNull(ld_date) Then
		MessageBox('Alert','Please enter a valid call date.')
		Return
	End If
	ls_temp = dw_add.GetItemString(1,'caller_name')
	If IsNull(ls_temp) Or ls_temp = '' Then
		MessageBox('Alert','Please enter a valid caller name.')
		Return
	End If
	ls_temp = dw_add.GetItemString(1,'call_notes')
	If IsNull(ls_temp) Or ls_temp = '' Then
		MessageBox('Alert','Please enter a valid call notes.')
		Return
	End If
End If

If dw_add.UPDATE() > 0 Then
	COMMIT;
	dw_calls.ResetUpdate()
Else
	ROLLBACK;
	MessageBox("Error","Database update error.",exclamation!)
	Return
End If

dw_calls.Reset()
dw_calls.Retrieve()

If dw_calls.GetSelectedRow(0) = 0 Then
	dw_calls.SelectRow(1, True)
End If

ib_Changed = False



end event

type cb_delete from commandbutton within w_call_track
integer x = 2002
integer y = 276
integer width = 526
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
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
Integer	li_Row

If dw_calls.DeletedCount() > 0 Then
	MessageBox('Alert','You can only delete one row every time. Please update your changes first.')
	Return
End If
li_Row = dw_add.GetRow()
If li_Row < 1 Then
	MessageBox('Alert','Please select a row to delete.')
	Return
End If
dw_add.DeleteRow(li_Row)
li_Row = dw_calls.GetRow()
dw_calls.DeleteRow(li_Row)


end event

type cb_add from commandbutton within w_call_track
integer x = 2002
integer y = 152
integer width = 526
integer height = 100
integer taborder = 30
integer textsize = -8
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
Integer  li_row

dw_add.AcceptText()
If ib_Changed Then
	If MessageBox("Add New Call", "Do you want to save this call record?", Question!, &
		YesNo!) = 1 Then cb_update.Trigger Event Clicked()
End If

dw_add.Reset()
dw_add.InsertRow(0)

dw_calls.SelectRow(0, False)
dw_add.SetFocus()


end event

type dw_calls from datawindow within w_call_track
integer x = 23
integer y = 664
integer width = 2510
integer height = 776
integer taborder = 20
string dataobject = "d_list_calls"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer 	xpos		
//		integer 	ypos		
//		long    	row 		
//		dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnlbuttonclk]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
If row > 0 Then
	If ib_Changed Then
		If MessageBox("Update Call", "Do you want to save changes to call record?", Question!, &
			YesNo!) = 1 Then cb_update.Trigger Event Clicked()
	End If
	
	This.SelectRow(0, False)
	This.SelectRow(row, True)
	
	Long   ll_ID
	
	ll_ID = This.GetItemNumber(row,'id')
	dw_add.Retrieve(ll_ID)
End If


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
Long   ll_ID

If RowCount <= 0 Then Return
ll_ID = This.GetItemNumber(1,'id')
This.SelectRow(0,False)
This.SelectRow(1,True)
dw_add.Retrieve(ll_ID)

end event

type dw_add from datawindow within w_call_track
integer x = 32
integer y = 36
integer width = 1934
integer height = 604
integer taborder = 10
string dataobject = "d_add_call"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
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
ib_Changed = True


end event

