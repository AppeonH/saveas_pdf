$PBExportHeader$w_distributed_dw.srw
forward
global type w_distributed_dw from window
end type
type dw_1 from appeondatawindow within w_distributed_dw
end type
type cb_1 from commandbutton within w_distributed_dw
end type
type cb_6 from commandbutton within w_distributed_dw
end type
type cb_7 from commandbutton within w_distributed_dw
end type
type cb_8 from commandbutton within w_distributed_dw
end type
type cb_9 from commandbutton within w_distributed_dw
end type
type cb_10 from commandbutton within w_distributed_dw
end type
type st_1 from statictext within w_distributed_dw
end type
type rb_1 from radiobutton within w_distributed_dw
end type
type rb_2 from radiobutton within w_distributed_dw
end type
type rb_3 from radiobutton within w_distributed_dw
end type
type rb_4 from radiobutton within w_distributed_dw
end type
type st_2 from statictext within w_distributed_dw
end type
type cb_set from commandbutton within w_distributed_dw
end type
type cb_get from commandbutton within w_distributed_dw
end type
type em_1 from editmask within w_distributed_dw
end type
type cb_call from commandbutton within w_distributed_dw
end type
type gb_3 from groupbox within w_distributed_dw
end type
type gb_1 from groupbox within w_distributed_dw
end type
end forward

global type w_distributed_dw from window
integer width = 2528
integer height = 1856
boolean titlebar = true
string title = "Distributed DataWindow"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
cb_1 cb_1
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
cb_10 cb_10
st_1 st_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
st_2 st_2
cb_set cb_set
cb_get cb_get
em_1 em_1
cb_call cb_call
gb_3 gb_3
gb_1 gb_1
end type
global w_distributed_dw w_distributed_dw

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
appeon_distributed_service i_distributed_service
String ls_full,ls_change
end variables

forward prototypes
public function integer of_checkip ()
public subroutine wf_setenabled (string as_arg)
end prototypes

public function integer of_checkip ();//====================================================================
// Function: of_checkip()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/05/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string ls_sub
long ll_sub

ls_sub=MidA(em_1.text,1,3)
ll_sub=long(ls_sub)

if ll_sub<1 or ll_sub>254 then		
	return -1
end if	

ls_sub=MidA(em_1.text,5,3)
ll_sub=long(ls_sub)

if ll_sub<0 or ll_sub>254 then		
	return -1
end if	

ls_sub=MidA(em_1.text,9,3)
ll_sub=long(ls_sub)

if ll_sub<0 or ll_sub>254 then			
	return -1
end if	

ls_sub=MidA(em_1.text,13,3)
ll_sub=long(ls_sub)

if ll_sub<1 or ll_sub>254 then			
	return -1
end if	

return 1

end function

public subroutine wf_setenabled (string as_arg);//====================================================================
// Function: wf_setenabled()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	string	as_arg		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/05/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Choose Case as_arg
	Case 'grid','tabular'
		cb_6.Enabled = True
		cb_7.Enabled = True
		cb_8.Enabled = True
		cb_9.Enabled = True
		cb_10.Enabled = True
	Case Else
		cb_6.Enabled = False
		cb_7.Enabled = False
		cb_8.Enabled = False
		cb_9.Enabled = False
		cb_10.Enabled = False
End Choose

end subroutine

on w_distributed_dw.create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.cb_10=create cb_10
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.st_2=create st_2
this.cb_set=create cb_set
this.cb_get=create cb_get
this.em_1=create em_1
this.cb_call=create cb_call
this.gb_3=create gb_3
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.cb_1,&
this.cb_6,&
this.cb_7,&
this.cb_8,&
this.cb_9,&
this.cb_10,&
this.st_1,&
this.rb_1,&
this.rb_2,&
this.rb_3,&
this.rb_4,&
this.st_2,&
this.cb_set,&
this.cb_get,&
this.em_1,&
this.cb_call,&
this.gb_3,&
this.gb_1}
end on

on w_distributed_dw.destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.cb_10)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_2)
destroy(this.cb_set)
destroy(this.cb_get)
destroy(this.em_1)
destroy(this.cb_call)
destroy(this.gb_3)
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
// Author: 	zhouchaoqun		Date: 2005/05/23
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_ip,ls_parm
Int li_count


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



