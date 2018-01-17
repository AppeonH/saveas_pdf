$PBExportHeader$w_listbox_new.srw
forward
global type w_listbox_new from w_standard_ancestor2
end type
type lb_1 from listbox within w_listbox_new
end type
end forward

global type w_listbox_new from w_standard_ancestor2
string title = "ListBox"
lb_1 lb_1
end type
global w_listbox_new w_listbox_new

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

on w_listbox_new.create
int iCurrent
call super::create
this.lb_1=create lb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_1
end on

on w_listbox_new.destroy
call super::destroy
destroy(this.lb_1)
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
st_tip.text="The control is ListBox."
ii_x=lb_1.X
ii_y=lb_1.Y
ii_width=lb_1.Width
ii_height=lb_1.Height
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

is_fuction_data="AddItem,ClassName,DeleteItem,FindItem,GetParent&
,Hide,InsertItem,Move,PostEvent,Reset,Resize,SelectItem,SelectedItem,SelectedIndex,SetFocus,Show&
,SetState,SetRedraw,SetPosition,SetTop,State,Text,TotalItems,TotalSelected,TriggerEvent&
,Top,TypeOf"
is_prop_data="BackColor,Border,BorderStyle,Enabled,ExtendedSelect,FaceName,Height,HScrollBar,Italic,Item[ ],MultiSelect&
,RightToLeft,Sorted,Tag,TextColor,TextSize,Underline,Visible,VScrollBar,Weight,Width,X,Y"


end event

