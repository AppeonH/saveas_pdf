$PBExportHeader$w_tab_new.srw
forward
global type w_tab_new from w_standard_ancestor2
end type
type tab_test from tab within w_tab_new
end type
type tabpage_4 from userobject within tab_test
end type
type st_3 from statictext within tabpage_4
end type
type tabpage_4 from userobject within tab_test
st_3 st_3
end type
type tabpage_5 from userobject within tab_test
end type
type st_4 from statictext within tabpage_5
end type
type tabpage_5 from userobject within tab_test
st_4 st_4
end type
type tabpage_6 from userobject within tab_test
end type
type tabpage_6 from userobject within tab_test
end type
type tabpage_7 from userobject within tab_test
end type
type tab_2 from tab within tabpage_7
end type
type tabpage_8 from userobject within tab_2
end type
type st_5 from statictext within tabpage_8
end type
type tabpage_8 from userobject within tab_2
st_5 st_5
end type
type tabpage_9 from userobject within tab_2
end type
type st_6 from statictext within tabpage_9
end type
type tabpage_9 from userobject within tab_2
st_6 st_6
end type
type tabpage_10 from userobject within tab_2
end type
type st_7 from statictext within tabpage_10
end type
type tabpage_10 from userobject within tab_2
st_7 st_7
end type
type tabpage_11 from userobject within tab_2
end type
type st_8 from statictext within tabpage_11
end type
type tabpage_11 from userobject within tab_2
st_8 st_8
end type
type tab_2 from tab within tabpage_7
tabpage_8 tabpage_8
tabpage_9 tabpage_9
tabpage_10 tabpage_10
tabpage_11 tabpage_11
end type
type tabpage_7 from userobject within tab_test
tab_2 tab_2
end type
type tab_test from tab within w_tab_new
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type
type cbx_1 from checkbox within w_tab_new
end type
end forward

global type w_tab_new from w_standard_ancestor2
integer height = 1780
string title = "Tab"
tab_test tab_test
cbx_1 cbx_1
end type
global w_tab_new w_tab_new

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

on w_tab_new.create
int iCurrent
call super::create
this.tab_test=create tab_test
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_test
this.Control[iCurrent+2]=this.cbx_1
end on

on w_tab_new.destroy
call super::destroy
destroy(this.tab_test)
destroy(this.cbx_1)
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

//is_prop_data = "Alignment,BackColor,BoldSelectedText,CreateOnDemand,FaceName,Height,Italic,PowerTips,SelectedTab,ShowText,Tag,TextSize,Underline,Visible,Weight,Width,X,Y"
is_prop_data = "Alignment,BackColor,BoldSelectedText,CreateOnDemand,FaceName,Height,Italic,Multiline,PowerTips,SelectedTab,ShowText,Tag,TextSize,Underline,Visible,Weight,Width,X,Y,PowerTipText,PictureName,PictureOnRight,RaggedRight,ShowPicture"
is_fuction_data = "ClassName,GetParent,Hide,Move,PostEvent,Resize,SelectTab,SetFocus,SetPosition,SetRedraw,Show,TriggerEvent,TypeOf,OpenTab,OpenTabWithParm,CloseTab,TabTriggerEvent"

st_tip.Text="The control is Tab."
end event

type tab_1 from w_standard_ancestor2`tab_1 within w_tab_new
integer y = 560
integer height = 924
end type

type tabpage_1 from w_standard_ancestor2`tabpage_1 within tab_1
integer height = 808
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

Integer i
String ls_Return

