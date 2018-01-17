$PBExportHeader$w_radiobutton_new.srw
forward
global type w_radiobutton_new from w_standard_ancestor
end type
type rb_test from radiobutton within w_radiobutton_new
end type
end forward

global type w_radiobutton_new from w_standard_ancestor
string title = "RadioButton"
rb_test rb_test
end type
global w_radiobutton_new w_radiobutton_new

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

boolean B_Checked, B_Enabled, B_Italic,  B_Underline, B_Visible, B_RightToLeft ,B_LeftText
integer I_Height, I_TextSize, I_Weight, I_Width, I_X, I_Y
long L_BackColor, L_TextColor
string S_FaceName, S_Tag,S_Text
n_util	inv_util

end variables

on w_radiobutton_new.create
int iCurrent
call super::create
this.rb_test=create rb_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_test
end on

on w_radiobutton_new.destroy
call super::destroy
destroy(this.rb_test)
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

B_Checked = true   
B_Enabled = rb_test.Enabled   
B_Italic = rb_test.Italic   
B_Underline = rb_test.Underline   
B_Visible = rb_test.Visible 
B_RightToLeft = rb_test.RightToLeft 
I_Height = rb_test.Height   
I_TextSize = rb_test.TextSize   
I_Weight = rb_test.Weight   
I_Width = rb_test.Width   
I_X = rb_test.X   
I_Y = rb_test.Y  
L_BackColor = rb_test.BackColor   
L_TextColor = rb_test.TextColor  
S_FaceName = rb_test.FaceName   
S_Tag = rb_test.Tag  
S_Text = rb_test.Text  
B_LeftText = rb_test.LeftText
rb_test.BorderStyle = stylebox!  

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

//is_prop_data="BackColor,BorderStyle,Checked,Enabled,FaceName,Height,Italic,Tag,Text,TextColor,TextSize,Underline,Visible,Weight,Width,X,Y"
is_prop_data="BackColor,Checked,Enabled,FaceName,Height,Italic,RightToLeft,Tag,Text,TextColor,TextSize,Underline,Visible,Weight,Width,X,Y,LeftText"
is_fuction_data="ClassName,GetParent,Hide,Move,PostEvent,Resize,SetFocus,SetPosition,SetRedraw,Show,TriggerEvent,TypeOf"
st_tip.Text="The control is RadioButton."


end event

