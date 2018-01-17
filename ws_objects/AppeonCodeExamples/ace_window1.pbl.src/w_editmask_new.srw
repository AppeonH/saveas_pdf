$PBExportHeader$w_editmask_new.srw
forward
global type w_editmask_new from w_standard_ancestor
end type
type em_1 from editmask within w_editmask_new
end type
end forward

global type w_editmask_new from w_standard_ancestor
string title = "EditMask"
em_1 em_1
end type
global w_editmask_new w_editmask_new

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

on w_editmask_new.create
int iCurrent
call super::create
this.em_1=create em_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
end on

on w_editmask_new.destroy
call super::destroy
destroy(this.em_1)
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
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.X = 0
This.Y = 0

st_tip.Text = "The control is EditMask."
ii_x = em_1.X
ii_y = em_1.Y
ii_width = em_1.Width
ii_height = em_1.Height
inv_util = Create n_util

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
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
//is_prop_data = "BackColor,Border,BorderStyle,DisplayData,DisplayOnly,FaceName,Enabled&
//,Limit,Italic,MinMax,Spin,Tag,Text,TextCase,TextColor,TextSize,Underline&
//,Visible,Weight,Width,X,Y"

is_prop_data = "BackColor,Border,BorderStyle,DisplayData,DisplayOnly,FaceName,Enabled,Italic,MinMax,Spin,Tag,Text,TextCase,TextColor,TextSize,Underline,Visible,Weight,Width,X,Y"

//is_fuction_data = "ClassName,Clear,Copy,Cut,Paste,Undo,GetData,GetParent,Hide,LineCount,Move,PostEvent,ReplaceText,Resize,SelectedText,SelectText,SetFocus,SetMask,SetRedraw,Show,TextLine,TriggerEvent,TypeOf"
is_fuction_data = "ClassName,Clear,Copy,Cut,Paste,GetData,GetParent,Hide,LineCount,Move,PostEvent,ReplaceText,Resize,SelectedText,SelectText,SetFocus,SetMask,SetRedraw,Show,TextLine,TriggerEvent,TypeOf"


end event