Choose Case lb_prop.SelectedItem()
	Case 'Alignment'
		Choose Case tab_test.Alignment
			Case Center!
				ls_Return = 'Center!'
				
			Case Left!
				ls_Return = 'Left!'
				
			Case Right!
				ls_Return = 'Right!'
				
		End Choose
		
	Case 'BackColor'
		ls_Return = String(tab_test.BackColor)
		
	Case 'BoldSelectedText'
		ls_Return = String(tab_test.BoldSelectedText)
		
	Case 'Control[ ]'
		i = Integer(Mid(lb_propparm.SelectedItem(),9,1))
		
		If lb_propparm.SelectedItem() = 'upperbound' Then
			ls_Return = ':upperbound(tab_test.control[]) = ' + String(UpperBound(tab_test.Control[ ]))
		ElseIf lb_propparm.SelectedItem() = '' Then
			MessageBox('Warning','Please select testing data.')
			Return
		Else
			ls_Return = ':Control[' + String(i) + '].classname() =' +  tab_test.Control[i].ClassName()
		End If
	Case 'CreateOnDemand'
		ls_Return = String(tab_test.CreateOnDemand)
		
	Case 'FaceName'
		ls_Return = tab_test.FaceName
		
	Case 'FixedWidth'
		ls_Return = String(tab_test.FixedWidth)
		
	Case 'Height'
		ls_Return = String(tab_test.Height)
		
	Case 'Italic'
		ls_Return = String(tab_test.Italic)
	Case 'Multiline'
		ls_Return = String(tab_test.Multiline)
		
	Case 'PowerTips'
		ls_Return = String(tab_test.PowerTips)
		
	Case 'SelectedTab'
		ls_Return = String(tab_test.SelectedTab)
		
	Case 'ShowText'
		ls_Return = String(tab_test.ShowText)
		
	Case 'Tag'
		ls_Return = tab_test.Tag
		
	Case 'TextSize'
		ls_Return = String(tab_test.TextSize)
		
	Case 'Underline'
		ls_Return = String(tab_test.Underline)
		
	Case 'Visible'
		ls_Return = String(tab_test.Visible)
		
	Case 'Weight'
		ls_Return = String(tab_test.Weight)
		
	Case 'Width'
		ls_Return = String(tab_test.Width)
		
	Case 'X'
		ls_Return = String(tab_test.X)
		
	Case 'Y'
		ls_Return = String(tab_test.Y)		
	Case 'PowerTipText'
		ls_Return =	tab_test.control[tab_test.SelectedTab].PowerTipText
	Case 'PictureName'
		ls_Return =	tab_test.control[tab_test.SelectedTab].PictureName
		
	Case	'PictureOnRight'
		ls_Return = String(tab_test.PictureOnRight)
	Case	'RaggedRight'
		ls_Return = String(tab_test.RaggedRight)
	Case	'ShowPicture'	
		ls_Return = String(tab_test.ShowPicture)
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text  = "The Tab's " + lb_prop.SelectedItem() + " property is " + ls_Return + "."


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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_Param,ls_Return
integer i

ls_Param = trim(sle_propparm.text)

if lb_prop.SelectedIndex() < 0 then
	iFlag = 1
	messagebox('Warning','Please select testing property.')
	return
end if

if ls_Param = '' then
	iFlag = 1
	messagebox('Warning','Please select testing data.')
	return
end if

iFlag = 0

