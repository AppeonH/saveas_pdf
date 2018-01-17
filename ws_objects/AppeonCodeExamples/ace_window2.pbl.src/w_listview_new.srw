$PBExportHeader$w_listview_new.srw
forward
global type w_listview_new from w_standard_ancestor2
end type
type lv_test from listview within w_listview_new
end type
end forward

global type w_listview_new from w_standard_ancestor2
string title = "ListView"
lv_test lv_test
end type
global w_listview_new w_listview_new

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

boolean B_Border,  B_DeleteItems, B_CheckBoxes, B_EditLabels, B_Enabled,   B_Italic,     B_Underline, B_Visible ;

integer I_Height, I_LargePictureHeight, I_LargePictureWidth, I_SmallPictureHeight, I_SmallPictureWidth,  I_TextSize, I_Weight, I_Width, I_X, I_Y,I_ItemPictureIndex[ ] ;

long L_BackColor, L_TextColor;

string S_FaceName, S_Item[ ], S_LargePictureName[ ], S_SmallPictureName[ ], S_StatePictureName[ ], S_Tag;
n_util	inv_util


end variables

on w_listview_new.create
int iCurrent
call super::create
this.lv_test=create lv_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lv_test
end on

on w_listview_new.destroy
call super::destroy
destroy(this.lv_test)
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

This.X = 0
This.Y = 0

lv_test.AddColumn('name',Center!,400)
lv_test.AddColumn('description',Center!,600)
lv_test.AddColumn('date',Center!,400)

lv_test.View = ListViewReport!

B_Border = lv_test.Border
B_DeleteItems = lv_test.DeleteItems
B_EditLabels = lv_test.EditLabels
B_Enabled = lv_test.Enabled
B_Italic = lv_test.Italic
B_Underline = lv_test.Underline
B_Visible = lv_test.Visible

I_Height = lv_test.Height
I_LargePictureHeight = lv_test.LargePictureHeight
I_LargePictureWidth = lv_test.LargePictureWidth
I_SmallPictureHeight = lv_test.SmallPictureHeight
I_SmallPictureWidth = lv_test.SmallPictureWidth
I_TextSize = lv_test.TextSize
I_Weight = lv_test.Weight
I_Width = lv_test.Width
I_X = lv_test.X
I_Y = lv_test.Y
I_ItemPictureIndex[ ] = lv_test.ItemPictureIndex[ ]

L_BackColor = lv_test.BackColor
L_TextColor = lv_test.TextColor

S_FaceName = lv_test.FaceName
S_Item[ ] = lv_test.Item[ ]

S_LargePictureName[ ] = lv_test.LargePictureName[ ]
S_SmallPictureName[ ] = lv_test.SmallPictureName[ ]
S_StatePictureName[ ] = lv_test.StatePictureName[ ]
S_Tag = lv_test.Tag

listviewitem l_lvi
l_lvi.PictureIndex = 2
l_lvi.Label = "Item_listview "
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//is_prop_data = "BackColor,Border,BorderStyle,CheckBoxes,DeleteItems,Enabled,FaceName,FullRowSelect,Height,Italic,Item[ ],ItemPictureIndex[ ],LargePictureHeight,LargePictureName[ ],LargePictureWidth,SmallPictureHeight,SmallPictureName[ ],SmallPictureWidth,StatePictureName[ ],Tag,TextColor,TextSize,Underline,View,Visible,Weight,Width,X,Y,lvi_Label,lvi_Data,lvi_PictureIndex,lvi_Selected,lvi_StatePictureIndex"
is_prop_data = "BackColor,Border,BorderStyle,CheckBoxes,DeleteItems,Enabled,FaceName,FullRowSelect,Height,Italic,Item[ ],ItemPictureIndex[ ],LargePictureHeight,LargePictureName[ ],LargePictureWidth,SmallPictureHeight,SmallPictureName[ ],SmallPictureWidth,StatePictureName[ ],Tag,TextColor,TextSize,Underline,View,Visible,Weight,Width,X,Y,AutoArrange,ExtendedSelect,HeaderDragDrop,SortType,lvi_Label,lvi_Data,lvi_PictureIndex,lvi_Selected,lvi_StatePictureIndex"
is_fuction_data = "AddColumn,AddItem,AddLargePicture,AddSmallPicture,AddstatePicture,ClassName,DeleteColumn,DeleteColumns,DeleteItem,DeleteItems,DeleteLargePicture,DeleteLargePictures,DeleteSmallPicture,DeleteSmallPictures,DeleteStatePicture,DeleteStatePictures,EditLabel,FindItem,GetColumn,GetItem,Hide,InsertColumn,InsertItem,Move,PostEvent,Resize,SelectedIndex,SetColumn,SetFocus,SetItem,SetRedraw,Show,TotalColumns,TotalItems,TriggerEvent,TypeOf"

st_tip.Text = "The control is ListView."


end event

