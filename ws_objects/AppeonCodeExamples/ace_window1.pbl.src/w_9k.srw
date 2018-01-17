$PBExportHeader$w_9k.srw
forward
global type w_9k from window
end type
type cb_4 from uo_saveas within w_9k
end type
type cbx_1 from checkbox within w_9k
end type
type cb_3 from commandbutton within w_9k
end type
type st_2 from statictext within w_9k
end type
type st_1 from statictext within w_9k
end type
type dw_1 from datawindow within w_9k
end type
type cb_2 from commandbutton within w_9k
end type
type cb_1 from commandbutton within w_9k
end type
end forward

global type w_9k from window
integer width = 2350
integer height = 1680
boolean titlebar = true
string title = "9K Records DataWindow "
boolean controlmenu = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cbx_1 cbx_1
cb_3 cb_3
st_2 st_2
st_1 st_1
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_9k w_9k

on w_9k.create
this.cb_4=create cb_4
this.cbx_1=create cbx_1
this.cb_3=create cb_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_4,&
this.cbx_1,&
this.cb_3,&
this.st_2,&
this.st_1,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_9k.destroy
destroy(this.cb_4)
destroy(this.cbx_1)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
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
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

This.X = 0
This.Y = 0

dw_1.SetTransObject(sqlca)



end event

type cb_4 from uo_saveas within w_9k
integer x = 1829
integer y = 752
integer taborder = 30
end type

event clicked;call super::clicked;of_saveas(dw_1,cbx_1.checked)  
end event

type cbx_1 from checkbox within w_9k
integer x = 1815
integer y = 592
integer width = 457
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "pb"
end type

type cb_3 from commandbutton within w_9k
integer x = 1838
integer y = 412
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas"
end type

event clicked;dw_1.saveas()
end event

type st_2 from statictext within w_9k
integer x = 1838
integer y = 1308
integer width = 329
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Row Count:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_9k
integer x = 1838
integer y = 1404
integer width = 439
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_9k
integer x = 37
integer y = 32
integer width = 1646
integer height = 1500
integer taborder = 10
string title = "none"
string dataobject = "d_9k"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_9k
integer x = 1838
integer y = 256
integer width = 402
integer height = 112
integer taborder = 10
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
CLOSE(Parent)

end event

type cb_1 from commandbutton within w_9k
integer x = 1838
integer y = 96
integer width = 402
integer height = 112
integer taborder = 10
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
Long ll_rowcount
ll_rowcount = dw_1.Retrieve()
st_1.Text =  String(ll_rowcount)


end event

