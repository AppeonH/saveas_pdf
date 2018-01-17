$PBExportHeader$w_statichyperlink_new.srw
forward
global type w_statichyperlink_new from w_standard_ancestor
end type
type shl_test from statichyperlink within w_statichyperlink_new
end type
end forward

global type w_statichyperlink_new from w_standard_ancestor
string title = "StaticHyperLink"
shl_test shl_test
end type
global w_statichyperlink_new w_statichyperlink_new

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

n_util	inv_util

end variables

forward prototypes
public subroutine wf_random (string as_type, listbox alst)
end prototypes

public subroutine wf_random (string as_type, listbox alst);//====================================================================
// Function: wf_random()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	string 	as_type		
//		value	listbox	alst   		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string   ls_dataType[]
String	ls_parm, ls_booltmp
long 		ll_parmNum, ll_cur
integer  li_cnt

alst.Reset()

CHOOSE CASE lower(as_type)
	CASE 'boolean' 
		alst.AddItem('True')
		alst.AddItem('False')
		return
		
	CASE 'weight'
		alst.AddItem('400')
		alst.AddItem('700')
		return
		
END CHOOSE

for li_cnt =  1 to 5
	ls_parm = ''
	ll_parmNum = wf_str2array(as_type, ls_dataType)
	
	for ll_cur = 1 to ll_parmNum
		ls_parm = ls_parm + ','+ inv_util.of_make_arguments(ls_dataType[ll_cur],li_cnt)//wf_produce(ls_dataType[ll_cur])
	next

	alst.AddItem(MidA(ls_parm, 2))
next
end subroutine

on w_statichyperlink_new.create
int iCurrent
call super::create
this.shl_test=create shl_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.shl_test
end on

on w_statichyperlink_new.destroy
call super::destroy
destroy(this.shl_test)
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
// Author: 	laihaichun		Date: 2004/01/03
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

is_prop_data = "BackColor,Border,BorderColor,BorderStyle,Enabled,FaceName,Height,Italic,RightToLeft,Tag,Text,TextColor,TextSize,URL,Underline,Visible,Weight,Width,X,Y"
is_fuction_data = "ClassName,GetParent,Hide,Move,PostEvent,Resize,SetFocus,SetRedraw,Show,TriggerEvent,TypeOf"

st_tip.Text="The control is StaticHyperLink."
end event

