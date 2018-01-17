$PBExportHeader$w_dw_sortstyle.srw
$PBExportComments$Multi Sort Style for datawindow
forward
global type w_dw_sortstyle from window
end type
type st_tip from statictext within w_dw_sortstyle
end type
type rb_3 from radiobutton within w_dw_sortstyle
end type
type rb_2 from radiobutton within w_dw_sortstyle
end type
type rb_1 from radiobutton within w_dw_sortstyle
end type
type cb_2 from commandbutton within w_dw_sortstyle
end type
type cb_1 from commandbutton within w_dw_sortstyle
end type
type st_1 from statictext within w_dw_sortstyle
end type
type cb_close from commandbutton within w_dw_sortstyle
end type
type dw_1 from datawindow within w_dw_sortstyle
end type
type gb_1 from groupbox within w_dw_sortstyle
end type
end forward

global type w_dw_sortstyle from window
integer x = 256
integer y = 264
integer width = 2565
integer height = 1492
boolean titlebar = true
string title = "Multiple Sort Styles"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
st_tip st_tip
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cb_2 cb_2
cb_1 cb_1
st_1 st_1
cb_close cb_close
dw_1 dw_1
gb_1 gb_1
end type
global w_dw_sortstyle w_dw_sortstyle

type variables

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
// Description:  Open script for w_highlight_dw_rows
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

on w_dw_sortstyle.create
this.st_tip=create st_tip
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_close=create cb_close
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_tip,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.cb_close,&
this.dw_1,&
this.gb_1}
end on

on w_dw_sortstyle.destroy
destroy(this.st_tip)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type st_tip from statictext within w_dw_sortstyle
integer x = 32
integer y = 1280
integer width = 2235
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Current sort expression is : "
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_dw_sortstyle
integer x = 887
integer y = 1140
integer width = 325
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "List Mode"
end type

type rb_2 from radiobutton within w_dw_sortstyle
integer x = 489
integer y = 1140
integer width = 352
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Multi Mode"
end type

type rb_1 from radiobutton within w_dw_sortstyle
integer x = 69
integer y = 1140
integer width = 379
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Single Mode"
boolean checked = true
end type

type cb_2 from commandbutton within w_dw_sortstyle
integer x = 1353
integer y = 1132
integer width = 357
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sort"
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
String   ls_Sort

If rb_1.Checked Then
	OpenWithParm(w_sort_single,dw_1)
ElseIf rb_2.Checked Then
	OpenWithParm(w_sort_multi,dw_1)
Else
	OpenWithParm(w_sort_list,dw_1)
End If


ls_Sort = Message.StringParm
If ls_Sort = '-1' Then Return
dw_1.SetSort(ls_Sort)
dw_1.Sort()
st_tip.Text = "Current sort expression is : "+ls_Sort

dw_1.ScrollToRow(dw_1.GetRow())

end event

type cb_1 from commandbutton within w_dw_sortstyle
integer x = 1742
integer y = 1132
integer width = 357
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
dw_1.Retrieve()

end event

type st_1 from statictext within w_dw_sortstyle
integer x = 37
integer y = 24
integer width = 2441
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "This shows three methods of sorting data by a response dialog window."
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_dw_sortstyle
integer x = 2130
integer y = 1132
integer width = 357
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
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
dw_1.saveas( )

end event

type dw_1 from datawindow within w_dw_sortstyle
integer x = 37
integer y = 124
integer width = 2441
integer height = 968
integer taborder = 30
string dataobject = "d_contact_list_protected"
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

type gb_1 from groupbox within w_dw_sortstyle
integer x = 32
integer y = 1096
integer width = 1257
integer height = 164
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
end type

