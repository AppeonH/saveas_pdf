$PBExportHeader$w_vscrollbar_new.srw
forward
global type w_vscrollbar_new from w_standard_ancestor2
end type
type vsb_test from vscrollbar within w_vscrollbar_new
end type
type st_3 from statictext within w_vscrollbar_new
end type
end forward

global type w_vscrollbar_new from w_standard_ancestor2
integer width = 2318
integer height = 1756
string title = "VScrollBar"
vsb_test vsb_test
st_3 st_3
end type
global w_vscrollbar_new w_vscrollbar_new

type variables

end variables

on w_vscrollbar_new.create
int iCurrent
call super::create
this.vsb_test=create vsb_test
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.vsb_test
this.Control[iCurrent+2]=this.st_3
end on

on w_vscrollbar_new.destroy
call super::destroy
destroy(this.vsb_test)
destroy(this.st_3)
end on

event ue_open;call super::ue_open;is_prop_data = "BringToTop,Height,MaxPosition,MinPosition,Pointer,Position,StdWidth," + &
			 "TabOrder,Tag,Visible,Width,X,Y"
is_fuction_data = "ClassName,GetParent,Hide,Move,PointerX,PointerY,PostEvent,Resize," + &
				  "SetFocus,SetPosition,SetRedraw,Show,TriggerEvent,TypeOf"			 
end event

type tab_1 from w_standard_ancestor2`tab_1 within w_vscrollbar_new
integer width = 2222
end type

type tabpage_1 from w_standard_ancestor2`tabpage_1 within tab_1
integer width = 2185
end type

type cb_get from w_standard_ancestor2`cb_get within tabpage_1
integer x = 1751
integer y = 560
integer width = 402
integer height = 108
end type

event cb_get::clicked;call super::clicked;// Event:clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
if lb_prop.SelectedIndex() < 0 then
	MessageBox('Warning','Please select testing property.')
	return
end if

string ls_StrGetValue , ls_StrTip

choose case lb_prop.selecteditem()
	case  'BringToTop'
		ls_StrGetValue = String(vsb_test.BringToTop)
	case 'Height'
		ls_StrGetValue = String(vsb_test.Height)
	case 'MaxPosition'
		ls_StrGetValue = String(vsb_test.MaxPosition)
	case 'MinPosition'
		ls_StrGetValue = String(vsb_test.MinPosition)
	case 'Pointer' 
		ls_StrGetValue = String(vsb_test.Pointer)
	case 'Position'
		ls_StrGetValue = String(vsb_test.Position)
	case 'StdWidth'
		ls_StrGetValue = String(vsb_test.StdWidth)
	case 'TabOrder'
		ls_StrGetValue = String(vsb_test.TabOrder)
	case 'Tag'
		ls_StrGetValue = String(vsb_test.Tag)
	case 'Visible'
		ls_StrGetValue = String(vsb_test.Visible)
	case 'Width'
		ls_StrGetValue = String(vsb_test.Width)
	case 'X'
		ls_StrGetValue = String(vsb_test.X)
	case 'Y'
		ls_StrGetValue = String(vsb_test.Y)
	end choose
ls_StrTip = "The VScrollBar " + lb_prop.selecteditem() + " get value is " + WordCap(ls_StrGetValue) + "." 
st_tip.text = ls_StrTip

end event

type cb_set from w_standard_ancestor2`cb_set within tabpage_1
integer x = 1751
integer width = 402
integer height = 108
end type

event cb_set::clicked;call super::clicked;// Event:clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
String ls_PropTestValue , strtip

ls_PropTestValue = Trim(sle_propparm.text)

if lb_prop.SelectedIndex() < 0 then
	MessageBox('Warning','Please select testing property.')
	return
end if

if IsNull(ls_PropTestValue) or ls_PropTestValue = '' then
	MessageBox('Warning','Please select testing data.')
	return
end if

