$PBExportHeader$w_treeview_new.srw
forward
global type w_treeview_new from w_standard_ancestor2
end type
type tv_1 from treeview within w_treeview_new
end type
end forward

global type w_treeview_new from w_standard_ancestor2
string title = "TreeView"
tv_1 tv_1
end type
global w_treeview_new w_treeview_new

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
integer  ii_handle = 1
end variables

on w_treeview_new.create
int iCurrent
call super::create
this.tv_1=create tv_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_1
end on

on w_treeview_new.destroy
call super::destroy
destroy(this.tv_1)
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
treeviewitem tv_item
st_tip.text="The control is TreeView."
ii_x=tv_1.X
ii_y=tv_1.Y
ii_width=tv_1.Width
ii_height=tv_1.Height

tv_1.InsertItemLast(0,'Web Library',1)
tv_1.InsertItemLast(1,'Controls',2)
tv_1.InsertItemLast(1,'Global Function',3)
tv_1.InsertItemLast(0,'Appeon Server',4)
tv_1.InsertItemLast(0,'Appeon Developer',5)
tv_1.InsertItemLast(0,'Appeon AEM',6)
tv_1.expanditem(1)
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

is_prop_data="BackColor,Border,BorderStyle,CheckBoxes,DeleteItems,EditLabels,Enabled,FaceName,FullRowSelect&
,HasButtons,HasLines,Height,ItemHandle,Italic,Label,Level,LinesAtRoot,PictureIndex,Selected,SelectedPictureIndex,StatePictureIndex,StatePictureName[],Tag,TextColor,TextSize&
,Underline,Visible,Weight,Width,X,Y"
is_fuction_data="AddPicture,AddStatePicture,ClassName,CollapseItem,DeleteItem,DeletePicture,DeletePictures,DeleteStatePicture,DeleteStatePictures,EditLabel,ExpandAll,ExpandItem&
,FindItem,GetItem,GetParent,Hide,InsertItem,InsertItemFirst,InsertItemLast,InsertItemSort,Move,PostEvent,Resize,SelectItem,SetFocus,SetRedraw,Show,SetItem,SetPosition,TriggerEvent&
,TypeOf"


end event

