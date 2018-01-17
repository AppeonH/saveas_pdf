$PBExportHeader$w_vtrackbar_new.srw
forward
global type w_vtrackbar_new from w_standard_ancestor2
end type
type vtb_test from vtrackbar within w_vtrackbar_new
end type
type st_3 from statictext within w_vtrackbar_new
end type
end forward

global type w_vtrackbar_new from w_standard_ancestor2
integer width = 2309
integer height = 1764
string title = "VTrackBar"
vtb_test vtb_test
st_3 st_3
end type
global w_vtrackbar_new w_vtrackbar_new

on w_vtrackbar_new.create
int iCurrent
call super::create
this.vtb_test=create vtb_test
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.vtb_test
this.Control[iCurrent+2]=this.st_3
end on

on w_vtrackbar_new.destroy
call super::destroy
destroy(this.vtb_test)
destroy(this.st_3)
end on

event ue_open;call super::ue_open;is_prop_data = "BringToTop,Height,LineSize,MaxPosition,MinPosition,PageSize,Pointer,Position,Slider,SliderSize,TabOrder,Tag,TickFrequency,TickMarks,Visible,Width,X,Y"
is_fuction_data = "ClassName,GetParent,Hide,Move,PointerX,PointerY,PostEvent,Resize,SelectionRange,SetFocus,SetPosition,SetRedraw,Show,TriggerEvent,TypeOf"

end event

type tab_1 from w_standard_ancestor2`tab_1 within w_vtrackbar_new
integer width = 2213
integer taborder = 50
end type

type tabpage_1 from w_standard_ancestor2`tabpage_1 within tab_1
integer width = 2176
end type

type cb_get from w_standard_ancestor2`cb_get within tabpage_1
integer x = 1733
integer y = 564
integer width = 402
integer height = 108
end type

event cb_get::clicked;call super::clicked;// Event:Clicked()
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
		ls_StrGetValue = String(vtb_test.BringToTop)
	case 'Height'
		ls_StrGetValue = String(vtb_test.Height)
	case 'LineSize'
		ls_StrGetValue = String(vtb_test.LineSize)
	case 'MaxPosition'
		ls_StrGetValue = String(vtb_test.MaxPosition)
	case 'MinPosition'
		ls_StrGetValue = String(vtb_test.MinPosition)
	case 'PageSize'
		ls_StrGetValue = String(vtb_test.PageSize)
	case 'Pointer'
		ls_StrGetValue = String(vtb_test.Pointer)
	case 'Position'
		ls_StrGetValue = String(vtb_test.Position)
	case 'Slider'
		ls_StrGetValue = String(vtb_test.Slider)	
	case 'SliderSize'
		ls_StrGetValue = String(vtb_test.SliderSize)
	case 'TabOrder'
		ls_StrGetValue = String(vtb_test.TabOrder)
	case 'Tag'
		ls_StrGetValue = String(vtb_test.Tag)
	case 'TickFrequency'
		ls_StrGetValue = String(vtb_test.TickFrequency)	
	case 'TickMarks'
		if vtb_test.TickMarks = vticksonleft! then
			ls_StrGetValue = 'VTicksOnTop!'
		elseif vtb_test.TickMarks = vticksonright! then
			ls_StrGetValue = 'VTicksOnBottom!'
		elseif vtb_test.TickMarks = vTicksOnBoth! then
			ls_StrGetValue = 'VTicksOnBoth!'
		elseif vtb_test.TickMarks = vTicksOnNeither! then
			ls_StrGetValue = 'VTicksOnNeither!'
		end if
	case 'Visible'
		ls_StrGetValue = String(vtb_test.Visible)
	case 'Width'
		ls_StrGetValue = String(vtb_test.Width)
	case 'X'
		ls_StrGetValue = String(vtb_test.X)
	case 'Y'
		ls_StrGetValue = String(vtb_test.Y)
	end choose
ls_StrTip = "The VTrackBar " + lb_prop.selecteditem() + " get value is " + WordCap(ls_StrGetValue) + "." 
st_tip.text = ls_StrTip

end event

type cb_set from w_standard_ancestor2`cb_set within tabpage_1
integer x = 1737
integer y = 692
integer width = 402
integer height = 108
end type

