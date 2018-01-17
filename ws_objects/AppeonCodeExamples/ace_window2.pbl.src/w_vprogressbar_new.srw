$PBExportHeader$w_vprogressbar_new.srw
forward
global type w_vprogressbar_new from w_standard_ancestor2
end type
type vpb_test from vprogressbar within w_vprogressbar_new
end type
type st_3 from statictext within w_vprogressbar_new
end type
end forward

global type w_vprogressbar_new from w_standard_ancestor2
integer width = 2313
integer height = 1756
string title = "VProgressBar"
vpb_test vpb_test
st_3 st_3
end type
global w_vprogressbar_new w_vprogressbar_new

type variables

end variables

on w_vprogressbar_new.create
int iCurrent
call super::create
this.vpb_test=create vpb_test
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.vpb_test
this.Control[iCurrent+2]=this.st_3
end on

on w_vprogressbar_new.destroy
call super::destroy
destroy(this.vpb_test)
destroy(this.st_3)
end on

event ue_open;call super::ue_open;is_prop_data = "BringToTop,Height,MaxPosition,MinPosition,Pointer,Position,SetStep,SmoothScroll,TabOrder,Tag,Visible,Width,X,Y"
is_fuction_data = "ClassName,GetParent,Hide,Move,OffsetPos,PointerX,PointerY,PostEvent,Resize,SetFocus,SetPosition,SetRange,SetRedraw,Show,StepIt,TriggerEvent,TypeOf"
end event

type tab_1 from w_standard_ancestor2`tab_1 within w_vprogressbar_new
integer width = 2213
integer taborder = 50
end type

type tabpage_1 from w_standard_ancestor2`tabpage_1 within tab_1
integer width = 2176
end type

type cb_get from w_standard_ancestor2`cb_get within tabpage_1
integer x = 1733
integer y = 560
integer width = 402
integer height = 108
end type

event cb_get::clicked;call super::clicked;// Event: Clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
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
		ls_StrGetValue = String(vpb_test.BringToTop)
	case 'Height'
		ls_StrGetValue = String(vpb_test.Height)
	case 'MaxPosition'
		ls_StrGetValue = String(vpb_test.MaxPosition)
	case 'MinPosition'
		ls_StrGetValue = String(vpb_test.MinPosition)
	case 'Pointer'
		ls_StrGetValue = String(vpb_test.Pointer)
	case 'Position'
		ls_StrGetValue = String(vpb_test.Position)
	case 'SetStep'
		ls_StrGetValue = String(vpb_test.SetStep)	
	case 'SmoothScroll'
		ls_StrGetValue = String(vpb_test.SmoothScroll)
	case 'TabOrder'
		ls_StrGetValue = String(vpb_test.TabOrder)
	case 'Tag'
		ls_StrGetValue = String(vpb_test.Tag)
	case 'Visible'
		ls_StrGetValue = String(vpb_test.Visible)
	case 'Width'
		ls_StrGetValue = String(vpb_test.Width)
	case 'X'
		ls_StrGetValue = String(vpb_test.X)
	case 'Y'
		ls_StrGetValue = String(vpb_test.Y)
	end choose
ls_StrTip = "The VProgressBar " + lb_prop.selecteditem() + " get value is " + WordCap(ls_StrGetValue) + "." 
st_tip.text = ls_StrTip

end event

type cb_set from w_standard_ancestor2`cb_set within tabpage_1
integer x = 1737
integer width = 402
integer height = 108
end type

event cb_set::clicked;call super::clicked;// Event: Clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
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
		if lower(ls_PropTestValue) = 'true'  then
			vpb_test.BringToTop = True
		elseif lower(ls_PropTestValue) = 'false' then
			vpb_test.BringToTop = False			
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Height'
		if IsNumber(ls_PropTestValue) then
			vpb_test.Height = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'MaxPosition'
		if IsNumber(ls_PropTestValue) then
			vpb_test.MaxPosition = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'MinPosition'
		if IsNumber(ls_PropTestValue) then
			vpb_test.MinPosition = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Pointer' 
		vpb_test.Pointer = ls_PropTestValue 
	case 'Position'
		if IsNumber(ls_PropTestValue) then
			vpb_test.Position = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'SetStep'
		if IsNumber(ls_PropTestValue) then
			vpb_test.SetStep = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if	
	case 'SmoothScroll'
		if lower(ls_PropTestValue) = 'true'  then
			vpb_test.SmoothScroll = True
		elseif lower(ls_PropTestValue) = 'false' then
			vpb_test.SmoothScroll = False
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'TabOrder'
		if IsNumber(ls_PropTestValue) then
			vpb_test.TabOrder = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Tag'
		vpb_test.Tag = ls_PropTestValue
	case 'Visible'
		if lower(ls_PropTestValue) = 'true'  then
			vpb_test.Visible = true
		elseif lower(ls_PropTestValue) = 'false' then
			vpb_test.Visible = false
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Width'
		if IsNumber(ls_PropTestValue) then
			vpb_test.Width = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'X'
		if IsNumber(ls_PropTestValue) then
			vpb_test.X = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Y'
		if IsNumber(ls_PropTestValue) then
			vpb_test.Y = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	end choose
	strtip = "The VProgressBar " + lb_prop.selecteditem() + " set value is " + WordCap(ls_PropTestValue) + "." 
	st_tip.text = strtip
	
