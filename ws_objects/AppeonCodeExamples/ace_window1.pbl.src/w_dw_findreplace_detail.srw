$PBExportHeader$w_dw_findreplace_detail.srw
$PBExportComments$Find & Replace
forward
global type w_dw_findreplace_detail from window
end type
type cb_1 from commandbutton within w_dw_findreplace_detail
end type
type dw_1 from datawindow within w_dw_findreplace_detail
end type
end forward

global type w_dw_findreplace_detail from window
integer width = 1929
integer height = 1252
boolean titlebar = true
string title = "Customer Detail"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
dw_1 dw_1
end type
global w_dw_findreplace_detail w_dw_findreplace_detail

on w_dw_findreplace_detail.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_1}
end on

on w_dw_findreplace_detail.destroy
destroy(this.cb_1)
destroy(this.dw_1)
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
// Author: 	laihaichun		Date: 2004/04/01
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Long ll_custid
ll_custid = Message.DoubleParm
dw_1.SetTransObject(sqlca)
dw_1.Retrieve(ll_custid)

end event

type cb_1 from commandbutton within w_dw_findreplace_detail
integer x = 1527
integer y = 1024
integer width = 343
integer height = 104
integer taborder = 20
integer textsize = -8
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
// Author: 	laihaichun		Date: 2004/04/01
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type dw_1 from datawindow within w_dw_findreplace_detail
integer x = 41
integer y = 36
integer width = 1829
integer height = 948
integer taborder = 10
string title = "none"
string dataobject = "d_dw_find_detail"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

