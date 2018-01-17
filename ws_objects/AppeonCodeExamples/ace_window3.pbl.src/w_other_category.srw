$PBExportHeader$w_other_category.srw
$PBExportComments$Example showing how to create an "other" category on a graph
forward
global type w_other_category from window
end type
type cb_1 from commandbutton within w_other_category
end type
type cb_print from commandbutton within w_other_category
end type
type cb_close from commandbutton within w_other_category
end type
type dw_1 from datawindow within w_other_category
end type
end forward

global type w_other_category from window
integer x = 215
integer y = 188
integer width = 2551
integer height = 1560
boolean titlebar = true
string title = "Adding an ~'Other~' Category to Graph"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
cb_print cb_print
cb_close cb_close
dw_1 dw_1
end type
global w_other_category w_other_category

event open;// initial value
this.x = 0
this.y = 0
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

end event

on w_other_category.create
this.cb_1=create cb_1
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.cb_print,&
this.cb_close,&
this.dw_1}
end on

on w_other_category.destroy
destroy(this.cb_1)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_other_category
integer x = 2176
integer y = 364
integer width = 274
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
boolean cancel = true
end type

event clicked;dw_1.saveas( )
end event

type cb_print from commandbutton within w_other_category
integer x = 2176
integer y = 120
integer width = 274
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print..."
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
OpenWithParm(w_dw_print_options, dw_1)

If Message.DoubleParm = -1 Then Return
dw_1.Print(True)

end event

type cb_close from commandbutton within w_other_category
integer x = 2176
integer y = 248
integer width = 274
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type dw_1 from datawindow within w_other_category
integer x = 32
integer y = 36
integer width = 2075
integer height = 1376
string dataobject = "d_other_category"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

