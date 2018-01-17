$PBExportHeader$w_roundrectangle_new.srw
forward
global type w_roundrectangle_new from w_standard_ancestor
end type
type rr_test from roundrectangle within w_roundrectangle_new
end type
end forward

global type w_roundrectangle_new from w_standard_ancestor
string title = "RoundRectangle"
rr_test rr_test
end type
global w_roundrectangle_new w_roundrectangle_new

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
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

boolean B_Visible;
integer I_Height,I_LineThickness,I_X,I_Y,I_width,I_CornerHeight,I_CornerWidth;
long L_FillColor, L_LineColor;
string S_Tag;
n_util	inv_util

end variables

on w_roundrectangle_new.create
int iCurrent
call super::create
this.rr_test=create rr_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rr_test
end on

on w_roundrectangle_new.destroy
call super::destroy
destroy(this.rr_test)
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
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y = 0

I_CornerHeight = rr_test.CornerHeight
I_CornerWidth  = rr_test.CornerWidth
B_Visible = rr_test.Visible 
I_Height = rr_test.Height 
I_width = rr_test.Width
I_LineThickness = rr_test.LineThickness 
I_X = rr_test.X 
I_Y = rr_test.Y 
L_FillColor = rr_test.FillColor  
L_LineColor = rr_test.LineColor 
S_Tag = rr_test.Tag 
rr_test.LineStyle = Continuous!
rr_test.FillPattern = Solid!
inv_util=create n_util
end event

event ue_open;call super::ue_open;//====================================================================
// Event: ue_open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (None)
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

is_prop_data="CornerHeight,CornerWidth,FillColor,FillPattern,Height,LineColor,LineStyle,LineThickness,Tag,Visible,Width,X,Y"
is_fuction_data="ClassName,GetParent,Hide,Move,PostEvent,Resize,Show,TriggerEvent,TypeOf"

st_tip.Text="The control is RoundRectangle."
end event

