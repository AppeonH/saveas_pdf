$PBExportHeader$w_edit_style.srw
forward
global type w_edit_style from window
end type
type cb_7 from commandbutton within w_edit_style
end type
type cb_6 from commandbutton within w_edit_style
end type
type cb_5 from commandbutton within w_edit_style
end type
type cb_2 from commandbutton within w_edit_style
end type
type cb_4 from commandbutton within w_edit_style
end type
type cb_update from commandbutton within w_edit_style
end type
type cb_delete from commandbutton within w_edit_style
end type
type dw_1 from datawindow within w_edit_style
end type
type cb_insert from commandbutton within w_edit_style
end type
type cb_1 from commandbutton within w_edit_style
end type
type cb_3 from commandbutton within w_edit_style
end type
end forward

global type w_edit_style from window
integer width = 3515
integer height = 1048
boolean titlebar = true
string title = "Multiple Edit Styles DataWindow"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_2 cb_2
cb_4 cb_4
cb_update cb_update
cb_delete cb_delete
dw_1 dw_1
cb_insert cb_insert
cb_1 cb_1
cb_3 cb_3
end type
global w_edit_style w_edit_style

on w_edit_style.create
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_2=create cb_2
this.cb_4=create cb_4
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.dw_1=create dw_1
this.cb_insert=create cb_insert
this.cb_1=create cb_1
this.cb_3=create cb_3
this.Control[]={this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_2,&
this.cb_4,&
this.cb_update,&
this.cb_delete,&
this.dw_1,&
this.cb_insert,&
this.cb_1,&
this.cb_3}
end on

on w_edit_style.destroy
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.dw_1)
destroy(this.cb_insert)
destroy(this.cb_1)
destroy(this.cb_3)
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


dw_1.SetTransObject(sqlca)
dw_1.InsertRow(0)

end event

type cb_7 from commandbutton within w_edit_style
integer x = 2871
integer y = 804
integer width = 411
integer height = 96
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas( )
end event

type cb_6 from commandbutton within w_edit_style
integer x = 2203
integer y = 808
integer width = 105
integer height = 92
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
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
dw_1.ScrollToRow(dw_1.RowCount())

end event

type cb_5 from commandbutton within w_edit_style
integer x = 2098
integer y = 808
integer width = 105
integer height = 92
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
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
dw_1.ScrollNextRow()

end event

type cb_2 from commandbutton within w_edit_style
integer x = 1998
integer y = 808
integer width = 105
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
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
dw_1.ScrollPriorRow()

end event

type cb_4 from commandbutton within w_edit_style
integer x = 2400
integer y = 808
integer width = 411
integer height = 96
integer taborder = 60
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
CLOSE(Parent)

end event

type cb_update from commandbutton within w_edit_style
integer x = 1403
integer y = 808
integer width = 411
integer height = 96
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
If dw_1.UPDATE() = 1 Then
	COMMIT;
Else
	MessageBox("Update Error","Failed to update database!~r~n" + sqlca.SQLErrText)
	ROLLBACK;
End If

end event

type cb_delete from commandbutton within w_edit_style
integer x = 974
integer y = 808
integer width = 411
integer height = 96
integer taborder = 40
integer textsize = -9
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
If dw_1.GetRow() = 0 Then Return
dw_1.DeleteRow(0)

end event

type dw_1 from datawindow within w_edit_style
integer x = 37
integer y = 28
integer width = 3392
integer height = 736
integer taborder = 10
string title = "none"
string dataobject = "d_employee_editstyle"
boolean hscrollbar = true
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
Return 1

end event

type cb_insert from commandbutton within w_edit_style
integer x = 544
integer y = 808
integer width = 411
integer height = 96
integer taborder = 30
integer textsize = -9
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
Long ll_insert
ll_insert = dw_1.InsertRow(0)
dw_1.ScrollToRow(ll_insert)
dw_1.SetFocus()
dw_1.SetColumn('emp_id')

end event

type cb_1 from commandbutton within w_edit_style
integer x = 119
integer y = 808
integer width = 411
integer height = 96
integer taborder = 20
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_1.Retrieve()

end event

type cb_3 from commandbutton within w_edit_style
integer x = 1897
integer y = 808
integer width = 105
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
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
If dw_1.RowCount () <> 0 Then dw_1.ScrollToRow(1)

end event

