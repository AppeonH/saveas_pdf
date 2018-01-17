$PBExportHeader$w_hprogressbar_new.srw
forward
global type w_hprogressbar_new from w_standard_ancestor2
end type
type hpb_test from hprogressbar within w_hprogressbar_new
end type
type st_3 from statictext within w_hprogressbar_new
end type
end forward

global type w_hprogressbar_new from w_standard_ancestor2
integer width = 2341
integer height = 1760
string title = "HProgressBar"
hpb_test hpb_test
st_3 st_3
end type
global w_hprogressbar_new w_hprogressbar_new

type variables


end variables

on w_hprogressbar_new.create
int iCurrent
call super::create
this.hpb_test=create hpb_test
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.hpb_test
this.Control[iCurrent+2]=this.st_3
end on

on w_hprogressbar_new.destroy
call super::destroy
destroy(this.hpb_test)
destroy(this.st_3)
end on

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
// Author: 	xunengli		Date: 2004/10/20
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

is_prop_data = "BringToTop,Height,MaxPosition,MinPosition,Pointer,Position,SetStep,SmoothScroll,TabOrder,Tag,Visible,Width,X,Y"
is_fuction_data = "ClassName,GetParent,Hide,Move,OffsetPos,PointerX,PointerY,PostEvent,Resize,SetFocus,SetPosition,SetRange,SetRedraw,Show,StepIt,TriggerEvent,TypeOf"

st_tip.Text="The control is HProgressBar."
end event

type tab_1 from w_standard_ancestor2`tab_1 within w_hprogressbar_new
integer width = 2240
integer taborder = 50
end type

type tabpage_1 from w_standard_ancestor2`tabpage_1 within tab_1
integer width = 2203
end type

type cb_get from w_standard_ancestor2`cb_get within tabpage_1
integer width = 402
end type

event cb_get::clicked;call super::clicked;//====================================================================
// Function: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//				
//	(none)	
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/10/20
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
if lb_Prop.SelectedIndex() < 0 then
	iFlag = 1
	messagebox('Warning','Please select testing property.')
	return
end if
iFlag = 0

string ls_strtip, ls_strgetvalue
choose case Lower(lb_prop.selecteditem())
	case Lower('BringToTop')
		ls_strgetvalue = string(hpb_test.BringToTop)	
	case Lower('Height')
		ls_strgetvalue = string(hpb_test.Height)
	case Lower('Maxposition')
		ls_strgetvalue = string(hpb_test.Maxposition)
	case Lower('Minposition')
		ls_strgetvalue = string(hpb_test.Minposition)
	case Lower('Pointer')
		ls_strgetvalue = string(hpb_test.Pointer)
	case Lower('Position')
		ls_strgetvalue = string(hpb_test.Position)
	case Lower('SetStep')
		ls_strgetvalue = string(hpb_test.SetStep)
	case Lower('SmoothScroll')
		ls_strgetvalue = string(hpb_test.SmoothScroll)	
	case Lower('TabOrder')
		ls_strgetvalue = string(hpb_test.TabOrder)
	case Lower('Tag')
		ls_strgetvalue = hpb_test.Tag	
	case Lower('Visible')
		ls_strgetvalue = string(hpb_test.Visible)	
	case Lower('Width')
		ls_strgetvalue = string(hpb_test.Width)
	case Lower('X')
		ls_strgetvalue = string(hpb_test.X)
	case Lower('Y')
		ls_strgetvalue = string(hpb_test.Y)	
	case	else
		messagebox('Warning','This property not coding!')
end choose
ls_strtip = "The HProGressBar's " + lb_prop.selecteditem() + " get value is " + WordCap(ls_strgetvalue) + "." 
st_tip.text = ls_strtip

end event

type cb_set from w_standard_ancestor2`cb_set within tabpage_1
integer width = 402
end type

event cb_set::clicked;call super::clicked;//====================================================================
// Function: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 	(none)	
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/10/20
//--------------------------------------------------------------------
// Modify History: 
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_sle