type tab_1 from w_standard_ancestor2`tab_1 within w_treeview_new
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

Boolean lb_data
String ls_Param,ls_ParamArray[]
Integer li_count
String ls_Return
treeviewitem tv_item

ls_Param = Trim(sle_propparm.Text)

Choose Case lb_prop.SelectedItem()
	Case 'BackColor'
		ls_Return = String(tv_1.BackColor)
		
	Case  'Border'
		ls_Return = String(tv_1.Border)
		
	Case  'BorderStyle'
		Choose Case tv_1.BorderStyle
			Case StyleLowered!
				ls_Return = 'StyleLowered!'
				
			Case StyleRaised!
				ls_Return = 'StyleRaised!'
				
			Case StyleBox!
				ls_Return = 'StyleBox!'
				
			Case StyleShadowBox!
				ls_Return = 'StyleShadowBox!'
				
		End Choose
		
	Case  'DeleteItems'
		ls_Return = String(tv_1.DeleteItems)
		
	Case  'Enabled'
		ls_Return = String(tv_1.Enabled)
		
	Case  'FaceName'
		ls_Return = tv_1.FaceName
		
	Case  'HasButtons'
		ls_Return = String(tv_1.HasButtons)
		
	Case 'FullRowSelect'
		ls_Return = String(tv_1.FullRowSelect)
		
	Case  'HasLines'
		ls_Return = String(tv_1.HasLines)
		
	Case  'Height'
		ls_Return = String(tv_1.Height)
		
	Case  'Italic'
		ls_Return = String(tv_1.Italic)
		
	Case  'LinesAtRoot'
		ls_Return = String(tv_1.LinesAtRoot)
		
	Case  'Tag'
		ls_Return = tv_1.Tag
		
	Case  'TextColor'
		ls_Return = String(tv_1.TextColor)
		
	Case  'TextSize'
		ls_Return = String(tv_1.TextSize)
		
	Case  'Underline'
		ls_Return = String(tv_1.Underline)
		
	Case  'Visible'
		ls_Return = String(tv_1.Visible)
		
	Case  'Weight'
		ls_Return = String(tv_1.Weight)
		
	Case  'Width'
		ls_Return = String(tv_1.Width)
		
	Case  'X'
		ls_Return = String(tv_1.X)
		
	Case  'Y'
		ls_Return = String(tv_1.Y)
		
	Case  'CheckBoxes'
		ls_Return = String(tv_1.CheckBoxes)
		
	Case  'EditLabels'
		ls_Return = String(tv_1.EditLabels)
		
	Case  'StatePictureName[]'
		li_count = wf_str2array(ls_Param,ls_ParamArray)
		
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		If Integer(ls_ParamArray[1]) > UpperBound(tv_1.StatePictureName[]) Then
			MessageBox('Warning','This item does not exist.')
			Return
		End If
		
		ls_Return = tv_1.StatePictureName[Integer(ls_ParamArray[1])]
		st_tip.Text = "The TreeView's "+"StatePictureName[" + ls_ParamArray[1] + "]"+" property is "+ls_Return+"."
		Return
		
		ls_Return = tv_1.StatePictureName[Integer(ls_Param)]
		
	Case 'Bold'
		If LenA(ls_Param) = 0 Or IsNull(ls_Param) Then
			MessageBox("Warning","The parameter number should be 1.")
			Return
		End If
		
		If Not IsNumber(ls_Param)   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_Param),tv_item)
		ls_Return = String(tv_item.Bold)
		
		Case'Children'
		If LenA(ls_Param) = 0 Or IsNull(ls_Param) Then
			MessageBox("Warning","The parameter number should be 1.")
			Return
		End If
		
		If Not IsNumber(ls_Param)   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_Param),tv_item)
		ls_Return = String(tv_item.Children)
		
	Case 'Data'
		If LenA(ls_Param) = 0 Or IsNull(ls_Param) Then
			MessageBox("Warning","The parameter number should be 1.")
			Return
		End If
		
		If Not IsNumber(ls_Param)  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_Param),tv_item)
		ls_Return = String(tv_item.Data)
		
		Case'ItemHandle'
		If LenA(ls_Param) = 0 Or IsNull(ls_Param) Then
			MessageBox("Warning","The parameter number should be 1.")
			Return
		End If
		
		If Not IsNumber(ls_Param)   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_Param),tv_item)
		ls_Return = String(tv_item.ItemHandle)
		
	Case 'Label'
//		If Len(ls_Param) = 0 Or IsNull(ls_Param) Then
//			MessageBox("Warning","The parameter number should be 1.")
//			Return
//		End If
//		
//		If Not IsNumber(ls_Param)   Then
//			MessageBox("Warning","Parameter type error.")
//			Return
//		End If
//		
//		tv_1.GetItem(Integer(ls_Param),tv_item)
//		ls_Return = String(tv_item.Label)
		If ii_handle < 0 Then
		   MessageBox("Warning","Please select the ListView item")
			Return
		End if
		tv_1.GetItem(ii_handle,tv_item)
		ls_Return = String(tv_item.Label)
		
		Case'Level'
		If LenA(ls_Param) = 0 Or IsNull(ls_Param) Then
			MessageBox("Warning","The parameter number should be 1.")
			Return
		End If
		
		If Not IsNumber(ls_Param)   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_Param),tv_item)
		ls_Return = String(tv_item.Level)
		
	Case 'PictureIndex'
		If LenA(ls_Param) = 0 Or IsNull(ls_Param) Then
			MessageBox("Warning","The parameter number should be 1.")
			Return
		End If
		
		If Not IsNumber(ls_Param)   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_Param),tv_item)
		ls_Return = String(tv_item.PictureIndex)
		
		Case'SelectedPictureIndex'
		If LenA(ls_Param) = 0 Or IsNull(ls_Param) Then
			MessageBox("Warning","The parameter number should be 1.")
			Return
		End If
		
		If Not IsNumber(ls_Param)   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_Param),tv_item)
		ls_Return = String(tv_item.SelectedPictureIndex)
		
		Case'Selected'
		If LenA(ls_Param) = 0 Or IsNull(ls_Param) Then
			MessageBox("Warning","The parameter number should be 1.")
			Return
		End If
		
		If Not IsNumber(ls_Param)   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_Param),tv_item)
		ls_Return = String(tv_item.Selected)
		
	Case 'StatePictureIndex'
		If LenA(ls_Param) = 0 Or IsNull(ls_Param) Then
			MessageBox("Warning","The parameter number should be 1.")
			Return
		End If
		
		If Not IsNumber(ls_Param)   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_Param),tv_item)
		ls_Return = String(tv_item.StatePictureIndex)
		
		Case'OverlayPictureIndex'
		If LenA(ls_Param) = 0 Or IsNull(ls_Param) Then
			MessageBox("Warning","The parameter number should be 1.")
			Return
		End If
		
		If Not IsNumber(ls_Param)   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
//		tv_1.GetItem(Integer(ls_Param),tv_item)
//		ls_Return = String(tv_item.OverlayPictureIndex)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The TreeView's "+lb_prop.SelectedItem()+" property is "+ls_Return+"."


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

String ls_Param,ls_ParamArray[]
String ls_Return

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

Boolean lb_data
Int li_count
treeviewitem tv_item

li_count = wf_str2array(ls_Param,ls_ParamArray)

Choose Case lb_prop.SelectedItem()
	Case 'BackColor'
		tv_1.BackColor = Long(ls_Param)
		ls_Return = String(tv_1.BackColor)
		
	Case  'Border'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			tv_1.Border = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(tv_1.Border)
		
	Case  'BorderStyle'
		Choose Case ls_Param
			Case 'StyleRaised!'
				tv_1.BorderStyle = StyleRaised!
				If tv_1.BorderStyle = StyleRaised! Then
					ls_Return = 'StyleRaised!'
				End If
				
			Case 'StyleBox!'
				tv_1.BorderStyle = StyleBox!
				If tv_1.BorderStyle = StyleBox! Then
					ls_Return = 'StyleBox!'
				End If
				
			Case 'StyleShadowBox!'
				tv_1.BorderStyle = StyleShadowBox!
				If tv_1.BorderStyle = StyleShadowBox! Then
					ls_Return = 'StyleShadowBox!'
				End If
				
			Case 'StyleLowered!'
				tv_1.BorderStyle = StyleLowered!
				If tv_1.BorderStyle = StyleLowered! Then
					ls_Return = 'StyleLowered!'
				End If
				
		End Choose
		
	Case  'DeleteItems'
		tv_1.DeleteItems = inv_util.of_string_to_boolean(ls_Param)
		ls_Return = String(tv_1.DeleteItems)
		
	Case  'Enabled'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			tv_1.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(tv_1.Enabled)
		
	Case  'FaceName'
		If ls_Param = 'Arial' Then
			tv_1.FaceName = "Arial"
			ls_Return = tv_1.FaceName
		ElseIf ls_Param = 'Courier' Then
			tv_1.FaceName = "Courier"
			ls_Return = tv_1.FaceName
		ElseIf ls_Param = 'Fixedsys' Then
			tv_1.FaceName = "Fixedsys"
		ElseIf ls_Param = 'MS Sans Serif' Then
			tv_1.FaceName = "MS Sans Serif"
		ElseIf ls_Param = 'Modern' Then
			tv_1.FaceName = "Modern"	
		End If
		
		ls_Return = tv_1.FaceName
		
	Case 'FullRowSelect'
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			tv_1.FullRowSelect = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
		End If
		
		ls_Return = String(tv_1.FullRowSelect)
		
	Case  'HasButtons'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			tv_1.HasButtons = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(tv_1.HasButtons)
		
	Case  'HasLines'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			tv_1.HasLines = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(tv_1.HasLines)
		
	Case  'Height'
		tv_1.Height = Integer(ls_Param)
		ls_Return = String(tv_1.Height)
		
	Case  'Italic'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			tv_1.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(tv_1.Italic)
		
	Case  'LinesAtRoot'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			tv_1.LinesAtRoot = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(tv_1.LinesAtRoot)
		
	Case  'Tag'
		tv_1.Tag = ls_Param
		ls_Return = tv_1.Tag
		
	Case  'TextColor'
		tv_1.TextColor = Long(ls_Param)
		ls_Return = String(tv_1.TextColor)
		
	Case  'TextSize'
		tv_1.TextSize = Integer(ls_Param)
		ls_Return = String(tv_1.TextSize)
		
	Case  'Underline'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			tv_1.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(tv_1.Underline)
		
	Case  'Visible'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			tv_1.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(tv_1.Visible)
		
	Case  'Weight'
		tv_1.Weight = Integer(ls_Param)
		ls_Return = String(tv_1.Weight)
		
	Case  'Width'
		tv_1.Width = Integer(ls_Param)
		ls_Return = String(tv_1.Width)
		
	Case  'X'
		tv_1.X = Integer(ls_Param)
		ls_Return = String(tv_1.X)
		
	Case  'Y'
		tv_1.Y = Integer(ls_Param)
		ls_Return = String(tv_1.Y)
		
	Case  'CheckBoxes'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			tv_1.CheckBoxes = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(tv_1.CheckBoxes)
		
	Case  'EditLabels'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		
		If Lower(Trim(ls_Param)) = 'true' Or Lower(Trim(ls_Param)) = 'false' Then
			tv_1.EditLabels = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(tv_1.EditLabels)
		
	Case  'StatePictureName[]'
		If  li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1]) Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.StatePictureName[Integer(ls_ParamArray[1])] = ls_ParamArray[2]
		ls_Return = ls_ParamArray[2]
		st_tip.Text = "The TreeView's "+"StatePictureName[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Return+"."
		Return
		
	Case 'Bold'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		If Lower(Trim(ls_ParamArray[2])) = 'true' Or Lower(Trim(ls_ParamArray[2])) = 'false' Then
			tv_1.GetItem(Integer(ls_ParamArray[1]),tv_item)
			tv_item.Bold = inv_util.of_string_to_boolean(ls_ParamArray[2])
			tv_1.SetItem(Integer(ls_ParamArray[1]),tv_item)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = ls_ParamArray[2]
		
		Case'Children'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		If Lower(Trim(ls_ParamArray[2])) = 'true' Or Lower(Trim(ls_ParamArray[2])) = 'false' Then
			tv_1.GetItem(Integer(ls_ParamArray[1]),tv_item)
			tv_item.Children = inv_util.of_string_to_boolean(ls_ParamArray[2])
			tv_1.SetItem(Integer(ls_ParamArray[1]),tv_item)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = ls_ParamArray[2]
		
	Case 'Data'
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_ParamArray[1]),tv_item)
		tv_item.Data = ls_ParamArray[2]
		tv_1.SetItem(Integer(ls_ParamArray[1]),tv_item)
		ls_Return = ls_ParamArray[2]
		
		Case'ItemHandle'
		MessageBox("Alert","This is a readonly property.")
		Return
		
	Case 'Label'
//		If li_count <> 2 Then
//			MessageBox("Warning","The parameter number should be 2.")
//			Return
//		End If
		
//		If Not IsNumber(ls_ParamArray[1])  Then
//			MessageBox("Warning","Parameter type error.")
//			Return
//		End If
		
//		tv_1.GetItem(Integer(ls_ParamArray[1]),tv_item)
//		tv_item.Label = ls_ParamArray[2]
//		tv_1.SetItem(Integer(ls_ParamArray[1]),tv_item)
//		ls_Return = ls_ParamArray[2]
		If ii_handle < 0 Then
		   MessageBox("Warning","Please select the ListView item")
			Return
		End if
		tv_1.GetItem(ii_handle,tv_item)
		tv_item.Label = ls_Param
		tv_1.SetItem(ii_handle,tv_item)
		ls_Return = ls_Param
		
		Case'Level'
		MessageBox('Alert',"This is a readonly property.")
		Return
		
	Case 'PictureIndex'
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_ParamArray[1]),tv_item)
		tv_item.PictureIndex = Integer(ls_ParamArray[2])
		tv_1.SetItem(Integer(ls_ParamArray[1]),tv_item)
		ls_Return = ls_ParamArray[2]
		
		Case'SelectedPictureIndex'
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_ParamArray[1]),tv_item)
		tv_item.SelectedPictureIndex = Integer(ls_ParamArray[2])
		tv_1.SetItem(Integer(ls_ParamArray[1]),tv_item)
		ls_Return = ls_ParamArray[2]
		
		Case'Selected'
		If ls_Param = '' Or IsNull(ls_Param) Then Return
		
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		If Lower(Trim(ls_ParamArray[2])) = 'true' Or Lower(Trim(ls_ParamArray[2])) = 'false' Then
			tv_1.SetFocus()
			tv_1.GetItem(Integer(ls_ParamArray[1]),tv_item)
			tv_item.Selected = inv_util.of_string_to_boolean(ls_ParamArray[2])
			tv_1.SetItem(Integer(ls_ParamArray[1]),tv_item)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = ls_ParamArray[2]
		
	Case 'StatePictureIndex'
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_ParamArray[1]),tv_item)
		tv_item.StatePictureIndex = Integer(ls_ParamArray[2])
		tv_1.SetItem(Integer(ls_ParamArray[1]),tv_item)
		ls_Return = ls_ParamArray[2]
		
	Case'OverlayPictureIndex'
		If li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
//		tv_1.GetItem(Integer(ls_ParamArray[1]),tv_item)
//		tv_item.OverlayPictureIndex = Integer(ls_ParamArray[2])
//		tv_1.SetItem(Integer(ls_ParamArray[1]),tv_item)
//		ls_Return = ls_ParamArray[2]
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)

st_tip.Text = "The TreeView's "+lb_prop.SelectedItem()+" property is set to "+ls_Return+"."


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
sle_propparm.text = ''

string ls_type
is_select_data=lb_prop.selecteditem()
ls_type=wf_get_type()

CHOOSE CASE lb_prop.SelectedItem()
   CASE 'BorderStyle'
		lb_propparm.AddItem("StyleBox!")
		lb_propparm.AddItem("StyleLowered!")
		lb_propparm.AddItem("StyleRaised!")
		//lb_propparm.AddItem("StyleShadowBox!")
	   return
		
	CASE 'FaceName'
		wf_random('Font',lb_propparm)
		return
		
	CASE 'FullRowSelect'
		wf_random('boolean',lb_propparm)
		return 
		
	CASE 'StatePictureName[]'
		lb_propparm.additem('1,save.jpg')
		return	
		
	CASE 'SortType'
		lb_propparm.additem('Ascending!')
		lb_propparm.additem('Descending!')
		lb_propparm.additem('UserDefinedSort!')
		lb_propparm.additem('Unsorted!')
		return
		
    CASE'Bold'
	   lb_propparm.additem('1,true')
		lb_propparm.additem('1,false')
		return
		
	 CASE'Children'
	   lb_propparm.additem('1,true')
		lb_propparm.additem('1,false')
		return
		
	 CASE'Data'
	   lb_propparm.additem('1,Appeon')
		lb_propparm.additem('1,Sybase')
		return
		
	 CASE'ItemHandle'
	   lb_propparm.additem('1')
		lb_propparm.additem('2')
		return
		
	 CASE'Label'
	   lb_propparm.additem('Appeon')
		lb_propparm.additem('Sybase')
		return
		
	 CASE'Level'
	   lb_propparm.additem('1')
		lb_propparm.additem('2')
		return
		
	 CASE'PictureIndex'
	   lb_propparm.additem('1,1')
		lb_propparm.additem('2,1')
		return
		
	 CASE'SelectedPictureIndex'
	   lb_propparm.additem('1,1')
		lb_propparm.additem('2,1')
		return
		
	 CASE'Selected'
	   lb_propparm.additem('1,true')
		lb_propparm.additem('2,false')
		return
		
	 CASE'StatePictureIndex'
	   lb_propparm.additem('1,1')
		lb_propparm.additem('2,1')
		return
		
//	 CASE'OverlayPictureIndex'
//	   lb_propparm.additem('1,1')
//		lb_propparm.additem('2,1')
//	   return
		
END CHOOSE

wf_random(ls_type,lb_propparm)

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String ls_Return,ls_Param

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

TreeViewItem tvi_ret
Integer ii_x1,ii_y1,ii_1,ii_2,ii_3,ii_4,ii_5,li_count
String ls_ParamArray[]

li_count = wf_str2array(ls_Param,ls_ParamArray)

TreeViewItem tv_11, tv_22
tv_11.Label = "face1"
tv_11.PictureIndex = 5
tv_11.SelectedPictureIndex = 6
tv_22.Label = "face2"
tv_22.PictureIndex = 7
tv_22.SelectedPictureIndex = 8

If lb_function.SelectedItem() = '' Or IsNull(lb_function.SelectedItem()) Then
	MessageBox("Warning","Please select testing function.")
	Return
End If

Choose Case lb_function.SelectedItem()
	Case  'AddPicture'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		ls_Return = String(tv_1.AddPicture(Trim(ls_Param)))
		
	Case  'AddStatePicture'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		ls_Return = String(tv_1.AddstatePicture(Trim(ls_Param)))
		
	Case	'ClassName'
		ls_Return = String(tv_1.ClassName())
		
	Case	'GetParent'
		window  ls_win
		ls_win = tv_1.GetParent()
		ls_Return = ls_win.ClassName()
		
	Case	'SetItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1]) Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.GetItem(Integer(ls_ParamArray[1]),tvi_ret)
		tvi_ret.Label = "Updated "+tvi_ret.Label
		ls_Return = String(tv_1.SetItem(Integer(ls_ParamArray[1]),tvi_ret))
		
	Case 'DeletePicture'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(tv_1.DeletePicture(Integer(ls_Param)))
		
	Case	'DeletePictures'
		ls_Return = String(tv_1.DeletePictures())
		
	Case 'DeleteStatePicture'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(tv_1.DeleteStatePicture(Integer(ls_Param)))
		
	Case	'DeletePictures'
		ls_Return = String(tv_1.DeletePictures())
		
	Case	'DeleteStatePictures'
		ls_Return = String(tv_1.DeleteStatePictures())
		
	Case 'FindItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If  li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		Choose Case Lower(ls_ParamArray[1])
			Case "roottreeitem!"
				ls_Return = String(tv_1.FindItem(RootTreeItem!,Integer(ls_ParamArray[2])))
				
			Case "nexttreeitem!"
				ls_Return = String(tv_1.FindItem(NextTreeItem!,Integer(ls_ParamArray[2])))
				
			Case "previoustreeitem!"
				ls_Return = String(tv_1.FindItem(PreviousTreeItem!,Integer(ls_ParamArray[2])))
				
			Case "childtreeitem!"
				ls_Return = String(tv_1.FindItem(ChildTreeItem!,Integer(ls_ParamArray[2])))
				
			Case "firstvisibletreeitem!"
				ls_Return = String(tv_1.FindItem(FirstVisibleTreeItem!,Integer(ls_ParamArray[2])))
				
			Case "nextvisibletreeitem!"
				ls_Return = String(tv_1.FindItem(NextVisibleTreeItem!,Integer(ls_ParamArray[2])))
				
			Case "previousvisibletreeitem!"
				ls_Return = String(tv_1.FindItem(PreviousVisibleTreeItem!,Integer(ls_ParamArray[2])))
				
			Case "currenttreeitem!"
				ls_Return = String(tv_1.FindItem(CurrentTreeItem!,Integer(ls_ParamArray[2])))
				
			Case "drophighlighttreeitem!"
				ls_Return = String(tv_1.FindItem(DropHighlightTreeItem!,Integer(ls_ParamArray[2])))
				
			Case Else
				ls_Return = "Parameter is error."
				
		End Choose
		
	Case 'EditLabel'
		If  ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		tv_1.EditLabels = True
		ls_Return = String(tv_1.EditLabel(Integer(sle_functionparm.Text)))
		
	Case	'Hide'
		ls_Return = String(tv_1.Hide())
		
	Case 'InsertItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If li_count <> 3 And li_count <> 4 Then
			MessageBox('Warning','The parameter number should be 3 or 4.')
			Return
		ElseIf li_count = 3 Then
			If IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
				Choose Case ls_ParamArray[3]
					Case 'tv_11'
						ls_Return = String(tv_1.InsertItem(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2]),tv_11))
					Case 'tv_22'
						ls_Return = String(tv_1.InsertItem(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2]),tv_22))
				End Choose
			Else
				MessageBox('Warning','Parameter type error.')
				Return
			End If
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) And IsNumber(ls_ParamArray[4]) Then
			ls_Return = String(tv_1.InsertItem(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2]),ls_ParamArray[3],Integer(ls_ParamArray[4])))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		Case'Show'
		ls_Return = String(tv_1.Show())
		
	Case	'Move'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If   li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If  Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(tv_1.Move(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
		
	Case	'Resize'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If   li_count <> 2 Then
			MessageBox("Warning","The parameter number should be 2.")
			Return
		End If
		
		If  Not IsNumber(ls_ParamArray[1]) Or Not IsNumber(ls_ParamArray[2])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(tv_1.Resize(Integer(ls_ParamArray[1]),Integer(ls_ParamArray[2])))
		
	Case	'SetFocus'
		ls_Return = String(tv_1.SetFocus())
		
	Case 'SelectItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If  Not IsNumber(ls_ParamArray[1])   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(tv_1.SelectItem (Integer(ls_ParamArray[1])))
		
	Case 'GetItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If  Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(tv_1.GetItem(Integer(sle_functionparm.Text),tvi_ret))
		
	Case 'InsertItemFirst'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If li_count <> 3 And li_count <> 2 Then
			MessageBox('Warning','The parameter number should be 2 or 3.')
			Return
		ElseIf li_count = 2 Then
			If IsNumber(ls_ParamArray[1]) Then
				Choose Case ls_ParamArray[2]
					Case 'tv_11'
						ls_Return = String(tv_1.InsertItemFirst(Integer(ls_ParamArray[1]),tv_11))
					Case 'tv_22'
						ls_Return = String(tv_1.InsertItemFirst(Integer(ls_ParamArray[1]),tv_22))
				End Choose
			Else
				MessageBox('Warning','Parameter type error.')
				Return
			End If
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[3]) Then
			ls_Return = String(tv_1.InsertItemFirst(Integer(ls_ParamArray[1]),ls_ParamArray[2],Integer(ls_ParamArray[3])))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case 'InsertItemLast'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If li_count <> 3 And li_count <> 2 Then
			MessageBox('Warning','The parameter number should be 2 or 3.')
			Return
		ElseIf li_count = 2 Then
			If IsNumber(ls_ParamArray[1]) Then
				Choose Case ls_ParamArray[2]
					Case 'tv_11'
						ls_Return = String(tv_1.InsertItemLast(Integer(ls_ParamArray[1]),tv_11))
					Case 'tv_22'
						ls_Return = String(tv_1.InsertItemLast(Integer(ls_ParamArray[1]),tv_22))
				End Choose
			Else
				MessageBox('Warning','Parameter type error.')
				Return
			End If
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[3]) Then
			ls_Return = String(tv_1.InsertItemLast(Integer(ls_ParamArray[1]),ls_ParamArray[2],Integer(ls_ParamArray[3])))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
	Case 'InsertItemSort'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If li_count <> 3 And li_count <> 2 Then
			MessageBox('Warning','The parameter number should be 2 or 3.')
			Return
		ElseIf li_count = 2 Then
			If IsNumber(ls_ParamArray[1]) Then
				Choose Case ls_ParamArray[2]
					Case 'tv_11'
						ls_Return = String(tv_1.InsertItemSort(Integer(ls_ParamArray[1]),tv_11))
					Case 'tv_22'
						ls_Return = String(tv_1.InsertItemSort(Integer(ls_ParamArray[1]),tv_22))
				End Choose
			Else
				MessageBox('Warning','Parameter type error.')
				Return
			End If
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[3]) Then
			ls_Return = String(tv_1.InsertItemSort(Integer(ls_ParamArray[1]),ls_ParamArray[2],Integer(ls_ParamArray[3])))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
	Case 'SelectItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		If  Not IsNumber(ls_ParamArray[1])   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(tv_1.SelectItem(Integer(sle_functionparm.Text)))
		
	Case 'TypeOf'
		If tv_1.TypeOf() = treeview! Then
			ls_Return = 'TreeView!'
		Else
			ls_Return = 'Invalid'
		End If
		
	Case 'CollapseItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		If  Not IsNumber(ls_ParamArray[1])   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(tv_1.CollapseItem(Integer(sle_functionparm.Text)))
		
	Case 'ExpandAll'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If  Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(tv_1.ExpandAll(Integer(sle_functionparm.Text)))
		
	Case 'DeleteItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If  Not IsNumber(ls_ParamArray[1])   Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(tv_1.DeleteItem(Integer(sle_functionparm.Text)))
		
	Case 'ExpandItem'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please select testing data.")
			Return
		End If
		
		If  Not IsNumber(ls_ParamArray[1])  Then
			MessageBox("Warning","Parameter type error.")
			Return
		End If
		
		ls_Return = String(tv_1.ExpandItem(Integer(sle_functionparm.Text)))
		
	Case 'SetPosition'
		Choose Case ls_Param			
			Case 'ToTop!'
				ls_Return = String(tv_1.SetPosition(ToTop!))
				
			Case 'ToBottom!'
				ls_Return = String(tv_1.SetPosition(ToBottom!))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				
		End Choose
	Case 'SetRedraw'
		ls_Return = String(tv_1.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
		
	Case 'PostEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(tv_1.PostEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(tv_1.PostEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(tv_1.PostEvent(Destructor!))
				
			Case 'Getfocus!'
				ls_Return = String(tv_1.PostEvent(GetFocus!))
				
			Case 'Losefocus!'
				ls_Return = String(tv_1.PostEvent(LoseFocus!))
				
			Case 'DeleteItem!'
				ls_Return = String(tv_1.PostEvent(DeleteItem!))
				
			Case 'Help'
				ls_Return = String(tv_1.PostEvent('Help'))
				
			Case 'DoubleClicked!'
				ls_Return = String(tv_1.PostEvent(DoubleClicked!))
				
			Case 'SelectionChanged!'
				ls_Return = String(tv_1.PostEvent(SelectionChanged!))
				
			Case 'ItemCollapsed!'
				ls_Return = String(tv_1.PostEvent(ItemCollapsed!))
				
			Case 'ItemCollapsing!'
				ls_Return = String(tv_1.PostEvent(ItemCollapsing!))
				
			Case 'ItemExpanded!'
				ls_Return = String(tv_1.PostEvent(ItemExpanded!))
				
			Case 'ItemExpanding!'
				ls_Return = String(tv_1.PostEvent(ItemExpanding!))
				
			Case 'ItemPopulate!'
				ls_Return = String(tv_1.PostEvent(ItemPopulate!))
				
			Case 'RightClicked!'
				ls_Return = String(tv_1.PostEvent(RightClicked!))
				
			Case 'SelectionChanging!'
				ls_Return = String(tv_1.PostEvent(SelectionChanging!))
				
			Case 'BeginLabelEdit!'
				ls_Return = String(tv_1.PostEvent(BeginLabelEdit!))
				
			Case 'EndLabelEdit!'
				ls_Return = String(tv_1.PostEvent(EndLabelEdit!))
				
			Case 'Key!'
				ls_Return = String(tv_1.PostEvent(Key!))
				
			Case 'Sort!'
				ls_Return = String(tv_1.PostEvent(Sort!))
				
		End Choose
		
	Case 'TriggerEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(tv_1.TriggerEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(tv_1.TriggerEvent(Constructor!))
				
			Case 'Destructor!'
				ls_Return = String(tv_1.TriggerEvent(Destructor!))
				
			Case 'Getfocus!'
				ls_Return = String(tv_1.TriggerEvent(GetFocus!))
				
			Case 'Losefocus!'
				ls_Return = String(tv_1.TriggerEvent(LoseFocus!))
				
			Case 'DeleteItem!'
				ls_Return = String(tv_1.TriggerEvent(DeleteItem!))
				
			Case 'Help'
				ls_Return = String(tv_1.TriggerEvent('Help'))
				
			Case 'DoubleClicked!'
				ls_Return = String(tv_1.TriggerEvent(DoubleClicked!))
				
			Case 'SelectionChanged!'
				ls_Return = String(tv_1.TriggerEvent(SelectionChanged!))
				
			Case 'ItemCollapsed!'
				ls_Return = String(tv_1.TriggerEvent(ItemCollapsed!))
				
			Case 'ItemCollapsing!'
				ls_Return = String(tv_1.TriggerEvent(ItemCollapsing!))
				
			Case 'ItemExpanded!'
				ls_Return = String(tv_1.TriggerEvent(ItemExpanded!))
				
			Case 'ItemExpanding!'
				ls_Return = String(tv_1.TriggerEvent(ItemExpanding!))
				
			Case 'ItemPopulate!'
				ls_Return = String(tv_1.TriggerEvent(ItemPopulate!))
				
			Case 'RightClicked!'
				ls_Return = String(tv_1.TriggerEvent(RightClicked!))
				
			Case 'SelectionChanging!'
				ls_Return = String(tv_1.TriggerEvent(SelectionChanging!))
				
			Case 'BeginLabelEdit!'
				ls_Return = String(tv_1.TriggerEvent(BeginLabelEdit!))
				
			Case 'EndLabelEdit!'
				ls_Return = String(tv_1.TriggerEvent(EndLabelEdit!))
				
			Case 'Key!'
				ls_Return = String(tv_1.TriggerEvent(Key!))
				
			Case 'Sort!'
				ls_Return = String(tv_1.TriggerEvent(Sort!))
				
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
// Author: 	laihaichun		Date: 2004/01/03
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
		
	Case 'ExpandAll'
		wf_random('index',lb_functionparm)
		Return
		
	Case 'ExpandItem'
		wf_random('index',lb_functionparm)
		Return
		
	Case 'GetItem'
		wf_random('index',lb_functionparm)
		Return
		
	Case 'InsertItem'
		wf_random('index,index,string,index',lb_functionparm)
		lb_functionparm.AddItem('1,1,Cat,1')
		lb_functionparm.AddItem('1,1,Cat,1')
		lb_functionparm.AddItem('1,1,tv_11')
		lb_functionparm.AddItem('1,1,tv_22')
		lb_functionparm.AddItem('2,2,tv_11')
		lb_functionparm.AddItem('2,2,tv_22')
		Return
		
	Case 'Resize'
		wf_random('integer,integer',lb_functionparm)
		
	Case 'EditLabel'
		wf_random('index',lb_functionparm)
		Return
	Case 'DeletePicture'
		wf_random('index',lb_functionparm)
		Return
		
	Case 'DeleteStatePicture'
		wf_random('index',lb_functionparm)
		Return
		
	Case 'InsertItemFirst'
		lb_functionparm.AddItem('1,Appeon,1')
		lb_functionparm.AddItem('2,Big,1')
		lb_functionparm.AddItem('1,tv_11')
		lb_functionparm.AddItem('1,tv_22')
		lb_functionparm.AddItem('2,tv_11')
		lb_functionparm.AddItem('2,tv_22')
		Return
		
	Case 'InsertItemLast'
		lb_functionparm.AddItem('1,Appeon,1')
		lb_functionparm.AddItem('2,Big,1')
		lb_functionparm.AddItem('1,tv_11')
		lb_functionparm.AddItem('1,tv_22')
		lb_functionparm.AddItem('2,tv_11')
		lb_functionparm.AddItem('2,tv_22')
		Return
		
	Case 'InsertItemSort'
		lb_functionparm.AddItem('1,Appeon,1')
		lb_functionparm.AddItem('2,Big,1')
		lb_functionparm.AddItem('1,tv_11')
		lb_functionparm.AddItem('1,tv_22')
		lb_functionparm.AddItem('2,tv_11')
		lb_functionparm.AddItem('2,tv_22')
		Return
		
	Case 'SetItem'
		wf_random('index',lb_functionparm)
		Return
		
	Case 'DeleteItem'
		wf_random('index',lb_functionparm)
	
	Case 'SetRedraw'
		wf_random('boolean',lb_functionparm)
		
	Case 'SetPosition'		
		lb_functionparm.AddItem('ToTop!')
		lb_functionparm.AddItem('ToBottom!')
		Return
		
	Case 'AddPicture'
		lb_functionparm.AddItem('retrieve!')
		lb_functionparm.AddItem('save!')
		lb_functionparm.AddItem('print!')
		lb_functionparm.AddItem('library!')
		Return
		
	Case 'AddStatePicture'
		lb_functionparm.AddItem('retrieve.jpg')
		lb_functionparm.AddItem('save.jpg')
		lb_functionparm.AddItem('print.jpg')
		lb_functionparm.AddItem('library.jpg')
		Return
		
	Case 'CollapseItem'
		wf_random('index',lb_functionparm)
		Return
		
		Case'PostEvent'
		lb_functionparm.AddItem('Clicked!')
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('Getfocus!')
		lb_functionparm.AddItem('Losefocus!')
		lb_functionparm.AddItem('DeleteItem!')
		lb_functionparm.AddItem('DoubleClicked!')
		lb_functionparm.AddItem('SelectionChanged!')
		lb_functionparm.AddItem('ItemCollapsed!')
		lb_functionparm.AddItem('ItemCollapsing!')
		lb_functionparm.AddItem('ItemExpanded!')
		lb_functionparm.AddItem('ItemExpanding!')
		lb_functionparm.AddItem('ItemPopulate!')
		lb_functionparm.AddItem('RightClicked!')
		lb_functionparm.AddItem('SelectionChanging!')
		Return
		
		Case'TriggerEvent'
		lb_functionparm.AddItem('Clicked!')
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('Getfocus!')
		lb_functionparm.AddItem('Losefocus!')
		lb_functionparm.AddItem('DeleteItem!')
		lb_functionparm.AddItem('DoubleClicked!')
		lb_functionparm.AddItem('SelectionChanged!')
		lb_functionparm.AddItem('ItemCollapsed!')
		lb_functionparm.AddItem('ItemCollapsing!')
		lb_functionparm.AddItem('ItemExpanded!')
		lb_functionparm.AddItem('ItemExpanding!')
		lb_functionparm.AddItem('ItemPopulate!')
		lb_functionparm.AddItem('RightClicked!')
		lb_functionparm.AddItem('SelectionChanging!')
		Return
		
	Case 'FindItem'
		lb_functionparm.AddItem('CurrentTreeItem!,0')
		lb_functionparm.AddItem('RootTreeItem!,1')
		lb_functionparm.AddItem('NextTreeItem!,1')
		lb_functionparm.AddItem('ChildTreeItem!,1')
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

type cb_2 from w_standard_ancestor2`cb_2 within w_treeview_new
integer x = 2167
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_treeview_new
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