If i_conn.ConnectToServer() <> 0 Then
	MessageBox("Appeon Code Examples","Example window can not be opened, the possible reasons are: ~n&
1. Given UserID and Password are incorrect. ~n&
2. This Appeon Server does not support PowerBuilder NVOs.~n&
3. The connection to Appeon Server failed.~n&
4. The application server may not have PBVM11 installed!",exclamation!)
	Destroy i_conn
	CLOSE(This)
	Return
End If

If i_conn.CreateInstance(i_distributed_service,"appeon_distributed_service") <> 0 Then
	MessageBox("Appeon Code Examples","Example window can not be opened, the possible reasons are: ~n1. This Appeon Server does not support PowerBuilder NVOs.~n2. The connection to Appeon Server failed.~n3. The application server may not have PBVM11 installed!")
	Destroy i_conn
	CLOSE(This)
	Return
End If

ls_parm = message.stringparm
if ls_parm = '1' then
	this.x = 300
	this.y = 300
	this.height = 1640
else
	ls_ip = i_distributed_service.of_parseip(appeongetclientip())
	i_distributed_service.of_setforbidip(ls_ip)
	em_1.Text = ls_ip
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
// Author: 	zhouchaoqun		Date: 2005/05/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

destroy i_distributed_service
destroy i_conn

end event

type dw_1 from appeondatawindow within w_distributed_dw
integer x = 41
integer y = 324
integer width = 2432
integer height = 1084
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
end type

type cb_1 from commandbutton within w_distributed_dw
integer x = 2144
integer y = 1432
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas"
end type

event clicked;dw_1.saveas( )

end event

type cb_6 from commandbutton within w_distributed_dw
integer x = 882
integer y = 1432
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Insert Row"
end type

event clicked;long ll_Row

ll_Row = dw_1.InsertRow(dw_1.GetRow())
dw_1.ScrollToRow(ll_Row)
dw_1.SetFocus()

end event

type cb_7 from commandbutton within w_distributed_dw
integer x = 41
integer y = 1432
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update"
end type

event clicked;long ll_rtn
blob lb_data

dw_1.AcceptText()
dw_1.GetChanges(lb_data)
ll_rtn = i_distributed_service.of_update(dw_1.DataObject,lb_data)

If ll_rtn <> 1 Then
	MessageBox("Appeon Code Examples","Update Failed")
Else
	dw_1.ResetUpdate()
End If

end event

type cb_8 from commandbutton within w_distributed_dw
integer x = 462
integer y = 1432
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Row"
end type

event clicked;long ll_Row

ll_Row = dw_1.InsertRow(0)
dw_1.ScrollToRow(ll_Row)
dw_1.SetFocus()


end event

type cb_9 from commandbutton within w_distributed_dw
integer x = 1303
integer y = 1432
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Row"
end type

event clicked;dw_1.DeleteRow(dw_1.GetRow())

end event

type cb_10 from commandbutton within w_distributed_dw
integer x = 1723
integer y = 1432
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
end type

event clicked;dw_1.Reset()

end event

type st_1 from statictext within w_distributed_dw
integer x = 41
integer y = 72
integer width = 1883
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The DataWindow uses SetFullState for data retrieve and GetChanges for data update. "
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_distributed_dw
integer x = 160
integer y = 212
integer width = 421
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grid"
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
blob lb_data

wf_setenabled('grid')
lb_data = i_distributed_service.of_retrieve('d_distributed_grid')
dw_1.SetFullState(lb_data)
dw_1.SetTransObject(SQLCA)
end event

type rb_2 from radiobutton within w_distributed_dw
integer x = 699
integer y = 212
integer width = 421
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tabular"
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
blob lb_data

wf_setenabled('tabular')
lb_data = i_distributed_service.of_retrieve('d_retrieve_cust')
dw_1.SetFullState(lb_data)
dw_1.SetTransObject(SQLCA)
end event

type rb_3 from radiobutton within w_distributed_dw
integer x = 1271
integer y = 212
integer width = 421
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Graph"
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
blob lb_data

wf_setenabled('graph')
lb_data = i_distributed_service.of_retrieve('d_distributed_graph')
dw_1.SetFullState(lb_data)
dw_1.SetTransObject(SQLCA)
end event

type rb_4 from radiobutton within w_distributed_dw
integer x = 1865
integer y = 212
integer width = 421
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Group"
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
blob lb_data

wf_setenabled('group')
lb_data = i_distributed_service.of_retrieve('d_distributed_group')
dw_1.SetFullState(lb_data)
dw_1.SetTransObject(SQLCA)
end event

type st_2 from statictext within w_distributed_dw
integer x = 46
integer y = 8
integer width = 2222
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example applies only to Appeon Server versions which support Distributed DataWindow functions."
boolean focusrectangle = false
end type

type cb_set from commandbutton within w_distributed_dw
integer x = 1230
integer y = 1620
integer width = 475
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "set"
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
// Author: 	zhouchaoqun		Date: 2005/05/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if of_checkIp()=-1 then
  messagebox("appeon","Ip is Invalid")	
  em_1.setfocus()
  return 
end if	

i_distributed_service.of_setForbidIp(em_1.text)
end event

type cb_get from commandbutton within w_distributed_dw
integer x = 718
integer y = 1620
integer width = 475
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "get "
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
// Author: 	zhouchaoqun		Date: 2005/05/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

em_1.text=i_distributed_service.of_getForbidIp()
end event

type em_1 from editmask within w_distributed_dw
integer x = 82
integer y = 1620
integer width = 603
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "000000000000"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "###.###.###.###"
end type

type cb_call from commandbutton within w_distributed_dw
integer x = 1742
integer y = 1620
integer width = 699
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Call Component"
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
// Author: 	zhouchaoqun		Date: 2005/05/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
window   win
string ls_ip

ls_ip=appeongetclientip()

if i_distributed_service.of_ipisforbid(ls_ip)=1 then 
   messagebox("Appeon",ls_ip+" is forbidden")
else	
	opensheetwithparm(win,'1',"w_distributed_dw",w_main_frame,0,Original!)	
end if
end event

type gb_3 from groupbox within w_distributed_dw
integer x = 37
integer y = 1560
integer width = 2450
integer height = 192
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Forbidden IP"
end type

type gb_1 from groupbox within w_distributed_dw
integer x = 37
integer y = 144
integer width = 2437
integer height = 164
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "DataWindow Presentation Styles"
end type

