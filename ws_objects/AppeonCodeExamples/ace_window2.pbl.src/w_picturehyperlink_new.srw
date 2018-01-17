$PBExportHeader$w_picturehyperlink_new.srw
forward
global type w_picturehyperlink_new from w_standard_ancestor2
end type
type phl_test from picturehyperlink within w_picturehyperlink_new
end type
end forward

global type w_picturehyperlink_new from w_standard_ancestor2
string title = "pictureHyperLink"
phl_test phl_test
end type
global w_picturehyperlink_new w_picturehyperlink_new

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

on w_picturehyperlink_new.create
int iCurrent
call super::create
this.phl_test=create phl_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.phl_test
end on

on w_picturehyperlink_new.destroy
call super::destroy
destroy(this.phl_test)
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

phl_test.OriginalSize = true

B_Border = phl_test.Border   
B_Enabled = phl_test.Enabled   
B_OriginalSize = phl_test.OriginalSize   
B_Visible = phl_test.Visible 
I_Height = phl_test.Height   
I_Width = phl_test.Width   
I_X = phl_test.X   
I_Y = phl_test.Y 
S_PictureName = phl_test.PictureName   
S_Tag = phl_test.Tag 
S_PowerTipText = phl_test.PowerTipText
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

is_prop_data="Border,BorderStyle,Enabled,Height,OriginalSize,URL,PictureName,Tag,Visible,Width,X,Y,PowerTipText"
is_fuction_data="ClassName,Draw,GetParent,Hide,Move,PostEvent,Resize,SetFocus,SetPosition,SetRedraw,Show,TriggerEvent,TypeOf"

st_tip.Text="The control is PictureHyperLink."

end event