event cb_set::clicked;call super::clicked;// Event:Clicked()
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
		if lower(ls_PropTestValue) = 'true' then
			vtb_test.BringToTop = True
		elseif lower(ls_PropTestValue) = 'false' then
			vtb_test.BringToTop = False
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Height'
		if IsNumber(ls_PropTestValue) then
			vtb_test.Height = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'LineSize'
		if IsNumber(ls_PropTestValue) then
			vtb_test.LineSize = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'MaxPosition'
		if IsNumber(ls_PropTestValue) then
			vtb_test.MaxPosition = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'MinPosition'
		if IsNumber(ls_PropTestValue) then
			vtb_test.MinPosition = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'PageSize'
		if IsNumber(ls_PropTestValue) then
			vtb_test.PageSize = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Pointer' 
		vtb_test.Pointer = ls_PropTestValue 
	case 'Position'
		if IsNumber(ls_PropTestValue) then
			vtb_test.Position = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Slider'
		if lower(ls_PropTestValue) = 'true' then
			vtb_test.Slider = True
		elseif lower(ls_PropTestValue) = 'false' then
			vtb_test.Slider = False
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'SliderSize'
		if IsNumber(ls_PropTestValue) then
			vtb_test.SliderSize = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'TabOrder'
		if IsNumber(ls_PropTestValue) then
			vtb_test.TabOrder = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Tag'
		vtb_test.Tag = ls_PropTestValue
	case 'TickFrequency'
		if IsNumber(ls_PropTestValue) then
			vtb_test.TickFrequency = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if	
	case 'TickMarks'
		if ls_PropTestValue = 'VTicksOnTop!' then
			vtb_test.TickMarks = vticksonleft!
		elseif ls_PropTestValue = 'VTicksOnBottom!' then
			vtb_test.TickMarks = vticksonright!
		elseif ls_PropTestValue = 'VTicksOnBoth!' then
			vtb_test.TickMarks = vTicksOnBoth!	
		elseif ls_PropTestValue = 'VTicksOnNeither!' then
			vtb_test.TickMarks = vTicksOnNeither!	
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if		
	case 'Visible'
		if lower(ls_PropTestValue) = 'true' then
			vtb_test.Visible = True
		elseif lower(ls_PropTestValue) = 'false' then
			vtb_test.Visible = False
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Width'
		if IsNumber(ls_PropTestValue) then
			vtb_test.Width = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'X'
		if IsNumber(ls_PropTestValue) then
			vtb_test.X = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Y'
		if IsNumber(ls_PropTestValue) then
			vtb_test.Y = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	end choose
	strtip = "The VTrackBar " + lb_prop.selecteditem() + " set value is " + WordCap(ls_PropTestValue) + "." 
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
	case 'BringToTop'
		wf_random('boolean',lb_propparm)		
	case 'Height'
		wf_random('integer',lb_propparm)
	case 'LineSize'
		wf_random('integer',lb_propparm)
	case 'MaxPosition'
		wf_random('integer',lb_propparm)
	case 'MinPosition'
		wf_random('integer',lb_propparm)
	case 'PageSize'
		wf_random('integer',lb_propparm)
	CASE 'Pointer'  
		lb_propparm.additem('Arrow!')
		lb_propparm.additem('Beam!')
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
		wf_random('integer',lb_propparm)
	case 'Slider'
		wf_random('boolean',lb_propparm)			
	case 'SliderSize'
		wf_random('integer',lb_propparm)	
	case 'TabOrder'
		wf_random('integer',lb_propparm)
	case 'Tag'
		wf_random('string',lb_propparm)
	case 'TickFrequency'
		wf_random('integer',lb_propparm)		
	case 'TickMarks'
		lb_propparm.additem('VTicksOnTop!')
		lb_propparm.additem('VTicksOnBottom!')
		lb_propparm.additem('VTicksOnBoth!')
		lb_propparm.additem('VTicksOnNeither!')
	case 'Visible'
		wf_random('boolean',lb_propparm)
	case 'Width'
		wf_random('integer',lb_propparm)
	case 'X'
		wf_random('integer',lb_propparm)
	case 'Y'
		wf_random('integer',lb_propparm)
