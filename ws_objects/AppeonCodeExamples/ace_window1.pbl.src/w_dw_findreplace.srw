$PBExportHeader$w_dw_findreplace.srw
$PBExportComments$Find & Replace
forward
global type w_dw_findreplace from window
end type
type sle_1 from singlelineedit within w_dw_findreplace
end type
type st_2 from statictext within w_dw_findreplace
end type
type cb_2 from commandbutton within w_dw_findreplace
end type
type cb_3 from commandbutton within w_dw_findreplace
end type
type cb_1 from commandbutton within w_dw_findreplace
end type
type st_1 from statictext within w_dw_findreplace
end type
type cb_close from commandbutton within w_dw_findreplace
end type
type dw_1 from datawindow within w_dw_findreplace
end type
type gb_1 from groupbox within w_dw_findreplace
end type
end forward

global type w_dw_findreplace from window
integer x = 256
integer y = 264
integer width = 2633
integer height = 1632
boolean titlebar = true
string title = "Find Data in a DataWindow"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
sle_1 sle_1
st_2 st_2
cb_2 cb_2
cb_3 cb_3
cb_1 cb_1
st_1 st_1
cb_close cb_close
dw_1 dw_1
gb_1 gb_1
end type
global w_dw_findreplace w_dw_findreplace

type variables

end variables

event ue_postopen();//====================================================================
// Event: ue_postopen()
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

//////////////////////////////////////////////////////////////////////////////////////////////////
// ue_PostOpen script for w_hightlight_dw_rows
//////////////////////////////////////////////////////////////////////////////////////////////////

// Set the transaction object
dw_1.SetTransObject (sqlca)

// Retrieve the data
dw_1.Retrieve('%')




end event

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Open script for w_highlight_dw_rows
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

// Post event to retrieve data on postopen (allow window to open faster)
This.X = 0
This.Y = 0

This.Post Event  ue_postopen()

end event

on w_dw_findreplace.create
this.sle_1=create sle_1
this.st_2=create st_2
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_close=create cb_close
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.sle_1,&
this.st_2,&
this.cb_2,&
this.cb_3,&
this.cb_1,&
this.st_1,&
this.cb_close,&
this.dw_1,&
this.gb_1}
end on

on w_dw_findreplace.destroy
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type sle_1 from singlelineedit within w_dw_findreplace
integer x = 457
integer y = 1364
integer width = 361
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_dw_findreplace
integer x = 78
integer y = 1372
integer width = 343
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "First Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_dw_findreplace
integer x = 864
integer y = 1360
integer width = 375
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Search"
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
string ls_arg
ls_arg = trim(sle_1.text) + '%'
dw_1.retrieve(ls_arg)


end event

type cb_3 from commandbutton within w_dw_findreplace
integer x = 1326
integer y = 1356
integer width = 375
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Find"
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
OpenWithParm(w_dw_find,dw_1)

end event

type cb_1 from commandbutton within w_dw_findreplace
integer x = 1746
integer y = 1356
integer width = 375
integer height = 96
integer taborder = 40
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
dw_1.Reset()
dw_1.Retrieve('%')

end event

type st_1 from statictext within w_dw_findreplace
integer x = 37
integer y = 32
integer width = 1678
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "This example shows how to find data in a datawindow."
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_dw_findreplace
integer x = 2167
integer y = 1356
integer width = 375
integer height = 96
integer taborder = 10
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

type dw_1 from datawindow within w_dw_findreplace
integer x = 37
integer y = 120
integer width = 2501
integer height = 1144
integer taborder = 30
string dataobject = "d_cust_findreplace"
boolean hscrollbar = true
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
If currentrow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(currentrow,True)
End If

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
// Author: 	laihaichun		Date: 2004/04/01
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
long ll_custid

if row<=0 then Return
ll_custid = This.GetItemNumber(row, 'id')

OpenWithParm(w_dw_findreplace_detail,ll_custid)
end event

type gb_1 from groupbox within w_dw_findreplace
integer x = 46
integer y = 1284
integer width = 1230
integer height = 204
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Search by First Name"
end type

