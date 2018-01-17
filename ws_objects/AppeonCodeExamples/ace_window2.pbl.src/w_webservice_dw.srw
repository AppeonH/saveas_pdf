$PBExportHeader$w_webservice_dw.srw
forward
global type w_webservice_dw from window
end type
type cb_6 from commandbutton within w_webservice_dw
end type
type cb_4 from commandbutton within w_webservice_dw
end type
type st_1 from statictext within w_webservice_dw
end type
type cb_5 from commandbutton within w_webservice_dw
end type
type cb_3 from commandbutton within w_webservice_dw
end type
type cb_2 from commandbutton within w_webservice_dw
end type
type cb_1 from commandbutton within w_webservice_dw
end type
type dw_1 from datawindow within w_webservice_dw
end type
end forward

global type w_webservice_dw from window
integer width = 2930
integer height = 1708
boolean titlebar = true
string title = "Web Service Data Source DataWindow"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_6 cb_6
cb_4 cb_4
st_1 st_1
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_webservice_dw w_webservice_dw

type variables
wsconnection ws_1
end variables

on w_webservice_dw.create
this.cb_6=create cb_6
this.cb_4=create cb_4
this.st_1=create st_1
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_6,&
this.cb_4,&
this.st_1,&
this.cb_5,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_webservice_dw.destroy
destroy(this.cb_6)
destroy(this.cb_4)
destroy(this.st_1)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;string ls_parm
integer ii_return


open(w_iis_profiles)
ls_parm = message.stringparm

if ls_parm='' then
	close(this)
	return
end if


ws_1 = create wsconnection
ws_1.endpoint = "http://"+profilestring(gs_IniFileName,ls_parm,"servername","localhost")+":"+profilestring(gs_IniFileName,ls_parm,"port","80")+"/webservice_ace/webservice_ace.asmx"
ii_return = dw_1.setwsobject (ws_1)

If ii_return = -1 Then
	MessageBox("Appeon Code Examples","Example window can not be opened, the possible reasons are: ~n&
1. This Appeon Server does not support Web Service Data Source DataWindow.~n&
2. The connection to IIS failed.",exclamation!)
	Destroy ws_1
	CLOSE(This)
	Return
End If

end event

event close;Destroy ws_1
end event

type cb_6 from commandbutton within w_webservice_dw
integer x = 731
integer y = 1476
integer width = 338
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas( )
end event

type cb_4 from commandbutton within w_webservice_dw
integer x = 2519
integer y = 1472
integer width = 338
integer height = 100
integer taborder = 20
integer textsize = -9
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
// Author: 	Appeon		Date: 2010/03/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2010----???? Appeon Inc.
//====================================================================
Close(parent)
end event

type st_1 from statictext within w_webservice_dw
integer x = 41
integer y = 16
integer width = 1641
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example applies only to Appeon Server versions which support DotNet."
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_webservice_dw
integer x = 2167
integer y = 1472
integer width = 338
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
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
// Author: 	Appeon		Date: 2010/03/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2010----???? Appeon Inc.
//====================================================================
dw_1.update()
end event

type cb_3 from commandbutton within w_webservice_dw
integer x = 1815
integer y = 1472
integer width = 338
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
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
// Author: 	Appeon		Date: 2010/03/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2010----???? Appeon Inc.
//====================================================================
dw_1.deleterow(dw_1.getrow())
end event

type cb_2 from commandbutton within w_webservice_dw
integer x = 1463
integer y = 1472
integer width = 338
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
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
// Author: 	Appeon		Date: 2010/03/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2010----???? Appeon Inc.
//====================================================================
long ll_row
ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.setrow(ll_row)
dw_1.setcolumn(ll_row)
end event

type cb_1 from commandbutton within w_webservice_dw
integer x = 1111
integer y = 1472
integer width = 338
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
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
// Author: 	Appeon		Date: 2010/03/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2010----???? Appeon Inc.
//====================================================================
dw_1.retrieve()
end event

type dw_1 from datawindow within w_webservice_dw
integer x = 37
integer y = 120
integer width = 2821
integer height = 1324
integer taborder = 10
string title = "none"
string dataobject = "d_webservice_grid"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

