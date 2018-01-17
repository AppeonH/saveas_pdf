$PBExportHeader$w_highlight_dw_rows.srw
$PBExportComments$How to highlight DataWindow rows depending on the combination of Mouse click and the shift or control key being pressed.
forward
global type w_highlight_dw_rows from window
end type
type cb_2 from commandbutton within w_highlight_dw_rows
end type
type cb_1 from commandbutton within w_highlight_dw_rows
end type
type st_2 from statictext within w_highlight_dw_rows
end type
type rb_2 from radiobutton within w_highlight_dw_rows
end type
type rb_1 from radiobutton within w_highlight_dw_rows
end type
type st_1 from statictext within w_highlight_dw_rows
end type
type cb_close from commandbutton within w_highlight_dw_rows
end type
type dw_highlight from datawindow within w_highlight_dw_rows
end type
type gb_1 from groupbox within w_highlight_dw_rows
end type
end forward

global type w_highlight_dw_rows from window
integer x = 256
integer y = 264
integer width = 2418
integer height = 1564
boolean titlebar = true
string title = "Select Multiple Rows"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
cb_2 cb_2
cb_1 cb_1
st_2 st_2
rb_2 rb_2
rb_1 rb_1
st_1 st_1
cb_close cb_close
dw_highlight dw_highlight
gb_1 gb_1
end type
global w_highlight_dw_rows w_highlight_dw_rows

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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

boolean ib_action_on_buttonup = false

long  il_LastClickedRow


end variables

forward prototypes
public function integer wf_shift_highlight (long al_aclickedrow)
end prototypes

event ue_postopen();//====================================================================
// Event: ue_postopen()
//--------------------------------------------------------------------
// Description: ue_PostOpen script for w_hightlight_dw_rows
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

// Set the transaction object
dw_highlight.settransobject (sqlca)

// Retrieve the data
dw_highlight.retrieve()



end event

public function integer wf_shift_highlight (long al_aclickedrow);//====================================================================
// Function: wf_shift_highlight()
//--------------------------------------------------------------------
// Description: 
//		This function will verify that there is a prior selected row and
//		then highlight all Rows between the two.  If there is no previously
//		Selected row then it will highlight only the row clicked.  
//		This function will not unhighlight any other rows to allow for a 
//		mix of shift and Control key inter mingling.  This will have to be
//		aware of the relation between the rows to know which way to 
//		highlight.
//
//		The arguement passed will be the currently clicked row.  This 
//		function will use the existing DataWindow and the instance variable
//		iLastClickedRow to perform it's scrolling.
//--------------------------------------------------------------------
// Arguments: 
//		long	al_aclickedrow		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Integer	li_Idx

//file manager functionality ... turn off all rows then select new range

dw_highlight.SelectRow(0,False)

If il_lastclickedrow = 0 Then
	//	dw_highlight.SelectRow(al_aclickedrow,TRUE)
	Return 1
End If

//selection moving backward
If il_lastclickedrow > al_aclickedrow Then
	For li_Idx = il_lastclickedrow To al_aclickedrow Step -1
		dw_highlight.SelectRow(li_Idx,True)
		End For
	Else
		//selection moving forward
		For li_Idx = il_lastclickedrow To al_aclickedrow
			dw_highlight.SelectRow(li_Idx,True)
		Next
	End If
	
	Return 1
	

end function

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Open script for w_highlight_dw_rows
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

// Post event to retrieve data on postopen (allow window to open faster)
this.x = 0
this.y = 0

this.post event  ue_postopen()


end event

on w_highlight_dw_rows.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_1=create st_1
this.cb_close=create cb_close
this.dw_highlight=create dw_highlight
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_2,&
this.rb_2,&
this.rb_1,&
this.st_1,&
this.cb_close,&
this.dw_highlight,&
this.gb_1}
end on

on w_highlight_dw_rows.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.dw_highlight)
destroy(this.gb_1)
end on

type cb_2 from commandbutton within w_highlight_dw_rows
integer x = 1559
integer y = 1336
integer width = 361
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "SaveAs"
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dw_highlight.saveas()
end event

type cb_1 from commandbutton within w_highlight_dw_rows
integer x = 1143
integer y = 1336
integer width = 361
integer height = 100
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
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long  ll_Count,ll