end choose

end event

type sle_propparm from w_standard_ancestor2`sle_propparm within tabpage_1
end type

type tabpage_2 from w_standard_ancestor2`tabpage_2 within tab_1
integer width = 2176
end type

type cb_execute from w_standard_ancestor2`cb_execute within tabpage_2
integer x = 1737
integer y = 692
integer width = 402
integer height = 108
end type

event cb_execute::clicked;call super::clicked;// Event:Clicked()
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
		strexevalue = vtb_test.ClassName() 
	case 'GetParent'
		lpowero_parent = vtb_test.GetParent()
		strexevalue = lpowero_parent.ClassName()
	case 'Hide'
		strexevalue = String(vtb_test.Hide()) 
	case 'Move'
		if parmnumber <> 2 then 
			MessageBox('Warning','Parameter number should be 2.')
			return
		elseif IsNumber(strar[1]) and IsNumber(strar[2]) then
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vtb_test.Move(intx,inty))
		else
			MessageBox('Warning','Parameter type error.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vtb_test.Move(intx,inty))
			return
		end if
	case 'PointerX'
		strexevalue = String(vtb_test.PointerX()) 
	case 'PointerY'
		strexevalue = String(vtb_test.PointerY()) 
	case 'PostEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(vtb_test.PostEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(vtb_test.PostEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(vtb_test.PostEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(vtb_test.PostEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(vtb_test.PostEvent(RButtonDown!))
			case 'Help'
				strexevalue = String(vtb_test.PostEvent('Help'))
			case 'LineDown!'
				strexevalue = String(vtb_test.PostEvent(linedown!))
			case 'LineUp!'
				strexevalue = String(vtb_test.PostEvent(lineup!))
			case 'PageDown!'
				strexevalue = String(vtb_test.PostEvent(pagedown!))
			case 'PageUp!'
				strexevalue = String(vtb_test.PostEvent(pageup!))	
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
	  		strexevalue = String(vtb_test.Resize(intx,inty))
		else
			MessageBox('Warning','Parameter type error.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vtb_test.Resize(intx,inty))
		end if
	case 'SelectionRange'
		if parmnumber <> 2 then 
			MessageBox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(strar[1]) and isnumber(strar[2]) then
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vtb_test.SelectionRange(intx,inty))
		else
			MessageBox('Warning','Parameter type error.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vtb_test.SelectionRange(intx,inty))
		end if
	case 'SetFocus'
		strexevalue = String(vtb_test.SetFocus())
	case 'SetPosition'
		choose case strtestvalue
			case 'Behind!'
				strexevalue = String(vtb_test.SetPosition(Behind!,st_3))
			case 'ToTop!'
				strexevalue = String(vtb_test.SetPosition(ToTop!)) 
			case 'ToBottom!'
				strexevalue = String(vtb_test.SetPosition(ToBottom!))
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'SetRedraw'
		if lower(strtestvalue) = 'true'  then
			strexevalue = String(vtb_test.SetRedraw(True))
		elseif  lower(strtestvalue) = 'false' then
			strexevalue = String(vtb_test.SetRedraw(False))
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Show'
		strexevalue = String(vtb_test.Show())
	case 'TriggerEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(vtb_test.TriggerEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(vtb_test.TriggerEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(vtb_test.TriggerEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(vtb_test.TriggerEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(vtb_test.TriggerEvent(RButtonDown!))
			case 'Help'
				strexevalue = String(vtb_test.TriggerEvent('Help'))
			case 'LineDown!'
				strexevalue = String(vtb_test.TriggerEvent(linedown!))
			case 'LineUp!'
				strexevalue = String(vtb_test.TriggerEvent(lineup!))
			case 'PageDown!'
				strexevalue = String(vtb_test.TriggerEvent(pagedown!))
			case 'PageUp!'
				strexevalue = String(vtb_test.TriggerEvent(pageup!))	
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'TypeOf'
		if vtb_test.typeof() = vtrackbar! then
			strexevalue = 'VTrackBar!'
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

event lb_function::selectionchanged;call super::selectionchanged;st_3.visible = False
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
		lb_functionparm.additem('LineDown!')
		lb_functionparm.additem('LineUp!')
		lb_functionparm.additem('PageDown!')
		lb_functionparm.additem('PageUp!')
		return
	case 'Resize'
		wf_random('integer,integer',lb_functionparm)
	case 'SelectionRange'
//		wf_random('integer,integer',lb_functionparm)
		lb_functionparm.additem('1,10')
		lb_functionparm.additem('50,80')
		lb_functionparm.additem('20,100')
		lb_functionparm.additem('60,300')
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
//		lb_functionparm.additem('Help')
		lb_functionparm.additem('LineDown!')
		lb_functionparm.additem('LineUp!')
		lb_functionparm.additem('PageDown!')
		lb_functionparm.additem('PageUp!')
		return
end choose

end event

type lb_functionparm from w_standard_ancestor2`lb_functionparm within tabpage_2
end type

