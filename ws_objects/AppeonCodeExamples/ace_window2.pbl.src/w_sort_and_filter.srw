$PBExportHeader$w_sort_and_filter.srw
forward
global type w_sort_and_filter from window
end type
type cb_1 from commandbutton within w_sort_and_filter
end type
type st_3 from statictext within w_sort_and_filter
end type
type st_2 from statictext within w_sort_and_filter
end type
type sle_value from singlelineedit within w_sort_and_filter
end type
type ddlb_filtercol from dropdownlistbox within w_sort_and_filter
end type
type ddlb_op from dropdownlistbox within w_sort_and_filter
end type
type rb_asc from radiobutton within w_sort_and_filter
end type
type rb_des from radiobutton within w_sort_and_filter
end type
type ddlb_sortcol from dropdownlistbox within w_sort_and_filter
end type
type dw_1 from datawindow within w_sort_and_filter
end type
type cb_update from commandbutton within w_sort_and_filter
end type
type cb_delete from commandbutton within w_sort_and_filter
end type
type cb_insert from commandbutton within w_sort_and_filter
end type
type cb_print from commandbutton within w_sort_and_filter
end type
type cb_retrieve from commandbutton within w_sort_and_filter
end type
type cb_3 from commandbutton within w_sort_and_filter
end type
type cb_filter from commandbutton within w_sort_and_filter
end type
type gb_2 from groupbox within w_sort_and_filter
end type
type gb_1 from groupbox within w_sort_and_filter
end type
end forward

global type w_sort_and_filter from window
integer width = 2615
integer height = 1564
boolean titlebar = true
string title = "Sort and Filter"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_delete_dw ( )
event ue_insert_dw ( )
event ue_postopen ( )
event ue_retrieve_dw ( )
event ue_print_dw ( )
event ue_update_dw ( )
cb_1 cb_1
st_3 st_3
st_2 st_2
sle_value sle_value
ddlb_filtercol ddlb_filtercol
ddlb_op ddlb_op
rb_asc rb_asc
rb_des rb_des
ddlb_sortcol ddlb_sortcol
dw_1 dw_1
cb_update cb_update
cb_delete cb_delete
cb_insert cb_insert
cb_print cb_print
cb_retrieve cb_retrieve
cb_3 cb_3
cb_filter cb_filter
gb_2 gb_2
gb_1 gb_1
end type
global w_sort_and_filter w_sort_and_filter

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string is_sort_sequence
end variables

forward prototypes
public subroutine wf_sort_dw (string as_column, string as_sort_sequence)
public subroutine wf_reset_ddlb ()
public subroutine wf_filter_dw ()
end prototypes

event ue_delete_dw();//====================================================================
// Event: ue_delete_dw()
//--------------------------------------------------------------------
// Description: ue_delete_dw script for w_sort_and_filter
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//delete current row and reset selected row
dw_1.DeleteRow(0)
f_Select_Current_Row(dw_1)
end event

event ue_insert_dw();//====================================================================
// Event: ue_insert_dw()
//--------------------------------------------------------------------
// Description: ue_insert_dw script for w_sort_and_filter
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//insert a new row after current position and move current row to this new row
dw_1.InsertRow(dw_1.GetRow( )+1)
dw_1.SetRow(dw_1.GetRow( )+1)
dw_1.SetColumn(1)
f_Select_Current_Row(dw_1)

end event

event ue_postopen;////////////////////////////////////////////////////////////////////////////////////////////////////////
//ue_postopen script for w_sort_and_filter
////////////////////////////////////////////////////////////////////////////////////////////////////////

//This will set the transaction object for the datawindow dw_1.
//The Transaction object must be set before retrieving data into a datawindow.
//dw_1.SetTransObject(sqlca)
//
////This will cause the user defined event retrieve_dw to be executed
//Trigger Event ue_retrieve_dw()

end event

event ue_retrieve_dw();//====================================================================
// Event: ue_retrieve_dw()
//--------------------------------------------------------------------
// Description: ue_retrieve script for w_sort_and_filter
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//call window function to reset the dialogs
//wf_reset_ddlb()

//retrieve data into datawindow
dw_1.Retrieve( )

//function to select current row
f_select_current_row(dw_1)
end event

