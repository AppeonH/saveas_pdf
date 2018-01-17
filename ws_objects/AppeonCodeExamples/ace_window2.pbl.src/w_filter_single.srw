$PBExportHeader$w_filter_single.srw
$PBExportComments$Single Filter Window
forward
global type w_filter_single from window
end type
type mle_filter from multilineedit within w_filter_single
end type
type cb_4 from commandbutton within w_filter_single
end type
type cb_3 from commandbutton within w_filter_single
end type
type cb_2 from commandbutton within w_filter_single
end type
type cb_1 from commandbutton within w_filter_single
end type
type cb_cancle from commandbutton within w_filter_single
end type
type cb_ok from commandbutton within w_filter_single
end type
type dw_filter from datawindow within w_filter_single
end type
type gb_1 from groupbox within w_filter_single
end type
type gb_2 from groupbox within w_filter_single
end type
end forward

global type w_filter_single from window
integer width = 2277
integer height = 1216
boolean titlebar = true
string title = "Filter"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_filter mle_filter
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_cancle cb_cancle
cb_ok cb_ok
dw_filter dw_filter
gb_1 gb_1
gb_2 gb_2
end type
global w_filter_single w_filter_single

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

datawindow    idw_Parent
end variables

forward prototypes
public function string of_buildfilterstring ()
public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase)
end prototypes

public function string of_buildfilterstring ();//====================================================================
// Function: of_buildfilterstring()
//--------------------------------------------------------------------
//	Description:  	This function will build a valid datawindow filter string 
//               	from the values entered in the filter selection datawindow.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
//	Returns:   		String
//						The new filter string.
//						'!' if an error is encountered.
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String	ls_exp_left, ls_oper, ls_value, ls_colname, ls_filter, ls_and_or
String	ls_coltype, ls_expression
Integer	li_i, li_rcount, li_foundrow

// Accept the latest changes.
If dw_filter.AcceptText() <> 1 Then Return '!'

// Get the values from the filter datawindow.
li_rcount = dw_filter.RowCount ( )

For li_i = 1 To li_rcount
	// Construct the left side of the expression.
	ls_exp_left = dw_filter.GetItemString ( li_i, "colname" )
	If IsNull(ls_exp_left) Then ls_exp_left = ""
	If ls_exp_left = '' Then Continue
	If li_i > 1 Then
		ls_filter = ls_filter + " " + ls_and_or
	End If
	
	// Construct the operator.
	ls_oper = dw_filter.GetItemString ( li_i, "oper" )
	If IsNull(ls_oper) Then ls_oper = ""
	
	// Get the value.
	ls_value = dw_filter.GetItemString ( li_i, "colvalue" )
	If IsNull (ls_value) Then ls_value = ""
	
	// Construct the "AND" or "OR" for the expression.
	ls_and_or = dw_filter.GetItemString (li_i, "and_or" )
	If IsNull(ls_and_or) Then ls_and_or = ""
	
	ls_colname = ls_exp_left
	
	// Get the column type.
	ls_coltype = LeftA(idw_parent.Describe ( ls_colname + ".ColType" ), 5)
	
	// Determine the correct expression.
	Choose Case ls_coltype
	// CHARACTER DATATYPE		
		Case "char(", "char"
			If PosA(ls_value, '~~~"') = 0 And PosA(ls_value, "~~~'") = 0 Then
				// No special characters found.
				If PosA(ls_value, "'") > 0 Then
					// Replace single quotes with special chars single quotes.
					ls_value = of_GlobalReplace(ls_value, "'", "~~~'",True)
				End If
			End If
			ls_expression = "'" + ls_value + "'"
			
			// DATE DATATYPE	
		Case "date"
			If Not IsDate(ls_value) Then
				MessageBox("Alert","Please enter a valid date for column ["+ls_colname+"].")
				Return '-1'
			End If
			
			ls_expression = "Date('" + ls_value  + "')"
			
			// DATETIME DATATYPE
		Case "datet"
			ls_expression = "DateTime('" + ls_value + "')"
			
			// TIME DATATYPE
		Case "time", "times"
			ls_expression = "Time('" + ls_value + "')"
			
			// NUMBER
		Case 	Else
			If Not IsNumber(ls_value) Then
				MessageBox("Alert","Please enter a valid number for column ["+ls_colname+"].")
				Return '-1'
			End If
			ls_expression = ls_value
	End Choose
	
	// Build the filter string.
	ls_filter += " " + ls_colname + " " + ls_oper + " " + ls_expression
Next

Return Trim(ls_filter)

end function

public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase);//====================================================================
// Function: of_globalreplace()
//--------------------------------------------------------------------
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//--------------------------------------------------------------------
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// ab_IgnoreCase	A boolean stating to ignore case sensitivity.	
//--------------------------------------------------------------------
//	Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Long	ll_Start
Long	ll_OldLen
Long	ll_NewLen
String ls_Source

