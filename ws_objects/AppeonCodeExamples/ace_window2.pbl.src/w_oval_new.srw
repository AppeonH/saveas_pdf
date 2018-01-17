$PBExportHeader$w_oval_new.srw
forward
global type w_oval_new from w_standard_ancestor
end type
type ov_test from oval within w_oval_new
end type
end forward

global type w_oval_new from w_standard_ancestor
string title = "Oval"
ov_test ov_test
end type
global w_oval_new w_oval_new

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
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

boolean B_Visible;
integer I_Height,I_LineThickness,I_X,I_Y,I_width;
long L_FillColor, L_LineColor;
string S_Tag;
n_util	inv_util

end variables

on w_oval_new.create
int iCurrent
call super::create
this.ov_test=create ov_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ov_test
end on

on w_oval_new.destroy
call super::destroy
destroy(this.ov_test)
end on

event open;call super::open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y = 0

B_Visible = ov_test.Visible 
I_Height = ov_test.Height 
I_width = ov_test.Width
I_LineThickness = ov_test.LineThickness 
I_X = ov_test.X 
I_Y = ov_test.Y 
L_FillColor = ov_test.FillColor  
L_LineColor = ov_test.LineColor 
S_Tag = ov_test.Tag 
ov_test.LineStyle = Continuous!
inv_util=create n_util
end event

event ue_open;call super::ue_open;//====================================================================
// Event: ue_open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (None)
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

is_prop_data="FillColor,Height,LineColor,LineStyle,LineThickness,Tag,Visible,Width,X,Y"
is_fuction_data="ClassName,GetParent,Hide,Move,PostEvent,Resize,Show,TriggerEvent,TypeOf"

st_tip.Text="The control is Oval."
end event

type tab_1 from w_standard_ancestor`tab_1 within w_oval_new
end type

type tabpage_1 from w_standard_ancestor`tabpage_1 within tab_1
end type

type cb_get from w_standard_ancestor`cb_get within tabpage_1
end type

event cb_get::clicked;call super::clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

If lb_prop.SelectedIndex() < 0 Then
	iFlag = 1
	MessageBox('Warning','Please select testing property.')
	Return
End If

iFlag = 0

String ls_Return

Choose Case lb_prop.SelectedItem()
	Case	'FillColor'
		ls_Return = String(ov_test.FillColor)
		
	Case	'Height'
		ls_Return = String(ov_test.Height)
		
	Case	'LineColor'
		ls_Return = String(ov_test.LineColor)
		
	Case	'LineStyle'
		Choose Case ov_test.LineStyle
			Case Continuous!
				ls_Return = "Continuous!"
				
			Case Dash!
				ls_Return = "Dash!"
				
			Case DashDot!
				ls_Return = "DashDot!"
				
			Case Dot!
				ls_Return = "Dot!"
				
		End Choose
		
	Case	'LineThickness'
		ls_Return = String(ov_test.LineThickness)
		
	Case	'Tag'
		ls_Return = ov_test.Tag
		
	Case	'Visible'
		ls_Return = String(ov_test.Visible)
		
	Case	'Width'
		ls_Return = String(ov_test.Width)
		
	Case	'X'
		ls_Return = String(ov_test.X)
		
	Case	'Y'
		ls_Return = String(ov_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The Oval's "+lb_prop.SelectedItem ( )+" property is "+ls_Return+"."


end event

type cb_set from w_standard_ancestor`cb_set within tabpage_1
end type

event cb_set::clicked;call super::clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String ls_Param,ls_Return

ls_Param = Trim(sle_propparm.Text)

If lb_prop.SelectedIndex() < 0 Then
	iFlag = 1
	MessageBox('Warning','Please select testing property.')
	Return
End If

If ls_Param = '' Then
	iFlag = 1
	MessageBox('Warning','Please select testing data.')
	Return
End If

iFlag = 0

Choose Case lb_prop.SelectedItem()
	Case	'FillColor'
		If IsNumber(ls_Param) Then
			ov_test.FillColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ov_test.FillColor)
		
	Case	'Height'
		If IsNumber(ls_Param) Then
			ov_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ov_test.Height)
		
	Case	'LineColor'
		If IsNumber(ls_Param) Then
			ov_test.LineColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ov_test.LineColor)
		
	Case	'LineStyle'
		Choose Case ls_Param
			Case "Continuous!"
				ov_test.LineStyle = Continuous!
				
			Case "Dash!"
				ov_test.LineStyle = Dash!
				
			Case "DashDot!"
				ov_test.LineStyle = DashDot!
				
			Case "DashDotDot!"
				ov_test.LineStyle = DashDotDot!
				
			Case "Dot!"
				ov_test.LineStyle = Dot!
				
			Case "Transparent!"
				ov_test.LineStyle = Transparent!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case	'LineThickness'
		If IsNumber(ls_Param) Then
			ov_test.LineThickness = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ov_test.LineThickness)
		
	Case	'Tag'
		ov_test.Tag = ls_Param
		ls_Return = ov_test.Tag
		
	Case	'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			ov_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ov_test.Visible)
		
	Case	'Width'
		If IsNumber(ls_Param) Then
			ov_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ov_test.Width)
		
	Case	'X'
		If IsNumber(ls_Param) Then
			ov_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ov_test.X)
		
	Case	'Y'
		If IsNumber(ls_Param) Then
			ov_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ov_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The Oval's "+lb_prop.SelectedItem ( )+" property is set to "+ls_Return+"."


end event

type st_1 from w_standard_ancestor`st_1 within tabpage_1
end type

type lb_propparm from w_standard_ancestor`lb_propparm within tabpage_1
end type

