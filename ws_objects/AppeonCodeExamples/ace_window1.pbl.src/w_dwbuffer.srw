$PBExportHeader$w_dwbuffer.srw
forward
global type w_dwbuffer from window
end type
type cb_6 from commandbutton within w_dwbuffer
end type
type cb_5 from commandbutton within w_dwbuffer
end type
type cb_4 from commandbutton within w_dwbuffer
end type
type cb_3 from commandbutton within w_dwbuffer
end type
type cb_2 from commandbutton within w_dwbuffer
end type
type cb_1 from commandbutton within w_dwbuffer
end type
type dw_primary from datawindow within w_dwbuffer
end type
type dw_status from datawindow within w_dwbuffer
end type
type dw_filter from datawindow within w_dwbuffer
end type
type dw_delete from datawindow within w_dwbuffer
end type
type dw_original from datawindow within w_dwbuffer
end type
type gb_1 from groupbox within w_dwbuffer
end type
type gb_2 from groupbox within w_dwbuffer
end type
type gb_3 from groupbox within w_dwbuffer
end type
type gb_4 from groupbox within w_dwbuffer
end type
type gb_5 from groupbox within w_dwbuffer
end type
type gb_6 from groupbox within w_dwbuffer
end type
end forward

global type w_dwbuffer from window
integer width = 3255
integer height = 1820
boolean titlebar = true
string title = "Datawindow Buffers"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_update ( )
event ue_undo ( )
event ue_retrieve ( )
event ue_refresh ( )
event ue_insert ( )
event ue_delete ( )
event ue_filter ( )
event ue_ ( )
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_primary dw_primary
dw_status dw_status
dw_filter dw_filter
dw_delete dw_delete
dw_original dw_original
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
gb_6 gb_6
end type
global w_dwbuffer w_dwbuffer

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
Long i_rowcount = 0
Long maxrow

end variables

forward prototypes
public function string of_rowstatus (datawindow adw_arg, long al_row, long al_col, string as_buffer)
public subroutine of_refleshstatuswindow ()
public subroutine of_refleshdeletewindow ()
public subroutine of_refleshfilterwindow ()
public subroutine of_refleshoriginalwindow ()
end prototypes

event ue_update();//====================================================================
// Event: ue_update()
//--------------------------------------------------------------------
// Description: 
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
If dw_primary.UPDATE() = 1 Then
	
	// Refresh all the windows
	of_refleshdeletewindow()
	of_refleshfilterwindow()
	of_refleshoriginalwindow()
	of_refleshstatuswindow()
	//		dw_primary.ResetUpdate()
	COMMIT;
Else
	ROLLBACK;
End If


end event

event ue_retrieve();//====================================================================
// Event: ue_retrieve()
//--------------------------------------------------------------------
// Description: 
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
dw_primary.Reset()
dw_primary.Retrieve()

// Refresh all the windows
of_refleshdeletewindow()
of_refleshfilterwindow()
of_refleshoriginalwindow()
of_refleshstatuswindow()

end event

event ue_refresh();//====================================================================
// Event: ue_refresh()
//--------------------------------------------------------------------
// Description: 
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
dw_primary.reset ()
end event

event ue_insert();//====================================================================
// Event: ue_insert()
//--------------------------------------------------------------------
// Description: 
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
Long		ll_Row

ll_Row = dw_primary.InsertRow(0)
dw_primary.ScrollToRow(ll_Row)

of_refleshstatuswindow()
end event

event ue_delete();//====================================================================
// Event: ue_delete()
//--------------------------------------------------------------------
// Description: 
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
dw_primary.DeleteRow(0)

// Refresh all the windows
of_refleshdeletewindow()
of_refleshfilterwindow()
//of_refleshoriginalwindow()
of_refleshstatuswindow()


end event

event ue_filter();//====================================================================
// Event: ue_filter()
//--------------------------------------------------------------------
// Description: 
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

//dw_primary.SetFilter("dept_id<>100")
//dw_primary.Filter()

String   ls_Filter

OpenWithParm(w_Filter_single,dw_primary)

ls_Filter = Message.StringParm
If ls_Filter = '-1' Then Return
dw_primary.SetFilter(ls_Filter)
dw_primary.Filter()


// Refresh all the windows
of_refleshdeletewindow()
of_refleshfilterwindow()
//of_refleshoriginalwindow()
of_refleshstatuswindow()


end event

