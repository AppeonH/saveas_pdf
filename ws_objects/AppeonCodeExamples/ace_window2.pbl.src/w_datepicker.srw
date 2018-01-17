$PBExportHeader$w_datepicker.srw
forward
global type w_datepicker from w_standard_ancestor2
end type
type st_3 from statictext within w_datepicker
end type
type dp_1 from datepicker within w_datepicker
end type
end forward

global type w_datepicker from w_standard_ancestor2
integer width = 2501
integer height = 1784
string title = "DatePicker"
st_3 st_3
dp_1 dp_1
end type
global w_datepicker w_datepicker

type variables

end variables

on w_datepicker.create
int iCurrent
call super::create
this.st_3=create st_3
this.dp_1=create dp_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.dp_1
end on

on w_datepicker.destroy
call super::destroy
destroy(this.st_3)
destroy(this.dp_1)
end on

event ue_open;call super::ue_open;is_prop_data = "AllowEdit,BringToTop,CalendarBackColor,CalendarTextColor,CalendarTextSize,CalendarTitleBackColor,CalendarTitleTextColor,CalendarTrailingTextColor,CustomFormat,"+&
					"FirstDayOfWeek,Format,MaxDate,MinDate,ShowUpDown,TodayCircle,TodaySection,Underline,"+&
					"Value,WeekNumbers,Height,Pointer," + &
			 "TabOrder,Tag,Visible,Width,X,Y"
is_fuction_data = "ClassName,GetParent,GetText,GetToday,GetValue,Hide,Move,PointerX,PointerY,PostEvent,Resize," + &
				  "SetFocus,SetPosition,SetRedraw,SetToday,SetValue,Show,TriggerEvent,TypeOf"			 
				  

dp_1.setvalue(today(),now())
end event