type tab_1 from w_standard_ancestor`tab_1 within w_editmask_new
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
String ls_Return

If lb_prop.SelectedIndex() < 0 Then
	iFlag = 1
	MessageBox('Warning','Please select testing property.')
	Return
End If
iFlag = 0

Choose Case is_select_data
	Case 'BackColor'
		ls_Return = String(em_1.BackColor)
	Case 'Tag'
		ls_Return = String(em_1.Tag)
	Case 'Border'
		ls_Return = String(em_1.Border)
	Case 'BorderStyle'
		Choose Case em_1.BorderStyle
			Case StyleLowered!
				ls_Return = 'StyleLowered!'
			Case StyleRaised!
				ls_Return = 'StyleRaised!'
			Case StyleBox!
				ls_Return = 'StyleBox!'
			Case StyleShadowBox!
				ls_Return = 'StyleShadowBox!'
		End Choose
	Case 'DisplayData'
		ls_Return = String(em_1.DisplayData)  
	Case 'DisplayOnly'
		ls_Return = String(em_1.DisplayOnly)
	Case 'Enabled'
		ls_Return = String(em_1.Enabled)
	Case 'FaceName'
		ls_Return = em_1.FaceName
	Case 'Height'
		ls_Return = String(em_1.Height)
	Case 'Limit'
		ls_Return = String(em_1.Limit)
	Case 'Italic'
		ls_Return = String(em_1.Italic)
//	Case 'RightToLeft'
//		ls_Return = String(RightToLeft)
	Case 'Spin'
		ls_Return = String(em_1.Spin)
	Case 'MinMax'
		ls_Return = em_1.MinMax
	Case 'Text'
		ls_Return = em_1.Text
	Case 'TextColor'
		ls_Return = String(em_1.TextColor)
	Case 'TextSize'
		ls_Return = String(em_1.TextSize)
	Case 'TextCase'
		If em_1.TextCase = Upper! Then ls_Return = "Upper!"
		
		If em_1.TextCase = Lower! Then ls_Return = "Lower!"
		
		If	em_1.TextCase = AnyCase! Then ls_Return = "AnyCase!"
		
	Case 'Underline'
		ls_Return = String(em_1.Underline)
	Case 'Visible'
		ls_Return = String(em_1.Visible)
	Case 'Weight'
		ls_Return = String(em_1.Weight)
	Case 'Width'
		ls_Return = String(em_1.Width)
	Case 'X'
		ls_Return = String(em_1.X)
	Case 'Y'
		ls_Return = String(em_1.Y)
End Choose
ls_Return = inv_util.of_convert_to_upper(ls_Return)

st_tip.Text = "The EditMask's "+is_select_data+" property is "+ls_Return+"."


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
String ls_Param

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

String ls_Return

Choose Case is_select_data
	Case 'BackColor'
		em_1.BackColor = Long(ls_Param)
		ls_Return = String(em_1.BackColor)
	Case 'Border'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			em_1.Border = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Return = String(em_1.Border)
	Case 'Tag'
		em_1.Tag = ls_Param
		ls_Return = em_1.Tag
		
	Case  'FaceName'
		If ls_Param = 'Arial' Then
			em_1.FaceName = "Arial"			
		ElseIf ls_Param = 'Courier' Then
			em_1.FaceName = "Courier"			
		ElseIf ls_Param = 'Fixedsys' Then
			em_1.FaceName = "Fixedsys"			
		ElseIf ls_Param = 'MS Sans Serif' Then
			em_1.FaceName = "MS Sans Serif"			
		ElseIf ls_Param = 'Modern' Then
			em_1.FaceName = "Modern"			
		End If	
		
		ls_Return = em_1.FaceName
		
	Case 'BorderStyle'
		Choose Case ls_Param
			Case 'StyleLowered!'
				em_1.BorderStyle = StyleLowered!
				If em_1.BorderStyle = StyleLowered! Then
					ls_Return = 'StyleLowered!'
				ElseIf em_1.BorderStyle = StyleRaised! Then
					ls_Return = 'StyleRaised!'
				End If
			Case 'StyleRaised!'
				em_1.BorderStyle = StyleRaised!
				If em_1.BorderStyle = StyleRaised! Then
					ls_Return = 'StyleRaised!'
				End If
			Case 'StyleBox!'
				em_1.BorderStyle = StyleBox!
				If em_1.BorderStyle = StyleBox! Then
					ls_Return = 'StyleBox!'
				End If
			Case 'StyleShadowBox!'
				em_1.BorderStyle = StyleShadowBox!
				If em_1.BorderStyle = StyleShadowBox! Then
					ls_Return = 'StyleShadowBox!'
				End If
		End Choose
	Case 'DisplayData'
			em_1.DisplayData = ls_Param
			ls_Return = em_1.DisplayData
	Case 'DisplayOnly'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			em_1.DisplayOnly = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Return = String(em_1.DisplayOnly)
	Case 'Enabled'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			em_1.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Return = String(em_1.Enabled)
		
	Case 'Height'
		em_1.Height = Integer(ls_Param)
		ls_Return = String(em_1.Height)
	Case 'Italic'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			em_1.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Return = String(em_1.Italic)
//	Case 'RightToLeft'
//		If Len(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
//		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
//			em_1.RightToLeft = inv_util.of_string_to_boolean(ls_Param)
//		Else
//			MessageBox('Warning','Parameter type error.')
//			Return
//		End If
//		ls_Return = String(em_1.RightToLeft)	
	Case 'Spin'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			em_1.Spin = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Return = String(em_1.Spin)	

	Case 'MinMax'
		em_1.MinMax = ls_Param
		ls_Return = em_1.MinMax
	Case 'Text'
		em_1.Text = ls_Param
		ls_Return = em_1.Text
	Case 'TextColor'
		em_1.TextColor = Long(ls_Param)
		ls_Return = String(em_1.TextColor)
	Case 'TextSize'
		em_1.TextSize = Integer(ls_Param)
		ls_Return = String(em_1.TextSize)
	Case 'TextCase'
		Choose Case ls_Param
			Case 'AnyCase!'
				em_1.TextCase = AnyCase!
				If em_1.TextCase = AnyCase!Then
				  ls_Return =  ls_Param 
			End If
		Case 'Lower!'
			em_1.TextCase = Lower!
			If em_1.TextCase = Lower! Then
				ls_Return = ls_Param
			End If
		Case 'Upper!'
			em_1.TextCase = Upper!
			If em_1.TextCase = Upper! Then
				ls_Return = ls_Param
			End If
	End Choose
Case 'Underline'
	If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
	If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
		em_1.Underline = inv_util.of_string_to_boolean(ls_Param)
	Else
		MessageBox('Warning','Parameter type error.')
		Return
	End If
	ls_Return = String(em_1.Underline)
Case 'Visible'
	If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
	If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
		em_1.Visible = inv_util.of_string_to_boolean(ls_Param)
	Else
		MessageBox('Warning','Parameter type error.')
		Return
	End If
	ls_Return = String(em_1.Visible)
	
Case 'Weight'
	em_1.Weight = Integer(ls_Param)
	ls_Return = String(em_1.Weight)
Case 'Limit'
	em_1.Limit = Integer(ls_Param)
	ls_Return = String(em_1.Limit)
	
Case 'Width'
	em_1.Width = Integer(ls_Param)
	ls_Return = String(em_1.Width)
	
Case 'X'
	em_1.X = Integer(ls_Param)
	ls_Return = String(em_1.X)
Case 'Y'
	em_1.Y = Integer(ls_Param)
	ls_Return = String(em_1.Y)
End Choose
ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The EditMask's "+is_select_data+" property is set to "+ls_Return+"."



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
is_select_data = lb_prop.SelectedItem()
Choose Case lb_prop.SelectedItem()
	Case 'BackColor'
		wf_random('color',lb_propparm)
	Case 'Border'
		wf_random('boolean',lb_propparm)
	Case 'BorderStyle'
		lb_propparm.AddItem("StyleBox!")
		lb_propparm.AddItem("StyleLowered!")
		lb_propparm.AddItem("StyleRaised!")
		//lb_propparm.AddItem("StyleShadowBox!")
		Return
	Case 'FaceName'
		wf_random('Font',lb_propparm)		
		return	
	Case 'DisplayOnly'
		wf_random('boolean',lb_propparm)
	Case 'DisplayData'
		wf_random('string',lb_propparm)
	Case 'Enabled'
		wf_random('boolean',lb_propparm)		
	Case 'Limit'
		wf_random('integer',lb_propparm)
		lb_propparm.AddItem('12')
		Return
	Case 'Height'
		wf_random('integer',lb_propparm)
	Case 'Limit'
		wf_random('integer',lb_propparm)		
	Case 'Italic'
		wf_random('boolean',lb_propparm)
//	Case 'RightToLeft'
//		wf_random('boolean',lb_propparm)
	Case 'Spin'
		wf_random('boolean',lb_propparm)
	Case 'Tag'
		wf_random('string',lb_propparm)	
	Case 'MinMax'
		lb_propparm.AddItem('1 ~~ 10')
		lb_propparm.AddItem('10 ~~ 100')
		lb_propparm.AddItem('100 ~~ 1000')
		lb_propparm.AddItem('500 ~~ 10000')
		Return
	Case 'Text'
		wf_random('string',lb_propparm)
	Case 'TextColor'
		wf_random('color',lb_propparm)
	Case 'TextSize'
		wf_random('integer',lb_propparm)
	Case 'TextCase'
		lb_propparm.AddItem('AnyCase!')
		lb_propparm.AddItem('Lower!')
		lb_propparm.AddItem('Upper!')
		Return		
	Case 'Underline'
		wf_random('boolean',lb_propparm)
	Case 'Visible'
		wf_random('boolean',lb_propparm)
	Case 'Weight'
		wf_random('integer',lb_propparm)		
	Case 'Width'
		wf_random('integer',lb_propparm)
	Case 'X'
		wf_random('integer',lb_propparm)
	Case 'Y'
		wf_random('integer',lb_propparm)
	Case 'FaceName'
		wf_random('Font',lb_propparm)
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
String ls_Param

ls_Param = Trim(sle_functionparm.Text)
If lb_function.SelectedIndex() < 0 Then	
	MessageBox('Warning','Please select testing function.')
	Return
End If
If ls_Param = '' And lb_functionparm.TotalItems() > 0  Then	
	MessageBox('Warning','Please select testing data.')
	Return
End If

String ls_Return
Integer ii_x1,ii_y1,li_count
String ls_ParamArray[]

li_count = wf_str2array(ls_Param,ls_ParamArray)
If lb_function.SelectedItem() = '' Or IsNull(lb_function.SelectedItem()) Then
	MessageBox("Warning","Please select testing function.")
	Return
End If
Choose Case lb_function.SelectedItem()
	Case	'ClassName'
		ls_Return = String(em_1.ClassName())
	Case	'Hide'
		ls_Return = String(em_1.Hide())
	Case'Show'
		ls_Return = String(em_1.Show())
	Case	'LineCount'
		ls_Return = String(em_1.LineCount())
	Case'SetMask'
		If li_count <> 2 Then
			MessageBox("Warning","Parameter number should be 2.")
			Return
		End If
		Choose Case ls_ParamArray[1]
			Case 'DateMask!'
				ls_Return = String(em_1.SetMask(DateMask!,ls_ParamArray[2]))
			Case 'DateTimeMask!'
				ls_Return = String(em_1.SetMask(DateTimeMask!,ls_ParamArray[2]))
			Case 'DecimalMask!'
				ls_Return = String(em_1.SetMask(DecimalMask!,ls_ParamArray[2]))
			Case 'NumericMask!'
				ls_Return = String(em_1.SetMask(NumericMask!,ls_ParamArray[2]))
			Case 'StringMask!'
				ls_Return = String(em_1.SetMask(StringMask!,ls_ParamArray[2]))
			Case 'TimeMask!'
				ls_Return = String(em_1.SetMask(TimeMask!,ls_ParamArray[2]))
			Case Else
				MessageBox("Warning","Parameter error.")
		End Choose
	Case	'LineLength'
		ls_Return = String(em_1.LineLength())
	Case	'ReplaceText'
		ls_Return = String(em_1.ReplaceText(ls_Param))
	Case	'SelectedLength'
		ls_Return = String(em_1.SelectedLength())
		Case'SelectedStart'
		ls_Return = String(em_1.SelectedStart())
	Case	'TextLine'
		ls_Return = String(em_1.TextLine())
	Case	'Move'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		If li_count <> 2 Then
			MessageBox("Warning","Parameter number should be 2.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		ls_Return = String(em_1.Move(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
	Case	'Clear'
		   em_1.SelectText(1,LenA(em_1.Text)) 
		   ls_Return = String(em_1.Clear( ))
		
	Case 'Copy'
		     em_1.SelectText(1,LenA(em_1.Text))  
			  ls_Return = String(em_1.Copy( ))
		
	Case 'Cut'
		   em_1.SelectText(1,LenA(em_1.Text)) 
			ls_Return = String(em_1.Cut( ))
		
	Case 'Paste'
			ls_Return = String(em_1.Paste( ))
//	Case 'Undo'	
//			ls_Return = String(em_1.Undo())
	Case	'GetData'
		Choose Case em_1.MaskDataType
			Case DateMask!
				Date ld_test
				ls_Return = String(Date(em_1.GetData(ld_test)))
				If Not IsNull(ls_Return) Then
					ls_Return = '1'
				Else
					ls_Return = '0'
				End If
			Case DateTimeMask!
				DateTime ldt_test
				ls_Return = String(DateTime(em_1.GetData(ldt_test)))
				If  Not IsNull(ls_Return) Then
					ls_Return = '1'
				Else
					ls_Return = '0'
				End If
			Case DecimalMask!
				Dec{2} ldc_test
				ls_Return = String(em_1.GetData(ldc_test))
			Case NumericMask!
				Dec lnu_test
				ls_Return = String(em_1.GetData(lnu_test))
			Case StringMask!
				String ls_test
				ls_Return = String(em_1.GetData(ls_test))
			Case TimeMask!
				Time lt_test
				ls_Return = String(em_1.GetData(lt_test))
		End Choose
	Case	'Resize'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		If li_count <> 2 Then
			MessageBox("Warning","Parameter number should be 2.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		ls_Return = String(em_1.Resize(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
	Case	'SetFocus'
		ls_Return = String(em_1.SetFocus())
	Case 'GetParent'
		window  ls_win
		ls_win = em_1.GetParent()
		ls_Return = ls_win.ClassName()
		
	Case 'TypeOf'
		If em_1.TypeOf() = editmask! Then
			ls_Return = 'editmask!'
		Else
			ls_Return = 'invalid!'
		End If
	Case 'SetPosition'
		Choose Case ls_Param			
			Case 'ToTop!'
				ls_Return = String(em_1.SetPosition(ToTop!))
			Case 'ToBottom!'
				ls_Return = String(em_1.SetPosition(ToBottom!))
			Case Else
				MessageBox("Warning","Parameter error.")
				Return
		End Choose
	Case 'SetRedraw'
		  ls_return = string(em_1.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
	Case 'SelectedText'
		ls_Return = String(em_1.SelectedText())
	Case 'SelectText'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		If li_count <> 2 Then
			MessageBox("Warning","Parameter number should be 2.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		ls_Return = String(em_1.SelectText(Long(ls_ParamArray[1]),Long(ls_ParamArray[2])))
	Case 'PostEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(em_1.PostEvent(Constructor!))
			Case 'Destructor!'
				ls_Return = String(em_1.PostEvent(Destructor!))
			Case 'GetFocus!'
				ls_Return = String(em_1.PostEvent(GetFocus!))
			Case 'LoseFocus!'
				ls_Return = String(em_1.PostEvent(LoseFocus!))
			Case 'RButtonDown!'
				ls_Return = String(em_1.PostEvent(RButtonDown!))
			Case 'Help'
				ls_Return = String(em_1.PostEvent('Help'))
			Case 'Modified!'
				ls_Return = String(em_1.PostEvent(Modified!))
		End Choose
	Case 'TriggerEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(em_1.TriggerEvent(Constructor!))
			Case 'Destructor!'
				ls_Return = String(em_1.TriggerEvent(Destructor!))
			Case 'GetFocus!'
				ls_Return = String(em_1.TriggerEvent(GetFocus!))
			Case 'LoseFocus!'
				ls_Return = String(em_1.TriggerEvent(LoseFocus!))
			Case 'RButtonDown!'
				ls_Return = String(em_1.TriggerEvent(RButtonDown!))
			Case 'Help'
				ls_Return = String(em_1.PostEvent('Help'))
			Case 'Modified!'
				ls_Return = String(em_1.TriggerEvent(Modified!))
		End Choose
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
	Case 'GetData'
	Case 'SetMask'
		lb_functionparm.AddItem('DateMask!,mm/dd/yyyy')
		lb_functionparm.AddItem('DateTimeMask!,mm/dd/yyyy hh:mm:ss')
		lb_functionparm.AddItem('DecimalMask!,######.00')
		lb_functionparm.AddItem('NumericMask!,######.00')
		lb_functionparm.AddItem('StringMask!,###-##-####')
		lb_functionparm.AddItem('TimeMask!,hh:mm:ss')
		Return
	Case 'Resize'
		wf_random('integer,integer',lb_functionparm)
	Case 'ReplaceText'
		wf_random('string',lb_functionparm)
		lb_functionparm.AddItem('aa')
		Return
	Case 'SelectText'
		wf_random('long,long',lb_functionparm)
		lb_functionparm.AddItem('1,1')
		Return
	Case 'Text'
		wf_random('integer',lb_functionparm)
		lb_functionparm.AddItem('1')
		Return
	Case 'SetRedraw'
		 wf_random('boolean',lb_functionparm)
	Case 'SetPosition'		
		lb_functionparm.AddItem('ToTop!')
		lb_functionparm.AddItem('ToBottom!')
		Return
		Case'PostEvent'
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
		//lb_functionparm.additem('Help')
		lb_functionparm.AddItem('Modified!')
		Return
		Case'TriggerEvent'
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
		//lb_functionparm.additem('Help')
		lb_functionparm.AddItem('Modified!')
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

type cb_2 from w_standard_ancestor`cb_2 within w_editmask_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_editmask_new
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