long tvi_hdl = 0,li_count
treeviewitem ltv_item
tv_1.Visible = TRUE
tv_1.Enabled = TRUE

DO UNTIL tv_1.FindItem(RootTreeItem!, 0) = -1
   tv_1.DeleteItem(tvi_hdl)
LOOP

li_count=tv_1.InsertItemLast(0,'Web Library',1)
tv_1.InsertItemLast(li_count,'Controls',2)
tv_1.InsertItemLast(li_count,'Global Function',3)
tv_1.InsertItemLast(0,'Appeon Server',2)
tv_1.InsertItemLast(0,'Appeon Developer',3)
tv_1.InsertItemLast(0,'Appeon AEM',4)
tv_1.expanditem(li_count)
tv_1.TextSize = -8	
tv_1.TextColor = Rgb(0,0,0)
tv_1.BackColor = Rgb(255,255,255)
tv_1.Italic = FALSE
tv_1.FaceName = "MS Scans Serif"
tv_1.CheckBoxes = FALSE

tv_1.Weight = 400
tv_1.borderstyle=StyleLowered!
tv_1.UnderLine = FALSE
tv_1.X=ii_x
tv_1.Y=ii_y
tv_1.Width=ii_width
tv_1.Height=ii_height
tv_1.LinesATroot=true