type tab_1 from w_standard_ancestor2`tab_1 within w_datepicker
integer width = 2222
end type

on tab_1.create
call super::create
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
call super::destroy
end on

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
	case 'AllowEdit'
		ls_StrGetValue = String(dp_1.AllowEdit)
	case 'CalendarBackColor'
		ls_StrGetValue = String(dp_1.CalendarBackColor)
	case 'CalendarTextColor'
		ls_StrGetValue = String(dp_1.CalendarTextColor)
	case 'CalendarTextSize'
		ls_StrGetValue = String(dp_1.CalendarTextSize)
	case 'CalendarTitleBackColor'
		ls_StrGetValue = String(dp_1.CalendarTitleBackColor)
	case 'CalendarTitleTextColor'
		ls_StrGetValue = String(dp_1.CalendarTitleTextColor)
	case 'CalendarTrailingTextColor'
		ls_StrGetValue = String(dp_1.CalendarTrailingTextColor)
	case 'CustomFormat'
		ls_StrGetValue = String(dp_1.CustomFormat)
	case 'FirstDayOfWeek'
		IF dp_1.FirstDayOfWeek=	Monday!THEN
			ls_StrGetValue = "Monday!"
		ELSEIF dp_1.FirstDayOfWeek=	friday!THEN
			ls_StrGetValue = "Friday!"
		ELSEIF dp_1.FirstDayOfWeek=	saturday! THEN
			ls_StrGetValue = "Saturday!"
		ELSEIF dp_1.FirstDayOfWeek=	sunday! THEN
			ls_StrGetValue = "Sunday!"
		ELSEIF dp_1.FirstDayOfWeek=	thursday!THEN
			ls_StrGetValue = "Thursday!"
		ELSEIF dp_1.FirstDayOfWeek=	tuesday!THEN
			ls_StrGetValue = "Tuesday!"
		ELSEIF dp_1.FirstDayOfWeek=	wednesday!THEN
			ls_StrGetValue = "Wednesday!"
		END IF
	case 'Format'
		IF dp_1.format = DtfCustom! THEN
			ls_StrGetValue = String("DtfCustom!")
		ELSEIF dp_1.format = DtfLongDate!THEN
			ls_StrGetValue = String("DtfLongDate!")
		ELSEIF dp_1.format = DtfShortDate!THEN
			ls_StrGetValue = String("DtfShortDate!")
		ELSEIF dp_1.format = DtfTime!THEN
			ls_StrGetValue = String("DtfTime")
		END IF

	case 'MaxDate'
		ls_StrGetValue = String(dp_1.MaxDate)
	case 'MinDate'
		ls_StrGetValue = String(dp_1.MinDate)
	case 'ShowUpDown'
		ls_StrGetValue = String(dp_1.ShowUpDown)
	case 'MinDate'
		ls_StrGetValue = String(dp_1.MinDate)
	case 'TodayCircle'
		ls_StrGetValue = String(dp_1.TodayCircle)
	case 'TodaySection'
		ls_StrGetValue = String(dp_1.TodaySection)
	case 'Underline'
		ls_StrGetValue = String(dp_1.Underline)
	case 'Value'
		ls_StrGetValue = String(dp_1.Value)
	case 'WeekNumbers'
		ls_StrGetValue = String(dp_1.WeekNumbers)
		
	case  'BringToTop'
		ls_StrGetValue = String(dp_1.BringToTop)
	case 'Height'
		ls_StrGetValue = String(dp_1.Height)
	case 'Pointer' 
		ls_StrGetValue = String(dp_1.Pointer)
	case 'TabOrder'
		ls_StrGetValue = String(dp_1.TabOrder)
	case 'Tag'
		ls_StrGetValue = String(dp_1.Tag)
	case 'Visible'
		ls_StrGetValue = String(dp_1.Visible)
	case 'Width'
		ls_StrGetValue = String(dp_1.Width)
	case 'X'
		ls_StrGetValue = String(dp_1.X)
	case 'Y'
		ls_StrGetValue = String(dp_1.Y)
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
	CASE 'CalendarBackColor'
	   if IsNumber(ls_PropTestValue) then
			dp_1.CalendarBackColor = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	CASE 'CalendarTextColor'
	   if IsNumber(ls_PropTestValue) then
			dp_1.CalendarTextColor = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
		
		
		
	
	case  'BringToTop'
		choose case lower(ls_PropTestValue) 
	 		case 'true' 
			  dp_1.BringToTop = True
		 	case 'false' 
			  dp_1.BringToTop = False
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
	case  'WeekNumbers'
		choose case lower(ls_PropTestValue) 
	 		case 'true' 
			  dp_1.WeekNumbers = True
		 	case 'false' 
			  dp_1.WeekNumbers = False
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
	case  'AllowEdit'
		choose case lower(ls_PropTestValue) 
	 		case 'true' 
			  dp_1.AllowEdit = True
		 	case 'false' 
			  dp_1.AllowEdit = False
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
	case  'ShowUpDown'
		messagebox("Alert","This property is readonly at runtime.")
		return
	case  'TodayCircle'
		choose case lower(ls_PropTestValue) 
	 		case 'true' 
			  dp_1.TodayCircle = True
		 	case 'false' 
			  dp_1.TodayCircle = False
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
	case  'TodaySection'
		choose case lower(ls_PropTestValue) 
	 		case 'true' 
			  dp_1.TodaySection = True
		 	case 'false' 
			  dp_1.TodaySection = False
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
	case  'FirstDayOfWeek'
		choose case ls_PropTestValue 
	 		case 'Sunday!' 
			  dp_1.FirstDayOfWeek = Sunday!
		 	case 'Monday!' 
			  dp_1.FirstDayOfWeek = Monday!
		 	case 'Tuesday!' 
			  dp_1.FirstDayOfWeek = Tuesday!
		 	case 'Wednesday!' 
			  dp_1.FirstDayOfWeek = Wednesday!
		 	case 'Thursday!' 
			  dp_1.FirstDayOfWeek = Thursday!
		 	case 'Friday!' 
			  dp_1.FirstDayOfWeek = Friday!
		 	case 'Saturday!' 
			  dp_1.FirstDayOfWeek = Saturday!
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
	case 'Format'
		choose case ls_PropTestValue 
	 		case 'DtfCustom!' 
			  dp_1.Format = DtfCustom!
	 		case 'DtfLongDate!' 
			  dp_1.Format = DtfLongDate!
	 		case 'DtfShortDate!' 
			  dp_1.Format = DtfShortDate!
	 		case 'DtfTime!' 
			  dp_1.Format = DtfTime!
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose
		
	case  'Underline'
		choose case lower(ls_PropTestValue) 
	 		case 'true' 
			  dp_1.Underline = True
		 	case 'false' 
			  dp_1.Underline = False
			  
		 	case else
			  MessageBox('Warning','Parameter type error.')
			  return
		end choose

	case 'Height'
		if IsNumber(ls_PropTestValue) then
			dp_1.Height = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
//		CalendarTextSize,CalendarTitleBackColor,CalendarTitleTextColor,CalendarTrailingTextColor
	case 'CalendarTextSize'
		if IsNumber(ls_PropTestValue) then
			dp_1.CalendarTextSize = integer(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'CalendarTitleBackColor'
		if IsNumber(ls_PropTestValue) then
			dp_1.CalendarTitleBackColor = long(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'CalendarTitleTextColor'
		if IsNumber(ls_PropTestValue) then
			dp_1.CalendarTitleTextColor = long(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'CalendarTrailingTextColor'
		if IsNumber(ls_PropTestValue) then
			dp_1.CalendarTrailingTextColor = long(ls_PropTestValue)
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Pointer' 
		dp_1.Pointer = ls_PropTestValue 
	case 'TabOrder'
		if IsNumber(ls_PropTestValue) then
			dp_1.TabOrder = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Value'
		if IsDate(ls_PropTestValue) then
			dp_1.Value = DateTime(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'MaxDate'
		if IsDate(ls_PropTestValue) then
			dp_1.MaxDate = Date(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'MinDate'
		if IsDate(ls_PropTestValue) then
			dp_1.MinDate = Date(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Tag'
		dp_1.Tag = ls_PropTestValue
	case 'Visible'
		if lower(ls_PropTestValue) = 'true' then
			dp_1.Visible = True
		elseif lower(ls_PropTestValue) = 'false' then
			dp_1.Visible = False
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Width'
		if IsNumber(ls_PropTestValue) then
			dp_1.Width = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'X'
		if IsNumber(ls_PropTestValue) then
			dp_1.X = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Y'
		if IsNumber(ls_PropTestValue) then
			dp_1.Y = integer(ls_PropTestValue)
		else 
			MessageBox('Warning','Parameter type error.')
			return
		end if
	end choose
	strtip = "The DatePicker " + lb_prop.selecteditem() + " set value is " + WordCap(ls_PropTestValue) + "." 
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
	case  'BringToTop',"Underline","TodaySection","TodayCircle","ShowUpDown","AllowEdit","WeekNumbers"
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
	case 'Format'
		lb_propparm.additem('DtfCustom!')
		lb_propparm.additem('DtfLongDate!')
		lb_propparm.additem('DtfShortDate!')
		lb_propparm.additem('DtfTime!')
	case 'FirstDayOfWeek'
		lb_propparm.additem('Sunday!')
		lb_propparm.additem('Monday!')
		lb_propparm.additem('Tuesday!')
		lb_propparm.additem('Wednesday!')
		lb_propparm.additem('Thursday!')
		lb_propparm.additem('Friday!')
		lb_propparm.additem('Saturday!')
		//wf_random('int',lb_propparm)		
	case 'Value'
		wf_random('date',lb_propparm)
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

String 	strtip , strexevalue, strtestvalue
integer 	intx , inty
String 	strar[]
int 		parmnumber
PowerObject lpowero_parent

strtestvalue = trim(sle_functionparm.text)
parmnumber = wf_str2array(strtestvalue,strar)
choose case lb_function.selecteditem()
	case 'ClassName'
		strexevalue = dp_1.ClassName() 
	case 'GetParent'
		lpowero_parent = dp_1.GetParent()
		strexevalue = lpowero_parent.ClassName()
	case 'GetText'
		strexevalue = dp_1.GetText()
	case 'GetToday'
		strexevalue = String(dp_1.GetToday())
	case 'GetValue'
		datetime dt1
		dp_1.GetValue(dt1)
		strexevalue = String(dt1)
	case 'SetValue'
		strexevalue = string(dp_1.SetValue(DateTime(ls_sle)))
	case 'SetToday'
		strexevalue = string(dp_1.SetToday(Date(ls_sle)))
	case 'Hide'
		strexevalue = String(dp_1.Hide()) 
	case 'Move'
		if parmnumber <> 2 then 
			MessageBox('Warning','Parameter number should be 2.')
			return
		elseif IsNumber(strar[1]) and IsNumber(strar[2]) then
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(dp_1.Move(intx,inty))
		else
			MessageBox('Warning','Parameter type error.Type will be converted.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(dp_1.Move(intx,inty))
			return
		end if
	case 'PointerX'
		strexevalue = String(dp_1.PointerX()) 
	case 'PointerY'
		strexevalue = String(dp_1.PointerY()) 
	case 'PostEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(dp_1.PostEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(dp_1.PostEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(dp_1.PostEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(dp_1.PostEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(dp_1.PostEvent(RButtonDown!))
			case 'Help'
				strexevalue = String(dp_1.PostEvent('Help'))
			case 'LineUp!'
				strexevalue = String(dp_1.PostEvent(lineup!))
			case 'LineDown!'
				strexevalue = String(dp_1.PostEvent(linedown!))
			case 'PageUp!'
				strexevalue = String(dp_1.PostEvent(pageup!))
			case 'PageDown!'
				strexevalue = String(dp_1.PostEvent(pagedown!))
			case 'Moved!'
				strexevalue = String(dp_1.PostEvent(Moved!))
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
	  		strexevalue = String(dp_1.Resize(intx,inty))
		else
			MessageBox('Warning','Parameter type error.Type will be converted.')
			intx = integer(strar[1])
			inty = integer(strar[2])
	  		strexevalue = String(dp_1.Resize(intx,inty))
		end if
	case 'SetFocus'
		strexevalue = String(dp_1.SetFocus())
	case 'SetPosition'
		choose case strtestvalue
			case 'Behind!'
				strexevalue = String(dp_1.SetPosition(Behind!,st_3))
				
			case 'ToTop!'
				strexevalue = String(dp_1.SetPosition(ToTop!)) 
				
			case 'ToBottom!'
				strexevalue = String(dp_1.SetPosition(ToBottom!))
				
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'SetRedraw'
		if lower(strtestvalue) = 'true' then
			strexevalue = String(dp_1.SetRedraw(True))
		elseif lower(strtestvalue) = 'false' then
			strexevalue = String(dp_1.SetRedraw(False))
		else
			MessageBox('Warning','Parameter type error.')
			return
		end if
	case 'Show'
		strexevalue = String(dp_1.Show())
	case 'TriggerEvent'
		choose case strtestvalue
			case 'Constructor!'
				strexevalue = String(dp_1.TriggerEvent(Constructor!))
			case 'Destructor!'
				strexevalue = String(dp_1.TriggerEvent(Destructor!))
			case 'GetFocus!'
				strexevalue = String(dp_1.TriggerEvent(GetFocus!))
			case 'LoseFocus!'
				strexevalue = String(dp_1.TriggerEvent(LoseFocus!))
			case 'RButtonDown!'
				strexevalue = String(dp_1.TriggerEvent(RButtonDown!))
			case 'Help!'
				strexevalue = String(dp_1.TriggerEvent('Help'))
			case 'Moved!'
				strexevalue = String(dp_1.TriggerEvent(Moved!))
			case 'LineUp!'
				strexevalue = String(dp_1.TriggerEvent(LineUp!))
			case else
				MessageBox('Warning','Parameter error.')
				return
		end choose
	case 'TypeOf'
		if dp_1.typeof() = vscrollbar! then
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
//ClassName,GetParent,GetText,GetToday,GetValue,Hide,Move,PointerX,PointerY,PostEvent,Resize," + &
//				  "SetFocus,SetPosition,SetRedraw,SetToday,SetValue,Show,TriggerEvent,TypeOf"			 
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
//		lb_functionparm.additem('Moved!')
		return
	case 'Resize'
		wf_random('integer,integer',lb_functionparm)
	case 'SetToday'		
		wf_random('date',lb_functionparm)
		return
	case 'SetValue'		
		wf_random('date',lb_functionparm)
		return
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
//		lb_functionparm.additem('LineUp!')
//		lb_functionparm.additem('LineDown!')
//		lb_functionparm.additem('PageUp!')
//		lb_functionparm.additem('PageDown!')
//		lb_functionparm.additem('Moved!')
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

type cb_2 from w_standard_ancestor2`cb_2 within w_datepicker
integer x = 1792
integer y = 1520
integer width = 402
integer height = 108
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_datepicker
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
dp_1.BringToTop = True
dp_1.Height = 100
dp_1.Pointer = ''
dp_1.TabOrder = 0
dp_1.Tag = ''
dp_1.Visible = True
dp_1.Width = 686
dp_1.X = 82
dp_1.Y = 88
dp_1.FirstDayOfWeek=sunday!
dp_1.todaysection = true
dp_1.todaycircle = true
dp_1.weeknumbers = false
tab_1.tabpage_3.lb_out.reset()
end event

