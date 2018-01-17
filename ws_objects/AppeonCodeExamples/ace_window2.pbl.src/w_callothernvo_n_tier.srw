$PBExportHeader$w_callothernvo_n_tier.srw
forward
global type w_callothernvo_n_tier from window
end type
type st_2 from statictext within w_callothernvo_n_tier
end type
type cb_6 from commandbutton within w_callothernvo_n_tier
end type
type st_1 from statictext within w_callothernvo_n_tier
end type
type cb_5 from commandbutton within w_callothernvo_n_tier
end type
type cb_4 from commandbutton within w_callothernvo_n_tier
end type
type lb_1 from listbox within w_callothernvo_n_tier
end type
type cb_3 from commandbutton within w_callothernvo_n_tier
end type
type cb_2 from commandbutton within w_callothernvo_n_tier
end type
type cb_1 from commandbutton within w_callothernvo_n_tier
end type
type gb_1 from groupbox within w_callothernvo_n_tier
end type
end forward

global type w_callothernvo_n_tier from window
integer width = 2519
integer height = 1404
boolean titlebar = true
string title = "NVO Call Other Component "
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
cb_6 cb_6
st_1 st_1
cb_5 cb_5
cb_4 cb_4
lb_1 lb_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_callothernvo_n_tier w_callothernvo_n_tier

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

on w_callothernvo_n_tier.create
this.st_2=create st_2
this.cb_6=create cb_6
this.st_1=create st_1
this.cb_5=create cb_5
this.cb_4=create cb_4
this.lb_1=create lb_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.cb_6,&
this.st_1,&
this.cb_5,&
this.cb_4,&
this.lb_1,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_callothernvo_n_tier.destroy
destroy(this.st_2)
destroy(this.cb_6)
destroy(this.st_1)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.lb_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
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



if icn_conn.ConnectToServer()<>0 then
	MessageBox("Appeon Code Examples","Example window can not be opened, the possible reasons are: ~n&
1. Given UserID and Password are incorrect. ~n&
2. This Appeon Server does not support PowerBuilder NVOs.~n&
3. The connection to Appeon Server failed.~n&
4. The application server may not have PBVM11 installed!",exclamation!)
    destroy icn_conn
	close(this)
	return
end if

if icn_conn.CreateInstance(iuo_callserver,"appeon_callserver")<>0 then
	MessageBox("Appeon Code Examples","Example window can not be opened, the possible reasons are: ~n1. This Appeon Server does not support PowerBuilder NVOs.~n2. The connection to Appeon Server failed.~n3. The application server may not have PBVM11 installed!")
    destroy icn_conn
	close(this)
	return
end if



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

destroy icn_conn
destroy iuo_callserver
end event

type st_2 from statictext within w_callothernvo_n_tier
integer x = 69
integer y = 8
integer width = 2373
integer height = 60
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

type cb_6 from commandbutton within w_callothernvo_n_tier
integer x = 110
integer y = 908
integer width = 1179
integer height = 128
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "NVO Calling Function of EJB Component"
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

string ls_return
ls_return =  iuo_callserver.of_ejb()
lb_1.additem(string(lb_1.totalitems()+1) + '.' + ls_return)
end event

type st_1 from statictext within w_callothernvo_n_tier
integer x = 69
integer y = 76
integer width = 2382
integer height = 132
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "From a 3-tier NVO, you can call the instance variable or function of another NVO, or the function of a Java/CORBA component."
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_callothernvo_n_tier
integer x = 1559
integer y = 1176
integer width = 402
integer height = 96
integer taborder = 40
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

lb_1.reset()
end event

type cb_4 from commandbutton within w_callothernvo_n_tier
integer x = 2025
integer y = 1176
integer width = 402
integer height = 96
integer taborder = 30
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

type lb_1 from listbox within w_callothernvo_n_tier
integer x = 1408
integer y = 248
integer width = 1024
integer height = 896
integer taborder = 20
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

type cb_3 from commandbutton within w_callothernvo_n_tier
integer x = 110
integer y = 548
integer width = 1179
integer height = 128
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "NVO Calling Function of another NVO "
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
ls_return = string(lb_1.totalitems()+1) + '.' + iuo_callserver.of_callothernvofun()
lb_1.additem(ls_return)
end event

type cb_2 from commandbutton within w_callothernvo_n_tier
integer x = 110
integer y = 728
integer width = 1179
integer height = 128
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "NVO Calling Function of CORBA Component"
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
ls_return =  iuo_callserver.of_callcorba()
lb_1.additem(string(lb_1.totalitems()+1) + '.' + ls_return)
end event

type cb_1 from commandbutton within w_callothernvo_n_tier
integer x = 110
integer y = 368
integer width = 1179
integer height = 128
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "NVO Calling Instance Variable of another NVO"
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
ls_return = string(lb_1.totalitems()+1) + '.' + iuo_callserver.of_callothernvovar()
lb_1.additem(ls_return)


end event

type gb_1 from groupbox within w_callothernvo_n_tier
integer x = 55
integer y = 228
integer width = 1285
integer height = 916
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "NVO Calling Other Components"
end type

