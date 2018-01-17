$PBExportHeader$w_standard_ancestor2.srw
$PBExportComments$Ancestor window for standard windows(For listbox,listview,treeview)
forward
global type w_standard_ancestor2 from window
end type
type tab_1 from tab within w_standard_ancestor2
end type
type tabpage_1 from userobject within tab_1
end type
type cb_get from commandbutton within tabpage_1
end type
type cb_set from commandbutton within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type lb_propparm from listbox within tabpage_1
end type
type lb_prop from listbox within tabpage_1
end type
type sle_propparm from singlelineedit within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_get cb_get
cb_set cb_set
st_1 st_1
lb_propparm lb_propparm
lb_prop lb_prop
sle_propparm sle_propparm
end type
type tabpage_2 from userobject within tab_1
end type
type cb_execute from commandbutton within tabpage_2
end type
type sle_functionparm from singlelineedit within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type lb_function from listbox within tabpage_2
end type
type lb_functionparm from listbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_execute cb_execute
sle_functionparm sle_functionparm
st_2 st_2
lb_function lb_function
lb_functionparm lb_functionparm
end type
type tabpage_3 from userobject within tab_1
end type
type cb_4 from commandbutton within tabpage_3
end type
type cb_3 from commandbutton within tabpage_3
end type
type lb_out from listbox within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_4 cb_4
cb_3 cb_3
lb_out lb_out
end type
type tab_1 from tab within w_standard_ancestor2
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type cb_2 from commandbutton within w_standard_ancestor2
end type
type cb_1 from commandbutton within w_standard_ancestor2
end type
type st_tip from statictext within w_standard_ancestor2
end type
type gb_4 from groupbox within w_standard_ancestor2
end type
type gb_1 from groupbox within w_standard_ancestor2
end type
end forward

global type w_standard_ancestor2 from window
integer width = 2578
integer height = 1804
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_open ( )
tab_1 tab_1
cb_2 cb_2
cb_1 cb_1
st_tip st_tip
gb_4 gb_4
gb_1 gb_1
end type
global w_standard_ancestor2 w_standard_ancestor2

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
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Int iFlag = 0
String is_select_data,is_prop_data,is_fuction_data
Integer ii_x,ii_y,ii_width,ii_height

end variables

forward prototypes
public subroutine wf_additem (string as_data, listbox alst_ctrl)
public function integer wf_str2array (string as_data, ref string as_rv[])
public subroutine wf_random (string as_type, listbox alst)
public function string wf_get_type ()
end prototypes

event ue_open();
//st_tip.text="The control is CheckBox."
//ii_x=cbx_1.X
//ii_y=cbx_1.Y
//ii_width=cbx_1.Width
//ii_height=cbx_1.Height
//
//
//is_prop_data="BackColor,BorderStyle,Checked,Enabled,FaceName,Height,Italic&
//,Tag,Text,TextColor,TextSize,Underline,Visible,Weight,Width,X,Y"
//
//is_fuction_data="ClassName(),GetParent()&
//,Hide(),Move(),PostEvent(),Resize(),SetFocus(),SetPosition(),Show(),TriggerEvent()&
//,TypeOf()"
//
end event

public subroutine wf_additem (string as_data, listbox alst_ctrl);//====================================================================
// Function: wf_additem()
//--------------------------------------------------------------------
// Description: appeon item of data.
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_data  		
//		listbox	alst_ctrl		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long 	  ll_upperBound, ll_cur
String  ls_data[]
ll_upperBound = wf_str2array(as_data,ls_data)
For ll_cur = 1 To ll_upperBound
	alst_ctrl.AddItem(ls_data[ll_cur])
Next


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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
If IsNull(as_data) Or as_data = '' Then Return 0

Long		ll_startPos, ll_endPos, ll_upperBound

ll_upperBound = 1
ll_startPos = 1
ll_endPos     = PosA(as_data, ',', ll_startPos)
Do While ll_endPos <> 0
	as_rv[ll_upperBound] = MidA(as_data,ll_startPos,ll_endPos - ll_startPos)
	ll_startPos 	 = ll_endPos + 1
	ll_endPos 		 = PosA(as_data,',',ll_startPos)
	ll_upperBound 	 = ll_upperBound + 1