type st_tip from w_standard_ancestor2`st_tip within w_datepicker
integer width = 1655
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_datepicker
integer width = 1714
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_datepicker
integer width = 2222
end type

type st_3 from statictext within w_datepicker
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

type dp_1 from datepicker within w_datepicker
integer x = 82
integer y = 88
integer width = 686
integer height = 116
integer taborder = 40
boolean bringtotop = true
boolean border = true
borderstyle borderstyle = stylelowered!
boolean allowedit = true
boolean dropdownright = true
string customformat = "yyyy-mm-dd"
date maxdate = Date("2998-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2013-02-25"), Time("15:44:03.000000"))
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's ValueChanged Event. Parameters are flag="+string(flag)+",  dtm="+string(dtm)
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event clicked;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's Clicked Event. Parameters are flags="+string(flags)+", xpos="+string(xpos)+", ypos="+string(ypos)
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event closeup;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's CloseUp Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event constructor;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's Constructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event destructor;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's Desctructor Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event doubleclicked;string ls_item
//ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's DoubleClicked Event"
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's DoubleClicked Event. Parameters are flags="+string(flags)+", xpos="+string(xpos)+", ypos="+string(ypos)
tab_1.tabpage_3.lb_out.additem(ls_item)


end event

event dragdrop;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's DrapDrop Event"
//ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's DrapDrop Event.parameter source.classname()='"+string(source.classname())+"'"
tab_1.tabpage_3.lb_out.additem(ls_item)
tab_1.tabpage_3.lb_out.additem(string("parameter: source.classname= "+string(source.classname())))
end event

event dragenter;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's DragEnter Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
tab_1.tabpage_3.lb_out.additem(string("parameter: source.classname= "+string(source.classname())))
end event

event dragleave;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's DragLeave Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
tab_1.tabpage_3.lb_out.additem(string("parameter: source.classname= "+string(source.classname())))
end event

event dragwithin;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's DragWithin Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
tab_1.tabpage_3.lb_out.additem(string("parameter: source.classname= "+string(source.classname())))
end event

event dropdown;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's DropDown Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event getfocus;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's GetFocus Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event losefocus;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's LoseFocus Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event precreatewindow;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's PreCreateWindow Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

event rbuttondown;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's RButtonDown Event"
tab_1.tabpage_3.lb_out.additem(ls_item)
tab_1.tabpage_3.lb_out.additem(string(" Parameters are flags="+string(flags)+", xpos="+string(xpos)+", ypos="+string(ypos)))

end event

event userstring;string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"DatePicker's UserString Event. Parameters are flag="+string(flag)+", userstr="+userstr+", dtm="+string(dtm)
tab_1.tabpage_3.lb_out.additem(ls_item)
end event

