$PBExportHeader$w_dropdownlistbox_new.srw
forward
global type w_dropdownlistbox_new from w_standard_ancestor
end type
type ddlb_case from dropdownlistbox within w_dropdownlistbox_new
end type
end forward

global type w_dropdownlistbox_new from w_standard_ancestor
string title = "DropDownListBox"
ddlb_case ddlb_case
end type
global w_dropdownlistbox_new w_dropdownlistbox_new

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

on w_dropdownlistbox_new.create
int iCurrent
call super::create
this.ddlb_case=create ddlb_case
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_case
end on

on w_dropdownlistbox_new.destroy
call super::destroy
destroy(this.ddlb_case)
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
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
st_tip.Text = "The control is DropDownListBox."

is_prop_data = "BackColor,BorderStyle,Enabled,FaceName,Height,Italic,Item[],RightToLeft,Sorted&
,Tag,Text,TextColor,TextSize,Underline,Visible,Weight,Width,X,Y"
is_fuction_data = "AddItem,ClassName,Clear,Copy,Cut,Paste,DeleteItem,DirList,DirSelect,FindItem,GetParent&
,Hide,InsertItem,Move,PostEvent,Reset,Resize,ReplaceText,SelectText,SelectedText,SetFocus,SelectItem&
,SetRedraw,Show,Text,TriggerEvent,TotalItems,TypeOf"


end event

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
ii_x = ddlb_case.X
ii_y = ddlb_case.Y
ii_width = ddlb_case.Width
ii_height = ddlb_case.Height


ddlb_case.SelectItem(1)
inv_util = Create n_util

end event

