$PBExportHeader$w_line_new.srw
forward
global type w_line_new from w_standard_ancestor
end type
type ln_test from line within w_line_new
end type
end forward

global type w_line_new from w_standard_ancestor
string title = "Line"
ln_test ln_test
end type
global w_line_new w_line_new

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

on w_line_new.create
int iCurrent
call super::create
this.ln_test=create ln_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ln_test
end on

on w_line_new.destroy
call super::destroy
destroy(this.ln_test)
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

is_prop_data = "BeginX,BeginY,EndX,EndY,LineColor,LineStyle,LineThickness,Visible,Tag"
is_fuction_data = "ClassName,Hide,Move,Show,TypeOf"

st_tip.Text="The control is Line."
end event

type tab_1 from w_standard_ancestor`tab_1 within w_line_new
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

String  ls_Return

Choose Case lb_prop.SelectedItem()
	Case 'BeginX'
		ls_Return = String(ln_test.BeginX)
		
	Case 'BeginY'
		ls_Return = String(ln_test.BeginY)
		
	Case 'EndX'
		ls_Return = String(ln_test.EndX)
		
	Case 'EndY'
		ls_Return = String(ln_test.EndY)
		
	Case 'LineColor'
		ls_Return = String(ln_test.LineColor)
		
	Case 'LineStyle'
		Choose Case ln_test.LineStyle
			Case Continuous!
				ls_Return = 'Continuous!'
				
			Case Dash!
				ls_Return = 'Dash!'
				
			Case DashDot!
				ls_Return = 'DashDot!'
				
			Case DashDotDot!
				ls_Return = 'DashDotDot!'
				
			Case Dot!
				ls_Return = 'Dot!'
				
			Case Transparent!
				ls_Return = 'Transparent!'
				
		End Choose
		
	Case 'LineThickness'
		ls_Return = String(ln_test.LineThickness)
		
	Case 'Visible'
		ls_Return = String(ln_test.Visible)
		
	Case 'Tag'
		ls_Return = ln_test.Tag
		
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The Line's " + lb_prop.SelectedItem() + " property is " + ls_Return + "."


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
	Case 'BeginX'
		If IsNumber(ls_Param) Then
			ln_test.BeginX = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ln_test.BeginX)
		
	Case 'BeginY'
		If IsNumber(ls_Param) Then
			ln_test.BeginY = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ln_test.BeginY)
		
	Case 'EndX'
		If IsNumber(ls_Param) Then
			ln_test.EndX = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ln_test.EndX)
		
	Case 'EndY'
		If IsNumber(ls_Param) Then
			ln_test.EndY = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ln_test.EndY)
		
	Case 'LineColor'
		If IsNumber(ls_Param) Then
			ln_test.LineColor = Long(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			ln_test.LineColor = Long(ls_Param)
			Return
		End If
		
		ls_Return = String(ln_test.LineColor)
		
	Case 'LineStyle'
		Choose Case ls_Param
			Case 'Continuous!'
				ln_test.LineStyle = Continuous!
				
			Case 'Dash!'
				ln_test.LineStyle = Dash!
				
			Case 'DashDot!'
				ln_test.LineStyle = DashDot!
				
			Case 'DashDotDot!'
				ln_test.LineStyle = DashDotDot!
				
			Case 'Dot!'
				ln_test.LineStyle = Dot!
				
			Case 'Transparent!'
				ln_test.LineStyle = Transparent!
				
			Case Else
				MessageBox('Warning','Parameter error.')
				
				Return
				
		End Choose
		
		ls_Return = ls_Param
		
	Case 'LineThickness'
		If IsNumber(ls_Param) Then
			ln_test.LineThickness = Integer(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ln_test.LineThickness)
		
	Case 'Visible'
		If Lower(ls_Param) = 'true' Or Lower(ls_Param) = 'false' Then
			ln_test.Visible = inv_util.of_string_to_boolean(ls_Param)
		Else
			MessageBox('Warning','Parameter type error.')
			Return
		End If
		
		ls_Return = String(ln_test.Visible)
		
	Case 'Tag'
		ln_test.Tag = ls_Param
		ls_Return = ln_test.Tag
End Choose

ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The Line's " + lb_prop.SelectedItem() + " property is set to " + ls_Return + "."




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

lb_propparm.Reset()
sle_propparm.Text = ''

Choose Case lb_prop.SelectedItem()
	Case 'BeginX'
		wf_random('integer',lb_propparm)
		
	Case 'BeginY'
		wf_random('integer',lb_propparm)
		
	Case 'EndX'
		wf_random('integer',lb_propparm)
		
	Case 'EndY'
		wf_random('integer',lb_propparm)
		
	Case 'LineColor'
		wf_random('color',lb_propparm)
		
	Case 'LineStyle'
		lb_propparm.AddItem('Continuous!')
		lb_propparm.AddItem('Dash!')
		lb_propparm.AddItem('DashDot!')
		lb_propparm.AddItem('DashDotDot!')
		lb_propparm.AddItem('Dot!')
		lb_propparm.AddItem('Transparent!')
		Return
		
	Case 'LineThickness'
		lb_propparm.AddItem('10')
		lb_propparm.AddItem('15')
		Return
		
	Case 'Visible'
		wf_random('boolean',lb_propparm)
		
	Case 'Tag'
		wf_random('string',lb_propparm)
		
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

string  ls_Param
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

string ls_Return
integer intx,inty,li_ParaNum
string ls_ParamArray[]

li_ParaNum = wf_str2array(ls_Param,ls_ParamArray)
choose case lb_function.selecteditem()
	case 'ClassName'
		ls_Return = ln_test.ClassName() 
		
	case 'Hide'
		ls_Return = string(ln_test.Hide()) 
		
	case 'Move'
		if li_ParaNum <> 2 then 
			messagebox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(ls_ParamArray[1]) and isnumber(ls_ParamArray[2]) then
			intx = integer(ls_ParamArray[1])
			inty = integer(ls_ParamArray[2])
			ls_Return = string(ln_test.Move(intx,inty))
		else 
			messagebox('Warning','Parameter type error.')
			intx = integer(ls_ParamArray[1])
			inty = integer(ls_ParamArray[2])
			ls_Return = string(ln_test.Move(intx,inty))
			return
		end if
		
	case 'Show'
		ls_Return = string(ln_test.Show())
		
	case 'TypeOf'
		if ln_test.typeof() = Line! then
			ls_Return = 'Line!'
		else
			ls_Return = 'Invalid'
		end if
		
end choose

ls_Return = inv_util.of_convert_to_upper(ls_return)
st_tip.text = "Function "+lb_function.selecteditem()+" is executed. The return value is " + ls_Return + "."


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
// Author: 	laihaichun		Date: 2004/01/02
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

type cb_2 from w_standard_ancestor`cb_2 within w_line_new
end type

type cb_1 from w_standard_ancestor`cb_1 within w_line_new
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

ln_test.BeginX = 100
ln_test.BeginY = 76
ln_test.EndX = 480
ln_test.EndY = 220
ln_test.Visible = true
ln_test.linecolor = 33554432
ln_test.linestyle = continuous!
ln_test.linethickness = 4
ln_test.tag = ''
tab_1.tabpage_3.lb_1.reset()
end event

type st_tip from w_standard_ancestor`st_tip within w_line_new
end type

type gb_4 from w_standard_ancestor`gb_4 within w_line_new
end type

type gb_1 from w_standard_ancestor`gb_1 within w_line_new
boolean visible = false
end type

type ln_test from line within w_line_new
long linecolor = 33554432
integer linethickness = 4
integer beginx = 101
integer beginy = 76
integer endx = 480
integer endy = 220
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
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"Line's Constructor Event"
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
ls_item=string(tab_1.tabpage_3.lb_1.totalitems()+1,'000')+':'+"Line's Destructor Event"
tab_1.tabpage_3.lb_1.additem(ls_item)
end event

