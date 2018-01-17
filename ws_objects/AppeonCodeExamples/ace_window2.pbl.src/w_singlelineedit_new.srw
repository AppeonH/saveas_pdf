$PBExportHeader$w_singlelineedit_new.srw
forward
global type w_singlelineedit_new from w_standard_ancestor
end type
type sle_test from singlelineedit within w_singlelineedit_new
end type
end forward

global type w_singlelineedit_new from w_standard_ancestor
string title = "SingleLineEdit"
sle_test sle_test
end type
global w_singlelineedit_new w_singlelineedit_new

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

boolean B_Border,B_DisplayOnly,B_Enabled ,B_Italic,B_Password ,B_Underline, B_Visible,B_RightToLeft ;
long L_BackColor, L_TextColor;
string S_FaceName, S_Tag, S_Text,E_BorderStyle,E_TextCase ;
integer I_Height,I_TextSize,I_Weight,I_Width,I_X,I_Y;
n_util	inv_util

end variables

on w_singlelineedit_new.create
int iCurrent
call super::create
this.sle_test=create sle_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_test
end on

on w_singlelineedit_new.destroy
call super::destroy
destroy(this.sle_test)
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

B_Border  = sle_test.Border 
B_DisplayOnly  = sle_test.DisplayOnly 
B_Enabled   = sle_test.Enabled 
B_Italic  = sle_test.Italic 
B_Password   = sle_test.Password 
B_Underline  = sle_test.Underline  
B_Visible = sle_test.Visible 
B_RightToLeft = sle_test.RightToLeft

L_BackColor  = sle_test.BackColor  
L_TextColor  = sle_test.TextColor 

S_FaceName  = sle_test.FaceName  
S_Tag  = sle_test.Tag  
S_Text = sle_test.Text 

I_Height  = sle_test.Height  
I_TextSize  = sle_test.TextSize 
I_Weight  = sle_test.Weight 
I_Width  = sle_test.Width  
I_X  = sle_test.X  
I_Y = sle_test.Y
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

is_prop_data="BackColor,Border,BorderStyle,DisplayOnly,Enabled,FaceName,Height,RightToLeft,Italic,Limit,Password,Tag,Text,TextCase,TextColor,TextSize,Underline,Visible,Weight,Width,X,Y"
is_fuction_data="ClassName,Clear,Copy,Cut,Paste,Undo,GetParent,Hide,Move,PostEvent,Resize,ReplaceText,SelectedLength,SelectedStart,SelectText,SelectedText,SetFocus,SetPosition,SetRedraw,Show,TriggerEvent,TypeOf"

st_tip.Text="The control is SingleLineEdit."
end event

