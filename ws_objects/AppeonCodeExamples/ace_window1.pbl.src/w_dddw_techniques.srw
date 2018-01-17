$PBExportHeader$w_dddw_techniques.srw
$PBExportComments$DropDownDataWindow techniques example
forward
global type w_dddw_techniques from window
end type
type cb_1 from commandbutton within w_dddw_techniques
end type
type cb_close from commandbutton within w_dddw_techniques
end type
type cb_filter from commandbutton within w_dddw_techniques
end type
type cb_sort from commandbutton within w_dddw_techniques
end type
type cb_insert from commandbutton within w_dddw_techniques
end type
type cb_retrieve from commandbutton within w_dddw_techniques
end type
type rb_full from radiobutton within w_dddw_techniques
end type
type rb_partial from radiobutton within w_dddw_techniques
end type
type dw_dept from datawindow within w_dddw_techniques
end type
type gb_1 from groupbox within w_dddw_techniques
end type
end forward

global type w_dddw_techniques from window
integer x = 439
integer y = 428
integer width = 2117
integer height = 1192
boolean titlebar = true
string title = "DropDownDataWindow Techniques"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
cb_close cb_close
cb_filter cb_filter
cb_sort cb_sort
cb_insert cb_insert
cb_retrieve cb_retrieve
rb_full rb_full
rb_partial rb_partial
dw_dept dw_dept
gb_1 gb_1
end type
global w_dddw_techniques w_dddw_techniques

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
// handle to the DropDownDataWindow
datawindowchild   idw_child

end variables

on w_dddw_techniques.create
this.cb_1=create cb_1
this.cb_close=create cb_close
this.cb_filter=create cb_filter
this.cb_sort=create cb_sort
this.cb_insert=create cb_insert
this.cb_retrieve=create cb_retrieve
this.rb_full=create rb_full
this.rb_partial=create rb_partial
this.dw_dept=create dw_dept
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cb_close,&
this.cb_filter,&
this.cb_sort,&
this.cb_insert,&
this.cb_retrieve,&
this.rb_full,&
this.rb_partial,&
this.dw_dept,&
this.gb_1}
end on

on w_dddw_techniques.destroy
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.cb_filter)
destroy(this.cb_sort)
destroy(this.cb_insert)
destroy(this.cb_retrieve)
destroy(this.rb_full)
destroy(this.rb_partial)
destroy(this.dw_dept)
destroy(this.gb_1)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Obtain the handle of the DropDownDataWindow
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

This.X = 0
This.Y = 0
dw_dept.SetTransObject (sqlca)

dw_dept.GetChild ("dept_head_id", idw_child)
idw_child.SetTransObject (sqlca)



end event

type cb_1 from commandbutton within w_dddw_techniques
integer x = 1682
integer y = 556
integer width = 375
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas"
end type

event clicked;dw_dept.saveas( )
end event

type cb_close from commandbutton within w_dddw_techniques
integer x = 1682
integer y = 964
integer width = 375
integer height = 100
integer taborder = 40
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
// Close the window
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CLOSE (Parent)

end event

type cb_filter from commandbutton within w_dddw_techniques
integer x = 1682
integer y = 424
integer width = 375
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Filter DDDW"
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
// Specify filter criteria for the DDDW
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

String	ls_filter

ls_filter = idw_child.Describe("datawindow.table.filter")
If PosA(Lower(ls_filter),'>') > 0 Then
	idw_child.SetFilter ("emp_id <= 300")
Else
	idw_child.SetFilter ("emp_id > 300")
End If


idw_child.Filter ()

// Force DDDW to retrieve, (which will apply filter criteria specified)
dw_dept.Trigger Event RowFocusChanged (dw_dept.GetRow())

end event

type cb_sort from commandbutton within w_dddw_techniques
integer x = 1682
integer y = 296
integer width = 375
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sort DDDW"
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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Specify sort criteria for the DDDW
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
String   ls_Sort