type tabpage_3 from w_standard_ancestor2`tabpage_3 within tab_1
integer width = 2176
end type

type cb_4 from w_standard_ancestor2`cb_4 within tabpage_3
integer x = 1742
integer y = 692
integer height = 108
end type

type cb_3 from w_standard_ancestor2`cb_3 within tabpage_3
integer x = 1742
integer y = 560
integer height = 108
end type

type lb_out from w_standard_ancestor2`lb_out within tabpage_3
end type

type cb_2 from w_standard_ancestor2`cb_2 within w_vtrackbar_new
integer x = 1778
integer y = 1528
integer width = 402
integer height = 108
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_vtrackbar_new
integer x = 1778
integer width = 402
integer height = 108
end type

event cb_1::clicked;call super::clicked;// Event:Clicked()
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
vtb_test.BringToTop = True
vtb_test.Height = 468
vtb_test.LineSize = 0
vtb_test.MaxPosition = 100
vtb_test.MinPosition = 0
vtb_test.PageSize = 0
vtb_test.Pointer = ''
vtb_test.Position = 0
vtb_test.Slider = true
vtb_test.SliderSize = 0
vtb_test.TabOrder = 0
vtb_test.Tag = ''
vtb_test.TickFrequency = 10
vtb_test.TickMarks = vticksonright!
vtb_test.Visible = True
vtb_test.Width = 146
vtb_test.X = 457
vtb_test.Y = 48

tab_1.tabpage_3.lb_out.reset()
end event

type st_tip from w_standard_ancestor2`st_tip within w_vtrackbar_new
integer width = 1646
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_vtrackbar_new
integer width = 1714
integer taborder = 40
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_vtrackbar_new
integer width = 2213
end type

type vtb_test from vtrackbar within w_vtrackbar_new
integer x = 457
integer y = 48
integer width = 146
integer height = 468
boolean bringtotop = true
integer maxposition = 100
integer tickfrequency = 10
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

event destructor;// Event:destructor()
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
// Returns: long [pbm_linedown]
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
// Returns: long [pbm_pagedown]
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

type st_3 from statictext within w_vtrackbar_new
boolean visible = false
integer x = 82
integer y = 56
integer width = 192
integer height = 448
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

