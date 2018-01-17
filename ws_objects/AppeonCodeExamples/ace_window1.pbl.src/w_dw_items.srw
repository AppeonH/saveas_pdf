$PBExportHeader$w_dw_items.srw
$PBExportComments$Demonstrates use of item vs text in a datawindow; use of accept text as well as itemchanged event
forward
global type w_dw_items from window
end type
type cb_1 from commandbutton within w_dw_items
end type
type sle_item from singlelineedit within w_dw_items
end type
type sle_text from singlelineedit within w_dw_items
end type
type dw_1 from datawindow within w_dw_items
end type
type st_item_label from statictext within w_dw_items
end type
type st_text_label from statictext within w_dw_items
end type
type cb_close from commandbutton within w_dw_items
end type
type cb_3 from commandbutton within w_dw_items
end type
type gb_1 from groupbox within w_dw_items
end type
end forward

global type w_dw_items from window
integer x = 105
integer y = 132
integer width = 2263
integer height = 1532
boolean titlebar = true
string title = "Column Text Value vs. Item Value"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
sle_item sle_item
sle_text sle_text
dw_1 dw_1
st_item_label st_item_label
st_text_label st_text_label
cb_close cb_close
cb_3 cb_3
gb_1 gb_1
end type
global w_dw_items w_dw_items

type variables

end variables

on w_dw_items.create
this.cb_1=create cb_1
this.sle_item=create sle_item
this.sle_text=create sle_text
this.dw_1=create dw_1
this.st_item_label=create st_item_label
this.st_text_label=create st_text_label
this.cb_close=create cb_close
this.cb_3=create cb_3
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.sle_item,&
this.sle_text,&
this.dw_1,&
this.st_item_label,&
this.st_text_label,&
this.cb_close,&
this.cb_3,&
this.gb_1}
end on

on w_dw_items.destroy
destroy(this.cb_1)
destroy(this.sle_item)
destroy(this.sle_text)
destroy(this.dw_1)
destroy(this.st_item_label)
destroy(this.st_text_label)
destroy(this.cb_close)
destroy(this.cb_3)
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

dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()



end event

type cb_1 from commandbutton within w_dw_items
integer x = 960
integer y = 1300
integer width = 370
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
boolean default = true
end type

event clicked;dw_1.saveas( )
end event

type sle_item from singlelineedit within w_dw_items
integer x = 1221
integer y = 120
integer width = 777
integer height = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_text from singlelineedit within w_dw_items
integer x = 219
integer y = 120
integer width = 777
integer height = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_dw_items
integer x = 37
integer y = 316
integer width = 2162
integer height = 940
integer taborder = 10
string dataobject = "d_retrieve_cust"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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

/////////////////////////////////////////////////////////////////////
// 
// Purpose: to show the text value of the current column changing
//				as data is entered by the user.	
// 
// Log:
//	
//	  DATE	WHO	WHAT
//	--------	---	----
//	04/11/94	mco	initial version
//
/////////////////////////////////////////////////////////////////////


sle_text.Text = dw_1.GetText()


end event

event itemfocuschanged;//====================================================================
// Event: itemfocuschanged()
//--------------------------------------------------------------------
// Description: 
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

/////////////////////////////////////////////////////////////////////
// 
// Purpose: to show the text and item values of the current column
//		
// 
// Log:
//	
//	  DATE	WHO	WHAT
//	--------	---	----
//	04/11/94	mco	initial version
//
/////////////////////////////////////////////////////////////////////

String	ls_val


// Read & display the column data
If This.GetColumnName() = 'id' Then
	ls_val = String (This.GetItemNumber (This.GetRow(), This.GetColumn()))
Else
	ls_val = This.GetItemString (This.GetRow(), This.GetColumn())
End If

sle_text.Text = ls_val
sle_item.Text = ls_val




end event

type st_item_label from statictext within w_dw_items
integer x = 1079
integer y = 120
integer width = 142
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Item:"
boolean focusrectangle = false
end type

type st_text_label from statictext within w_dw_items
integer x = 78
integer y = 120
integer width = 137
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Text:"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_dw_items
integer x = 1833
integer y = 1300
integer width = 370
integer height = 100
integer taborder = 30
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

CLOSE (Parent)

end event

type cb_3 from commandbutton within w_dw_items
integer x = 1403
integer y = 1300
integer width = 370
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Accept Text"
boolean default = true
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: perform the AcceptText() function to dw_1 and redisplay
//				the current row/column item value.
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

If dw_1.AcceptText() = 1 Then
	If dw_1.GetColumnName() = 'id' Then
		sle_item.Text = String (dw_1.GetItemNumber (dw_1.GetRow(), dw_1.GetColumn()))
	Else
		sle_item.Text = dw_1.GetItemString (dw_1.GetRow(), dw_1.GetColumn())
	End If
End If




end event

type gb_1 from groupbox within w_dw_items
integer x = 37
integer y = 32
integer width = 2162
integer height = 228
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Current Cell"
end type