em_1.BackColor = RGB(255,255,255)
em_1.BorderStyle = StyleLowered!
//em_1.DisplayOnly = True
em_1.Enabled = True
em_1.FaceName = "MS Scans Serif"
em_1.Height = ii_height
em_1.Italic = False
em_1.RightToLeft = False
em_1.Limit = 0
em_1.SetMask(numericmask!,'###,###.00')
em_1.Text = "12345.67"
em_1.TextColor = RGB(0,0,0)
em_1.TextCase = anycase!
em_1.TextSize = -8
em_1.Underline = False
em_1.Visible = True
em_1.Weight = 400
em_1.Width = ii_width
em_1.Height = ii_height
em_1.X = ii_x
em_1.Y = ii_y
em_1.Spin = False

end event

type st_tip from w_standard_ancestor`st_tip within w_editmask_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_editmask_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_editmask_new
string text = "EditMask"
end type

type em_1 from editmask within w_editmask_new
integer x = 101
integer y = 120
integer width = 795
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "12345.67"
borderstyle borderstyle = stylelowered!
string mask = "####,###.00"
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"EditMask's Constructor Event"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

end event

event destructor;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"EditMask's Destructor Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event getfocus;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"EditMask's GetFocus Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event losefocus;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"EditMask's LoseFocus Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event modified;string ls_item,ls_stat
ls_stat=em_1.text
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"EditMask's Modified Event"+" ("+ls_stat+")"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event rbuttondown;
string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"RButtomDown's GetFocus Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

