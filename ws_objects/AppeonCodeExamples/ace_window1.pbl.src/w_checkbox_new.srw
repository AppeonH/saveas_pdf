$PBExportHeader$w_checkbox_new.srw
forward
global type w_checkbox_new from w_standard_ancestor
end type
type cbx_1 from checkbox within w_checkbox_new
end type
end forward

global type w_checkbox_new from w_standard_ancestor
string title = "CheckBox"
cbx_1 cbx_1
end type
global w_checkbox_new w_checkbox_new

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

on w_checkbox_new.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
end on

on w_checkbox_new.destroy
call super::destroy
destroy(this.cbx_1)
end on

event ue_open;call super::ue_open;//====================================================================
// Event: ue_open()
//--------------------------------------------------------------------
// Description: define checkbox
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

st_tip.Text = "The control is CheckBox."
ii_x = cbx_1.X
ii_y = cbx_1.Y
ii_width = cbx_1.Width
ii_height = cbx_1.Height
inv_util = Create n_util

//is_prop_data = "BackColor,BorderStyle,Checked,Enabled,FaceName,Height,Italic&
//,Tag,Text,TextColor,TextSize,Underline,Visible,Weight,Width,X,Y"

is_prop_data = "BackColor,Checked,Enabled,FaceName,Height,Italic&
,Tag,Text,TextColor,TextSize,RightToLeft,Underline,Visible,Weight,Width,X,Y"


is_fuction_data = "ClassName,GetParent&
,Hide,Move,PostEvent,Resize,SetFocus,SetPosition,SetRedraw,Show,TriggerEvent&
,TypeOf"


end event