ls_sle = sle_propparm.text
if isnull(ls_sle) then ls_sle = ''
if lb_Prop.SelectedIndex() < 0 then
	iFlag = 1
	messagebox('Warning','Please select testing property.')
	return
end if
if ls_sle = '' then
	iFlag = 1
	messagebox('Warning','Please select testing data.')
	return
end if
iFlag = 0

if iFlag = 1 then return
string ls_proptestvalue , ls_strtip
ls_proptestvalue = trim(sle_propparm.text)

choose case Lower(lb_Prop.selecteditem())
	case  Lower('BringToTop')
		choose case ls_proptestvalue
			case 'True'
				hpb_test.BringToTop = True				
			case 'False'
				hpb_test.BringToTop = False				
			case else
				messagebox('Warning','Parameter error.')
				return
		end choose	
	case  Lower('Height')		
		if isnumber(ls_proptestvalue) then
			hpb_test.Height = long(ls_proptestvalue)
		else 
			messagebox('Warning','Parameter type error.')			
			return
		end if
	case  Lower('Maxposition')
		if isnumber(ls_proptestvalue) then
			hpb_test.Maxposition = long(ls_proptestvalue)
		else 
			messagebox('Warning','Parameter type error.')			
			return
		end if		
	case  Lower('Minposition')
		if isnumber(ls_proptestvalue) then
			hpb_test.Minposition = long(ls_proptestvalue)
		else 
			messagebox('Warning','Parameter type error.')			
			return
		end if
	case  Lower('Pointer')
		hpb_test.pointer=ls_proptestvalue
		
	case  Lower('Position')
		if isnumber(ls_proptestvalue) then
			hpb_test.Position = long(ls_proptestvalue)
		else 
			messagebox('Warning','Parameter type error.')			
			return
		end if
	case  Lower('SetStep')	
		if isnumber(ls_proptestvalue) then
			hpb_test.SetStep = long(ls_proptestvalue)
		else 
			messagebox('Warning','Parameter type error.')			
			return
		end if
	case  Lower('SmoothScroll')
		if lower(ls_proptestvalue) = 'true'  then
			hpb_test.SmoothScroll = True
		elseif lower(ls_proptestvalue) = 'false' then
			hpb_test.SmoothScroll = False
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
	case  Lower('TabOrder')
		if isnumber(ls_proptestvalue) then
			hpb_test.TabOrder = integer(ls_proptestvalue)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if	
	case  Lower('Tag')
		hpb_test.Tag = ls_proptestvalue
	case  Lower('Visible')
		if lower(ls_proptestvalue) = 'true'   then
			hpb_test.Visible = True
		elseif lower(ls_proptestvalue) = 'false' then
			hpb_test.Visible = false
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
	case  Lower('Width')
		if isnumber(ls_proptestvalue) then
			hpb_test.Width = integer(ls_proptestvalue)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if		
	case  Lower('X')
		if isnumber(ls_proptestvalue) then
			hpb_test.X = integer(ls_proptestvalue)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
	case  Lower('Y')
		if isnumber(ls_proptestvalue) then
			hpb_test.Y = integer(ls_proptestvalue)
		else 
			messagebox('Warning','Parameter type error.')
			return
		end if
end choose
ls_strtip = "The HProgressBar's " + lb_prop.selecteditem() + " set value is " + WordCap(ls_proptestvalue) + "." 
st_tip.text = ls_strtip
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
// Author: 	xunengli		Date: 2004/10/20
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

lb_propparm.Reset()
sle_propparm.text = ''

CHOOSE CASE lb_prop.SelectedItem()
	CASE	'BringToTop' 
		wf_random("Boolean",lb_propparm)
		
	CASE	'Height'
		wf_random("Integer",lb_propparm)

	CASE	'MaxPosition'
		wf_random("Integer",lb_propparm)
		
	CASE	'MinPosition'
		wf_random("Integer",lb_propparm)
		
	CASE	'Pointer'
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
		lb_propparm.additem('SizeNS!')		
	CASE	'Position'
	   wf_random("Integer",lb_propparm)		
		
	CASE	'SetStep'
		wf_random("Integer",lb_propparm)	
		
	CASE	'SmoothScroll'
		wf_random("Boolean",lb_propparm)	
		
	CASE	'TabOrder'
		wf_random("Integer",lb_propparm)
		
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
	
				
END CHOOSE