type tab_1 from w_standard_ancestor2`tab_1 within w_listbox_new
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

If lb_prop.SelectedIndex() < 0 Then
	iFlag = 1
	MessageBox('Warning','Please select testing property.')
	Return
End If

iFlag = 0

String ls_Param,strar[]
Integer li_count
String ls_Return

ls_Param = sle_propparm.Text
Choose Case lb_prop.SelectedItem()
	Case 'TextSize'
		ls_Return = String(lb_1.TextSize)
		
	Case 'Sorted'
		ls_Return = String(lb_1.Sorted)
		
	Case 'TextColor'
		ls_Return = String(lb_1.TextColor)
		
	Case 'BackColor'
		ls_Return = String(lb_1.BackColor)
		
	Case 'Italic'
		ls_Return = String(lb_1.Italic)
		
	Case 'Enabled'
		ls_Return = String(lb_1.Enabled)
		
	Case 'FaceName'
		ls_Return = lb_1.FaceName
		
	Case 'Visible'
		ls_Return = String(lb_1.Visible)
		
	Case 'Height'
		ls_Return = String(lb_1.Height)
		
	Case 'Underline'
		ls_Return = String(lb_1.Underline)
		
	Case 'Tag'
		ls_Return = lb_1.Tag
		
	Case 'Weight'
		ls_Return = String(lb_1.Weight)
		
	Case 'Width'
		ls_Return = String(lb_1.Width)
		
	Case 'X'
		ls_Return = String(lb_1.X)
		
	Case 'Y'
		ls_Return = String(lb_1.Y)
		
	Case 'ExtendedSelect'
		ls_Return = String(lb_1.ExtendedSelect)
		
	Case 'MultiSelect'
		ls_Return = String(lb_1.MultiSelect)
		
	Case 'Border'
		ls_Return = String(lb_1.Border)
		
	Case 'BorderStyle'
		Choose Case lb_1.BorderStyle
			Case StyleLowered!
				ls_Return = 'StyleLowered!'
				
			Case StyleRaised!
				ls_Return = 'StyleRaised!'
				
			Case StyleBox!
				ls_Return = 'StyleBox!'
				
			Case StyleShadowBox!
				ls_Return = 'StyleShadowBox!'
				
		End Choose
		
	Case 'HScrollBar'
		ls_Return = String(lb_1.HScrollBar)
		
	Case 'VScrollBar'
		ls_Return = String(lb_1.VScrollBar)
		
	Case 'Item[ ]'
		li_count = wf_str2array(ls_Param,strar)
		
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		
		If Not IsNumber(strar[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		If Integer(strar[1]) > UpperBound(lb_1.Item[]) Then
			MessageBox('Warning','This item does not exist.')
			Return
		End If
		
		ls_Return = lb_1.Item[Integer(strar[1])]
		st_tip.Text = "The ListBox's "+"Item[" + strar[1] + "]"+" property is "+ls_Return+"."
		Return
		
	Case 'RightToLeft'
		ls_Return = String(lb_1.RightToLeft)
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The ListBox's "+lb_prop.SelectedItem()+" property is "+ls_Return+"."


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
Integer li_count
String ls_Return,ls_ParamArray[]

li_count = wf_str2array(ls_Param,ls_ParamArray)

wf_str2array(ls_Param,ls_ParamArray)

Choose Case is_select_data
	Case 'TextSize'
		lb_1.TextSize = Integer(ls_Param)
		ls_Return = String(lb_1.TextSize)
		
	Case 'Sorted'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			lb_1.Sorted = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lb_1.Sorted)
		
	Case 'TextColor'
		lb_1.TextColor = Long(ls_Param)
		ls_Return = String(lb_1.TextColor)
		
	Case 'BackColor'
		lb_1.BackColor = Long(ls_Param)
		ls_Return = String(lb_1.BackColor)
		
	Case 'Italic'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			lb_1.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lb_1.Italic)
		
	Case 'Enabled'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			lb_1.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lb_1.Enabled)
		
	Case 'FaceName'
		lb_1.FaceName = ls_Param
		ls_return = lb_1.FaceName
		
	Case 'Visible'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			lb_1.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lb_1.Visible)
		
	Case 'Height'
		lb_1.Height = Integer(ls_Param)
		ls_Return = String(lb_1.Height)
		
	Case 'Underline'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			lb_1.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lb_1.Underline)
		
	Case 'Tag'
		lb_1.Tag = ls_Param
		ls_Return = lb_1.Tag
		
	Case 'Weight'
		lb_1.Weight = Integer(ls_Param)
		ls_Return = String(lb_1.Weight)
		
	Case 'Width'
		lb_1.Width = Integer(ls_Param)
		ls_Return = String(lb_1.Width)
		
	Case 'X'
		lb_1.X = Integer(ls_Param)
		ls_Return = String(lb_1.X)
		
	Case 'Y'
		lb_1.Y = Integer(ls_Param)
		ls_Return = String(lb_1.Y)
		
	Case 'ExtendedSelect'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			lb_1.ExtendedSelect = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lb_1.ExtendedSelect)
		
	Case 'MultiSelect'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			lb_1.MultiSelect = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lb_1.MultiSelect)
		
	Case 'Border'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			lb_1.Border = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lb_1.Border)
		
	Case 'BorderStyle'
		Choose Case ls_Param
			Case 'StyleRaised!'
				lb_1.BorderStyle = StyleRaised!
				If lb_1.BorderStyle = StyleRaised! Then
					ls_Return = 'StyleRaised!'
				End If
				
			Case 'StyleLowered!'
				lb_1.BorderStyle = StyleLowered!
				If lb_1.BorderStyle = StyleLowered! Then
					ls_Return = 'StyleLowered!'
				End If
				
			Case 'StyleBox!'
				lb_1.BorderStyle = StyleBox!
				If lb_1.BorderStyle = StyleBox! Then
					ls_Return = 'StyleBox!'
				End If
				
			Case 'StyleShadowBox!'
				lb_1.BorderStyle = StyleShadowBox!
				If lb_1.BorderStyle = StyleShadowBox! Then
					ls_Return = 'StyleShadowBox!'
				End If
				
		End Choose
		
	Case 'HScrollBar'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			lb_1.HScrollBar = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lb_1.HScrollBar)
		
	Case 'VScrollBar'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			lb_1.VScrollBar = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lb_1.VScrollBar)
		
	Case 'Item[ ]'
		If LenA(ls_Param) = 0 Then Return
		
		If li_count < 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1]) Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		lb_1.Item[Integer(ls_ParamArray[1])] = ls_ParamArray[2]
		ls_Param = ls_ParamArray[2]
		st_tip.Text = "The ListBox "+"Item[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Param+"."
		Return
		
	Case 'RightToLeft'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			lb_1.RightToLeft = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lb_1.RightToLeft)
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The ListBox's "+is_select_data+" property is set to "+ls_Return+"."


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
sle_propparm.Text = ''

is_select_data = lb_prop.SelectedItem()

Choose Case lb_prop.SelectedItem()
	Case 'TextSize'
		wf_random('TSize',lb_propparm)
		Return
		
	Case 'TextColor'
		wf_random('color',lb_propparm)
		
	Case 'BackColor'
		wf_random('Color',lb_propparm)
		
	Case 'Italic'
		wf_random('boolean',lb_propparm)
		
	Case 'Enabled'
		wf_random('boolean',lb_propparm)
		
	Case 'RightToLeft'
		wf_random('boolean',lb_propparm)
		
	Case 'FaceName'
		wf_random('Font',lb_propparm)
		
	Case 'Visible'
		wf_random('boolean',lb_propparm)
		
	Case 'Height'
		wf_random('integer',lb_propparm)
		
	Case 'Underline'
		wf_random('boolean',lb_propparm)
		
	Case 'Tag'
		wf_random('string',lb_propparm)
		
	Case 'Weight'
		wf_random('weight',lb_propparm)
		
	Case 'Width'
		wf_random('integer',lb_propparm)
		
	Case 'X'
		wf_random('integer',lb_propparm)
		
	Case 'Y'
		wf_random('integer',lb_propparm)
		
	Case 'ExtendedSelect'
		wf_random('boolean',lb_propparm)
		
	Case 'MultiSelect'
		wf_random('boolean',lb_propparm)
		
	Case 'Border'
		wf_random('boolean',lb_propparm)
		
	Case 'BorderStyle'
		lb_propparm.AddItem('StyleLowered!')
		lb_propparm.AddItem('StyleRaised!')
		lb_propparm.AddItem('StyleBox!')
		//lb_propparm.AddItem('StyleShadowBox!')
		Return
		
	Case 'HScrollBar'
		wf_random('boolean',lb_propparm)
		
	Case 'Sorted'
		wf_random('boolean',lb_propparm)
		
	Case 'VScrollBar'
		wf_random('boolean',lb_propparm)
		
	Case 'Item[ ]'
		wf_random('index,string',lb_propparm)
		lb_propparm.AddItem('1,mm')
		Return
		
End Choose



end event

type sle_propparm from w_standard_ancestor2`sle_propparm within tabpage_1
end type

