$PBExportHeader$w_picture_new.srw
forward
global type w_picture_new from w_standard_ancestor2
end type
type p_test from picture within w_picture_new
end type
end forward

global type w_picture_new from w_standard_ancestor2
string title = "Picture"
p_test p_test
end type
global w_picture_new w_picture_new

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

boolean B_Border,  B_Enabled,  B_OriginalSize, B_Visible;
integer I_Height,  I_Width, I_X, I_Y;
string S_PictureName, S_Tag,S_PowerTipText;
n_util	inv_util

end variables

on w_picture_new.create
int iCurrent
call super::create
this.p_test=create p_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_test
end on

on w_picture_new.destroy
call super::destroy
destroy(this.p_test)
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

p_test.OriginalSize = true

B_Border = p_test.Border   
B_Enabled = p_test.Enabled   
B_OriginalSize = p_test.OriginalSize   
B_Visible = p_test.Visible 
I_Height = p_test.Height   
I_Width = p_test.Width   
I_X = p_test.X   
I_Y = p_test.Y 
S_PictureName = p_test.PictureName   
S_Tag = p_test.Tag 
S_PowerTipText = p_test.PowerTipText
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

is_prop_data="Border,BorderStyle,Enabled,Height,OriginalSize,PictureName,Tag,Visible,Width,X,Y,PowerTipText"
is_fuction_data="ClassName,Draw(Web Only),GetParent,Hide,Move,PostEvent,Resize,SetFocus,SetPosition,SetRedraw,Show,TriggerEvent,TypeOf"

st_tip.Text="The control is Picture."

end event

