$PBExportHeader$w_dw_headersort.srw
$PBExportComments$Click column title to sort data
forward
global type w_dw_headersort from window
end type
type cb_2 from commandbutton within w_dw_headersort
end type
type cb_1 from commandbutton within w_dw_headersort
end type
type st_1 from statictext within w_dw_headersort
end type
type cb_close from commandbutton within w_dw_headersort
end type
type dw_1 from datawindow within w_dw_headersort
end type
end forward

global type w_dw_headersort from window
integer x = 256
integer y = 264
integer width = 2560
integer height = 1500
boolean titlebar = true
string title = "Header Sort Technique"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
cb_2 cb_2
cb_1 cb_1
st_1 st_1
cb_close cb_close
dw_1 dw_1
end type
global w_dw_headersort w_dw_headersort

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
String   is_LastSortColumn = 'id',is_LastSortType = 'A'


end variables

event ue_postopen();//====================================================================
// Event: ue_postopen()
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

//////////////////////////////////////////////////////////////////////////////////////////////////
// ue_PostOpen script for w_hightlight_dw_rows
//////////////////////////////////////////////////////////////////////////////////////////////////

// Set the transaction object
dw_1.SetTransObject (sqlca)

// Retrieve the data
dw_1.Retrieve()




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

on w_dw_headersort.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_close=create cb_close
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_1,&
this.cb_close,&
this.dw_1}
end on

on w_dw_headersort.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type cb_2 from commandbutton within w_dw_headersort
integer x = 1193
integer y = 1252
integer width = 398
integer height = 108
integer taborder = 50
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

type cb_1 from commandbutton within w_dw_headersort
integer x = 1627
integer y = 1256
integer width = 398
integer height = 108
integer taborder = 40
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

type st_1 from statictext within w_dw_headersort
integer x = 32
integer y = 28
integer width = 2711
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "This example shows the method of sorting data by clicking column header."
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_dw_headersort
integer x = 2075
integer y = 1256
integer width = 398
integer height = 108
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

type dw_1 from datawindow within w_dw_headersort
integer x = 32
integer y = 108
integer width = 2441
integer height = 1112
integer taborder = 30
string dataobject = "d_contact_list_protected"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: This event will be the controlling event for all of the types of
//		Sorting that will be done.
//--------------------------------------------------------------------
// Arguments: 
//		integer 	xpos		
//		integer 	ypos		
//		long    	row 		
//		dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnlbuttonclk]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String	  ls_Name,ls_Sort

If row <> 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	Return
End If

ls_Name = dwo.Name
If RightA(ls_Name,2) <> '_t' Then Return
ls_Name = LeftA(ls_Name,LenA(ls_Name) - 2)
//If user clicks the same column header more than one times
If ls_Name = is_LastSortColumn Then
	//Change sort type
	If is_LastSortType = 'A' Then
		is_LastSortType = 'D'
	Else
		is_LastSortType = 'A'
	End If
Else //First click or click another column header 
	is_LastSortColumn = ls_Name
	is_LastSortType = 'A'
End If

//Set sort expression
ls_Sort = ls_Name +" " + is_LastSortType

This.SetSort(ls_Sort)
This.Sort()

end event