choose case lb_prop.selecteditem()
	case  'BringToTop'
		choose case lower(ls_PropTestValue) 
			    case 'true' 
					  vsb_test.BringToTop = True
					  
				 case 'false' 
					  vsb_test.BringToTop = False
			        
		       case else
			        MessageBox('Warning','Parameter type error.')
			        return
	          end choose
	case 'Height'
		if IsNumber(ls_PropTestValue) then
			vsb_test.Height = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'MaxPosition'
		if IsNumber(ls_PropTestValue) then
			vsb_test.MaxPosition = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'MinPosition'
		if IsNumber(ls_PropTestValue) then
			vsb_test.MinPosition = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Pointer' 
		vsb_test.Pointer = ls_PropTestValue 
	case 'Position'
		if IsNumber(ls_PropTestValue) then
			vsb_test.Position = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'StdWidth'
		if lower(ls_PropTestValue) = 'true' then
			vsb_test.StdWidth = True
		elseif lower(ls_PropTestValue) = 'false' then
			vsb_test.StdWidth = False
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'TabOrder'
		if IsNumber(ls_PropTestValue) then
			vsb_test.TabOrder = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Tag'
		vsb_test.Tag = ls_PropTestValue
	case 'Visible'
		if lower(ls_PropTestValue) = 'true' then
			vsb_test.Visible = True
		elseif lower(ls_PropTestValue) = 'false' then
			vsb_test.Visible = False
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Width'
		if IsNumber(ls_PropTestValue) then
			vsb_test.Width = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'X'
		if IsNumber(ls_PropTestValue) then
			vsb_test.X = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Y'
		if IsNumber(ls_PropTestValue) then
			vsb_test.Y = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	end choose
	strtip = "The VScrollBar " + lb_prop.selecteditem() + " set value is " + WordCap(ls_PropTestValue) + "." 
	st_tip.text = strtip
	
end event

type st_1 from w_standard_ancestor2`st_1 within tabpage_1
end type

type lb_propparm from w_standard_ancestor2`lb_propparm within tabpage_1
end type

type lb_prop from w_standard_ancestor2`lb_prop within tabpage_1
end type

event lb_prop::selectionchanged;call super::selectionchanged;// Event:selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
lb_propparm.Reset()
sle_propparm.text = ''

CHOOSE CASE lb_prop.selecteditem()
	case  'BringToTop'
		wf_random('boolean',lb_propparm)		
	case 'Height'
		wf_random('int',lb_propparm)
	case 'MaxPosition'
		wf_random('int',lb_propparm)
	case 'MinPosition'
		wf_random('int',lb_propparm)
	CASE 'Pointer'  
		lb_propparm.additem('Arrow!')
		lb_propparm.additem('IBeam!')
		lb_propparm.additem('Cross!')
		lb_propparm.additem('HourGlass!')
		lb_propparm.additem('HyperLink!')
		lb_propparm.additem('Size!')
		lb_propparm.additem('SizeNESW!')
		lb_propparm.additem('SizeNWSE!')
		lb_propparm.additem('SizeWE!')
		lb_propparm.additem('UPArrow!')
		lb_propparm.additem('SizeNS! ')
	case 'Position'
		wf_random('int',lb_propparm)		
	case 'StdWidth'
		wf_random('boolean',lb_propparm)
	case 'TabOrder'
		wf_random('int',lb_propparm)
	case 'Tag'
		wf_random('string',lb_propparm)
	case 'Visible'
		wf_random('boolean',lb_propparm)
	case 'Width'
		wf_random('int',lb_propparm)
	case 'X'
		wf_random('int',lb_propparm)
	case 'Y'
		wf_random('int',lb_propparm)
end choose

end event

type sle_propparm from w_standard_ancestor2`sle_propparm within tabpage_1
end type

type tabpage_2 from w_standard_ancestor2`tabpage_2 within tab_1
integer width = 2185
end type

type cb_execute from w_standard_ancestor2`cb_execute within tabpage_2
integer x = 1746
integer y = 692
integer width = 402
integer height = 108
end type

event cb_execute::clicked;call super::clicked;// Event:clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
String ls_sle

if lb_function.SelectedIndex() < 0 then
	MessageBox('Warning','Please select testing function.')
	return
end if
ls_sle = sle_functionparm.text
if isnull(ls_sle) then ls_sle = ''
if ls_sle = '' and lb_functionparm.totalItems() > 0  then
	MessageBox('Warning','Please select testing data.')
	return
