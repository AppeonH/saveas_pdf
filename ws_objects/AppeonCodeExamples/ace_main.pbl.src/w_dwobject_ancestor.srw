$PBExportHeader$w_dwobject_ancestor.srw
$PBExportComments$Ancestor window for standard windows
forward
global type w_dwobject_ancestor from window
end type
type gb_1 from groupbox within w_dwobject_ancestor
end type
type mle_1 from multilineedit within w_dwobject_ancestor
end type
type tab_1 from tab within w_dwobject_ancestor
end type
type tabpage_1 from userobject within tab_1
end type
type dw_2 from datawindow within tabpage_1
end type
type cb_get from commandbutton within tabpage_1
end type
type cb_set from commandbutton within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type lb_propparm from listbox within tabpage_1
end type
type sle_propparm from singlelineedit within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_2 dw_2
cb_get cb_get
cb_set cb_set
st_1 st_1
lb_propparm lb_propparm
sle_propparm sle_propparm
end type
type tabpage_2 from userobject within tab_1
end type
type cb_4 from commandbutton within tabpage_2
end type
type cb_3 from commandbutton within tabpage_2
end type
type mle_2 from multilineedit within tabpage_2
end type
type gb_2 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_4 cb_4
cb_3 cb_3
mle_2 mle_2
gb_2 gb_2
end type
type tab_1 from tab within w_dwobject_ancestor
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type cb_2 from commandbutton within w_dwobject_ancestor
end type
type gb_4 from groupbox within w_dwobject_ancestor
end type
type dw_1 from datawindow within w_dwobject_ancestor
end type
type cb_1 from commandbutton within w_dwobject_ancestor
end type
end forward

global type w_dwobject_ancestor from window
integer width = 2578
integer height = 2292
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_open ( )
event ue_initialize ( )
gb_1 gb_1
mle_1 mle_1
tab_1 tab_1
cb_2 cb_2
gb_4 gb_4
dw_1 dw_1
cb_1 cb_1
end type
global w_dwobject_ancestor w_dwobject_ancestor

type variables

String is_obj_name

n_util   inv_util
end variables

forward prototypes
public subroutine wf_random (string as_type, listbox alst)
public subroutine wf_additem (long al_row, datawindow ad_dw)
end prototypes

event ue_open();//====================================================================
// Event: ue_open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (None)
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
long ll_pos
string ls_fc

ll_pos = PosA(is_obj_name,'_')
ls_fc = LeftA(is_obj_name,(ll_pos - 1))

tab_1.tabpage_1.dw_2.dataobject = 'd_dwobject_list'
tab_1.tabpage_1.dw_2.setfilter('fc ="'+ls_fc +'" and fu = "1"' )
tab_1.tabpage_1.dw_2.filter()

tab_1.tabpage_1.dw_2.event rowfocuschanged(1)
tab_1.tabpage_1.dw_2.Object.DataWindow.ReadOnly ='yes'
end event

event ue_initialize();//====================================================================
// Event: ue_initialize()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (None)
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
inv_util = Create n_util

//is_obj_name = 'p_1' //picture


end event

public subroutine wf_random (string as_type, listbox alst);//====================================================================
// Function: wf_random()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_type		
//		listbox	alst   		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/18
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

String	ls_parm
Long 		ll_pos

alst.Reset()
ll_pos = PosA(is_obj_name,'_')
ls_parm = LeftA(is_obj_name,(ll_pos - 1))
inv_util.of_array_to_string(as_type,ls_parm,alst)
	

end subroutine

public subroutine wf_additem (long al_row, datawindow ad_dw);////--------------------------------------------------------------------
//// Description: return property
////--------------------------------------------------------------------
//// Arguments: (none)
////--------------------------------------------------------------------
//// Returns: string
////--------------------------------------------------------------------
//// Author:xunengli 	 		Date: 2004/10/18
////--------------------------------------------------------------------
//// Modify History: 
////	
////--------------------------------------------------------------------
//// CopyRight 2004----???? Appeon Inc.
////====================================================================
string ls_prop,ls_type,ls_modify