type tab_1 from w_standard_ancestor`tab_1 within w_singlelineedit_new
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if lb_prop.SelectedIndex() < 0 then
	iFlag = 1
	messagebox('Warning','Please select testing property.')
	return
end if

iFlag = 0

string ls_Return
CHOOSE CASE lb_prop.SelectedItem()
	CASE	'BackColor'
		ls_Return = string(sle_test.BackColor)  
		
   CASE	'Border'
		ls_Return = string(sle_test.Border)
		
	CASE	'BorderStyle'
      CHOOSE CASE sle_test.BorderStyle
			CASE StyleBox!
				ls_Return = "StyleBox!"
			CASE StyleLowered!
				ls_Return = "StyleLowered!"
			CASE StyleRaised!
				ls_Return = "StyleRaised!"
			CASE StyleShadowBox!
				ls_Return = "StyleShadowBox!"
		END CHOOSE	

	CASE	'DisplayOnly'
		ls_Return = string(sle_test.DisplayOnly)
		
	CASE	'Enabled'
		ls_Return = string(sle_test.Enabled)
		
	CASE	'FaceName'
		ls_Return = sle_test.FaceName
		 
	CASE	'Height'
		ls_Return = string(sle_test.Height)  
		 
	CASE	'Italic'
		ls_Return = string(sle_test.Italic)
		
	CASE	'Limit'
		ls_Return = string(sle_test.Limit)  
	
   CASE 'RightToLeft'
		ls_Return = string(sle_test.RightToLeft)
		
	CASE	'Password' 
		ls_Return = string(sle_test.Password)
	CASE	'Tag' 
		ls_Return = sle_test.Tag
		 
	CASE	'Text' 
		ls_Return = sle_test.Text
		 
	CASE	'TextCase'
      CHOOSE CASE sle_test.TextCase
			CASE AnyCase!
				ls_Return = "AnyCase!"
			CASE Lower!
				ls_Return = "Lower!"
			CASE Upper!
				ls_Return = "Upper!"
		END CHOOSE

	CASE	'TextColor'
		ls_Return = string(sle_test.TextColor)  
		
	CASE	'TextSize'
		ls_Return = string(sle_test.TextSize)  
		
	CASE	'Underline' 
		ls_Return = string(sle_test.Underline)
		
	CASE	'Visible'
		ls_Return = string(sle_test.Visible)
		
	CASE	'Weight' 
		ls_Return = string(sle_test.Weight)  
		
	CASE	'Width' 
		ls_Return = string(sle_test.Width)  
		
	CASE	'X'
		ls_Return = string(sle_test.X)  
		
	CASE	'Y'
		ls_Return = string(sle_test.Y)  
		
END CHOOSE

ls_Return = inv_util.of_convert_to_upper(ls_return)
st_tip.Text = "The SingleLineEdit's "+lb_prop.SelectedItem ( )+" property is "+ls_Return+"."


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
// Author: 	laihaichun		Date: 2004/01/02
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
	Case	'BackColor'
		If IsNumber(ls_Param) Then
			sle_test.BackColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.BackColor)
		
	Case	'Border'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			sle_test.Border = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.Border)
		
	Case	'BorderStyle'
		sle_test.Border = True
		
		Choose Case ls_Param
			Case "StyleBox!"
				sle_test.BorderStyle = StyleBox!
				
			Case "StyleLowered!"
				sle_test.BorderStyle = StyleLowered!
				
			Case "StyleRaised!"
				sle_test.BorderStyle = StyleRaised!
				
			Case "StyleShadowBox!"
				sle_test.BorderStyle = StyleShadowBox!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case	'DisplayOnly'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			sle_test.DisplayOnly = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.DisplayOnly)
		
	Case	'Enabled'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			sle_test.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.Enabled)
		
	Case	'FaceName'
		sle_test.FaceName = ls_Param
		ls_Return = sle_test.FaceName
		
	Case	'Height'
		If IsNumber(ls_Param) Then
			sle_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.Height)
		
	Case	'Italic'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			sle_test.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.Italic)
		
	Case	'Limit'
		If IsNumber(ls_Param) Then
			sle_test.Limit = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.Limit)
	Case 'RightToLeft'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			sle_test.RightToLeft = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.RightToLeft)
		
	Case	'Password'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			sle_test.Password = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.Password)
		
	Case	'Tag'
		sle_test.Tag = ls_Param
		ls_Return = sle_test.Tag
		
	Case	'Text'
		sle_test.Text = ls_Param
		ls_Return = sle_test.Text
		
	Case	'TextCase'
		Choose Case ls_Param
			Case "AnyCase!"
				sle_test.TextCase = AnyCase!
				
			Case "Lower!"
				sle_test.TextCase = Lower!
				
			Case "Upper!"
				sle_test.TextCase = Upper!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case	'TextColor'
		If IsNumber(ls_Param) Then
			sle_test.TextColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.TextColor)
		
	Case	'TextSize'
		If IsNumber(ls_Param) Then
			sle_test.TextSize = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.TextSize)
		
	Case	'Underline'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			sle_test.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.Underline)
		
	Case	'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			sle_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.Visible)
		
	Case	'Weight'
		If IsNumber(ls_Param) Then
			sle_test.Weight = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.Weight)
		
	Case	'Width'
		If IsNumber(ls_Param) Then
			sle_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.Width)
		
	Case	'X'
		If IsNumber(ls_Param) Then
			sle_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.X)
		
	Case	'Y'
		If IsNumber(ls_Param) Then
			sle_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(sle_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The SingleLineEdit's "+lb_prop.SelectedItem ( )+" property is set to "+ls_Return+"."


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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_propparm.Reset()
sle_propparm.text = ''

CHOOSE CASE lb_prop.SelectedItem()
	CASE	'BackColor'
       wf_random("Color",lb_propparm)
		 
   CASE	'Border'
       wf_random("Boolean",lb_propparm)
		 
	CASE	'BorderStyle'
		 lb_propparm.additem("StyleBox!")
		 lb_propparm.additem("StyleLowered!")
		 lb_propparm.additem("StyleRaised!")
		 //lb_propparm.additem("StyleShadowBox!")
		 return
			
	CASE	'DisplayOnly'
       wf_random("Boolean",lb_propparm)
		 
	CASE	'Enabled'
       wf_random("Boolean",lb_propparm)
		 
	CASE	'FaceName'
       wf_random('Font',lb_propparm)
		 return
		 
	CASE	'Height'
       wf_random("Integer",lb_propparm)	
		 
	CASE	'Italic'
       wf_random("Boolean",lb_propparm)
		 
	CASE	'Limit'
		 wf_random("Integer",lb_propparm)
		 
	CASE	'Password' 
		 wf_random("Boolean",lb_propparm)	
		 
	CASE 'RightToLeft'
		wf_random("Boolean",lb_propparm)
		
	CASE	'Tag' 
		 wf_random("String",lb_propparm)
		 
	CASE	'Text' 
		 wf_random("String",lb_propparm)
		 
	CASE	'TextCase'	
		 lb_propparm.additem("AnyCase!")
		 lb_propparm.additem("Lower!")
		 lb_propparm.additem("Upper!")
		 return

	CASE	'TextColor'
		 wf_random("Long",lb_propparm)
		
	CASE	'TextSize'
		 wf_random('Tsize',lb_propparm)
		 return
		
	CASE	'Underline' 
		 wf_random("Boolean",lb_propparm)	
		
	CASE	'Visible'
		 wf_random("Boolean",lb_propparm)
		
	CASE	'Weight' 
		 wf_random('weight',lb_propparm)
		 return
		
	CASE	'Width' 
		 wf_random("Integer",lb_propparm)
		
	CASE	'X'
		 wf_random("Integer",lb_propparm)	
		
	CASE	'Y'
		 wf_random("Integer",lb_propparm)	
		
END CHOOSE


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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String ls_Param,ls_Return

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
		ls_Return = String(sle_test.ClassName( ))
		
	Case	'Clear'
		ls_Return = String(sle_test.Clear( ))
		
	Case 'Copy'
		ls_Return = String(sle_test.Copy( ))
		
	Case 'Cut'
		ls_Return = String(sle_test.Cut( ))
		
	Case 'Paste'
		ls_Return = String(sle_test.Paste( ))
		
	Case 'Undo'
		ls_Return = String(sle_test.Undo( ))
		
	Case	'GetParent'
		window  w_temp
		w_temp = sle_test.GetParent( )
		ls_Return = w_temp.ClassName()
		
	Case	'Hide'
		ls_Return = String(sle_test.Hide( ))
		
	Case	'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(sle_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'PostEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(sle_test.PostEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(sle_test.PostEvent(Destructor!))
				
			Case 'GetFocus!'
				ls_Return = String(sle_test.PostEvent(GetFocus!))
				
			Case 'LoseFocus!'
				ls_Return = String(sle_test.PostEvent(LoseFocus!))
				
			Case 'Modified!'
				ls_Return = String(sle_test.PostEvent(Modified!))
				
			Case 'RButtonDown!'
				ls_Return = String(sle_test.PostEvent(RButtonDown!))
				
			Case 'Help'
				ls_Return = String(sle_test.PostEvent("Help"))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case	'ReplaceText'
		strx = String(ls_ParamArray[1])
		ls_Return = String(sle_test.ReplaceText(strx))
		
	Case	'Resize'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(sle_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'SelectedLength'
		ls_Return = String(sle_test.SelectedLength( ))
		
	Case	'SelectedStart'
		ls_Return = String(sle_test.SelectedStart( ))
		
	Case	'SelectedText'
		ls_Return = String(sle_test.SelectedText( ))
		
	Case	'SelectText'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			longx = Long(ls_ParamArray[1])
			longy = Long(ls_ParamArray[2])
			ls_Return = String(sle_test.SelectText(longx,longy))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'SetFocus'
		ls_Return = String(sle_test.SetFocus( ))
		
	Case	'SetPosition'
		Choose Case ls_Param					
			Case 'ToTop!'
				ls_Return = String(sle_test.SetPosition(ToTop!))
				
			Case 'ToBottom!'
				ls_Return = String(sle_test.SetPosition(ToBottom!))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
	Case 'SetRedraw'
		ls_Return = string(sle_test.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
		
	Case	'Show'
		ls_Return = String(sle_test.Show( ))
		
	Case	'TriggerEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(sle_test.TriggerEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(sle_test.TriggerEvent(Destructor!))
				
			Case 'GetFocus!'
				ls_Return = String(sle_test.TriggerEvent(GetFocus!))
				
			Case 'LoseFocus!'
				ls_Return = String(sle_test.TriggerEvent(LoseFocus!))
				
			Case 'Modified!'
				ls_Return = String(sle_test.TriggerEvent(Modified!))
				
			Case 'RButtonDown!'
				ls_Return = String(sle_test.TriggerEvent(RButtonDown!))
				
			Case 'Help'
				ls_Return = String(sle_test.TriggerEvent("Help"))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case	'TypeOf'
		If sle_test.TypeOf( ) = SingleLineEdit! Then
			ls_Return = "SingleLineEdit!"
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
	Case	'Move'
		wf_random('integer,integer',lb_functionparm)
		
	Case	'PostEvent'
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('Modified!')
		lb_functionparm.AddItem('RButtonDown!')
		Return
		
	Case	'ReplaceText'
		wf_random('string',lb_functionparm)
		
	Case	'Resize'
		wf_random('integer,integer',lb_functionparm)
		
	Case	'SelectText'
		lb_functionparm.AddItem('1,5')
		lb_functionparm.AddItem('7,34')
		lb_functionparm.AddItem('9,12')
		Return
		
	Case	'SetPosition'		
		lb_functionparm.AddItem('ToTop!')
		lb_functionparm.AddItem('ToBottom!')
		Return
	Case 'SetRedraw'
		wf_random('boolean',lb_functionparm)
		
	Case	'TriggerEvent'
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('Modified!')
		lb_functionparm.AddItem('RButtonDown!')
		Return
		
End Choose

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

type cb_2 from w_standard_ancestor`cb_2 within w_singlelineedit_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_singlelineedit_new
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