ls_Sort = idw_child.Describe("datawindow.table.sort")
If PosA(Lower(ls_Sort),' a') > 0 Then
	idw_child.SetSort ("emp_id d")
Else
	idw_child.SetSort ("emp_id a")
End If

idw_child.Sort()

// Force DDDW to retrieve, (which will apply sort criteria specified)
dw_dept.Trigger Event RowFocusChanged (dw_dept.GetRow())


end event

type cb_insert from commandbutton within w_dddw_techniques
integer x = 1682
integer y = 168
integer width = 375
integer height = 100
integer taborder = 80
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Insert a row into the DataWindow
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Long	ll_cur_row, &
	ll_row

ll_cur_row = dw_dept.GetRow()
If ll_cur_row >= 0 Then
	ll_row = dw_dept.InsertRow(ll_cur_row)
	dw_dept.ScrollToRow(ll_row)
	dw_dept.SetColumn(1)
	dw_dept.SetFocus()
End If



end event

type cb_retrieve from commandbutton within w_dddw_techniques
integer x = 1682
integer y = 40
integer width = 375
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Retrieve"
boolean default = true
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
// When retrieving a DataWindow that contains a DropDownDataWindow with retrieval 
// arguments, the default dialogue for specifying retrieval arguments for the DDDW will
// come up.  However, if the DropDownDataWindow already contains data before retrieving
// its parent DataWindow, the dialogue is not used.  The DDDWs used in this example have
// a dummy row stored in their definition, thus suppressing this dialogue.
//
// Other ways to suppress the retrieval arguments dialogue are to insert a row or explicitly
// retrieve the DDDW before the parent DataWindow is retrieved.  T
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

If idw_child.RowCount() = 0 Then
	idw_child.InsertRow (0)
End If

dw_dept.Retrieve()


end event

type rb_full from radiobutton within w_dddw_techniques
integer x = 745
integer y = 96
integer width = 631
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Employee Full Detail"
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
// Change the dataobject of the DropDownDataWindow.
// When the dataobject of the DDDW is changed, a retrieve will be performed UNLESS data
// already exists in the DDDW.  The DDDWs used in this example have a dummy row stored
// in them for this purpose.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Int  li
//datawindowchild ldwc

dw_dept.DataObject = 'd_example_dddw2'

dw_dept.SetTransObject (sqlca)
li = dw_dept.GetChild("dept_head_id",idw_child)

If li > 0 Then
	idw_child.SetTransObject(sqlca)
	idw_child.InsertRow(0)
End If

dw_dept.Retrieve()

// Force the DDDW to retrieve employees for the current department of the current row
dw_dept.Event RowFocusChanged (dw_dept.GetRow())


end event

type rb_partial from radiobutton within w_dddw_techniques
integer x = 91
integer y = 92
integer width = 713
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Employee Partial Detail"
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Int  li

dw_dept.DataObject = 'd_example_dddw'

dw_dept.SetTransObject (sqlca)
li = dw_dept.GetChild("dept_head_id",idw_child)

If li > 0 Then
	idw_child.SetTransObject(sqlca)
	idw_child.InsertRow(0)
End If
dw_dept.Retrieve()

// Force the DDDW to retrieve employees for the current department of the current row
dw_dept.Event RowFocusChanged (dw_dept.GetRow())


end event

type dw_dept from datawindow within w_dddw_techniques
integer x = 37
integer y = 224
integer width = 1605
integer height = 840
integer taborder = 20
string dataobject = "d_example_dddw"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Re-retrieve the DropDownDataWindow of employees so that only employees from the
// current department are displayed.
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Int	li_dept_id


If currentrow > 0 Then
	li_dept_id = This.GetItemNumber(currentrow,"dept_id")
	If li_dept_id > 0 Then
		idw_child.Retrieve (li_dept_id)
	End If
End If

//messagebox('dept_id:'+string(li_dept_id),currentrow)

end event

type gb_1 from groupbox within w_dddw_techniques
integer x = 37
integer y = 12
integer width = 1605
integer height = 192
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "DDDW DataObject"
end type

