$PBExportHeader$w_uo_dw_record.srw
forward
global type w_uo_dw_record from window
end type
type cb_1 from commandbutton within w_uo_dw_record
end type
type dw_1 from datawindow within w_uo_dw_record
end type
type uo_1 from u_dw_ribbon_2 within w_uo_dw_record
end type
end forward

global type w_uo_dw_record from window
integer width = 2816
integer height = 1612
boolean titlebar = true
string title = "Maintain DataWindow with UserObject"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
dw_1 dw_1
uo_1 uo_1
end type
global w_uo_dw_record w_uo_dw_record

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

integer i_row
end variables

on w_uo_dw_record.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.uo_1=create uo_1
this.Control[]={this.cb_1,&
this.dw_1,&
this.uo_1}
end on

on w_uo_dw_record.destroy
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.uo_1)
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

dw_1.settransobject(sqlca)
//Initialize Datawindwo
uo_1.uf_setdw(dw_1)
//initialize buttons
uo_1.uf_set_buttons(true,false,false,false,false,false,false,false)
end event

type cb_1 from commandbutton within w_uo_dw_record
integer x = 2450
integer y = 212
integer width = 329
integer height = 216
integer taborder = 120
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "saveas"
end type

event clicked;dw_1.saveas( )
end event

type dw_1 from datawindow within w_uo_dw_record
integer x = 41
integer y = 216
integer width = 2405
integer height = 1244
integer taborder = 110
string dataobject = "d_cust"
boolean hscrollbar = true
boolean vscrollbar = true
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

i_row = this.GetRow()
if i_row < 1 then return
this.SelectRow (0, false)			// Turn off previous highlight
this.SelectRow (i_row, true)		// Highlight current row
uo_1.uf_set_buttons(true,true,true,true,true,true,true,true)

end event

type uo_1 from u_dw_ribbon_2 within w_uo_dw_record
integer x = 41
integer y = 32
integer taborder = 100
end type

on uo_1.destroy
call u_dw_ribbon_2::destroy
end on

event close;call super::close;//====================================================================
// Event: close()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

