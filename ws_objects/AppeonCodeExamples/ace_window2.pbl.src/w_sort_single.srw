$PBExportHeader$w_sort_single.srw
$PBExportComments$Single Sort Window
forward
global type w_sort_single from window
end type
type cb_cancle from commandbutton within w_sort_single
end type
type cb_ok from commandbutton within w_sort_single
end type
type ddlb_sort from dropdownlistbox within w_sort_single
end type
type cbx_asc from checkbox within w_sort_single
end type
type gb_1 from groupbox within w_sort_single
end type
end forward

global type w_sort_single from window
integer width = 1531
integer height = 524
boolean titlebar = true
string title = "Sort"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancle cb_cancle
cb_ok cb_ok
ddlb_sort ddlb_sort
cbx_asc cbx_asc
gb_1 gb_1
end type
global w_sort_single w_sort_single

type variables

end variables

on w_sort_single.create
this.cb_cancle=create cb_cancle
this.cb_ok=create cb_ok
this.ddlb_sort=create ddlb_sort
this.cbx_asc=create cbx_asc
this.gb_1=create gb_1
this.Control[]={this.cb_cancle,&
this.cb_ok,&
this.ddlb_sort,&
this.cbx_asc,&
this.gb_1}
end on

on w_sort_single.destroy
destroy(this.cb_cancle)
destroy(this.cb_ok)
destroy(this.ddlb_sort)
destroy(this.cbx_asc)
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

integer	 li_i,li_TotalCols
string	ls_ColName
datawindow    ldw_Parent


ldw_Parent = message.powerobjectparm

IF not isvalid(ldw_Parent) THEN
	close(this)
	return
END IF
// Add the [None] option 	first.
ddlb_sort.AddItem ("[NONE]")

// Populate the listbox with the column names.
// Convert the first column of the Current Sort to its display name.
li_TotalCols = integer(ldw_Parent.describe("datawindow.column.count"))

FOR li_i = 1 to li_TotalCols
	// Populate the listbox with the column names.	
	ls_ColName = ldw_Parent.describe("#"+string(li_i)+".name")
	ddlb_sort.AddItem (ls_ColName)
NEXT 


end event

type cb_cancle from commandbutton within w_sort_single
integer x = 1115
integer y = 304
integer width = 361
integer height = 100
integer taborder = 30
integer textsize = -9
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Closewithreturn(parent ,"-1")
end event

type cb_ok from commandbutton within w_sort_single
integer x = 695
integer y = 304
integer width = 361
integer height = 100
integer taborder = 20
integer textsize = -9
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string 	ls_sortstring
string	ls_listboxsortcolum
string	ls_column
Integer	li_numcols_sort
Integer	li_i

// Get the new column to sort (if any)
ls_listboxsortcolum = ddlb_sort.text

IF ls_listboxsortcolum = '[NONE]' OR ls_listboxsortcolum = "" THEN
	// None was picked.
	ls_sortstring = ""
ELSE 
	// An actual column was picked.
	ls_sortstring = ls_listboxsortcolum + " " 
	// Ascending or Descending?
	IF cbx_asc.checked = TRUE THEN 
		ls_sortstring = ls_sortstring + "A"
	ELSE 
		ls_sortstring = ls_sortstring + "D"
	END IF 			
End If

Closewithreturn(parent ,ls_sortstring)
end event

type ddlb_sort from dropdownlistbox within w_sort_single
integer x = 78
integer y = 120
integer width = 814
integer height = 732
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = true
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cbx_asc from checkbox within w_sort_single
integer x = 942
integer y = 116
integer width = 457
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ascending"
boolean checked = true
end type

type gb_1 from groupbox within w_sort_single
integer x = 41
integer y = 32
integer width = 1431
integer height = 240
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sort items by"
end type