type tab_1 from w_standard_ancestor`tab_1 within w_checkbox_new
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
If tab_1.tabpage_1.lb_prop.SelectedIndex() < 0 Then
	iFlag = 1
	MessageBox('Warning','Please select testing property.')
	Return
End If

iFlag = 0
String ls_return

Choose Case is_select_data
	Case 'BackColor'
		ls_return = String(cbx_1.BackColor)
	Case  'BorderStyle'
		Choose Case cbx_1.BorderStyle
			Case StyleLowered!
				ls_return = 'StyleLowered!'
			Case StyleRaised!
				ls_return = 'StyleRaised!'
		End Choose
	Case  'Checked'
		ls_return = String(cbx_1.Checked)
	Case  'Enabled'
		ls_return = String(cbx_1.Enabled)
	Case  'FaceName'
		ls_return = cbx_1.FaceName
	Case  'Height'
		ls_return = String(cbx_1.Height)
	Case  'Italic'
		ls_return = String(cbx_1.Italic)
	Case  'Tag'
		ls_return = cbx_1.Tag
	Case  'Text'
		ls_return = cbx_1.Text
	Case  'TextColor'
		ls_return = String(cbx_1.TextColor)
	Case  'TextSize'
		ls_return = String(cbx_1.TextSize)
	Case  'Underline'
		ls_return = String(cbx_1.Underline)
	Case  'Visible'
		ls_return = String(cbx_1.Visible)
	Case  'Weight'
		ls_return = String(cbx_1.Weight)
	Case  'Width'
		ls_return = String(cbx_1.Width)
	Case  'X'
		ls_return = String(cbx_1.X)
	Case  'Y'
		ls_return = String(cbx_1.Y)
	Case 'RightToLeft'
		ls_return = String(cbx_1.RightToLeft)
End Choose
ls_return = inv_util.of_convert_to_upper(ls_return)

st_tip.Text = "The CheckBox's "+is_select_data+" property is "+ls_return+"."


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

String ls_name
Boolean lb_data
String ls_return

Choose Case is_select_data
	Case 'BackColor'
		cbx_1.BackColor = Long(ls_Param)
		ls_return = String(cbx_1.BackColor)
	Case  'BorderStyle'
		If ls_Param = 'StyleLowered!' Then
			cbx_1.BorderStyle = StyleLowered!
			If cbx_1.BorderStyle = StyleLowered! Then
				ls_return = 'StyleLowered!'
			ElseIf cbx_1.BorderStyle = StyleRaised! Then
				ls_return = 'StyleRaised!'
			End If
		ElseIf ls_Param = 'StyleRaised!' Then
			cbx_1.BorderStyle = StyleRaised!
			If cbx_1.BorderStyle = StyleRaised! Then
				ls_return = 'StyleRaised!'
			ElseIf cbx_1.BorderStyle = StyleLowered! Then
				ls_return = 'StyleLowered!'
			End If
		Else
			MessageBox('Warning','Parameter error.')
			Return
		End If
	Case  'Checked'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			cbx_1.Checked = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(cbx_1.Checked)
	Case  'Enabled'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			cbx_1.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(cbx_1.Enabled)
	Case  'FaceName'
		cbx_1.FaceName = ls_Param
		ls_return = cbx_1.FaceName
	Case  'Height'
		cbx_1.Height = Integer(ls_Param)
		ls_return = String(cbx_1.Height)
	Case  'Italic'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			cbx_1.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(cbx_1.Italic)
	Case  'Tag'
		cbx_1.Tag = ls_Param
		ls_return = cbx_1.Tag
	Case  'Text'
		cbx_1.Text = ls_Param
		ls_return = cbx_1.Text
	Case  'TextColor'
		cbx_1.TextColor = Long(ls_Param)
		ls_return = String(cbx_1.TextColor)
	Case  'TextSize'
		cbx_1.TextSize = Integer(ls_Param)
		ls_return = String(cbx_1.TextSize)
	Case  'Underline'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			cbx_1.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(cbx_1.Underline)
	Case  'Visible'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			cbx_1.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(cbx_1.Visible)
	Case  'Weight'
		cbx_1.Weight = Integer(ls_Param)
		ls_return = String(cbx_1.Weight)
	Case  'Width'
		cbx_1.Width = Integer(ls_Param)
		ls_return = String(cbx_1.Width)
	Case  'X'
		cbx_1.X = Integer(ls_Param)
		ls_return = String(cbx_1.X)
	Case  'Y'
		cbx_1.Y = Integer(ls_Param)
		ls_return = String(cbx_1.Y)
	Case	'RightToLeft'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			cbx_1.RightToLeft = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(cbx_1.RightToLeft)
End Choose

ls_return = inv_util.of_convert_to_upper(ls_return)
st_tip.Text = "The CheckBox's "+is_select_data+" property is set to "+ls_return+"."

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
String ls_type
is_select_data = lb_prop.SelectedItem()
ls_type = wf_get_type()

Choose Case lb_prop.SelectedItem()
	Case 'BorderStyle'		
		//lb_propparm.AddItem("StyleBox!")
		lb_propparm.AddItem("StyleLowered!")
		lb_propparm.AddItem("StyleRaised!")
		//lb_propparm.AddItem("StyleShadowBox!")
		Return
	Case 'FaceName'
		ls_type = 'Font'
End Choose
wf_random(ls_type,lb_propparm)

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
String ls_Function

ls_Function = sle_functionparm.Text
If lb_function.SelectedIndex() < 0 Then	
	MessageBox('Warning','Please select testing function.')
	Return
End If
If IsNull(ls_Function) Then ls_Function = ''
If ls_Function = '' And lb_functionparm.TotalItems() > 0  Then	
	MessageBox('Warning','Please select testing data.')
	Return
End If

String  ls_Return, ls_Param
Integer x1,y1,li_count
String ls_ParamArray[]

ls_Param = sle_functionparm.Text
li_count = wf_str2array(ls_Param,ls_ParamArray)

If lb_function.SelectedItem() = '' Or IsNull(lb_function.SelectedItem()) Then
	MessageBox("Warning","Please select testing function.")
	Return
End If
Choose Case lb_function.SelectedItem()
	Case 'ClassName'
		ls_Return = cbx_1.ClassName()
	Case 'PostEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(cbx_1.PostEvent(Clicked!))
			Case 'Constructor!'
				ls_Return = String(cbx_1.PostEvent(Constructor!))
			Case 'Destructor!'
				ls_Return = String(cbx_1.PostEvent(Destructor!))
			Case 'GetFocus!'
				ls_Return = String(cbx_1.PostEvent(GetFocus!))
			Case 'LoseFocus!'
				ls_Return = String(cbx_1.PostEvent(LoseFocus!))
			Case 'RButtonDown!'
				ls_Return = String(cbx_1.PostEvent(RButtonDown!))
			Case 'Help'
				ls_Return = String(cbx_1.PostEvent('Help'))
		End Choose
	Case 'TriggerEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(cbx_1.TriggerEvent(Clicked!))
			Case 'Constructor!'
				ls_Return = String(cbx_1.TriggerEvent(Constructor!))
			Case 'Destructor!'
				ls_Return = String(cbx_1.TriggerEvent(Destructor!))
			Case 'GetFocus!'
				ls_Return = String(cbx_1.TriggerEvent(GetFocus!))
			Case 'LoseFocus!'
				ls_Return = String(cbx_1.TriggerEvent(LoseFocus!))
			Case 'RButtonDown!'
				ls_Return = String(cbx_1.TriggerEvent(RButtonDown!))
			Case 'Help'
				ls_Return = String(cbx_1.TriggerEvent('Help'))
		End Choose
	Case 'GetParent'
		window  ls_win
		ls_win = cbx_1.GetParent()
		ls_Return = ls_win.ClassName()
	Case 'Hide'
		ls_Return = String(cbx_1.Hide())
	Case 'Move'
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
		x1 = Integer(ls_ParamArray[1])
		y1 = Integer(ls_ParamArray[2])
		ls_Return = String(cbx_1.Move(x1,y1))
	Case 'Resize'
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
		x1 = Integer(ls_ParamArray[1])
		y1 = Integer(ls_ParamArray[2])
		ls_Return = String(cbx_1.Resize(x1,y1))
	Case 'SetFocus'
		ls_Return = String(cbx_1.SetFocus())
	Case 'SetPosition'
		Choose Case ls_Param		
			Case 'ToTop!'
				ls_Return = String(cbx_1.SetPosition(ToTop!))
			Case 'ToBottom!'
				ls_Return = String(cbx_1.SetPosition(ToBottom!))
		End Choose
	Case 'SetRedraw'
		ls_Return = String(cbx_1.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))  
	Case 'Show'
		ls_Return = String(cbx_1.Show())
	Case 'TypeOf'
		If cbx_1.TypeOf() = checkbox! Then
			ls_Return = 'checkbox!'
		Else
			ls_Return = 'isvalid'
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
	Case 'Resize'
		wf_random('integer,integer',lb_functionparm)
	Case 'SetPosition'		
		lb_functionparm.AddItem('ToTop!')
		lb_functionparm.AddItem('ToBottom!')
		Return
	Case 'SetRedraw'
		wf_random('boolean',lb_functionparm)
	Case 'PostEvent'
		lb_functionparm.AddItem('Clicked!')
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
		
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

event cb_4::clicked;call super::clicked;//====================================================================
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
Long  ll
String  ls_text

For ll = lb_1.TotalItems() To 1 Step -1
	If lb_1.State(ll) = 1 Then
		lb_1.DeleteItem(ll)
	End If
Next

end event

type cb_3 from w_standard_ancestor`cb_3 within tabpage_3
end type