type tab_1 from w_standard_ancestor`tab_1 within w_radiobutton_new
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

If lb_prop.SelectedIndex() < 0 Then
	iFlag = 1
	MessageBox('Warning','Please select testing property.')
	Return
End If

iFlag = 0

String ls_Return

Choose Case lb_prop.SelectedItem()
	Case	'BackColor'
		ls_Return = String(rb_test.BackColor)
		
	Case	'BorderStyle'
		Choose Case rb_test.BorderStyle
			Case StyleBox!
				ls_Return = "StyleBox!"
				
			Case StyleLowered!
				ls_Return = "StyleLowered!"
				
			Case StyleRaised!
				ls_Return = "StyleRaised!"
				
			Case StyleShadowBox!
				ls_Return = "StyleShadowBox!"
				
		End Choose
		
	Case	'Checked'
		ls_Return = String(rb_test.Checked)
		
	Case	'Enabled'
		ls_Return = String(rb_test.Enabled)
		
	Case	'FaceName'
		ls_Return = rb_test.FaceName
		
	Case	'Height'
		ls_Return = String(rb_test.Height)
		
	Case	'Italic'
		ls_Return = String(rb_test.Italic)
		
	Case 'RightToLeft'
		ls_Return = String(rb_test.RightToLeft)
		
	Case	'Tag'
		ls_Return = rb_test.Tag
		
	Case	'Text'
		ls_Return = rb_test.Text
		
	Case	'TextColor'
		ls_Return = String(rb_test.TextColor)
		
	Case	'TextSize'
		ls_Return = String(rb_test.TextSize)
		
	Case	'Underline'
		ls_Return = String(rb_test.Underline)
		
	Case	'Visible'
		ls_Return = String(rb_test.Visible)
		
	Case	'Weight'
		ls_Return = String(rb_test.Weight)
		
	Case	'Width'
		ls_Return = String(rb_test.Width)
		
	Case	'X'
		ls_Return = String(rb_test.X)
		
	Case	'Y'
		ls_Return = String(rb_test.Y)
	Case	'LeftText'	
		ls_Return = String(rb_test.LeftText)
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The RadioButton's "+lb_prop.SelectedItem ( )+" property is "+ls_Return+"."


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
			rb_test.BackColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.BackColor)
		
	Case	'BorderStyle'
		Choose Case ls_Param
			Case "StyleBox!"
				rb_test.BorderStyle = StyleBox!
				
			Case "StyleLowered!"
				rb_test.BorderStyle = StyleLowered!
				
			Case "StyleRaised!"
				rb_test.BorderStyle = StyleRaised!
				
			Case "StyleShadowBox!"
				rb_test.BorderStyle = StyleShadowBox!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case	'Checked'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			rb_test.Checked = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.Checked)
		
	Case	'Enabled'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			rb_test.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.Enabled)
		
	Case	'FaceName'
		rb_test.FaceName = ls_Param
		ls_Return = rb_test.FaceName
		
	Case	'Height'
		If IsNumber(ls_Param) Then
			rb_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.Height)
		
	Case	'Italic'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			rb_test.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.Italic)
	Case 'RightToLeft'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			rb_test.RightToLeft = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.RightToLeft)
	Case	'Tag'
		rb_test.Tag = ls_Param
		ls_Return = rb_test.Tag
		
	Case	'Text'
		rb_test.Text = ls_Param
		ls_Return = rb_test.Text
		
	Case	'TextColor'
		If IsNumber(ls_Param) Then
			rb_test.TextColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.TextColor)
		
	Case	'TextSize'
		If IsNumber(ls_Param) Then
			rb_test.TextSize = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.TextSize)
		
	Case	'Underline'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			rb_test.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.Underline)
		
	Case	'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			rb_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.Visible)
		
	Case	'Weight'
		If IsNumber(ls_Param) Then
			rb_test.Weight = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.Weight)
		
	Case	'Width'
		If IsNumber(ls_Param) Then
			rb_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.Width)
		
	Case	'X'
		If IsNumber(ls_Param) Then
			rb_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.X)
		
	Case	'Y'
		If IsNumber(ls_Param) Then
			rb_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.Y)
	Case	'LeftText'	
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			rb_test.LeftText = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rb_test.LeftText)
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The RadioButton's "+lb_prop.SelectedItem ( )+" property is set to "+ls_Return+"."


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
		wf_random("color",lb_propparm)
		
	CASE	'BorderStyle'
		lb_propparm.additem("StyleBox!")
	   lb_propparm.additem("StyleLowered!")
		lb_propparm.additem("StyleRaised!")
		//lb_propparm.additem("StyleShadowBox!")
		return

	CASE	'Checked'
		wf_random("Boolean",lb_propparm)
		
	CASE	'Enabled'
		wf_random("Boolean",lb_propparm)
		
	CASE	'FaceName'
		wf_random('Font',lb_propparm)
		
	CASE	'Height'
	   wf_random("Integer",lb_propparm)		
		
	CASE	'Italic'
		wf_random("Boolean",lb_propparm)	
		
	CASE	'LeftText'
		wf_random("Boolean",lb_propparm)	
		
	CASE 'RightToLeft'
		wf_random("Boolean",lb_propparm)
		
	CASE	'Tag'
		wf_random("String",lb_propparm)
		
	CASE	'Text'
		wf_random("String",lb_propparm)
		
	CASE	'TextColor'
		wf_random("Long",lb_propparm)
		
	CASE	'TextSize'
	   wf_random("TSIZE",lb_propparm)  
		
	CASE	'Underline'
		wf_random("Boolean",lb_propparm)
			
	CASE	'Visible'
		wf_random("Boolean",lb_propparm)
		
	CASE	'Weight'
		wf_random("weight",lb_propparm)
		   
	CASE	'Width' 
		wf_random("Integer",lb_propparm)	
				
	CASE	'X' 
		wf_random("Integer",lb_propparm)
				
	CASE	'Y'	
	  wf_random("Integer",lb_propparm)
	CASE	'LeftText'		
		wf_random("Boolean",lb_propparm)	
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
		ls_Return = String(rb_test.ClassName( ))
		
	Case	'GetParent'
		window  w_temp
		w_temp = rb_test.GetParent( )
		ls_Return = w_temp.ClassName()
		
	Case	'Hide'
		ls_Return = String(rb_test.Hide( ))
		
	Case	'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(rb_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'PostEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(rb_test.PostEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(rb_test.PostEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(rb_test.PostEvent(Destructor!))
				
			Case 'GetFocus!'
				ls_Return = String(rb_test.PostEvent(GetFocus!))
				
			Case 'LoseFocus!'
				ls_Return = String(rb_test.PostEvent(LoseFocus!))
				
			Case 'RButtonDown!'
				ls_Return = String(rb_test.PostEvent(RButtonDown!))
				
			Case 'Help'
				ls_Return = String(rb_test.PostEvent("Help"))
				
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
			ls_Return = String(rb_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'SetFocus'
		ls_Return = String(rb_test.SetFocus( ))
		
	Case	'SetPosition'
		Choose Case ls_Param				
			Case 'ToTop!'
				ls_Return = String(rb_test.SetPosition(ToTop!))
				
			Case 'ToBottom!'
				ls_Return = String(rb_test.SetPosition(ToBottom!))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case 'SetRedraw'
		ls_Return = String(rb_test.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
		
	Case	'Show'
		ls_Return = String(rb_test.Show( ))
		
	Case	'TriggerEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(rb_test.TriggerEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(rb_test.TriggerEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(rb_test.TriggerEvent(Destructor!))
				
			Case 'GetFocus!'
				ls_Return = String(rb_test.TriggerEvent(GetFocus!))
				
			Case 'LoseFocus!'
				ls_Return = String(rb_test.TriggerEvent(LoseFocus!))
				
			Case 'RButtonDown!'
				ls_Return = String(rb_test.TriggerEvent(RButtonDown!))
				
			Case 'Help'
				ls_Return = String(rb_test.TriggerEvent("Help"))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case	'TypeOf'
		If rb_test.TypeOf( ) = RadioButton! Then
			ls_Return = "RadioButton!"
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
		lb_functionparm.AddItem('Clicked!')
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
		Return
		
	Case	'Resize'
		wf_random('integer,integer',lb_functionparm)
		
	Case	'SetPosition'		
		lb_functionparm.AddItem('ToTop!')
		lb_functionparm.AddItem('ToBottom!')
		Return
	Case 'SetRedraw'
		wf_random('Boolean',lb_functionparm)
		
	Case	'TriggerEvent'
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

type tabpage_3 from w_standard_ancestor`tabpage_3 within tab_1
end type