end if

String 	strtip , strexevalue, strtestvalue
integer 	intx , inty
String 	strar[]
int 		parmnumber
PowerObject lpowero_parent

strtestvalue = trim(sle_functionparm.text)
parmnumber = wf_str2array(strtestvalue,strar)
choose case lb_function.selecteditem()
	case 'ClassName'
		strexevalue = vsb_test.ClassName() 
	case 'GetParent'
		lpowero_parent = vsb_test.GetParent()
		strexevalue = lpowero_parent.ClassName()
	case 'Hide'
		strexevalue = String(vsb_test.Hide()) 
	case 'Move'
		if parmnumber <> 2 then 
			MessageBox('Warning','Parameter number should be 2.')
			return
		elseif IsNumber(strar[1]) and IsNumber(strar[2]) then
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vsb_test.Move(intx,inty))
		else
			MessageBox('Warning','Parameter type error.Type will be converted.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vsb_test.Move(intx,inty))
			return
		end if
	case 'PointerX'
		strexevalue = String(vsb_test.PointerX()) 
	case 'PointerY'
		strexevalue = String(vsb_test.PointerY()) 
	case 'PostEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(vsb_test.PostEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(vsb_test.PostEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(vsb_test.PostEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(vsb_test.PostEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(vsb_test.PostEvent(RButtonDown!))
			case 'Help'
				strexevalue = String(vsb_test.PostEvent('Help'))
			case 'LineUp!'
				strexevalue = String(vsb_test.PostEvent(lineup!))
			case 'LineDown!'
				strexevalue = String(vsb_test.PostEvent(linedown!))
			case 'PageUp!'
				strexevalue = String(vsb_test.PostEvent(pageup!))
			case 'PageDown!'
				strexevalue = String(vsb_test.PostEvent(pagedown!))
			case 'Moved!'
				strexevalue = String(vsb_test.PostEvent(Moved!))
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'Resize'
		if parmnumber <> 2 then 
			MessageBox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(strar[1]) and isnumber(strar[2]) then
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vsb_test.Resize(intx,inty))
		else
			MessageBox('Warning','Parameter type error.Type will be converted.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vsb_test.Resize(intx,inty))
		end if
	case 'SetFocus'
		strexevalue = String(vsb_test.SetFocus())
	case 'SetPosition'
		choose case strtestvalue
			case 'Behind!'
				strexevalue = String(vsb_test.SetPosition(Behind!,st_3))
				
			case 'ToTop!'
				strexevalue = String(vsb_test.SetPosition(ToTop!)) 
				
			case 'ToBottom!'
				strexevalue = String(vsb_test.SetPosition(ToBottom!))
				
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'SetRedraw'
		if lower(strtestvalue) = 'true' then
			strexevalue = String(vsb_test.SetRedraw(True))
		elseif lower(strtestvalue) = 'false' then
			strexevalue = String(vsb_test.SetRedraw(False))
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Show'
		strexevalue = String(vsb_test.Show())
	case 'TriggerEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(vsb_test.TriggerEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(vsb_test.TriggerEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(vsb_test.TriggerEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(vsb_test.TriggerEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(vsb_test.TriggerEvent(RButtonDown!))
			case 'Help!'
				strexevalue = String(vsb_test.TriggerEvent('Help'))
			case 'LineUp!'
				strexevalue = String(vsb_test.TriggerEvent(lineup!))
			case 'LineDown!'
				strexevalue = String(vsb_test.TriggerEvent(linedown!))
			case 'PageUp!'
				strexevalue = String(vsb_test.TriggerEvent(pageup!))
			case 'PageDown!'
				strexevalue = String(vsb_test.TriggerEvent(pagedown!))
			case 'Moved!'
				strexevalue = String(vsb_test.TriggerEvent(Moved!))
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'TypeOf'
		if vsb_test.typeof() = vscrollbar! then
			strexevalue = 'vscrollbar!'
		else
			strexevalue = 'Invalid'
		end if
end choose

strtip =  "Return value is " + WordCap(strexevalue) + "."
st_tip.text = strtip



	
end event

type sle_functionparm from w_standard_ancestor2`sle_functionparm within tabpage_2
end type

type st_2 from w_standard_ancestor2`st_2 within tabpage_2
end type

type lb_function from w_standard_ancestor2`lb_function within tabpage_2
end type

event lb_function::selectionchanged;call super::selectionchanged;// Event:selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
lb_functionparm.Reset()
sle_functionparm.text = ''

choose case lb_function.selecteditem()
	case 'Move'
		wf_random('integer,integer',lb_functionparm)
	case 'PostEvent'
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')
//		lb_functionparm.additem('Help')
		lb_functionparm.additem('LineUp!')
		lb_functionparm.additem('LineDown!')
		lb_functionparm.additem('PageUp!')
		lb_functionparm.additem('PageDown!')
		lb_functionparm.additem('Moved!')
		return
	case 'Resize'
		wf_random('integer,integer',lb_functionparm)
	case 'SetPosition'		
		lb_functionparm.additem('ToTop!')
		lb_functionparm.additem('ToBottom!')
		lb_functionparm.additem('Behind!')
		return
	case 'SetRedraw'
		lb_functionparm.additem('True')
		lb_functionparm.additem('False')
		return
	case 'TriggerEvent'
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')
//		lb_functionparm.additem('Help!')
		lb_functionparm.additem('LineUp!')
		lb_functionparm.additem('LineDown!')
		lb_functionparm.additem('PageUp!')
		lb_functionparm.additem('PageDown!')
		lb_functionparm.additem('Moved!')
		return
end choose

end event

type lb_functionparm from w_standard_ancestor2`lb_functionparm within tabpage_2
end type

type tabpage_3 from w_standard_ancestor2`tabpage_3 within tab_1
integer width = 2185
end type

type cb_4 from w_standard_ancestor2`cb_4 within tabpage_3
integer x = 1746
integer height = 108
end type

type cb_3 from w_standard_ancestor2`cb_3 within tabpage_3
integer x = 1742
integer y = 560
integer height = 108
end type

type lb_out from w_standard_ancestor2`lb_out within tabpage_3
end type

type cb_2 from w_standard_ancestor2`cb_2 within w_vscrollbar_new
integer x = 1792
integer y = 1520
integer width = 402
integer height = 108
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_vscrollbar_new
integer x = 1769
integer width = 402
integer height = 108
end type

event cb_1::clicked;call super::clicked;// Event:clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
vsb_test.BringToTop = True
vsb_test.Height = 444
vsb_test.MaxPosition = 0
vsb_test.MinPosition = 0
vsb_test.Pointer = ''
vsb_test.Position = 0
vsb_test.StdWidth = True
vsb_test.TabOrder = 0
vsb_test.Tag = ''
vsb_test.Visible = True
vsb_test.Width = 73
vsb_test.X = 457
vsb_test.Y = 64

tab_1.tabpage_3.lb_out.reset()
end event

type st_tip from w_standard_ancestor2`st_tip within w_vscrollbar_new
integer width = 1655
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_vscrollbar_new
integer width = 1714
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_vscrollbar_new
integer width = 2222
end type

type vsb_test from vscrollbar within w_vscrollbar_new
integer x = 457
integer y = 64
integer width = 73
integer height = 444
boolean bringtotop = true
end type

event constructor;// Event:constructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_constructor]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Constructor Event'
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event destructor;// Event:Destructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_destructor]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Destructor Event'
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event getfocus;// Event:getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_sbnsetfocus]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Getfocus Event'
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event linedown;// Event:linedown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_sbnlinedown]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Linedown Event'
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event lineup;// Event:lineup()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_sbnlineup]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Lineup Event'
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event losefocus;// Event:losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_sbnkillfocus]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Losefocus Event'
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event moved;// Event:moved()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_sbnthumbtrack]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Moved Event'
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event pagedown;// Event:pagedown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_sbnpagedown]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Pagedown Event'
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event pageup;// Event:pageup()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_sbnpageup]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Pageup Event'
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event rbuttondown;// Event:rubttondown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_rbuttondown]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Rbuttondown Event'
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

type st_3 from statictext within w_vscrollbar_new
boolean visible = false
integer x = 78
integer y = 52
integer width = 178
integer height = 464
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

