$PBExportHeader$w_picturebutton_new.srw
forward
global type w_picturebutton_new from w_standard_ancestor2
end type
type pb_test from picturebutton within w_picturebutton_new
end type
type p_1 from picture within w_picturebutton_new
end type
end forward

global type w_picturebutton_new from w_standard_ancestor2
integer height = 1812
string title = "PictureButton"
pb_test pb_test
p_1 p_1
end type
global w_picturebutton_new w_picturebutton_new

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

on w_picturebutton_new.create
int iCurrent
call super::create
this.pb_test=create pb_test
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_test
this.Control[iCurrent+2]=this.p_1
end on

on w_picturebutton_new.destroy
call super::destroy
destroy(this.pb_test)
destroy(this.p_1)
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

is_prop_data = "Enabled,FaceName,Height,Italic,PictureName,Tag,Text,TextSize,Underline,Visible,Weight,Width,X,Y,PowerTipText"
is_fuction_data = "ClassName,GetParent,Hide,Move,PostEvent,Resize,SetFocus,SetPosition,SetRedraw,Show,TriggerEvent,TypeOf"

st_tip.Text="The control is PictureButton."
end event

type tab_1 from w_standard_ancestor2`tab_1 within w_picturebutton_new
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

string ls_Return

if lb_prop.SelectedIndex() < 0 then
	iFlag = 1
	messagebox('Warning','Please select testing property.')
	return
end if

iFlag = 0

choose case lb_prop.selecteditem()
	case 'Enabled'
		ls_Return = string(pb_test.Enabled) 
		
	case 'FaceName'
		ls_Return = pb_test.FaceName 
		
	case 'Height'
		ls_Return = string(pb_test.Height)
		
	case 'Italic'
		ls_Return = string(pb_test.Italic) 
		
	case 'PictureName'
		ls_Return = pb_test.PictureName 
		
	case 'Tag'
		ls_Return = pb_test.Tag
		
	case 'Text'
		ls_Return = pb_test.Text
		
	case 'TextSize'
		ls_Return = string(pb_test.TextSize)
		
	case 'Underline'
		ls_Return = string(pb_test.Underline)
		
	case 'Visible'
		ls_Return = string(pb_test.Visible)
		
	case 'Weight'
		ls_Return = string(pb_test.Weight)
		
	case 'Width'
		ls_Return = string(pb_test.Width)
		
	case 'X'
		ls_Return = string(pb_test.X)
		
	case 'Y'
		ls_Return = string(pb_test.Y)
	case	'PowerTipText'	
		ls_Return = pb_test.PowerTipText
end choose

ls_Return = inv_util.of_convert_to_upper(ls_return)
st_tip.text = "The PictureButton's " + lb_prop.selecteditem() + " property is " + ls_Return + "." 

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

String ls_Param ,ls_Return
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
	Case 'Enabled'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			pb_test.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(pb_test.Enabled)
		
	Case 'FaceName'
		pb_test.FaceName = ls_Param
		ls_Return = pb_test.FaceName
	Case 'Height'
		If IsNumber(ls_Param) Then
			pb_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(pb_test.Height)
		
	Case 'Italic'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			pb_test.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(pb_test.Italic)
		
	Case 'PictureName'
		pb_test.PictureName = ls_Param
		ls_Return = pb_test.PictureName
		
	Case 'Tag'
		pb_test.Tag = ls_Param
		ls_Return = pb_test.Tag
		
	Case 'Text'
		pb_test.Text = ls_Param
		ls_Return = pb_test.Text
		
	Case 'TextSize'
		If IsNumber(ls_Param) Then
			pb_test.TextSize = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(pb_test.TextSize)
		
	Case 'Underline'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			pb_test.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(pb_test.Underline)
		
	Case 'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			pb_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(pb_test.Visible)
		
	Case 'Weight'
		If IsNumber(ls_Param) Then
			pb_test.Weight = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(pb_test.Weight)
		
	Case 'Width'
		If IsNumber(ls_Param) Then
			pb_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(pb_test.Width)
		
	Case 'X'
		If IsNumber(ls_Param) Then
			pb_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(pb_test.X)
		
	Case 'Y'
		If IsNumber(ls_Param) Then
			pb_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(pb_test.Y)
	Case	'PowerTipText'	
		pb_test.PowerTipText = ls_Param
		ls_Return = pb_test.PowerTipText
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The PictureButton's " + lb_prop.SelectedItem() + " property is set to " + ls_Return + "."


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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_propparm.Reset()
sle_propparm.Text = ''

Choose Case lb_prop.SelectedItem()
	Case 'Enabled'
		wf_random('boolean',lb_propparm)
		
	Case 'FaceName'
		wf_random('font',lb_propparm)
		
	Case 'Height'
		wf_random('integer',lb_propparm)
		
	Case 'Italic'
		wf_random('boolean',lb_propparm)
		
	Case 'PictureName'
		lb_propparm.AddItem('tag004.jpg')
		Return
		
	Case 'Tag'
		wf_random('string',lb_propparm)
		
	Case 'Text'
		wf_random('string',lb_propparm)
		
	Case 'TextSize'
		wf_random('TSIZE',lb_propparm)
		Return
		
	Case 'Underline'
		wf_random('boolean',lb_propparm)
		
	Case 'Visible'
		wf_random('boolean',lb_propparm)
		
	Case 'Weight'
		wf_random('WEIGHT',lb_propparm)
		
	Case 'Width'
		wf_random('integer',lb_propparm)
		
	Case 'X'
		wf_random('integer',lb_propparm)
		
	Case 'Y'
		wf_random('integer',lb_propparm)
	Case	'PowerTipText'	
		wf_random('string',lb_propparm)
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

string ls_Return, ls_Param
ls_Param = trim(sle_functionparm.text)

if lb_function.SelectedIndex() < 0 then
	iFlag = 1
	messagebox('Warning','Please select testing function.')
	return
end if

if ls_Param = '' and lb_functionparm.totalItems() > 0  then
	iFlag = 1
	messagebox('Warning','Please select testing data.')
	return
end if

iFlag = 0

integer intx,inty,li_ParaNum
string ls_ParamArray[]

li_ParaNum = wf_str2array(ls_Param,ls_ParamArray)

choose case lb_function.selecteditem()
	case 'ClassName'
		ls_Return = pb_test.ClassName() 
		
	case 'GetParent'
		window  ls_win  
		ls_win = pb_test.GetParent()
		ls_Return=ls_win.ClassName()

	case 'Hide'
		ls_Return = string(pb_test.Hide())
		
	case 'Move'
		if li_ParaNum <> 2 then 
			messagebox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(ls_ParamArray[1]) and isnumber(ls_ParamArray[2]) then
			intx = integer(ls_ParamArray[1])
			inty = integer(ls_ParamArray[2])
			ls_Return = string(pb_test.Move(intx,inty))
		else 
			messagebox('Warning','Parameter type error.')
			intx = integer(ls_ParamArray[1])
			inty = integer(ls_ParamArray[2])
	  		ls_Return = string(pb_test.Move(intx,inty))
			return
		end if
		
	case 'PostEvent'
		choose case ls_Param
				case 'Clicked!'
					ls_Return = string(pb_test.PostEvent(Clicked!))
					
				case 'Constructor!'
					ls_Return = string(pb_test.PostEvent(Constructor!))
					
				case 'Destructor!'
					ls_Return = string(pb_test.PostEvent(Destructor!))
					
				case 'GetFocus!'
					ls_Return = string(pb_test.PostEvent(Getfocus!))
					
				case 'LoseFocus!'
					ls_Return = string(pb_test.PostEvent(Losefocus!))
					
				case 'RButtonDown!'
					ls_Return = string(pb_test.PostEvent(Rbuttondown!))
					
				case 'Help'
					ls_Return = string(pb_test.PostEvent('Help'))
					
				case else
						messagebox('Warning','Parameter error.')
						return
						
		end choose
	case 'Resize'
		if li_ParaNum <> 2 then 
			messagebox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(ls_ParamArray[1]) and isnumber(ls_ParamArray[2]) then
			intx = integer(ls_ParamArray[1])
			inty = integer(ls_ParamArray[2])
			ls_Return = string(pb_test.Resize(intx,inty))
		else
			messagebox('Warning','Parameter type error.')
			intx = integer(ls_ParamArray[1])
			inty = integer(ls_ParamArray[2])
			ls_Return = string(pb_test.Resize(intx,inty))
			return
		end if
		
	case 'SetFocus'
		ls_Return = string(pb_test.SetFocus())
		
	case 'SetRedraw'
		ls_Return = string(pb_test.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
		
	case 'SetPosition'
		choose case ls_Param				
			case 'ToTop!'
				ls_Return = string(pb_test.SetPosition(ToTop!)) 
				
			case 'ToBottom!'
				ls_Return = string(pb_test.SetPosition(ToBottom!))
				
			case else
				messagebox('Warning','Parameter error.')
				return
				
		end choose
		
	case 'Show'
		ls_Return = string(pb_test.Show())
		
	case 'TriggerEvent'
		choose case ls_Param
				case 'Clicked!'
					ls_Return = string(pb_test.TriggerEvent(Clicked!))
					
				case 'Constructor!'
					ls_Return = string(pb_test.TriggerEvent(Constructor!))
					
				case 'Destructor!'
					ls_Return = string(pb_test.TriggerEvent(Destructor!))
					
				case 'GetFocus!'
					ls_Return = string(pb_test.TriggerEvent(Getfocus!))
					
				case 'LoseFocus!'
					ls_Return = string(pb_test.TriggerEvent(Losefocus!))
					
				case 'RButtonDown!'
					ls_Return = string(pb_test.TriggerEvent(Rbuttondown!))
					
				case 'Help'
					ls_Return = string(pb_test.TriggerEvent('Help'))
					
				case else
					messagebox('Warning','Parameter error.')
					return
					
		end choose
		
	case 'TypeOf'
		if pb_test.typeof() = PictureButton! then
			ls_Return = 'PictureButton!'
		else
			ls_Return = 'Invalid'
		end if
		
end choose

ls_Return = inv_util.of_convert_to_upper(ls_return)
st_tip.text =  "Function "+lb_function.selecteditem()+" is executed. The return value is " + ls_Return + "."


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
sle_functionparm.text = ''

choose case lb_function.selecteditem()
	case 'Move'
		wf_random('integer,integer',lb_functionparm)
		
	case 'PostEvent'
		lb_functionparm.additem('Clicked!')
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')		
		return
		
	case 'Resize'
		wf_random('integer,integer',lb_functionparm)
		
	case 'SetPosition'		
		lb_functionparm.additem('ToTop!')
		lb_functionparm.additem('ToBottom!')
		return
	case 'SetRedraw'
		wf_random('boolean',lb_functionparm)
		return
		
	case 'TriggerEvent'
		lb_functionparm.additem('Clicked!')
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')		
		return
		
end choose
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

type cb_2 from w_standard_ancestor2`cb_2 within w_picturebutton_new
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_picturebutton_new
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