dw_highlight.retrieve()

FOR ll = 1 TO dw_highlight.rowcount()
	IF dw_highlight.isselected(ll) THEN ll_Count++
NEXT

st_2.text = "Total Selected Rows = "+string(ll_Count)
end event

type st_2 from statictext within w_highlight_dw_rows
integer x = 1143
integer y = 1204
integer width = 731
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "Total Selected Rows = "
boolean focusrectangle = false
end type

type rb_2 from radiobutton within w_highlight_dw_rows
integer x = 553
integer y = 1184
integer width = 439
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Multi Select"
end type

type rb_1 from radiobutton within w_highlight_dw_rows
integer x = 78
integer y = 1184
integer width = 439
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Single Select"
boolean checked = true
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dw_highlight.selectrow(0,FALSE)

dw_highlight.selectrow(dw_highlight.getrow(),TRUE)

st_2.text = "Total Selected Rows = 1"
end event

type st_1 from statictext within w_highlight_dw_rows
integer x = 41
integer y = 20
integer width = 1714
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "This example shows how to select multiple rows in a DataWindow."
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_highlight_dw_rows
integer x = 1975
integer y = 1336
integer width = 361
integer height = 100
integer taborder = 10
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type dw_highlight from datawindow within w_highlight_dw_rows
event ue_lbuttonup pbm_dwnlbuttonup
integer x = 37
integer y = 100
integer width = 2299
integer height = 1040
integer taborder = 30
string dataobject = "d_contact_list_protected"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_lbuttonup;//====================================================================
// Event: ue_lbuttonup()
//--------------------------------------------------------------------
// Description: This event will be the controlling event for all of the types of
//		Highlighting that will be done.
//--------------------------------------------------------------------
// Arguments: 
//		integer 	xpos		
//		integer 	ypos		
//		long    	row 		
//		dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnlbuttonup]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long	  ll_ClickedRow
string	  ls_KeyDownType

//////////////////////////////////////////////////////////////////////////////////////////////////
//		First make sure the user clicked on a Row.  Clicking on WhiteSpace
//		or in the header will return a clicked row value of 0.  If that 
//		occurs, just leave this event.
//////////////////////////////////////////////////////////////////////////////////////////////////


//In filemanager style, the the click and ctrl-click events on a selected row take place
//on the button up event.
If ib_action_on_buttonup Then
	ib_action_on_buttonup = false

	// (CTRL KEY) keep other rows highlighted and highlight a new row or
	// turn off the currint row highlight
	If Keydown(KeyControl!) then
		this.selectrow(il_lastclickedrow,FALSE)
	Else
		this.SelectRow(0,FALSE)
		this.SelectRow(il_lastclickedrow,TRUE)
	End If

	//last action was deselecting a row , an anchor row is no longer defined
	il_lastclickedrow = 0
End If


end event

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Clicked script for dw_highlight
//--------------------------------------------------------------------
// Arguments: 
//		integer 	xpos		
//		integer 	ypos		
//		long    	row 		
//		dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnlbuttonclk]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//////////////////////////////////////////////////////////////////////////////////////////////////
//		First make sure the user clicked on a Row.  Clicking on WhiteSpace
//		or in the header will return a clicked row value of 0.  If that 
//		occurs, just leave this event.
//////////////////////////////////////////////////////////////////////////////////////////////////

//check for a valid row
If row = 0 then Return

IF this.IsSelected(row) Then
	IF rb_1.checked THEN
		this.selectrow(0,FALSE)
	ELSE
		this.selectrow(row,FALSE)
	END IF
ELSE
	IF rb_1.checked THEN
		this.selectrow(0,FALSE)
		this.selectrow(row,TRUE)
	ELSE
		this.selectrow(row,TRUE)
	END IF
End If

long   ll,ll_Count

FOR ll = 1 TO this.rowcount()
	IF this.isselected(ll) THEN ll_Count++
NEXT

st_2.text = "Total Selected Rows = "+string(ll_Count)
end event

type gb_1 from groupbox within w_highlight_dw_rows
integer x = 41
integer y = 1148
integer width = 1024
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