end event

type sle_propparm from w_standard_ancestor2`sle_propparm within tabpage_1
end type

type tabpage_2 from w_standard_ancestor2`tabpage_2 within tab_1
integer width = 2203
end type

type cb_execute from w_standard_ancestor2`cb_execute within tabpage_2
integer width = 402
end type

event cb_execute::clicked;call super::clicked;//====================================================================
// Function: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//				
//		(None)  		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/10/20
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_sle
ls_sle = sle_functionparm.text
if lb_function.SelectedIndex() < 0 then
	iFlag = 1
	messagebox('Warning','Please select testing function.')
	return
end if
if isnull(ls_sle) then ls_sle = ''
if ls_sle = '' and lb_functionparm.totalItems() > 0  then
	iFlag = 1
	messagebox('Warning','Please select testing data.')
	return
end if
iFlag = 0

if iFlag = 1 then return																																																																																																																																																																																																																																																																																																																																																																															
string ls_strtip , ls_strexevalue, ls_strtestvalue
integer li_intx,li_inty,li_parmnumber
string ls_strar[]
boolean lb_parm
PowerObject lpowero_parent

ls_strtestvalue = trim(sle_functionparm.text)
li_parmnumber = wf_str2array(ls_strtestvalue,ls_strar)
choose case lb_function.selecteditem()
	case 'ClassName'
		ls_strexevalue = hpb_test.ClassName() 
	case 'GetParent'
		//ls_strexevalue = hpb_test.GetParent().ClassName() 
		lpowero_parent = hpb_test.GetParent()   //modified by guojun at 2003.11.05
	   ls_strexevalue = lpowero_parent.ClassName()
	case 'Hide'
		ls_strexevalue = string(hpb_test.Hide()) 
	case 'Move'
		if li_parmnumber <> 2 then 
			messagebox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(ls_strar[1]) and isnumber(ls_strar[2]) then
			li_intx = integer(ls_strar[1])
			li_inty = integer(ls_strar[2])
	  		ls_strexevalue = string(hpb_test.Move(li_intx,li_inty))
		else 
			messagebox('Warning','Parameter type error.')
			li_intx = integer(ls_strar[1])
			li_inty = integer(ls_strar[2])
	  		ls_strexevalue = string(hpb_test.Move(li_intx,li_inty))
			return
		end if
	case 'OffsetPos'
		   ls_strexevalue = string(hpb_test.OffsetPos(integer(ls_strar[1])))
	case 'PointerX'
		ls_strexevalue = string(hpb_test.PointerX()) 
	case 'PointerY'
		ls_strexevalue = string(hpb_test.PointerY()) 
	case 'PostEvent'
			choose case ls_strtestvalue
				case 'Clicked!'
					ls_strexevalue = string(hpb_test.PostEvent(Clicked!))	
				case 'Constructor!'
					ls_strexevalue = string(hpb_test.PostEvent(Constructor!))
				case 'Destructor!'
					ls_strexevalue = string(hpb_test.PostEvent(Destructor!))
				case 'DoubleClicked!'
					ls_strexevalue = string(hpb_test.PostEvent(DoubleClicked!))
				case 'GetFocus!'
					ls_strexevalue = string(hpb_test.PostEvent(Getfocus!))
				case 'Help!'
					ls_strexevalue = string(hpb_test.PostEvent('Help'))				
				case 'LoseFocus!'
					ls_strexevalue = string(hpb_test.PostEvent(Losefocus!))				
				case 'RbuttonDown!'
					ls_strexevalue = string(hpb_test.PostEvent(RbuttonDown!))					
				case else
					messagebox('Warning','Parameter error.')
					return
			end choose
	case 'Resize'
		if li_parmnumber <> 2 then 
			messagebox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(ls_strar[1]) and isnumber(ls_strar[2]) then
			li_intx = integer(ls_strar[1])
			li_inty = integer(ls_strar[2])
	  		ls_strexevalue = string(hpb_test.Resize(li_intx,li_inty))
		else 
			messagebox('Warning','Parameter type error.')
			li_intx = integer(ls_strar[1])
			li_inty = integer(ls_strar[2])
	  		ls_strexevalue = string(hpb_test.Resize(li_intx,li_inty))
			return
		end if
	case 'SetFocus'
		ls_strexevalue = string(hpb_test.SetFocus())
		
	CASE	'SetPosition' 
		choose case ls_strtestvalue
			case 'Behind!'
				ls_strexevalue = string(hpb_test.SetPosition(Behind!,st_3))
				
			case 'ToTop!'
				ls_strexevalue = string(hpb_test.SetPosition(ToTop!)) 
				
			case 'ToBottom!'
				ls_strexevalue = string(hpb_test.SetPosition(ToBottom!))
				
			case else
				messagebox('Warning','Parameter error.')
				return
		end choose
	case 'SetRange'	
		if li_parmnumber <> 2 then 
			messagebox('Warning','The parameter number should be 2.')
			return
		elseif isnumber(ls_strar[1]) and isnumber(ls_strar[2]) then
			li_intx = integer(ls_strar[1])
			li_inty = integer(ls_strar[2])
	  		ls_strexevalue = string(hpb_test.SetRange(li_intx,li_inty))
		else 
			messagebox('Warning','Parameter type error.')
			li_intx = integer(ls_strar[1])
			li_inty = integer(ls_strar[2])
	  		ls_strexevalue = string(hpb_test.SetRange(li_intx,li_inty))
			return
		end if
	case 'SetRedraw'
		if lower(ls_strar[1]) ='true' then
			lb_parm = true
		else
			lb_parm = false
		end if
		if not hpb_test.visible then 
			if hpb_test.SetRedraw(lb_parm) = -1 then
				ls_strexevalue = string(1)
			end if
		else
		   ls_strexevalue = string(hpb_test.SetRedraw(lb_parm))
		end if
	case 'Show'
		ls_strexevalue = string(hpb_test.Show())
	case 'StepIt'
		ls_strexevalue = string(hpb_test.StepIt())	
	case 'TriggerEvent'
		choose case ls_strtestvalue
				case 'Clicked!'
					ls_strexevalue = string(hpb_test.TriggerEvent(Clicked!))
				case 'Constructor!'
					ls_strexevalue = string(hpb_test.TriggerEvent(Constructor!))
				case 'Destructor!'
					ls_strexevalue = string(hpb_test.TriggerEvent(Destructor!))	
				case 'DoubleClicked!'
					ls_strexevalue = string(hpb_test.TriggerEvent(DoubleClicked!))				
				case 'GetFocus!'
					ls_strexevalue = string(hpb_test.TriggerEvent(Getfocus!))				
				case 'LoseFocus!'
					ls_strexevalue = string(hpb_test.TriggerEvent(Losefocus!))
				case 'RbuttonDown!'
					ls_strexevalue = string(hpb_test.TriggerEvent(RbuttonDown!))
				case 'Help!'
					ls_strexevalue = string(hpb_test.TriggerEvent('Help'))				
				case else
					messagebox('Warning','Parameter error.')
					return
		end choose
	case 'TypeOf'
		if hpb_test.typeof() = HProgressBar! then
			ls_strexevalue = 'HProgressBar!'
		else
			ls_strexevalue = 'Invalid'
		end if
end choose

ls_strtip =  "Return value is " + WordCap(ls_strexevalue) + "."
st_tip.text = ls_strtip
end event

type sle_functionparm from w_standard_ancestor2`sle_functionparm within tabpage_2
end type

