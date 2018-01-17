$PBExportHeader$w_commandbutton_new.srw
forward
global type w_commandbutton_new from w_standard_ancestor
end type
type cb_test from commandbutton within w_commandbutton_new
end type
end forward

global type w_commandbutton_new from w_standard_ancestor
string title = "CommandButton"
cb_test cb_test
end type
global w_commandbutton_new w_commandbutton_new

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
n_util	inv_util
end variables

on w_commandbutton_new.create
int iCurrent
call super::create
this.cb_test=create cb_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_test
end on

on w_commandbutton_new.destroy
call super::destroy
destroy(this.cb_test)
end on

event ue_open;call super::ue_open;//====================================================================
// Event: ue_open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: about commandButton Object.
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

is_prop_data = "Enabled,FaceName,Height,Italic,Tag,Text,TextSize,Underline,Visible,Weight,Width,X,Y"

is_fuction_data = "ClassName,GetParent,Hide,Move,PostEvent,Resize,SetFocus,SetPosition,SetRedraw,Show,TriggerEvent,TypeOf"
st_tip.Text = "The control is CommandButton."
inv_util = Create n_util

end event

type tab_1 from w_standard_ancestor`tab_1 within w_commandbutton_new
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
// Author: 	Administrator		Date: 2004/01/06
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
	Case 'Enabled'
		ls_Return = String(cb_test.Enabled)
	Case 'FaceName'
		ls_Return = cb_test.FaceName
	Case 'Height'
		ls_Return = String(cb_test.Height)
	Case 'Italic'
		ls_Return = String(cb_test.Italic)
	Case 'Tag'
		ls_Return = cb_test.Tag
	Case 'Text'
		ls_Return = cb_test.Text
	Case 'TextSize'
		ls_Return = String(cb_test.TextSize)
	Case 'Underline'
		ls_Return = String(cb_test.Underline)
	Case 'Visible'
		ls_Return = String(cb_test.Visible)
	Case 'Weight'
		ls_Return = String(cb_test.Weight)
	Case 'Width'
		ls_Return = String(cb_test.Width)
	Case 'X'
		ls_Return = String(cb_test.X)
	Case 'Y'
		ls_Return = String(cb_test.Y)
End Choose
ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The CommandButton's " + lb_prop.SelectedItem() + " property is " + ls_Return + "."



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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_Param , ls_Result

ls_Param = Trim(sle_propparm.Text)
If lb_prop.SelectedIndex() < 0 Then
	iFlag = 1
	MessageBox('Warning','Please select a property to test.')
	Return
End If
If ls_Param = '' Then
	iFlag = 1
	MessageBox('Warning','Please select or input a valid parameter.')
	Return
End If
iFlag = 0

Choose Case lb_prop.SelectedItem()
	Case 'Enabled'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			cb_test.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Result = String(cb_test.Enabled )
	Case 'FaceName'
		cb_test.FaceName = ls_Param
		ls_Result = cb_test.FaceName
	Case 'Height'
		If IsNumber(ls_Param) Then
			cb_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Result = String(cb_test.Height )
	Case 'Italic'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			cb_test.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Result = String(cb_test.Italic )
		
	Case 'Tag'
		cb_test.Tag = ls_Param
		ls_Result = cb_test.Tag
	Case 'Text'
		cb_test.Text = ls_Param
		ls_Result = cb_test.text
	Case 'TextSize'
		If IsNumber(ls_Param) Then
			cb_test.TextSize = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Result = String(cb_test.TextSize )
	Case 'Underline'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			cb_test.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Result = String(cb_test.Underline )
	Case 'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			cb_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Result = String(cb_test.Visible )
	Case 'Weight'
		If IsNumber(ls_Param) Then
			cb_test.Weight = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Result = String(cb_test.Weight )
	Case 'Width'
		If IsNumber(ls_Param) Then
			cb_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Result = String(cb_test.Width )
	Case 'X'
		If IsNumber(ls_Param) Then
			cb_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Result = String(cb_test.X )
	Case 'Y'
		If IsNumber(ls_Param) Then
			cb_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Result = String(cb_test.Y )
End Choose
ls_Result = inv_util.of_convert_to_upper(ls_Result)

st_tip.Text = "The CommandButton's " + lb_prop.SelectedItem() + " property is set to " + ls_Result + "."




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
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
lb_propparm.Reset()
sle_propparm.Text = ''
Choose Case lb_prop.SelectedItem()
	Case 'Cancel'
		wf_random('boolean',lb_propparm)
	Case 'Default'
		wf_random('boolean',lb_propparm)
	Case 'Enabled'
		wf_random('boolean',lb_propparm)
	Case 'FaceName'
		wf_random('Font',lb_propparm)
		Return
	Case 'Height'
		wf_random('integer',lb_propparm)
	Case 'Italic'
		wf_random('boolean',lb_propparm)
	Case 'Tag'
		wf_random('string',lb_propparm)
	Case 'Text'
		wf_random('string',lb_propparm)
	Case 'TextSize'
		lb_propparm.AddItem('12')
		lb_propparm.AddItem('14')
		Return
	Case 'Underline'
		wf_random('boolean',lb_propparm)
	Case 'Visible'
		wf_random('boolean',lb_propparm)
	Case 'Weight'
		lb_propparm.AddItem('400')
		lb_propparm.AddItem('700')
		Return
	Case 'Width'
		wf_random('integer',lb_propparm)
	Case 'X'
		wf_random('integer',lb_propparm)
	Case 'Y'
		wf_random('integer',lb_propparm)
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String  ls_Param

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

String ls_Return
Integer intx,inty
String ls_ParamArray[]
Int li_ParaNum

li_ParaNum = wf_str2array(ls_Param,ls_ParamArray)
Choose Case lb_function.SelectedItem()
	Case 'ClassName'
		ls_Return = cb_test.ClassName()
	Case 'GetParent'
		window  ls_win
		ls_win = cb_test.GetParent()
		ls_Return = ls_win.ClassName()
		
	Case 'Hide'
		ls_Return = String(cb_test.Hide())
	Case 'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','Parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(cb_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(cb_test.Move(intx,inty))
			Return
		End If
	Case 'PostEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(cb_test.PostEvent(Clicked!))
			Case 'Constructor!'
				ls_Return = String(cb_test.PostEvent(Constructor!))
			Case 'Destructor!'
				ls_Return = String(cb_test.PostEvent(Destructor!))
			Case 'GetFocus!'
				ls_Return = String(cb_test.PostEvent(GetFocus!))
			Case 'LoseFocus!'
				ls_Return = String(cb_test.PostEvent(LoseFocus!))
			Case 'RButtonDown!'
				ls_Return = String(cb_test.PostEvent(RButtonDown!))
			Case 'Help'
				ls_Return = String(cb_test.PostEvent('Help'))
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
		End Choose
	Case 'Resize'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(cb_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(cb_test.Resize(intx,inty))
		End If
	Case 'SetFocus'
		ls_Return = String(cb_test.SetFocus())
	Case 'SetPosition'
		Choose Case ls_Param			
			Case 'ToTop!'
				ls_Return = String(cb_test.SetPosition(ToTop!))
			Case 'ToBottom!'
				ls_Return = String(cb_test.SetPosition(ToBottom!))
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
		End Choose
	Case 'SetRedraw'
		ls_Return = String(cb_test.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
	Case 'Show'
		ls_Return = String(cb_test.Show())
	Case 'TriggerEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(cb_test.TriggerEvent(Clicked!))
			Case 'Constructor!'
				ls_Return = String(cb_test.TriggerEvent(Constructor!))
			Case 'Destructor!'
				ls_Return = String(cb_test.TriggerEvent(Destructor!))
			Case 'GetFocus!'
				ls_Return = String(cb_test.TriggerEvent(GetFocus!))
			Case 'LoseFocus!'
				ls_Return = String(cb_test.TriggerEvent(LoseFocus!))
			Case 'RButtonDown!'
				ls_Return = String(cb_test.TriggerEvent(RButtonDown!))
			Case 'Help'
				ls_Return = String(cb_test.PostEvent('Help'))
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
		End Choose
	Case 'TypeOf'
		If cb_test.TypeOf() = CommandButton! Then
			ls_Return = 'CommandButton!'
		Else
			ls_Return = 'Invalid'
		End If
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)

st_tip.Text = "Function "+lb_function.SelectedItem()+" is executed. The return value is " + ls_Return + "."


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
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
lb_functionparm.Reset()
sle_functionparm.Text = ''
Choose Case lb_function.SelectedItem()
	Case 'Move'
		wf_random('integer,integer',lb_functionparm)
	Case 'PostEvent'
		lb_functionparm.AddItem('Clicked!')
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
		
		Return
	Case 'SetRedraw'
		wf_random('boolean',lb_functionparm)
	Case 'Resize'
		wf_random('integer,integer',lb_functionparm)
	Case 'SetPosition'		
		lb_functionparm.AddItem('ToTop!')
		lb_functionparm.AddItem('ToBottom!')
		Return
	Case 'TriggerEvent'
		lb_functionparm.AddItem('Clicked!')
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
		
		Return
		
End Choose

end event

type lb_functionparm from w_standard_ancestor`lb_functionparm within tabpage_2
end type