Loop
as_rv[ll_upperBound] = MidA(as_data,ll_startPos)
Return ll_upperBound

end function

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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String   ls_dataType[]
String	ls_parm, ls_booltmp
Long 		ll_parmNum, ll_cur
Integer  li_cnt
n_util   lnv_util
alst.Reset()
Choose Case Lower(as_type)
	Case 'boolean'
		alst.AddItem('True')
		alst.AddItem('False')
		Return
	Case 'weight'
		alst.AddItem('400')
		alst.AddItem('700')
		Return
End Choose
lnv_util = Create n_util
For li_cnt =  1 To 5
	
	ls_parm = ''
	ll_parmNum = wf_str2array(as_type, ls_dataType)
	For ll_cur = 1 To ll_parmNum
		ls_parm = ls_parm + ','+ lnv_util.of_make_arguments(ls_dataType[ll_cur],li_cnt) //wf_produce(ls_dataType[ll_cur])
	Next
	
	alst.AddItem(MidA(ls_parm, 2))
Next

end subroutine

public function string wf_get_type ();//====================================================================
// Function: wf_get_type()
//--------------------------------------------------------------------
// Description: choose color about table's background.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_type,ls_data
ls_data = tab_1.tabpage_1.lb_prop.SelectedItem()

Choose Case ls_data
	Case 'BackColor'
		ls_type = 'Color'
	Case  'Checked','Border','HasLines','HasButtons','DeleteItems'
		ls_type = 'boolean'
	Case  'Enabled','LinesAtRoot','EditLabels','CheckBoxes'
		ls_type = 'boolean'
	Case  'Height'
		ls_type = 'Integer'
	Case  'Italic'
		ls_type = 'Boolean'
	Case  'Tag'
		ls_type = 'String'
	Case  'Text'
		ls_type = 'String'
	Case  'TextColor'
		ls_type = 'Color'
	Case  'TextSize'
		ls_type = 'TSize'
	Case  'Underline'
		ls_type = 'Boolean'
	Case  'Visible'
		ls_type = 'Boolean'
	Case  'Weight'
		ls_type = 'Weight'
	Case  'Width'
		ls_type = 'Integer'
	Case  'X'
		ls_type = 'Integer'
	Case  'Y'
		ls_type = 'Integer'
End Choose
Return ls_type

end function

on w_standard_ancestor2.create
this.tab_1=create tab_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_tip=create st_tip
this.gb_4=create gb_4
this.gb_1=create gb_1
this.Control[]={this.tab_1,&
this.cb_2,&
this.cb_1,&
this.st_tip,&
this.gb_4,&
this.gb_1}
end on

on w_standard_ancestor2.destroy
destroy(this.tab_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_tip)
destroy(this.gb_4)
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.X = 0
This.Y = 0

This.Event ue_open()


wf_additem(is_prop_data,tab_1.tabpage_1.lb_prop)

wf_additem(is_fuction_data,tab_1.tabpage_2.lb_function)


end event

type tab_1 from tab within w_standard_ancestor2
integer x = 27
integer y = 548
integer width = 2464
integer height = 936
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
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 2427
integer height = 820
long backcolor = 67108864
string text = "Properties"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_get cb_get
cb_set cb_set
st_1 st_1
lb_propparm lb_propparm
lb_prop lb_prop
sle_propparm sle_propparm
end type

on tabpage_1.create
this.cb_get=create cb_get
this.cb_set=create cb_set
this.st_1=create st_1
this.lb_propparm=create lb_propparm
this.lb_prop=create lb_prop
this.sle_propparm=create sle_propparm
this.Control[]={this.cb_get,&
this.cb_set,&
this.st_1,&
this.lb_propparm,&
this.lb_prop,&
this.sle_propparm}
end on