type st_2 from w_standard_ancestor2`st_2 within tabpage_2
end type

type lb_function from w_standard_ancestor2`lb_function within tabpage_2
end type

event lb_function::selectionchanged;call super::selectionchanged;//====================================================================
// Function: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//	(none)	
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
lb_functionparm.Reset()
sle_functionparm.text = ''
choose case this.selecteditem()
	case 'Move'
		wf_random('integer,integer',lb_functionparm)
		return
	case 'OffsetPos'
		wf_random('int',lb_functionparm)
		return
	case 'SetRange'
//		wf_random('integer,integer',lb_functionparm)
		lb_functionparm.additem('1,10')
		lb_functionparm.additem('50,80')
		lb_functionparm.additem('20,100')
		lb_functionparm.additem('60,300')
		return
	case 'PostEvent'
		lb_functionparm.additem('Clicked!')
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('DoubleClicked!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')		
//		lb_functionparm.additem('Help!')
		lb_functionparm.additem('RbuttonDown!')
		return
	case 'Resize'
		wf_random('integer,integer',lb_functionparm)
		
   CASE	'SetPosition' 		
		lb_functionparm.additem('Behind!')
		lb_functionparm.additem('ToTop!')
		lb_functionparm.additem('ToBottom!')
		return
		
	case 'SetRedraw'
		wf_random('boolean',lb_functionparm)
	case 'TriggerEvent'	
		lb_functionparm.additem('Clicked!')
		lb_functionparm.additem('Constructor!')
		lb_functionparm.additem('Destructor!')
		lb_functionparm.additem('DoubleClicked!')
		lb_functionparm.additem('GetFocus!')
		lb_functionparm.additem('LoseFocus!')		
