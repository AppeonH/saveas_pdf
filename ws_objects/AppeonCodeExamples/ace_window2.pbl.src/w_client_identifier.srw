$PBExportHeader$w_client_identifier.srw
forward
global type w_client_identifier from window
end type
type cb_3 from commandbutton within w_client_identifier
end type
type cb_4 from commandbutton within w_client_identifier
end type
type lb_1 from listbox within w_client_identifier
end type
type lb_2 from listbox within w_client_identifier
end type
type cb_5 from commandbutton within w_client_identifier
end type
type gb_1 from groupbox within w_client_identifier
end type
type gb_4 from groupbox within w_client_identifier
end type
end forward

global type w_client_identifier from window
integer width = 2615
integer height = 1444
boolean titlebar = true
string title = "Appeon Functions"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_4 cb_4
lb_1 lb_1
lb_2 lb_2
cb_5 cb_5
gb_1 gb_1
gb_4 gb_4
end type
global w_client_identifier w_client_identifier

on w_client_identifier.create
this.cb_3=create cb_3
this.cb_4=create cb_4
this.lb_1=create lb_1
this.lb_2=create lb_2
this.cb_5=create cb_5
this.gb_1=create gb_1
this.gb_4=create gb_4
this.Control[]={this.cb_3,&
this.cb_4,&
this.lb_1,&
this.lb_2,&
this.cb_5,&
this.gb_1,&
this.gb_4}
end on

on w_client_identifier.destroy
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.lb_1)
destroy(this.lb_2)
destroy(this.cb_5)
destroy(this.gb_1)
destroy(this.gb_4)
end on

event open;//====================================================================
// Event: Open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_Open]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/05/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

X = 0
Y = 0
end event

type cb_3 from commandbutton within w_client_identifier
integer x = 1856
integer y = 1216
integer width = 325
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
end type

event clicked;lb_2.reset()
end event

type cb_4 from commandbutton within w_client_identifier
integer x = 2203
integer y = 1216
integer width = 325
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close(parent)
end event

type lb_1 from listbox within w_client_identifier
integer x = 91
integer y = 88
integer width = 1143
integer height = 1060
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
string item[] = {"appeongetappeonusername","appeongetbrowserversion","appeongetclientip","appeongetclientid","appeongetclienttype","appeongetostype"}
borderstyle borderstyle = stylelowered!
end type

type lb_2 from listbox within w_client_identifier
integer x = 1371
integer y = 88
integer width = 1143
integer height = 1060
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within w_client_identifier
integer x = 1509
integer y = 1216
integer width = 325
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Execute"
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
// Author: 	zhouchaoqun		Date: 2005/05/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string ls_return

if lb_1.SelectedIndex() < 0 then
	messagebox('Warning','Please select testing function.')
	return
end if

ls_return=lb_1.selecteditem()
ls_return=MidA(ls_return,10,LenA(ls_return))+"="

choose case  lb_1.SelectedIndex()
	case 1
		ls_return+=appeongetappeonusername ()
	case 2
		ls_return+=appeongetbrowserversion ()
	case 3
		ls_return+=appeongetclientip ()
	case	4
		ls_return+=appeongetclientid ()
   case 5
		ls_return+=appeongetclienttype ()
	case 6	
		ls_return+=appeongetostype ()
end choose

ls_return = string(lb_2.totalitems()+1) + '.' + ls_return
lb_2.additem(ls_return)
end event

type gb_1 from groupbox within w_client_identifier
integer x = 55
integer y = 16
integer width = 1230
integer height = 1164
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Function "
end type

type gb_4 from groupbox within w_client_identifier
integer x = 1326
integer y = 16
integer width = 1230
integer height = 1164
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Result"
end type

