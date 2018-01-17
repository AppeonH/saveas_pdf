$PBExportHeader$w_systemfunction_n_tier.srw
forward
global type w_systemfunction_n_tier from window
end type
type st_3 from statictext within w_systemfunction_n_tier
end type
type st_4 from statictext within w_systemfunction_n_tier
end type
type st_2 from statictext within w_systemfunction_n_tier
end type
type cb_2 from commandbutton within w_systemfunction_n_tier
end type
type cbx_null from checkbox within w_systemfunction_n_tier
end type
type cb_clear from commandbutton within w_systemfunction_n_tier
end type
type lb_output from listbox within w_systemfunction_n_tier
end type
type st_tip from singlelineedit within w_systemfunction_n_tier
end type
type cb_1 from commandbutton within w_systemfunction_n_tier
end type
type lb_functionparm from listbox within w_systemfunction_n_tier
end type
type lb_functionname from listbox within w_systemfunction_n_tier
end type
type sle_functionparm from singlelineedit within w_systemfunction_n_tier
end type
type st_1 from statictext within w_systemfunction_n_tier
end type
type gb_1 from groupbox within w_systemfunction_n_tier
end type
type gb_4 from groupbox within w_systemfunction_n_tier
end type
type gb_2 from groupbox within w_systemfunction_n_tier
end type
end forward

global type w_systemfunction_n_tier from window
integer width = 2569
integer height = 1376
boolean titlebar = true
string title = "System Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
st_4 st_4
st_2 st_2
cb_2 cb_2
cbx_null cbx_null
cb_clear cb_clear
lb_output lb_output
st_tip st_tip
cb_1 cb_1
lb_functionparm lb_functionparm
lb_functionname lb_functionname
sle_functionparm sle_functionparm
st_1 st_1
gb_1 gb_1
gb_4 gb_4
gb_2 gb_2
end type
global w_systemfunction_n_tier w_systemfunction_n_tier

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Connection icn_conn
appeon_callserver iuo_callserver
end variables

forward prototypes
public subroutine wf_additem (string as_data, listbox alst_ctrl)
public function integer wf_str2array (string as_data, ref string as_rv[])
end prototypes

public subroutine wf_additem (string as_data, listbox alst_ctrl);//====================================================================
// Function: wf_additem()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_data  		
//		listbox	alst_ctrl		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long 	  ll_upperBound, ll_cur
string  ls_data[]
ll_upperBound = wf_str2array(as_data,ls_data)

for ll_cur = 1 to ll_upperBound
	alst_ctrl.AddItem(ls_data[ll_cur])
next
end subroutine

public function integer wf_str2array (string as_data, ref string as_rv[]);//====================================================================
// Function: wf_str2array()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		      	string	as_data		
//		ref   	string 	as_rv[]		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if isnull(as_data) or as_data = '' then return 0

long		ll_startPos, ll_endPos, ll_upperBound

ll_upperBound = 1
ll_startPos = 1
ll_endPos     = PosA(as_data, ',', ll_startPos)

do while ll_endPos <> 0
	as_rv[ll_upperBound] = MidA(as_data,ll_startPos,ll_endPos - ll_startPos)
	ll_startPos 	= ll_endPos + 1
	ll_endPos 		= PosA(as_data,',',ll_startPos)
	ll_upperBound 	= ll_upperBound + 1
loop
as_rv[ll_upperBound] = MidA(as_data,ll_startPos)
return ll_upperBound
end function

on w_systemfunction_n_tier.create
this.st_3=create st_3
this.st_4=create st_4
this.st_2=create st_2
this.cb_2=create cb_2
this.cbx_null=create cbx_null
this.cb_clear=create cb_clear
this.lb_output=create lb_output
this.st_tip=create st_tip
this.cb_1=create cb_1
this.lb_functionparm=create lb_functionparm
this.lb_functionname=create lb_functionname
this.sle_functionparm=create sle_functionparm
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_4=create gb_4
this.gb_2=create gb_2
this.Control[]={this.st_3,&
this.st_4,&
this.st_2,&
this.cb_2,&
this.cbx_null,&
this.cb_clear,&
this.lb_output,&
this.st_tip,&
this.cb_1,&
this.lb_functionparm,&
this.lb_functionname,&
this.sle_functionparm,&
this.st_1,&
this.gb_1,&
this.gb_4,&
this.gb_2}
end on

on w_systemfunction_n_tier.destroy
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.cbx_null)
destroy(this.cb_clear)
destroy(this.lb_output)
destroy(this.st_tip)
destroy(this.cb_1)
destroy(this.lb_functionparm)
destroy(this.lb_functionname)
destroy(this.sle_functionparm)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_4)
destroy(this.gb_2)
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
// Author: 	laihaichun		Date: 2004/01/03
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