type tab_1 from w_standard_ancestor`tab_1 within w_dropdownlistbox_new
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

String ls_Param
String ls_return,ls_ParamArray[]

ls_Param = sle_propparm.Text
wf_str2array(ls_Param,ls_ParamArray)
Choose Case is_select_data
	Case 'BorderStyle'
		Choose Case ddlb_case.BorderStyle
			Case StyleLowered!
				ls_Return = 'StyleLowered!'
			Case StyleRaised!
				ls_Return = 'StyleRaised!'
			Case StyleBox!
				ls_Return = 'StyleBox!'
			Case StyleShadowBox!
				ls_Return = 'StyleShadowBox!'
		End Choose

	Case 'Text'
		ls_return = ddlb_case.Text
	Case 'TextSize'
		ls_return = String(ddlb_case.TextSize)
	Case 'Item[]'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		If Integer(ls_ParamArray[1]) > UpperBound(ddlb_case.Item[]) Then
			MessageBox('Warning','This item does not exist.')
			Return
		End If
		ls_return = ddlb_case.Item[Integer(ls_ParamArray[1])]
		st_tip.Text = "The DropDownListBox's "+"Item[" + ls_ParamArray[1] + "]"+" property is "+ls_return+"."
		Return
		
	Case 'TextColor'
		ls_return = String(ddlb_case.TextColor)
	Case 'BackColor'
		ls_return = String(ddlb_case.BackColor)
	Case 'Italic'
		ls_return = String(ddlb_case.Italic)
	Case 'Enabled'
		ls_return = String(ddlb_case.Enabled)
	Case 'FaceName'
		ls_return = ddlb_case.FaceName
	Case 'Visible'
		ls_return = String(ddlb_case.Visible)
	Case 'Height'
		ls_return = String(ddlb_case.Height)
	Case 'Underline'
		ls_return = String(ddlb_case.Underline)
	Case 'Tag'
		ls_return = ddlb_case.Tag
	Case 'Width'
		ls_return = String(ddlb_case.Width)
	Case 'Weight'
		ls_return = String(ddlb_case.Weight)
	Case 'X'
		ls_return = String(ddlb_case.X)
	Case 'Y'
		ls_return = String(ddlb_case.Y)		
	Case 'Sorted'
		ls_return = String(ddlb_case.Sorted)
	Case 'RightToLeft'
		ls_return = String(ddlb_case.RightToLeft)
End Choose

ls_return = inv_util.of_convert_to_upper(ls_return)
st_tip.Text = "The DropDownListBox's "+is_select_data+" property is "+ls_return+"."


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

String ls_return
Int li_count,i
String ls_ParamArray[]

li_count = wf_str2array(ls_Param,ls_ParamArray)

Choose Case is_select_data
	Case 'BorderStyle'
		Choose Case ls_Param
			Case 'StyleLowered!'
				ddlb_case.BorderStyle = StyleLowered!
				If ddlb_case.BorderStyle = StyleLowered! Then
					ls_Return = 'StyleLowered!'
				ElseIf ddlb_case.BorderStyle = StyleRaised! Then
					ls_Return = 'StyleRaised!'
				End If
			Case 'StyleRaised!'
				ddlb_case.BorderStyle = StyleRaised!
				If ddlb_case.BorderStyle = StyleRaised! Then
					ls_Return = 'StyleRaised!'
				End If
			Case 'StyleBox!'
				ddlb_case.BorderStyle = StyleBox!
				If ddlb_case.BorderStyle = StyleBox! Then
					ls_Return = 'StyleBox!'
				End If
			Case 'StyleShadowBox!'
				ddlb_case.BorderStyle = StyleShadowBox!
				If ddlb_case.BorderStyle = StyleShadowBox! Then
					ls_Return = 'StyleShadowBox!'
				End If
		End Choose
		
	Case 'Text'
		ddlb_case.Text = ls_Param
		ls_return = ddlb_case.Text
	Case 'TextSize'
		ddlb_case.TextSize = Integer(ls_Param)
		ls_return = String(ddlb_case.TextSize)
	Case 'Item[]'
		If LenA(ls_Param) = 0 Then Return
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1]) Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		ddlb_case.Item[Integer(ls_ParamArray[1])] = ls_ParamArray[2]
		ls_Param = ddlb_case.Item[Integer(ls_ParamArray[1])]
		st_tip.Text = "The DropDownListBox "+"Item[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Param+"."
		Return
	Case 'TextColor'
		ddlb_case.TextColor = Long(ls_Param)
		ls_return = String(ddlb_case.TextColor)
	Case 'BackColor'
		ddlb_case.BackColor = Long(ls_Param)
		ls_return = String(ddlb_case.BackColor)
	Case 'Italic'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddlb_case.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddlb_case.Italic)
	Case 'Enabled'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddlb_case.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddlb_case.Enabled)
		
	Case 'FaceName'
		ddlb_case.FaceName = ls_Param
		ls_return = ddlb_case.FaceName
	Case 'Visible'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddlb_case.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddlb_case.Visible)
		
	Case 'Height'
		ddlb_case.Height = Integer(ls_Param)
		ls_return = String(ddlb_case.Height)
	Case 'Underline'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddlb_case.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddlb_case.Underline)
	Case 'Tag'
		ddlb_case.Tag = ls_Param
		ls_return = ddlb_case.Tag
		
	Case 'Width'
		ddlb_case.Width = Integer(ls_Param)
		ls_return = String(ddlb_case.Width)
		
	Case 'Weight'
		ddlb_case.Weight = Integer(ls_Param)
		ls_return = String(ddlb_case.Weight)
		
	Case 'X'
		ddlb_case.X = Integer(ls_Param)
		ls_return = String(ddlb_case.X)
	Case 'Y'
		ddlb_case.Y = Integer(ls_Param)
		ls_return = String(ddlb_case.Y)		
	Case 'Sorted'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddlb_case.Sorted = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddlb_case.Sorted)
	Case 'RightToLeft'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddlb_case.RightToLeft = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddlb_case.RightToLeft)
End Choose
ls_return = inv_util.of_convert_to_upper(ls_return)
st_tip.Text = "The DropDownListBox's "+is_select_data+" property is set to "+ls_return+"."


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
	Case 'Text'
		wf_random('string',lb_propparm)
	Case 'TextSize'
		wf_random('TSize',lb_propparm)
	Case 'Item[]'
		wf_random('index,string',lb_propparm)
		Return
	Case 'TextColor'
		wf_random('color',lb_propparm)
		Return
	Case 'BackColor'
		wf_random('color',lb_propparm)
	Case 'Italic'
		wf_random('boolean',lb_propparm)
	Case 'Enabled'
		wf_random('boolean',lb_propparm)
	Case 'FaceName'
		wf_random('Font',lb_propparm)
	Case 'Visible'
		wf_random('boolean',lb_propparm)
	Case 'ShowList'
		wf_random('boolean',lb_propparm)
	Case 'Height'
		wf_random('integer',lb_propparm)
	Case 'Underline'
		wf_random('boolean',lb_propparm)
	Case 'Tag'
		wf_random('string',lb_propparm)
	Case 'Width'
		wf_random('integer',lb_propparm)
	Case 'Weight'
		wf_random('integer',lb_propparm)
	Case 'X'
		wf_random('integer',lb_propparm)
	Case 'Y'
		wf_random('integer',lb_propparm)
	Case 'AllowEdit'
		wf_random('boolean',lb_propparm)
	Case 'AutoHScroll'
		wf_random('boolean',lb_propparm)
	Case 'Border'
		wf_random('boolean',lb_propparm)
	Case 'BorderStyle'
		lb_propparm.AddItem('StyleLowered!')
		lb_propparm.AddItem('StyleRaised!')
		lb_propparm.AddItem('StyleBox!')
		//lb_propparm.AddItem('StyleShadowBox!')
		Return
	Case 'Limit'
		wf_random('integer',lb_propparm)
	Case 'Sorted'
		wf_random('boolean',lb_propparm)
	Case 'RightToLeft'	
		wf_random('boolean',lb_propparm)
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
		ls_Return = String(ddlb_case.AddItem(ls_Param))
	Case	'ClassName'
		ls_Return = String(ddlb_case.ClassName())
	
	Case 'Clear'
		ddlb_case.SelectText ( 1, LenA(ddlb_case.text) )
		ls_Return = String(ddlb_case.Clear())
		
	Case 'Copy'
		ddlb_case.SelectText ( 1, LenA(ddlb_case.text) )
		ls_Return = String(ddlb_case.Copy())
		
	Case 'Cut'
		ddlb_case.SelectText ( 1, LenA(ddlb_case.text) )
		ls_Return = String(ddlb_case.Cut())
		
	Case 'Paste'
		ls_Return = String(ddlb_case.Paste())
		
	Case 'DeleteItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		ls_Return = String(ddlb_case.DeleteItem(Integer(ls_Param)))
	Case 'DirList'
			If ls_Param = '' Or IsNull(ls_Param) Then
				MessageBox("Warning","Please select testing data.")
				Return
			End If
			ls_Return = string(ddlb_case.DirList('*.txt',16385))
	Case 'DirSelect'		   
			//SelectionChanged Event
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
		ls_Return = String(ddlb_case.FindItem(ls_ParamArray[1],Integer(ls_ParamArray[2])))
	Case 'Reset'
		ls_Return = String(ddlb_case.Reset())
	Case	'Hide'
		ls_Return = String(ddlb_case.Hide())
	Case 'InsertItem'
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
		ls_Return = String(ddlb_case.InsertItem(ls_ParamArray[1],Integer(ls_ParamArray[2])))
		Case'Show'
		ls_Return = String(ddlb_case.Show())
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
		ls_Return = String(ddlb_case.Move(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
		Case'TypeOf'
		If ddlb_case.TypeOf() = dropdownlistbox! Then
			ls_Return = 'dropdownlistbox!'
		Else
			ls_Return = 'isvalid'
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
		ls_Return = String(ddlb_case.Resize(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
	Case	'SetFocus'
		ls_Return = String(ddlb_case.SetFocus())
	Case 'ReplaceText'
		ls_Return = string(ddlb_case.ReplaceText(ls_Param))
	Case 'SelectedText'
		ls_Return = ddlb_case.SelectedText()
	Case 'SelectText'	
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
		ls_Return = String(ddlb_case.SelectText (Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))	
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
		ls_Return = String(ddlb_case.SelectItem (ls_ParamArray[1],Integer(ls_ParamArray[2])))
	Case 'Text'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1])   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		ls_Return = String(ddlb_case.Text (Integer(ls_Param)))
	Case 'TotalItems'
		ls_Return = String(ddlb_case.TotalItems())
	Case 'GetParent'
		window  ls_win
		ls_win = ddlb_case.GetParent()
		ls_Return = ls_win.ClassName()
		
	Case 'PostEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(ddlb_case.PostEvent(Clicked!))
			Case 'Constructor!'
				ls_Return = String(ddlb_case.PostEvent(Constructor!))
			Case 'Destructor!'
				ls_Return = String(ddlb_case.PostEvent(Destructor!))
			Case 'GetFocus!'
				ls_Return = String(ddlb_case.PostEvent(GetFocus!))
			Case 'LoseFocus!'
				ls_Return = String(ddlb_case.PostEvent(LoseFocus!))
			Case 'RButtonDown!'
				ls_Return = String(ddlb_case.PostEvent(RButtonDown!))
			Case 'Help'
				ls_Return = String(ddlb_case.PostEvent('Help'))
			Case 'DoubleClicked!'
				ls_Return = String(ddlb_case.PostEvent(DoubleClicked!))
			Case 'SelectionChanged!'
				ls_Return = String(ddlb_case.PostEvent(SelectionChanged!))
			Case 'Modified!'
				ls_Return = String(ddlb_case.PostEvent(Modified!))
		End Choose
	Case 'TriggerEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(ddlb_case.TriggerEvent(Constructor!))
			Case 'Destructor!'
				ls_Return = String(ddlb_case.TriggerEvent(Destructor!))
			Case 'GetFocus!'
				ls_Return = String(ddlb_case.TriggerEvent(GetFocus!))
			Case 'LoseFocus!'
				ls_Return = String(ddlb_case.TriggerEvent(LoseFocus!))
			Case 'RButtonDown!'
				ls_Return = String(ddlb_case.TriggerEvent(RButtonDown!))
			Case 'Help'
				ls_Return = String(ddlb_case.PostEvent('Help'))
			Case 'DoubleClicked!'
				ls_Return = String(ddlb_case.TriggerEvent(DoubleClicked!))
			Case 'SelectionChanged!'
				ls_Return = String(ddlb_case.TriggerEvent(SelectionChanged!))
			Case 'Modified!'
				ls_Return = String(ddlb_case.TriggerEvent(Modified!))
		End Choose
	Case 'TypeOf'
		ls_Return = String(ddlb_case.TypeOf())
	Case 'SetPosition'
		Choose Case ls_Param			
			Case 'ToTop!'
				ls_Return = String(ddlb_case.SetPosition(ToTop!))
			Case 'ToBottom!'
				ls_Return = String(ddlb_case.SetPosition(ToBottom!))
			Case Else
				MessageBox("Warning","Parameter error.")
		End Choose
	Case 'SetRedraw'
		 ls_Return = String(ddlb_case.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
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
	Case 'Resize'
		wf_random('integer,integer',lb_functionparm)
	Case 'AddItem'
		wf_random('string',lb_functionparm)
		Return
	Case 'DeleteItem'
		wf_random('index',lb_functionparm)
		Return
	Case 'DirList'
		lb_functionparm.AddItem('*.txt,1')
		Return	
	Case 'FindItem'
		wf_random('string,index',lb_functionparm)
		Return
	Case 'InsertItem'
		wf_random('string,index',lb_functionparm)
		Return
	Case 'ReplaceText'
		wf_random('string',lb_functionparm)
		Return
	Case 'SelectText'
		wf_random('from,to',lb_functionparm)
		Return
	Case 'SelectItem'
		wf_random('string,index',lb_functionparm)
		Return
	Case 'Text'
		wf_random('index',lb_functionparm)
		Return
	Case 'SetPosition'		
		lb_functionparm.AddItem('ToTop!')
		lb_functionparm.AddItem('ToBottom!')
		Return
	Case 'SetRedraw'	
		wf_random('Boolean',lb_functionparm)
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
		lb_functionparm.AddItem('Constructor')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
		lb_functionparm.AddItem('SelectionChanged!')
		lb_functionparm.AddItem('DoubleClicked!')
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

type cb_2 from w_standard_ancestor`cb_2 within w_dropdownlistbox_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_dropdownlistbox_new
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
ddlb_case.Reset()
ddlb_case.AddItem("Sybase")
ddlb_case.AddItem("Appeon")
ddlb_case.Visible = True
ddlb_case.Enabled = True
ddlb_case.Text = "Sybase"
ddlb_case.TextSize = -8
ddlb_case.TextColor = RGB(0,0,0)
ddlb_case.BackColor = RGB(255,255,255)
ddlb_case.Italic = False
ddlb_case.FaceName = "MS Scans Serif"
ddlb_case.Sorted = False
ddlb_case.Weight = 400

