$PBExportHeader$w_monthcalendar.srw
forward
global type w_monthcalendar from w_standard_ancestor2
end type
type st_3 from statictext within w_monthcalendar
end type
type mc_1 from monthcalendar within w_monthcalendar
end type
end forward

global type w_monthcalendar from w_standard_ancestor2
integer width = 2501
integer height = 2084
string title = "MonthCalendar"
st_3 st_3
mc_1 mc_1
end type
global w_monthcalendar w_monthcalendar

type variables

end variables

on w_monthcalendar.create
int iCurrent
call super::create
this.st_3=create st_3
this.mc_1=create mc_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.mc_1
end on

on w_monthcalendar.destroy
call super::destroy
destroy(this.st_3)
destroy(this.mc_1)
end on

event ue_open;call super::ue_open;is_prop_data = "BringToTop,MonthBackColor,BackColor,TextColor,TextSize,TitleBackColor,TitleTextColor,TrailingTextColor,"+&
					"FirstDayOfWeek,TodayCircle,TodaySection,Underline,"+&
					"WeekNumbers,Height,Pointer,ScrollRate,MaxSelectCount," + &
			 "TabOrder,Tag,Visible,Width,X,Y"
is_fuction_data = "ClassName,GetParent,GetDateLimits,GetSelectedDate,GetToday,GetSelectedRange,GetDisplayRange,Hide,Move,PointerX,PointerY,PostEvent,Resize," + &
				  "SetFocus,SetPosition,SetDateLimits,SetSelectedDate,SetSelectedRange,SetRedraw,SetToday,Show,TriggerEvent,TypeOf"			 
end event

