$PBExportHeader$w_sort_multi.srw
$PBExportComments$Multi Sort Window
forward
global type w_sort_multi from window
end type
type mle_sort from multilineedit within w_sort_multi
end type
type cb_4 from commandbutton within w_sort_multi
end type
type cb_3 from commandbutton within w_sort_multi
end type
type cb_2 from commandbutton within w_sort_multi
end type
type cb_1 from commandbutton within w_sort_multi
end type
type cb_cancle from commandbutton within w_sort_multi
end type
type cb_ok from commandbutton within w_sort_multi
end type
type dw_sort from datawindow within w_sort_multi
end type
type gb_1 from groupbox within w_sort_multi
end type
type gb_2 from groupbox within w_sort_multi
end type
end forward

global type w_sort_multi from window
integer width = 1861
integer height = 1032
boolean titlebar = true
string title = "Sort"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_sort mle_sort
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_cancle cb_cancle
cb_ok cb_ok
dw_sort dw_sort
gb_1 gb_1
gb_2 gb_2
end type
global w_sort_multi w_sort_multi

type variables

end variables

on w_sort_multi.create
this.mle_sort=create mle_sort
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_cancle=create cb_cancle
this.cb_ok=create cb_ok
this.dw_sort=create dw_sort
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.mle_sort,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_cancle,&
this.cb_ok,&
this.dw_sort,&
this.gb_1,&
this.gb_2}
end on

on w_sort_multi.destroy
destroy(this.mle_sort)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_cancle)
destroy(this.cb_ok)
destroy(this.dw_sort)
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

integer	 li_i,li_TotalCols,li_newrow
string	ls_ColName,ls_Text
datawindow    ldw_Parent
datawindowchild   idwc_cols

ldw_Parent = message.powerobjectparm

IF not isvalid(ldw_Parent) THEN
	close(this)
	return
END IF

// Get dddw reference.
dw_sort.GetChild ( "display_column", idwc_cols ) 

// Populate the listbox with the column names.
// Convert the first column of the Current Sort to its display name.
li_TotalCols = integer(ldw_Parent.describe("datawindow.column.count"))

FOR li_i = 1 to li_TotalCols
	ls_ColName = ldw_Parent.describe("#"+string(li_i)+".name")
	ls_Text = ldw_Parent.describe(ls_ColName+"_t.text")
	li_newrow = idwc_cols.InsertRow ( 0 ) 
	// Populate the attributes for the column.	
	idwc_cols.SetItem ( li_newrow, "column_name", ls_ColName) 
	idwc_cols.SetItem ( li_newrow, "display_column", ls_Text) 
NEXT 

// Add rows for the current sort. One row for each column.

String  ls_OrgSort,ls_SortCol,ls_SortOrder
integer   li_CommaPos,li_SpacePos

ls_OrgSort = ldw_Parent.describe("DataWindow.table.sort")
mle_sort.text  =ls_OrgSort

li_CommaPos =  PosA(ls_OrgSort,' A ')
Do While li_CommaPos > 0
	ls_OrgSort = ReplaceA(ls_OrgSort,li_CommaPos,3,' A,')	
	li_CommaPos = PosA(ls_OrgSort,' A ')	
Loop
li_CommaPos =  PosA(ls_OrgSort,' D ')
Do While li_CommaPos > 0
	ls_OrgSort = ReplaceA(ls_OrgSort,li_CommaPos,3,' D,')	
	li_CommaPos = PosA(ls_OrgSort,' D ')	
Loop

IF ls_OrgSort <> '' AND ls_OrgSort<>'?' THEN
	ls_OrgSort += ','
	li_CommaPos = PosA(ls_OrgSort,',')
	
	DO WHILE li_CommaPos > 0
		ls_SortCol = trim(LeftA(ls_OrgSort,li_CommaPos - 1))
		
		IF ls_SortCol ='' THEN exit
		
		li_SpacePos = PosA(ls_SortCol," ")
		//====================================================================
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

		IF li_SpacePos > 0 THEN
			ls_SortOrder = RightA(ls_SortCol,1)
			ls_SortCol = LeftA(ls_SortCol,li_SpacePos - 1)
		ELSE
			ls_SortOrder = 'A'
		END IF
		
		li_newrow = dw_sort.insertrow(0)
		dw_Sort.setitem(li_newrow,'display_column',ls_SortCol)
		dw_Sort.setitem(li_newrow,'sort_order',ls_SortOrder)
		ls_OrgSort = MidA(ls_OrgSort,li_CommaPos + 1)
		li_CommaPos = PosA(ls_OrgSort,',')
	LOOP
ELSE
	li_newrow = dw_sort.InsertRow (0)
END IF

end event

type mle_sort from multilineedit within w_sort_multi
integer x = 59
integer y = 628
integer width = 1701
integer height = 124
integer taborder = 80
integer textsize = -9
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

type cb_4 from commandbutton within w_sort_multi
integer x = 1399
integer y = 384
integer width = 361
integer height = 84
integer taborder = 70
integer textsize = -9
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dw_sort.reset()
dw_sort.insertrow(0)
end event

type cb_3 from commandbutton within w_sort_multi
integer x = 1399
integer y = 284
integer width = 361
integer height = 84
integer taborder = 60
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

int  li_Row

li_Row = dw_Sort.getrow()
dw_Sort.deleterow(li_Row)
end event

type cb_2 from commandbutton within w_sort_multi
integer x = 1399
integer y = 184
integer width = 361
integer height = 84
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

int  li_Row

li_Row = dw_Sort.getrow()
dw_Sort.insertrow(li_Row)
end event

type cb_1 from commandbutton within w_sort_multi
integer x = 1399
integer y = 84
integer width = 361
integer height = 84
integer taborder = 80
integer textsize = -9
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dw_Sort.insertrow(0)
end event

type cb_cancle from commandbutton within w_sort_multi
integer x = 1449
integer y = 824
integer width = 361
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
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

type cb_ok from commandbutton within w_sort_multi
integer x = 1029
integer y = 824
integer width = 361
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string 	ls_sortstring
string	ls_SortColum,ls_SortOrder
string	ls_column
Integer	li_numcols_sort
Integer	li_i

FOR li_i = 1 TO dw_Sort.rowcount()
	ls_SortColum = dw_Sort.getitemstring(li_i,'display_column')
	
	IF ls_SortColum = '' OR isnull(ls_SortColum) THEN continue
	
	ls_SortOrder = dw_Sort.getitemstring(li_i,'Sort_Order')
	
	IF ls_sortstring <> '' THEN
		ls_sortstring += ','
	END IF

	ls_sortstring += ls_SortColum+" "+ls_SortOrder
NEXT

Closewithreturn(parent ,ls_sortstring)
end event

type dw_sort from datawindow within w_sort_multi
integer x = 64
integer y = 72
integer width = 1303
integer height = 412
integer taborder = 40
string title = "none"
string dataobject = "d_sortmulti"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_sort_multi
integer x = 32
integer y = 8
integer width = 1778
integer height = 524
integer taborder = 20
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

type gb_2 from groupbox within w_sort_multi
integer x = 32
integer y = 548
integer width = 1778
integer height = 256
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Original Sort Criteria"
end type