ls_prop = lower(ad_dw.object.data[al_row,2])
ls_modify = ad_dw.object.data[al_row,3]

wf_random (ls_prop,tab_1.tabpage_1.lb_propparm)

if ls_modify = '1' then
	tab_1.tabpage_1.cb_set.Enabled = True
else
	tab_1.tabpage_1.cb_set.Enabled = False
end if

tab_1.tabpage_1.sle_propparm.Text = ''
end subroutine

on w_dwobject_ancestor.create
this.gb_1=create gb_1
this.mle_1=create mle_1
this.tab_1=create tab_1
this.cb_2=create cb_2
this.gb_4=create gb_4
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.gb_1,&
this.mle_1,&
this.tab_1,&
this.cb_2,&
this.gb_4,&
this.dw_1,&
this.cb_1}
end on

on w_dwobject_ancestor.destroy
destroy(this.gb_1)
destroy(this.mle_1)
destroy(this.tab_1)
destroy(this.cb_2)
destroy(this.gb_4)
destroy(this.dw_1)
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
// Author:xunengli 	 		Date: 2004/10/18
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
This.X = 0
This.Y = 0

This.Event ue_initialize()

This.Event ue_open()



end event

event close;if isvalid(inv_util) then
	Destroy inv_util
end if
end event

type gb_1 from groupbox within w_dwobject_ancestor
integer x = 73
integer y = 144
integer width = 2391
integer height = 680
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type mle_1 from multilineedit within w_dwobject_ancestor
integer x = 73
integer y = 1928
integer width = 1961
integer height = 188
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_dwobject_ancestor
integer x = 37
integer y = 32
integer width = 2464
integer height = 1828
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 2427
integer height = 1712
long backcolor = 67108864
string text = "Properties"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_2 dw_2
cb_get cb_get
cb_set cb_set
st_1 st_1
lb_propparm lb_propparm
sle_propparm sle_propparm
end type

on tabpage_1.create
this.dw_2=create dw_2
this.cb_get=create cb_get
this.cb_set=create cb_set
this.st_1=create st_1
this.lb_propparm=create lb_propparm
this.sle_propparm=create sle_propparm
this.Control[]={this.dw_2,&
this.cb_get,&
this.cb_set,&
this.st_1,&
this.lb_propparm,&
this.sle_propparm}
end on

on tabpage_1.destroy
destroy(this.dw_2)
destroy(this.cb_get)
destroy(this.cb_set)
destroy(this.st_1)
destroy(this.lb_propparm)
destroy(this.sle_propparm)
end on

type dw_2 from datawindow within tabpage_1
integer x = 27
integer y = 724
integer width = 1006
integer height = 968
integer taborder = 50
string title = "none"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//====================================================================
// Event: rowfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrowchange]
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
if currentrow <= 0 then return 

this.selectrow( 0,false)
this.selectrow(currentrow,True)
wf_additem(currentrow,this)

end event

type cb_get from commandbutton within tabpage_1
integer x = 2048
integer y = 1440
integer width = 352
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get"
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
// Author:xunengli 	 		Date: 2004/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_prop,ls_value
long ll_row,ll_rowcount

ll_rowcount = tab_1.tabpage_1.dw_2.rowcount() 
ll_row = tab_1.tabpage_1.dw_2.getrow()

if ll_row > 0 and ll_rowcount > 0 then
	ls_prop = tab_1.tabpage_1.dw_2.getitemstring(ll_row,'fp')
	ls_value = dw_1.Describe(is_obj_name + "." + ls_prop)
else
	MessageBox('Warning','Please select testing property.')
	Return
end if

ls_value = inv_util.of_convert_to_upper(ls_value)
mle_1.Text = "The " + is_obj_name +"'s "+ls_prop+" property is "+ls_value+"."
end event