type tab_1 from w_standard_ancestor`tab_1 within w_statichyperlink_new
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
// Author: 	laihaichun		Date: 2004/01/03
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
	Case 'BackColor'
		ls_Return = String(shl_test.BackColor)
		
	Case 'Border'
		ls_Return = String(shl_test.Border)
		
	Case 'BorderColor'
		ls_Return = String(shl_test.BorderColor)
		
	Case 'BorderStyle'
		Choose Case shl_test.BorderStyle
			Case StyleBox!
				ls_Return = 'StyleBox!'
				
			Case StyleLowered!
				ls_Return = 'StyleLowered!'
				
			Case StyleRaised!
				ls_Return = 'StyleRaised!'
				
			Case StyleShadowBox!
				ls_Return = 'StyleShadowBox!'
				
		End Choose
		
	Case 'Enabled'
		ls_Return = String(shl_test.Enabled)
		
	Case 'FaceName'
		ls_Return = shl_test.FaceName
		
	Case 'Height'
		ls_Return = String(shl_test.Height)
		
	Case 'Italic'
		ls_Return = String(shl_test.Italic)
		
	Case 'RightToLeft'
		ls_Return = String(shl_test.RightToLeft)
		
	Case 'Tag'
		ls_Return = shl_test.Tag
		
	Case 'Text'
		ls_Return = shl_test.Text
		
	Case 'TextColor'
		ls_Return = String(shl_test.TextColor)
		
	Case 'TextSize'
		ls_Return = String(shl_test.TextSize)
		
	Case 'URL'
		ls_Return = String(shl_test.URL)
		
	Case 'Underline'
		ls_Return = String(shl_test.Underline)
		
	Case 'Visible'
		ls_Return = String(shl_test.Visible)
		
	Case 'Weight'
		ls_Return = String(shl_test.Weight)
		
	Case 'Width'
		ls_Return = String(shl_test.Width)
		
	Case 'X'
		ls_Return = String(shl_test.X)
		
	Case 'Y'
		ls_Return = String(shl_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The StaticHyperLink's " + lb_prop.SelectedItem() + " property is " + ls_Return + "."



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
// Author: 	laihaichun		Date: 2004/01/03
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
	Case 'BackColor'
		If IsNumber(ls_Param) Then
			shl_test.BackColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			shl_test.BackColor = Long(ls_Param)
			Return
		End If
		
		ls_Return = String(shl_test.BackColor)
		
	Case 'Border'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			shl_test.Border = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.Border)
		
	Case 'BorderColor'
		If IsNumber(ls_Param) Then
			shl_test.BorderColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			shl_test.BorderColor = Long(ls_Param)
			Return
		End If
		
		ls_Return = String(shl_test.BorderColor)
		
	Case 'BorderStyle'
		Choose Case ls_Param
			Case 'StyleBox!'
				shl_test.BorderStyle = StyleBox!
				
			Case 'StyleLowered!'
				shl_test.BorderStyle = StyleLowered!
				
			Case 'StyleRaised!'
				shl_test.BorderStyle = StyleRaised!
				
			Case 'StyleShadowBox!'
				shl_test.BorderStyle = StyleShadowBox!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case 'Enabled'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			shl_test.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.Enabled)
		
	Case 'FaceName'
		shl_test.FaceName = ls_Param
		ls_Return = shl_test.FaceName
		
	Case 'Height'
		If IsNumber(ls_Param) Then
			shl_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.Height)
		
	Case 'Italic'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			shl_test.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.Italic)
	Case 'RightToLeft'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			shl_test.RightToLeft = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.RightToLeft)
	Case 'Tag'
		shl_test.Tag = ls_Param
		ls_Return = shl_test.Tag
		
	Case 'Text'
		shl_test.Text = ls_Param
		ls_Return = shl_test.Text
		
	Case 'TextColor'
		If IsNumber(ls_Param) Then
			shl_test.TextColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.TextColor)
		
	Case 'TextSize'
		If IsNumber(ls_Param) Then
			shl_test.TextSize = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.TextSize)
		
	Case 'URL'
		shl_test.url = ls_Param
		ls_Return = shl_test.url
		
	Case 'Underline'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			shl_test.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.Underline)
		
	Case 'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			shl_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.Visible)
		
	Case 'Weight'
		If IsNumber(ls_Param) Then
			shl_test.Weight = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.Weight)
		
	Case 'Width'
		If IsNumber(ls_Param) Then
			shl_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.Width)
		
	Case 'X'
		If IsNumber(ls_Param) Then
			shl_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.X)
		
	Case 'Y'
		If IsNumber(ls_Param) Then
			shl_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(shl_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The StaticHyperLink's " + lb_prop.SelectedItem() + " property is set to " + ls_Return + "."


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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_propparm.Reset()
sle_propparm.text = ''

choose case lb_prop.selecteditem()
	case 'Alignment'
		lb_propparm.additem('Center!')
		lb_propparm.additem('Left!')
		lb_propparm.additem('Right!')
		return
		
	case 'BackColor'
		wf_random('color',lb_propparm)
		
	case 'Border'
		wf_random('boolean',lb_propparm)
		
	case 'BorderColor'
		wf_random('color',lb_propparm)
		
	case 'BorderStyle'
		lb_propparm.AddItem("StyleBox!")
		lb_propparm.AddItem("StyleLowered!")
		lb_propparm.AddItem("StyleRaised!")
		//lb_propparm.AddItem("StyleShadowBox!")
		return
		
	case 'Enabled'
		wf_random('boolean',lb_propparm)
		
	case 'FaceName'
		wf_random('Font',lb_propparm)		
		return
		
	case 'FocusRectangle'
		wf_random('boolean',lb_propparm)
		
	case 'Height'
		wf_random('integer',lb_propparm)
		
	case 'Italic'
		wf_random('boolean',lb_propparm)
		
	case 'RightToLeft'	
		wf_random('boolean',lb_propparm)
		
	case 'Tag'
		wf_random('string',lb_propparm)
		
	case 'Text'
		wf_random('string',lb_propparm)
		
	case 'TextColor'
		wf_random('color',lb_propparm)
		
	case 'TextSize'
		wf_random('Tsize',lb_propparm)		
		return
		
	case 'URL'
		lb_propparm.additem('http://www.appeon.com')
		lb_propparm.additem('http://www.sybase.com')
		
	case 'Underline'
		wf_random('boolean',lb_propparm)
		
	case 'Visible'
		wf_random('boolean',lb_propparm)
		
	case 'Weight'
		wf_random('weight',lb_propparm)
		return
		
	case 'Width'
		wf_random('integer',lb_propparm)
		
	case 'X'
		wf_random('integer',lb_propparm)
		
	case 'Y'
		wf_random('integer',lb_propparm)
		
end choose

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String ls_Return, ls_Param

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
String ls_ParamArray[]

li_ParaNum = wf_str2array(ls_Param,ls_ParamArray)

Choose Case lb_function.SelectedItem()
	Case 'ClassName'
		ls_Return = shl_test.ClassName()
		
	Case 'GetParent'
		window  ls_win
		ls_win = shl_test.GetParent()
		ls_Return = ls_win.ClassName()
		
	Case 'Hide'
		ls_Return = String(shl_test.Hide())
		
	Case 'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(shl_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(shl_test.Move(intx,inty))
			Return
		End If
		
	Case 'PostEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(shl_test.PostEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(shl_test.PostEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(shl_test.PostEvent(Destructor!))
				
			Case 'DoubleClicked!'
				ls_Return = String(shl_test.PostEvent(DoubleClicked!))
				
			Case 'GetFocus!'
				ls_Return = String(shl_test.PostEvent(GetFocus!))
				
			Case 'LoseFocus!'
				ls_Return = String(shl_test.PostEvent(LoseFocus!))
				
			Case 'RButtonDown!'
				ls_Return = String(shl_test.PostEvent(RButtonDown!))
				
			Case 'Help'
				ls_Return = String(shl_test.PostEvent('Help'))
				
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
			ls_Return = String(shl_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(shl_test.Resize(intx,inty))
			Return
		End If
		
	Case 'SetFocus'
		ls_Return = String(shl_test.SetFocus())
		
	Case 'SetRedraw'
		ls_Return = String(shl_test.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
		
	Case 'Show'
		ls_Return = String(shl_test.Show())
		
	Case 'TriggerEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(shl_test.TriggerEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(shl_test.TriggerEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(shl_test.TriggerEvent(Destructor!))
				
			Case 'DoubleClicked!'
				ls_Return = String(shl_test.TriggerEvent(DoubleClicked!))
				
			Case 'GetFocus!'
				ls_Return = String(shl_test.TriggerEvent(GetFocus!))
				
			Case 'LoseFocus!'
				ls_Return = String(shl_test.TriggerEvent(LoseFocus!))
			
		   Case 'RButtonDown!'
			   ls_Return = String(shl_test.TriggerEvent(RButtonDown!))
				
			Case 'Help'
				ls_Return = String(shl_test.TriggerEvent('Help'))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case 'TypeOf'
		If shl_test.TypeOf() = StaticHyperLink! Then
			ls_Return = 'StaticHyperLink!'
		Else
			ls_Return = 'Invalid'
		End If
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text =  "Function "+lb_function.SelectedItem()+" is executed. The return value is " + ls_Return + "."


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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_functionparm.Reset()
sle_functionparm.text = ''

choose case lb_function.selecteditem()
	case 'Move'
		wf_random('integer,integer',lb_functionparm)
		
	case 'PostEvent'
		lb_functionparm.additem('Clicked!')
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('DoubleClicked!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')
		return
		
	case 'Resize'
		wf_random('integer,integer',lb_functionparm)
		
	case 'SetRedraw'
		wf_random('boolean',lb_functionparm)
		
	case 'TriggerEvent'
		lb_functionparm.additem('Clicked!')
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('DoubleClicked!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')
		return
		
end choose
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

type cb_2 from w_standard_ancestor`cb_2 within w_statichyperlink_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_statichyperlink_new
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

