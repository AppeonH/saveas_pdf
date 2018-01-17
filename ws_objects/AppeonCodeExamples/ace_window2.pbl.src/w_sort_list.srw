$PBExportHeader$w_sort_list.srw
$PBExportComments$List Sort Window
forward
global type w_sort_list from window
end type
type st_3 from statictext within w_sort_list
end type
type st_2 from statictext within w_sort_list
end type
type st_1 from statictext within w_sort_list
end type
type pb_2 from picturebutton within w_sort_list
end type
type pb_1 from picturebutton within w_sort_list
end type
type cb_8 from commandbutton within w_sort_list
end type
type cb_7 from commandbutton within w_sort_list
end type
type cb_6 from commandbutton within w_sort_list
end type
type cb_5 from commandbutton within w_sort_list
end type
type dw_sorted from datawindow within w_sort_list
end type
type dw_sortcolumns from datawindow within w_sort_list
end type
type cb_cancle from commandbutton within w_sort_list
end type
type cb_ok from commandbutton within w_sort_list
end type
end forward

global type w_sort_list from window
integer width = 2117
integer height = 960
boolean titlebar = true
string title = "Sort"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
st_2 st_2
st_1 st_1
pb_2 pb_2
pb_1 pb_1
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
dw_sorted dw_sorted
dw_sortcolumns dw_sortcolumns
cb_cancle cb_cancle
cb_ok cb_ok
end type
global w_sort_list w_sort_list

type variables

end variables

on w_sort_list.create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.dw_sorted=create dw_sorted
this.dw_sortcolumns=create dw_sortcolumns
this.cb_cancle=create cb_cancle
this.cb_ok=create cb_ok
this.Control[]={this.st_3,&
this.st_2,&
this.st_1,&
this.pb_2,&
this.pb_1,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.dw_sorted,&
this.dw_sortcolumns,&
this.cb_cancle,&
this.cb_ok}
end on

on w_sort_list.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.dw_sorted)
destroy(this.dw_sortcolumns)
destroy(this.cb_cancle)
destroy(this.cb_ok)
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

Integer	 li_i,li_TotalCols,li_newrow
String	ls_ColName
datawindow    ldw_Parent
datawindowchild   idwc_cols

ldw_Parent = Message.PowerObjectParm

If Not IsValid(ldw_Parent) Then
	CLOSE(This)
	Return
End If

// Populate the listbox with the column names.
// Convert the first column of the Current Sort to its display name.
li_TotalCols = Integer(ldw_Parent.Describe("datawindow.column.count"))

For li_i = 1 To li_TotalCols
	ls_ColName = ldw_Parent.Describe("#"+String(li_i)+".name")
	li_newrow = dw_sortcolumns.InsertRow ( 0 )
	// Populate the attributes for the column.	
	dw_sortcolumns.SetItem ( li_newrow, "columnname", ls_ColName)
	dw_sortcolumns.SetItem ( li_newrow, "columnid", li_i)
Next

// Add rows for the current sort. One row for each column.

String  ls_OrgSort,ls_SortCol,ls_SortOrder
Integer   li_CommaPos,li_SpacePos,li_Find,li_ID

ls_OrgSort = ldw_Parent.Describe("DataWindow.table.sort")
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

If ls_OrgSort <> '' And ls_OrgSort <> '?' Then
	ls_OrgSort += ','
	li_CommaPos = PosA(ls_OrgSort,',')
	
	Do While li_CommaPos > 0
		ls_SortCol = Trim(LeftA(ls_OrgSort,li_CommaPos - 1))
		
		If ls_SortCol = '' Then Exit
		
		li_SpacePos = PosA(ls_SortCol," ")
		
		If li_SpacePos > 0 Then
			ls_SortOrder = RightA(ls_SortCol,1)
			ls_SortCol = LeftA(ls_SortCol,li_SpacePos - 1)
		Else
			ls_SortOrder = 'A'
		End If
		
		li_newrow = dw_sorted.InsertRow(0)
		dw_sorted.SetItem(li_newrow,'columnname',ls_SortCol)
		dw_sorted.SetItem(li_newrow,'sort_order',ls_SortOrder)
		li_Find = dw_sortcolumns.Find("columnname='"+ls_SortCol+"'",1,li_TotalCols)
		
		If li_Find > 0 Then
			li_ID = dw_sortcolumns.GetItemNumber(li_Find,'columnid')
			dw_sorted.SetItem(li_newrow,'columnid',li_ID)
			dw_sortcolumns.RowsDiscard(li_Find,li_Find,primary!)
		End If
		
		ls_OrgSort = MidA(ls_OrgSort,li_CommaPos + 1)
		li_CommaPos = PosA(ls_OrgSort,',')
	Loop
End If

dw_sortcolumns.SelectRow(1,True)
dw_sortcolumns.Modify("sort_order.visible=0")
dw_sorted.SelectRow(1,True)


end event

type st_3 from statictext within w_sort_list
integer x = 1829
integer y = 24
integer width = 251
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ascending"
boolean focusrectangle = false
end type

type st_2 from statictext within w_sort_list
integer x = 1065
integer y = 24
integer width = 576
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sort Columns"
boolean focusrectangle = false
end type

type st_1 from statictext within w_sort_list
integer x = 32
integer y = 24
integer width = 750
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Columns Available for Sorting"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_sort_list
integer x = 928
integer y = 628
integer width = 101
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "OutputNext!"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

integer  li_Row,li_Count