type tabpage_2 from w_standard_ancestor2`tabpage_2 within tab_1
end type

type cb_execute from w_standard_ancestor2`cb_execute within tabpage_2
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

String ls_Param
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
Boolean lb_data
String ls_Return
Integer ii_x1,ii_y1,li_count
String ls_ParamArray[]

li_count = wf_str2array(ls_Param,ls_ParamArray)
If lb_function.SelectedItem() = '' Or IsNull(lb_function.SelectedItem()) Then
	MessageBox("Warning","Please select testing function.")
	Return
End If

Choose Case lb_function.SelectedItem()
	Case  'AddItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		ls_Return = String(lb_1.AddItem(ls_Param))
		
	Case	'ClassName'
		ls_Return = lb_1.ClassName()
		
	Case	'Reset'
		ls_Return = String(lb_1.Reset())
		
	Case 'DeleteItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(lb_1.DeleteItem(Integer(ls_Param)))
		
	Case 'FindItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(lb_1.FindItem(ls_ParamArray[1],Integer(ls_ParamArray[2])))
		
	Case	'Hide'
		ls_Return = String(lb_1.Hide())
		
	Case 'InsertItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If li_count <> 2 Then
			MessageBox("Warning","Parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(lb_1.InsertItem(ls_ParamArray[1],Integer(ls_ParamArray[2])))
		
		Case'Show'
		ls_Return = String(lb_1.Show())
		
	Case	'Move'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(lb_1.Move(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
		
		Case'TypeOf'
		If lb_1.TypeOf() = listbox! Then
			ls_Return = 'listbox!'
		Else
			ls_Return = 'Null!'
		End If
		
	Case	'Resize'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(lb_1.Resize(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
		
	Case	'SetFocus'
		ls_Return = String(lb_1.SetFocus())
		
	Case 'SetRedraw'
		ls_Return = String(lb_1.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
		
	Case 'SelectItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(lb_1.SelectItem (ls_ParamArray[1],Integer(ls_ParamArray[2])))
		
	Case 'Text'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = lb_1.Text (Integer(ls_Param))
		
	Case 'TotalItems'
		ls_Return = String(lb_1.TotalItems())
		
	Case 'GetParent'
		window  ls_win
		ls_win = lb_1.GetParent()
		ls_Return = ls_win.ClassName()
		
	Case 'SetState'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		If (Lower(Trim(ls_ParamArray[2])) <> "true") And (Lower(Trim(ls_ParamArray[2])) <> "false")  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ii_x1 = Integer(ls_ParamArray[1])
		lb_data = inv_util.of_string_to_boolean(ls_ParamArray[2])
		ls_Return = String(lb_1.SetState(ii_x1,lb_data))
		
	Case 'TotalSelected'
		ls_Return = String(lb_1.TotalSelected())
		
	Case 'SelectedIndex'
		ls_Return = String(lb_1.SelectedIndex())
		
	Case 'SelectedItem'
		ls_Return = String(lb_1.SelectedItem())
		
	Case 'SetPosition'
		Choose Case ls_Param				
			Case 'ToTop!'
				ls_Return = String(lb_1.SetPosition(ToTop!))
				
			Case 'ToBottom!'
				ls_Return = String(lb_1.SetPosition(ToBottom!))
				
			Case Else
				MessageBox("Warning","Parameter error.")
				
		End Choose
		
	Case 'SetTop'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(lb_1.SetTop(Integer(ls_ParamArray[1])))
		
	Case 'State'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If  Not IsNumber(ls_ParamArray[1])   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(lb_1.State(Integer(ls_ParamArray[1])))
		
	Case 'Top'
		ls_Return = String(lb_1.Top())
		
	Case 'PostEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(lb_1.PostEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(lb_1.PostEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(lb_1.PostEvent(Destructor!))
				
			Case 'GetFocus!'
				ls_Return = String(lb_1.PostEvent(GetFocus!))
				
			Case 'Help'
				ls_Return = String(lb_1.PostEvent('Help'))
				
			Case 'LoseFocus!'
				ls_Return = String(lb_1.PostEvent(LoseFocus!))
				
			Case 'RButtonDown!'
				ls_Return = String(lb_1.PostEvent(RButtonDown!))
				
			Case 'DoubleClicked!'
				ls_Return = String(lb_1.PostEvent(DoubleClicked!))
				
			Case 'SelectionChanged!'
				ls_Return = String(lb_1.PostEvent(SelectionChanged!))
				
			Case 'Modified!'
				ls_Return = String(lb_1.PostEvent(Modified!))
				
		End Choose
		
	Case 'TriggerEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(lb_1.TriggerEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(lb_1.TriggerEvent(Destructor!))
				
			Case 'GetFocus!'
				ls_Return = String(lb_1.TriggerEvent(GetFocus!))
				
			Case 'Help'
				ls_Return = String(lb_1.TriggerEvent('Help'))
				
			Case 'LoseFocus!'
				ls_Return = String(lb_1.TriggerEvent(LoseFocus!))
				
			Case 'RButtonDown!'
				ls_Return = String(lb_1.TriggerEvent(RButtonDown!))
				
			Case 'DoubleClicked!'
				ls_Return = String(lb_1.TriggerEvent(DoubleClicked!))
				
			Case 'SelectionChanged!'
				ls_Return = String(lb_1.TriggerEvent(SelectionChanged!))
				
			Case 'Modified!'
				ls_Return = String(lb_1.TriggerEvent(Modified!))
				
		End Choose
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "Function "+lb_function.SelectedItem()+" is executed. The return value is " + ls_Return + "."




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
		
	Case 'Resize'
		wf_random('integer,integer',lb_functionparm)
		
	Case 'AddItem'
		wf_random('string',lb_functionparm)
		
	Case 'DeleteItem'
		wf_random('index',lb_functionparm)
		Return
		
	Case 'FindItem'
		wf_random('string,index',lb_functionparm)
		Return
		
	Case 'InsertItem'
		wf_random('string,index',lb_functionparm)
		Return
		
	Case 'SetState'
		wf_random('index,5boolean',lb_functionparm)
		Return
		
   Case 'SetRedraw'
		wf_random('boolean',lb_functionparm)
		Return
		
	Case 'SelectItem'
		wf_random('string,index',lb_functionparm)
		Return
		
	Case 'Text'
		wf_random('index',lb_functionparm)
		Return
		
	Case 'State'
		wf_random('index',lb_functionparm)
		Return
		
	Case 'SetTop'
		wf_random('index',lb_functionparm)
		Return
		
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
		
		lb_functionparm.AddItem('SelectionChanged!')
		lb_functionparm.AddItem('DoubleClicked!')
		Return
		
		Case'TriggerEvent'
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
		
		lb_functionparm.AddItem('SelectionChanged!')
		lb_functionparm.AddItem('DoubleClicked!')
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

type cb_2 from w_standard_ancestor2`cb_2 within w_listbox_new
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_listbox_new
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

lb_1.reset()

lb_1.Visible = TRUE
lb_1.Enabled = TRUE
lb_1.tag=''
lb_1.TextColor = Rgb(0,0,0)
lb_1.BackColor = Rgb(255,255,255)
lb_1.border=true
lb_1.Italic = FALSE
lb_1.FaceName = "MS Scans Serif"
lb_1.TextSize =-8
lb_1.Weight = 400
lb_1.UnderLine = FALSE
lb_1.X=ii_x
lb_1.Y=ii_y
lb_1.Width=ii_width
lb_1.Height=ii_height
lb_1.borderstyle=StyleLowered!
lb_1.HScrollBar=false
lb_1.VScrollBar=false
lb_1.sorted=true
lb_1.multiselect=false
lb_1.extendedselect=false
lb_1.RightToLeft = False
lb_1.additem('Sybase')
lb_1.additem('Jaguar Manager')
lb_1.additem('Jaguar Server')
lb_1.additem('Database')
lb_1.additem('PowerBuilder')


end event

type st_tip from w_standard_ancestor2`st_tip within w_listbox_new
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_listbox_new
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_listbox_new
string text = "ListBox"
end type

type lb_1 from listbox within w_listbox_new
integer x = 101
integer y = 116
integer width = 1573
integer height = 320
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string item[] = {"Sybase","Jaguar Manage","Jaguar Server","PowerBuilder","Database"}
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListBox Constructor Event"
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListBox's Destructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbndblclk]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item,ls_status
ls_status = lb_1.selecteditem()
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListBox's DoubleClicked Event" +"(index=" +string(index)+")" +"(item="+ ls_status+ ", selectedindex="+string(this.selectedindex())+")"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_lbnsetfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListBox's Getfocus Event "
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event losefocus;//====================================================================
// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_lbnkillfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item,ls_status
ls_status = lb_1.selecteditem()
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListBox's Lostfocus Event" +"(Item=" +ls_status+")"
tab_1.tabpage_3.lb_out.additem(ls_item)
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListBox's RButtondown Event (flags=" + string(flags)+',xpos='+string(xpos)+',ypos='+string(ypos)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item,ls_status
ls_status = lb_1.selecteditem()
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListBox's SelectionChanged Event " +"(index="+string(index)+"),(item="+ ls_status+ ", selectedindex="+string(this.selectedindex())+")" 
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

