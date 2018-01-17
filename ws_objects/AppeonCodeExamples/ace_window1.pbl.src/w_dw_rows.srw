$PBExportHeader$w_dw_rows.srw
$PBExportComments$dwRowsMove, dwRowsCopy, and dwRowsDiscard example.
forward
global type w_dw_rows from window
end type
type cb_1 from commandbutton within w_dw_rows
end type
type pb_2 from picturebutton within w_dw_rows
end type
type pb_1 from picturebutton within w_dw_rows
end type
type lb_2 from listbox within w_dw_rows
end type
type lb_1 from listbox within w_dw_rows
end type
type cb_6 from commandbutton within w_dw_rows
end type
type st_count3 from statictext within w_dw_rows
end type
type st_count2 from statictext within w_dw_rows
end type
type st_count1 from statictext within w_dw_rows
end type
type st_3 from statictext within w_dw_rows
end type
type st_2 from statictext within w_dw_rows
end type
type st_1 from statictext within w_dw_rows
end type
type dw_3 from datawindow within w_dw_rows
end type
type dw_2 from datawindow within w_dw_rows
end type
type cb_close from commandbutton within w_dw_rows
end type
type cb_retrieve from commandbutton within w_dw_rows
end type
type gb_1 from groupbox within w_dw_rows
end type
type gb_2 from groupbox within w_dw_rows
end type
type gb_3 from groupbox within w_dw_rows
end type
type dw_1 from datawindow within w_dw_rows
end type
type gb_4 from groupbox within w_dw_rows
end type
end forward

global type w_dw_rows from window
integer x = 229
integer y = 8
integer width = 2510
integer height = 1920
boolean titlebar = true
string title = "Copy, Move and Discard DataWindow Rows"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
pb_2 pb_2
pb_1 pb_1
lb_2 lb_2
lb_1 lb_1
cb_6 cb_6
st_count3 st_count3
st_count2 st_count2
st_count1 st_count1
st_3 st_3
st_2 st_2
st_1 st_1
dw_3 dw_3
dw_2 dw_2
cb_close cb_close
cb_retrieve cb_retrieve
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
dw_1 dw_1
gb_4 gb_4
end type
global w_dw_rows w_dw_rows

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
Integer    ii_source = 1,ii_destination = 2

end variables

forward prototypes
public subroutine wf_set_rowcounts ()
public function integer wf_copy_row ()
public function integer wf_move_row ()
end prototypes

public subroutine wf_set_rowcounts ();//====================================================================
// Function: wf_set_rowcounts()
//--------------------------------------------------------------------
// Description: Sets the displayed row counts of the DataWindows
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

st_count1.Text = String (dw_1.RowCount()) + " rows"
st_count2.Text = String (dw_2.RowCount()) + " rows"
st_count3.Text = String (dw_3.RowCount()) + " rows"

end subroutine

public function integer wf_copy_row ();//====================================================================
// Function: wf_copy_row()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
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
datawindow   ldw_src,ldw_dest
Int   li_Row

Choose Case ii_source
	Case 1
		ldw_src = dw_1
	Case 2
		ldw_src = dw_2
	Case 3
		ldw_src = dw_3
End Choose
Choose Case ii_destination
	Case 1
		ldw_dest = dw_1
	Case 2
		ldw_dest = dw_2
	Case 3
		ldw_dest = dw_3
End Choose

li_Row = ldw_src.GetRow()
If li_Row < 1 Then Return -1

ldw_src.RowsCopy(li_Row,li_Row,primary!,ldw_dest,ldw_dest.RowCount()+1,primary!)

wf_set_rowcounts()

Return 1


end function

public function integer wf_move_row ();//====================================================================
// Function: wf_move_row()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
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
datawindow   ldw_src,ldw_dest
Int   li_Row


Choose Case ii_source
	Case 1
		ldw_src = dw_1
	Case 2
		ldw_src = dw_2
	Case 3
		ldw_src = dw_3
End Choose
Choose Case ii_destination
	Case 1
		ldw_dest = dw_1
	Case 2
		ldw_dest = dw_2
	Case 3
		ldw_dest = dw_3
End Choose
li_Row = ldw_src.GetRow()
If li_Row < 1 Then Return -1

ldw_src.RowsMove(li_Row,li_Row,primary!,ldw_dest,ldw_dest.RowCount()+1,primary!)

wf_set_rowcounts()

Return 1


end function

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

dw_1.SetTransObject (sqlca)
lb_1.SelectItem(1)
lb_2.SelectItem(2)


end event

on w_dw_rows.create
this.cb_1=create cb_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.lb_2=create lb_2
this.lb_1=create lb_1
this.cb_6=create cb_6
this.st_count3=create st_count3
this.st_count2=create st_count2
this.st_count1=create st_count1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.cb_close=create cb_close
this.cb_retrieve=create cb_retrieve
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.dw_1=create dw_1
this.gb_4=create gb_4
this.Control[]={this.cb_1,&
this.pb_2,&
this.pb_1,&
this.lb_2,&
this.lb_1,&
this.cb_6,&
this.st_count3,&
this.st_count2,&
this.st_count1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_3,&
this.dw_2,&
this.cb_close,&
this.cb_retrieve,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.dw_1,&
this.gb_4}
end on