//		lb_functionparm.additem('Help!')		
		lb_functionparm.additem('RbuttonDown!')
		return
end choose
end event

type lb_functionparm from w_standard_ancestor2`lb_functionparm within tabpage_2
end type

type tabpage_3 from w_standard_ancestor2`tabpage_3 within tab_1
integer width = 2203
end type

type cb_4 from w_standard_ancestor2`cb_4 within tabpage_3
end type

type cb_3 from w_standard_ancestor2`cb_3 within tabpage_3
end type

type lb_out from w_standard_ancestor2`lb_out within tabpage_3
end type

type cb_2 from w_standard_ancestor2`cb_2 within w_hprogressbar_new
integer x = 1806
integer y = 1524
integer width = 402
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_hprogressbar_new
integer x = 1755
integer width = 402
end type

event cb_1::clicked;call super::clicked;//====================================================================
// Function: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//				
//	(none)	
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/10/20
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
 hpb_test.BringToTop  	= 	True
 hpb_test.Height 			=	88
 hpb_test.MaxPosition	=	100
 hpb_test.MinPosition 	=	0 
 hpb_test.Pointer			= 	'Arrow!' 
 hpb_test.Position  		=	50    
 hpb_test.SetStep			=	10
 hpb_test.SmoothScroll 	=	false
 hpb_test.TabOrder		=  0       
 hpb_test.Tag 				=	''
 hpb_test.Visible 		=	True  
 hpb_test.Width			=	1605       
 hpb_test.X 				=	96   
 hpb_test.Y					=	220
 tab_1.tabpage_3.lb_out.reset()
end event

type st_tip from w_standard_ancestor2`st_tip within w_hprogressbar_new
integer width = 1664
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_hprogressbar_new
integer width = 1714
integer taborder = 40
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_hprogressbar_new
integer width = 2245
end type

type hpb_test from hprogressbar within w_hprogressbar_new
integer x = 96
integer y = 220
integer width = 1605
integer height = 88
boolean bringtotop = true
string pointer = "Arrow!"
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
// Returns: long [pbm_bnclicked]
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

event constructor;//====================================================================
// Event: constructor()
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

event destructor;//====================================================================
// Event: destructor()
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

event doubleclicked;//====================================================================
// Event: doublecklicked()
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

event getfocus;//====================================================================
// Event: getfocus()
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Getfocus Event'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event losefocus;//====================================================================
// Event: losefocus()
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Losefocus Event'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event rbuttondown;//====================================================================
// Event: rbuttondown()
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
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+'Rbuttondown Event'
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

type st_3 from statictext within w_hprogressbar_new
boolean visible = false
integer x = 69
integer y = 196
integer width = 1705
integer height = 116
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