ddlb_case.Underline = False
ddlb_case.RightToLeft = False

ddlb_case.X = ii_x
ddlb_case.Y = ii_y
ddlb_case.Width = ii_width
ddlb_case.Height = ii_height
tab_1.tabpage_3.lb_1.Reset()

end event

type st_tip from w_standard_ancestor`st_tip within w_dropdownlistbox_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_dropdownlistbox_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_dropdownlistbox_new
string text = "DropDownListBox"
end type

type ddlb_case from dropdownlistbox within w_dropdownlistbox_new
integer x = 101
integer y = 108
integer width = 649
integer height = 400
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"Sybase","Appeon"}
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"DropDownListBox's Constructor Event"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"DropDownListBox's Destructor Event"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

end event

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_cbndblclk]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"DropDownListBox's DoubleClicked Event"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

end event

event getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_cbnsetfocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item,ls_status
ls_status = ddlb_case.Text
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"DropDownListBox's GetFocus Event"+"(Text="+ls_status+")"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

end event

event losefocus;//====================================================================
// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_cbnkillfocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item,ls_status
ls_status = ddlb_case.Text
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"DropDownListBox's LoseFocus Event"+"("+ls_status+")"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

end event

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_cbnmodified]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item,ls_status
ls_status = ddlb_case.Text
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"DropDownListBox's Modified Event"+"(Item"+ls_status+")"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"DropDownListBox's RButtonDown Event"+" (flags="+String(flags)+",xpos="+String(xpos)+",ypos="+String(ypos)+")"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

end event

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item,ls_status 
boolean  lb_rtn
ls_status = ddlb_case.Text
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"DropDownListBox's SelectionChanged Event"+" "+"(index="+String(Index)+") "+"(Item="+ls_status+")"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

if tab_1.tabpage_2.lb_function.selecteditem() = 'DirSelect' then
	lb_rtn = this.DirSelect(tab_1.tabpage_2.sle_functionparm.text)
	st_tip.Text = "Function DirSelect is executed. The return value is " + string(lb_rtn) + "."
end if



end event