type cb_set from commandbutton within tabpage_1
integer x = 2048
integer y = 1576
integer width = 352
integer height = 108
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set"
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
// Author:xunengli 	 		Date: 2004/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_param,ls_prop,ls_modify,ls_rtn
long ll_row,ll_rowcount,ll_pos

ll_row = tab_1.tabpage_1.dw_2.getrow()
ll_rowcount = tab_1.tabpage_1.dw_2.rowcount()

If ll_rowcount > 0 and ll_row <= 0 Then	
	MessageBox('Warning','Please select testing property.')
	Return
End If
 
ls_prop = tab_1.tabpage_1.dw_2.getitemstring(ll_row,'fp')
ls_Param = Trim(sle_propparm.Text)
ll_pos = PosA(ls_Param,' ')
if ll_pos > 0 then
	ls_param = LeftA(ls_param,(ll_pos - 1))
end if
If ls_Param = '' or LenA(ls_param) <0 Then	
	MessageBox('Warning','Please select testing data.')
	Return
End If

ls_modify = is_obj_name+"."+ls_prop + "= '"+ls_Param+"'"
ls_rtn = dw_1.Modify(ls_modify)

if ls_rtn <>'' then
	messagebox('Warning','Modify returns an error occurs.')
	Return 
end if
cb_get.postevent(clicked!)
end event

type st_1 from statictext within tabpage_1
integer x = 1079
integer y = 1600
integer width = 256
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Set Value:"
boolean focusrectangle = false
end type

type lb_propparm from listbox within tabpage_1
integer x = 1065
integer y = 720
integer width = 942
integer height = 832
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
string item[] = {""}
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
// Author:xunengli 	 		Date: 2004/10/18
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
If Index > 0 Then
	sle_propparm.Text  = This.Text(Index)
End If

end event

type sle_propparm from singlelineedit within tabpage_1
integer x = 1344
integer y = 1592
integer width = 663
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2427
integer height = 1712
long backcolor = 67108864
string text = "Create"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_4 cb_4
cb_3 cb_3
mle_2 mle_2
gb_2 gb_2
end type

on tabpage_2.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.mle_2=create mle_2
this.gb_2=create gb_2
this.Control[]={this.cb_4,&
this.cb_3,&
this.mle_2,&
this.gb_2}
end on

on tabpage_2.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.mle_2)
destroy(this.gb_2)
end on

type cb_4 from commandbutton within tabpage_2
integer x = 2048
integer y = 1440
integer width = 352
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Destroy"
end type

event clicked;string ls_rtn

ls_rtn = dw_1.Modify("destroy " + is_obj_name)

if ls_rtn <>'' then
	cb_1.triggerevent(clicked!)
	mle_1.text = '1. fail'
	mle_1.text +='2. '+ls_rtn	
else
	mle_1.text ='1. succeeds'
end if
end event

type cb_3 from commandbutton within tabpage_2
integer x = 2048
integer y = 1572
integer width = 352
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Create"
end type

type mle_2 from multilineedit within tabpage_2
integer x = 69
integer y = 772
integer width = 1893
integer height = 868
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within tabpage_2
integer x = 18
integer y = 700
integer width = 1993
integer height = 984
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Syntax"
end type

type cb_2 from commandbutton within w_dwobject_ancestor
integer x = 2130
integer y = 2052
integer width = 366
integer height = 108
integer taborder = 30
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
// Author:xunengli 	 		Date: 2004/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
CLOSE(Parent)

end event

type gb_4 from groupbox within w_dwobject_ancestor
integer x = 27
integer y = 1860
integer width = 2053
integer height = 296
integer taborder = 60
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

type dw_1 from datawindow within w_dwobject_ancestor
integer x = 123
integer y = 200
integer width = 2290
integer height = 588
integer taborder = 40
boolean bringtotop = true
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_dwobject_ancestor
integer x = 2103
integer y = 1436
integer width = 352
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
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
// Author:xunengli 	 		Date: 2004/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
dw_1.dataobject=dw_1.dataobject
dw_1.insertrow(0)
end event

