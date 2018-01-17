$PBExportHeader$w_multilineedit_new.srw
forward
global type w_multilineedit_new from w_standard_ancestor2
end type
type mle_test from multilineedit within w_multilineedit_new
end type
end forward

global type w_multilineedit_new from w_standard_ancestor2
string title = "MultiLineEdit"
mle_test mle_test
end type
global w_multilineedit_new w_multilineedit_new

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

n_util	inv_util

end variables

on w_multilineedit_new.create
int iCurrent
call super::create
this.mle_test=create mle_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_test
end on

on w_multilineedit_new.destroy
call super::destroy
destroy(this.mle_test)
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y = 0
inv_util=create n_util


end event

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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

is_prop_data = "Alignment,BackColor,Border,BorderStyle,DisplayOnly,Enabled,FaceName,Height,Italic,Limit,RightToLeft,Tag,Text,TextCase,TextColor,TextSize,Underline,Visible,Weight,Width,X,Y"
is_fuction_data = "ClassName,Clear,Copy,Cut,Paste,Undo,GetParent,Hide,Move,PostEvent,Resize,ReplaceText,SelectedLength,SelectedStart,SelectText,SelectedText,SetFocus,SetPosition,SetRedraw,Show,TextLine,TriggerEvent,TypeOf"


st_tip.Text="The control is MultilineEdit."

end event

type tab_1 from w_standard_ancestor2`tab_1 within w_multilineedit_new
end type

type tabpage_1 from w_standard_ancestor2`tabpage_1 within tab_1
end type

type cb_get from w_standard_ancestor2`cb_get within tabpage_1
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String ls_Return

If lb_prop.SelectedIndex() < 0 Then
	iFlag = 1
	MessageBox('Warning','Please select testing property.')
	Return
End If

iFlag = 0

Choose Case lb_prop.SelectedItem()
	Case 'Alignment'
		Choose Case mle_test.Alignment
			Case Center!
				ls_Return = 'Center!'
			
				
			Case Left!
				ls_Return = 'Left!'
				
			Case Right!
				ls_Return = 'Right!'
				
		End Choose
		
	Case 'BackColor'
		ls_Return = String(mle_test.BackColor)
		
	Case 'Border'
		ls_Return = String(mle_test.Border)
		
	Case 'BorderStyle'
		Choose Case mle_test.BorderStyle
			Case StyleBox!
				ls_Return = 'StyleBox!'
				
			Case StyleLowered!
				ls_Return = 'StyleLowered!'
				
			Case StyleRaised!
				ls_Return = 'StyleRaised!'
				
			Case StyleShadowBox!
				ls_Return = 'StyleShadowBox!'
				
		End Choose
		
	Case 'DisplayOnly'
		ls_Return = String(mle_test.DisplayOnly)
		
	Case 'Enabled'
		ls_Return = String(mle_test.Enabled)
		
	Case 'FaceName'
		ls_Return = mle_test.FaceName
		
	Case 'Height'
		ls_Return = String(mle_test.Height)
		
	Case 'Italic'
		ls_Return = String(mle_test.Italic)
		
	Case 'Limit'
		ls_Return = String(mle_test.Limit)
		
	Case 'RightToLeft'
		ls_Return = String(mle_test.RightToLeft)
		
	Case 'Tag'
		ls_Return = mle_test.Tag
		
	Case 'Text'
		ls_Return = mle_test.Text
		
	Case 'TextCase'
		Choose Case mle_test.TextCase
			Case AnyCase!
				ls_Return = 'AnyCase!'
				
			Case Lower!
				ls_Return = 'Lower!'
				ls_Return = 'Upper!'
				
		End Choose
		
	Case 'TextColor'
		ls_Return = String(mle_test.TextColor)
		
	Case 'TextSize'
		ls_Return = String(mle_test.TextSize)
		
	Case 'Underline'
		ls_Return = String(mle_test.Underline)
		
	Case 'Visible'
		ls_Return = String(mle_test.Visible)
		
	Case 'Weight'
		ls_Return = String(mle_test.Weight)
		
	Case 'Width'
		ls_Return = String(mle_test.Width)
		
	Case 'X'
		ls_Return = String(mle_test.X)
		
	Case 'Y'
		ls_Return = String(mle_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The MultiLineEdit's " + lb_prop.SelectedItem() + " property is " + ls_Return + "."


end event

type cb_set from w_standard_ancestor2`cb_set within tabpage_1
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String ls_Param,ls_Return