event ue_print_dw();//====================================================================
// Event: ue_print_dw()
//--------------------------------------------------------------------
// Description: ue_print_dw script for w_sort_and_filter
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dw_1.Print( )
end event

event ue_update_dw();//====================================================================
// Event: ue_update_dw()
//--------------------------------------------------------------------
// Description: ue_update script for w_sort_and_filter
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

int	li_rtn

li_rtn = dw_1.Update( )

// Error handling
If li_rtn = 1 then
	COMMIT using SQLCA ;
else
	ROLLBACK using SQLCA ;
end if

If SQLCA.SQLCode = -1 then
	MessageBox ('Error', SQLCA.SQLErrText, exclamation!)
End If



end event

public subroutine wf_sort_dw (string as_column, string as_sort_sequence);//====================================================================
// Function: wf_sort_dw()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_column       		
//		string	as_sort_sequence		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dw_1.SetSort(as_column + " " + as_sort_sequence)
dw_1.Sort()
end subroutine

public subroutine wf_reset_ddlb ();//====================================================================
// Function: wf_reset_ddlb()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

int		li_column_count,li_counter
string 	ls_column_name

//ddlb_data.reset()
ddlb_filtercol.reset()
cb_filter.text = "Filter"
ddlb_sortcol.reset()

//fill sort column list box with column name as defined in the datawindow

//Get the number of columns on this datawindow.
li_column_count = Integer(dw_1.Object.DataWindow.Column.Count)

For li_counter =  li_column_count to 1 step -1
	ls_column_name = dw_1.Describe("#"+string(li_counter)+".Name")
	ddlb_sortcol.InsertItem(ls_column_name,1)
	ddlb_filtercol.InsertItem(ls_column_name,1)
Next

ddlb_sortcol.text = ls_column_name
is_sort_sequence = "a"
rb_asc.Checked=True
wf_sort_dw(ddlb_sortcol.Text,is_sort_sequence)

dw_1.setfilter("")
dw_1.filter()

end subroutine

public subroutine wf_filter_dw ();//====================================================================
// Function: wf_filter_dw()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_quote, ls_column_name, ls_match_data, ls_filter

If ddlb_filtercol.text = "id" then 
	ls_quote = ""
	ls_column_name = Trim(ddlb_filtercol.text)
	//ls_match_data = ddlb_data.text
	ls_match_data = Trim(sle_value.text)
Else 
	ls_quote = "'"
	ls_column_name = "upper("+Trim(ddlb_filtercol.text)+")"
	//ls_match_data = Upper(ddlb_data.text)
	ls_match_data = upper(Trim(sle_value.text))
End if

ls_filter =  ls_column_name + ddlb_op.text + 	ls_quote + ls_match_data + ls_quote

// Setls_filterer sets ls_filterer criteria, but does not execute ls_filterer. ls_filterer
// is required to execute ls_filterer and change display.

dw_1.Setfilter(ls_filter)
dw_1.filter( )

//reselect current row
f_select_current_row(dw_1)
end subroutine

on w_sort_and_filter.create
this.cb_1=create cb_1
this.st_3=create st_3
this.st_2=create st_2
this.sle_value=create sle_value
this.ddlb_filtercol=create ddlb_filtercol
this.ddlb_op=create ddlb_op
this.rb_asc=create rb_asc
this.rb_des=create rb_des
this.ddlb_sortcol=create ddlb_sortcol
this.dw_1=create dw_1
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.cb_print=create cb_print
this.cb_retrieve=create cb_retrieve
this.cb_3=create cb_3
this.cb_filter=create cb_filter
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.st_3,&
this.st_2,&
this.sle_value,&
this.ddlb_filtercol,&
this.ddlb_op,&
this.rb_asc,&
this.rb_des,&
this.ddlb_sortcol,&
this.dw_1,&
this.cb_update,&
this.cb_delete,&
this.cb_insert,&
this.cb_print,&
this.cb_retrieve,&
this.cb_3,&
this.cb_filter,&
this.gb_2,&
this.gb_1}
end on

on w_sort_and_filter.destroy
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_value)
destroy(this.ddlb_filtercol)
destroy(this.ddlb_op)
destroy(this.rb_asc)
destroy(this.rb_des)
destroy(this.ddlb_sortcol)
destroy(this.dw_1)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.cb_print)
destroy(this.cb_retrieve)
destroy(this.cb_3)
destroy(this.cb_filter)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Open script for w_sort_and_filter
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//This window will load a datawindow and perform various functions on it.
//The Sort and Filter Column DDLB's are dynamically loaded from the current datawindow
this.x = 0
this.y = 0
dw_1.SetTransObject(sqlca)
Trigger Event ue_retrieve_dw()