end event

type st_1 from w_standard_ancestor2`st_1 within tabpage_1
end type

type lb_propparm from w_standard_ancestor2`lb_propparm within tabpage_1
end type

type lb_prop from w_standard_ancestor2`lb_prop within tabpage_1
end type

event lb_prop::selectionchanged;call super::selectionchanged;// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
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
	case 'MaxPosition'
		wf_random('integer',lb_propparm)
	case 'MinPosition'
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
	case 'SetStep'
		wf_random('integer',lb_propparm)
	case 'SmoothScroll'
		wf_random('boolean',lb_propparm)
	case 'TabOrder'
		wf_random('integer',lb_propparm)
	case 'Tag'
		wf_random('string',lb_propparm)
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
integer y = 684
integer width = 402
integer height = 108
end type

event cb_execute::clicked;call super::clicked;// Event: Clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
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
		strexevalue = vpb_test.ClassName() 
	case 'GetParent'
		lpowero_parent = vpb_test.GetParent()
		strexevalue = lpowero_parent.ClassName()
	case 'Hide'
		strexevalue = String(vpb_test.Hide()) 
	case 'Move'
		if parmnumber <> 2 then 
			MessageBox('Warning','Parameter number should be 2.')
			return
		elseif IsNumber(strar[1]) and IsNumber(strar[2]) then
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vpb_test.Move(intx,inty))
		else
			MessageBox('Warning','Parameter type error.Type will be converted.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vpb_test.Move(intx,inty))
			return
		end if
	case 'OffsetPos'
		if parmnumber <> 1 then
			MessageBox('Warning','Parameter number should be 1.')
			return
		elseif IsNumber(strtestvalue) then
			strexevalue = String(vpb_test.OffsetPos(Integer(strtestvalue))) 
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'PointerX'
		strexevalue = String(vpb_test.PointerX()) 
	case 'PointerY'
		strexevalue = String(vpb_test.PointerY()) 
	case 'PostEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(vpb_test.PostEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(vpb_test.PostEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(vpb_test.PostEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(vpb_test.PostEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(vpb_test.PostEvent(RButtonDown!))
			case 'Help'
				strexevalue = String(vpb_test.PostEvent('Help'))
			case 'Clicked!'
				strexevalue = String(vpb_test.PostEvent(Clicked!))
			case 'DoubleClicked!'
				strexevalue = String(vpb_test.PostEvent(DoubleClicked!))
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
	  		strexevalue = String(vpb_test.Resize(intx,inty))
		else
			MessageBox('Warning','Parameter type error.Type will be converted')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vpb_test.Resize(intx,inty))
		end if
	case 'SetFocus'
		strexevalue = String(vpb_test.SetFocus())
	case 'SetPosition'
		choose case strtestvalue
			case 'Behind!'
				strexevalue = String(vpb_test.SetPosition(Behind!,st_3))
				
			case 'ToTop!'
				strexevalue = String(vpb_test.SetPosition(ToTop!)) 
				
			case 'ToBottom!'
				strexevalue = String(vpb_test.SetPosition(ToBottom!))
			
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'SetRange'
		if parmnumber <> 2 then 
			MessageBox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(strar[1]) and isnumber(strar[2]) then
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vpb_test.SetRange(intx,inty))
		else
			MessageBox('Warning','Parameter type error.Type will be converted.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(vpb_test.SetRange(intx,inty))
		end if	
	case 'SetRedraw'
		if lower(strtestvalue) = 'true' then
			strexevalue = String(vpb_test.SetRedraw(True))
		elseif lower(strtestvalue) = 'false' then
			strexevalue = String(vpb_test.SetRedraw(False))
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Show'
		strexevalue = String(vpb_test.Show())
	case 'StepIt'
		strexevalue = String(vpb_test.StepIt())	
	case 'TriggerEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(vpb_test.TriggerEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(vpb_test.TriggerEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(vpb_test.TriggerEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(vpb_test.TriggerEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(vpb_test.TriggerEvent(RButtonDown!))
			case 'Help'
				strexevalue = String(vpb_test.TriggerEvent('Help'))
			case 'Clicked!'
				strexevalue = String(vpb_test.TriggerEvent(Clicked!))
			case 'DoubleClicked!'
				strexevalue = String(vpb_test.TriggerEvent(DoubleClicked!))
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'TypeOf'
		if vpb_test.typeof() = vprogressbar! then
			strexevalue = 'vprogressbar!'
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

event lb_function::selectionchanged;call super::selectionchanged;// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
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
	case 'OffsetPos'
		wf_random('integer',lb_functionparm)	
	case 'PostEvent'
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')
//		lb_functionparm.additem('Help')
		lb_functionparm.additem('Clicked!')
		lb_functionparm.additem('DoubleClicked!')
		return
	case 'Resize'
		wf_random('integer,integer',lb_functionparm)
	case 'SetPosition'		
		lb_functionparm.additem('ToTop!')
		lb_functionparm.additem('ToBottom!')
		lb_functionparm.additem('Behind!')
		return
	case 'SetRange'
//		wf_random('integer,integer',lb_functionparm)
		lb_functionparm.additem('1,10')
		lb_functionparm.additem('50,80')
		lb_functionparm.additem('20,100')
		lb_functionparm.additem('60,300')
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
		lb_functionparm.additem('Clicked!')
		lb_functionparm.additem('DoubleClicked!')
		return
end choose

end event

type lb_functionparm from w_standard_ancestor2`lb_functionparm within tabpage_2
end type

