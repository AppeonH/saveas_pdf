$PBExportHeader$w_htrackbar_new.srw
forward
global type w_htrackbar_new from w_standard_ancestor2
end type
type htb_test from htrackbar within w_htrackbar_new
end type
type st_3 from statictext within w_htrackbar_new
end type
end forward

global type w_htrackbar_new from w_standard_ancestor2
integer width = 2322
integer height = 1760
string title = "HTrackBar"
htb_test htb_test
st_3 st_3
end type
global w_htrackbar_new w_htrackbar_new

on w_htrackbar_new.create
int iCurrent
call super::create
this.htb_test=create htb_test
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.htb_test
this.Control[iCurrent+2]=this.st_3
end on

on w_htrackbar_new.destroy
call super::destroy
destroy(this.htb_test)
destroy(this.st_3)
end on

event ue_open;call super::ue_open;is_prop_data = "BringToTop,Height,MaxPosition,MinPosition,Pointer,Position,LineSize," + &
			 "TabOrder,Tag,Visible,Width,PageSize,Slider,SliderSize,TickFrequency,TickMarks,X,Y"


is_fuction_data = "ClassName,GetParent,Hide,Move,PointerX,PointerY,PostEvent,Resize," + &
				  "SetFocus,SetPosition,SetRedraw,Show,TriggerEvent,SelectionRange,TypeOf"

end event

type tab_1 from w_standard_ancestor2`tab_1 within w_htrackbar_new
integer width = 2226
end type

type tabpage_1 from w_standard_ancestor2`tabpage_1 within tab_1
integer width = 2190
end type

type cb_get from w_standard_ancestor2`cb_get within tabpage_1
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
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
if lb_prop.SelectedIndex() < 0 then
	MessageBox('Warning','Please select testing property.')
	return
end if

string ls_StrGetValue , ls_StrTip

choose case lb_prop.selecteditem()
	case 'BringToTop'
		ls_StrGetValue = String(htb_test.BringToTop)
	case 'Height'
		ls_StrGetValue = String(htb_test.Height)
	case 'MaxPosition'
		ls_StrGetValue = String(htb_test.MaxPosition)
	case 'MinPosition'
		ls_StrGetValue = String(htb_test.MinPosition)
	case 'Pointer' 
		ls_StrGetValue = String(htb_test.Pointer)
	case 'Position'
		ls_StrGetValue = String(htb_test.Position)
	case 'LineSize'
		ls_StrGetValue = String(htb_test.LineSize)
	case 'TabOrder'
		ls_StrGetValue = String(htb_test.TabOrder)
	case 'Tag'
		ls_StrGetValue = String(htb_test.Tag)
	case 'Visible'
		ls_StrGetValue = String(htb_test.Visible)
	case 'Width'
		ls_StrGetValue = String(htb_test.Width)
	case 'PageSize'
		ls_StrGetValue = String(htb_test.PageSize)
	case 'Slider'
		ls_StrGetValue = String(htb_test.Slider)
	case 'SliderSize'
		ls_StrGetValue = String(htb_test.SliderSize)
	case 'TickFrequency'
		ls_StrGetValue = String(htb_test.TickFrequency)
	case 'TickMarks'
		choose case htb_test.TickMarks
			    case hticksonboth!
					ls_StrGetValue = 'hticksonboth!'
				 case hticksonbottom!
					ls_StrGetValue = 'hticksonbottom!'
				 case hticksonneither!
					ls_StrGetValue ='hticksonneither!'
				 case hticksontop!
					ls_StrGetValue ='hticksontop!'
		end choose		
	case 'X'
		ls_StrGetValue = String(htb_test.X)
	case 'Y'
		ls_StrGetValue = String(htb_test.Y)
	end choose
ls_StrTip = "The HTrackBar " + lb_prop.selecteditem() + " get value is " + WordCap(ls_StrGetValue) + "." 
st_tip.text = ls_StrTip

end event

type cb_set from w_standard_ancestor2`cb_set within tabpage_1
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
		choose case lower(ls_PropTestValue) 
			    case 'true' 
					   htb_test.BringToTop = True
						
				 case 'false' 
			          htb_test.BringToTop = False
						 
		       case else
			         MessageBox('Warning','Parameter type error.')
			         return
	   end choose
	case 'Height'
		if IsNumber(ls_PropTestValue) then
			htb_test.Height = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'MaxPosition'
		if IsNumber(ls_PropTestValue) then
			htb_test.MaxPosition = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'MinPosition'
		if IsNumber(ls_PropTestValue) then
			htb_test.MinPosition = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Pointer' 
		htb_test.Pointer = ls_PropTestValue 
	case 'Position'
		if IsNumber(ls_PropTestValue) then
			htb_test.Position = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'LineSize'
		if IsNumber(ls_PropTestValue) then
			htb_test.LineSize = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'TabOrder'
		if IsNumber(ls_PropTestValue) then
			htb_test.TabOrder = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Tag'
		htb_test.Tag = ls_PropTestValue
	case 'Visible'
		if lower(ls_PropTestValue) = 'true'  then
			htb_test.Visible = True
		elseif lower(ls_PropTestValue) = 'false' then
			htb_test.Visible = False
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Width'
		if IsNumber(ls_PropTestValue) then
			htb_test.Width = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'PageSize'
		if IsNumber(ls_PropTestValue) then
			htb_test.PageSize = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Slider'
		if lower(ls_PropTestValue) = 'true'  then
			htb_test.Slider = true
		elseif lower(ls_PropTestValue) = 'false' then
			htb_test.Slider = false
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'SliderSize'
		if IsNumber(ls_PropTestValue) then
			htb_test.SliderSize = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'TickFrequency'
		if IsNumber(ls_PropTestValue) then
			htb_test.TickFrequency = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'TickMarks'
		   choose case ls_PropTestValue 
				case 'hticksonboth!'
					   htb_test.TickMarks = hticksonboth!
				case 'hticksonbottom!'
					   htb_test.TickMarks = hticksonbottom!
				case 'hticksonneither!'
					   htb_test.TickMarks = hticksonneither!
				case 'hticksontop!'
					   htb_test.TickMarks = hticksontop!
				case else
					MessageBox('Warning','Parameter type error.')
			      return
			end choose
	case 'X'
		if IsNumber(ls_PropTestValue) then
			htb_test.X = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Y'
		if IsNumber(ls_PropTestValue) then
			htb_test.Y = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	end choose
	strtip = "The HTrackBar " + lb_prop.selecteditem() + " set value is " + WordCap(ls_PropTestValue) + "." 
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
		wf_random('integer',lb_propparm)
	case 'MaxPosition'
		wf_random('integer',lb_propparm)
	case 'MinPosition'
		wf_random('integer',lb_propparm)
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
		wf_random('integer',lb_propparm)
	case 'LineSize'		
		wf_random('integer',lb_propparm)
	case 'TabOrder'
		wf_random('integer',lb_propparm)
	case 'Tag'
		wf_random('string',lb_propparm)
	case 'Visible'
		wf_random('boolean',lb_propparm)
	case 'Width'
		wf_random('integer',lb_propparm)
	case 'PageSize'		
		wf_random('integer',lb_propparm)
	case 'Slider'
		wf_random('boolean',lb_propparm)
	case 'SliderSize'		
		wf_random('integer',lb_propparm)
	case 'TickFrequency'		
		wf_random('integer',lb_propparm)
	case 'TickMarks'	
		lb_propparm.additem('hticksonboth!')
		lb_propparm.additem('hticksonbottom!')
		lb_propparm.additem('hticksonneither!')
		lb_propparm.additem('hticksontop!')
	case 'X'
		wf_random('integer',lb_propparm)
	case 'Y'
		wf_random('integer',lb_propparm)
