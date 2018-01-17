$PBExportHeader$w_picturelistbox_new.srw
$PBExportComments$PictureListBox
forward
global type w_picturelistbox_new from w_standard_ancestor2
end type
type plb_1 from picturelistbox within w_picturelistbox_new
end type
end forward

global type w_picturelistbox_new from w_standard_ancestor2
string title = "PictureListBox"
plb_1 plb_1
end type
global w_picturelistbox_new w_picturelistbox_new

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

on w_picturelistbox_new.create
int iCurrent
call super::create
this.plb_1=create plb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.plb_1
end on

on w_picturelistbox_new.destroy
call super::destroy
destroy(this.plb_1)
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
ii_x=plb_1.X
ii_y=plb_1.Y
ii_width=plb_1.Width
ii_height=plb_1.Height
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

st_tip.text="The control is PictureListBox."
is_prop_data="BackColor,Border,BorderStyle,Enabled,ExtendedSelect,MultiSelect,FaceName,Height,HScrollBar,Italic,Item[ ],PictureName[ ]&
,RightToLeft,Sorted,Tag,TextColor,TextSize,Underline,Visible,VScrollBar,Weight,Width,X,Y"
is_fuction_data="AddItem,AddPicture,ClassName,DeleteItem,DeletePicture,DeletePictures,FindItem,GetParent&
,Hide,InsertItem,Move,PostEvent,Reset,Resize,SelectItem,SelectedItem,SelectedIndex,SetFocus,Show&
,SetState,SetRedraw,SetPosition,SetTop,State,Text,TotalItems,TotalSelected,TriggerEvent&
,Top(),TypeOf()"

end event

