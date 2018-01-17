$PBExportHeader$w_dropdownpicturelistbox_new.srw
forward
global type w_dropdownpicturelistbox_new from w_standard_ancestor
end type
type ddplb_1 from dropdownpicturelistbox within w_dropdownpicturelistbox_new
end type
end forward

global type w_dropdownpicturelistbox_new from w_standard_ancestor
string title = "DropDownPictureListBox"
ddplb_1 ddplb_1
end type
global w_dropdownpicturelistbox_new w_dropdownpicturelistbox_new

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

on w_dropdownpicturelistbox_new.create
int iCurrent
call super::create
this.ddplb_1=create ddplb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddplb_1
end on

on w_dropdownpicturelistbox_new.destroy
call super::destroy
destroy(this.ddplb_1)
end on

event open;call super::open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: add item about server of appeon.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

This.X = 0
This.Y = 0

st_tip.Text = "The control is DropDownPictureListBox."
ii_x = ddplb_1.X
ii_y = ddplb_1.Y
ii_width = ddplb_1.Width
ii_height = ddplb_1.Height

ddplb_1.AddItem('Appeon Server',1)
ddplb_1.AddItem('Appeon Developer',2)
ddplb_1.AddItem('Appeon WebLibrary',3)
ddplb_1.AddItem('Sybase EAServer',4)
ddplb_1.AddItem('Sybase Powerbuilder',5)
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
is_prop_data = "BackColor,Border,BorderStyle,Enabled,FaceName&
,Height,HScrollBar,Italic,Item[ ],RightToLeft,PictureName[ ],Sorted,Tag,Text,TextColor,TextSize,Underline&
,Visible,VScrollBar,Weight,Width,X,Y"
is_fuction_data = "AddItem,AddPicture,ClassName,Clear,Copy,Cut,Paste,DeleteItem,FindItem,GetParent&
,Hide,InsertItem,Move,PostEvent,Reset,Resize,SelectText,SelectedText,ReplaceText,SelectItem,SetFocus,SetRedraw,Show,Text&
,TriggerEvent,TotalItems,TypeOf"



end event