event cb_3::clicked;call super::clicked;//====================================================================
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
lb_1.Reset()

end event

type lb_1 from w_standard_ancestor`lb_1 within tabpage_3
end type

type cb_2 from w_standard_ancestor`cb_2 within w_checkbox_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_checkbox_new
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

cbx_1.BackColor = BackColor //Rgb(255,255,255)
//cbx_1.borderstyle = StyleLowered!
cbx_1.Checked = False
cbx_1.Enabled = True
cbx_1.FaceName = "MS Sans Serif"
cbx_1.Height = ii_height
cbx_1.Italic = False

cbx_1.Pointer = 'Beam!'
cbx_1.Text = "CheckBox"
cbx_1.TextColor = RGB(0,0,0)
cbx_1.TextSize = -8

cbx_1.Underline = False
cbx_1.RightToLeft = False
cbx_1.Visible = True
cbx_1.Weight = 400
cbx_1.Width = ii_width
cbx_1.Height = ii_height
cbx_1.X = ii_x
cbx_1.Y = ii_y

tab_1.tabpage_3.lb_1.Reset()


end event

type st_tip from w_standard_ancestor`st_tip within w_checkbox_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_checkbox_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_checkbox_new
string text = "CheckBox"
end type

type cbx_1 from checkbox within w_checkbox_new
integer x = 101
integer y = 124
integer width = 402
integer height = 96
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "CheckBox"
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
String ls_item,ls_status
ls_status = String(cbx_1.Checked)

ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"CheckBox's Clicked Event" +"(checked="+ls_status+")"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item,ls_status
ls_status = String(This.Checked)
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"CheckBox's Constructor Event" +"(checked="+ls_status+")"
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
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"CheckBox's Destructor Event"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item,ls_status
ls_status = String(cbx_1.Checked)
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"CheckBox's GetFocus Event"+"(checked="+ls_status+")"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_item,ls_status
ls_status = String(cbx_1.Checked)
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"CheckBox's LoseFocus Event"+"(checked="+ls_status+")"
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
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"CheckBox's RButtonDown Event"+" (flags="+String(flags)+",xpos="+String(xpos)+",ypos="+String(ypos)+")"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

end event

