$PBExportHeader$w_rectangle_new.srw
forward
global type w_rectangle_new from w_standard_ancestor
end type
type r_test from rectangle within w_rectangle_new
end type
end forward

global type w_rectangle_new from w_standard_ancestor
string title = "Rectangle"
r_test r_test
end type
global w_rectangle_new w_rectangle_new

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

boolean B_Visible;
integer I_Height,I_LineThickness,I_X,I_Y,I_width;
long L_FillColor, L_LineColor;
string S_Tag;
n_util	inv_util

end variables

on w_rectangle_new.create
int iCurrent
call super::create
this.r_test=create r_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_test
end on

on w_rectangle_new.destroy
call super::destroy
destroy(this.r_test)
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
//Unsupport;zhuxinping 2002-12-05
//string strProperty="FillColor,Height,LineColor,LineStyle,LineThickness,Tag,Visible,Width,X,Y"
//string strFunction="ClassName,GetParent,Hide,Move,PostEvent,Resize,Show,TriggerEvent,TypeOf"

B_Visible = r_test.Visible 
I_Height = r_test.Height 
I_width = r_test.Width
I_LineThickness = r_test.LineThickness 
I_X = r_test.X 
I_Y = r_test.Y 
L_FillColor = r_test.FillColor  
L_LineColor = r_test.LineColor 
S_Tag = r_test.Tag 
r_test.LineStyle = Continuous!
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

is_prop_data="FillColor,Height,LineColor,LineStyle,LineThickness,Tag,Visible,Width,X,Y"
is_fuction_data="ClassName,GetParent,Hide,Move,PostEvent,Resize,Show,TriggerEvent,TypeOf"

st_tip.Text="The control is Rectangle."
end event

type tab_1 from w_standard_ancestor`tab_1 within w_rectangle_new
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

String ls_Return

Choose Case lb_prop.SelectedItem()
	Case	'FillColor'
		ls_Return = String(r_test.FillColor)
		
	Case	'Height'
		ls_Return = String(r_test.Height)
		
	Case	'LineColor'
		ls_Return = String(r_test.LineColor)
		
	Case	'LineStyle'
		Choose Case r_test.LineStyle
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
		ls_Return = String(r_test.LineThickness)
		
	Case	'Tag'
		ls_Return = r_test.Tag
		
	Case	'Visible'
		ls_Return = String(r_test.Visible)
		
	Case	'Width'
		ls_Return = String(r_test.Width)
		
	Case	'X'
		ls_Return = String(r_test.X)
		
	Case	'Y'
		ls_Return = String(r_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The Rectangle's "+lb_prop.SelectedItem ( )+" property is "+ls_Return+"."


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
	Case	'FillColor'
		If IsNumber(ls_Param) Then
			r_test.FillColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(r_test.FillColor)
		
	Case	'Height'
		If IsNumber(ls_Param) Then
			r_test.Height = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(r_test.Height)
		
	Case	'LineColor'
		If IsNumber(ls_Param) Then
			r_test.LineColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(r_test.LineColor)
		
	Case	'LineStyle'
		Choose Case ls_Param
			Case "Continuous!"
				r_test.LineStyle = Continuous!
				
			Case "Dash!"
				r_test.LineStyle = Dash!
				
			Case "DashDot!"
				r_test.LineStyle = DashDot!
				
			Case "DashDotDot!"
				r_test.LineStyle = DashDotDot!
				
			Case "Dot!"
				r_test.LineStyle = Dot!
				
			Case "Transparent!"
				r_test.LineStyle = Transparent!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case	'LineThickness'
		If IsNumber(ls_Param) Then
			r_test.LineThickness = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(r_test.LineThickness)
		
	Case	'Tag'
		r_test.Tag = ls_Param
		ls_Return = r_test.Tag
		
	Case	'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			r_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(r_test.Visible)
		
	Case	'Width'
		If IsNumber(ls_Param) Then
			r_test.Width = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(r_test.Width)
		
	Case	'X'
		If IsNumber(ls_Param) Then
			r_test.X = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(r_test.X)
		
	Case	'Y'
		If IsNumber(ls_Param) Then
			r_test.Y = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(r_test.Y)
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The Rectangle's "+lb_prop.SelectedItem ( )+" property is set to "+ls_Return+"."


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
	Case	'FillColor'
		wf_random("Color",lb_propparm)
		
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
// Author: 	laihaichun		Date: 2004/01/02
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
		ls_Return = String(r_test.ClassName( ))
		
	Case	'GetParent'
		w_temp = r_test.GetParent( )
		ls_Return = w_temp.ClassName()
		
	Case	'Hide'
		ls_Return = String(r_test.Hide( ))
		
	Case	'Move'
		If li_ParaNum <> 2 Then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		ElseIf IsNumber(ls_ParamArray[1]) And IsNumber(ls_ParamArray[2]) Then
			intx = Integer(ls_ParamArray[1])
			inty = Integer(ls_ParamArray[2])
			ls_Return = String(r_test.Move(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'PostEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(r_test.PostEvent("Constructor"))
				
			Case 'Destructor!'
				ls_Return = String(r_test.PostEvent("Destructor"))
				
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
			ls_Return = String(r_test.Resize(intx,inty))
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
	Case	'Show'
		ls_Return = String(r_test.Show( ))
		
	Case	'TriggerEvent'
		Choose Case ls_Param
			Case 'Constructor!'
				ls_Return = String(r_test.TriggerEvent("Constructor"))
				
			Case 'Destructor!'
				ls_Return = String(r_test.TriggerEvent("Destructor"))
				
			Case Else
				MessageBox('Warning','Parameter error.')
				Return
				
		End Choose
		
	Case	'TypeOf'
		If r_test.TypeOf( ) = Rectangle! Then
			ls_Return = "Rectangle!"
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
// Author: 	laihaichun		Date: 2004/01/02
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

type cb_2 from w_standard_ancestor`cb_2 within w_rectangle_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_rectangle_new
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

r_test.Visible = B_Visible
r_test.Height = I_Height
r_test.Width = I_width 
r_test.LineThickness = I_LineThickness
r_test.X = I_X
r_test.Y = I_Y
r_test.FillColor = L_FillColor
r_test.LineColor =  L_LineColor 
r_test.Tag = S_Tag
r_test.LineStyle = Continuous!

tab_1.tabpage_3.lb_1.reset()

end event

type st_tip from w_standard_ancestor`st_tip within w_rectangle_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_rectangle_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_rectangle_new
boolean visible = false
end type

type r_test from rectangle within w_rectangle_new
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 1073741824
integer x = 101
integer y = 84
integer width = 165
integer height = 144
end type

event constructor;
//====================================================================
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
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"Rectangle's Constructor Event"
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"Rectangle's Destructor Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