type tab_1 from w_standard_ancestor2`tab_1 within w_picturelistbox_new
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

String ls_Param,ls_ParamArray[]
Integer li_count
String ls_Return

ls_Param = sle_propparm.Text

Choose Case lb_prop.SelectedItem()
	Case 'TextSize'
		ls_Return = String(plb_1.TextSize)
		
	Case 'Sorted'
		ls_Return = String(plb_1.Sorted)
		
	Case 'TextColor'
		ls_Return = String(plb_1.TextColor)
		
	Case 'BackColor'
		ls_Return = String(plb_1.BackColor)
		
	Case 'Italic'
		ls_Return = String(plb_1.Italic)
		
	Case 'Enabled'
		ls_Return = String(plb_1.Enabled)
	
	Case 'ExtendedSelect'
	   ls_Return = String(plb_1.ExtendedSelect)
		
	Case 'MultiSelect'
		ls_Return = String(plb_1.MultiSelect)
		
	Case 'FaceName'
		ls_Return = plb_1.FaceName
		
	Case 'Visible'
		ls_Return = String(plb_1.Visible)
		
	Case 'RightToLeft'
		ls_Return = String(plb_1.RightToLeft)
		
	Case 'Height'
		ls_Return = String(plb_1.Height)
		
	Case 'Underline'
		ls_Return = String(plb_1.Underline)
		
	Case 'Tag'
		ls_Return = plb_1.Tag
		
	Case 'Weight'
		ls_Return = String(plb_1.Weight)
		
	Case 'Width'
		ls_Return = String(plb_1.Width)
		
	Case 'X'
		ls_Return = String(plb_1.X)
		
	Case 'Y'
		ls_Return = String(plb_1.Y)
		
	Case 'Border'
		ls_Return = String(plb_1.Border)
		
	Case 'BorderStyle'
		Choose Case plb_1.BorderStyle
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
		ls_Return = String(plb_1.HScrollBar)
		
	Case 'VScrollBar'
		ls_Return = String(plb_1.VScrollBar)
		
	Case 'Item[ ]'
		li_count = wf_str2array(ls_Param,ls_ParamArray)
		
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		If Integer(ls_ParamArray[1]) > UpperBound(plb_1.Item[]) Then
			MessageBox('Warning','This item does not exist.')
			Return
		End If
		
		ls_Return = plb_1.Item[Integer(ls_ParamArray[1])]
		st_tip.Text = "The PictureListBox's "+"Item[" + ls_ParamArray[1] + "]"+" property is "+ls_Return+"."
		Return
		
	Case 'PictureName[ ]'
		li_count = wf_str2array(ls_Param,ls_ParamArray)
		
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		If Integer(ls_ParamArray[1]) > UpperBound(plb_1.Item[]) Then
			MessageBox('Warning','This item does not exist.')
			Return
		End If
		
		ls_Return = plb_1.PictureName[Integer(ls_ParamArray[1])]
		st_tip.Text = "The PictureListBox's "+"PictureName[" + ls_ParamArray[1] + "]"+" property is "+ls_Return+"."
		Return
		
	Case Else
		Return
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The PictureListBox's "+lb_prop.SelectedItem()+" property is "+ls_Return+"."


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
		plb_1.TextSize = Integer(ls_Param)
		ls_Return = String(plb_1.TextSize)
		
	Case 'Sorted'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			plb_1.Sorted = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(plb_1.Sorted)
		
	Case 'TextColor'
		plb_1.TextColor = Long(ls_Param)
		ls_Return = String(plb_1.TextColor)
		
	Case 'BackColor'
		plb_1.BackColor = Long(ls_Param)
		ls_Return = String(plb_1.BackColor)
	
	Case  'Border'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			plb_1.Border = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(plb_1.Border)
		
	Case 'Italic'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			plb_1.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(plb_1.Italic)
		
	Case 'Enabled'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			plb_1.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(plb_1.Enabled)
	
	Case 'ExtendedSelect'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			plb_1.ExtendedSelect = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(plb_1.ExtendedSelect)
		
	case 'MultiSelect'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			plb_1.MultiSelect = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(plb_1.MultiSelect)
		
	Case 'FaceName'
		If  ls_Param = 'Arial' Then
			plb_1.FaceName = "Arial"
			ls_Return = plb_1.FaceName
		ElseIf ls_Param = 'Courier' Then
			plb_1.FaceName = "Courier"
			ls_Return = plb_1.FaceName
		ElseIf ls_Param = 'Fixedsys' Then
			plb_1.FaceName = "Fixedsys"
			ls_Return = plb_1.FaceName
		ElseIf ls_Param = 'MS Sans Serif' Then
			plb_1.FaceName = "MS Sans Serif"
			ls_Return = plb_1.FaceName
		ElseIf ls_Param = 'Modern' Then
			plb_1.FaceName = "Modern"
			ls_Return = plb_1.FaceName	
		End If
		
	Case 'Visible'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			plb_1.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(plb_1.Visible)
		
	Case 'Height'
		plb_1.Height = Integer(ls_Param)
		ls_Return = String(plb_1.Height)
		
	Case 'Underline'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			plb_1.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(plb_1.Underline)
		
	Case 'RightToLeft'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			plb_1.RightToLeft = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(plb_1.RightToLeft)
		
	Case 'Tag'
		plb_1.Tag = ls_Param
		ls_Return = plb_1.Tag
		
	Case 'Weight'
		plb_1.Weight = Integer(ls_Param)
		ls_Return = String(plb_1.Weight)
		
	Case 'Width'
		plb_1.Width = Integer(ls_Param)
		ls_Return = String(plb_1.Width)
		
	Case 'X'
		plb_1.X = Integer(ls_Param)
		ls_Return = String(plb_1.X)
		
	Case 'Y'
		plb_1.Y = Integer(ls_Param)
		ls_Return = String(plb_1.Y)
		
	Case 'BorderStyle'
		Choose Case ls_Param
			Case 'StyleRaised!'
				plb_1.BorderStyle = StyleRaised!
				
				If plb_1.BorderStyle = StyleRaised! Then
					ls_Return = 'StyleRaised!'
				End If
				
			Case 'StyleLowered!'
				plb_1.BorderStyle = StyleLowered!
				
				If plb_1.BorderStyle = StyleLowered! Then
					ls_Return = 'StyleLowered!'
				End If
				
			Case 'StyleBox!'
				plb_1.BorderStyle = StyleBox!
				
				If plb_1.BorderStyle = StyleBox! Then
					ls_Return = 'StyleBox!'
				End If
				
			Case 'StyleShadowBox!'
				plb_1.BorderStyle = StyleShadowBox!
				
				If plb_1.BorderStyle = StyleShadowBox! Then
					ls_Return = 'StyleShadowBox!'
				End If
				
		End Choose
		
	Case 'HScrollBar'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			plb_1.HScrollBar = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(plb_1.HScrollBar)
		
	Case 'VScrollBar'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			plb_1.VScrollBar = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(plb_1.VScrollBar)
		
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
		
		plb_1.Item[Integer(ls_ParamArray[1])] = ls_ParamArray[2]
		ls_Param = ls_ParamArray[2]
		st_tip.Text = "The PictureListBox "+"Item[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Param+"."
		Return
		
	Case 'PictureName[ ]'
		If LenA(ls_Param) = 0 Then Return
		
		If li_count < 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1]) Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		plb_1.PictureName[Integer(ls_ParamArray[1])] = ls_ParamArray[2]
		ls_Param = ls_ParamArray[2]
		st_tip.Text = "The PictureListBox "+"PictureName[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Param+"."
		Return
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The PictureListBox's "+is_select_data+" property is set to "+ls_Param+"."


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

Int  li
String  ls_temp

lb_propparm.Reset()
sle_propparm.Text = ''

is_select_data = lb_prop.SelectedItem()

Choose Case lb_prop.SelectedItem()
	Case 'TextSize'
		wf_random('TSIZE',lb_propparm)
		
	Case 'TextColor'
		wf_random('color',lb_propparm)
		
	Case 'BackColor'
		wf_random('COLOR',lb_propparm)
		
	Case 'Italic'
		wf_random('boolean',lb_propparm)
		
	Case 'Enabled'
		wf_random('boolean',lb_propparm)
	
	Case 'ExtendedSelect'
		wf_random('boolean',lb_propparm)
		
	case 'MultiSelect'
		wf_random('boolean',lb_propparm)
		
	Case 'FaceName'
		wf_random('Font',lb_propparm)
		
	Case 'Visible'
		wf_random('boolean',lb_propparm)
	
   Case 'RightToLeft'
		wf_random('boolean',lb_propparm)
		
	Case 'Height'
		wf_random('integer',lb_propparm)
		
	Case 'Underline'
		wf_random('boolean',lb_propparm)
		
	Case 'Tag'
		wf_random('string',lb_propparm)
		
	Case 'Weight'
		wf_random('integer',lb_propparm)
		
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
		lb_propparm.Reset()
		
		For li = 1 To plb_1.TotalItems() - 1
			ls_temp = String(li)+","+plb_1.Item[li+1]
			lb_propparm.AddItem(ls_temp)
		Next
		
		ls_temp = String(li)+","+plb_1.Item[1]
		lb_propparm.AddItem(ls_temp)
		
	Case 'PictureName[ ]'
		lb_propparm.Reset()
		
		For li = 1 To plb_1.TotalItems() - 1
			ls_temp = String(li)+","+plb_1.PictureName[li+1]
			lb_propparm.AddItem(ls_temp)
		Next
		
		ls_temp = String(li)+","+plb_1.PictureName[1]
		lb_propparm.AddItem(ls_temp)
		
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

string ls_Return,ls_Param
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

boolean lb_data
integer ii_x1,ii_y1,li_count
string ls_ParamArray[]

li_count=wf_str2array(ls_Param,ls_ParamArray)

if lb_function.selecteditem()='' or isnull(lb_function.selecteditem()) then
	 messagebox("Warning","Please select testing function.")
	 return
end if

CHOOSE CASE lb_function.selecteditem() + '()'
	CASE  'AddItem()'
		if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if
		
		ls_Return = string(plb_1.AddItem(ls_Param))
		
	case 'AddPicture()'
		if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if
		
		ls_Return = string(plb_1.AddPicture(ls_Param))
		
	CASE	'ClassName()'
		 ls_Return = plb_1.Classname()
		 
	CASE	'Reset()'
		 ls_Return = string(plb_1.Reset())
		 
	CASE 'DeleteItem()'
		if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if
		
		if NOT IsNumber(ls_ParamArray[1])   then	
		   messagebox("Warning","Parameter type error.")
		   return 
		end if
		
		ls_Return=string(plb_1.DeleteItem(Integer(ls_Param)))
		
	CASE 'DeletePicture()'
		if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if
		
		if NOT IsNumber(ls_ParamArray[1])   then	
		   messagebox("Warning","Parameter type error.")
		   return 
		end if
		
		ls_Return=string(plb_1.DeletePicture(Integer(ls_Param)))
		
	CASE 'DeletePictures()'
		ls_Return=string(plb_1.DeletePictures())
		
	CASE 'FindItem()'
      if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if
		
		if li_count<>2 then 
		   messagebox("Warning","The parameter number should be 2.")
		   return
	   end if
		
		if NOT IsNumber(ls_ParamArray[2])  then
		   messagebox("Warning","Parameter type error.")
		   return 
		end if
		
		ls_Return=string(plb_1.FindItem(ls_ParamArray[1],integer(ls_ParamArray[2])))
		
	CASE	'Hide()'
		ls_Return=string(plb_1.Hide())
		
	CASE 'InsertItem()'
		if ls_Param='' or isnull(ls_Param) then
		   messagebox("Warning","Please select testing data.")
		   return
   	end if
		
		if li_count<>2 then 
		   messagebox("Warning","Parameter number should be 2.")
		   return
		end if
		
		if NOT IsNumber(ls_ParamArray[2])  then
			messagebox("Warning","Parameter type error.")
			return 
		end if
		
	   ls_Return=string(plb_1.InsertItem(ls_ParamArray[1],Integer(ls_ParamArray[2])))
		
	CASE'Show()'
		ls_Return=string(plb_1.Show())
		
	CASE	'Move()'
		if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if
		
		if li_count<>2 then 
		   messagebox("Warning","The parameter number should be 2.")
		   return
		end if
		
		if NOT IsNumber(ls_ParamArray[1]) or NOT IsNumber(ls_ParamArray[2])  then
		   messagebox("Warning","Parameter type error.")
		   return 
		end if
		
		ls_Return=string(plb_1.Move(integer(ls_ParamArray[1]),integer(ls_ParamArray[2])))		
		
	CASE'TypeOf()'
		if plb_1.typeof()=picturelistbox! then
		   ls_Return='picturelistbox!'
		else
			ls_Return='not valid'
		end if
		
	CASE	'Resize()'
		if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if
		
		if li_count<>2 then 
			messagebox("Warning","The parameter number should be 2.")
			return
		end if
		
		if NOT IsNumber(ls_ParamArray[1]) or NOT IsNumber(ls_ParamArray[2])  then
		   messagebox("Warning","Parameter type error.")
		   return 
		end if
		
		ls_Return=string(plb_1.Resize(integer(ls_ParamArray[1]),integer(ls_ParamArray[2])))
		
   CASE	'SetFocus()'
		ls_Return=string(plb_1.SetFocus())
		
   CASE 'SelectItem()'
		if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if
		
		if li_count<>2 then 
		   messagebox("Warning","The parameter number should be 2.")
		   return
		end if
		
		if NOT IsNumber(ls_ParamArray[2])  then
		   messagebox("Warning","Parameter type error.")
		   return 
		end if
		
		ls_Return=string(plb_1.SelectItem (ls_ParamArray[1],Integer(ls_ParamArray[2])))
   
   CASE 'Text()'
		if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if
		
		if NOT IsNumber(ls_ParamArray[1])  then
		   messagebox("Warning","Parameter type error.")
		   return 
		end if
		
		ls_Return=plb_1.Text (Integer(ls_Param))
		
	CASE 'TotalItems()'
		ls_Return=string(plb_1.TotalItems())
		
	CASE 'GetParent()'
		window  ls_win  
		ls_win = plb_1.GetParent()
		ls_Return=ls_win.ClassName()

	CASE 'SetState()'
		if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if
		
		if li_count<>2 then 
		   messagebox("Warning","The parameter number should be 2.")
		   return
		end if
		
		if NOT IsNumber(ls_ParamArray[1])   then
		   messagebox("Warning","Parameter type error.")
		   return 
		end if
		
      IF (lower(trim(ls_ParamArray[2])) <> "true") and (lower(trim(ls_ParamArray[2])) <> "false")  THEN
			messagebox("Warning","Parameter type error.")
			RETURN
		END IF
		
		ii_x1=integer(ls_ParamArray[1])
		lb_data=inv_util.of_string_to_boolean(ls_ParamArray[2])
    	ls_Return=string(plb_1.SetState(ii_x1,lb_data))
		 
	CASE 'TotalSelected()'
	   ls_Return=string(plb_1.TotalSelected())
		
	CASE 'SelectedIndex()'
	   ls_Return=string(plb_1.SelectedIndex())
		
	CASE 'SelectedItem()'
		ls_Return=string(plb_1.SelectedItem())
		
	case 'SetPosition()'
		choose case ls_Param				
			case 'ToTop!'
				ls_Return = string(plb_1.SetPosition(ToTop!)) 
				
			case 'ToBottom!'
				ls_Return = string(plb_1.SetPosition(ToBottom!))
				
			case else
				messagebox("Warning","Parameter error.")
				
		end choose	
	Case 'SetRedraw'
			ls_Return=string(plb_1.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
			
	CASE 'SetTop()'
		if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if  
		
		if NOT IsNumber(ls_ParamArray[1])   then
			messagebox("Warning","Parameter type error.")
			return 
		end if
		
	   ls_Return=string(plb_1.SetTop(integer(ls_ParamArray[1])))
		
	CASE 'State()'
		if ls_Param='' or isnull(ls_Param) then
	 		messagebox("Warning","Please select testing data.")
	 		return
   	end if
		
		if  NOT IsNumber(ls_ParamArray[1])   then
			messagebox("Warning","Parameter type error.")
			return 
		end if
		
	   ls_Return=string(plb_1.State(integer(ls_ParamArray[1])))
		
	CASE 'Top()'
		ls_Return=string(plb_1.Top())
		
	CASE 'PostEvent()'
		 choose case ls_Param
			case 'Clicked!'
				ls_Return = string(plb_1.PostEvent(Clicked!))
				
			case 'Constructor!'
				ls_Return = string(plb_1.PostEvent(Constructor!))
				
			case 'Destructor!'
				ls_Return = string(plb_1.PostEvent(Destructor!))
				
			case 'GetFocus!'
				ls_Return = string(plb_1.PostEvent(GetFocus!))
				
			case 'Help'
				ls_Return = string(plb_1.PostEvent('Help'))
				
			case 'LoseFocus!'
				ls_Return = string(plb_1.PostEvent(LoseFocus!))
				
			case 'RButtonDown!'
				ls_Return = string(plb_1.PostEvent(RButtonDown!))
				
			case 'DoubleClicked!'
				ls_Return = string(plb_1.PostEvent(DoubleClicked!))
				
			case 'SelectionChanged!'
				ls_Return = string(plb_1.PostEvent(SelectionChanged!))
				
			case 'Modified!'
				ls_Return = string(plb_1.PostEvent(Modified!))
				
		 end choose
		 
   case 'TriggerEvent()'
		choose case ls_Param
			case 'Constructor!'
				ls_Return = string(plb_1.TriggerEvent(Constructor!))
				
			case 'Destructor!'
				ls_Return = string(plb_1.TriggerEvent(Destructor!))
				
			case 'GetFocus!'
				ls_Return = string(plb_1.TriggerEvent(GetFocus!))
				
			case 'Help'
				ls_Return = string(plb_1.TriggerEvent('Help'))
				
			case 'LoseFocus!'
				ls_Return = string(plb_1.TriggerEvent(LoseFocus!))
				
			case 'RButtonDown!'
				ls_Return = string(plb_1.TriggerEvent(RButtonDown!))
				
			case 'DoubleClicked!'
				ls_Return = string(plb_1.TriggerEvent(DoubleClicked!))
				
			case 'SelectionChanged!'
				ls_Return = string(plb_1.TriggerEvent(SelectionChanged!))
				
			case 'Modified!'
				ls_Return = string(plb_1.TriggerEvent(Modified!))
				
	   end choose
		
END CHOOSE

ls_Return = inv_util.of_convert_to_upper(ls_return)
st_tip.text = "Function "+lb_function.selecteditem()+" is executed. The return value is " + ls_Return + "."


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

int  li

lb_functionparm.Reset()
sle_functionparm.text = ''

choose case lb_function.selecteditem() + '()'
	case 'Move()'
		wf_random('integer,integer',lb_functionparm)
		
   case 'Resize()'
		wf_random('integer,integer',lb_functionparm)
		
   case 'AddItem()'
		wf_random('string',lb_functionparm)
		
   case 'AddPicture()'
		lb_functionparm.reset()
		lb_functionparm.additem('copy!')
		lb_functionparm.additem('paste!')
		lb_functionparm.additem('save!')		
		
	case 'DeleteItem()'
		lb_functionparm.reset()
		
		FOR li= 1 to plb_1.totalitems()
			lb_functionparm.additem(string(li))
		NEXT
		
		return
		
	case 'DeletePicture()'
		lb_functionparm.reset()
		
		FOR li= 1 to plb_1.totalitems()
			lb_functionparm.additem(string(li))
		NEXT
		
		return
		
	case 'DeletePictures()'
		lb_functionparm.reset()
		return
		
	case 'FindItem()'
		wf_random('string,index',lb_functionparm)
		lb_functionparm.additem('aa,1')
		lb_functionparm.additem('ca,2')
		return
		
   case 'InsertItem()'
		wf_random('string,index',lb_functionparm)
		lb_functionparm.additem('aa,1')
		lb_functionparm.additem('ca,2')
		return
		
	case 'SetState()'
		lb_functionparm.additem('1,True')
		lb_functionparm.additem('2,False')
		return
		
	case 'SelectItem()'
		wf_random('string,index',lb_functionparm)
		lb_functionparm.additem('aa,1')
		lb_functionparm.additem('small,2')
		return
		
	case 'Text()'
		wf_random('index',lb_functionparm)
		return
		
	case 'State()'
		wf_random('index',lb_functionparm)
		return
		
	case 'SetTop()'
		wf_random('integer',lb_functionparm)
		return
	case 'SetRedraw'
		wf_random('boolean',lb_functionparm)
		return
		
	case 'SetPosition()'		
		lb_functionparm.additem('ToTop!')
		lb_functionparm.additem('ToBottom!')
		return
		
   case'PostEvent()'
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('GetFocus!')
		
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')
		
		lb_functionparm.additem('SelectionChanged!')
		lb_functionparm.additem('DoubleClicked!')
		return
		
	case'TriggerEvent()'
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('GetFocus!')
		
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')
		
		lb_functionparm.additem('SelectionChanged!')
		lb_functionparm.additem('DoubleClicked!')
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

type cb_2 from w_standard_ancestor2`cb_2 within w_picturelistbox_new
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_picturelistbox_new
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