shl_test.BackColor = 67108864
shl_test.Border = false
shl_test.BorderColor = 0
shl_test.BorderStyle = StyleBox!
shl_test.Enabled = true
shl_test.FaceName = 'MS Sans Serif'
shl_test.Height = 72
shl_test.Italic = false
shl_test.RightToLeft = False
shl_test.Tag = ''
shl_test.Text = 'StaticHyperLink'
shl_test.TextColor = 16711680
shl_test.TextSize = -8
shl_test.URL="http://www.appeon.com"
shl_test.Underline = true
shl_test.Visible = true
shl_test.Weight = 400
shl_test.Width = 457
shl_test.X = 101
shl_test.Y = 120

tab_1.tabpage_3.lb_1.reset()
end event

type st_tip from w_standard_ancestor`st_tip within w_statichyperlink_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_statichyperlink_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_statichyperlink_new
string text = "StaticHyperLink"
end type

type shl_test from statichyperlink within w_statichyperlink_new
integer x = 101
integer y = 120
integer width = 457
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "StaticHyperLink"
boolean focusrectangle = false
string url = "http://www.appeon.com"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"StaticHyperLink's Clicked Event"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"StaticHyperLink's Constructor Event"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"StaticHyperLink's Destructor Event"
tab_1.tabpage_3.lb_1.additem(ls_item)

end event

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bndoubleclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"StaticHyperLink's DoubleClicked Event"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"StaticHyperLink's getfocus Event"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"StaticHyperLink's LoseFocus Event"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"StaticHyperLink's RbuttonDown Event"
tab_1.tabpage_3.lb_1.additem(ls_item)

end event