public function string of_rowstatus (datawindow adw_arg, long al_row, long al_col, string as_buffer);//====================================================================
// Function: of_rowstatus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		datawindow	adw_arg  		
//		long      	al_row   		
//		long      	al_col   		
//		string    	as_buffer		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dwItemStatus		ldis_Status

Choose Case Lower(as_buffer)
	Case "primary"
		ldis_Status = adw_Arg.GetItemStatus(al_Row, al_Col, PRIMARY!)
	Case "filter"
		ldis_Status = adw_Arg.GetItemStatus(al_Row, al_Col, Filter!)
	Case "delete"
		ldis_Status = adw_Arg.GetItemStatus(al_Row, al_Col, DELETE!)
	Case Else
		Return "Error!"
End Choose

Choose Case ldis_Status
	Case notmodified!
		Return "NotModified!"
		
	Case datamodified!
		Return "DataModified!"
		
	Case new!
		Return "New!"
		
	Case newmodified!
		Return "NewModified!"
		
	Case Else
		Return "Error!"
End Choose


end function

public subroutine of_refleshstatuswindow ();//====================================================================
// Function: of_refleshstatuswindow()
//--------------------------------------------------------------------
// Description:  Refresh the status window
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

dw_status.Post Event ue_refresh()


end subroutine

public subroutine of_refleshdeletewindow ();//====================================================================
// Function: of_refleshdeletewindow()
//--------------------------------------------------------------------
// Description: Refresh the delete buffer datawindow
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
dw_delete.Post Event ue_refresh()


end subroutine

public subroutine of_refleshfilterwindow ();//====================================================================
// Function: of_refleshfilterwindow()
//--------------------------------------------------------------------
// Description: Refresh the filter buffer window
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

dw_filter.Post Event ue_refresh()

end subroutine

public subroutine of_refleshoriginalwindow ();//====================================================================
// Function: of_refleshoriginalwindow()
//--------------------------------------------------------------------
// Description:  Refresh the original datawindow
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


dw_original.Post Event ue_refresh()


end subroutine

on w_dwbuffer.create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_primary=create dw_primary
this.dw_status=create dw_status
this.dw_filter=create dw_filter
this.dw_delete=create dw_delete
this.dw_original=create dw_original
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_6=create gb_6
this.Control[]={this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_primary,&
this.dw_status,&
this.dw_filter,&
this.dw_delete,&
this.dw_original,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4,&
this.gb_5,&
this.gb_6}
end on

on w_dwbuffer.destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_primary)
destroy(this.dw_status)
destroy(this.dw_filter)
destroy(this.dw_delete)
destroy(this.dw_original)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_6)
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

dw_primary.SetTransObject(sqlca)
dw_status.SetTransObject(sqlca)
dw_delete.SetTransObject(sqlca)
dw_filter.SetTransObject(sqlca)
dw_original.SetTransObject(sqlca)
cb_1.TriggerEvent(Clicked!)

end event

type cb_6 from commandbutton within w_dwbuffer
integer x = 2770
integer y = 92
integer width = 366
integer height = 100
integer taborder = 50
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
close(parent)
end event

type cb_5 from commandbutton within w_dwbuffer
integer x = 1669
integer y = 88
integer width = 366
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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
Parent.Post Event ue_update()

end event

type cb_4 from commandbutton within w_dwbuffer
integer x = 1271
integer y = 88
integer width = 366
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Filter"
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
Parent.Post Event ue_filter()

end event

type cb_3 from commandbutton within w_dwbuffer
integer x = 873
integer y = 88
integer width = 366
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete"
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
Parent.Post Event ue_delete()

end event

type cb_2 from commandbutton within w_dwbuffer
integer x = 475
integer y = 88
integer width = 366
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Insert"
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
Parent.Post Event ue_insert()

end event

type cb_1 from commandbutton within w_dwbuffer
integer x = 78
integer y = 88
integer width = 366
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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
dw_primary.Reset()
dw_primary.Retrieve()

dw_status.Post Event ue_refresh()
dw_original.Post Event ue_refresh()
dw_filter.Post Event ue_refresh()
dw_delete.Post Event ue_refresh()

end event

type dw_primary from datawindow within w_dwbuffer
integer x = 87
integer y = 316
integer width = 1728
integer height = 596
integer taborder = 10
string title = "Buffer:Primary"
string dataobject = "d_departments"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
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
of_refleshstatuswindow()

end event