type tab_1 from w_standard_ancestor`tab_1 within w_dropdownpicturelistbox_new
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
Integer li_count
String ls_Param
String ls_return,ls_ParamArray[]

ls_Param = sle_propparm.Text
li_count = wf_str2array(ls_Param,ls_ParamArray)
Choose Case lb_prop.SelectedItem()
	Case 'Text'
		ls_return = ddplb_1.Text
	Case 'TextColor'
		ls_return = String(ddplb_1.TextColor)
	Case 'TextSize'
		ls_return = String(ddplb_1.TextSize)
	Case 'BackColor'
		ls_return = String(ddplb_1.BackColor)
	Case 'FaceName'
		ls_return = String(ddplb_1.FaceName)
	Case 'HScrollBar'
		ls_return = String(ddplb_1.HScrollBar)
	Case 'VScrollBar'
		ls_return = String(ddplb_1.VScrollBar)
	Case 'Sorted'
		ls_return = String(ddplb_1.Sorted)
	Case 'Border'
		ls_return = String(ddplb_1.Border)
	Case 'BorderStyle'
		Choose Case ddplb_1.BorderStyle
			Case StyleLowered!
				ls_return = 'StyleLowered!'
			Case StyleRaised!
				ls_return = 'StyleRaised!'
			Case StyleBox!
				ls_return = 'StyleBox.'
			Case StyleShadowBox!
				ls_return = 'StyleShadowBox!'
		End Choose
	Case 'Enabled'
		ls_return = String(ddplb_1.Enabled)
	Case 'Height'
		ls_return = String(ddplb_1.Height)
	Case 'Italic'
		ls_return = String(ddplb_1.Italic)
	Case 'ItemPictureIndex[ ]'/****/
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		If Integer(ls_ParamArray[1]) > UpperBound(ddplb_1.ItemPictureIndex[]) Then
			MessageBox('Warning','This item does not exist.')
			Return
		End If
		ls_return = String(ddplb_1.ItemPictureIndex[Integer(ls_ParamArray[1])])
		st_tip.Text = "The DropDownPictureListBox's "+"ItemPictureIndex[" + ls_ParamArray[1] + "]"+" get value is "+ls_return+"."
		Return
	Case 'PictureName[ ]'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		If Integer(ls_ParamArray[1]) > UpperBound(ddplb_1.PictureName[ ][]) Then
			MessageBox('Warning','This item does not exist.')
			Return
		End If
		ls_return = ddplb_1.PictureName[Integer(ls_ParamArray[1])]
		st_tip.Text = "The DropDownPictureListBox's "+"PictureName[" + ls_ParamArray[1] + "]"+" get value is "+ls_return+"."
		Return
	Case 'RightToLeft'
		ls_return = String(ddplb_1.RightToLeft)
	Case 'Tag'
		ls_return = ddplb_1.Tag
	Case 'Item[ ]'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		If Integer(ls_ParamArray[1]) > UpperBound(ddplb_1.Item[]) Then
			MessageBox('Warning','This item does not exist.')
			Return
		End If
		ls_return = ddplb_1.Item[Integer(ls_ParamArray[1])]
		st_tip.Text = "The DropDownPictureListBox's "+"Item[" + ls_ParamArray[1] + "]"+" get value is "+ls_return+"."
		Return
	Case 'Underline'
		ls_return = String(ddplb_1.Underline)
	Case 'Visible'
		ls_return = String(ddplb_1.Visible)
	Case 'Weight'
		ls_return = String(ddplb_1.Weight)
	Case 'Width'
		ls_return = String(ddplb_1.Width)
	Case 'X'
		ls_return = String(ddplb_1.X)
	Case 'Y'
		ls_return = String(ddplb_1.Y)
End Choose
ls_return = inv_util.of_convert_to_upper(ls_return)
st_tip.Text = "The DropDownPictureListBox's "+is_select_data+" property is "+ls_return+"."

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

String ls_return,ls_ParamArray[]
Integer li_count

li_count = wf_str2array(ls_Param,ls_ParamArray)

Choose Case is_select_data
	Case 'Text'
		ddplb_1.Text = ls_Param
		ls_return = ddplb_1.Text
		
	Case 'TextColor'
		ddplb_1.TextColor = Long(ls_Param)
		ls_return = String(ddplb_1.TextColor)
	Case 'TextSize'
		ddplb_1.TextSize = Integer(ls_Param)
		ls_return = String(ddplb_1.TextSize)
	Case 'BackColor'
		ddplb_1.BackColor = Long(ls_Param)
		ls_return = String(ddplb_1.BackColor)
	Case 'FaceName'
		ddplb_1.FaceName = ls_Param
		ls_return = ddplb_1.FaceName
	Case 'HScrollBar'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddplb_1.HScrollBar = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddplb_1.HScrollBar)
	Case 'VScrollBar'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddplb_1.VScrollBar = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddplb_1.VScrollBar)
	Case 'Sorted'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddplb_1.Sorted = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddplb_1.Sorted)
	Case 'Border'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddplb_1.Border = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddplb_1.Border)
	Case 'BorderStyle'
		Choose Case ls_Param
			Case 'StyleLowered!'
				ddplb_1.BorderStyle = StyleLowered!
				If ddplb_1.BorderStyle = StyleLowered! Then
					ls_return = 'StyleLowered!'
				ElseIf ddplb_1.BorderStyle = StyleRaised! Then
					ls_return = 'StyleRaised!'
				End If
			Case 'StyleRaised!'
				ddplb_1.BorderStyle = StyleRaised!
				If ddplb_1.BorderStyle = StyleRaised! Then
					ls_return = 'StyleRaised!'
				End If
			Case 'StyleBox!'
				ddplb_1.BorderStyle = StyleBox!
				If ddplb_1.BorderStyle = StyleBox! Then
					ls_return = 'StyleBox!'
				End If
			Case 'StyleShadowBox!'
				ddplb_1.BorderStyle = StyleShadowBox!
				If ddplb_1.BorderStyle = StyleShadowBox! Then
					ls_return = 'StyleShadowBox!'
				End If
		End Choose
	Case 'Enabled'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddplb_1.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddplb_1.Enabled)
	Case 'Height'
		ddplb_1.Height = Integer(ls_Param)
		ls_return = String(ddplb_1.Height)
	Case 'Italic'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddplb_1.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddplb_1.Italic)
	Case 'ItemPictureIndex[ ]'
		If LenA(ls_Param) = 0 Then Return
		If li_count <> 2 Then
			MessageBox("Warning","Parameter number should be 2.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2]) Then
			MessageBox("Warning","Parameter type error!")
			Return
		End If
		ddplb_1.ItemPictureIndex[Integer(ls_ParamArray[1])] = Integer(ls_ParamArray[2])
		ls_Param = ls_ParamArray[2]
		st_tip.Text = "The DropDownPictureListBox's "+"ItemPictureIndex[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Param+"."
		Return
	Case 'PictureName[ ]'
		If LenA(ls_Param) = 0 Then Return
		If li_count <> 2 Then
			MessageBox("Warning","Parameter number should be 2.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1]) Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		ddplb_1.PictureName[Integer(ls_ParamArray[1]) ] = ls_ParamArray[2]
		ls_Param = ls_ParamArray[2]
		st_tip.Text = "The DropDownPictureListBox's "+"PictureName[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Param+"."
		Return
	Case 'RightToLeft'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddplb_1.RightToLeft = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddplb_1.RightToLeft)
	Case 'Tag'
		ddplb_1.Tag = ls_Param
		ls_return = ddplb_1.Tag
	Case 'Item[ ]'
		If LenA(ls_Param) = 0 Then Return
		If li_count <> 2 Then
			MessageBox("Warning","Parameter number should be 2.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1]) Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		ddplb_1.Item[Integer(ls_ParamArray[1]) ] = ls_ParamArray[2]
		ls_Param = ls_ParamArray[2]
		st_tip.Text = "The DropDownPictureListBox's "+"Item[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Param+"."
		Return
	Case 'Underline'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddplb_1.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddplb_1.Underline)
	Case 'Visible'
		If LenA(Trim(ls_Param)) = 0 Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			ddplb_1.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_return = String(ddplb_1.Visible)
	Case 'Weight'
		ddplb_1.Weight = Integer(ls_Param)
		ls_return = String(ddplb_1.Weight)
	Case 'Width'
		ddplb_1.Width = Integer(ls_Param)
		ls_return = String(ddplb_1.Width)
	Case 'X'
		ddplb_1.X = Integer(ls_Param)
		ls_return = String(ddplb_1.X)
	Case 'Y'
		ddplb_1.Y = Integer(ls_Param)
		ls_return = String(ddplb_1.Y)
End Choose

ls_return = inv_util.of_convert_to_upper(ls_return)
st_tip.Text = "The DropDownPictureListBox's "+is_select_data+" property is set to "+ls_return+"."


end event

type st_1 from w_standard_ancestor`st_1 within tabpage_1
end type

