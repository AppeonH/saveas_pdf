$PBExportHeader$w_calldll_n_tier.srw
forward
global type w_calldll_n_tier from window
end type
type st_1 from statictext within w_calldll_n_tier
end type
type cb_5 from commandbutton within w_calldll_n_tier
end type
type cb_4 from commandbutton within w_calldll_n_tier
end type
type cb_3 from commandbutton within w_calldll_n_tier
end type
type lb_2 from listbox within w_calldll_n_tier
end type
type lb_1 from listbox within w_calldll_n_tier
end type
type mle_1 from multilineedit within w_calldll_n_tier
end type
type gb_1 from groupbox within w_calldll_n_tier
end type
type gb_2 from groupbox within w_calldll_n_tier
end type
type gb_3 from groupbox within w_calldll_n_tier
end type
end forward

global type w_calldll_n_tier from window
integer width = 2857
integer height = 1768
boolean titlebar = true
string title = "NVO Call Dll"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
lb_2 lb_2
lb_1 lb_1
mle_1 mle_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_calldll_n_tier w_calldll_n_tier

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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Connection icn_conn
appeon_callserver iuo_callserver
end variables

on w_calldll_n_tier.create
this.st_1=create st_1
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.lb_2=create lb_2
this.lb_1=create lb_1
this.mle_1=create mle_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.st_1,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.lb_2,&
this.lb_1,&
this.mle_1,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_calldll_n_tier.destroy
destroy(this.st_1)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.lb_2)
destroy(this.lb_1)
destroy(this.mle_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================


string ls_parm

This.X = 0
This.Y = 0

open(w_easerver_profiles)
ls_parm = message.stringparm

if ls_parm='' then
	close(this)
	return
end if

icn_conn = Create Connection
icn_conn.Driver = "jaguar"
icn_conn.Application = gs_ServerPackage
icn_conn.Location = profilestring(gs_IniFileName,ls_parm,"servername","localhost")+":"+profilestring(gs_IniFileName,ls_parm,"port","9989")
icn_conn.UserID = profilestring(gs_IniFileName,ls_parm,"username","jagadmin")
icn_conn.Password = profilestring(gs_IniFileName,ls_parm,"password","")


If icn_conn.ConnectToServer() <> 0 Then
	MessageBox("Appeon Code Examples","Example window can not be opened, the possible reasons are: ~n&
1. Given UserID and Password are incorrect. ~n&
2. This Appeon Server does not support PowerBuilder NVOs.~n&
3. The connection to Appeon Server failed.~n&
4. The application server may not have PBVM11 installed!",exclamation!)
	Destroy icn_conn
	CLOSE(This)
	Return
End If

If icn_conn.CreateInstance(iuo_callserver,"appeon_callserver") <> 0 Then
	MessageBox("Appeon Code Examples","Example window can not be opened, the possible reasons are: ~n1. This Appeon Server does not support PowerBuilder NVOs.~n2. The connection to Appeon Server failed.~n3. The application server may not have PBVM11 installed!")
	Destroy icn_conn
	CLOSE(This)
	Return
End If

mle_1.Text = "Function uint GetSystemDirectory(ref string lpBuffer,uint uSize) alias for GetWindowDirectoryA Library 'kernel32.dll'" + "~r~n" +&
	"Function ulong GetCurrentDirectoryA(ulong nBufferLength,ref string lpBuffer) alias for GetCurrentDirectoryA Library 'kernel32.dll'" + "~r~n" +&
	"Function boolean GetUserName(ref string lpBuffer, ref ulong nSize) alias for GetUserNameA library 'advapi32.dll'"




end event

event close;//====================================================================
// Event: close()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_close]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

destroy iuo_callserver
destroy icn_conn

end event

type st_1 from statictext within w_calldll_n_tier
integer x = 50
integer y = 4
integer width = 1591
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example applies only to Appeon Server versions which support NVO."
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_calldll_n_tier
integer x = 1006
integer y = 984
integer width = 352
integer height = 104
integer taborder = 30
integer textsize = -9
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
// Author: 	laihaichun		Date: 2004/01/02
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

ls_return = iuo_callserver.of_calldll(lb_1.selecteditem())
ls_return = string(lb_2.totalitems()+1) + '.' + ls_return
lb_2.additem(ls_return)
end event

type cb_4 from commandbutton within w_calldll_n_tier
integer x = 2427
integer y = 1544
integer width = 352
integer height = 96
integer taborder = 40
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Close(parent)
end event

type cb_3 from commandbutton within w_calldll_n_tier
integer x = 2034
integer y = 1544
integer width = 352
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
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

lb_2.reset()
end event

type lb_2 from listbox within w_calldll_n_tier
integer x = 1435
integer y = 712
integer width = 1317
integer height = 764
integer taborder = 30
integer textsize = -9
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

type lb_1 from listbox within w_calldll_n_tier
integer x = 73
integer y = 712
integer width = 864
integer height = 764
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
string item[] = {"GetSystemDirectory","GetCurrentDirectory","GetUserName"}
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_calldll_n_tier
integer x = 73
integer y = 132
integer width = 2679
integer height = 476
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_calldll_n_tier
integer x = 32
integer y = 68
integer width = 2757
integer height = 576
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Define Local External Function in NVO"
end type

type gb_2 from groupbox within w_calldll_n_tier
integer x = 32
integer y = 648
integer width = 942
integer height = 864
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Function"
end type

type gb_3 from groupbox within w_calldll_n_tier
integer x = 1394
integer y = 648
integer width = 1390
integer height = 864
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Result"
end type