ls_Param = sle_propparm.Text
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
	Case 'Alignment'
		Choose Case ls_Param
			Case 'Center!'
				mle_test.Alignment = Center!	
			
				
			Case 'Left!'
				mle_test.Alignment = Left!
				
			Case 'Right!'
				mle_test.Alignment = Right!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case 'BackColor'
		If IsNumber(ls_Param) Then
			mle_test.BackColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			mle_test.BackColor = Long(ls_Param)
			Return
		End If
		
		ls_Return = String(mle_test.BackColor)
		
	Case 'Border'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			mle_test.Border = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.Border)
		
	Case 'BorderStyle'
		Choose Case ls_Param
			Case 'StyleBox!'
				mle_test.BorderStyle = StyleBox!
				
			Case 'StyleLowered!'
				mle_test.BorderStyle = StyleLowered!
				
			Case 'StyleRaised!'
				mle_test.BorderStyle = StyleRaised!
				
			Case 'StyleShadowBox!'
				mle_test.BorderStyle = StyleShadowBox!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case 'DisplayOnly'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			mle_test.DisplayOnly = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.DisplayOnly)
		
	Case 'Enabled'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			mle_test.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.Enabled)
		
	Case 'FaceName'
		mle_test.FaceName = ls_Param
		ls_Return = mle_test.FaceName
		
	Case 'Height'
		If IsNumber(ls_Param) Then
			mle_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.Height)
		
	Case 'Italic'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			mle_test.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.Italic)
		
	Case 'Limit'
		If IsNumber(ls_Param) Then
			mle_test.Limit = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.Limit)
	Case 'RightToLeft'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			mle_test.RightToLeft = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.RightToLeft)
		
	Case 'Tag'
		mle_test.Tag = ls_Param
		ls_Return = mle_test.Tag
		
	Case 'Text'
		mle_test.Text = ls_Param
		ls_Return = mle_test.Text
		
	Case 'TextCase'
		Choose Case ls_Param
			Case 'AnyCase!'
				mle_test.TextCase = AnyCase!
				
			Case 'Lower!'
				mle_test.TextCase = Lower!
				
			Case 'Upper!'
				mle_test.TextCase = Upper!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case 'TextColor'
		If IsNumber(ls_Param) Then
			mle_test.TextColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			mle_test.TextColor = Long(ls_Param)
			Return
		End If
		
		ls_Return = String(mle_test.TextColor)
		
	Case 'TextSize'
		If IsNumber(ls_Param) Then
			mle_test.TextSize = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.TextSize)
		
	Case 'Underline'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			mle_test.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.Underline)
		
	Case 'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			mle_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.Visible)
		
	Case 'Weight'
		If IsNumber(ls_Param) Then
			mle_test.Weight = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.Weight)
		
	Case 'Width'
		If IsNumber(ls_Param) Then
			mle_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.Width)
		
	Case 'X'
		If IsNumber(ls_Param) Then
			mle_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.X)
		
	Case 'Y'
		If IsNumber(ls_Param) Then
			mle_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(mle_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The MultiLineEdit's " + lb_prop.SelectedItem() + " property is set to " + ls_Return + "."


end event

type st_1 from w_standard_ancestor2`st_1 within tabpage_1
end type

type lb_propparm from w_standard_ancestor2`lb_propparm within tabpage_1
end type

type lb_prop from w_standard_ancestor2`lb_prop within tabpage_1
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_propparm.Reset()
sle_propparm.Text = ''

Choose Case lb_prop.SelectedItem()
	Case 'Alignment'
		lb_propparm.AddItem('Center!')		
		lb_propparm.AddItem('Left!')
		lb_propparm.AddItem('Right!')
		Return
		
	Case 'AutoHScroll'
		wf_random('boolean',lb_propparm)
		
	Case 'AutoVScroll'
		wf_random('boolean',lb_propparm)
		
	Case 'BackColor'
		wf_random('color',lb_propparm)
		
	Case 'Border'
		wf_random('boolean',lb_propparm)
		
	Case 'BorderStyle'
		lb_propparm.AddItem('StyleBox!')
		lb_propparm.AddItem('StyleLowered!')
		lb_propparm.AddItem('StyleRaised!')
		//lb_propparm.AddItem('StyleShadowBox!')
		Return
		
	Case 'DisplayOnly'
		wf_random('boolean',lb_propparm)
		
	Case 'Enabled'
		wf_random('boolean',lb_propparm)
		
	Case 'FaceName'
		wf_random('Font',lb_propparm)
		
	Case 'Height'
		wf_random('integer',lb_propparm)
		
	Case 'HScrollBar'
		wf_random('boolean',lb_propparm)
		
	Case 'Italic'
		wf_random('boolean',lb_propparm)
		
	Case 'Limit'
		wf_random('integer',lb_propparm)
		
	Case 'RightToLeft'
		wf_random('boolean',lb_propparm)
		
	Case 'Tag'
		wf_random('string',lb_propparm)
		
	Case 'Text'
		wf_random('string',lb_propparm)
		
	Case 'TextCase'
		lb_propparm.AddItem('AnyCase!')
		lb_propparm.AddItem('Lower!')
		lb_propparm.AddItem('Upper!')
		Return
		
	Case 'TextColor'
		wf_random('Color',lb_propparm)
		
	Case 'TextSize'
		wf_random('TSize',lb_propparm)
		Return
		
	Case 'Underline'
		wf_random('boolean',lb_propparm)
		
	Case 'Visible'
		wf_random('boolean',lb_propparm)
		
	Case 'VScrollBar'
		wf_random('boolean',lb_propparm)
		
	Case 'Weight'
		wf_random('Weight',lb_propparm)
		Return
		
	Case 'Width'
		wf_random('integer',lb_propparm)
		
	Case 'X'
		wf_random('integer',lb_propparm)
		
	Case 'Y'
		wf_random('integer',lb_propparm)
		
End Choose


end event

type sle_propparm from w_standard_ancestor2`sle_propparm within tabpage_1
end type

type tabpage_2 from w_standard_ancestor2`tabpage_2 within tab_1
end type

type cb_execute from w_standard_ancestor2`cb_execute within tabpage_2
end type

event cb_execute::clicked;//====================================================================
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

String ls_Return, ls_Param
ls_Param = Trim(sle_functionparm.Text)

If lb_function.SelectedIndex() < 0 Then	
	MessageBox('Warning','Please select testing function.')
	Return
End If

If ls_Param = '' And lb_functionparm.TotalItems() > 0  Then	
	MessageBox('Warning','Please select testing data.')
	Return
End If

Integer intx,inty,li_ParaNum
String ls_ParamArray[]

li_ParaNum = wf_str2array(ls_Param,ls_ParamArray)

Choose Case lb_function.SelectedItem()
	Case 'ClassName'
		ls_Return = mle_test.ClassName()
		
	Case 'Clear'
		ls_Return = String(mle_test.Clear())
	
	Case 'Copy'
		ls_Return = String(mle_test.Copy())
		
	Case 'Cut'
		ls_Return = String(mle_test.Cut())
		
	Case 'Paste'
		ls_Return = String(mle_test.Paste())
		
	Case 'Undo'
		ls_Return = String(mle_test.Undo())
		
	Case 'GetParent'
		window  ls_win
		ls_win = mle_test.GetParent()
		ls_Return = ls_win.ClassName()
		
	Case 'Hide'
		ls_Return = String(mle_test.Hide())
		
	Case 'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
			
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(mle_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error')
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(mle_test.Move(intx,inty))
		End If
		
	Case 'PostEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(mle_test.PostEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(mle_test.PostEvent(Destructor!))
				
			Case 'GetFocus!'
				ls_Return = String(mle_test.PostEvent(GetFocus!))
				
			Case 'Help'
				ls_Return = String(mle_test.PostEvent('Help'))
				
			Case 'LoseFocus!'
				ls_Return = String(mle_test.PostEvent(LoseFocus!))
				
			Case 'Modified!'
				ls_Return = String(mle_test.PostEvent(Modified!))
				
			Case 'RButtonDown!'
				ls_Return = String(mle_test.PostEvent(RButtonDown!))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case 'ReplaceText'
		ls_Return = String(mle_test.ReplaceText(ls_ParamArray[1]))
		
	Case 'Resize'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(mle_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
		End If
		
	Case 'SelectedStart'
		ls_Return = String(mle_test.SelectedStart())
		
	Case 'SelectedText'
		ls_Return = mle_test.SelectedText()
		
	Case 'SelectText'
		ls_Return = String(mle_test.SelectText(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
		
	Case 'SelectedLength'
		ls_Return = String(mle_test.SelectedLength())
		
	Case 'SetFocus'
		ls_Return = String(mle_test.SetFocus())
		
	Case 'SetPosition'
		Choose Case ls_Param				
			Case 'ToTop!'
				ls_Return = String(mle_test.SetPosition(ToTop!))
				
			Case 'ToBottom!'
				ls_Return = String(mle_test.SetPosition(ToBottom!))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
	Case 'SetRedraw'
		ls_Return = String(mle_test.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
	Case 'Show'
		ls_Return = String(mle_test.Show())
		
	Case 'TextLine'
		ls_Return = mle_test.TextLine()
		
	Case 'TriggerEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(mle_test.TriggerEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(mle_test.TriggerEvent(Destructor!))
				
			Case 'GetFocus!'
				ls_Return = String(mle_test.TriggerEvent(GetFocus!))
				
			Case 'Help'
				ls_Return = String(mle_test.TriggerEvent('Help'))
				
			Case 'LoseFocus!'
				ls_Return = String(mle_test.TriggerEvent(LoseFocus!))
				
			Case 'Modified!'
				ls_Return = String(mle_test.TriggerEvent(Modified!))
				
			Case 'RButtonDown!'
				ls_Return = String(mle_test.TriggerEvent(RButtonDown!))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case 'TypeOf'
		If mle_test.TypeOf() = MultiLineEdit! Then
			ls_Return = 'MultiLineEdit!'
		Else
			ls_Return = 'Invalid'
		End If
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text =  "Function "+lb_function.SelectedItem()+" is executed. The return value is " + ls_Return + "."


end event

type sle_functionparm from w_standard_ancestor2`sle_functionparm within tabpage_2
end type

type st_2 from w_standard_ancestor2`st_2 within tabpage_2
end type

type lb_function from w_standard_ancestor2`lb_function within tabpage_2
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
// Author: 	laihaichun		Date: 2004/01/02
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
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('Modified!')
		lb_functionparm.AddItem('RButtonDown!')
		Return
		
	Case 'ReplaceText'
		wf_random('string',lb_functionparm)
		
	Case 'Resize'
		wf_random('integer,integer',lb_functionparm)
		
	Case 'Scroll'
		lb_functionparm.AddItem('1')
		lb_functionparm.AddItem('2')
		Return
		
	Case 'SelectText'
		lb_functionparm.AddItem('1,5')
		lb_functionparm.AddItem('2,3')
		Return
		
	Case 'SetPosition'		
		lb_functionparm.AddItem('ToTop!')
		lb_functionparm.AddItem('ToBottom!')
		Return
		
	Case 'SetRedraw'
		wf_random('boolean',lb_functionparm)
		Return
		
	Case 'TriggerEvent'
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('Modified!')
		lb_functionparm.AddItem('RButtonDown!')
		Return
		
End Choose


end event

type lb_functionparm from w_standard_ancestor2`lb_functionparm within tabpage_2
end type

type tabpage_3 from w_standard_ancestor2`tabpage_3 within tab_1
end type

type cb_4 from w_standard_ancestor2`cb_4 within tabpage_3
end type

type cb_3 from w_standard_ancestor2`cb_3 within tabpage_3
end type

type lb_out from w_standard_ancestor2`lb_out within tabpage_3
end type

type cb_2 from w_standard_ancestor2`cb_2 within w_multilineedit_new
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_multilineedit_new
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

mle_test.Alignment = left!
mle_test.BackColor = rgb(255,255,255)
mle_test.Border = true
mle_test.BorderStyle = stylelowered!
mle_test.DisplayOnly = false
mle_test.Enabled = true
mle_test.Italic = false
mle_test.RightToLeft = False
mle_test.Limit = 0
mle_test.Tag = ''
mle_test.Text = 'MultiLineEdit'
mle_test.TextCase = Anycase!
mle_test.TextSize = -8
mle_test.Underline = false
mle_test.Visible = true
mle_test.X = 101
mle_test.Y = 108
mle_test.Weight = 400
mle_test.Width = 1554
mle_test.Height = 352
mle_test.TextColor = 33554432
mle_test.FaceName = 'MS Sans Serif'

tab_1.tabpage_3.lb_out.reset()
end event

type st_tip from w_standard_ancestor2`st_tip within w_multilineedit_new
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_multilineedit_new
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_multilineedit_new
string text = "MultiLineEdit"
end type

type mle_test from multilineedit within w_multilineedit_new
integer x = 101
integer y = 108
integer width = 1554
integer height = 352
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "MultiLineEdit"
borderstyle borderstyle = stylelowered!
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MultiLineEdit's Constructor Event "
tab_1.tabpage_3.lb_out.additem(ls_item)
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MultiLineEdit's Destructor Event "
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_ensetfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MultiLineEdit GetFocus Event "
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event losefocus;//====================================================================
// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enkillfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MultiLineEdit LostFocus Event "
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
string ls_status
ls_status = this.text
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MultiLineEdit Modified Event(text= "+ls_status + ")"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