choose case lb_prop.selecteditem()
	case 'Alignment'
		choose case ls_Param
			case 'Center!'
				tab_test.Alignment = Center!
				
			case 'Left!'
				tab_test.Alignment = Left!
				
			case 'Right!'
				tab_test.Alignment = Right!
				
			case else
				messagebox('Warning','Parameter error.')
				return
				
		end choose
		
		ls_Return = ls_Param
		
	case 'BackColor'
		if isnumber(ls_Param) then
			tab_test.BackColor = long(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.BackColor)
		
	case 'BoldSelectedText'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.BoldSelectedText =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.BoldSelectedText)
	Case 'CreateOnDemand'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.CreateOnDemand =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.CreateOnDemand)
		
	case 'FaceName'
		tab_test.FaceName = ls_Param
		ls_Return = tab_test.FaceName
		
	case 'FixedWidth'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.FixedWidth =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.FixedWidth)
		
	case 'Height'
		if isnumber(ls_Param) then
			tab_test.Height = integer(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.Height)
		
	case 'Italic'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.Italic =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.Italic)		
	case 'Multiline'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.Multiline =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.Multiline)		
	case 'PowerTips'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.PowerTips =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.PowerTips)
		
	case 'SelectedTab'
			tab_test.SelectedTab = integer(ls_Param)
		   ls_Return = string(tab_test.SelectedTab)
			
	case 'ShowText'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.ShowText =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.ShowText)
		
	case 'Tag'
		tab_test.Tag = ls_Param
		ls_Return = tab_test.Tag
		
	case 'TextSize'
		if isnumber(ls_Param) then
			tab_test.TextSize = integer(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.TextSize)
		
	case 'Underline'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.Underline =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.Underline)
		
	case 'Visible'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.Visible =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.Visible)
		
	case 'Weight'
		if isnumber(ls_Param) then
			tab_test.Weight = integer(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.Weight)
		
	case 'Width'
		if isnumber(ls_Param) then
			tab_test.Width = integer(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.Width)
		
	case 'X'
		if isnumber(ls_Param) then
			tab_test.X = integer(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.X)
		
	case 'Y'
		if isnumber(ls_Param) then
			tab_test.Y = integer(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.Y)
		
	case 'PowerTipText'
		tab_test.control[tab_test.SelectedTab].PowerTipText = ls_Param
		ls_Return =	tab_test.control[tab_test.SelectedTab].PowerTipText
	case 'PictureName'
		tab_test.control[tab_test.SelectedTab].PictureName	= ls_Param
		ls_Return =	tab_test.control[tab_test.SelectedTab].PictureName	
	
	Case	'PictureOnRight'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.PictureOnRight =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.PictureOnRight)
		
	Case	'RaggedRight'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.RaggedRight =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.RaggedRight)
		
	Case	'ShowPicture'
		if lower(ls_Param) = 'true' or lower(ls_Param) = 'false' then
			tab_test.ShowPicture =inv_util.of_string_to_boolean(ls_Param)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
		
		ls_Return = string(tab_test.ShowPicture)
		
		
end choose

ls_Return = inv_util.of_convert_to_upper(ls_return)
st_tip.text = "The Tab's " + lb_prop.selecteditem() + " property is set to " + ls_Return + "." 

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_propparm.Reset()
sle_propparm.Text = ''

Integer i
cb_set.Enabled = True
sle_propparm.Enabled = True

Choose Case lb_prop.SelectedItem()
	Case 'Alignment'
		lb_propparm.AddItem('Center!')
		lb_propparm.AddItem('Left!')
		lb_propparm.AddItem('Right!')
		Return
		
	Case 'BackColor'
		wf_random('color',lb_propparm)
		
	Case 'BoldSelectedText'
		wf_random('boolean',lb_propparm)
		
	Case 'Control[ ]'
		cb_set.Enabled = False
		sle_propparm.Enabled = False
		lb_propparm.AddItem('upperbound')
		
		For i = 1 To UpperBound(tab_test. Control[ ])
			lb_propparm.AddItem('Control[' + String(i) + ']')
		Next
		Return
	Case 'CreateOnDemand'		
		wf_random('boolean',lb_propparm)
		
	Case 'Enabled'
		wf_random('boolean',lb_propparm)
		
	Case 'FaceName'
		wf_random('FONT',lb_propparm)
		Return
		
	Case 'FixedWidth'
		wf_random('boolean',lb_propparm)
		
	Case 'Height'
		wf_random('integer',lb_propparm)
		
	Case 'Italic'
		wf_random('boolean',lb_propparm)
		
	Case 'Multiline'
		wf_random('boolean',lb_propparm)
		
	Case 'PictureOnRight'
		wf_random('boolean',lb_propparm)
		
	Case 'PowerTips'
		wf_random('boolean',lb_propparm)
		
	Case 'SelectedTab'
		lb_propparm.AddItem(String(i))
		
	Case 'ShowText'
		wf_random('boolean',lb_propparm)
		
	Case 'Tag'
		wf_random('string',lb_propparm)
		
	Case 'TextSize'
		wf_random('tsize',lb_propparm)
		
	Case 'Underline'
		wf_random('boolean',lb_propparm)
		
	Case 'Visible'
		wf_random('boolean',lb_propparm)
		
	Case 'Weight'
		wf_random('weight',lb_propparm)
		Return
		
	Case 'Width'
		wf_random('integer',lb_propparm)
		
	Case 'X'
		wf_random('integer',lb_propparm)
		
	Case 'Y'
		wf_random('integer',lb_propparm)
	Case 'PowerTipText'
		wf_random('string',lb_propparm)
	Case 'PictureName'
		lb_propparm.AddItem('lanmannt.jpg')
		lb_propparm.AddItem('beach.bmp')
		lb_propparm.AddItem('new_old2.gif')	
		lb_propparm.AddItem('pbex.ico')	
	Case	'PictureOnRight','RaggedRight','ShowPicture'	
		wf_random('boolean',lb_propparm)
