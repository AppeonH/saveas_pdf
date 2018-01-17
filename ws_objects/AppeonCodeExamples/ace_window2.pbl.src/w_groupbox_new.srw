$PBExportHeader$w_groupbox_new.srw
forward
global type w_groupbox_new from w_standard_ancestor
end type
type gb_test from groupbox within w_groupbox_new
end type
end forward

global type w_groupbox_new from w_standard_ancestor
string title = "GroupBox"
gb_test gb_test
end type
global w_groupbox_new w_groupbox_new

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

boolean B_Enabled, B_Italic, B_Underline, B_Visible, B_RightToLeft ;
integer I_Height, I_TextSize, I_Width, I_X, I_Y;
long L_TextColor;
string S_FaceName, S_Tag, S_Text;
n_util	inv_util

end variables

on w_groupbox_new.create
int iCurrent
call super::create
this.gb_test=create gb_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_test
end on

on w_groupbox_new.destroy
call super::destroy
destroy(this.gb_test)
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

st_tip.Text="The control is GroupBox."

B_Enabled = gb_test.Enabled   
B_Italic = gb_test.Italic   
B_Underline = gb_test.Underline   
B_Visible = gb_test.Visible 
B_RightToLeft = gb_test.RightToLeft 
I_Height = gb_test.Height   
I_TextSize = gb_test.TextSize   
I_Width = gb_test.Width   
I_X = gb_test.X   
I_Y = gb_test.Y  
L_TextColor = gb_test.TextColor  
S_FaceName = gb_test.FaceName   
S_Tag = gb_test.Tag   
S_Text = gb_test.Text  
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

is_prop_data="Enabled,FaceName,Height,Italic,RightToLeft,Tag,Text,TextColor,TextSize,Underline,Visible,Width,X,Y"
is_Fuction_data="ClassName,GetParent,Hide,Move,PostEvent,Resize,SetFocus,SetPosition,SetRedraw,Show,TriggerEvent,TypeOf"

end event