end event

type cb_1 from commandbutton within w_sort_and_filter
integer x = 2181
integer y = 1000
integer width = 357
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas( )
end event

type st_3 from statictext within w_sort_and_filter
integer x = 41
integer y = 76
integer width = 2514
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "the basic DataWindow row functions."
boolean focusrectangle = false
end type

type st_2 from statictext within w_sort_and_filter
integer x = 41
integer y = 12
integer width = 2514
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Use the Sort and Filter options to change the DataWindow below. Use the buttons on the right side to execute "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_sort_and_filter
integer x = 1920
integer y = 212
integer width = 571
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
borderstyle borderstyle = stylelowered!
end type

type ddlb_filtercol from dropdownlistbox within w_sort_and_filter
integer x = 1189
integer y = 212
integer width = 535
integer height = 492
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "id"
boolean autohscroll = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"id","fname","lname","address","city","state","zip","phone","company_name"}
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
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

////////////////////////////////////////////////////////////////////////////////////////////////////////
//selectionchanged script for ddlb_filtercol
////////////////////////////////////////////////////////////////////////////////////////////////////////

//This script will load the ddlb.data with unique values for the column that was selected.

dwBuffer	   le_buffertype
Int			li_buffers, li_items, li_index
Long 		   ll_row_counter, ll_rows_buffer
String 		ls_column_name,ls_col_type,ls_insert_item
String		ls_buffertype

SetPointer(Hourglass!)

//Reset the filter status back to unfiltered
If cb_filter.text = "Unfilter" Then cb_filter.Triggerevent(clicked!)

//get column name from the datawindow that was selected
ls_column_name = ddlb_filtercol.text

//clear out the data drop down list box

//determine if the column selected is numeric or strings

if ls_column_name ='id' then
	ls_col_type ="number"
else
	ls_col_type ="char"
end if

//This is the routine that will actually load the data into the ddlb.data from datawindow dw_1
//To do this, two passes are required because the data in the datawindow may already
//be filtered. The first pass will load data from the appropriate column of data already
//visible (Primary buffer). The second pass will load data from the appropriate column if
//some rows have already been filtered.
//There are two types of "Get" from the datawindow, getitemstring and getitemnumber,
//which is depent of the type of row selected.
le_buffertype = Primary!
ll_rows_buffer = dw_1.RowCount()

For li_buffers = 1 to 2
	For ll_row_counter = 1 to ll_rows_buffer
		
		If LeftA(ls_col_type,4) = "char" then
			ls_insert_item = Trim(dw_1.GetItemString(ll_row_counter, ls_column_name, &
									le_buffertype, False))
		ElseIf ls_col_type = "number" then
			ls_insert_item = String(dw_1.GetItemnumber(ll_row_counter, ls_column_name, &
									le_buffertype, False))
		End If

	Next
	le_buffertype=Filter!
	ll_rows_buffer=dw_1.FilteredCount()
Next


end event

type ddlb_op from dropdownlistbox within w_sort_and_filter
integer x = 1746
integer y = 212
integer width = 160
integer height = 492
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "="
boolean autohscroll = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"=","<",">","<=",">=","<>"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: Reset the filter status back to unfiltered
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

If cb_filter.text = "Unfilter" Then cb_filter.Triggerevent(clicked!)
end event

type rb_asc from radiobutton within w_sort_and_filter
integer x = 645
integer y = 220
integer width = 393
integer height = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Ascending"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//send the selected column name and sort order to the window function
//to resort datawindow
//is_sort_sequence holds the sort order
is_sort_sequence="a"
wf_sort_dw(ddlb_sortcol.text,is_sort_sequence)
end event

type rb_des from radiobutton within w_sort_and_filter
integer x = 645
integer y = 292
integer width = 416
integer height = 92
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Descending"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//send the selected column name and sort order to the window function
//to resort datawindow
//is_sort_sequence holds the sort order
is_sort_sequence="d"
wf_sort_dw(ddlb_sortcol.text,is_sort_sequence)
end event