type tab_1 from w_standard_ancestor2`tab_1 within w_listview_new
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

String ls_Return,ls_X,ls_Param
Integer intx,li_Count
String ls_ParamArray[]
listviewitem lv

ls_Param = Trim(sle_propparm.Text)
li_Count = wf_str2array(ls_Param,ls_ParamArray)

Choose Case lb_prop.SelectedItem()
	Case	'BackColor'
		ls_Return = String(lv_test.BackColor)
		
	Case	'Border'
		ls_Return = String(lv_test.Border)
	
	Case	'CheckBoxes'
		ls_Return = String(lv_test.CheckBoxes)
		
	Case	'BorderStyle'
		Choose Case lv_test.BorderStyle
			Case StyleBox!
				ls_Return = "StyleBox!"
				
			Case StyleLowered!
				ls_Return = "StyleLowered!"
				
			Case StyleRaised!
				ls_Return = "StyleRaised!"
				
			Case StyleShadowBox!
				ls_Return = "StyleShadowBox!"
				
		End Choose
		
	Case	'DeleteItems'
		ls_Return = String(lv_test.DeleteItems)
		
	Case	'EditLabels'
		ls_Return = String(lv_test.EditLabels)
		
	Case	'Enabled'
		ls_Return = String(lv_test.Enabled)
		
	Case	'FaceName'
		ls_Return = lv_test.FaceName
		
	Case  'FullRowSelect'
		ls_Return = String(lv_test.FullRowSelect)
		
	Case	'Height'
		ls_Return = String(lv_test.Height)
		
	Case	'Italic'
		ls_Return = String(lv_test.Italic)
		
	Case	'Item[ ]'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		
		ls_X = ls_ParamArray[1]
		
		If IsNumber(ls_X) Then
			intx = Integer(ls_X)
			li_Count = UpperBound(lv_test.Item[ ])
			
			If intx <= li_Count Then
				ls_Return = lv_test.Item[intx]
			Else
				MessageBox('Warning','The first parameter should be less than '+String(li_Count)+'.')
				Return
			End If
			
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		st_tip.Text = "The ListView's Item[" + ls_X + "]"+" property is "+lv_test.Item[intx ]+"."
		
		Return
		
	Case	'ItemPictureIndex[ ]'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		
		ls_X = ls_ParamArray[1]
		
		If IsNumber(ls_X) Then
			intx = Integer(ls_X)
			li_Count = UpperBound(lv_test.ItemPictureIndex[ ])
			If intx <= li_Count Then
				ls_Return = String(lv_test.ItemPictureIndex[intx])
			Else
				MessageBox('Warning','The first parameter should be less than '+String(li_Count)+'.')
				Return
			End If
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		st_tip.Text = "The ListView's ItemPictureIndex[" + ls_X + "]"+" property is "+ls_Return+"."
		Return
		
		
	Case	'LargePictureHeight'
		ls_Return = String(lv_test.LargePictureHeight)
		
	Case	'LargePictureName[ ]'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		
		ls_X = ls_ParamArray[1]
		
		If IsNumber(ls_X) Then
			intx = Integer(ls_X)
			li_Count = UpperBound(lv_test.LargePictureName[ ])
			If intx <= li_Count Then
				ls_Return = lv_test.LargePictureName[intx]
			Else
				MessageBox('Warning','The first parameter should be less than '+String(li_Count)+'.')
				Return
			End If
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		st_tip.Text = "The ListView's LargePictureName[" + ls_X + "]"+" property is "+ls_Return+"."
		
		Return
		
	Case	'LargePictureWidth'
		ls_Return = String(lv_test.LargePictureWidth)
		
	Case	'SmallPictureHeight'
		ls_Return = String(lv_test.SmallPictureHeight)
		
	Case	'SmallPictureName[ ]'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		
		ls_X = ls_ParamArray[1]
		
		If IsNumber(ls_X) Then
			intx = Integer(ls_X)
			li_Count = UpperBound(lv_test.SmallPictureName[ ])
			If intx <= li_Count Then
				ls_Return = lv_test.SmallPictureName[intx]
			Else
				MessageBox('Warning','The first parameter should be less than '+String(li_Count)+'.')
				Return
			End If
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		st_tip.Text = "The ListView's SmallPictureName[" + ls_X + "]"+" property is "+ls_Return+"."
		
		Return
		
	Case	'SmallPictureWidth'
		ls_Return = String(lv_test.SmallPictureWidth)
		
	Case	'StatePictureName[ ]'
		If ls_Param = '' Or IsNull(ls_Param) Then
			MessageBox("Warning","Please input test data.")
			Return
		End If
		
		ls_X = ls_ParamArray[1]
		
		If IsNumber(ls_X) Then
			intx = Integer(ls_X)
			li_Count = UpperBound(lv_test.StatePictureName[ ])
			If intx <= li_Count Then
				ls_Return = lv_test.StatePictureName[intx]
			Else
				MessageBox('Warning','The first parameter should be less than '+String(li_Count)+'.')
				Return
			End If
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		st_tip.Text = "The ListView's StatePictureName[" + ls_X + "]"+" property is "+ls_Return+"."
		
		Return
		
	Case	'Tag'
		ls_Return = lv_test.Tag
		
	Case	'TextColor'
		ls_Return = String(lv_test.TextColor)
		
	Case	'TextSize'
		ls_Return = String(lv_test.TextSize)
		
	Case	'Underline'
		ls_Return = String(lv_test.Underline)
		
	Case	'View'
		Choose Case lv_test.View
			Case ListViewLargeIcon!
				ls_Return = "ListViewLargeIcon!"
				
			Case ListViewSmallIcon!
				ls_Return = "ListViewSmallIcon!"
				
			Case ListViewList!
				ls_Return = "ListViewList!"
				
			Case ListViewReport!
				ls_Return = "ListViewReport!"
				
		End Choose
		
	Case	'Visible'
		ls_Return = String(lv_test.Visible)
		
	Case	'Weight'
		ls_Return = String(lv_test.Weight)
		
	Case	'Width'
		ls_Return = String(lv_test.Width)
		
	Case	'X'
		ls_Return = String(lv_test.X)
		
	Case	'Y'
		ls_Return = String(lv_test.Y)
		
	Case	'lvi_Data'
		If IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			lv_test.GetItem(intx,lv)
			ls_Return = String(lv.Data)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		st_tip.Text = "The ListViewitem's "+ls_ParamArray[1]+" Data property is "+ls_Return+"."
		
		Return
		
	Case	'lvi_Label'
		If IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			lv_test.GetItem(intx,lv)
			ls_Return = String(lv.Label)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		st_tip.Text = "The ListViewitem's "+ls_ParamArray[1]+" Label property is "+ls_Return+"."
		
		Return
		
	Case	'lvi_PictureIndex'
		If IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			lv_test.GetItem(intx,lv)
			ls_Return = String(lv.PictureIndex)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		st_tip.Text = "The ListViewitem's "+ls_ParamArray[1]+" PictureIndex property is "+ls_Return+"."
		
		Return
		
	Case	'lvi_Selected'
		If IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			lv_test.GetItem(intx,lv)
			ls_Return = String(lv.Selected)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		st_tip.Text = "The ListViewitem's "+ls_ParamArray[1]+" Selected property is "+ls_Return+"."
		
		Return
		
	Case	'lvi_StatePictureIndex'
		If IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			lv_test.GetItem(intx,lv)
			ls_Return = String(lv.StatePictureIndex)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		st_tip.Text = "The ListViewitem's "+ls_ParamArray[1]+" StatePictureIndex property is "+ls_Return+"."
		
		Return
	Case	'AutoArrange'
		ls_Return = String(lv_test.AutoArrange)
	Case	'ExtendedSelect'
		ls_Return = String(lv_test.ExtendedSelect)
	Case	'HeaderDragDrop'
		ls_Return = String(lv_test.HeaderDragDrop)
	Case	'SortType'
		Choose Case lv_test.SortType
			Case Ascending!
				ls_Return = "Ascending!"
				
			Case Descending!
				ls_Return = "Descending!"
				
			Case UserDefinedSort!
				ls_Return = "UserDefined!"
				
			Case UnSorted!
				ls_Return = "UnSorted!"
				
		End Choose
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The ListView's "+lb_prop.SelectedItem ( )+" property is "+ls_Return+"."


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

Integer i,count
Integer intx,inty,li_ParaNum
String strx,ls_ParamArray[],ls_Return
Boolean boolx
listviewitem lv

li_ParaNum = wf_str2array(ls_Param,ls_ParamArray)

Choose Case lb_prop.SelectedItem()
	Case	'BackColor'
		If IsNumber(ls_Param) Then
			lv_test.BackColor = Long(ls_Param)
			lv_test.Enabled = False
			lv_test.Enabled = True
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.BackColor)
		
	Case	'Border'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.Border = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.Border)
		
	Case	'BorderStyle'
		lv_test.Border = True
		Choose Case ls_Param
			Case "StyleBox!"
				lv_test.BorderStyle = StyleBox!
				
			Case "StyleLowered!"
				lv_test.BorderStyle = StyleLowered!
				
			Case "StyleRaised!"
				lv_test.BorderStyle = StyleRaised!
				
			Case "StyleShadowBox!"
				lv_test.BorderStyle = StyleShadowBox!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		ls_Return = ls_Param
	Case	'CheckBoxes'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.CheckBoxes = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.CheckBoxes)
	Case	'DeleteItems'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.DeleteItems = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.DeleteItems)
		
	Case	'EditLabels'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.EditLabels = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.EditLabels)
		
	Case	'Enabled'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.Enabled)
		
	Case	'FaceName'
		lv_test.FaceName = ls_Param
		ls_Return = lv_test.FaceName
		
	Case	'Height'
		If IsNumber(ls_Param) Then
			lv_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.Height)
		
	Case	'Italic'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.Italic = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.Italic)
		
	Case 'FullRowSelect'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.FullRowSelect = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		ls_Return = String(lv_test.FullRowSelect)
		
	Case	'Item[ ]'
		count = UpperBound(lv_test.Item[ ])
		
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			strx = String(ls_ParamArray[2])
			If intx <= count Then
				lv_test.Item[intx] = strx
			Else
				MessageBox('Warning','The first parameter should be less than '+String(count)+'.')
				Return
			End If
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.Item[intx])
		st_tip.Text = "The ListView's "+"Item[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Return+"."
		
		Return
		
	Case	'ItemPictureIndex[ ]'
		count = UpperBound(lv_test.ItemPictureIndex[ ])
		
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			If intx <= count Then
				lv_test.ItemPictureIndex[intx] = inty
			Else
				MessageBox('Warning','The first parameter should be less than '+String(count)+'.')
				Return
			End If
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.ItemPictureIndex[intx])
		st_tip.Text = "The ListView's "+"ItemPictureIndex[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Return+"."
		
		Return
		
	Case	'LargePictureHeight'
		If IsNumber(ls_Param) Then
			lv_test.LargePictureHeight = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.LargePictureHeight)
		
	Case	'LargePictureName[ ]'
		count = UpperBound(lv_test.LargePictureName[ ])
		
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			strx = String(ls_ParamArray[2])
			If intx <= count Then
				lv_test.LargePictureName[intx] = strx
			Else
				MessageBox('Warning','The first parameter should be less than '+String(count)+'.')
				Return
			End If
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.LargePictureName[intx])
		st_tip.Text = "The ListView's "+"LargePictureName[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Return+"."
		
		Return
		
	Case	'LargePictureWidth'
		If IsNumber(ls_Param) Then
			lv_test.LargePictureWidth = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.LargePictureWidth)
		
	Case	'SmallPictureHeight'
		If IsNumber(ls_Param) Then
			lv_test.SmallPictureHeight = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.SmallPictureHeight)
		
	Case	'SmallPictureName[ ]'
		count = UpperBound(lv_test.SmallPictureName[ ])
		
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			strx = String(ls_ParamArray[2])
			If intx <= count Then
				lv_test.SmallPictureName[intx] = strx
			Else
				MessageBox('Warning','The first parameter should be less than '+String(count)+'.')
				Return
			End If
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.SmallPictureName[intx])
		st_tip.Text = "The ListView's "+"SmallPictureName[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Return+"."
		
		Return
		
	Case	'SmallPictureWidth'
		If IsNumber(ls_Param) Then
			lv_test.SmallPictureWidth = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.SmallPictureWidth)
		
	Case	'StatePictureName[ ]'
		count = UpperBound(lv_test.StatePictureName[ ])
		
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			strx = String(ls_ParamArray[2])
			If intx <= count Then
				lv_test.StatePictureName[intx] = strx
			Else
				MessageBox('Warning','The first parameter should less than '+String(count)+'.')
				Return
			End If
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.StatePictureName[intx])
		st_tip.Text = "The ListView's "+"StatePictureName[" + ls_ParamArray[1] + "]"+" property is set to "+ls_Return+"."
		
		Return
		
	Case	'Tag'
		lv_test.Tag = ls_Param
		ls_Return = lv_test.Tag
		
	Case	'TextColor'
		If IsNumber(ls_Param) Then
			lv_test.TextColor = Long(ls_Param)
			lv_test.Enabled = False
			lv_test.Enabled = True
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.TextColor)
		
	Case	'TextSize'
		If IsNumber(ls_Param) Then
			lv_test.TextSize = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.TextSize)
		
	Case	'Underline'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.Underline = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.Underline)
		
	Case	'View'
		Choose Case ls_Param
			Case "ListViewLargeIcon!"
				lv_test.View = ListViewLargeIcon!
				
			Case "ListViewSmallIcon!"
				lv_test.View = ListViewSmallIcon!
				
			Case "ListViewList!"
				lv_test.View = ListViewList!
				
			Case "ListViewReport!"
				lv_test.View = ListViewReport!
				
			Case Else
				MessageBox('Warning','Parameter error.')				
				Return				
		End Choose
		
		Choose Case lv_test.View
			Case ListViewLargeIcon!
				ls_Return = "ListViewLargeIcon!"				
			Case ListViewSmallIcon!
				ls_Return = "ListViewSmallIcon!"				
			Case ListViewList!
				ls_Return = "ListViewList!"				
			Case ListViewReport!
				ls_Return = "ListViewReport!"
		End Choose
		
	Case	'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.Visible)
		
	Case	'Weight'
		If IsNumber(ls_Param) Then
			lv_test.Weight = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.Weight)
		
	Case	'Width'
		If IsNumber(ls_Param) Then
			lv_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.Width)
		
	Case	'X'
		If IsNumber(ls_Param) Then
			lv_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.X)
		
	Case	'Y'
		If IsNumber(ls_Param) Then
			lv_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.Y)
		
	Case	'lvi_Data'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			strx = String(ls_ParamArray[2])
			lv_test.GetItem(intx,lv)
			lv.Data = strx
			lv_test.SetItem(intx, lv)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = ls_ParamArray[2]
		st_tip.Text = "The ListViewitem's "+ls_ParamArray[1]+" Data property is set to "+ls_Return+"."
		
		Return
		
	Case	'lvi_Label'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			strx = String(ls_ParamArray[2])
			lv_test.GetItem(intx,lv)
			lv.Label = strx
			lv_test.SetItem(intx, lv)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = ls_ParamArray[2]
		st_tip.Text = "The ListViewitem's "+ls_ParamArray[1]+" Label property is set to "+ls_Return+"."
		
		Return
		
	Case	'lvi_PictureIndex'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And  IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			lv_test.GetItem(intx,lv)
			lv.PictureIndex = inty
			lv_test.SetItem(intx, lv)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = ls_ParamArray[2]
		st_tip.Text = "The ListViewitem's "+ls_ParamArray[1] +" PictureIndex property is set to "+ls_Return+"."
		
		Return
		
	Case	'lvi_Selected'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1])  Then
			intx = Integer(ls_ParamArray[1])
			boolx = inv_util.of_string_to_boolean(ls_ParamArray[2])
			lv_test.GetItem(intx,lv)
			lv.Selected = boolx
			lv_test.SetItem(intx, lv)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = ls_ParamArray[2]
		st_tip.Text = "The ListViewitem's "+ ls_ParamArray[1]+" Selected property is set to "+ls_Return+"."
		
		Return
		
	Case	'lvi_StatePictureIndex'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And  IsNumber(ls_ParamArray[2])  Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			lv_test.GetItem(intx,lv)
			lv.StatePictureIndex = inty
			lv_test.SetItem(intx, lv)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = ls_ParamArray[2]
		st_tip.Text = "The ListViewitem's "+ls_ParamArray[1] + " StatePictureIndex property is set to "+ls_Return+"."
		
		Return
	Case	'AutoArrange'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.AutoArrange = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.AutoArrange)
	Case	'ExtendedSelect'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.ExtendedSelect = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.ExtendedSelect)
	Case	'HeaderDragDrop'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			lv_test.HeaderDragDrop = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(lv_test.HeaderDragDrop)
	Case	'SortType'
		Choose Case ls_Param
			Case "Ascending!"
				lv_test.SortType = Ascending!
				
			Case "Descending!"
				lv_test.SortType = Descending!
				
			Case "UserDefined!"
				lv_test.SortType = UserDefinedSort!
				
			Case "UnSorted!"
				lv_test.SortType = Unsorted!
				
			Case Else
				MessageBox('Warning','Parameter error.')				
				Return				
		End Choose
		
		Choose Case lv_test.SortType
			Case Ascending!
				ls_Return = "Ascending!"				
			Case Descending!
				ls_Return = "Descending!"				
			Case UserDefinedSort!
				ls_Return = "UserDefined!"				
			Case Unsorted!
				ls_Return = "Unsorted!"
		End Choose	
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The ListView's "+lb_prop.SelectedItem ()+" property is set to "+ls_Return+"."

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
// Author: 	zhouchaoqun		Date: 2006/05/08
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_propparm.Reset()
sle_propparm.Text = ''

Integer i

Choose Case lb_prop.SelectedItem()
	Case	'BackColor'
		wf_random("Color",lb_propparm)
		
	Case	'Border'
		wf_random("Boolean",lb_propparm)
	Case  'CheckBoxes'
		wf_random("Boolean",lb_propparm)
	Case	'BorderStyle'
		lb_propparm.AddItem("StyleBox!")
		lb_propparm.AddItem("StyleLowered!")
		lb_propparm.AddItem("StyleRaised!")
		//lb_propparm.AddItem("StyleShadowBox!")
		Return
		
	Case	'DeleteItems'
		wf_random("Boolean",lb_propparm)
		
	Case	'ExtendedSelect'
		wf_random("Boolean",lb_propparm)
		
	Case	'EditLabels'
		wf_random("Boolean",lb_propparm)
		
	Case	'Enabled'
		wf_random("Boolean",lb_propparm)
		
	Case	'FaceName'
		wf_random("Font",lb_propparm)
		Return
		
	Case	'FullRowSelect'
		wf_random("Boolean",lb_propparm)
		
	Case	'GridLines'
		wf_random("Boolean",lb_propparm)
		
	Case	'Height'
		wf_random("Integer",lb_propparm)
		
	Case	'Italic'
		wf_random("Boolean",lb_propparm)
		
	Case	'Item[ ]'
		wf_random("index,string",lb_propparm)
		
	Case	'ItemPictureIndex[ ]'
		//wf_random("index",lb_propparm)
		lb_propparm.AddItem("1,3")
		lb_propparm.AddItem("2,6")
		lb_propparm.AddItem("4,5")
		lb_propparm.AddItem("6,3")
		lb_propparm.AddItem("5,2")
		Return
		
	Case	'LargePictureHeight'
		lb_propparm.AddItem("10")
		lb_propparm.AddItem("20")
		lb_propparm.AddItem("30")
		lb_propparm.AddItem("50")
		lb_propparm.AddItem("80")
		Return
		
	Case	'LargePictureName[ ]'
		//sle_propparm.Text = "1"
		lb_propparm.AddItem("1,largpn1")
		lb_propparm.AddItem("2,largpn2")
		lb_propparm.AddItem("3,largpn3")
		lb_propparm.AddItem("5,largpn5")
		lb_propparm.AddItem("8,largpn8")
		Return
		
	Case	'LargePictureWidth'
		lb_propparm.AddItem("10")
		lb_propparm.AddItem("20")
		lb_propparm.AddItem("30")
		lb_propparm.AddItem("50")
		lb_propparm.AddItem("80")
		Return
		
	Case	'OneClickActivate'
		wf_random("Boolean",lb_propparm)
		
	Case	'Scrolling'
		wf_random("Boolean",lb_propparm)
		
	Case	'ShowHeader'
		wf_random("Boolean",lb_propparm)
		
	Case	'SmallPictureHeight'
		lb_propparm.AddItem("10")
		lb_propparm.AddItem("20")
		lb_propparm.AddItem("5")
		lb_propparm.AddItem("30")
		Return
		
	Case	'SmallPictureName[ ]'
		//sle_propparm.Text = "1"
		lb_propparm.AddItem("1,smallpn1")
		lb_propparm.AddItem("2,smallpn2")
		lb_propparm.AddItem("3,smallpn3")
		lb_propparm.AddItem("5,smallpn5")
		lb_propparm.AddItem("8,smallpn8")
		Return
		
	Case	'SmallPictureWidth'
		lb_propparm.AddItem("10")
		lb_propparm.AddItem("20")
		lb_propparm.AddItem("5")
		lb_propparm.AddItem("30")
		Return
		
	Case	'StatePictureName[ ]'
		//sle_propparm.Text = "1"
		lb_propparm.AddItem("1,Statepn1")
		lb_propparm.AddItem("2,Statepn2")
		lb_propparm.AddItem("3,Statepn3")
		lb_propparm.AddItem("5,Statepn5")
		lb_propparm.AddItem("8,Statepn8")
		Return
		
	Case	'Tag'
		wf_random("String",lb_propparm)
		
	Case	'TextColor'
		wf_random("Color",lb_propparm)
		
	Case	'TextSize'
		wf_random('TSize',lb_propparm)
		Return
		
	Case	'TwoClickActivate'
		wf_random("Boolean",lb_propparm)
		
	Case	'Underline'
		wf_random("Boolean",lb_propparm)
		
	Case	'View'
		lb_propparm.AddItem("ListViewLargeIcon!")
		lb_propparm.AddItem("ListViewSmallIcon!")
		lb_propparm.AddItem("ListViewList!")
		lb_propparm.AddItem("ListViewReport!")
		Return
		
	Case	'Visible'
		wf_random("Boolean",lb_propparm)
		
	Case	'Weight'
		lb_propparm.AddItem("400")
		lb_propparm.AddItem("700")
		Return
		
	Case	'Width'
		wf_random("Integer",lb_propparm)
		
	Case	'X'
		wf_random("Integer",lb_propparm)
		
	Case	'Y'
		wf_random("Integer",lb_propparm)
		
	Case	'lvi_Data'
		lb_propparm.AddItem("1,lvi_data1")
		lb_propparm.AddItem("2,lvi_data2")
		lb_propparm.AddItem("3,lvi_data3")
		lb_propparm.selectitem(1)
		lb_propparm.event selectionchanged(1)
		Return
		
	Case	'lvi_Label'
		lb_propparm.AddItem("1,lvi_label1")
		lb_propparm.AddItem("2,lvi_label2")
		lb_propparm.AddItem("3,lvi_label3")
		lb_propparm.selectitem(1)
		lb_propparm.event selectionchanged(1)
		Return
		
	Case	'lvi_PictureIndex'
		lb_propparm.AddItem("1,6")
		lb_propparm.AddItem("2,8")
		lb_propparm.AddItem("3,2")
		lb_propparm.selectitem(1)
		lb_propparm.event selectionchanged(1)
		Return
		
	Case	'lvi_Selected'
		lb_propparm.AddItem("1,true")
		lb_propparm.AddItem("2,true")
		lb_propparm.AddItem("1,false")
		lb_propparm.AddItem("2,false")
		lb_propparm.AddItem("3,true")
		lb_propparm.selectitem(1)
		lb_propparm.event selectionchanged(1)
		Return
		
	Case	'lvi_StatePictureIndex'
		lb_propparm.AddItem("1,6")
		lb_propparm.AddItem("2,8")
		lb_propparm.AddItem("3,2")
		lb_propparm.selectitem(1)
		lb_propparm.event selectionchanged(1)
		Return
	Case	'AutoArrange','ExtendedSelect','HeaderDragDrop'
		wf_random("Boolean",lb_propparm)
		Return
	Case	'SortType'
		lb_propparm.AddItem("Ascending!")
		lb_propparm.AddItem("Descending!")
		lb_propparm.AddItem("UserDefined!")
		lb_propparm.AddItem("UnSorted!")
		Return
		
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

String ls_Param,ls_Return,ls_label
Int li_width,li_rtn
Alignment la_align

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
String strx,stry,strz,stra,strb
Long longx,longy
Boolean boolx,booly,boola,boolb
String ls_ParamArray[]
Alignment  alignment1
listviewitem lv1 ,lv2,lv

li_ParaNum = wf_str2array(ls_Param,ls_ParamArray)
lv1.PictureIndex = 2
lv1.Label = "item1"
lv2.PictureIndex = 3
lv2.Label = "item2"

Choose Case lb_function.SelectedItem()
	Case	'AddColumn'
		If li_ParaNum <> 3 Then
			MessageBox('Warning','The parameter number should be 3.')
			Return
		ElseIf IsNumber(ls_ParamArray[3]) Then
			strx = String(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[3])
			stry = String(ls_ParamArray[2])
			Choose Case stry
				Case 'Center!'
					ls_Return = String(lv_test.AddColumn(strx,Center!,inty))
					
				Case 'Justify!'
					ls_Return = String(lv_test.AddColumn(strx,Justify!,inty))
					
				Case 'Left!'
					ls_Return = String(lv_test.AddColumn(strx,Left!,inty))
					
				Case 'Right!'
					ls_Return = String(lv_test.AddColumn(strx,Right!,inty))
					
				Case Else
					MessageBox('Warning','Parameter error.')
					Return
					
			End Choose
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'AddItem'
		If li_ParaNum <> 2  And li_ParaNum <> 1 Then
			MessageBox('Warning','The parameter number should be 1 or 2.')
			Return
		ElseIf  li_ParaNum = 1 Then
			Choose Case ls_ParamArray[1]
				Case 'lv1'
					ls_Return = String(lv_test.AddItem(lv1))
					
				Case 'lv2'
					ls_Return = String(lv_test.AddItem(lv2))
					
			End Choose
		ElseIf IsNumber(ls_ParamArray[2])  Then
			strx = String(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(lv_test.AddItem(strx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'AddLargePicture'
		ls_Return = String(lv_test.AddLargePicture(ls_Param))
		
	Case	'AddSmallPicture'
		ls_Return = String(lv_test.AddSmallPicture(ls_Param))
		
	Case	'AddstatePicture'
		ls_Return = String(lv_test.AddstatePicture(ls_Param))
		
	Case	'ClassName'
		ls_Return = String(lv_test.ClassName( ))
		
	Case	'DeleteColumn'
		If li_ParaNum <> 1 Then
			MessageBox('Warning','The parameter number should be 1.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) Then
			intx = Integer(ls_ParamArray[1])
			ls_Return = String(lv_test.DeleteColumn(intx))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'DeleteColumns'
		ls_Return = String(lv_test.DeleteColumns( ))
		
	Case	'DeleteItem'
		If li_ParaNum <> 1 Then
			MessageBox('Warning','The parameter number should be 1.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) Then
			intx = Integer(ls_ParamArray[1])
			ls_Return = String(lv_test.DeleteItem(intx))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'DeleteItems'
		ls_Return = String(lv_test.DeleteItems( ))
		
	Case	'DeleteLargePicture'
		If li_ParaNum <> 1 Then
			MessageBox('Warning','The parameter number should be 1.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) Then
			intx = Integer(ls_ParamArray[1])
			ls_Return = String(lv_test.DeleteLargePicture(intx))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'DeleteLargePictures'
		ls_Return = String(lv_test.DeleteLargePictures( ))
		
	Case	'DeleteSmallPicture'
		If li_ParaNum <> 1 Then
			MessageBox('Warning','The parameter number should be 1.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) Then
			intx = Integer(ls_ParamArray[1])
			ls_Return = String(lv_test.DeleteSmallPicture(intx))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'DeleteSmallPictures'
		ls_Return = String(lv_test.DeleteSmallPictures( ))
		
	Case	'DeleteStatePicture'
		If li_ParaNum <> 1 Then
			MessageBox('Warning','The parameter number should be 1.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) Then
			intx = Integer(ls_ParamArray[1])
			ls_Return = String(lv_test.DeleteStatePicture(intx))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'DeleteStatePictures'
		ls_Return = String(lv_test.DeleteStatePictures( ))
		
	Case	'EditLabel'
		If li_ParaNum <> 1 Then
			MessageBox('Warning','The parameter number should be 1.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) Then
			lv_test.EditLabels = True
			intx = Integer(ls_Param)
			ls_Return = String(lv_test.EditLabel(intx))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'FindItem'
		If li_ParaNum <> 4 Then
			MessageBox('Warning','The parameter number should be 4.')
			Return
//		ElseIf li_ParaNum = 6 Then
//			If IsNumber(ls_ParamArray[1]) And (Lower(ls_ParamArray[3]) = 'true' Or Lower(ls_ParamArray[3]) = 'false') And (Lower(ls_ParamArray[4]) = 'true' Or Lower(ls_ParamArray[4]) = 'false') And (Lower(ls_ParamArray[5]) = 'true' Or Lower(ls_ParamArray[5]) = 'false')And (Lower(ls_ParamArray[6]) = 'true' Or Lower(ls_ParamArray[6]) = 'false') Then
//				intx = Integer(ls_ParamArray[1])
//				strx = String(ls_ParamArray[2])
//				stry = String(ls_ParamArray[3])
//				strz = String(ls_ParamArray[4])
//				stra = String(ls_ParamArray[5])
//				strb = String(ls_ParamArray[6])
//				boolx = inv_util.of_string_to_boolean(stry)
//				booly = inv_util.of_string_to_boolean(strz)
//				boola = inv_util.of_string_to_boolean(stra)
//				boolb = inv_util.of_string_to_boolean(strb)
//				Choose Case ls_ParamArray[2]
//					Case 'DirectionAll!'
//						ls_Return = String(lv_test.FindItem(intx,DirectionAll!,boolx,booly,boola,boolb))
//						
//					Case 'DirectionUp!'
//						ls_Return = String(lv_test.FindItem(intx,DirectionAll!,boolx,booly,boola,boolb))
//						
//					Case 'DirectionDown!'
//						ls_Return = String(lv_test.FindItem(intx,DirectionAll!,boolx,booly,boola,boolb))
//						
//					Case 'DirectionLeft!'
//						ls_Return = String(lv_test.FindItem(intx,DirectionAll!,boolx,booly,boola,boolb))
//						
//					Case 'DirectionRight!'
//						ls_Return = String(lv_test.FindItem(intx,DirectionAll!,boolx,booly,boola,boolb))
//						
//					Case Else
//						MessageBox('Warning','Parameter type error.')
//						Return
//						
//				End Choose
//			Else
//				MessageBox('Warning','Parameter type error.')
//				Return
//			End If
		ElseIf IsNumber(ls_ParamArray[1]) And (Lower(ls_ParamArray[3]) = 'true' Or Lower(ls_ParamArray[3]) = 'false') And (Lower(ls_ParamArray[4]) = 'true' Or Lower(ls_ParamArray[4]) = 'false')  Then
			intx = Integer(ls_ParamArray[1])
			strx = String(ls_ParamArray[2])
			stry = String(ls_ParamArray[3])
			strz = String(ls_ParamArray[4])
			boolx = inv_util.of_string_to_boolean(stry)
			booly = inv_util.of_string_to_boolean(strz)
			ls_Return = String(lv_test.FindItem(intx,strx,boolx,booly))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case 'GetColumn'
		If li_ParaNum <> 1 Then
			MessageBox('Warning','The parameter number should be 1.')
			Return
		End If
		
		li_rtn = lv_test.GetColumn(Integer(ls_ParamArray[1]),ls_label,la_align,li_width)
		
		If li_rtn = 1 Then
			ls_Return = "'Label :"+ls_label+" Width :"+String(li_width)+"'"
		Else
			ls_Return = "'execute failed!'"
		End If
		
	Case	'GetItem'
		If li_ParaNum <> 3 And li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 3.')
			Return
		ElseIf li_ParaNum = 2 Then
			If IsNumber(ls_ParamArray[1]) Then
				intx = Integer(ls_ParamArray[1])
				Choose Case ls_ParamArray[2]
					Case 'lv1'
						ls_Return = String(lv_test.GetItem(intx,lv1))
					Case 'lv2'
						ls_Return = String(lv_test.GetItem(intx,lv2))
				End Choose
			Else
				MessageBox('Warning','Parameter type error.')
				Return
			End If
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			strx = String(ls_ParamArray[3])
			Choose Case ls_ParamArray[3]
				Case 'lv1'
					ls_Return = String(lv_test.GetItem(intx,inty,lv1))
					
				Case 'lv2'
					ls_Return = String(lv_test.GetItem(intx,inty,lv2))
					
				Case Else
					ls_Return = String(lv_test.GetItem(intx,inty,strx))
					
			End Choose
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'Hide'
		ls_Return = String(lv_test.Hide( ))
		
	Case	'InsertColumn'
		If li_ParaNum <> 4 Then
			MessageBox('Warning','The parameter number should be 4.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[4]) Then
			intx = Integer(ls_ParamArray[1])
			strx = String(ls_ParamArray[2])
			inty = Integer(ls_ParamArray[4])
			stry = String(ls_ParamArray[3])
			Choose Case stry
				Case 'Center!'
					ls_Return = String(lv_test.InsertColumn(intx,strx,Center!,inty))
					
				Case 'Justify!'
					ls_Return = String(lv_test.InsertColumn(intx,strx,Justify!,inty))
					
				Case 'Left!'
					ls_Return = String(lv_test.InsertColumn(intx,strx,Left!,inty))
					
				Case 'Right!'
					ls_Return = String(lv_test.InsertColumn(intx,strx,Right!,inty))
					
				Case Else
					MessageBox('Warning','Parameter error.')
					Return
					
			End Choose
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'InsertItem'
		If li_ParaNum <> 3 And li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 3 or 2.')
			Return
		ElseIf li_ParaNum = 2 Then
			If IsNumber(ls_ParamArray[1]) Then
				intx = Integer(ls_ParamArray[1])
				Choose Case ls_ParamArray[2]
					Case 'lv1'
						ls_Return = String(lv_test.InsertItem(intx,lv1))
						
					Case 'lv2'
						ls_Return = String(lv_test.InsertItem(intx,lv2))
						
				End Choose
			Else
				MessageBox('Warning','Parameter type error.')
				Return
			End If
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[3]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[3])
			strx = String(ls_ParamArray[2])
			ls_Return = String(lv_test.InsertItem(intx,strx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(lv_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'PostEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(lv_test.PostEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(lv_test.PostEvent(Constructor!))
				
			Case 'DeleteAllItems!'
				ls_Return = String(lv_test.PostEvent(DeleteAllItems!))
				
			Case 'DeleteItem!'
				ls_Return = String(lv_test.PostEvent(DeleteItem!))
				
			Case 'DoubleClicked!'
				ls_Return = String(lv_test.PostEvent(DoubleClicked!))
				
			Case 'Destructor!'
				ls_Return = String(lv_test.PostEvent(Destructor!))
				
			Case 'GetFocus!'
				ls_Return = String(lv_test.PostEvent(GetFocus!))
				
			Case 'InsertItem!'
				ls_Return = String(lv_test.PostEvent(InsertItem!))
				
			Case 'ItemChanged!'
				ls_Return = String(lv_test.PostEvent(ItemChanged!))
				
			Case 'ItemChanging!'
				ls_Return = String(lv_test.PostEvent(ItemChanging!))
				
			Case 'LoseFocus!'
				ls_Return = String(lv_test.PostEvent(LoseFocus!))
				
			Case 'RightClicked!'
				ls_Return = String(lv_test.PostEvent(RightClicked!))
				
			Case 'ColumnClick!'
				ls_Return = String(lv_test.PostEvent(ColumnClick!))
				
			Case 'ItemActivate!'
				ls_Return = String(lv_test.PostEvent("ItemActivate"))
				
			Case 'Key!'
				ls_Return = String(lv_test.PostEvent(Key!))
				
			Case 'Sort!'
				ls_Return = String(lv_test.PostEvent(Sort!))
				
			Case 'Help'
				ls_Return = String(lv_test.PostEvent("Help"))
				
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
			ls_Return = String(lv_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'SelectedIndex'
		ls_Return = String(lv_test.SelectedIndex( ))
		
	Case	'SetColumn'
		If li_ParaNum <> 4 Then
			MessageBox('Warning','The parameter number should be 4.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[4]) Then
			intx = Integer(ls_ParamArray[1])
			strx = String(ls_ParamArray[2])
			inty = Integer(ls_ParamArray[4])
			stry = String(ls_ParamArray[3])
			Choose Case stry
				Case 'Center!'
					ls_Return = String(lv_test.SetColumn(intx,strx,Center!,inty))
					
				Case 'Justify!'
					ls_Return = String(lv_test.SetColumn(intx,strx,Justify!,inty))
					
				Case 'Left!'
					ls_Return = String(lv_test.SetColumn(intx,strx,Left!,inty))
					
				Case 'Right!'
					ls_Return = String(lv_test.SetColumn(intx,strx,Right!,inty))
					
				Case Else
					MessageBox('Warning','Parameter error.')
					Return
					
			End Choose
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		
	Case	'SetFocus'
		ls_Return = String(lv_test.SetFocus( ))
		
	Case	'SetItem'
		If li_ParaNum <> 3 And li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 3 or 2.')
			Return
		ElseIf li_ParaNum = 2 Then
			If IsNumber(ls_ParamArray[1]) Then
				intx = Integer(ls_ParamArray[1])
				Choose Case ls_ParamArray[2]
					Case 'lv1'
						ls_Return = String(lv_test.SetItem(intx,lv1))
						
					Case 'lv2'
						ls_Return = String(lv_test.SetItem(intx,lv2))
						
				End Choose
			Else
				MessageBox('Warning','Parameter type error.')
				Return
			End If
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			strx = String(ls_ParamArray[3])
			Choose Case ls_ParamArray[3]
				Case 'lv1'
					ls_Return = String(lv_test.SetItem(intx,inty,lv1))
					
				Case 'lv2'
					ls_Return = String(lv_test.SetItem(intx,inty,lv2))
					
				Case Else
					ls_Return = String(lv_test.SetItem(intx,inty,strx))
					
			End Choose
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'SetPosition'
		Choose Case ls_Param				
			Case 'ToTop!'
				ls_Return = String(lv_test.SetPosition(ToTop!))
				ls_Return = String(lv_test.SetPosition(ToBottom!))
				
			Case Else
				MessageBox('Warning','Parameter type error.')
				Return
		End Choose
	Case 'SetRedraw'
		ls_Return = String(lv_test.SetRedraw(inv_util.of_string_to_boolean(ls_Param)))
		
	Case	'Show'
		ls_Return = String(lv_test.Show( ))
		
	Case	'Sort'
		If li_ParaNum <> 1 And li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 3 or 2.')
			Return
		ElseIf li_ParaNum = 1 Then
			stry = String(ls_ParamArray[1])
			Choose Case stry
				Case 'Ascending!'
					ls_Return = String(lv_test.Sort(Ascending!))
					
				Case 'Descending!'
					ls_Return = String(lv_test.Sort(Descending!))
					
				Case 'Unsorted!'
					ls_Return = String(lv_test.Sort(Unsorted!))
					
				Case Else
					MessageBox('Warning','Parameter type error.')
					Return
					
			End Choose
		ElseIf IsNumber(ls_ParamArray[2]) Then
			stry = String(ls_ParamArray[1])
			intx = Integer(ls_ParamArray[2])
			Choose Case stry
				Case 'Ascending!'
					ls_Return = String(lv_test.Sort(Ascending!,intx))
					
				Case 'Descending!'
					ls_Return = String(lv_test.Sort(Descending!,intx))
					
				Case 'Unsorted!'
					ls_Return = String(lv_test.Sort(Unsorted!,intx))
					
				Case Else
					MessageBox('Warning','Parameter type error.')
					Return
					
			End Choose
			
		End If
		
	Case	'TotalColumns'
		ls_Return = String(lv_test.TotalColumns( ))
		
	Case	'TotalItems'
		ls_Return = String(lv_test.TotalItems( ))
		
	Case	'TriggerEvent'
		Choose Case ls_Param
			Case 'Clicked!'
				ls_Return = String(lv_test.TriggerEvent(Clicked!))
				
			Case 'Constructor!'
				ls_Return = String(lv_test.TriggerEvent(Constructor!))
				
			Case 'DeleteAllItems!'
				ls_Return = String(lv_test.TriggerEvent(DeleteAllItems!))
				
			Case 'DeleteItem!'
				ls_Return = String(lv_test.TriggerEvent(DeleteItem!))
				
			Case 'DoubleClicked!'
				ls_Return = String(lv_test.TriggerEvent(DoubleClicked!))
				
			Case 'Destructor!'
				ls_Return = String(lv_test.TriggerEvent(Destructor!))
				
			Case 'GetFocus!'
				ls_Return = String(lv_test.TriggerEvent(GetFocus!))
				
			Case 'InsertItem!'
				ls_Return = String(lv_test.TriggerEvent(InsertItem!))
				
			Case 'ItemChanged!'
				ls_Return = String(lv_test.TriggerEvent(ItemChanged!))
				
			Case 'ItemChanging!'
				ls_Return = String(lv_test.TriggerEvent(ItemChanging!))
				
			Case 'LoseFocus!'
				ls_Return = String(lv_test.TriggerEvent(LoseFocus!))
				
			Case 'RightClicked!'
				ls_Return = String(lv_test.TriggerEvent(RightClicked!))
				
			Case 'ColumnClick!'
				ls_Return = String(lv_test.TriggerEvent(ColumnClick!))
				
			Case 'ItemActivate!'
				ls_Return = String(lv_test.TriggerEvent("ItemActivate"))
				
			Case 'Key!'
				ls_Return = String(lv_test.TriggerEvent(Key!))
				
			Case 'Sort!'
				ls_Return = String(lv_test.TriggerEvent(Sort!))
				
			Case 'Help'
				ls_Return = String(lv_test.TriggerEvent("Help"))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case	'TypeOf'
		If lv_test.TypeOf( ) = ListView! Then
			ls_Return = "ListView!"
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
sle_functionparm.Text = ''

String strRandom

Choose Case lb_function.SelectedItem()
	Case	'AddColumn'
		lb_functionparm.AddItem('name,Center!,300')
		lb_functionparm.AddItem('date,Center!,300')
		lb_functionparm.AddItem('descript,Center!,600')
		Return
		
	Case	'AddItem'
		wf_random('string,index',lb_functionparm)
		Return
		
	Case	'AddLargePicture'
		lb_functionparm.AddItem('CAKE.JPG')
		Return
		
	Case	'AddSmallPicture'
		lb_functionparm.AddItem('CAKE.JPG')
		Return
		
	Case	'AddstatePicture'
		lb_functionparm.AddItem('CAKE.JPG')
		Return
		
	Case	'DeleteColumn' ,'DeleteItem' ,'DeleteLargePicture',&
		'DeleteSmallPicture' ,'DeleteStatePicture' ,'EditLabel'
	wf_random('index',lb_functionparm)
	Return
	
Case	'FindItem'
	lb_functionparm.AddItem('0,cake,true,true')
	lb_functionparm.AddItem('0,cake,true,false')
	lb_functionparm.AddItem('0,cake,false,true')
	lb_functionparm.AddItem('0,dog,true,true')
	lb_functionparm.AddItem('2,pie,true,true')
//	lb_functionparm.AddItem('0,DirectionAll!,true,true,true,true')
//	lb_functionparm.AddItem('0,DirectionAll!,true,true,true,true')
//	lb_functionparm.AddItem('0,DirectionDown!,true,true,true,true')
//	lb_functionparm.AddItem('0,DirectionLeft!,true,true,true,true')
//	lb_functionparm.AddItem('0,DirectionRight!,false,true,true,false')
	Return
	
Case	'GetColumn'
	lb_functionparm.AddItem('1')
	lb_functionparm.AddItem('2')
	lb_functionparm.AddItem('3')
	Return
	
Case	'GetItem'
	lb_functionparm.AddItem('1,1,cake')
	lb_functionparm.AddItem('1,lv1')
	lb_functionparm.AddItem('2,lv2')
	lb_functionparm.AddItem('1,1,lv1')
	lb_functionparm.AddItem('2,1,lv2')
	Return
	
Case	'GetOrigin'
	lb_functionparm.AddItem('1,1')
	lb_functionparm.AddItem('20,10')
	lb_functionparm.AddItem('10,20')
	Return
	
Case	'InsertColumn'
	lb_functionparm.AddItem('1,label1,Center!,200')
	lb_functionparm.AddItem('2,label2,Justify!,300')
	lb_functionparm.AddItem('3,label3,Left!,200')
	lb_functionparm.AddItem('4,label4,Right!,200')
	Return
	
Case	'InsertItem'
	lb_functionparm.AddItem('1,Insert1,1')
	lb_functionparm.AddItem('2,Insert2,5')
	lb_functionparm.AddItem('3,Insert3,7')
	lb_functionparm.AddItem('1,lv1')
	lb_functionparm.AddItem('2,lv2')
	Return
	
Case	'Move'
	wf_random('integer,integer',lb_functionparm)
	
Case	'PostEvent'
	lb_functionparm.AddItem('Clicked!')
	lb_functionparm.AddItem('Constructor!')
	lb_functionparm.AddItem('DeleteAllItems!')
	lb_functionparm.AddItem('DeleteItem!')
	lb_functionparm.AddItem('Destructor!')
	lb_functionparm.AddItem('DoubleClicked!')
	lb_functionparm.AddItem('GetFocus!')
	lb_functionparm.AddItem('InsertItem!')
	lb_functionparm.AddItem('ItemChanged!')
	lb_functionparm.AddItem('ItemChanging!')
	lb_functionparm.AddItem('LoseFocus!')
	lb_functionparm.AddItem('RightClicked!')
	Return
	
Case	'Resize'
	wf_random('integer,integer',lb_functionparm)
	
Case	'SetColumn'
	lb_functionparm.AddItem('1,label1,Center!,200')
	lb_functionparm.AddItem('2,label2,Justify!,300')
	lb_functionparm.AddItem('3,label3,Left!,200')
	lb_functionparm.AddItem('4,label4,Right!,200')
	Return
	
Case	'SetItem'
	lb_functionparm.AddItem('1,1,set11')
	lb_functionparm.AddItem('2,1,set21')
	lb_functionparm.AddItem('8,1,set81')
	lb_functionparm.AddItem('1,2,set12')
	lb_functionparm.AddItem('3,2,set32')
	lb_functionparm.AddItem('3,3,set33')
	lb_functionparm.AddItem('1,1,cake')
	lb_functionparm.AddItem('1,lv1')
	lb_functionparm.AddItem('2,lv2')
	lb_functionparm.AddItem('1,1,lv1')
	lb_functionparm.AddItem('2,1,lv2')
	Return
	
Case	'Sort'
	lb_functionparm.AddItem('Ascending!')
	lb_functionparm.AddItem('Descending!')
	lb_functionparm.AddItem('Unsorted!')
	lb_functionparm.AddItem('Ascending!,2')
	lb_functionparm.AddItem('Descending!,2')
	Return
Case 'SetRedraw'
	wf_random('boolean',lb_functionparm)
	Return
	
Case	'TriggerEvent'
	lb_functionparm.AddItem('Clicked!')
	lb_functionparm.AddItem('Constructor!')
	lb_functionparm.AddItem('DeleteAllItems!')
	lb_functionparm.AddItem('DeleteItem!')
	lb_functionparm.AddItem('Destructor!')
	lb_functionparm.AddItem('DoubleClicked!')
	lb_functionparm.AddItem('GetFocus!')
	lb_functionparm.AddItem('InsertItem!')
	lb_functionparm.AddItem('ItemChanged!')
	lb_functionparm.AddItem('ItemChanging!')
	lb_functionparm.AddItem('LoseFocus!')
	lb_functionparm.AddItem('RightClicked!')
	Return
	
Case	'lvi_ClassName' ,'lvi_GetParent' ,'lvi_TypeOf'
	wf_random('index',lb_functionparm)
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

type cb_2 from w_standard_ancestor2`cb_2 within w_listview_new
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_listview_new
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