type tab_1 from w_standard_ancestor`tab_1 within w_groupbox_new
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
	Case	'Enabled'
		ls_Return = String(gb_test.Enabled)
		
	Case	'FaceName'
		ls_Return = gb_test.FaceName
		
	Case	'Height'
		ls_Return = String(gb_test.Height)
		
	Case	'Italic'
		ls_Return = String(gb_test.Italic)
		
	Case	'RightToLeft'
		ls_Return = String(gb_test.RightToLeft)
		
	Case	'Tag'
		ls_Return = gb_test.Tag
		
	Case	'Text'
		ls_Return = gb_test.Text
		
	Case	'TextColor'
		ls_Return = String(gb_test.TextColor)
		
	Case	'TextSize'
		ls_Return = String(gb_test.TextSize)
		
	Case	'Underline'
		ls_Return = String(gb_test.Underline)
		
	Case	'Visible'
		ls_Return = String(gb_test.Visible)
		
	Case	'Width'
		ls_Return = String(gb_test.Width)
		
	Case	'X'
		ls_Return = String(gb_test.X)
		
	Case	'Y'
		ls_Return = String(gb_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The GroupBox's "+lb_prop.SelectedItem ( )+" property is "+ls_Return+"."


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
	Case	'Enabled'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			gb_test.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(gb_test.Enabled)
		
	Case	'FaceName'
		gb_test.FaceName = ls_Param
		ls_Return = gb_test.FaceName
		
	Case	'Height'
		If IsNumber(ls_Param) Then
			gb_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(gb_test.Height)
		
	Case	'Italic'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			gb_test.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(gb_test.Italic)
	Case 'RightToLeft'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			gb_test.RightToLeft = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(gb_test.RightToLeft)
	Case	'Tag'
		gb_test.Tag = ls_Param
		ls_Return = gb_test.Tag
		
	Case	'Text'
		gb_test.Text = ls_Param
		ls_Return = gb_test.Text
		
	Case	'TextColor'
		If IsNumber(ls_Param) Then
			gb_test.TextColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(gb_test.TextColor)
		
	Case	'TextSize'
		If IsNumber(ls_Param) Then
			gb_test.TextSize = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(gb_test.TextSize)
		
	Case	'Underline'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			gb_test.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(gb_test.Underline)
		
	Case	'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			gb_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(gb_test.Visible)
		
	Case	'Width'
		If IsNumber(ls_Param) Then
			gb_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(gb_test.Width)
		
	Case	'X'
		If IsNumber(ls_Param) Then
			gb_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(gb_test.X)
		
	Case	'Y'
		If IsNumber(ls_Param) Then
			gb_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(gb_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The GroupBox's "+lb_prop.SelectedItem ( )+" property is set to "+ls_Return+"."


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
	CASE	'Enabled' 
		wf_random("Boolean",lb_propparm)
		
	CASE	'FaceName'
		wf_random('Font',lb_propparm)	
		
	CASE	'Height'
		wf_random("Integer",lb_propparm)
		
	CASE	'Italic' 
		wf_random("Boolean",lb_propparm)
		
	CASE	'Tag' 
		wf_random("String",lb_propparm)
	CASE	'RightToLeft'
		wf_random("Boolean",lb_propparm)
		
	CASE	'Text' 
		wf_random("String",lb_propparm)
		
	CASE	'TextColor' 
		wf_random("color",lb_propparm)
		
	CASE	'TextSize' 
		lb_propparm.additem("10")
		lb_propparm.additem("14")
		lb_propparm.additem("18")
		lb_propparm.additem("22")
		lb_propparm.additem("24")
		lb_propparm.additem("26")
		return
		
	CASE	'Underline'
		wf_random("Boolean",lb_propparm)
		
	CASE	'Visible'
		wf_random("Boolean",lb_propparm)
		
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
Integer intx,inty,li_ParaNum
String ls_ParamArray[]

li_ParaNum = wf_str2array(ls_Param,ls_ParamArray)

Choose Case lb_function.SelectedItem()
	Case	'ClassName'
		ls_Return = String(gb_test.ClassName( ))
		
	Case	'GetParent'
		window  w_temp
		w_temp  =  gb_test.GetParent( )
		
		ls_Return = w_temp.ClassName()
		
	Case	'Hide'
		ls_Return = String(gb_test.Hide( ))
		
	Case	'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(gb_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'PostEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(gb_test.PostEvent("Constructor"))
			Case 'Destructor!'
				ls_Return = String(gb_test.PostEvent("Destructor"))			
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
			ls_Return = String(gb_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'SetFocus'
		ls_Return = String(gb_test.SetFocus( ))
		
	Case	'SetPosition'
		Choose Case ls_Param			
			Case 'ToTop!'
				ls_Return = String(gb_test.SetPosition(ToTop!))
			Case 'ToBottom!'
				ls_Return = String(gb_test.SetPosition(ToBottom!))
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
		End Choose
		
	Case	'Show'
		ls_Return = String(gb_test.Show( ))
		
	Case 'SetRedraw'
		ls_Return = String(gb_test.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
		
	Case	'TriggerEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(gb_test.TriggerEvent("Constructor"))
			Case 'Destructor!'
				ls_Return = String(gb_test.TriggerEvent("Destructor"))			
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
		End Choose
		
	Case	'TypeOf'
		If gb_test.TypeOf( ) = GroupBox! Then
			ls_Return = "GroupBox!"
		Else
			ls_Return = "invalid"
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
// Author: 	laihaichun		Date: 2004/01/02
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
		
	CASE	'SetPosition' 	
		lb_functionparm.additem('ToTop!')
		lb_functionparm.additem('ToBottom!')
		return
	CASE 'SetRedraw'
		wf_random('boolean',lb_functionparm)
		return
		
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

type cb_2 from w_standard_ancestor`cb_2 within w_groupbox_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_groupbox_new
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

gb_test.Enabled = B_Enabled
gb_test.Italic = B_Italic
gb_test.Underline = B_Underline
gb_test.Visible = B_Visible
gb_test.RightToLeft = B_RightToLeft 
gb_test.Height = I_Height
gb_test.TextSize = I_TextSize
gb_test.Width = I_Width
gb_test.X = I_X
gb_test.Y = I_Y
gb_test.TextColor = L_TextColor
gb_test.FaceName = S_FaceName
gb_test.Tag = S_Tag
gb_test.Text = S_Text
tab_1.tabpage_3. lb_1.Reset()


end event

type st_tip from w_standard_ancestor`st_tip within w_groupbox_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_groupbox_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_groupbox_new
boolean visible = false
end type

type gb_test from groupbox within w_groupbox_new
integer x = 101
integer y = 44
integer width = 1134
integer height = 224
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "GroupBox"
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
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"GroupBox's Constructor Event"
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
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"GroupBox's Destructor Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