type tab_1 from w_standard_ancestor`tab_1 within w_roundrectangle_new
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
// Author: 	zhouchaoqun		Date: 2004/09/24
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
	Case  'CornerHeight'
		ls_Return = String(rr_test.CornerHeight)
		
	Case  'CornerWidth'
		ls_Return = String(rr_test.CornerWidth)
		
	Case	'FillColor'
		ls_Return = String(rr_test.FillColor)
		
	Case  'FillPattern'
		Choose Case rr_test.FillPattern
			Case BDiagonal!
				ls_Return = "BDiagonal!"
				
			Case Diamond!
				ls_Return = "Diamond!"
				
			Case FDiagonal!
				ls_Return = "FDiagonal!"
				
			Case Horizontal!
				ls_Return = "Horizontal!"
				
			Case Solid!
				ls_Return = "Solid!"
				
			Case Square!
				ls_Return = "Square!"
				
			Case Vertical!
				ls_Return = "Vertical!"
				
		End Choose		
		
	Case	'Height'
		ls_Return = String(rr_test.Height)
		
	Case	'LineColor'
		ls_Return = String(rr_test.LineColor)
		
	Case	'LineStyle'
		Choose Case rr_test.LineStyle
			Case Continuous!
				ls_Return = "Continuous!"
				
			Case Dash!
				ls_Return = "Dash!"
				
			Case DashDot!
				ls_Return = "DashDot!"
				
			Case Dot!
				ls_Return = "Dot!"
				
		End Choose
		
	Case	'LineThickness'
		ls_Return = String(rr_test.LineThickness)
		
	Case	'Tag'
		ls_Return = rr_test.Tag
		
	Case	'Visible'
		ls_Return = String(rr_test.Visible)
		
	Case	'Width'
		ls_Return = String(rr_test.Width)
		
	Case	'X'
		ls_Return = String(rr_test.X)
		
	Case	'Y'
		ls_Return = String(rr_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The RoundRectangle's "+lb_prop.SelectedItem ( )+" property is "+ls_Return+"."


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
// Author: 	zhouchaoqun		Date: 2004/09/24
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
	Case  'CornerHeight'
		If IsNumber(ls_Param) Then
			rr_test.CornerHeight = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rr_test.CornerHeight)
		
	Case  'CornerWidth'
		If IsNumber(ls_Param) Then
			rr_test.Cornerwidth = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rr_test.Cornerwidth)
		
	Case	'FillColor'
		If IsNumber(ls_Param) Then
			rr_test.FillColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rr_test.FillColor)
		
	Case  'FillPattern'
		Choose Case ls_Param
			Case "BDiagonal!"
				rr_test.FillPattern = BDiagonal!
				
			Case "Diamond!"
				rr_test.FillPattern = Diamond!
				
			Case "FDiagonal!"
				rr_test.FillPattern = FDiagonal!
				
			Case "Horizontal!"
				rr_test.FillPattern = Horizontal!
				
			Case "Solid!"
				rr_test.FillPattern = Solid!
				
			Case "Square!"
				rr_test.FillPattern = Square!
				
			Case "Vertical!"
				rr_test.FillPattern = Vertical!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return				
		End Choose		
		ls_Return = ls_Param		
		
	Case	'Height'
		If IsNumber(ls_Param) Then
			rr_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rr_test.Height)
		
	Case	'LineColor'
		If IsNumber(ls_Param) Then
			rr_test.LineColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rr_test.LineColor)
		
	Case	'LineStyle'
		Choose Case ls_Param
			Case "Continuous!"
				rr_test.LineStyle = Continuous!
				
			Case "Dash!"
				rr_test.LineStyle = Dash!
				
			Case "DashDot!"
				rr_test.LineStyle = DashDot!
				
			Case "DashDotDot!"
				rr_test.LineStyle = DashDotDot!
				
			Case "Dot!"
				rr_test.LineStyle = Dot!
				
			Case "Transparent!"
				rr_test.LineStyle = Transparent!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case	'LineThickness'
		If IsNumber(ls_Param) Then
			rr_test.LineThickness = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rr_test.LineThickness)
		
	Case	'Tag'
		rr_test.Tag = ls_Param
		ls_Return = rr_test.Tag
		
	Case	'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			rr_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rr_test.Visible)
		
	Case	'Width'
		If IsNumber(ls_Param) Then
			rr_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rr_test.Width)
		
	Case	'X'
		If IsNumber(ls_Param) Then
			rr_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rr_test.X)
		
	Case	'Y'
		If IsNumber(ls_Param) Then
			rr_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(rr_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The RoundRectangle's "+lb_prop.SelectedItem ( )+" property is set to "+ls_Return+"."


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
// Author: 	zhouchaoqun		Date: 2004/09/25
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_propparm.Reset()
sle_propparm.Text = ''

Choose Case lb_prop.SelectedItem()
	Case  'CornerHeight'
		wf_random("Integer",lb_propparm)
		
	Case  'CornerWidth'
		wf_random("Integer",lb_propparm)
		
	Case	'FillColor'
		wf_random("Color",lb_propparm)
		
	Case  'FillPattern'
		lb_propparm.AddItem("BDiagonal!")
		lb_propparm.AddItem("Diamond!")
		lb_propparm.AddItem("FDiagonal!")
		lb_propparm.AddItem("Horizontal!")
		lb_propparm.AddItem("Solid!")
		lb_propparm.AddItem("Square!")
		lb_propparm.AddItem("Vertical!")
		Return
		
	Case	'Height'
		wf_random("Integer",lb_propparm)
		
	Case	'LineColor'
		wf_random("Color",lb_propparm)
		
	Case	'LineStyle'
		lb_propparm.AddItem("Continuous!")
		lb_propparm.AddItem("Dash!")
		lb_propparm.AddItem("DashDot!")
		lb_propparm.AddItem("DashDotDot!")
		lb_propparm.AddItem("Dot!")
		lb_propparm.AddItem("Transparent!")
		Return
		
	Case	'LineThickness'
		lb_propparm.AddItem("1")
		lb_propparm.AddItem("3")
		lb_propparm.AddItem("5")
		lb_propparm.AddItem("7")
		lb_propparm.AddItem("12")
		lb_propparm.AddItem("23")
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
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String ls_Param,ls_Return
window w_temp

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
		ls_Return = String(rr_test.ClassName( ))
		
	Case	'GetParent'
		w_temp = rr_test.GetParent( )
		ls_Return = w_temp.ClassName()
		
	Case	'Hide'
		ls_Return = String(rr_test.Hide( ))
		
	Case	'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(rr_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'PostEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(rr_test.PostEvent("Constructor"))
				
			Case 'Destructor!'
				ls_Return = String(rr_test.PostEvent("Destructor"))
				
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
			ls_Return = String(rr_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'Show'
		ls_Return = String(rr_test.Show( ))
		
	Case	'TriggerEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(rr_test.TriggerEvent("Constructor"))
				
			Case 'Destructor!'
				ls_Return = String(rr_test.TriggerEvent("Destructor"))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case	'TypeOf'
		If rr_test.TypeOf( ) = RoundRectangle! Then
			ls_Return = "RoundRectangle!"
		Else
			ls_Return = "invalid"
		End If
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "Function "+lb_function.SelectedItem()+" is executed. The return value is "+ls_Return+"."


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
// Author: 	zhouchaoqun		Date: 2004/09/25
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

type cb_2 from w_standard_ancestor`cb_2 within w_roundrectangle_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_roundrectangle_new
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
// Author: 	zhouchaoqun		Date: 2004/09/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

rr_test.Visible = B_Visible
rr_test.Height = I_Height
rr_test.CornerHeight = I_CornerHeight
rr_test.CornerWidth = I_CornerWidth
rr_test.Width = I_width 
rr_test.LineThickness = I_LineThickness
rr_test.X = I_X
rr_test.Y = I_Y
rr_test.FillColor = L_FillColor
rr_test.LineColor =  L_LineColor 
rr_test.Tag = S_Tag
rr_test.LineStyle = Continuous!
rr_test.FillPattern = Solid!

tab_1.tabpage_3.lb_1.reset()

end event

type st_tip from w_standard_ancestor`st_tip within w_roundrectangle_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_roundrectangle_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_roundrectangle_new
boolean visible = false
end type

type rr_test from roundrectangle within w_roundrectangle_new
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 1073741824
integer x = 119
integer y = 80
integer width = 329
integer height = 172
integer cornerheight = 40
integer cornerwidth = 46
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
// Author: 	zhouchaoqun		Date: 2004/09/25
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"RoundRectangle's Constructor Event"
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
// Author: 	zhouchaoqun		Date: 2004/09/25
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"RoundRectangle's Destructor Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