end choose

end event

type sle_propparm from w_standard_ancestor2`sle_propparm within tabpage_1
end type

type tabpage_2 from w_standard_ancestor2`tabpage_2 within tab_1
integer width = 2190
end type

type cb_execute from w_standard_ancestor2`cb_execute within tabpage_2
integer x = 1751
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
		strexevalue = htb_test.ClassName() 
	case 'GetParent'
		lpowero_parent = htb_test.GetParent()
		strexevalue = lpowero_parent.ClassName()
	case 'Hide'
		strexevalue = String(htb_test.Hide()) 
	case 'Move'
		if parmnumber <> 2 then 
			MessageBox('Warning','Parameter number should be 2.')
			return
		elseif IsNumber(strar[1]) and IsNumber(strar[2]) then
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(htb_test.Move(intx,inty))
		else
			MessageBox('Warning','Parameter type error.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(htb_test.Move(intx,inty))
			return
		end if
	case 'PointerX'
		strexevalue = String(htb_test.PointerX()) 
	case 'PointerY'
		strexevalue = String(htb_test.PointerY()) 
	case 'PostEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(htb_test.PostEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(htb_test.PostEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(htb_test.PostEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(htb_test.PostEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(htb_test.PostEvent(RButtonDown!))
			case 'Help'
				strexevalue = String(htb_test.PostEvent('Help'))
			case 'LineLeft!'
				strexevalue = String(htb_test.PostEvent(LineLeft!))
			case 'LineRight!'
				strexevalue = String(htb_test.PostEvent(LineRight!))
			case 'PageLeft!'
				strexevalue = String(htb_test.PostEvent(PageLeft!))
			case 'PageRight!'
				strexevalue = String(htb_test.PostEvent(PageRight!))
			case 'Moved!'
				strexevalue = String(htb_test.PostEvent(Moved!))
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
	  		strexevalue = String(htb_test.Resize(intx,inty))
		else
			MessageBox('Warning','Parameter type error.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(htb_test.Resize(intx,inty))
		end if
	case 'SelectionRange'
		if parmnumber <> 2 then 
			MessageBox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(strar[1]) and isnumber(strar[2]) then
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(htb_test.SelectionRange(intx,inty))
		else
			MessageBox('Warning','Parameter type error.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(htb_test.SelectionRange(intx,inty))
		end if
	case 'SetFocus'
		strexevalue = String(htb_test.SetFocus())
	case 'SetPosition'
		choose case strtestvalue
			case 'Behind!'
				strexevalue = String(htb_test.SetPosition(Behind!,st_3))
				
			case 'ToTop!'
				strexevalue = String(htb_test.SetPosition(ToTop!)) 
				
			case 'ToBottom!'
				strexevalue = String(htb_test.SetPosition(ToBottom!))
				
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'SetRedraw'
		if lower(strtestvalue) = 'true'  then
			strexevalue = String(htb_test.SetRedraw(True))
		elseif lower(strtestvalue) = 'false' then
			strexevalue = String(htb_test.SetRedraw(False))			
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Show'
		strexevalue = String(htb_test.Show())
	case 'TriggerEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(htb_test.TriggerEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(htb_test.TriggerEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(htb_test.TriggerEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(htb_test.TriggerEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(htb_test.TriggerEvent(RButtonDown!))
			case 'Help'
				strexevalue = String(htb_test.TriggerEvent('Help'))
			case 'LineLeft!'
				strexevalue = String(htb_test.TriggerEvent(LineLeft!))
			case 'LineRight!'
				strexevalue = String(htb_test.TriggerEvent(LineRight!))
			case 'PageLeft!'
				strexevalue = String(htb_test.TriggerEvent(PageLeft!))
			case 'PageRight!'
				strexevalue = String(htb_test.TriggerEvent(PageRight!))
			case 'Moved!'
				strexevalue = String(htb_test.TriggerEvent(Moved!))
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'TypeOf'
		if htb_test.typeof() = HTrackBar! then
			strexevalue = 'HTrackBar!'
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
	case 'SelectionRange'
//		wf_random('integer,integer',lb_functionparm)
		lb_functionparm.additem('1,10')
		lb_functionparm.additem('50,80')
		lb_functionparm.additem('20,100')
		lb_functionparm.additem('60,300')
		return
	case 'PostEvent'
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')
		lb_functionparm.additem('RButtonDown!')
//		lb_functionparm.additem('Help')
		lb_functionparm.additem('LineLeft!')
		lb_functionparm.additem('LineRight!')
		lb_functionparm.additem('PageLeft!')
		lb_functionparm.additem('PageRight!')
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
//		lb_functionparm.additem('Help')
		lb_functionparm.additem('LineLeft!')
		lb_functionparm.additem('LineRight!')
		lb_functionparm.additem('PageLeft!')
		lb_functionparm.additem('PageRight!')
		lb_functionparm.additem('Moved!')
		return
end choose

end event

type lb_functionparm from w_standard_ancestor2`lb_functionparm within tabpage_2
end type