type lb_propparm from w_standard_ancestor`lb_propparm within tabpage_1
end type

event lb_propparm::selectionchanged;call super::selectionchanged;//====================================================================
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
sle_propparm.Text = lb_propparm.SelectedItem()

end event

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
	Case 'Limit'
		wf_random('integer',lb_propparm)
	Case 'TextColor'
		wf_random('color',lb_propparm)
	Case 'TextSize'
		wf_random('TSize',lb_propparm)
	Case 'BackColor'
		wf_random('color',lb_propparm)
	Case 'FaceName'
		wf_random('font',lb_propparm)
		Return
	Case 'Border','AutoHScroll','VScrollBar','Sorted','HScrollBar'
		wf_random('boolean',lb_propparm)
	Case 'BorderStyle'
		lb_propparm.AddItem('StyleLowered!')
		lb_propparm.AddItem('StyleRaised!')
		lb_propparm.AddItem('StyleBox!')
		//lb_propparm.AddItem('StyleShadowBox!')
		Return
	Case 'Enabled'
		wf_random('boolean',lb_propparm)
	Case 'Height'
		wf_random('integer',lb_propparm)
	Case 'Italic'
		wf_random('boolean',lb_propparm)
	Case 'ItemPictureIndex[ ]'
		wf_random('index,index',lb_propparm)
	Case 'PictureName[ ]'
		lb_propparm.AddItem('1,save!')
		lb_propparm.AddItem('2,retrieve!')
		lb_propparm.AddItem('3,execute!')
		lb_propparm.AddItem('4,open!')
		lb_propparm.AddItem('5,print!')
		Return
	Case 'RightToLeft'
		wf_random('boolean',lb_propparm)
	Case 'ShowList'
		wf_random('boolean',lb_propparm)
	Case 'Tag'
		wf_random('string',lb_propparm)
	Case 'Item[ ]'
		wf_random('index,string',lb_propparm)
		Return
	Case 'Underline'
		wf_random('boolean',lb_propparm)
	Case 'Visible'
		wf_random('boolean',lb_propparm)
	Case 'Weight'
		wf_random('weight',lb_propparm)
	Case 'Width'
		wf_random('integer',lb_propparm)
	Case 'X'
		wf_random('integer',lb_propparm)
	Case 'Y'
		wf_random('integer',lb_propparm)
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
String ls_Param,ls_Return

ls_Param = sle_functionparm.Text
If lb_function.SelectedIndex() < 0 Then	
	MessageBox('Warning','Please select testing function.')
	Return
End If
If ls_Param = '' And lb_functionparm.TotalItems() > 0  Then	
	MessageBox('Warning','Please select testing data.')
	Return
End If

Integer ii_x1,ii_y1,li_count
String ls_ParamArray[]

li_count = wf_str2array(ls_Param,ls_ParamArray)
If lb_function.SelectedItem() = '' Or IsNull(lb_function.SelectedItem()) Then
	MessageBox("Warning","Please select testing function.")
	Return
End If
Choose Case lb_function.SelectedItem()
	Case 'AddItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		If li_count >= 2 Then
			If Not IsNumber(ls_ParamArray[2]) Then
				MessageBox("Warning","Parameter type error.")
				Return
			End If
			ls_Return = String(ddplb_1.AddItem(ls_ParamArray[1], Integer(ls_ParamArray[2])))
		Else
			ls_Return = String(ddplb_1.AddItem(ls_ParamArray[1]))
		End If
		Case'AddPicture'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		ls_Return = String(ddplb_1.AddPicture( ls_ParamArray[1] ))
	Case	'ClassName'
		ls_Return = ddplb_1.ClassName()
	Case 'Clear'
		 ddplb_1.selecttext(1,LenA(ddplb_1.text))
		 ls_Return = string(ddplb_1.Clear())
		 
	Case 'Copy'
		 ddplb_1.selecttext(1,LenA(ddplb_1.text))
		 ls_Return = string(ddplb_1.Copy())
	Case 'Cut'
		 ddplb_1.selecttext(1,LenA(ddplb_1.text))
		 ls_Return = string(ddplb_1.Cut())
		 
	Case 'Paste'
		 ls_Return = string(ddplb_1.Paste())
		 
	Case 'DeleteItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		If  Not IsNumber(ls_ParamArray[1]) Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		ls_Return = String(ddplb_1.DeleteItem(Integer(ls_Param)))
	Case 'FindItem'
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
		ls_Return = String(ddplb_1.FindItem(ls_ParamArray[1],Integer(ls_ParamArray[2])))
	Case 'Reset'
		ls_Return = String(ddplb_1.Reset())
	Case	'Hide'
		ls_Return = String(ddplb_1.Hide())
	Case 'InsertItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		If li_count <> 2  And li_count <> 3 Then
			MessageBox('Warning','Parameter number should be 2 or 3.')
			Return
		ElseIf  li_count = 2 Then
			If Not IsNumber(ls_ParamArray[2])  Then
				MessageBox("Warning","Parameter type error.")
				Return
			End If
			ls_Return = String(ddplb_1.InsertItem(ls_ParamArray[1],Integer(ls_ParamArray[2])))
		ElseIf li_count = 3 Then
			If Not IsNumber(ls_ParamArray[2]) Or Not IsNumber(ls_ParamArray[3]) Then
				MessageBox("Warning","Parameter type error.")
				Return
			End If
			ls_Return = String(ddplb_1.InsertItem(ls_ParamArray[1],Integer(ls_ParamArray[2]),Integer(ls_ParamArray[3])))
		End If
	Case'Show'
		ls_Return = String(ddplb_1.Show())
	Case 'PostEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(ddplb_1.PostEvent(Clicked!))
			Case 'Constructor!'
				ls_Return = String(ddplb_1.PostEvent(Constructor!))
			Case 'Destructor!'
				ls_Return = String(ddplb_1.PostEvent(Destructor!))
			Case 'GetFocus!'
				ls_Return = String(ddplb_1.PostEvent(GetFocus!))
			Case 'LoseFocus!'
				ls_Return = String(ddplb_1.PostEvent(LoseFocus!))
			Case 'RButtonDown!'
				ls_Return = String(ddplb_1.PostEvent(RButtonDown!))
			Case 'Help!'
				ls_Return = String(ddplb_1.PostEvent('Help'))
			Case 'DoubleClicked!'
				ls_Return = String(ddplb_1.PostEvent(DoubleClicked!))
			Case 'SelectionChanged!'
				ls_Return = String(ddplb_1.PostEvent(SelectionChanged!))
			Case 'Modified!'
				
				ls_Return = String(ddplb_1.PostEvent(Modified!))
		End Choose
	Case 'TriggerEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(ddplb_1.TriggerEvent(Constructor!))
			Case 'Destructor!'
				ls_Return = String(ddplb_1.TriggerEvent(Destructor!))
			Case 'GetFocus!'
				
				ls_Return = String(ddplb_1.TriggerEvent(GetFocus!))
			Case 'LoseFocus!'
				ls_Return = String(ddplb_1.TriggerEvent(LoseFocus!))
			Case 'RButtonDown!'
				ls_Return = String(ddplb_1.TriggerEvent(RButtonDown!))
				Case'Help!'
				ls_Return = String(ddplb_1.TriggerEvent('Help'))
			Case 'DoubleClicked!'
				ls_Return = String(ddplb_1.TriggerEvent(DoubleClicked!))
			Case 'SelectionChanged!'
				ls_Return = String(ddplb_1.TriggerEvent(SelectionChanged!))
			Case 'Modified!'
				ls_Return = String(ddplb_1.TriggerEvent(Modified!))
		End Choose
	Case 'TypeOf'
		If ddplb_1.TypeOf() = dropdownpicturelistbox! Then
			ls_Return = 'dropdownpicturelistbox.'
		Else
			ls_Return = 'isvalid'
		End If
	Case 'SetPosition'
		Choose Case ls_Param		
			Case 'ToTop!'
				ls_Return = String(ddplb_1.SetPosition(ToTop!))
			Case 'ToBottom!'
				ls_Return = String(ddplb_1.SetPosition(ToBottom!))
			Case Else
				MessageBox("Warning","Parameter error.")
		End Choose
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
		ls_Return = String(ddplb_1.Move(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
	Case'TypeOf'
		ls_Return = String(ddplb_1.TypeOf())
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
		ls_Return = String(ddplb_1.Resize(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
	Case	'SetFocus'
		ls_Return = String(ddplb_1.SetFocus())
	Case 'SelectItem'
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
		ls_Return = String(ddplb_1.SelectItem (ls_ParamArray[1],Integer(ls_ParamArray[2])))
	Case 'Text'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		ls_Return = ddplb_1.Text(Integer(ls_ParamArray[1]))
		
	Case 'ReplaceText'
		ls_Return = string(ddplb_1.ReplaceText(ls_Param))
		
	Case 'SelectedText'
		ls_Return = ddplb_1.SelectedText()		
		
	Case 'SelectText'	
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
		ls_Return = String(ddplb_1.SelectText (integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
		
	Case 'TotalItems'
		ls_Return = String(ddplb_1.TotalItems())
	Case 'GetParent'
		window  ls_win
		ls_win = ddplb_1.GetParent()
		ls_Return = ls_win.ClassName()
	Case 'SetRedraw'
		ls_Return = String(ddplb_1.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
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
		wf_random('string,index',lb_functionparm)
		Return
	Case 'DeleteItem'
		wf_random('index',lb_functionparm)
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
	Case 'DeleteItem'
		wf_random('index',lb_functionparm)
		Return
	Case 'SelectText'
		wf_random('from,to',lb_functionparm)
		Return
	Case 'SelectItem'
		wf_random('string,index',lb_functionparm)
		Return
	Case 'Text'
		wf_random('index',lb_functionparm)
		lb_functionparm.AddItem('1')
		Return
	Case 'SetPosition'		
		lb_functionparm.AddItem('ToTop!')
		lb_functionparm.AddItem('ToBottom!')
		Return
	Case 'SetRedraw'
		wf_random('Boolean',lb_functionparm)
	Case 'DeletePicture'
		wf_random('index',lb_functionparm)
		lb_functionparm.AddItem('1')
		Return
	Case 'AddPicture'
		lb_functionparm.AddItem('copy!')
		lb_functionparm.AddItem('paste!')
		lb_functionparm.AddItem('save!')
		Return
		Case'PostEvent'
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
		//lb_functionparm.additem('Help!')
		lb_functionparm.AddItem('Modified!')
		lb_functionparm.AddItem('SelectionChanged!')
		lb_functionparm.AddItem('DoubleClicked!')
		Return
		Case'TriggerEvent'
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
		//lb_functionparm.additem('Help!')
		lb_functionparm.AddItem('Modified!')
		lb_functionparm.AddItem('SelectionChanged!')
		lb_functionparm.AddItem('DoubleClicked!')
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

type cb_2 from w_standard_ancestor`cb_2 within w_dropdownpicturelistbox_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_dropdownpicturelistbox_new
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