type lb_prop from w_standard_ancestor`lb_prop within tabpage_1
end type

event lb_prop::selectionchanged;call super::selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/09/25
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_propparm.Reset()
sle_propparm.Text = ''

Choose Case lb_prop.SelectedItem()
	Case	'FillColor'
		wf_random("Color",lb_propparm)
		
	Case	'Height'
		wf_random("Integer",lb_propparm)
		
	Case	'LineColor'
		wf_random("Color",lb_propparm)
		
	Case	'LineStyle'
		lb_propparm.AddItem("Continuous!")
		lb_propparm.AddItem("Dash!")
		lb_propparm.AddItem("DashDot!")
		lb_propparm.AddItem("DashDotDot!")
		lb_propparm.AddItem("Dot!")
		lb_propparm.AddItem("Transparent!")
		Return
		
	Case	'LineThickness'
		lb_propparm.AddItem("1")
		lb_propparm.AddItem("3")
		lb_propparm.AddItem("5")
		lb_propparm.AddItem("7")
		lb_propparm.AddItem("12")
		lb_propparm.AddItem("23")
		Return
		
	Case	'Tag'
		wf_random("String",lb_propparm)
		
	Case	'Visible'
		wf_random("Boolean",lb_propparm)
		
	Case	'Width'
		wf_random("Integer",lb_propparm)
		
	Case	'X'
		wf_random("Integer",lb_propparm)
		
	Case	'Y'
		wf_random("Integer",lb_propparm)
End Choose


end event

type sle_propparm from w_standard_ancestor`sle_propparm within tabpage_1
end type

type tabpage_2 from w_standard_ancestor`tabpage_2 within tab_1
end type

type cb_execute from w_standard_ancestor`cb_execute within tabpage_2
end type

event cb_execute::clicked;call super::clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String ls_Param,ls_Return
window w_temp

ls_Param = Trim(sle_functionparm.Text)

If lb_function.SelectedIndex() < 0 Then
	iFlag = 1
	MessageBox('Warning','Please select testing function.')
	Return
End If

If ls_Param = '' And lb_functionparm.TotalItems() > 0  Then
	iFlag = 1
	MessageBox('Warning','Please select testing data.')
	Return
End If

iFlag = 0

Integer intx,inty,li_ParaNum
String strx
Long longx,longy
String ls_ParamArray[]

li_ParaNum = wf_str2array(ls_Param,ls_ParamArray)

Choose Case lb_function.SelectedItem()
	Case	'ClassName'
		ls_Return = String(ov_test.ClassName( ))
		
	Case	'GetParent'
		w_temp = ov_test.GetParent( )
		ls_Return = w_temp.ClassName()
		
	Case	'Hide'
		ls_Return = String(ov_test.Hide( ))
		
	Case	'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(ov_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'PostEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(ov_test.PostEvent("Constructor"))
				
			Case 'Destructor!'
				ls_Return = String(ov_test.PostEvent("Destructor"))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case	'Resize'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(ov_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'Show'
		ls_Return = String(ov_test.Show( ))
		
	Case	'TriggerEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(ov_test.TriggerEvent("Constructor"))
				
			Case 'Destructor!'
				ls_Return = String(ov_test.TriggerEvent("Destructor"))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case	'TypeOf'
		If ov_test.TypeOf( ) = Oval! Then
			ls_Return = "Oval!"
		Else
			ls_Return = "invalid"
		End If
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "Function "+lb_function.SelectedItem()+" is executed. The return value is "+ls_Return+"."


end event

type sle_functionparm from w_standard_ancestor`sle_functionparm within tabpage_2
end type

type st_2 from w_standard_ancestor`st_2 within tabpage_2
end type

type lb_function from w_standard_ancestor`lb_function within tabpage_2
end type

event lb_function::selectionchanged;call super::selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/09/25
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_functionparm.Reset()
sle_functionparm.text = ''

CHOOSE CASE lb_function.SelectedItem()
	CASE	'Move' 
		wf_random('integer,integer',lb_functionparm)
		
	CASE	'PostEvent' 	
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		return
		
	CASE	'Resize' 
		wf_random('integer,integer',lb_functionparm)
		
	CASE	'TriggerEvent' 
      lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		return

END CHOOSE
end event

type lb_functionparm from w_standard_ancestor`lb_functionparm within tabpage_2
end type

type tabpage_3 from w_standard_ancestor`tabpage_3 within tab_1
end type

type cb_4 from w_standard_ancestor`cb_4 within tabpage_3
end type

type cb_3 from w_standard_ancestor`cb_3 within tabpage_3
end type

type lb_1 from w_standard_ancestor`lb_1 within tabpage_3
end type

type cb_2 from w_standard_ancestor`cb_2 within w_oval_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_oval_new
end type

event cb_1::clicked;call super::clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

ov_test.Visible = B_Visible
ov_test.Height = I_Height
ov_test.Width = I_width 
ov_test.LineThickness = I_LineThickness
ov_test.X = I_X
ov_test.Y = I_Y
ov_test.FillColor = L_FillColor
ov_test.LineColor =  L_LineColor 
ov_test.Tag = S_Tag
ov_test.LineStyle = Continuous!

tab_1.tabpage_3.lb_1.reset()

end event

type st_tip from w_standard_ancestor`st_tip within w_oval_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_oval_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_oval_new
boolean visible = false
end type

type ov_test from oval within w_oval_new
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 1073741824
integer x = 123
integer y = 44
integer width = 320
integer height = 248
end type

event constructor;//====================================================================
// Event: constructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_constructor]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/09/25
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"Oval's Constructor Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event destructor;//====================================================================
// Event: destructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_destructor]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/09/25
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"Oval's Destructor Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