type ddlb_sortcol from dropdownlistbox within w_sort_and_filter
integer x = 78
integer y = 212
integer width = 535
integer height = 492
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "id"
boolean autohscroll = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"id","fname","lname","address","city","state","zip","phone","company_name"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: window function to handle sorting of datawindow
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

// The currently selected column name is 
// Concatenated with the sort_sequence,
// set by the radio buttons (A - ascending or D - descending and
// use as the sort criteria in WF_Sort_DW. 

Wf_Sort_Dw(ddlb_sortcol.text,is_sort_sequence)

end event

type dw_1 from datawindow within w_sort_and_filter
integer x = 32
integer y = 444
integer width = 2117
integer height = 964
integer taborder = 30
string dataobject = "d_cust_sort"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;//====================================================================
// Event: itemfocuschanged()
//--------------------------------------------------------------------
// Description: Call window function to move the selected row to match the cursor position
//--------------------------------------------------------------------
// Arguments: 
//		long    	row		
//		dwobject	dwo		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchangefocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

f_select_current_row(dw_1)
end event

type cb_update from commandbutton within w_sort_and_filter
integer x = 2181
integer y = 560
integer width = 357
integer height = 96
integer taborder = 40
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

////////////////////////////////////////////////////////////////////////////////////////////////////////
//clicked script for cb_update
////////////////////////////////////////////////////////////////////////////////////////////////////////

//run user defined event in main window called "update_dw"
parent.TriggerEvent("ue_update_dw")

end event

type cb_delete from commandbutton within w_sort_and_filter
integer x = 2181
integer y = 668
integer width = 357
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Row"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: run user defined event in main window called "delete_dw"
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

parent.TriggerEvent("ue_delete_dw")

end event

type cb_insert from commandbutton within w_sort_and_filter
integer x = 2181
integer y = 776
integer width = 357
integer height = 96
integer taborder = 40
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

////////////////////////////////////////////////////////////////////////////////////////////////////////
//clicked script for cb_insert
////////////////////////////////////////////////////////////////////////////////////////////////////////

//run user defined event in main window called "insert_dw"
parent.TriggerEvent("ue_insert_dw")
end event

type cb_print from commandbutton within w_sort_and_filter
integer x = 2181
integer y = 884
integer width = 357
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

////////////////////////////////////////////////////////////////////////////////////////////////////////
//clicked script for cb_print
////////////////////////////////////////////////////////////////////////////////////////////////////////

//run user defined event in main window called "print_dw"
parent.TriggerEvent("ue_print_dw")

end event

type cb_retrieve from commandbutton within w_sort_and_filter
integer x = 2181
integer y = 452
integer width = 357
integer height = 96
integer taborder = 30
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

////////////////////////////////////////////////////////////////////////////////////////////////////////
//clicked script for cb_retrieve
////////////////////////////////////////////////////////////////////////////////////////////////////////

//run user defined event in main window called "retrieve_dw"
Parent.Trigger Event ue_retrieve_dw()
end event

type cb_3 from commandbutton within w_sort_and_filter
integer x = 2181
integer y = 1312
integer width = 357
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;
//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: close main window
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type cb_filter from commandbutton within w_sort_and_filter
integer x = 1189
integer y = 308
integer width = 357
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

////////////////////////////////////////////////////////////////////////////////////////////////////////
//clicked script for cb_filter
////////////////////////////////////////////////////////////////////////////////////////////////////////

//Apply the filter selected
//This button will allow the filtered datawindow to be unfiltered by clicking again 
//on the button

string filt,quote

string	ls_column_name

string 	ls_match_data

//If the filter is on a text field, the compairson of the two strings will be made case insensitive
//by converting the column and comparsion string to upper case.
//If the field is numeric, a straight comparison is used.
If cb_filter.Text = "Unfilter" then
	cb_filter.Text = "Filter"
	filt=""
	dw_1.Setfilter(filt)
	dw_1.filter( )
Else
	cb_filter.Text = "Unfilter"
	wf_filter_dw()
End If
end event

type gb_2 from groupbox within w_sort_and_filter
integer x = 1157
integer y = 152
integer width = 1381
integer height = 272
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Filter On Column"
end type

type gb_1 from groupbox within w_sort_and_filter
integer x = 27
integer y = 152
integer width = 1097
integer height = 272
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Sort On Column"
end type