on tabpage_1.destroy
destroy(this.cb_get)
destroy(this.cb_set)
destroy(this.st_1)
destroy(this.lb_propparm)
destroy(this.lb_prop)
destroy(this.sle_propparm)
end on

type cb_get from commandbutton within tabpage_1
integer x = 1755
integer y = 580
integer width = 325
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get"
end type

type cb_set from commandbutton within tabpage_1
integer x = 1755
integer y = 696
integer width = 325
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set"
end type

type st_1 from statictext within tabpage_1
integer x = 878
integer y = 624
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
integer x = 878
integer y = 24
integer width = 818
integer height = 560
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_propparm.Text = lb_propparm.SelectedItem()

end event

type lb_prop from listbox within tabpage_1
integer x = 23
integer y = 24
integer width = 818
integer height = 768
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type sle_propparm from singlelineedit within tabpage_1
integer x = 878
integer y = 708
integer width = 818
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
integer height = 820
long backcolor = 67108864
string text = "Functions"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_execute cb_execute
sle_functionparm sle_functionparm
st_2 st_2
lb_function lb_function
lb_functionparm lb_functionparm
end type

on tabpage_2.create
this.cb_execute=create cb_execute
this.sle_functionparm=create sle_functionparm
this.st_2=create st_2
this.lb_function=create lb_function
this.lb_functionparm=create lb_functionparm
this.Control[]={this.cb_execute,&
this.sle_functionparm,&
this.st_2,&
this.lb_function,&
this.lb_functionparm}
end on

on tabpage_2.destroy
destroy(this.cb_execute)
destroy(this.sle_functionparm)
destroy(this.st_2)
destroy(this.lb_function)
destroy(this.lb_functionparm)
end on

type cb_execute from commandbutton within tabpage_2
integer x = 1755
integer y = 696
integer width = 325
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Execute"
end type

type sle_functionparm from singlelineedit within tabpage_2
integer x = 878
integer y = 708
integer width = 818
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

type st_2 from statictext within tabpage_2
integer x = 878
integer y = 624
integer width = 553
integer height = 64
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

type lb_function from listbox within tabpage_2
integer x = 23
integer y = 24
integer width = 818
integer height = 768
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type lb_functionparm from listbox within tabpage_2
integer x = 878
integer y = 24
integer width = 818
integer height = 560
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_functionparm.Text = lb_functionparm.SelectedItem()

end event

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 2427
integer height = 820
long backcolor = 67108864
string text = "Event Order "
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_4 cb_4
cb_3 cb_3
lb_out lb_out
end type

on tabpage_3.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.lb_out=create lb_out
this.Control[]={this.cb_4,&
this.cb_3,&
this.lb_out}
end on

on tabpage_3.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.lb_out)
end on

type cb_4 from commandbutton within tabpage_3
integer x = 1755
integer y = 696
integer width = 402
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear Selected"
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long  ll
String  ls_text

For ll = lb_out.TotalItems() To 1 Step -1
	If lb_out.State(ll) = 1 Then
		lb_out.DeleteItem(ll)
	End If
Next

end event

type cb_3 from commandbutton within tabpage_3
integer x = 1755
integer y = 572
integer width = 402
integer height = 96
integer taborder = 100
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
lb_out.Reset()

end event

type lb_out from listbox within tabpage_3
integer x = 23
integer y = 24
integer width = 1673
integer height = 768
integer taborder = 90
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
boolean multiselect = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_standard_ancestor2
integer x = 2158
integer y = 1536
integer width = 325
integer height = 96
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
CLOSE(Parent)

end event

type cb_1 from commandbutton within w_standard_ancestor2
integer x = 1801
integer y = 216
integer width = 325
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
end type

type st_tip from statictext within w_standard_ancestor2
integer x = 59
integer y = 1548
integer width = 1984
integer height = 68
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

type gb_4 from groupbox within w_standard_ancestor2
integer x = 27
integer y = 1496
integer width = 2098
integer height = 136
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_standard_ancestor2
integer x = 27
integer y = 16
integer width = 2464
integer height = 512
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