treeviewitem tv_item
st_tip.text="The control is TreeView."
ii_x=tv_1.X
ii_y=tv_1.Y
ii_width=tv_1.Width
ii_height=tv_1.Height

tab_1.tabpage_3.lb_out.reset()

//reset handle
ii_handle = -1
end event

type st_tip from w_standard_ancestor2`st_tip within w_treeview_new
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_treeview_new
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_treeview_new
end type

type tv_1 from treeview within w_treeview_new
integer x = 101
integer y = 120
integer width = 1573
integer height = 320
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
string picturename[] = {"BrowseClasses!","Browse!","BrowseObject!","CreateRuntime!","Continue!","Start!"}
long picturemaskcolor = 536870912
string statepicturename[] = {"BrowseClasses!","Browse!","BrowseObject!","CreateRuntime!","Continue!","Start!"}
long statepicturemaskcolor = 536870912
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
int ll_tvi
ll_tvi = this.FindItem(CurrentTreeItem! , 0)
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's Clicked Event(handle="+string(handle)+'),(CurrentTreeItem='+string(ll_tvi)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)

ii_handle = handle
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's Constructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)

end event

event deleteitem;//====================================================================
// Event: deleteitem()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvndeleteitem]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's DeleteItem Event(handle="+string(handle)+')'
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's Destructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvndoubleclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's DoubleClicked Event(handle="+string(handle)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_tvnsetfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's GetFocus Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event itemcollapsed;//====================================================================
// Event: itemcollapsed()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnitemcollapsed]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's ItemCollapsed Event(handle="+string(handle)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event itemcollapsing;//====================================================================
// Event: itemcollapsing()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnitemcollapsing]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's ItemCollapsing Event(handle="+string(handle)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event itemexpanded;//====================================================================
// Event: itemexpanded()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnitemexpanded]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's ItemExpanded Event(handle="+string(handle)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event itemexpanding;//====================================================================
// Event: itemexpanding()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnitemexpanding]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's ItemExpanding Event(handle="+string(handle)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event itempopulate;//====================================================================
// Event: itempopulate()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnitempopulate]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's ItemPopulate Event(handle="+string(handle)+')'
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
// Returns: long [pbm_tvnkeydown]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's Key Event(key="+string(key)+',keyflags='+string(keyflags)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event losefocus;//====================================================================
// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_tvnkillfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's LostFocus Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event rightclicked;//====================================================================
// Event: rightclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnrclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's RightClicked Event(handle="+string(handle)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	oldhandle		
//		long	newhandle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnselchanged]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
int ll_tvi
ll_tvi = this.FindItem(CurrentTreeItem! , 0)
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's SelectionChanged Event(oldhandle="+string(oldhandle)+',newhandle='+string(newhandle)+'),(CurrentTreeItem='+string(ll_tvi)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event selectionchanging;//====================================================================
// Event: selectionchanging()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	oldhandle		
//		long	newhandle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnselchanging]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
int ll_tvi
ll_tvi = this.FindItem(CurrentTreeItem! , 0)
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView SelectionChanging Event(oldhandle="+string(oldhandle)+',newhandle='+string(newhandle)+'),(CurrentTreeItem='+string(ll_tvi)+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event endlabeledit;//====================================================================
// Event: endlabeledit()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnitemcollapsed]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2005/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"TreeView's EndLabelEdit Event(handle="+string(handle)+'Newtext: '+newtext+')'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