//Check parameters
If IsNull(as_source) Or IsNull(as_old) Or IsNull(as_new) Or IsNull(ab_ignorecase) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Get the string lenghts
ll_OldLen = LenA(as_old)
ll_NewLen = LenA(as_new)

//Should function respect case.
If ab_ignorecase Then
	as_old = Lower(as_old)
	ls_Source = Lower(as_source)
Else
	ls_Source = as_source
End If

//Search for the first occurrence of as_Old
ll_Start = PosA(ls_Source, as_old)

Do While ll_Start > 0
	// replace as_Old with as_New
	as_source = ReplaceA(as_source, ll_Start, ll_OldLen, as_new)
	
	//Should function respect case.
	If ab_ignorecase Then
		ls_Source = Lower(as_source)
	Else
		ls_Source = as_source
	End If
	
	// find the next occurrence of as_Old
	ll_Start = PosA(ls_Source, as_old, (ll_Start + ll_NewLen))
Loop

Return as_source


end function

on w_filter_single.create
this.mle_filter=create mle_filter
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_cancle=create cb_cancle
this.cb_ok=create cb_ok
this.dw_filter=create dw_filter
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.mle_filter,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_cancle,&
this.cb_ok,&
this.dw_filter,&
this.gb_1,&
this.gb_2}
end on

on w_filter_single.destroy
destroy(this.mle_filter)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_cancle)
destroy(this.cb_ok)
destroy(this.dw_filter)
destroy(this.gb_1)
destroy(this.gb_2)
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

integer	 li_i,li_TotalCols,li_newrow
string	ls_ColName
datawindowchild   ldwc_cols

idw_Parent = message.powerobjectparm
IF not isvalid(idw_Parent) THEN
	close(this)
	return
END IF

// Get dddw reference.
dw_Filter.GetChild ( "colname", ldwc_cols ) 

// Populate the listbox with the column names.
// Convert the first column of the Current Filter to its display name.
li_TotalCols = integer(idw_Parent.describe("datawindow.column.count"))

FOR li_i = 1 to li_TotalCols
	ls_ColName = idw_Parent.describe("#"+string(li_i)+".name")
	li_newrow = ldwc_cols.InsertRow ( 0 ) 
	// Populate the attributes for the column.	
	ldwc_cols.SetItem ( li_newrow, "display_column", ls_ColName) 
NEXT 

// Add rows for the current Filter. One row for each column.

String  ls_OrgFilter

ls_OrgFilter = idw_Parent.describe("DataWindow.table.filter")
mle_filter.text = ls_OrgFilter
li_newrow = dw_Filter.InsertRow (0)


end event

type mle_filter from multilineedit within w_filter_single
integer x = 91
integer y = 688
integer width = 2080
integer height = 216
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type cb_4 from commandbutton within w_filter_single
integer x = 1792
integer y = 452
integer width = 361
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
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

dw_Filter.reset()
dw_Filter.insertrow(0)
end event

type cb_3 from commandbutton within w_filter_single
integer x = 1792
integer y = 352
integer width = 361
integer height = 84
integer taborder = 60
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

int  li_Row

li_Row = dw_Filter.getrow()
dw_Filter.deleterow(li_Row)
end event

type cb_2 from commandbutton within w_filter_single
integer x = 1792
integer y = 252
integer width = 361
integer height = 84
integer taborder = 30
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

int  li_Row

li_Row = dw_Filter.getrow()
dw_Filter.insertrow(li_Row)
end event

type cb_1 from commandbutton within w_filter_single
integer x = 1792
integer y = 152
integer width = 361
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add"
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

dw_Filter.insertrow(0)
end event

type cb_cancle from commandbutton within w_filter_single
integer x = 1865
integer y = 988
integer width = 361
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
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

Closewithreturn(parent ,"-1")
end event

type cb_ok from commandbutton within w_filter_single
integer x = 1458
integer y = 988
integer width = 361
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
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

string   ls_Filterstring

ls_Filterstring = of_buildfilterstring ()
IF ls_Filterstring = '-1' then RETURN
Closewithreturn(parent ,ls_Filterstring)


end event

type dw_filter from datawindow within w_filter_single
integer x = 73
integer y = 72
integer width = 1719
integer height = 476
integer taborder = 40
string title = "none"
string dataobject = "d_filtersimple"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_filter_single
integer x = 41
integer y = 8
integer width = 2185
integer height = 584
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "New Filter Criteria"
end type

type gb_2 from groupbox within w_filter_single
integer x = 41
integer y = 608
integer width = 2185
integer height = 336
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Original Filter Criteria"
end type