on w_dw_rows.destroy
destroy(this.cb_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.lb_2)
destroy(this.lb_1)
destroy(this.cb_6)
destroy(this.st_count3)
destroy(this.st_count2)
destroy(this.st_count1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.cb_close)
destroy(this.cb_retrieve)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.dw_1)
destroy(this.gb_4)
end on

type cb_1 from commandbutton within w_dw_rows
integer x = 1851
integer y = 520
integer width = 498
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas( )
end event

type pb_2 from picturebutton within w_dw_rows
integer x = 2117
integer y = 1232
integer width = 142
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Move5!"
alignment htextalign = left!
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
If  ii_source = ii_destination Then
	MessageBox('Alert','Please select two different DataWindows.')
	Return
End If


wf_move_row()

end event

type pb_1 from picturebutton within w_dw_rows
integer x = 1934
integer y = 1232
integer width = 142
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "copy!"
alignment htextalign = left!
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
If  ii_source = ii_destination Then
	MessageBox('Alert','Please select two different DataWindows.')
	Return
End If

wf_copy_row()

end event

type lb_2 from listbox within w_dw_rows
integer x = 1861
integer y = 1424
integer width = 475
integer height = 288
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {"1st DataWindow","2nd DataWindow","3rd DataWindow"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
ii_destination = Index



end event

type lb_1 from listbox within w_dw_rows
integer x = 1861
integer y = 868
integer width = 475
integer height = 320
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {"1st DataWindow","2nd DataWindow","3rd DataWindow"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
ii_source = Index


end event

type cb_6 from commandbutton within w_dw_rows
integer x = 1851
integer y = 288
integer width = 498
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Discard Current Row"
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
Integer   li_Row


li_Row = dw_1.GetRow()
If li_Row < 1 Then Return
dw_1.RowsDiscard(li_Row,li_Row,primary!)

st_count1.Text = String (dw_1.RowCount()) + " rows"


end event

type st_count3 from statictext within w_dw_rows
integer x = 462
integer y = 1232
integer width = 357
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "0 rows"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_count2 from statictext within w_dw_rows
integer x = 462
integer y = 700
integer width = 357
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "0 rows"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_count1 from statictext within w_dw_rows
integer x = 494
integer y = 60
integer width = 357
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "0 rows"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_dw_rows
integer x = 37
integer y = 708
integer width = 411
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "2nd DataWindow:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_dw_rows
integer x = 37
integer y = 1240
integer width = 411
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "3rd DataWindow:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_dw_rows
integer x = 69
integer y = 64
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "1st DataWindow:"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_dw_rows
event ue_key pbm_dwnkey
event ue_lmouse_down pbm_lbuttondown
event ue_lmouse_up pbm_lbuttonup
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 1320
integer width = 1673
integer height = 448
integer taborder = 60
string dragicon = "row.ico"
string dataobject = "d_state_list"
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
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If



end event

event getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnsetfocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_1.SelectRow(0,False)
dw_2.SelectRow(0,False)


end event

type dw_2 from datawindow within w_dw_rows
event ue_key pbm_dwnkey
event ue_lmouse_down pbm_lbuttondown
event ue_lmouse_up pbm_lbuttonup
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 788
integer width = 1673
integer height = 412
integer taborder = 50
string dragicon = "row.ico"
string dataobject = "d_state_list"
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
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If



end event

event getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnsetfocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_3.SelectRow(0,False)
dw_1.SelectRow(0,False)


end event

type cb_close from commandbutton within w_dw_rows
integer x = 1851
integer y = 408
integer width = 498
integer height = 92
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
CLOSE (Parent)

end event

type cb_retrieve from commandbutton within w_dw_rows
integer x = 1851
integer y = 168
integer width = 498
integer height = 92
integer taborder = 10
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
// Retrieve the "primary" DataWindow
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

If dw_1.AcceptText() = -1 Then
	Return
Else
	If dw_1.Retrieve() = -1 Then
		Return
	Else
		// Reset the "deleted" and "filtered" DataWindows
		dw_2.Reset()
		dw_3.Reset()
		
		// Redisplay the row counts
		wf_set_rowcounts()
	End If
End If

end event

type gb_1 from groupbox within w_dw_rows
integer x = 1824
integer y = 804
integer width = 549
integer height = 416
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Source"
end type

type gb_2 from groupbox within w_dw_rows
integer x = 1824
integer y = 1360
integer width = 549
integer height = 384
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Destination"
end type

type gb_3 from groupbox within w_dw_rows
integer x = 1751
integer y = 740
integer width = 695
integer height = 1028
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Copy vs. Move"
end type

type dw_1 from datawindow within w_dw_rows
event ue_key pbm_dwnkey
event ue_lmouse_down pbm_lbuttondown
event ue_lmouse_up pbm_lbuttonup
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 152
integer width = 1673
integer height = 476
integer taborder = 40
string dragicon = "row.ico"
string dataobject = "d_state_list"
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
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If



end event

event getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnsetfocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_3.SelectRow(0,False)
dw_2.SelectRow(0,False)


end event

type gb_4 from groupbox within w_dw_rows
integer x = 1792
integer y = 128
integer width = 617
integer height = 500
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
end type

