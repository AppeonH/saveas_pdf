$PBExportHeader$w_sales_order.srw
$PBExportComments$Sales Order for Inheritance
forward
global type w_sales_order from window
end type
type st_1 from statictext within w_sales_order
end type
type lb_1 from listbox within w_sales_order
end type
type cb_ok from commandbutton within w_sales_order
end type
type cb_cancel from commandbutton within w_sales_order
end type
end forward

global type w_sales_order from window
integer x = 882
integer y = 488
integer width = 1390
integer height = 692
boolean titlebar = true
string title = "Sales Order"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_1 st_1
lb_1 lb_1
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_sales_order w_sales_order

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: select the first item in the language choices listbox
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y = 0

lb_1.SelectItem (1)
end event

on w_sales_order.create
this.st_1=create st_1
this.lb_1=create lb_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.Control[]={this.st_1,&
this.lb_1,&
this.cb_ok,&
this.cb_cancel}
end on

on w_sales_order.destroy
destroy(this.st_1)
destroy(this.lb_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

type st_1 from statictext within w_sales_order
integer x = 32
integer y = 28
integer width = 983
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Select a window to open:"
boolean focusrectangle = false
end type

type lb_1 from listbox within w_sales_order
integer x = 32
integer y = 108
integer width = 1303
integer height = 356
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean vscrollbar = true
boolean sorted = false
string item[] = {"Level 1--Sales Order - ( ancestor window )","Level 2--Sales Order With Insert & Delete - ( inherited )","Level 3--Sales Order With Print - ( inherited )"}
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbndblclk]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

cb_ok.TriggerEvent (clicked!)
end event

type cb_ok from commandbutton within w_sales_order
integer x = 649
integer y = 492
integer width = 320
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Open"
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

choose case lb_1.selectedIndex()
	case 1
		Open (w_inheritance2_1)

	case 2
		Open(w_inheritance2_2)

	case 3
		Open (w_inheritance2_3)

end choose
end event

type cb_cancel from commandbutton within w_sales_order
integer x = 1015
integer y = 492
integer width = 320
integer height = 92
integer taborder = 10
integer textsize = -9
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close (parent)
end event