li_Row = dw_sorted.getrow()
IF li_Row >= dw_sorted.rowcount() THEN return

dw_sorted.rowsmove(li_Row,li_Row,primary!,dw_sorted,li_Row + 2,primary!)
dw_sorted.scrolltorow(li_Row + 1)

end event

type pb_1 from picturebutton within w_sort_list
integer x = 928
integer y = 532
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "OutputPrevious!"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

integer  li_Row,li_Count

li_Row = dw_sorted.getrow()
IF li_Row < 2 THEN return

dw_sorted.rowsmove(li_Row,li_Row,primary!,dw_sorted,li_Row - 1,primary!)
//After execute rowsmove,the getrow()=1
IF li_Row = 2 THEN
	dw_sorted.selectrow(0,FALSE)
	dw_sorted.selectrow(1,TRUE)
ELSE
	dw_sorted.scrolltorow(li_Row - 1)
END IF

end event

type cb_8 from commandbutton within w_sort_list
integer x = 928
integer y = 376
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "<<"
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

integer  li_Count,li_Row

li_Count = dw_sortcolumns.rowcount()
dw_sorted.rowsmove(1,dw_sorted.rowcount(),primary!,dw_sortcolumns,li_Count+1,primary!)

dw_sortcolumns.sort()

IF li_Count < 1 THEN
	dw_sortcolumns.selectrow(0,FALSE)
	dw_sortcolumns.selectrow(1,TRUE)
END IF


end event

type cb_7 from commandbutton within w_sort_list
integer x = 928
integer y = 284
integer width = 101
integer height = 88
integer taborder = 100
integer textsize = -8
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

integer  li_Row,li_Count

li_Row = dw_sorted.getrow()

IF li_Row < 1 THEN return

li_Count = dw_sortcolumns.rowcount()
dw_sorted.rowsmove(li_Row,li_Row,primary!,dw_sortcolumns,li_Count+1,primary!)

dw_sortcolumns.sort()
end event

type cb_6 from commandbutton within w_sort_list
integer x = 928
integer y = 192
integer width = 101
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = ">>"
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

integer  li_Count

li_Count = dw_sorted.rowcount()
dw_sortcolumns.rowsmove(1,dw_sortcolumns.rowcount(),primary!,dw_sorted,li_Count+1,primary!)

IF li_Count < 1 THEN
	dw_sorted.selectrow(0,FALSE)
	dw_sorted.selectrow(1,TRUE)
END IF


end event

type cb_5 from commandbutton within w_sort_list
integer x = 928
integer y = 100
integer width = 101
integer height = 88
integer taborder = 10
integer textsize = -8
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

integer  li_Row,li_Count

li_Row = dw_sortcolumns.getrow()

IF li_Row < 1 THEN return

li_Count = dw_sorted.rowcount()
dw_sortcolumns.rowsmove(li_Row,li_Row,primary!,dw_sorted,li_Count+1,primary!)

dw_sorted.scrolltorow(dw_sorted.rowcount())
end event

type dw_sorted from datawindow within w_sort_list
integer x = 1065
integer y = 96
integer width = 1001
integer height = 620
integer taborder = 60
string title = "none"
string dataobject = "d_sort_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//====================================================================
// Event: rowfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	long	currentrow		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrowchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

IF currentrow > 0 THEN 
	this.selectrow(0,FALSE)
	this.selectrow(currentrow,TRUE)
END IF
end event

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer 	xpos		
//		value	integer 	ypos		
//		value	long    	row 		
//		value	dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnlbuttonclk]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

IF row > 0 THEN 
	this.scrolltorow(row)
END IF
end event

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer 	xpos		
//		value	integer 	ypos		
//		value	long    	row 		
//		value	dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnlbuttondblclk]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if row >0 then
   cb_7.triggerevent(clicked!)
end if
end event

type dw_sortcolumns from datawindow within w_sort_list
integer x = 32
integer y = 96
integer width = 873
integer height = 620
integer taborder = 20
string title = "none"
string dataobject = "d_sort_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer 	xpos		
//		value	integer 	ypos		
//		value	long    	row 		
//		value	dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnlbuttonclk]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

IF row > 0 THEN 
	this.scrolltorow(row)
END IF
end event

event rowfocuschanged;//====================================================================
// Event: rowfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	long	currentrow		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrowchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

IF currentrow > 0 THEN 
	this.selectrow(0,FALSE)
	this.selectrow(currentrow,TRUE)
END IF
end event

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer 	xpos		
//		value	integer 	ypos		
//		value	long    	row 		
//		value	dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnlbuttondblclk]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if row > 0 then
   cb_5.triggerevent(clicked!)
end if
end event

type cb_cancle from commandbutton within w_sort_list
integer x = 1710
integer y = 740
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

type cb_ok from commandbutton within w_sort_list
integer x = 1303
integer y = 740
integer width = 361
integer height = 100
integer taborder = 40
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

FOR li_i = 1 TO dw_sorted.rowcount()
	ls_SortColum = dw_sorted.getitemstring(li_i,'columnname')
	
	IF ls_SortColum = '' OR isnull(ls_SortColum) THEN continue
	
	ls_SortOrder = dw_sorted.getitemstring(li_i,'Sort_Order')
	
	IF ls_sortstring <> '' THEN
		ls_sortstring += ' '
	END IF
   
	ls_sortstring += ls_SortColum+" "+ls_SortOrder
NEXT

Closewithreturn(parent ,ls_sortstring)
end event