type cb_4 from w_standard_ancestor`cb_4 within tabpage_3
end type

type cb_3 from w_standard_ancestor`cb_3 within tabpage_3
end type

type lb_1 from w_standard_ancestor`lb_1 within tabpage_3
end type

type cb_2 from w_standard_ancestor`cb_2 within w_radiobutton_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_radiobutton_new
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

rb_test.Checked = B_Checked
rb_test.Enabled = B_Enabled
rb_test.Italic = B_Italic
rb_test.BorderStyle = stylebox!
rb_test.Underline = B_Underline
rb_test.Visible = B_Visible
rb_test.RightToLeft = B_RightToLeft
rb_test.Height = I_Height
rb_test.TextSize = I_TextSize
rb_test.Weight = I_Weight
rb_test.Width = I_Width
rb_test.X = I_X
rb_test.Y = I_Y
rb_test.BackColor = L_BackColor
rb_test.TextColor = L_TextColor
rb_test.FaceName = S_FaceName
rb_test.Tag = S_Tag
rb_test.Text = S_Text
rb_test.LeftText = B_LeftText

tab_1.tabpage_3.lb_1.Reset()

end event

type st_tip from w_standard_ancestor`st_tip within w_radiobutton_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_radiobutton_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_radiobutton_new
string text = "RadioButton"
end type

type rb_test from radiobutton within w_radiobutton_new
integer x = 101
integer y = 124
integer width = 489
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "RadioButton"
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

string ls_item,ls_status
ls_status=string(this.checked)
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+'RadioButton Clicked Event'+ '(checked='+ ls_status+')'
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

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
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+'RadioButton Constructor Event'
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
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+'RadioButton Destructor Event'
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnsetfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item,ls_status
ls_status=string(this.checked)
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"RadioButton's GetFocus Event" +'(checked='+ls_status+')'
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event losefocus;//====================================================================
// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnkillfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item,ls_status

ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"RadioButton's LostFocus Event"+"(checked="+ls_status+")"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event rbuttondown;//====================================================================
// Event: rbuttondown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	unsignedlong	flags		
//		value	integer     	xpos 		
//		value	integer     	ypos 		
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
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"RadioButton's RButtonDown Event(flags="+string(flags)+',xpos='+string(xpos)+',ypos='+string(ypos)+')'
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