type tab_1 from w_standard_ancestor2`tab_1 within w_picturehyperlink_new
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
		ls_Return = string(phl_test.Border)
		
	CASE	'BorderStyle' 
		CHOOSE CASE phl_test.BorderStyle
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
		ls_Return = string(phl_test.Enabled)
		
	CASE	'Height' 
		ls_Return = string(phl_test.Height)  

	CASE	'OriginalSize' 
		ls_Return = string(phl_test.OriginalSize)
		
	CASE	'PictureName' 
		ls_Return = phl_test.PictureName
		
	CASE	'Tag' 
		ls_Return = phl_test.Tag

	CASE	'Visible' 
		ls_Return = string(phl_test.Visible)

	CASE	'Width' 
		ls_Return = string(phl_test.Width)  

	CASE	'X' 
		ls_Return = string(phl_test.X)  

	CASE	'Y' 
		ls_Return = string(phl_test.Y)  
	CASE	'URL' 
		ls_Return = string(phl_test.URL)  	
	CASE	'PowerTipText'	
		ls_Return = phl_test.PowerTipText
END CHOOSE

ls_Return = inv_util.of_convert_to_upper(ls_return)
st_tip.Text = "The PictureHyperLink's "+lb_prop.SelectedItem ( )+" property is "+ls_Return+"."

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
			phl_test.Border = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(phl_test.Border)
		
	Case	'BorderStyle'
		phl_test.Border = True
		
		Choose Case ls_Param
			Case "StyleBox!"
				phl_test.BorderStyle = StyleBox!
				
			Case "StyleLowered!"
				phl_test.BorderStyle = StyleLowered!
				
			Case "StyleRaised!"
				phl_test.BorderStyle = StyleRaised!
				
			Case "StyleShadowBox!"
				phl_test.BorderStyle = StyleShadowBox!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case	'Enabled'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			phl_test.Enabled = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(phl_test.Enabled)
		
	Case	'Height'
		If IsNumber(ls_Param) Then
			phl_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(phl_test.Height)
		
	Case	'OriginalSize'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			phl_test.OriginalSize = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(phl_test.OriginalSize)
		
	Case	'PictureName'
		phl_test.PictureName = ls_Param
		ls_Return = phl_test.PictureName
		
	Case	'URL'
		phl_test.URL = ls_Param
		ls_Return = phl_test.URL
		
	Case	'Tag'
		phl_test.Tag = ls_Param
		ls_Return = phl_test.Tag
		
	Case	'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			phl_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(phl_test.Visible)
		
	Case	'Width'
		If IsNumber(ls_Param) Then
			phl_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(phl_test.Width)
		
	Case	'X'
		If IsNumber(ls_Param) Then
			phl_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(phl_test.X)
		
	Case	'Y'
		If IsNumber(ls_Param) Then
			phl_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(phl_test.Y)
		
	Case	'PowerTipText'	
		phl_test.PowerTipText = ls_Param
		ls_Return = phl_test.PowerTipText
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The PictureHyperLink's "+lb_prop.SelectedItem ( )+" property is set to "+ls_Param+"."


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
sle_propparm.text = ''

CHOOSE CASE lb_prop.SelectedItem()
	CASE	'Border' 
		wf_random("Boolean",lb_propparm)
		 
	CASE	'BorderStyle' 
		lb_propparm.additem("StyleBox!")
		lb_propparm.additem("StyleLowered!")
		lb_propparm.additem("StyleRaised!")
		//lb_propparm.additem("StyleShadowBox!")
		return

	CASE	'Enabled' 
		wf_random("Boolean",lb_propparm)
		
	CASE	'Height'
		wf_random("Integer",lb_propparm)
		
	CASE	'OriginalSize' 
		wf_random("Boolean",lb_propparm)
		
	case 'URL'	
		lb_propparm.additem("http://www.appeon.com")
		lb_propparm.additem("http://www.sybase.com")
		
	CASE	'PictureName' 
		lb_propparm.additem("tag004.jpg")
		lb_propparm.additem("tag003.jpg")
			
	CASE	'Tag' 
		wf_random("String",lb_propparm)
		
	CASE	'Visible' 
		wf_random("Boolean",lb_propparm)
		
	CASE	'Width' 
		wf_random("Integer",lb_propparm)
		
	CASE	'X' 
		wf_random("Integer",lb_propparm)
		
	CASE	'Y' 
		wf_random("Integer",lb_propparm)
	CASE	'PowerTipText'
		wf_random("string",lb_propparm)
END CHOOSE

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

string ls_Param,ls_Return 

ls_Param =trim(sle_functionparm.Text)
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
string strx
long longx,longy
string ls_ParamArray[]

li_ParaNum = wf_str2array(ls_Param,ls_ParamArray)

CHOOSE CASE lb_function.SelectedItem()
	CASE	'ClassName' 
		ls_Return = string(phl_test.ClassName( )) 
		
	CASE	'Draw'
		if li_ParaNum <> 2 then 
			messagebox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(ls_ParamArray[1]) and isnumber(ls_ParamArray[2]) then
			intx = integer(ls_ParamArray[1])
			inty = integer(ls_ParamArray[2])
			ls_Return = string(phl_test.Draw(intx,inty))	
		else
			messagebox('Warning','Parameter type error.')
			return
		end if
			
	CASE	'GetParent'
		window  w_temp
		w_temp = phl_test.GetParent( )
		ls_Return = w_temp.ClassName()
			
	CASE	'Hide' 
		ls_Return = string(phl_test.Hide( )) 
				
	CASE	'Move'
		if li_ParaNum <> 2 then 
			messagebox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(ls_ParamArray[1]) and isnumber(ls_ParamArray[2]) then
			intx = integer(ls_ParamArray[1])
			inty = integer(ls_ParamArray[2])
			ls_Return = string(phl_test.Move(intx,inty))
		else
			messagebox('Warning','Parameter type error.')
			return
		end if
			
   CASE	'PostEvent' 
		choose case ls_Param
		     case 'Clicked!'
					ls_Return = string(phl_test.PostEvent(Clicked!))
					
				case 'Constructor!'
					ls_Return = string(phl_test.PostEvent(Constructor!))
					
				case 'Destructor!'
					ls_Return = string(phl_test.PostEvent(Destructor!))
					
				case 'DoubleClicked!'
					ls_Return = string(phl_test.PostEvent(DoubleClicked!))
					
				case 'GetFocus!'
					ls_Return = string(phl_test.PostEvent(GetFocus!))
					
				case 'LoseFocus!'
					ls_Return = string(phl_test.PostEvent(LoseFocus!))
					
				case 'RButtonDown!'
					ls_Return = string(phl_test.PostEvent(RButtonDown!))
					
				case 'Help'
					ls_Return = string(phl_test.PostEvent("Help"))
					
				case else
					messagebox('Warning','Parameter error.')
					return
					
		end choose

	CASE	'Resize' 
		if li_ParaNum <> 2 then 
			messagebox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(ls_ParamArray[1]) and isnumber(ls_ParamArray[2]) then
			intx = integer(ls_ParamArray[1])
			inty = integer(ls_ParamArray[2])
			ls_Return = string(phl_test.Resize(intx,inty))	
		else
			messagebox('Warning','Parameter type error.')
			return
		end if

	CASE	'SetFocus' 
			ls_Return = string(phl_test.SetFocus( ))
			
	CASE	'SetPosition' 
			choose case ls_Param				
				case 'ToTop!'
					ls_Return = string(phl_test.SetPosition(ToTop!)) 
					
				case 'ToBottom!'
					ls_Return = string(phl_test.SetPosition(ToBottom!))
					
				case else
					messagebox('Warning','Parameter error.')
					return
					
			end choose
			
	Case 'SetRedraw'
		ls_Return = string(phl_test.SetRedraw(inv_util.of_string_to_boolean(ls_Param) )) 
		
	CASE	'Show' 
		ls_Return = string(phl_test.Show( )) 
			
   CASE	'TriggerEvent' 
		choose case ls_Param
		      case 'Clicked!'
					ls_Return = string(phl_test.TriggerEvent(Clicked!))
					
				case 'Constructor!'
					ls_Return = string(phl_test.TriggerEvent(Constructor!))
					
				case 'Destructor!'
					ls_Return = string(phl_test.TriggerEvent(Destructor!))
					
				case 'DoubleClicked!'
					ls_Return = string(phl_test.TriggerEvent(DoubleClicked!))
					
				case 'GetFocus!'
					ls_Return = string(phl_test.TriggerEvent(GetFocus!))
					
				case 'LoseFocus!'
					ls_Return = string(phl_test.TriggerEvent(LoseFocus!))
					
				case 'RButtonDown!'
					ls_Return = string(phl_test.TriggerEvent(RButtonDown!))
					
				case 'Help'
					ls_Return = string(phl_test.TriggerEvent("Help"))
					
				case else
					messagebox('Warning','Parameter error.')
					return	
					
		end choose
		
	CASE	'TypeOf' 
		if phl_test.TypeOf( ) = PictureHyperLink! then
			ls_Return = "PictureHyperLink!" 
		else
			ls_Return = "invalid"
		end if
		
END CHOOSE

ls_Return = inv_util.of_convert_to_upper(ls_return)
st_tip.Text="Function "+lb_function.SelectedItem()+" is executed. The return value is "+ls_Return+"."

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
sle_functionparm.Text = ''

String strPropparm,strValue
Integer intx,inty
String strx
Long longx,longy
String strar[]

strPropparm = sle_functionparm.Text
wf_str2array(strPropparm,strar)

Choose Case lb_function.SelectedItem()
	Case	'Draw'
		wf_random('integer,integer',lb_functionparm)
		
	Case	'Move'
		wf_random('integer,integer',lb_functionparm)
		
	Case	'PostEvent'
		lb_functionparm.AddItem('Clicked!')
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('DoubleClicked!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
		Return
		
	Case	'Resize'
		wf_random('integer,integer',lb_functionparm)
		
	Case	'SetPosition'		
		lb_functionparm.AddItem('ToTop!')
		lb_functionparm.AddItem('ToBottom!')
		Return
	Case 'SetRedraw'
		wf_random('Boolean',lb_functionparm)
		Return
		
	Case	'TriggerEvent'
		lb_functionparm.AddItem('Clicked!')
		lb_functionparm.AddItem('Constructor!')
		lb_functionparm.AddItem('Destructor!')
		lb_functionparm.AddItem('DoubleClicked!')
		lb_functionparm.AddItem('GetFocus!')
		lb_functionparm.AddItem('LoseFocus!')
		lb_functionparm.AddItem('RButtonDown!')
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

type cb_2 from w_standard_ancestor2`cb_2 within w_picturehyperlink_new
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_picturehyperlink_new
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
// Author: 	zhouchaoqun   Date: 2006-05-09
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

phl_test.Border = B_Border
phl_test.Enabled = B_Enabled
phl_test.OriginalSize = B_OriginalSize
phl_test.Visible = B_Visible
phl_test.Height = I_Height
phl_test.Width = I_Width
phl_test.X = I_X
phl_test.Y = I_Y
phl_test.PictureName = S_PictureName
phl_test.url = "http://www.appeon.com"
phl_test.Tag = S_Tag
phl_test.PowerTipText = S_PowerTipText
phl_test.BorderStyle = StyleLowered!
tab_1.tabpage_3.lb_out.Reset()

end event

type st_tip from w_standard_ancestor2`st_tip within w_picturehyperlink_new
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_picturehyperlink_new
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_picturehyperlink_new
string text = "PictureHyperLink"
end type

type phl_test from picturehyperlink within w_picturehyperlink_new
integer x = 128
integer y = 144
integer width = 421
integer height = 280
boolean bringtotop = true
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "CAKE.JPG"
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureHyperLink Clicked Event "
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureHyperLink Constructor Event "
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureHyperLink Destructor Event "
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureHyperLink DoubleClicked Event "
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureHyperLink RbuttonDown Event "
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureHyperLink GetFocus Event "
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"PictureHyperLink LoseFocus Event "
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

