$PBExportHeader$w_style_uos.srw
$PBExportComments$This window contains 2 User Objects, one inherited from the other. It shows extending, overriding and calling ancestor scripts.
forward
global type w_style_uos from window
end type
type uo_2 from u_style_descendant within w_style_uos
end type
type cb_close from commandbutton within w_style_uos
end type
type uo_1 from u_style_ancestor within w_style_uos
end type
type gb_2 from groupbox within w_style_uos
end type
type gb_1 from groupbox within w_style_uos
end type
end forward

global type w_style_uos from window
integer x = 617
integer y = 216
integer width = 1563
integer height = 712
boolean titlebar = true
string title = "Text Style Changer"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
uo_2 uo_2
cb_close cb_close
uo_1 uo_1
gb_2 gb_2
gb_1 gb_1
end type
global w_style_uos w_style_uos

on w_style_uos.create
this.uo_2=create uo_2
this.cb_close=create cb_close
this.uo_1=create uo_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.uo_2,&
this.cb_close,&
this.uo_1,&
this.gb_2,&
this.gb_1}
end on

on w_style_uos.destroy
destroy(this.uo_2)
destroy(this.cb_close)
destroy(this.uo_1)
destroy(this.gb_2)
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

this.x = 0
this.y = 0

end event

type uo_2 from u_style_descendant within w_style_uos
integer x = 114
integer y = 412
integer width = 955
integer height = 120
boolean border = false
end type

on uo_2.destroy
call u_style_descendant::destroy
end on

type cb_close from commandbutton within w_style_uos
integer x = 1184
integer y = 460
integer width = 288
integer height = 104
integer taborder = 10
integer textsize = -8
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close (parent)
end event

type uo_1 from u_style_ancestor within w_style_uos
integer x = 114
integer y = 116
integer width = 978
integer height = 128
boolean border = false
end type

on uo_1.destroy
call u_style_ancestor::destroy
end on

type gb_2 from groupbox within w_style_uos
integer x = 73
integer y = 340
integer width = 1047
integer height = 224
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 78682240
string text = "Inherited User Object"
end type

type gb_1 from groupbox within w_style_uos
integer x = 73
integer y = 48
integer width = 1047
integer height = 224
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 78682240
string text = "User Object"
end type