type tab_1 from w_standard_ancestor2`tab_1 within w_monthcalendar
integer y = 868
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
//is_prop_data = "AllowEdit,BringToTop,CalendarBackColor,CalendarTextColor,CalendarTextSize	,CalendarTitleBackColor	,
//CalendarTitleTextColor	,CalendarTrailingTextColor	,CustomFormat	,"+&
//					"Format	,MaxDate 	,MinDate 	,ShowUpDown	,TodayCircle 	,TodaySection 	,Underline	,"+&
//					"Value	,WeekNumbers	,Height,Pointer," + &
//			 "TabOrder,Tag,Visible,Width,X,Y"
choose case trim(lb_prop.selecteditem())
	case 'MonthBackColor'
		ls_StrGetValue = String(mc_1.MonthBackColor)
	case 'TextColor'
		ls_StrGetValue = String(mc_1.TextColor)
	case 'TextSize'
		ls_StrGetValue = String(mc_1.TextSize)
	case 'TitleBackColor'
		ls_StrGetValue = String(mc_1.TitleBackColor)
	case 'TitleTextColor'
		ls_StrGetValue = String(mc_1.TitleTextColor)
	case 'TrailingTextColor'
		ls_StrGetValue = String(mc_1.TrailingTextColor)
	case 'MaxSelectCount'
		ls_StrGetValue = String(mc_1.MaxSelectCount)
	case 'FirstDayOfWeek'
		IF mc_1.FirstDayOfWeek=	Monday!THEN
			ls_StrGetValue = "Monday!"
		ELSEIF mc_1.FirstDayOfWeek=	friday!THEN
			ls_StrGetValue = "Friday!"
		ELSEIF mc_1.FirstDayOfWeek=	saturday! THEN
			ls_StrGetValue = "Saturday!"
		ELSEIF mc_1.FirstDayOfWeek=	sunday! THEN
			ls_StrGetValue = "Sunday!"
		ELSEIF mc_1.FirstDayOfWeek=	thursday!THEN
			ls_StrGetValue = "Thursday!"
		ELSEIF mc_1.FirstDayOfWeek=	tuesday!THEN
			ls_StrGetValue = "Tuesday!"
		ELSEIF mc_1.FirstDayOfWeek=	wednesday!THEN
			ls_StrGetValue = "Wednesday!"
		END IF


	case 'TodayCircle'
		ls_StrGetValue = String(mc_1.TodayCircle)
	case 'TodaySection'
		ls_StrGetValue = String(mc_1.TodaySection)
	case 'Underline'
		ls_StrGetValue = String(mc_1.Underline)
	case 'WeekNumbers'
		ls_StrGetValue = String(mc_1.WeekNumbers)
	case 'ScrollRate'
		ls_StrGetValue = String(mc_1.ScrollRate)
	case  'BringToTop'
		ls_StrGetValue = String(mc_1.BringToTop)
	case 'Height'
		ls_StrGetValue = String(mc_1.Height)
	case 'Pointer' 
		ls_StrGetValue = String(mc_1.Pointer)
	case 'TabOrder'
		ls_StrGetValue = String(mc_1.TabOrder)
	case 'Tag'
		ls_StrGetValue = String(mc_1.Tag)
	case 'Visible'
		ls_StrGetValue = String(mc_1.Visible)
	case 'Width'
		ls_StrGetValue = String(mc_1.Width)
	case 'X'
		ls_StrGetValue = String(mc_1.X)
	case 'Y'
		ls_StrGetValue = String(mc_1.Y)
	case else
		messagebox("","unsupported feature")
	end choose
ls_StrTip = "The DatePicker " + lb_prop.selecteditem() + " get value is " + WordCap(ls_StrGetValue) + "." 
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
//is_prop_data = "AllowEdit,BringToTop,CalendarBackColor,
//CalendarTextColor,CalendarTextSize,CalendarTitleBackColor,
//CalendarTitleTextColor,CalendarTrailingTextColor,CustomFormat,"+&
//					"FirstDayOfWeek,Format,MaxDate,MinDate,ShowUpDown,
//					TodayCircle,TodaySection,Underline,"+&
//					"Value,WeekNumbers,Height,Pointer," + &
//			 "TabOrder,Tag,Visible,Width,X,Y"
choose case lb_prop.selecteditem()
  	case 'MonthBackColor'
		if IsNumber(ls_PropTestValue) then
			mc_1.MonthBackColor = long(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if	
	case 'BackColor'
		if IsNumber(ls_PropTestValue) then
			mc_1.BackColor = long(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if		
	case 'TextColor'
		if IsNumber(ls_PropTestValue) then
			mc_1.TextColor = long(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if	
	
		
	case  'BringToTop'
		choose case lower(ls_PropTestValue) 
	 		case 'true' 
			  mc_1.BringToTop = True
		 	case 'false' 
			  mc_1.BringToTop = False
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
	case  'WeekNumbers'
		choose case lower(ls_PropTestValue) 
	 		case 'true' 
			  mc_1.WeekNumbers = True
		 	case 'false' 
			  mc_1.WeekNumbers = False
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
	case  'TodayCircle'
		choose case lower(ls_PropTestValue) 
	 		case 'true' 
			  mc_1.TodayCircle = True
		 	case 'false' 
			  mc_1.TodayCircle = False
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
	case  'TodaySection'
		choose case lower(ls_PropTestValue) 
	 		case 'true' 
			  mc_1.TodaySection = True
		 	case 'false' 
			  mc_1.TodaySection = False
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
	case  'FirstDayOfWeek'
		choose case ls_PropTestValue 
	 		case 'Sunday!' 
			  mc_1.FirstDayOfWeek = Sunday!
		 	case 'Monday!' 
			  mc_1.FirstDayOfWeek = Monday!
		 	case 'Tuesday!' 
			  mc_1.FirstDayOfWeek = Tuesday!
		 	case 'Wednesday!' 
			  mc_1.FirstDayOfWeek = Wednesday!
		 	case 'Thursday!' 
			  mc_1.FirstDayOfWeek = Thursday!
		 	case 'Friday!' 
			  mc_1.FirstDayOfWeek = Friday!
		 	case 'Saturday!' 
			  mc_1.FirstDayOfWeek = Saturday!
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
	case  'Underline'
		choose case lower(ls_PropTestValue) 
	 		case 'true' 
			  mc_1.Underline = True
		 	case 'false' 
			  mc_1.Underline = False
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose

	case 'Height'
		if IsNumber(ls_PropTestValue) then
			mc_1.Height = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
//		CalendarTextSize,CalendarTitleBackColor,CalendarTitleTextColor,CalendarTrailingTextColor
	case 'TextSize'
		if IsNumber(ls_PropTestValue) then
			mc_1.TextSize = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'TitleBackColor'
		if IsNumber(ls_PropTestValue) then
			mc_1.TitleBackColor = long(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'TitleTextColor'
		if IsNumber(ls_PropTestValue) then
			mc_1.TitleTextColor = long(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'TrailingTextColor'
		if IsNumber(ls_PropTestValue) then
			mc_1.TrailingTextColor = long(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'MaxSelectCount'
		if IsNumber(ls_PropTestValue) then
			mc_1.MaxSelectCount = long(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
		 	
	case 'ScrollRate'
		if IsNumber(ls_PropTestValue) then
			mc_1.ScrollRate = long(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Pointer' 
		mc_1.Pointer = ls_PropTestValue 
	case 'TabOrder'
		if IsNumber(ls_PropTestValue) then
			mc_1.TabOrder = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if

	case 'Tag'
		mc_1.Tag = ls_PropTestValue
	case 'Visible'
		if lower(ls_PropTestValue) = 'true' then
			mc_1.Visible = True
		elseif lower(ls_PropTestValue) = 'false' then
			mc_1.Visible = False
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Width'
		if IsNumber(ls_PropTestValue) then
			mc_1.Width = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'X'
		if IsNumber(ls_PropTestValue) then
			mc_1.X = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Y'
		if IsNumber(ls_PropTestValue) then
			mc_1.Y = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	end choose
	strtip = "The MonthCalendar " + lb_prop.selecteditem() + " set value is " + WordCap(ls_PropTestValue) + "." 
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
	case  'BringToTop',"Underline","TodaySection","TodayCircle","WeekNumbers"
		wf_random('boolean',lb_propparm)		
	case 'Height'
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
	case 'FirstDayOfWeek'
		lb_propparm.additem('Sunday!')
		lb_propparm.additem('Monday!')
		lb_propparm.additem('Tuesday!')
		lb_propparm.additem('Wednesday!')
		lb_propparm.additem('Thursday!')
		lb_propparm.additem('Friday!')
		lb_propparm.additem('Saturday!')
		//wf_random('int',lb_propparm)		
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
	case else
		if pos(lb_prop.selecteditem(),"Color") > 0 THEN
			wf_random('int',lb_propparm)
		ELSEIF pos(lb_prop.selecteditem(),"Date") > 0 THEN
			wf_random('date',lb_propparm)
		END IF
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
date dt1,dt2

String 	strtip , strexevalue, strtestvalue
integer 	intx , inty
String 	strar[]
int 		parmnumber
PowerObject lpowero_parent
// "ClassName,GetParent,GetDateLimits,GetSelectedDate,GetToday,GetSelectedRange,
// GetToday,GetDisplayRange,Hide,Move,PointerX,PointerY,PostEvent,Resize," + &
//				  "SetFocus,SetBoldDate,SetPosition,SetDateLimits,SetSelectedDate,
//				  SetSelectedRange,SetRedraw,SetToday,Show,TriggerEvent,TypeOf"			 


strtestvalue = trim(sle_functionparm.text)
parmnumber = wf_str2array(strtestvalue,strar)
choose case lb_function.selecteditem()
	case 'ClassName'
		strexevalue = mc_1.ClassName() 
	case 'GetParent'
		lpowero_parent = mc_1.GetParent()
		strexevalue = lpowero_parent.ClassName()
	case 'GetSelectedDate'
		date d
		mc_1.GetSelectedDate(d)
		strexevalue = string(d)
	case 'GetToday'
		strexevalue = String(mc_1.GetToday())
	case 'GetSelectedRange'
		mc_1.GetSelectedRange(dt1,dt2)
		strexevalue = String(dt1)+","+string(dt2)
	case 'GetDisplayRange'	
		mc_1.GetDisplayRange	(dt1,dt2)
		strexevalue = String(dt1)+","+string(dt2)
	case 'GetDateLimits'
		mc_1.GetDateLimits	(dt1,dt2)
		strexevalue = String(dt1)+","+string(dt2)
	case 'SetSelectedDate	'
		strexevalue = string(mc_1.SetSelectedDate	(Date(ls_sle)))
	case 'SetToday'
		strexevalue = string(mc_1.SetToday(Date(ls_sle)))

	case 'Hide'
		strexevalue = String(mc_1.Hide()) 
	case 'SetDateLimits'
		if parmnumber <> 2 then 
			MessageBox('Warning','Parameter number should be 2.')
			return
		elseif IsDate(strar[1]) and IsDate(strar[2]) then
			dt1 = date(strar[1])
			dt2 = date(strar[2])
	  		strexevalue = String(mc_1.SetDateLimits	(dt1,dt2))
		else
			MessageBox('Warning','Parameter type error.Type will be converted.')
			dt1 = date(strar[1])
			dt1 = date(strar[2])
	  		strexevalue = String(mc_1.SetDateLimits	(dt1,dt2))
			return
		end if
	case 'SetSelectedRange'
		if parmnumber <> 2 then 
			MessageBox('Warning','Parameter number should be 2.')
			return
		elseif IsDate(strar[1]) and IsDate(strar[2]) then
			dt1 = date(strar[1])
			dt2 = date(strar[2])
	  		strexevalue = String(mc_1.SetSelectedRange		(dt1,dt2))
		else
			MessageBox('Warning','Parameter type error.Type will be converted.')
			dt1 = date(strar[1])
			dt1 = date(strar[2])
	  		strexevalue = String(mc_1.SetSelectedRange		(dt1,dt2))
			return
		end if
	case 'Move'
		if parmnumber <> 2 then 
			MessageBox('Warning','Parameter number should be 2.')
			return
		elseif IsNumber(strar[1]) and IsNumber(strar[2]) then
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(mc_1.Move(intx,inty))
		else
			MessageBox('Warning','Parameter type error.Type will be converted.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(mc_1.Move(intx,inty))
			return
		end if
	case 'PointerX'
		strexevalue = String(mc_1.PointerX()) 
	case 'PointerY'
		strexevalue = String(mc_1.PointerY()) 
	case 'PostEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(mc_1.PostEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(mc_1.PostEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(mc_1.PostEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(mc_1.PostEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(mc_1.PostEvent(RButtonDown!))
			case 'Help'
				strexevalue = String(mc_1.PostEvent('Help'))
			case 'LineUp!'
				strexevalue = String(mc_1.PostEvent(lineup!))
			case 'LineDown!'
				strexevalue = String(mc_1.PostEvent(linedown!))
			case 'PageUp!'
				strexevalue = String(mc_1.PostEvent(pageup!))
			case 'PageDown!'
				strexevalue = String(mc_1.PostEvent(pagedown!))
			case 'Moved!'
				strexevalue = String(mc_1.PostEvent(Moved!))
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
	  		strexevalue = String(mc_1.Resize(intx,inty))
		else
			MessageBox('Warning','Parameter type error.Type will be converted.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(mc_1.Resize(intx,inty))
		end if
	case 'SetFocus'
		strexevalue = String(mc_1.SetFocus())
	case 'SetPosition'
		choose case strtestvalue
			case 'Behind!'
				strexevalue = String(mc_1.SetPosition(Behind!,st_3))
				
			case 'ToTop!'
				strexevalue = String(mc_1.SetPosition(ToTop!)) 
				
			case 'ToBottom!'
				strexevalue = String(mc_1.SetPosition(ToBottom!))
				
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'SetRedraw'
		if lower(strtestvalue) = 'true' then
			strexevalue = String(mc_1.SetRedraw(True))
		elseif lower(strtestvalue) = 'false' then
			strexevalue = String(mc_1.SetRedraw(False))
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Show'
		strexevalue = String(mc_1.Show())
	case 'TriggerEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(mc_1.TriggerEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(mc_1.TriggerEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(mc_1.TriggerEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(mc_1.TriggerEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(mc_1.TriggerEvent(RButtonDown!))
			case 'Help!'
				strexevalue = String(mc_1.TriggerEvent('Help'))
			case 'Moved!'
				strexevalue = String(mc_1.TriggerEvent(Moved!))
				
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'TypeOf'
		if mc_1.typeof() = vscrollbar! then
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
// "ClassName,GetParent,GetDateLimits,GetSelectedDate,GetToday,GetSelectedRange,
// GetToday,GetDisplayRange,Hide,Move,PointerX,PointerY,PostEvent,Resize," + &
//				  "SetFocus,SetBoldDate,SetPosition,SetDateLimits,SetSelectedDate,
//				  SetSelectedRange,SetRedraw,SetToday,Show,TriggerEvent,TypeOf"			 

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
		lb_functionparm.additem('Moved!')
		return
	case 'Resize'
		wf_random('integer,integer',lb_functionparm)
	case 'SetToday'	,'SetSelectedDate'	
		wf_random('date',lb_functionparm)
		return
	case 'SetSelectedRange'	,'SetDateLimits'	
		wf_random('date,date',lb_functionparm)
		return
	case 'SetPosition'		
		lb_functionparm.additem('ToTop!')
		lb_functionparm.additem('ToBottom!')
		lb_functionparm.additem('Behind!')
		return
	case 'SetRedraw','SetBoldDate'
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
//		lb_functionparm.additem('LineUp!')
//		lb_functionparm.additem('LineDown!')
//		lb_functionparm.additem('PageUp!')
//		lb_functionparm.additem('PageDown!')
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

type cb_2 from w_standard_ancestor2`cb_2 within w_monthcalendar
integer x = 1792
integer y = 1840
integer width = 402
integer height = 108
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_monthcalendar
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
mc_1.BringToTop = True
mc_1.Height = 700
mc_1.Pointer = ''
mc_1.TabOrder = 0
mc_1.Tag = ''
mc_1.Visible = True
mc_1.Width = 1257
mc_1.X = 82
mc_1.Y = 72
mc_1.FirstDayOfWeek=sunday!
mc_1.todaysection = true
mc_1.todaycircle = true
mc_1.weeknumbers = false
tab_1.tabpage_3.lb_out.reset()
end event