type tabpage_3 from w_standard_ancestor2`tabpage_3 within tab_1
integer width = 2176
end type

type cb_4 from w_standard_ancestor2`cb_4 within tabpage_3
integer x = 1737
integer y = 692
integer height = 108
end type

type cb_3 from w_standard_ancestor2`cb_3 within tabpage_3
integer x = 1737
integer y = 556
integer height = 108
end type

type lb_out from w_standard_ancestor2`lb_out within tabpage_3
end type

type cb_2 from w_standard_ancestor2`cb_2 within w_vprogressbar_new
integer x = 1783
integer y = 1520
integer width = 402
integer height = 108
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_vprogressbar_new
integer x = 1783
integer width = 402
integer height = 108
end type

event cb_1::clicked;call super::clicked;// Event: Clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
 vpb_test.BringToTop =True
 vpb_test.Height = 444
 vpb_test.MaxPosition = 100
 vpb_test.MinPosition = 0
 vpb_test.Pointer = ''
 vpb_test.Position = 50
 vpb_test.SetStep = 10
 vpb_test.SmoothScroll = False
 vpb_test.TabOrder = 0
 vpb_test.Tag = ''
 vpb_test.Visible = True
 vpb_test.Width = 73
 vpb_test.X = 457
 vpb_test.Y = 64
end event

type st_tip from w_standard_ancestor2`st_tip within w_vprogressbar_new
integer width = 1669
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_vprogressbar_new
integer width = 1714
integer taborder = 40
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_vprogressbar_new
integer width = 2217
end type

type vpb_test from vprogressbar within w_vprogressbar_new
integer x = 457
integer y = 64
integer width = 73
integer height = 444
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_lbuttondown]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Clicked Event'
tab_1.tabpage_3.lb_out.additem(ls_item)




end event

event constructor;// Event: constructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_constructor]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
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

event destructor;// Event: destructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_destructor]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
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

event doubleclicked;// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_lbuttondblclk]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Doubleclicked Event'
tab_1.tabpage_3.lb_out.additem(ls_item)

end event

event getfocus;// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_setfocus]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
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

event losefocus;// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_killfocus]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
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

event rbuttondown;// Event: rbuttondown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_rbuttondown]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/10/20
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

type st_3 from statictext within w_vprogressbar_new
boolean visible = false
integer x = 87
integer y = 52
integer width = 151
integer height = 460
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