lv_test.Border =B_Border 
lv_test.DeleteItems = B_DeleteItems 
//lv_test.CheckBoxes = B_CheckBoxes
lv_test.EditLabels = B_EditLabels 
lv_test.Enabled = B_Enabled 
lv_test.Italic = B_Italic 
lv_test.Underline = B_Underline 
lv_test.Visible = B_Visible 

lv_test.Height =I_Height 
lv_test.LargePictureHeight = I_LargePictureHeight 
lv_test.LargePictureWidth = I_LargePictureWidth 
lv_test.SmallPictureHeight = I_SmallPictureHeight 
lv_test.SmallPictureWidth = I_SmallPictureWidth 
lv_test.TextSize = I_TextSize 
lv_test.Weight = I_Weight 
lv_test.Width = I_Width 
lv_test.X  = I_X 
lv_test.Y = I_Y 


lv_test.BackColor =L_BackColor 
lv_test.TextColor = L_TextColor

lv_test.FaceName =S_FaceName 


lv_test.Tag = S_Tag 

lv_test.BorderStyle =StyleLowered! 
lv_test.View = ListViewReport!

//reset for function change:

lv_test.DeleteColumns( )
lv_test.DeleteItems( )		

lv_test.AddColumn('name',Center!,400)
lv_test.AddColumn('description',Center!,600)
lv_test.AddColumn('date',Center!,400)	