plb_1.reset()
plb_1.reset()
plb_1.Visible = TRUE
plb_1.Enabled = TRUE
plb_1.tag=''
plb_1.TextSize =-8
plb_1.TextColor = 33554432
plb_1.BackColor = Rgb(255,255,255)
plb_1.border=true
plb_1.Italic = FALSE
plb_1.FaceName = "MS Scans Serif"
plb_1.Weight = 400
plb_1.UnderLine = FALSE
plb_1.X=ii_x
plb_1.Y=ii_y
plb_1.Width=ii_width
plb_1.Height=ii_height
plb_1.borderstyle=StyleLowered!
plb_1.HScrollBar=true
plb_1.VScrollBar=true
plb_1.sorted=false
plb_1.RightToLeft = False

plb_1.additem('Sybase',1)
plb_1.additem('Jaguar Manager',2)
plb_1.additem('Jaguar Server',3)
plb_1.additem('Database',4)
plb_1.additem('PowerBuilder',5)


end event

type st_tip from w_standard_ancestor2`st_tip within w_picturelistbox_new
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_picturelistbox_new
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_picturelistbox_new
string text = "PictureListBox"
end type

type plb_1 from picturelistbox within w_picturelistbox_new
integer x = 101
integer y = 120
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
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
string item[] = {"Sybase","Jaguar Manager","Jaguar Server","Database","PowerBuilder"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2,3,4,5}
string picturename[] = {"Application!","BringToFront!","Export!","AddWatch!","Print.jpg"}
long picturemaskcolor = 553648127
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureListBox's Constructor Event"
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureListBox's Destructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer	index		
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
ls_status = plb_1.selecteditem()
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureListBox's DoubleClicked Event" +"(index=" +string(index)+")" +"(item="+ ls_status+ ", selectedindex="+string(this.selectedindex())+")"
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureListBox's Getfocus Event "
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
ls_status = plb_1.selecteditem()
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureListBox's Lostfocus Event" +"(Item=" +ls_status+")"
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureListBox's RButtondown Event (flags=" + string(flags)+',xpos='+string(xpos)+',ypos='+string(ypos)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event selectionchanged;//====================================================================
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

string ls_item,ls_status
ls_status = plb_1.selecteditem()
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureListBox's SelectionChanged Event " +"(index="+string(index)+"),(item="+ ls_status+ ", selectedindex="+string(this.selectedindex())+")" 
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

