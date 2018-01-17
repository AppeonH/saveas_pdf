$PBExportHeader$w_sharedata.srw
forward
global type w_sharedata from window
end type
type cb_5 from commandbutton within w_sharedata
end type
type cb_4 from commandbutton within w_sharedata
end type
type cb_3 from commandbutton within w_sharedata
end type
type cb_2 from commandbutton within w_sharedata
end type
type cb_1 from commandbutton within w_sharedata
end type
type cb_close from commandbutton within w_sharedata
end type
type st_2 from statictext within w_sharedata
end type
type st_1 from statictext within w_sharedata
end type
type dw_2 from datawindow within w_sharedata
end type
type dw_1 from datawindow within w_sharedata
end type
end forward

global type w_sharedata from window
string tag = "ShareData Example"
integer width = 3035
integer height = 2076
boolean titlebar = true
string title = "Share DataWindow Buffers"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_close cb_close
st_2 st_2
st_1 st_1
dw_2 dw_2
dw_1 dw_1
end type
global w_sharedata w_sharedata

on w_sharedata.create
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_close=create cb_close
this.st_2=create st_2
this.st_1=create st_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_close,&
this.st_2,&
this.st_1,&
this.dw_2,&
this.dw_1}
end on

on w_sharedata.destroy
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Open script for w_sharedata
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	liuhongxin		Date: 2004/06/22
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Integer li_rc

this.x =0
this.y=0

dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()
li_rc = dw_1.ShareData(dw_2)
IF li_rc <> 1 THEN MessageBox("Share DW Failed",li_rc)
end event

type cb_5 from commandbutton within w_sharedata
integer x = 2578
integer y = 748
integer width = 370
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_2.saveas( )
end event

type cb_4 from commandbutton within w_sharedata
integer x = 2578
integer y = 504
integer width = 370
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 400
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
// Author: 	Administrator		Date: 2004/22/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer rtn
IF dw_1.ModifiedCount() > 0 THEN
	rtn = dw_1.update()
	IF rtn = 1 THEN
	    COMMIT USING SQLCA;
	ELSE
		 ROLLBACK USING SQLCA;
	END IF
END IF

end event

type cb_3 from commandbutton within w_sharedata
integer x = 2578
integer y = 384
integer width = 370
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add"
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
// Author: 	Administrator		Date: 2004/22/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long ll_Row
ll_Row = dw_1.InsertRow(0)
dw_1.ScrolltoRow(ll_Row)
dw_1.SetFocus()
dw_1.Setcolumn(1)
end event

type cb_2 from commandbutton within w_sharedata
integer x = 2578
integer y = 264
integer width = 370
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sharedata|OFF"
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
// Author: 	Administrator		Date: 2004/22/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer li_rc
IF this.Text = 'Sharedata' THEN
	this.Text = 'Sharedata|OFF'
	dw_1.ShareData(dw_2)
	li_rc = dw_1.ShareData(dw_2)
	IF li_rc <> 1 THEN MessageBox("Share DW Failed",li_rc)
ELSE
	this.Text = 'Sharedata'
	dw_1.ShareDataOff()
END IF
end event

type cb_1 from commandbutton within w_sharedata
integer x = 2578
integer y = 144
integer width = 370
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
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
// Author: 	Administrator		Date: 2004/22/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_1.retrieve()
end event

type cb_close from commandbutton within w_sharedata
integer x = 2578
integer y = 624
integer width = 370
integer height = 92
integer taborder = 40
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
// Author: 	Administrator		Date: 2004/22/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
CLOSE (Parent)

end event

type st_2 from statictext within w_sharedata
integer x = 41
integer y = 44
integer width = 2153
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Primary Grid DataWindow that watches for a row change - click on a different row"
boolean focusrectangle = false
end type

type st_1 from statictext within w_sharedata
integer x = 50
integer y = 1048
integer width = 2505
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Secondary Freeform DataWindow that scrolls to the appropriate row based on Primary DataWindow row change "
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_sharedata
integer x = 32
integer y = 1140
integer width = 2505
integer height = 780
integer taborder = 10
string dataobject = "d_customer_sharedata"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_sharedata
integer x = 32
integer y = 136
integer width = 2505
integer height = 888
integer taborder = 10
string dataobject = "d_customer_sharedata_main"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_2.ScrollToRow(currentrow)

dw_1.SelectRow(0, False)
dw_1.SelectRow(currentrow, TRUE)
end event

event clicked;//dw_2.ScrollToRow(row)

//dw_1.SelectRow(0, False)
//dw_1.SelectRow(row, TRUE)
end event