ddplb_1.Reset()
ddplb_1.Visible = True
ddplb_1.Enabled = True
ddplb_1.TextSize = -8
ddplb_1.TextColor = RGB(0,0,0)
ddplb_1.BackColor = RGB(255,255,255)
ddplb_1.Border = True
ddplb_1.BorderStyle = StyleLowered!
ddplb_1.Italic = False
ddplb_1.FaceName = "MS Sans Serif"
ddplb_1.Weight = 400
ddplb_1.Underline = False
ddplb_1.X = ii_x
ddplb_1.Y = ii_y
ddplb_1.Width = ii_width
ddplb_1.Height = ii_height
ddplb_1.HScrollBar = False
ddplb_1.VScrollBar = False
ddplb_1.RightToLeft = False

ddplb_1.AddItem('Appeon Server',1)
ddplb_1.AddItem('Appeon Developer',2)
ddplb_1.AddItem('Appeon WebLibrary',3)
ddplb_1.AddItem('Sybase EAServer',4)
ddplb_1.AddItem('Sybase Powerbuilder',5)

tab_1.tabpage_3.lb_1.Reset()



end event

type st_tip from w_standard_ancestor`st_tip within w_dropdownpicturelistbox_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_dropdownpicturelistbox_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_dropdownpicturelistbox_new
string text = "DropDownPictureListBox"
end type

type ddplb_1 from dropdownpicturelistbox within w_dropdownpicturelistbox_new
integer x = 101
integer y = 108
integer width = 741
integer height = 452
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
borderstyle borderstyle = stylelowered!
string picturename[] = {"Custom060!","Query!","TreeView1!","AddWatch!","Application!"}
long picturemaskcolor = 536870912
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
ls_item = String(tab_1.tabpage_3.lb_1.TotalItems()+1,'000')+':'+"DropDownPictureListBox's Constructor Event"
tab_1.tabpage_3.lb_1.AddItem(ls_item)

end event

event destructor;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"DropDownPictureListBox's Destructor Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event doubleclicked;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"DropDownPictureListBox's DoubleClicked Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event getfocus;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"DropDownPictureListBox's GetFocus Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event losefocus;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"DropDownPictureListBox's LoseFocus Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event modified;string ls_item,ls_status
ls_status =ddplb_1.text
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"DropDownPictureListBox's Modified Event (Item="+ls_status+")"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event rbuttondown;string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"DropDownPictureListBox's RButtonDown Event"+" (flags="+string(flags)+",xpos="+string(xpos)+",ypos="+string(ypos)+")"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

event selectionchanged;string ls_item,ls_status
ls_status=ddplb_1.text
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"DropDownPictureListBox's SelectionChanged Event"+" (index="+string(index)+")"+"(Item="+ls_status+")"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