type dw_status from datawindow within w_dwbuffer
event ue_refresh ( )
integer x = 87
integer y = 1032
integer width = 1728
integer height = 616
integer taborder = 20
string title = "Row/Column Status"
string dataobject = "d_statuses_new"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_refresh();//====================================================================
// Event: ue_refresh()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long		ll_RowCnt,  ll_ColCnt, ll_NewRow , ll_MaxRow
Integer	li_Start
String	ls_Ret, ls_ModString


Reset()

// Set row/column status from the Primary Buffer
ll_MaxRow  = dw_primary.RowCount()

For ll_RowCnt = 1 To ll_MaxRow // ll_RowCnt represents the rows in the filter buffer
	ll_NewRow = InsertRow(0)		// ll_NewRow represents newly inserted rows in the status dw
	For ll_ColCnt = 0 To 3							// for each column, 0 = row status
		SetItem(ll_NewRow, ll_ColCnt + 1, of_rowstatus(dw_primary, ll_NewRow, ll_ColCnt, "primary"))
	Next
	
	// Attach the row id so the status window is easier to read.
	SetItem(ll_NewRow, "row_id", dw_primary.GetItemNumber(ll_RowCnt, 1))
Next

li_Start = ll_RowCnt

// Set row/column status from the Filter Buffer.  Append To Primary Buffer statuses
ll_MaxRow  = dw_filter.RowCount()

For ll_RowCnt = 1 To ll_MaxRow // ll_RowCnt represents the rows in the filter buffer
	ll_NewRow = InsertRow(0)		// ll_NewRow represents newly inserted rows in the status dw
	For ll_ColCnt = 0 To 3							// for each column, 0 = row status
		SetItem(ll_NewRow, ll_ColCnt + 1, of_rowstatus(dw_primary, ll_RowCnt, ll_ColCnt, "filter"))
	Next
	
	SetItem(ll_NewRow, "row_id", dw_filter.GetItemNumber(ll_RowCnt, 1))
Next

// Change color of changed status
//ls_ModString = "#1.Color=~"0~tif(#1=~~~"DataModified!~~~" or #1=~~~"NewModified!~~~", 255,0)~""
//ls_Ret = dw_status.Modify(ls_ModString)
//If ls_Ret <> "" Then
//	MessageBox("Modify Error #1", ls_Ret)
//End If
//
//ls_ModString = "#2.Color=~"0~tif(#2=~~~"DataModified!~~~" or #2=~~~"NewModified!~~~", 255,0)~""
//ls_Ret = dw_status.Modify(ls_ModString)
//If ls_Ret <> "" Then
//	MessageBox("Modify Error #2", ls_Ret)
//End If
//
//ls_ModString = "#3.Color=~"0~tif(#3=~~~"DataModified!~~~" or #3=~~~"NewModified!~~~", 255,0)~""
//ls_Ret = dw_status.Modify(ls_ModString)
//If ls_Ret <> "" Then
//	MessageBox("Modify Error #3", ls_Ret)
//End If
//
//ls_ModString = "#4.Color=~"0~tif(#4=~~~"DataModified!~~~" or #4=~~~"NewModified!~~~", 255,0)~""
//ls_Ret = dw_status.Modify(ls_ModString)
//If ls_Ret <> "" Then
//	MessageBox("Modify Error #4", ls_Ret)
//End If

end event

type dw_filter from datawindow within w_dwbuffer
event ue_refresh ( )
integer x = 1934
integer y = 312
integer width = 1202
integer height = 344
integer taborder = 10
string title = "Buffer:Filter"
string dataobject = "d_filter_new"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_refresh();//====================================================================
// Event: ue_refresh()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long				ll_MaxRow
Integer			li_RC
DataWindow	ldw_1

// Set a local pointer to the primary DataWindow.
ldw_1 = dw_primary

// Obtain the current count of rows in the filter buffer of the primary
// DataWindow.
ll_MaxRow = ldw_1.FilteredCount()

// reset the DataWindow

Reset()

// If there are any rows in the filter buffer copy them into the
// DataWindow on this window.
If ll_MaxRow > 0 Then
	li_RC = ldw_1.RowsCopy(1, ldw_1.FilteredCount(), Filter!, This , 1, Primary!)
End If



end event

type dw_delete from datawindow within w_dwbuffer
event ue_refresh ( )
integer x = 1929
integer y = 768
integer width = 1198
integer height = 344
integer taborder = 10
string title = "Buffer:Delete"
string dataobject = "d_filter_new"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_refresh();//====================================================================
// Event: ue_refresh()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long				ll_MaxRow
Integer			li_RC
DataWindow	ldw_1

