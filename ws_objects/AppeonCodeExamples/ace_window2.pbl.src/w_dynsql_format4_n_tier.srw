$PBExportHeader$w_dynsql_format4_n_tier.srw
forward
global type w_dynsql_format4_n_tier from window
end type
type st_1 from statictext within w_dynsql_format4_n_tier
end type
type cbx_1 from checkbox within w_dynsql_format4_n_tier
end type
type mle_1 from multilineedit within w_dynsql_format4_n_tier
end type
type cb_1 from commandbutton within w_dynsql_format4_n_tier
end type
type gb_7 from groupbox within w_dynsql_format4_n_tier
end type
type gb_5 from groupbox within w_dynsql_format4_n_tier
end type
type gb_1 from groupbox within w_dynsql_format4_n_tier
end type
type lb_1 from listbox within w_dynsql_format4_n_tier
end type
type sle_9 from singlelineedit within w_dynsql_format4_n_tier
end type
type cb_5 from commandbutton within w_dynsql_format4_n_tier
end type
end forward

global type w_dynsql_format4_n_tier from window
integer width = 1760
integer height = 1040
boolean titlebar = true
string title = "Dynamic SQL Format 4"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cbx_1 cbx_1
mle_1 mle_1
cb_1 cb_1
gb_7 gb_7
gb_5 gb_5
gb_1 gb_1
lb_1 lb_1
sle_9 sle_9
cb_5 cb_5
end type
global w_dynsql_format4_n_tier w_dynsql_format4_n_tier

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

Connection i_conn
appeon_distributed_service invo_dll
end variables

on w_dynsql_format4_n_tier.create
this.st_1=create st_1
this.cbx_1=create cbx_1
this.mle_1=create mle_1
this.cb_1=create cb_1
this.gb_7=create gb_7
this.gb_5=create gb_5
this.gb_1=create gb_1
this.lb_1=create lb_1
this.sle_9=create sle_9
this.cb_5=create cb_5
this.Control[]={this.st_1,&
this.cbx_1,&
this.mle_1,&
this.cb_1,&
this.gb_7,&
this.gb_5,&
this.gb_1,&
this.lb_1,&
this.sle_9,&
this.cb_5}
end on

on w_dynsql_format4_n_tier.destroy
destroy(this.st_1)
destroy(this.cbx_1)
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.gb_7)
destroy(this.gb_5)
destroy(this.gb_1)
destroy(this.lb_1)
destroy(this.sle_9)
destroy(this.cb_5)
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

i_conn = Create Connection
i_conn.Driver = "jaguar"
i_conn.Application = gs_ServerPackage
i_conn.Location = profilestring(gs_IniFileName,ls_parm,"servername","localhost")+":"+profilestring(gs_IniFileName,ls_parm,"port","9989")
i_conn.UserID = profilestring(gs_IniFileName,ls_parm,"username","jagadmin")
i_conn.Password = profilestring(gs_IniFileName,ls_parm,"password","")



if i_conn.ConnectToServer()<>0 then
	MessageBox("Appeon Code Examples","Example window can not be opened, the possible reasons are: ~n&
1. Given UserID and Password are incorrect. ~n&
2. This Appeon Server does not support PowerBuilder NVOs.~n&
3. The connection to Appeon Server failed.~n&
4. The application server may not have PBVM11 installed!",exclamation!)
    destroy i_conn
	close(this)
	return
end if

if i_conn.CreateInstance(invo_dll,"appeon_distributed_service")<>0 then
	MessageBox("Appeon Code Examples","Example window can not be opened, the possible reasons are: ~n1. This Appeon Server does not support PowerBuilder NVOs.~n2. The connection to Appeon Server failed.~n3. The application server may not have PBVM11 installed!")
    destroy i_conn
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

destroy i_conn
destroy invo_dll
end event

type st_1 from statictext within w_dynsql_format4_n_tier
integer x = 32
integer y = 8
integer width = 1591
integer height = 52
integer textsize = -8
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

type cbx_1 from checkbox within w_dynsql_format4_n_tier
integer x = 78
integer y = 832
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Center"
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

if this.checked then
	parent.center=true
end if
end event

type mle_1 from multilineedit within w_dynsql_format4_n_tier
integer x = 78
integer y = 508
integer width = 1550
integer height = 244
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_dynsql_format4_n_tier
integer x = 1339
integer y = 820
integer width = 343
integer height = 92
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type gb_7 from groupbox within w_dynsql_format4_n_tier
integer x = 658
integer y = 72
integer width = 1024
integer height = 368
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Get Employee Name"
end type

type gb_5 from groupbox within w_dynsql_format4_n_tier
integer x = 41
integer y = 72
integer width = 594
integer height = 368
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Employee ID"
end type

type gb_1 from groupbox within w_dynsql_format4_n_tier
integer x = 41
integer y = 444
integer width = 1641
integer height = 348
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SQL Syntax"
end type

type lb_1 from listbox within w_dynsql_format4_n_tier
integer x = 78
integer y = 136
integer width = 512
integer height = 268
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string item[] = {"105","184","586","888"}
borderstyle borderstyle = stylelowered!
end type

type sle_9 from singlelineedit within w_dynsql_format4_n_tier
integer x = 709
integer y = 312
integer width = 530
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within w_dynsql_format4_n_tier
integer x = 1271
integer y = 312
integer width = 343
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
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

string ls_employeeid,ls_fname,ls_lname,sqlstatement

ls_employeeid=lb_1.SelectedItem()

if isnull(ls_employeeid) or LenA(trim(ls_employeeid))=0 then
	MessageBox("Appeon","Please select an employee ID.")
	return -1
end if

sqlstatement = "SELECT emp_fname,emp_lname FROM employee WHERE emp_id = ?"

sle_9.text=invo_dll.of_dynsqlformat4(ls_employeeid)
mle_1.text=sqlstatement




end event