type tabpage_3 from w_standard_ancestor2`tabpage_3 within tab_1
integer width = 2190
end type

type cb_4 from w_standard_ancestor2`cb_4 within tabpage_3
integer x = 1746
integer height = 108
end type

type cb_3 from w_standard_ancestor2`cb_3 within tabpage_3
integer x = 1746
integer y = 564
integer height = 108
end type

type lb_out from w_standard_ancestor2`lb_out within tabpage_3
end type

type cb_2 from w_standard_ancestor2`cb_2 within w_htrackbar_new
integer x = 1797
integer y = 1524
integer width = 402
integer height = 108
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_htrackbar_new
integer x = 1774
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
 htb_test.BringToTop		=	True
 htb_test.Height			=	128	
 htb_test.LineSize		=	0
 htb_test.MaxPosition	=	100	
 htb_test.MinPosition	=	0
 htb_test.PageSize		=	0
 htb_test.Pointer			=	''			
 htb_test.Position		=	0
 htb_test.Slider			=	True
 htb_test.SliderSize		=	0	
 htb_test.TabOrder		=	0
 htb_test.Tag	        	=	''
 htb_test.TickFrequency	=	10
 htb_test.TickMarks		=	hticksonbottom!
 htb_test.Visible			=	True
 htb_test.Width			=	1650
 htb_test.X	        		=	101
 htb_test.Y					=	208
tab_1.tabpage_3.lb_out.reset()
end event

type st_tip from w_standard_ancestor2`st_tip within w_htrackbar_new
integer width = 1655
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_htrackbar_new
integer width = 1714
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_htrackbar_new
integer width = 2222
end type

type htb_test from htrackbar within w_htrackbar_new
integer x = 110
integer y = 224
integer width = 1646
integer height = 192
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

event lineleft;// Event:lineleft()
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Lineleft Event'
tab_1.tabpage_3.lb_out.additem(ls_item)

end event

event lineright;// Event:linerignt()
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Lineright Event'
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

event pageleft;// Event:pageleft()
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Pageleft Event'
tab_1.tabpage_3.lb_out.additem(ls_item)

end event

event pageright;// Event:pageright()
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Pageright Event'
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

type st_3 from statictext within w_htrackbar_new
boolean visible = false
integer x = 96
integer y = 192
integer width = 1682
integer height = 152
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