// Set a local pointer to the DataWindow 
// that exists on the primary DataWindow.
ldw_1 = dw_primary

// Set the number of deleted rows in the delete buffer
// for the primary DataWindow.  Set the redraw for the DataWindow
// False to avoid flicker and reset the DataWindow that exists on 
// this window.
ll_MaxRow = ldw_1.DeletedCount()
Reset()

// Use the RowsCopy function to copy the rows from the
// deleted buffer in the primary DataWindow into the DataWindow
// on this window.
If ll_MaxRow > 0 Then
	li_RC = ldw_1.RowsCopy(1, ldw_1.DeletedCount(), DELETE!,This, 1, Primary!)
End If



end event

type dw_original from datawindow within w_dwbuffer
event ue_refresh ( )
integer x = 1929
integer y = 1228
integer width = 1198
integer height = 424
integer taborder = 10
string title = "Buffer:Original"
string dataobject = "d_filter_new"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_refresh();//====================================================================
// Event: ue_refresh()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String			ls_ModString, ls_Ret
Long				ll_MaxRow, ll_Cnt, ll_LoopCnt, ll_NewRow
DataWindow	ldw_1

// Populate from the primary buffer
ldw_1 = dw_primary

ll_MaxRow = ldw_1.RowCount()
ll_LoopCnt = ll_MaxRow

Reset()

For ll_Cnt = 1 To ll_MaxRow
	Choose Case ldw_1.GetItemStatus(ll_Cnt, 0, primary!)
		Case New!, Newmodified!
			Continue
	End Choose
	ll_NewRow = InsertRow(0)
	SetItem(ll_NewRow, 1, ldw_1.GetItemNumber 	(ll_Cnt, 1, primary!, True))
	SetItem(ll_NewRow, 2, ldw_1.GetItemString	(ll_Cnt, 2, primary!, True))
	SetItem(ll_NewRow, 3, ldw_1.GetItemNumber 	(ll_Cnt, 3, primary!, True))
	//	SetItem(ll_NewRow, 4, "primary")
Next

// populate from the delete buffer
ll_MaxRow = ldw_1.DeletedCount()
ll_LoopCnt += ll_MaxRow

For ll_Cnt = 1 To ll_MaxRow
	ll_NewRow = InsertRow(0)
	SetItem(ll_NewRow, 1, ldw_1.GetItemNumber(ll_Cnt, 1, DELETE!, False))
	SetItem(ll_NewRow, 2, ldw_1.GetItemString(ll_Cnt, 2, DELETE!, False))
	SetItem(ll_NewRow, 3, ldw_1.GetItemNumber(ll_Cnt, 3, DELETE!, False))
	//	SetItem(ll_NewRow, 4, "delete")
Next

// populate from the filter buffer
ll_MaxRow = ldw_1.FilteredCount()
ll_LoopCnt += ll_MaxRow

For ll_Cnt = 1 To ll_MaxRow
	Choose Case ldw_1.GetItemStatus(ll_Cnt, 0, Filter!)
		Case New!, Newmodified!
			Continue
	End Choose
	ll_NewRow = InsertRow(0)
	SetItem(ll_NewRow, 1, ldw_1.GetItemNumber 	(ll_Cnt, 1, Filter!, False))
	SetItem(ll_NewRow, 2, ldw_1.GetItemString 	(ll_Cnt, 2, Filter!, False))
	SetItem(ll_NewRow, 3, ldw_1.GetItemNumber	(ll_Cnt, 3, Filter!, False))
	//	SetItem(ll_NewRow, 4, "filter")
Next




end event

type gb_1 from groupbox within w_dwbuffer
integer x = 41
integer y = 952
integer width = 1824
integer height = 732
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Row/Column Status"
end type

type gb_2 from groupbox within w_dwbuffer
integer x = 41
integer y = 244
integer width = 1824
integer height = 708
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buffer: Primary"
end type

type gb_3 from groupbox within w_dwbuffer
integer x = 1893
integer y = 244
integer width = 1289
integer height = 456
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buffer: Filter"
end type

type gb_4 from groupbox within w_dwbuffer
integer x = 1888
integer y = 708
integer width = 1289
integer height = 440
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buffer: Delete"
end type

type gb_5 from groupbox within w_dwbuffer
integer x = 1888
integer y = 1160
integer width = 1289
integer height = 528
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buffer: Original"
end type

type gb_6 from groupbox within w_dwbuffer
integer x = 41
integer y = 24
integer width = 3141
integer height = 212
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

