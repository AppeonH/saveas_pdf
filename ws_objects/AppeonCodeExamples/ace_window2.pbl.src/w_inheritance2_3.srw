$PBExportHeader$w_inheritance2_3.srw
forward
global type w_inheritance2_3 from w_inheritance2_2
end type
type dw_2 from datawindow within w_inheritance2_3
end type
type cb_3 from commandbutton within w_inheritance2_3
end type
end forward

global type w_inheritance2_3 from w_inheritance2_2
string title = "Sales Order -- Level 3"
dw_2 dw_2
cb_3 cb_3
end type
global w_inheritance2_3 w_inheritance2_3

event open;call super::open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
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

dw_2.visible = false
dw_2.settransobject(sqlca)

end event

on w_inheritance2_3.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.cb_3
end on

on w_inheritance2_3.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.cb_3)
end on

type cb_2 from w_inheritance2_2`cb_2 within w_inheritance2_3
end type

type cb_1 from w_inheritance2_2`cb_1 within w_inheritance2_3
end type

type dw_1 from w_inheritance2_2`dw_1 within w_inheritance2_3
end type

type gb_1 from w_inheritance2_2`gb_1 within w_inheritance2_3
end type

type cb_5 from w_inheritance2_2`cb_5 within w_inheritance2_3
end type

type cb_6 from w_inheritance2_2`cb_6 within w_inheritance2_3
end type

type cb_7 from w_inheritance2_2`cb_7 within w_inheritance2_3
end type

type dw_2 from datawindow within w_inheritance2_3
boolean visible = false
integer width = 256
integer height = 224
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_inheritance2_report"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//====================================================================
// Event: constructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_constructor]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.setTransobject(SQLCA)
end event

type cb_3 from commandbutton within w_inheritance2_3
integer x = 2080
integer y = 532
integer width = 352
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
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

dw_2.retrieve()
dw_2.print()
end event