lv_test.AddItem('Cake',1)
lv_test.AddItem('Corn',2)
lv_test.AddItem('Dog',3)
lv_test.AddItem('Fries',4)
lv_test.AddItem('Grapes',5)
lv_test.AddItem('Peach',6)
lv_test.AddItem('Pie',7)
lv_test.AddItem('Treat',8)
lv_test.AddItem('Watermelon',9)

tab_1.tabpage_3.lb_out.reset()


		

end event

type st_tip from w_standard_ancestor2`st_tip within w_listview_new
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_listview_new
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_listview_new
string text = "ListView"
end type

type lv_test from listview within w_listview_new
integer x = 101
integer y = 104
integer width = 1573
integer height = 352
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string item[] = {"Cake","Com","Dos","Fires","Grapes","Peach","Pie","Watermelon"}
integer itempictureindex[] = {1,2,3,4,5,6,7,8}
string largepicturename[] = {"Browse!","BringToFront!","BrowseClasses!","BrowseObject!","CreateLibrary5!","Continue!","Application5!","CheckDiff!"}
long largepicturemaskcolor = 536870912
string smallpicturename[] = {"Browse!","BringToFront!","BrowseClasses!","BrowseObject!","CreateLibrary5!","Continue!","Application5!","CheckDiff!"}
long smallpicturemaskcolor = 536870912
string statepicturename[] = {"Browse!","BringToFront!","BrowseClasses!","BrowseObject!","CreateLibrary5!","Continue!","Application5!","CheckDiff!"}
long statepicturemaskcolor = 536870912
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lvnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item,ls_status

ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's Clicked Event " + " (index="+string(index)+") ,(selectedindex="+string(this.selectedindex()) +")"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event columnclick;//====================================================================
// Event: columnclick()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	column		
//--------------------------------------------------------------------
// Returns: long [pbm_lvncolumnclick]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's Columnclick Event (column ="+string(column)+')'
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's Constructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event deleteallitems;//====================================================================
// Event: deleteallitems()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_lvndeleteallitems]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's DeleteAllItems Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event deleteitem;//====================================================================
// Event: deleteitem()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lvndeleteitem]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
long ll_total
ll_total = lv_test.totalitems()
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's DeleteItem Event (index="+string(index) +"),(totalitems=" + string(ll_total)+")"
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's destructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lvndoubleclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's doubleclicked Event (index="+string(index)+") ,(selectedindex="+string(this.selectedindex()) +")"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_lvnsetfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's GetFocus Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event insertitem;//====================================================================
// Event: insertitem()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lvninsertitem]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's Insertitem Event (index="+string(index)+")( selectedindex = "+string(this.selectedindex())
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event itemchanged;//====================================================================
// Event: itemchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index          		
//		boolean	focuschange    		
//		boolean	hasfocus       		
//		boolean	selectionchange		
//		boolean	selected       		
//		boolean	otherchange    		
//--------------------------------------------------------------------
// Returns: long [pbm_lvnitemchanged]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's ItemChange Event (index ="+ string(index)+',focuschange='+string(focuschange)+',hasfocus='+string(hasfocus)+',selectionchange='+string(selectionchange) &
+',selected='+string(selected)+',otherchange='+ string(otherchange)+')' + "(selectedindex="+string( this.selectedindex())+")"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event itemchanging;//====================================================================
// Event: itemchanging()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index          		
//		boolean	focuschange    		
//		boolean	hasfocus       		
//		boolean	selectionchange		
//		boolean	selected       		
//		boolean	otherchange    		
//--------------------------------------------------------------------
// Returns: long [pbm_lvnitemchanging]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's ItemChanging Event(index ="+ string(index)+',focuschange='+string(focuschange)+',hasfocus='+string(hasfocus)+',selectionchange='+string(selectionchange) &
+',selected='+string(selected)+',otherchange='+ string(otherchange)+')'+ "(selectedindex="+string( this.selectedindex())+")"
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
// Returns: long [pbm_lvnkeydown]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'ListView key Event'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event losefocus;//====================================================================
// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_lvnkillfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's Lostfocus Event"
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
// Returns: long [pbm_lvnrclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ListView's RightClicked Event (index="+string(index)+")"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