End Choose


end event

type sle_propparm from w_standard_ancestor2`sle_propparm within tabpage_1
end type

type tabpage_2 from w_standard_ancestor2`tabpage_2 within tab_1
integer height = 808
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

Integer intx,inty,li_ParaNum,li_Count
String ls_ParamArray[]

li_ParaNum = wf_str2array(ls_Param,ls_ParamArray)

Choose Case lb_function.SelectedItem()
	Case 'ClassName'
		ls_Return = tab_test.ClassName()
		
	Case 'CloseTab'
		Choose Case ls_Param
			Case 'page_1'
				ls_Return = String(tab_test.CloseTab(tab_test.tabpage_4))
				
			Case 'page_2'
				ls_Return = String(tab_test.CloseTab(tab_test.tabpage_5))
				
			Case Else
				If IsNumber(ls_Param) Then
					If Integer(ls_Param) <= UpperBound(tab_test.Control[]) Then
						ls_Return = String(tab_test.CloseTab(tab_test.Control[Integer(ls_Param)]))
					Else
						MessageBox('Warning','Parameter type error or the object does not exist in the tab.')
						ls_Return = '-1'
					End If
				Else
					MessageBox('Warning','Parameter type error or the object does not exist in the tab.')
					ls_Return = '-1'
				End If
				
		End Choose
		
		lb_function.TriggerEvent(SelectionChanged!)
		
	Case 'GetParent'
		window  ls_win
		ls_win = tab_test.GetParent()
		ls_Return = ls_win.ClassName()
		
	Case 'Hide'
		ls_Return = String(tab_test.Hide())
		
	Case 'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(tab_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(tab_test.Move(intx,inty))
			Return
		End If
		
	Case 'MoveTab'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And Integer(ls_ParamArray[1]) <= UpperBound(tab_test.Control[]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(tab_test.MoveTab(intx,inty))
		Else
			MessageBox('Warning','Parameter type error or the object does not exist in the tab.')
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(tab_test.MoveTab(intx,inty))
			Return
		End If
		
	Case 'PostEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(tab_test.PostEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(tab_test.PostEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(tab_test.PostEvent(Destructor!))
				
			Case 'DoubleClicked!'
				ls_Return = String(tab_test.PostEvent(DoubleClicked!))
				
			Case 'GetFocus!'
				ls_Return = String(tab_test.PostEvent(GetFocus!))
				
			Case 'Help'
				ls_Return = String(tab_test.PostEvent('Help'))
				
			Case 'Key!'
				ls_Return = String(tab_test.PostEvent(Key!))
				
			Case 'LoseFocus!'
				ls_Return = String(tab_test.PostEvent(LoseFocus!))
				
			Case 'RightClicked!'
				ls_Return = String(tab_test.PostEvent(RightClicked!))
				
			Case 'SelectionChanged!'
				ls_Return = String(tab_test.PostEvent(SelectionChanged!))
				
			Case 'SelectionChanging!'
				ls_Return = String(tab_test.PostEvent(SelectionChanging!))
				
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
			ls_Return = String(tab_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(tab_test.Resize(intx,inty))
			Return
		End If
		
	Case 'SelectTab'
		ls_Return = String(tab_test.SelectTab(Integer(ls_Param)))
		
	Case 'SetFocus'
		ls_Return = String(tab_test.SetFocus())
		
	Case 'SetPosition'
		Choose Case ls_Param				
			Case 'ToTop!'
				ls_Return = String(tab_test.SetPosition(ToTop!))
				
			Case 'ToBottom!'
				ls_Return = String(tab_test.SetPosition(ToBottom!))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
	Case 'SetRedraw'
		ls_Return = String(tab_test.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
		
	Case 'Show'
		ls_Return = String(tab_test.Show())
		
	Case 'TriggerEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(tab_test.TriggerEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(tab_test.TriggerEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(tab_test.TriggerEvent(Destructor!))
				
			Case 'DoubleClicked!'
				ls_Return = String(tab_test.TriggerEvent(DoubleClicked!))
				
			Case 'GetFocus!'
				ls_Return = String(tab_test.TriggerEvent(GetFocus!))
				
			Case 'Help'
				ls_Return = String(tab_test.TriggerEvent('Help'))
				
			Case 'Key!'
				ls_Return = String(tab_test.TriggerEvent(Key!))
				
			Case 'LoseFocus!'
				ls_Return = String(tab_test.TriggerEvent(LoseFocus!))
				
			Case 'RightClicked!'
				ls_Return = String(tab_test.TriggerEvent(RightClicked!))
				
			Case 'SelectionChanged!'
				ls_Return = String(tab_test.TriggerEvent(SelectionChanged!))
				
			Case 'SelectionChanging!'
				ls_Return = String(tab_test.TriggerEvent(SelectionChanging!))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case 'TypeOf'
		If tab_test.TypeOf() = Tab! Then
			ls_Return = 'Tab!'
		Else
			ls_Return = 'Invalid'
		End If
	Case 'OpenTab'
		ls_Return = String(tab_test.OpenTab(u_numeric_edit,0))
		
		li_Count = UpperBound(tab_test.Control[])
		tab_test.Control[li_Count].text = 'UserObject' + string(li_Count)
		tab_test.SelectTab(li_Count)
	Case 'OpenTabWithParm'
		ls_Return = String(tab_test.OpenTabWithParm(u_numeric_edit,ls_Param,0))
		
		li_Count = UpperBound(tab_test.Control[])
		tab_test.Control[li_Count].text = 'UserObject' + string(li_Count)
		tab_test.SelectTab(li_Count)
	
	Case	'TabTriggerEvent'
		ls_Return = String(tab_test.TabTriggerEvent("ue_display"))
		
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_functionparm.Reset()
sle_functionparm.Text = ''

Integer i

Choose Case lb_function.SelectedItem()
	Case 'CloseTab'
//		lb_functionparm.AddItem('page_1')
//		lb_functionparm.AddItem('page_2')
//		If UpperBound(tab_test.Control[]) > 0  Then
//			For i = 1 To UpperBound(tab_test.Control[])
//				lb_functionparm.AddItem(String(i))
//			Next
//			Return
//		End If
		If UpperBound(tab_test.Control[]) > 4  Then
			For i = 5 To UpperBound(tab_test.Control[])
				lb_functionparm.AddItem(String(i))
			Next
			Return
		End If
		
	Case 'Move'
		wf_random('integer,integer',lb_functionparm)
		
	Case 'MoveTab'
		lb_functionparm.AddItem(String(Rand(UpperBound(tab_test.Control[]))) + ',' + String(Rand(UpperBound(tab_test.Control[]))))
		Return
		
	Case 'PostEvent'
		lb_functionparm.AddItem('Clicked!')
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('DoubleClicked!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RightClicked!')
		lb_functionparm.AddItem('SelectionChanged!')
		lb_functionparm.AddItem('SelectionChanging!')
		Return
		
	Case 'Resize'
		wf_random('integer,integer',lb_functionparm)
		
	Case 'SetRedraw'
		wf_random('boolean',lb_functionparm)
		
	Case 'SetPosition'		
		lb_functionparm.AddItem('ToTop!')
		lb_functionparm.AddItem('ToBottom!')
		Return
		
	Case 'TabPostEvent'
		lb_functionparm.AddItem('ue_show')
		Return
		
	Case 'TabTriggerEvent'
		lb_functionparm.AddItem('ue_display')
		Return
		
	Case 'TriggerEvent'
		lb_functionparm.AddItem('Clicked!')
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('DoubleClicked!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RightClicked!')
		lb_functionparm.AddItem('SelectionChanged!')
		lb_functionparm.AddItem('SelectionChanging!')
	Case "OpenTab"
		Return
   Case "OpenTabWithParm"
		lb_functionparm.AddItem('Parm1')
		lb_functionparm.AddItem('Parm2')
		lb_functionparm.AddItem('Parm3')
		lb_functionparm.AddItem('Parm4')
		Return
	Case 'SelectTab'
		lb_functionparm.AddItem('1')
		lb_functionparm.AddItem('2')
		lb_functionparm.AddItem('3')
		lb_functionparm.AddItem('4')		
		
End Choose


end event

type lb_functionparm from w_standard_ancestor2`lb_functionparm within tabpage_2
end type

type tabpage_3 from w_standard_ancestor2`tabpage_3 within tab_1
integer height = 808
end type

type cb_4 from w_standard_ancestor2`cb_4 within tabpage_3
end type

type cb_3 from w_standard_ancestor2`cb_3 within tabpage_3
end type

type lb_out from w_standard_ancestor2`lb_out within tabpage_3
end type

type cb_2 from w_standard_ancestor2`cb_2 within w_tab_new
integer x = 2167
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_tab_new
integer x = 1810
integer y = 240
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

int i,j

tab_test.tabpage_4.enabled = true
tab_test.tabpage_5.enabled = true
tab_test.tabpage_4.text = "Appeon"
tab_test.tabpage_5.text = "Sybase"
tab_test.tabpage_4.backcolor= 67108864
tab_test.tabpage_5.backcolor= 67108864
tab_test.tabpage_4.tabbackcolor= 67108864
tab_test.tabpage_5.tabbackcolor= 67108864
tab_test.tabpage_4.tabtextcolor= 0
tab_test.tabpage_5.tabtextcolor= 0

//tab_test.CreateOnDemand = true
tab_test.Alignment = left!
tab_test.BackColor = 67108864
//tab_test.BoldSelectedText = false
tab_test.FixedWidth = false
tab_test.Italic = false
//tab_test.PowerTips = false
tab_test.SelectedTab = 1
tab_test.ShowText = true
tab_test.FaceName = 'MS Scans Serif'
tab_test.TextSize = -8
tab_test.Underline = false
tab_test.Visible = true
tab_test.Weight = 400
tab_test.Width = 1463
tab_test.Height = 416
tab_test.X = 101
tab_test.Y = 100
tab_test.PictureOnRight = False
tab_test.RaggedRight = True
tab_test.ShowPicture = True

tab_1.tabpage_3.lb_out.reset()


end event

type st_tip from w_standard_ancestor2`st_tip within w_tab_new
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_tab_new
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_tab_new
integer height = 516
string text = "Tab"
end type

type tab_test from tab within w_tab_new
event create ( )
event destroy ( )
integer x = 101
integer y = 84
integer width = 1463
integer height = 416
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean createondemand = true
integer selectedtab = 1
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type

on tab_test.create
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6,&
this.tabpage_7}
end on

on tab_test.destroy
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_7)
end on

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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's Constructor Event"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's Destructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_tcnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's Clicked Event(index="+string(index)+"),( selectedtab="+ string(selectedtab)+")"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event rightclicked;//====================================================================
// Event: rightclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_tcnrclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab RightClicked Event(index="+string(index)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)

end event

event getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_tcnsetfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's GetFocus Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event losefocus;//====================================================================
// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_tcnkillfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's LostFocus Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event selectionchanging;//====================================================================
// Event: selectionchanging()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	oldindex		
//		integer	newindex		
//--------------------------------------------------------------------
// Returns: long [pbm_tcnselchanging]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's SelectionChanging Event(oldindex="+string(oldindex)+",newindex="+string(newindex)+"),(selectedtab="+ string(selectedtab)+")"
tab_1.tabpage_3.lb_out.additem(ls_item)

if cbx_1.checked Then Return 1
end event

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	oldindex		
//		integer	newindex		
//--------------------------------------------------------------------
// Returns: long [pbm_tcnselchanged]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's SelectionChanged Event(oldindex="+string(oldindex)+",newindex="+string(newindex)+"),(selectedtab="+ string(selectedtab)+")"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event key;//====================================================================
// Event: key()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		keycode     	key     		
//		unsignedlong	keyflags		
//--------------------------------------------------------------------
// Returns: long [pbm_tcnkeydown]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's Key Event(key="+string(key)+',keyflags='+string(keyflags)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

type tabpage_4 from userobject within tab_test
event ue_show ( )
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 1426
integer height = 288
long backcolor = 67108864
string text = "Appeon "
long tabtextcolor = 33554432
string picturename = "Picture!"
long picturemaskcolor = 536870912
string powertiptext = "PowerTipText"
st_3 st_3
end type

event ue_show();//====================================================================
// Event: ue_show()
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

tab_test.tabpage_4.st_3.text = 'Test TabPostEvent1'
tab_test.tabpage_5.st_4.text = 'Test TabPostEvent1'
end event

on tabpage_4.create
this.st_3=create st_3
this.Control[]={this.st_3}
end on

on tabpage_4.destroy
destroy(this.st_3)
end on

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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's Tabpage_1 Constructor Event"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's Tabpage_1 Destructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

type st_3 from statictext within tabpage_4
integer x = 110
integer y = 44
integer width = 997
integer height = 180
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "For Appeon"
boolean focusrectangle = false
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"The Tab's tabpage's appeon text control Constructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

type tabpage_5 from userobject within tab_test
event ue_display ( )
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 1426
integer height = 288
long backcolor = 67108864
string text = "Sybase"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
string powertiptext = "For Sybase"
st_4 st_4
end type

event ue_display();//====================================================================
// Event: ue_display()
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

tab_test.tabpage_4.st_3.text = 'Test TabTriggerEvent2'
tab_test.tabpage_5.st_4.text = 'Test TabTriggerEvent2'
end event

on tabpage_5.create
this.st_4=create st_4
this.Control[]={this.st_4}
end on

on tabpage_5.destroy
destroy(this.st_4)
end on

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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's Tabpage_2 Constructor Event"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Tab's Tabpage_2 Destructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

type st_4 from statictext within tabpage_5
integer x = 128
integer y = 52
integer width = 1125
integer height = 184
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "For Sybase"
boolean focusrectangle = false
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"The Tab's tabpage's sybase text control Constructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)

end event

type tabpage_6 from userobject within tab_test
integer x = 18
integer y = 112
integer width = 1426
integer height = 288
long backcolor = 67108864
string text = "EAServer"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

event constructor;messagebox('EAServer tabpage','Trigger an constructor event of tab_test.tabpage_6. ~r~nGraphical representations of tab pages are not created until the tab page is selected.')

end event

type tabpage_7 from userobject within tab_test
integer x = 18
integer y = 112
integer width = 1426
integer height = 288
long backcolor = 67108864
string text = "SQL Anywhere"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
tab_2 tab_2
end type

on tabpage_7.create
this.tab_2=create tab_2
this.Control[]={this.tab_2}
end on

on tabpage_7.destroy
destroy(this.tab_2)
end on

type tab_2 from tab within tabpage_7
integer width = 1426
integer height = 304
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_8 tabpage_8
tabpage_9 tabpage_9
tabpage_10 tabpage_10
tabpage_11 tabpage_11
end type

on tab_2.create
this.tabpage_8=create tabpage_8
this.tabpage_9=create tabpage_9
this.tabpage_10=create tabpage_10
this.tabpage_11=create tabpage_11
this.Control[]={this.tabpage_8,&
this.tabpage_9,&
this.tabpage_10,&
this.tabpage_11}
end on

on tab_2.destroy
destroy(this.tabpage_8)
destroy(this.tabpage_9)
destroy(this.tabpage_10)
destroy(this.tabpage_11)
end on

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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Sub Tab's Constructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	oldindex		
//		integer	newindex		
//--------------------------------------------------------------------
// Returns: long [pbm_tcnselchanged]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Sub Tab's SelectionChanged Event(oldindex="+string(oldindex)+",newindex="+string(newindex)+"),(selectedtab="+ string(selectedtab)+")"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event selectionchanging;//====================================================================
// Event: selectionchanging()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	oldindex		
//		integer	newindex		
//--------------------------------------------------------------------
// Returns: long [pbm_tcnselchanging]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Sub Tab's SelectionChanging Event(oldindex="+string(oldindex)+",newindex="+string(newindex)+"),(selectedtab="+ string(selectedtab)+")"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

type tabpage_8 from userobject within tab_2
integer x = 18
integer y = 100
integer width = 1390
integer height = 188
long backcolor = 67108864
string text = "Appeon"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_5 st_5
end type

on tabpage_8.create
this.st_5=create st_5
this.Control[]={this.st_5}
end on

on tabpage_8.destroy
destroy(this.st_5)
end on

type st_5 from statictext within tabpage_8
integer x = 146
integer y = 28
integer width = 343
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Appeon"
boolean focusrectangle = false
end type

type tabpage_9 from userobject within tab_2
integer x = 18
integer y = 100
integer width = 1390
integer height = 188
long backcolor = 67108864
string text = "Sybase"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_6 st_6
end type

on tabpage_9.create
this.st_6=create st_6
this.Control[]={this.st_6}
end on

on tabpage_9.destroy
destroy(this.st_6)
end on

type st_6 from statictext within tabpage_9
integer x = 183
integer y = 44
integer width = 343
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sybase"
boolean focusrectangle = false
end type

type tabpage_10 from userobject within tab_2
integer x = 18
integer y = 100
integer width = 1390
integer height = 188
long backcolor = 67108864
string text = "EAServer"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_7 st_7
end type

on tabpage_10.create
this.st_7=create st_7
this.Control[]={this.st_7}
end on

on tabpage_10.destroy
destroy(this.st_7)
end on

event constructor;messagebox('EAServer tabpage','Trigger an constructor event of tab_test.tabpage_7.tab_2.tabpage_10. ~r~n Graphical representations of tab pages are created when the Tab_2 control is created')
end event

type st_7 from statictext within tabpage_10
integer x = 229
integer y = 60
integer width = 343
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "EAServer"
boolean focusrectangle = false
end type

type tabpage_11 from userobject within tab_2
integer x = 18
integer y = 100
integer width = 1390
integer height = 188
long backcolor = 67108864
string text = "SQL Anywhere"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_8 st_8
end type

on tabpage_11.create
this.st_8=create st_8
this.Control[]={this.st_8}
end on

on tabpage_11.destroy
destroy(this.st_8)
end on

type st_8 from statictext within tabpage_11
integer x = 526
integer y = 44
integer width = 699
integer height = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SQL Anywhere"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_tab_new
integer x = 1618
integer y = 424
integer width = 837
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SelectionChanging event returns 1"
end type

