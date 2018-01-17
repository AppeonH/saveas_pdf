$PBExportHeader$w_dberror_event.srw
$PBExportComments$Example which shows how to supress default dberror message, and display custom message.
forward
global type w_dberror_event from window
end type
type cb_add from commandbutton within w_dberror_event
end type
type rb_none from radiobutton within w_dberror_event
end type
type rb_custom from radiobutton within w_dberror_event
end type
type rb_default from radiobutton within w_dberror_event
end type
type cb_retrieve from commandbutton within w_dberror_event
end type
type cb_update from commandbutton within w_dberror_event
end type
type cb_close from commandbutton within w_dberror_event
end type
type dw_1 from datawindow within w_dberror_event
end type
type gb_1 from groupbox within w_dberror_event
end type
end forward

global type w_dberror_event from window
integer x = 457
integer y = 376
integer width = 2085
integer height = 1200
boolean titlebar = true
string title = "DBError Event"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_add cb_add
rb_none rb_none
rb_custom rb_custom
rb_default rb_default
cb_retrieve cb_retrieve
cb_update cb_update
cb_close cb_close
dw_1 dw_1
gb_1 gb_1
end type
global w_dberror_event w_dberror_event

on w_dberror_event.create
this.cb_add=create cb_add
this.rb_none=create rb_none
this.rb_custom=create rb_custom
this.rb_default=create rb_default
this.cb_retrieve=create cb_retrieve
this.cb_update=create cb_update
this.cb_close=create cb_close
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_add,&
this.rb_none,&
this.rb_custom,&
this.rb_default,&
this.cb_retrieve,&
this.cb_update,&
this.cb_close,&
this.dw_1,&
this.gb_1}
end on

on w_dberror_event.destroy
destroy(this.cb_add)
destroy(this.rb_none)
destroy(this.rb_custom)
destroy(this.rb_default)
destroy(this.cb_retrieve)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: open script for w_dberror_event.
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

// Set Transaction Object for the DataWindow
dw_1.SetTransObject (sqlca)

This.X = 0
This.Y = 0

dw_1.Retrieve()

end event

type cb_add from commandbutton within w_dberror_event
integer x = 1637
integer y = 176
integer width = 352
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Row"
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_add
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Add a new row into the DataWindow
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Long	ll_row

ll_row = dw_1.InsertRow (0)
dw_1.ScrollToRow(ll_row)
dw_1.SetColumn(1)
dw_1.SetFocus()

end event

type rb_none from radiobutton within w_dberror_event
integer x = 96
integer y = 940
integer width = 553
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "No error message"
end type

type rb_custom from radiobutton within w_dberror_event
integer x = 96
integer y = 868
integer width = 809
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Customized error message"
end type

type rb_default from radiobutton within w_dberror_event
integer x = 96
integer y = 796
integer width = 777
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Default PB error message"
boolean checked = true
end type

type cb_retrieve from commandbutton within w_dberror_event
integer x = 1637
integer y = 56
integer width = 352
integer height = 96
integer taborder = 40
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_retrieve
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the DataWindow.
// If the Retrieve function fails (return code of -1), the dberror event of the DataWindow will be triggered.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_1.Retrieve()

end event

type cb_update from commandbutton within w_dberror_event
integer x = 1637
integer y = 296
integer width = 352
integer height = 96
integer taborder = 60
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_update
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update the DataWindow.
// If the Update function fails (return code of -1), the dberror event of the DataWindow will be triggered.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

If dw_1.UPDATE() = 1 Then
	COMMIT;
Else
	ROLLBACK;
End If

end event

type cb_close from commandbutton within w_dberror_event
integer x = 1637
integer y = 960
integer width = 352
integer height = 96
integer taborder = 70
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_close 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CLOSE (Parent)

end event

type dw_1 from datawindow within w_dberror_event
integer x = 50
integer y = 56
integer width = 1536
integer height = 636
integer taborder = 30
string dataobject = "d_departments"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;//====================================================================
// Event: dberror()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	sqldbcode 		
//		string  	sqlerrtext		
//		string  	sqlsyntax 		
//		dwbuffer	buffer    		
//		long    	row       		
//--------------------------------------------------------------------
// Returns: long [pbm_dwndberror]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// dberror script for dw_1
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Depending on which error message option is checked, display appropriate error message.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// If custom error message is checked, then display an error message with the specific
// database error code and error message that occurred.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
If rb_custom.Checked Then
	MessageBox ("Database Error", "Database error code:  " + String (SQLDBCode) + &
		"~r~nDatabase error message:  " + SQLErrText, exclamation!)
End If


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Setting the return code to 1 in the dberror event will stop PowerBuilder from displaying
// the default error message
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
If Not rb_default.Checked Then
	Return 1
End If

Return 0



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
If currentrow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(currentrow,True)
End If


end event

type gb_1 from groupbox within w_dberror_event
integer x = 50
integer y = 720
integer width = 1541
integer height = 336
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "On DBError event display"
end type