type st_tip from w_standard_ancestor2`st_tip within w_monthcalendar
integer y = 1868
integer width = 1655
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_monthcalendar
integer y = 1816
integer width = 1714
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_monthcalendar
integer width = 2222
integer height = 816
end type

type st_3 from statictext within w_monthcalendar
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

type mc_1 from monthcalendar within w_monthcalendar
integer x = 82
integer y = 72
integer width = 1257
integer height = 700
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event datechanged;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MonthCalendar's DateChanged Event. "
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event clicked;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Monthcalendar's Clicked Event. Parameters are flags="+string(flags)+", xpos="+string(xpos)+", ypos="+string(ypos)
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event dateselected;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MonthCalendar's DaeSelected Event."
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event constructor;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MonthCalendar's Constructor Event."
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event destructor;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MonthCalendar's Desstructor Event."
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event doubleclicked;string ls_item
//ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MonthCalendar's DoubleClicked Event."
//tab_1.tabpage_3.lb_out.additem(ls_item)

ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Monthcalendar's DoubleClicked Event. Parameters are flags="+string(flags)+", xpos="+string(xpos)+", ypos="+string(ypos)
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event getfocus;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MonthCalendar's GetFocus Event."
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event losefocus;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"MonthCalendar's LoseFocus Event."
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event rbuttondown;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Monthcalendar's rbuttondown Event. Parameters are flags="+string(flags)+", xpos="+string(xpos)+", ypos="+string(ypos)
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event dragdrop;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Monthcalendar's DragDrop Event."
tab_1.tabpage_3.lb_out.additem(ls_item)
tab_1.tabpage_3.lb_out.additem(string("parameter: source.classname= "+string(source.classname())))
end event

event dragenter;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Monthcalendar's DragEnter Event."
tab_1.tabpage_3.lb_out.additem(ls_item)
tab_1.tabpage_3.lb_out.additem(string("parameter: source.classname= "+string(source.classname())))
end event

event dragleave;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Monthcalendar's DragLeave Event."
tab_1.tabpage_3.lb_out.additem(ls_item)
tab_1.tabpage_3.lb_out.additem(string("parameter: source.classname= "+string(source.classname())))
end event

event dragwithin;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"Monthcalendar's DragWhthin Event."
tab_1.tabpage_3.lb_out.additem(ls_item)
tab_1.tabpage_3.lb_out.additem(string("parameter: source.classname= "+string(source.classname())))
end event