event lb_functionparm::selectionchanged;call super::selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_functionparm.Text = lb_functionparm.SelectedItem()

end event

type tabpage_3 from w_standard_ancestor`tabpage_3 within tab_1
end type

type cb_4 from w_standard_ancestor`cb_4 within tabpage_3
end type

type cb_3 from w_standard_ancestor`cb_3 within tabpage_3
end type

type lb_1 from w_standard_ancestor`lb_1 within tabpage_3
end type

type cb_2 from w_standard_ancestor`cb_2 within w_commandbutton_new
end type

event cb_2::clicked;call super::clicked;//====================================================================
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


end event

type cb_1 from w_standard_ancestor`cb_1 within w_commandbutton_new
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
cb_test.X = 101
cb_test.Y = 108
cb_test.Width = 402
cb_test.Height = 96
cb_test.TextSize = -8
cb_test.Weight = 400
cb_test.FaceName = "MS Sans Serif"
cb_test.Text = "CommandButton"
cb_test.Enabled = True
cb_test.Italic = False
cb_test.Tag = ''
cb_test.Underline = False
cb_test.Visible = True
tab_1.tabpage_3.lb_1.Reset()

end event

type st_tip from w_standard_ancestor`st_tip within w_commandbutton_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_commandbutton_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_commandbutton_new
string text = "CommandButton"
end type

type cb_test from commandbutton within w_commandbutton_new
integer x = 101
integer y = 108
integer width = 402
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "CommandButton"
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
String ls_item
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"CommandButton's Clicked Event"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

end event

event constructor;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"CommandButton's Constructor Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event destructor;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"CommandButton's Destructor Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event getfocus;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"CommandButton's GetFocus Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event losefocus;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"CommandButton's LoseFocus Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event rbuttondown;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"CommandButton's RButtonDown Event"+" (flags="+string(flags)+",xpos="+string(xpos)+",ypos="+string(ypos)+")"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

