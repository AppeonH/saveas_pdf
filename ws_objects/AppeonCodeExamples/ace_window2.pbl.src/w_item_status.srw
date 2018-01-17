$PBExportHeader$w_item_status.srw
$PBExportComments$Shows the GetItemStatus and SetItemStatus functions and how they affect updates.
forward
global type w_item_status from window
end type
type cb_6 from commandbutton within w_item_status
end type
type cb_4 from commandbutton within w_item_status
end type
type cb_3 from commandbutton within w_item_status
end type
type cb_2 from commandbutton within w_item_status
end type
type cb_1 from commandbutton within w_item_status
end type
type st_col_status from statictext within w_item_status
end type
type st_label from statictext within w_item_status
end type
type dw_1 from datawindow within w_item_status
end type
type cb_5 from commandbutton within w_item_status
end type
end forward

global type w_item_status from window
integer x = 137
integer y = 8
integer width = 2441
integer height = 1220
boolean titlebar = true
string title = "Item Status and Updating"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event type long ue_retrieve ( )
event ue_deleterow pbm_custom02
event type long ue_insertrow ( )
event ue_open pbm_custom05
cb_6 cb_6
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_col_status st_col_status
st_label st_label
dw_1 dw_1
cb_5 cb_5
end type
global w_item_status w_item_status

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: Lets the sqlpreview event know whether the DW is
//              updating or retrieving
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

boolean   ib_update

end variables

forward prototypes
protected subroutine wf_show_col_status ()
end prototypes

event type long ue_retrieve();//====================================================================
// Event: ue_retrieve()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dw_1.Retrieve()
wf_show_col_status()
return 1

end event

event ue_deleterow;//====================================================================
// Event: ue_deleterow()
//--------------------------------------------------------------------
// Description: Delete the current row from the DataWindow.
//--------------------------------------------------------------------
// Arguments: 
//		unsignedlong	wparam		
//		long        	lparam		
//--------------------------------------------------------------------
// Returns: long [pbm_custom02]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dw_1.DeleteRow (0)

return 1
end event

event type long ue_insertrow();//====================================================================
// Event: ue_insertrow()
//--------------------------------------------------------------------
// Description: Insert a new row into the DataWindow prior to the current row.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long	ll_cur_row,ll_new_row

ll_cur_row = dw_1.GetRow()
ll_new_row = dw_1.InsertRow(ll_cur_row)
dw_1.ScrollToRow(ll_new_row)
dw_1.SetColumn(1)

return ll_Cur_Row



end event

protected subroutine wf_show_col_status ();//====================================================================
// Function: wf_show_col_status()
//--------------------------------------------------------------------
// Description: Displays the current item status of the current column in the DataWindow.
//		          Checks/unchecks column item status menu items to appropriate values.
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

dwItemStatus	le_status
String			ls_col_label, 	ls_col, 	ls_left, ls_right
Int				li_pos

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the current column name (object name and text for label) & item status from the DW.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ls_col = dw_1.GetColumnName()
ls_col_label = ls_col // dw_1.Describe (ls_col + "_t.text")
le_status = dw_1.GetItemStatus (dw_1.GetRow(), dw_1.GetColumn(), primary!)

st_label.Text = "Column Status for [" + ls_col_label + "] is: "

If le_status = notmodified! Then
	st_col_status.TextColor = 0
	st_col_status.Text = "notmodified!"
Else
	st_col_status.TextColor = 255
	st_col_status.Text = "datamodified!"
End If


end subroutine

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
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

this.x = 0
this.y = 0

dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

end event

on w_item_status.create
this.cb_6=create cb_6
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_col_status=create st_col_status
this.st_label=create st_label
this.dw_1=create dw_1
this.cb_5=create cb_5
this.Control[]={this.cb_6,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_col_status,&
this.st_label,&
this.dw_1,&
this.cb_5}
end on

on w_item_status.destroy
destroy(this.cb_6)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_col_status)
destroy(this.st_label)
destroy(this.dw_1)
destroy(this.cb_5)
end on

type cb_6 from commandbutton within w_item_status
integer x = 1993
integer y = 992
integer width = 366
integer height = 92
integer taborder = 70
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type cb_4 from commandbutton within w_item_status
integer x = 1993
integer y = 456
integer width = 366
integer height = 92
integer taborder = 50
integer textsize = -9
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if dw_1.Update() = -1 then
	rollback;
else
	commit;
	wf_show_col_status()
end if
end event

type cb_3 from commandbutton within w_item_status
integer x = 1993
integer y = 248
integer width = 366
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dw_1.deleterow(0)

dw_1.selectrow(dw_1.getrow(),TRUE)
end event

type cb_2 from commandbutton within w_item_status
integer x = 1993
integer y = 140
integer width = 366
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

parent.event ue_insertrow()
end event

type cb_1 from commandbutton within w_item_status
integer x = 1993
integer y = 32
integer width = 366
integer height = 92
integer taborder = 30
integer textsize = -9
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

parent.event ue_retrieve()
end event

type st_col_status from statictext within w_item_status
integer x = 800
integer y = 1008
integer width = 521
integer height = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 74481808
boolean focusrectangle = false
end type

type st_label from statictext within w_item_status
integer x = 41
integer y = 1008
integer width = 745
integer height = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Column Status for Sales Order ID:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_item_status
integer x = 41
integer y = 36
integer width = 1920
integer height = 948
integer taborder = 10
string dataobject = "d_item_status"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//====================================================================
// Event: itemchanged()
//--------------------------------------------------------------------
// Description: Redisplay new row status when an item is changed.
//--------------------------------------------------------------------
// Arguments: 
//		long    	row 		
//		dwobject	dwo 		
//		string  	data		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.Post Event rowfocuschanged(row)


end event

event itemfocuschanged;//====================================================================
// Event: itemfocuschanged()
//--------------------------------------------------------------------
// Description: Displays the current item status of the current column in the DataWindow.
//--------------------------------------------------------------------
// Arguments: 
//		long    	row		
//		dwobject	dwo		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchangefocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

wf_show_col_status()


end event

event retrievestart;//====================================================================
// Event: retrievestart()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnretrievestart]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

ib_update = false
end event

event updatestart;//====================================================================
// Event: updatestart()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnupdatestart]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

ib_update = true
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
// Author: 	laihaichun		Date: 2004/01/02
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

type cb_5 from commandbutton within w_item_status
integer x = 1993
integer y = 352
integer width = 366
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset Update"
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

dw_1.resetupdate()
end event

