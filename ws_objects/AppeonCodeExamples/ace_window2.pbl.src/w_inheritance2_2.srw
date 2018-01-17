$PBExportHeader$w_inheritance2_2.srw
forward
global type w_inheritance2_2 from w_inheritance2_1
end type
type cb_5 from commandbutton within w_inheritance2_2
end type
type cb_6 from commandbutton within w_inheritance2_2
end type
type cb_7 from commandbutton within w_inheritance2_2
end type
end forward

global type w_inheritance2_2 from w_inheritance2_1
integer width = 2565
string title = "Sales Order -- Level 2"
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
end type
global w_inheritance2_2 w_inheritance2_2

on w_inheritance2_2.create
int iCurrent
call super::create
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_5
this.Control[iCurrent+2]=this.cb_6
this.Control[iCurrent+3]=this.cb_7
end on

on w_inheritance2_2.destroy
call super::destroy
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
end on

type cb_2 from w_inheritance2_1`cb_2 within w_inheritance2_2
end type

type cb_1 from w_inheritance2_1`cb_1 within w_inheritance2_2
end type

type dw_1 from w_inheritance2_1`dw_1 within w_inheritance2_2
end type

type gb_1 from w_inheritance2_1`gb_1 within w_inheritance2_2
end type

type cb_5 from commandbutton within w_inheritance2_2
integer x = 2080
integer y = 416
integer width = 352
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update"
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

dw_1.accepttext()

if dw_1.update() = -1 then
	rollback ;
	MessageBox('Error','Failed to update database.',exclamation!)
else
	commit ;
end if
end event

type cb_6 from commandbutton within w_inheritance2_2
integer x = 2080
integer y = 184
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
string text = "Insert"
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

LONG ll_row
int li_id

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.setitem(ll_row , 'order_date' , today())
dw_1.setfocus()
dw_1.setrow(ll_row)
dw_1.setcolumn(1)



end event

type cb_7 from commandbutton within w_inheritance2_2
integer x = 2080
integer y = 300
integer width = 352
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete"
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

long ll_row

ll_row = dw_1.getrow()

if ll_row < 1 then return

dw_1.deleterow(ll_row)

dw_1.selectrow(dw_1.getrow(),TRUE)
end event