sle_test.Border = B_Border  
sle_test.DisplayOnly = B_DisplayOnly  
sle_test.Enabled = B_Enabled   
sle_test.Italic = B_Italic  
sle_test.Password = B_Password   
sle_test.Underline = B_Underline   
sle_test.Visible = B_Visible
sle_test.RightToLeft = B_RightToLeft
sle_test.BackColor = L_BackColor   
sle_test.TextColor = L_TextColor
sle_test.FaceName = S_FaceName   
sle_test.Tag = S_Tag   
sle_test.Text = S_Text  
sle_test.Height = I_Height  
sle_test.TextSize = I_TextSize  
sle_test.Weight = I_Weight  
sle_test.Width = I_Width  
sle_test.X = I_X  
sle_test.Y = I_Y
sle_test.BorderStyle = StyleLowered!  
sle_test.TextCase = AnyCase! 

tab_1.tabpage_3.lb_1.reset()
end event

type st_tip from w_standard_ancestor`st_tip within w_singlelineedit_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_singlelineedit_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_singlelineedit_new
string text = "SingleLineEdit"
end type

type sle_test from singlelineedit within w_singlelineedit_new
integer x = 101
integer y = 104
integer width = 841
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "Sybase"
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
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+'SingleLineEdit Constructor Event'
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+'SingleLineEdit Destructor Event'
tab_1.tabpage_3.lb_1.additem(ls_item)


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
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+'SingleLineEdit GetFocus Event'
tab_1.tabpage_3.lb_1.additem(ls_item)


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
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"SingleLineEdit's LostFocus Event"
tab_1.tabpage_3.lb_1.additem(ls_item)



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
ls_status=this.text
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"SingleLineEdit's Modified Event(text="+ls_status+")"
tab_1.tabpage_3.lb_1.additem(ls_item)



end event

event rbuttondown;//====================================================================
// Event: rbuttondown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		unsignedlong	flags		
//		integer     	xpos 		
//		integer     	ypos 		
//--------------------------------------------------------------------
// Returns: long [pbm_rbuttondown]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"SingleLineEdit's RButtonDown Event(flags="+string(flags)+',xpos='+string(xpos)+',ypos='+string(ypos)+')'
tab_1.tabpage_3.lb_1.additem(ls_item)

end event