destroy icn_conn
destroy iuo_callserver
end event

type st_3 from statictext within w_systemfunction_n_tier
integer x = 46
integer y = 16
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

type st_4 from statictext within w_systemfunction_n_tier
integer x = 46
integer y = 80
integer width = 2441
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example shows we can workaround unsupported PowerBuilder system functions by moving them into 3-tier NVO."
boolean focusrectangle = false
end type

type st_2 from statictext within w_systemfunction_n_tier
integer x = 1682
integer y = 912
integer width = 489
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Last Return Value:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_systemfunction_n_tier
integer x = 2089
integer y = 1108
integer width = 366
integer height = 100
integer taborder = 60
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type cbx_null from checkbox within w_systemfunction_n_tier
integer x = 983
integer y = 1128
integer width = 215
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Null"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

If this.Checked then 
	lb_functionparm.enabled = false 
	sle_functionparm.enabled = false 
else 
	lb_functionparm.enabled = true 
	sle_functionparm.enabled = true 
end if
end event

type cb_clear from commandbutton within w_systemfunction_n_tier
integer x = 1678
integer y = 1108
integer width = 366
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear All"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_OutPut.Reset()
end event

type lb_output from listbox within w_systemfunction_n_tier
integer x = 1673
integer y = 268
integer width = 782
integer height = 624
integer taborder = 50
integer textsize = -8
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
boolean extendedselect = true
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

st_tip.text = This.SelectedItem()
end event

type st_tip from singlelineedit within w_systemfunction_n_tier
integer x = 1673
integer y = 992
integer width = 782
integer height = 92
integer taborder = 50
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

type cb_1 from commandbutton within w_systemfunction_n_tier
integer x = 1216
integer y = 1108
integer width = 352
integer height = 100
integer taborder = 50
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string strtip , strexevalue, strtestvalue
string strar[]
int parmnumber


strtestvalue = sle_functionparm.text
parmnumber = wf_str2array(strtestvalue,strar)

if isnull(strtestvalue) then strtestvalue = ''

if lb_functionname.SelectedIndex() < 0 then	
	messagebox('Warning','Please select testing function.')
	return
end if

IF cbx_null.checked Then 
	Else		
		if strtestvalue = '' and lb_functionparm.totalItems() > 0 then
			messagebox('Warning','Please select testing data.')
			return
		end if
End IF

strexevalue = iuo_callserver.of_systemfunction(lb_functionname.selecteditem())

If isNull(strexevalue) then strexevalue = 'NULL'

strtip =  "Return value is " + strexevalue + "."
st_tip.text = strtip

lb_OutPut.Additem(String(lb_OutPut.TotalItems())+".Return value:  "+strexevalue)
end event

type lb_functionparm from listbox within w_systemfunction_n_tier
integer x = 983
integer y = 268
integer width = 585
integer height = 624
integer taborder = 40
integer textsize = -8
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

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

sle_functionparm.text = lb_functionparm.selecteditem()
end event

type lb_functionname from listbox within w_systemfunction_n_tier
integer x = 82
integer y = 280
integer width = 782
integer height = 928
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
string item[] = {"GetCurrentDirectory","GetEnvironment","Randomize"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_functionparm.reset()
sle_functionparm.enabled = true
sle_functionparm.text = ''
string strleft

cbx_null.checked = false
sle_functionparm.enabled = true
lb_functionparm.enabled = TRUE

choose case lb_functionname.selecteditem()
	case 'GetCurrentDirectory'
		sle_functionparm.enabled = false
		lb_functionparm.reset()		
		return
		
	case 'GetEnvironment'
		sle_functionparm.enabled = false
		lb_functionparm.reset()		
		return
		
	case 'Randomize'
		sle_functionparm.enabled = false
		lb_functionparm.reset()		
		return	
		
end choose



end event

type sle_functionparm from singlelineedit within w_systemfunction_n_tier
integer x = 983
integer y = 992
integer width = 585
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_systemfunction_n_tier
integer x = 983
integer y = 908
integer width = 590
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Function Parameter:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_systemfunction_n_tier
integer x = 41
integer y = 200
integer width = 864
integer height = 1048
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Functions"
end type

type gb_4 from groupbox within w_systemfunction_n_tier
integer x = 928
integer y = 200
integer width = 690
integer height = 1048
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test Data"
end type

type gb_2 from groupbox within w_systemfunction_n_tier
integer x = 1641
integer y = 200
integer width = 855
integer height = 1048
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Output"
end type