pb_test.Enabled = true
pb_test.FaceName = 'MS Scans Serif'
pb_test.Height = 328
pb_test.Italic = false
pb_test.PictureName = 'tag003.jpg'
pb_test.Tag = ''
pb_test.Text = 'PictureButton'
pb_test.TextSize = -8
pb_test.Underline = false
pb_test.Visible = true
pb_test.Weight = 400
pb_test.Width = 521
pb_test.X = 101
pb_test.Y = 100

tab_1.tabpage_3.lb_out.reset()

end event

type st_tip from w_standard_ancestor2`st_tip within w_picturebutton_new
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_picturebutton_new
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_picturebutton_new
string text = "PictureButton"
end type

type pb_test from picturebutton within w_picturebutton_new
integer x = 101
integer y = 100
integer width = 521
integer height = 328
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "PictureButton"
boolean originalsize = true
string picturename = "tag003.jpg"
string disabledname = "BorderNone!"
alignment htextalign = left!
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

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureButton Clicked Event "
tab_1.tabpage_3.lb_out.additem(ls_item)
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureButton Constructor Event "
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureButton Destructor Event "
tab_1.tabpage_3.lb_out.additem(ls_item)
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureButton GetFocus Event "
tab_1.tabpage_3.lb_out.additem(ls_item)
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureButton LostFocus Event "
tab_1.tabpage_3.lb_out.additem(ls_item)
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureButton RButtonDown Event(flags="+string(flags)+',xpos='+string(xpos)+',ypos='+string(ypos)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

type p_1 from picture within w_picturebutton_new
boolean visible = false
integer x = 2002
integer y = 1644
integer width = 133
integer height = 48
boolean bringtotop = true
string picturename = "tag004.jpg"
boolean focusrectangle = false
end type