type tab_1 from w_standard_ancestor2`tab_1 within w_picture_new
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

if lb_prop.SelectedIndex() < 0 then
	iFlag = 1
	messagebox('Warning','Please select testing property.')
	return
end if

iFlag = 0

string ls_Return

CHOOSE CASE lb_prop.SelectedItem()
	CASE	'Border' 
		ls_Return = string(p_test.Border)
		
	CASE	'BorderStyle' 
		CHOOSE CASE p_test.BorderStyle
			CASE StyleBox!
				ls_Return = "StyleBox!"
				
			CASE StyleLowered!
				ls_Return = "StyleLowered!"
				
			CASE StyleRaised!
				ls_Return = "StyleRaised!"
				
			CASE StyleShadowBox!
				ls_Return = "StyleShadowBox!"
				
		END CHOOSE	

	CASE	'Enabled'
		ls_Return = string(p_test.Enabled)
		
	CASE	'Height' 
		ls_Return = string(p_test.Height)  

	CASE	'OriginalSize' 
		ls_Return = string(p_test.OriginalSize)
		
	CASE	'PictureName' 
		ls_Return = p_test.PictureName
		
	CASE	'Tag' 
		ls_Return = p_test.Tag

	CASE	'Visible' 
		ls_Return = string(p_test.Visible)

	CASE	'Width' 
		ls_Return = string(p_test.Width)  

	CASE	'X' 
		ls_Return = string(p_test.X)  

	CASE	'Y' 
		ls_Return = string(p_test.Y)  
	CASE	'PowerTipText'	
		ls_Return = p_test.PowerTipText
END CHOOSE

ls_Return = inv_util.of_convert_to_upper(ls_return)
st_tip.Text = "The Picture's "+lb_prop.SelectedItem ( )+" property is "+ls_Return+"."

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
	Case	'Border'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			p_test.Border = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(p_test.Border)
		
	Case	'BorderStyle'
		p_test.Border = True
		
		Choose Case ls_Param
			Case "StyleBox!"
				p_test.BorderStyle = StyleBox!
				
			Case "StyleLowered!"
				p_test.BorderStyle = StyleLowered!
				
			Case "StyleRaised!"
				p_test.BorderStyle = StyleRaised!
				
			Case "StyleShadowBox!"
				p_test.BorderStyle = StyleShadowBox!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case	'Enabled'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			p_test.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(p_test.Enabled)
		
	Case	'Height'
		If IsNumber(ls_Param) Then
			p_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(p_test.Height)
		
	Case	'OriginalSize'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			p_test.OriginalSize = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(p_test.OriginalSize)
		
	Case	'PictureName'
		p_test.PictureName = ls_Param
		ls_Return = p_test.PictureName
		
	Case	'Tag'
		p_test.Tag = ls_Param
		ls_Return = p_test.Tag
		
	Case	'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			p_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(p_test.Visible)
		
	Case	'Width'
		If IsNumber(ls_Param) Then
			p_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(p_test.Width)
		
	Case	'X'
		If IsNumber(ls_Param) Then
			p_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(p_test.X)
		
	Case	'Y'
		If IsNumber(ls_Param) Then
			p_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(p_test.Y)
	Case	'PowerTipText'	
		p_test.PowerTipText = ls_param
		ls_Return = p_test.PowerTipText
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The Picture's "+lb_prop.SelectedItem ( )+" property is set to "+ls_Param+"."


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
	Case	'Border'
		wf_random("Boolean",lb_propparm)
		
	Case	'BorderStyle'
		lb_propparm.AddItem("StyleBox!")
		lb_propparm.AddItem("StyleLowered!")
		lb_propparm.AddItem("StyleRaised!")
		//lb_propparm.AddItem("StyleShadowBox!")
		Return
		
	Case	'Enabled'
		wf_random("Boolean",lb_propparm)
		
	Case	'Height'
		wf_random("Integer",lb_propparm)
		
	Case	'OriginalSize'
		wf_random("Boolean",lb_propparm)
		
	Case	'PictureName'
		lb_propparm.AddItem("tag004.jpg")
		lb_propparm.AddItem("tag003.jpg")
		Return
		
	Case	'Tag'
		wf_random("String",lb_propparm)
		
	Case	'Visible'
		wf_random("Boolean",lb_propparm)
		
	Case	'Width'
		wf_random("Integer",lb_propparm)
		
	Case	'X'
		wf_random("Integer",lb_propparm)
		
	Case	'Y'
		wf_random("Integer",lb_propparm)
	Case	'PowerTipText'	
		wf_random("String",lb_propparm)
		
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
		ls_Return = String(p_test.ClassName( ))
		
	Case	'Draw(Web Only)'
		if appeongetclienttype()='MOBILE' then
			messagebox("Warning","This function is not supported on mobile.")
			return
		end if
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(p_test.Draw(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'GetParent'
		window  w_temp
		w_temp = p_test.GetParent( )
		ls_Return = w_temp.ClassName()
		
	Case	'Hide'
		ls_Return = String(p_test.Hide( ))
		
	Case	'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(p_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'PostEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(p_test.PostEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(p_test.PostEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(p_test.PostEvent(Destructor!))
				
			Case 'DoubleClicked!'
				ls_Return = String(p_test.PostEvent(DoubleClicked!))
				
			Case 'GetFocus!'
				ls_Return = String(p_test.PostEvent(GetFocus!))
				
			Case 'LoseFocus!'
				ls_Return = String(p_test.PostEvent(LoseFocus!))
				
			Case 'RButtonDown!'
				ls_Return = String(p_test.PostEvent(RButtonDown!))
				
			Case 'Help'
				ls_Return = String(p_test.PostEvent("Help"))
				
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
			ls_Return = String(p_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'SetFocus'
		ls_Return = String(p_test.SetFocus( ))
		
	Case	'SetPosition'
		Choose Case ls_Param			
			Case 'ToTop!'
				ls_Return = String(p_test.SetPosition(ToTop!))
				
			Case 'ToBottom!'
				ls_Return = String(p_test.SetPosition(ToBottom!))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
	
	Case 'SetRedraw'
		ls_Return = String(p_test.SetRedraw(inv_util.of_string_to_boolean(ls_Param) ))
		
	Case	'Show'
		ls_Return = String(p_test.Show( ))
		
	Case	'TriggerEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(p_test.TriggerEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(p_test.TriggerEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(p_test.TriggerEvent(Destructor!))
				
			Case 'DoubleClicked!'
				ls_Return = String(p_test.TriggerEvent(DoubleClicked!))
				
			Case 'GetFocus!'
				ls_Return = String(p_test.TriggerEvent(GetFocus!))
				
			Case 'LoseFocus!'
				ls_Return = String(p_test.TriggerEvent(LoseFocus!))
				
			Case 'RButtonDown!'
				ls_Return = String(p_test.TriggerEvent(RButtonDown!))
				
			Case 'Help'
				ls_Return = String(p_test.TriggerEvent("Help"))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case	'TypeOf'
		If p_test.TypeOf( ) = Picture! Then
			ls_Return = "Picture!"
		Else
			ls_Return = "invalid"
		End If
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "Function "+lb_function.SelectedItem()+" is executed. The return value is "+ls_Return+"."


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

string strPropparm,strValue 
integer intx,inty
string strx
long longx,longy
string strar[]

strPropparm = sle_functionparm.Text
wf_str2array(strPropparm,strar)

CHOOSE CASE lb_function.SelectedItem()
	CASE	'Draw(Web Only)' 
		wf_random('integer,integer',lb_functionparm)
		
	CASE	'Move'
		wf_random('integer,integer',lb_functionparm)
		
	CASE	'PostEvent' 
		lb_functionparm.additem('Clicked!')
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('DoubleClicked!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')		
		return

	CASE	'Resize' 
		wf_random('integer,integer',lb_functionparm)
		
	CASE	'SetPosition' 		
		lb_functionparm.additem('ToTop!')
		lb_functionparm.additem('ToBottom!')
		return
	CASE 'SetRedraw'
		wf_random('Boolean',lb_functionparm)
		return
		
	CASE	'TriggerEvent' 
	   lb_functionparm.additem('Clicked!')
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('DoubleClicked!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')		
		return

END CHOOSE
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

type cb_2 from w_standard_ancestor2`cb_2 within w_picture_new
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_picture_new
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

p_test.Border = B_Border
p_test.Enabled = B_Enabled
p_test.OriginalSize = B_OriginalSize
p_test.Visible = B_Visible
p_test.Height = I_Height
p_test.Width = I_Width
p_test.X = I_X
p_test.Y = I_Y
p_test.PictureName = S_PictureName
p_test.Tag = S_Tag
p_test.BorderStyle = StyleLowered!
p_test.PowerTipText = S_PowerTipText
tab_1.tabpage_3.lb_out.Reset()

end event

type st_tip from w_standard_ancestor2`st_tip within w_picture_new
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_picture_new
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_picture_new
string text = "Picture"
end type

type p_test from picture within w_picture_new
integer x = 101
integer y = 140
integer width = 421
integer height = 280
boolean bringtotop = true
boolean originalsize = true
string picturename = "CAKE.JPG"
boolean focusrectangle = false
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Picture Clicked Event '
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Picture Constructor Event "
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Picture Destructor Event "
tab_1.tabpage_3.lb_out.additem(ls_item)
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Picture DoubleClicked Event "
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Picture GetFocus Event "
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Picture's LostFocus  Event "
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Picture RButtonDown Event(flags="+string(flags)+',xpos='+string(xpos)+',ypos='+string(ypos)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

