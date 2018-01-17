$PBExportHeader$w_datepickerdemo.srw
forward
global type w_datepickerdemo from w_basesheet
end type
type st_8 from statictext within w_datepickerdemo
end type
type em_4 from editmask within w_datepickerdemo
end type
type em_3 from editmask within w_datepickerdemo
end type
type st_7 from statictext within w_datepickerdemo
end type
type em_2 from editmask within w_datepickerdemo
end type
type st_6 from statictext within w_datepickerdemo
end type
type st_5 from statictext within w_datepickerdemo
end type
type em_1 from editmask within w_datepickerdemo
end type
type dp_4 from datepicker within w_datepickerdemo
end type
type dp_3 from datepicker within w_datepickerdemo
end type
type dp_2 from datepicker within w_datepickerdemo
end type
type st_4 from statictext within w_datepickerdemo
end type
type st_3 from statictext within w_datepickerdemo
end type
type st_2 from statictext within w_datepickerdemo
end type
type st_1 from statictext within w_datepickerdemo
end type
type dw_1 from datawindow within w_datepickerdemo
end type
type dp_1 from datepicker within w_datepickerdemo
end type
type gb_1 from groupbox within w_datepickerdemo
end type
type gb_2 from groupbox within w_datepickerdemo
end type
type gb_3 from groupbox within w_datepickerdemo
end type
end forward

global type w_datepickerdemo from w_basesheet
integer width = 3470
integer height = 2292
string title = "DatePicker Features"
long backcolor = 67108864
string icon = "Application5!"
boolean center = true
st_8 st_8
em_4 em_4
em_3 em_3
st_7 st_7
em_2 em_2
st_6 st_6
st_5 st_5
em_1 em_1
dp_4 dp_4
dp_3 dp_3
dp_2 dp_2
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
dw_1 dw_1
dp_1 dp_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_datepickerdemo w_datepickerdemo

on w_datepickerdemo.create
int iCurrent
call super::create
this.st_8=create st_8
this.em_4=create em_4
this.em_3=create em_3
this.st_7=create st_7
this.em_2=create em_2
this.st_6=create st_6
this.st_5=create st_5
this.em_1=create em_1
this.dp_4=create dp_4
this.dp_3=create dp_3
this.dp_2=create dp_2
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.dp_1=create dp_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_8
this.Control[iCurrent+2]=this.em_4
this.Control[iCurrent+3]=this.em_3
this.Control[iCurrent+4]=this.st_7
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.st_6
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.em_1
this.Control[iCurrent+9]=this.dp_4
this.Control[iCurrent+10]=this.dp_3
this.Control[iCurrent+11]=this.dp_2
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.dw_1
this.Control[iCurrent+17]=this.dp_1
this.Control[iCurrent+18]=this.gb_1
this.Control[iCurrent+19]=this.gb_2
this.Control[iCurrent+20]=this.gb_3
end on

on w_datepickerdemo.destroy
call super::destroy
destroy(this.st_8)
destroy(this.em_4)
destroy(this.em_3)
destroy(this.st_7)
destroy(this.em_2)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.em_1)
destroy(this.dp_4)
destroy(this.dp_3)
destroy(this.dp_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.dp_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;Date		ldt_last_day_curr_month , ldt_first_day_next_month 
Integer	li_curr_day, li_curr_month , li_curr_year 


li_curr_day = Day (Today())
li_curr_month = Month (Today())
li_curr_year = Year ( Today())

dw_1.SetItem(1, "date1", Date(li_curr_year, li_curr_month, 1 ))

ldt_first_day_next_month = Date(li_curr_year, li_curr_month+1, 1 )
ldt_last_day_curr_month = RelativeDate ( ldt_first_day_next_month , -1 )
dw_1.SetItem(1, "date2", ldt_last_day_curr_month ) 

dw_1.SetItem(1, "date3", today())
dw_1.SetItem(1, "time1", now())

end event

type st_8 from statictext within w_datepickerdemo
integer x = 1527
integer y = 776
integer width = 768
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DateMask2:(DropDownRight)"
boolean focusrectangle = false
end type

type em_4 from editmask within w_datepickerdemo
integer x = 1536
integer y = 860
integer width = 1047
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 16711680
string text = "2005-01-01"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean dropdowncalendar = true
boolean dropdownright = true
long calendartextcolor = 16777215
long calendartitletextcolor = 16777215
long calendartrailingtextcolor = 0
long calendarbackcolor = 255
long calendartitlebackcolor = 134217856
end type

event constructor;this.text = string(today())
end event

type em_3 from editmask within w_datepickerdemo
integer x = 1531
integer y = 1132
integer width = 1047
integer height = 100
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm:ss:fffff"
boolean autoskip = true
boolean spin = true
end type

event constructor;this.text = string(now(),'hh:mm:ss:fffff')
end event

type st_7 from statictext within w_datepickerdemo
integer x = 1522
integer y = 1056
integer width = 302
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TimeMask:"
boolean focusrectangle = false
end type

type em_2 from editmask within w_datepickerdemo
integer x = 151
integer y = 1136
integer width = 1047
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "2005-01-01"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "[date][time]"
boolean dropdowncalendar = true
end type

event constructor;this.text = string(today()) + ' ' + string(now(),'hh:mm:ss:fffff')
end event

type st_6 from statictext within w_datepickerdemo
integer x = 165
integer y = 1056
integer width = 421
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DateTimeMask:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_datepickerdemo
integer x = 178
integer y = 776
integer width = 288
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DateMask:"
boolean focusrectangle = false
end type

type em_1 from editmask within w_datepickerdemo
integer x = 165
integer y = 860
integer width = 1047
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mmm/yyyy"
boolean dropdowncalendar = true
long calendartextcolor = 0
long calendartitletextcolor = 16777215
long calendartrailingtextcolor = 16711680
long calendarbackcolor = 15793151
long calendartitlebackcolor = 16711680
end type

event constructor;this.text = string(today())
end event

type dp_4 from datepicker within w_datepickerdemo
integer x = 1527
integer y = 188
integer width = 1047
integer height = 100
integer taborder = 20
boolean border = true
borderstyle borderstyle = stylelowered!
boolean dropdownright = true
date maxdate = Date("2998-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2008-04-07"), Time("11:50:15.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
long calendartextcolor = 16777215
long calendartitletextcolor = 16777215
long calendartrailingtextcolor = 16777215
long calendarbackcolor = 134217729
long calendartitlebackcolor = 12632256
boolean todaysection = true
boolean todaycircle = true
boolean weeknumbers = true
end type

type dp_3 from datepicker within w_datepickerdemo
integer x = 1527
integer y = 436
integer width = 1047
integer height = 100
integer taborder = 40
boolean border = true
borderstyle borderstyle = stylelowered!
datetimeformat format = dtfcustom!
string customformat = "dd/MM/yyyy hh:mm:ss"
date maxdate = Date("2998-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2008-04-07"), Time("11:50:15.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
long calendartextcolor = 65280
long calendartitletextcolor = 65280
long calendartrailingtextcolor = 65280
long calendarbackcolor = 0
long calendartitlebackcolor = 0
boolean todaysection = true
boolean todaycircle = true
end type

type dp_2 from datepicker within w_datepickerdemo
integer x = 165
integer y = 436
integer width = 1047
integer height = 100
integer taborder = 30
boolean border = true
borderstyle borderstyle = stylelowered!
boolean showupdown = true
datetimeformat format = dtftime!
date maxdate = Date("2998-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2008-04-07"), Time("11:50:15.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
long calendartextcolor = 255
long calendartitletextcolor = 134217856
long calendartrailingtextcolor = 255
long calendarbackcolor = 134217747
long calendartitlebackcolor = 8421376
boolean todaysection = true
end type

type st_4 from statictext within w_datepickerdemo
integer x = 1527
integer y = 364
integer width = 485
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Custom Format:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_datepickerdemo
integer x = 165
integer y = 364
integer width = 485
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Time:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_datepickerdemo
integer x = 1527
integer y = 108
integer width = 896
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Short Date: (DropDownRight)"
boolean focusrectangle = false
end type

type st_1 from statictext within w_datepickerdemo
integer x = 165
integer y = 108
integer width = 485
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Long Date:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_datepickerdemo
integer x = 151
integer y = 1564
integer width = 2734
integer height = 460
integer taborder = 90
string title = "none"
string dataobject = "d_datepickerdemo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dp_1 from datepicker within w_datepickerdemo
integer x = 165
integer y = 188
integer width = 1047
integer height = 100
integer taborder = 10
boolean border = true
borderstyle borderstyle = stylelowered!
datetimeformat format = dtflongdate!
date maxdate = Date("2998-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2008-04-07"), Time("11:50:15.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type gb_1 from groupbox within w_datepickerdemo
integer x = 91
integer y = 12
integer width = 2889
integer height = 656
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DatePicker"
end type

type gb_2 from groupbox within w_datepickerdemo
integer x = 91
integer y = 684
integer width = 2889
integer height = 656
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "EditMask"
end type

type gb_3 from groupbox within w_datepickerdemo
integer x = 91
integer y = 1436
integer width = 2889
integer height = 656
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "DataWindow"
end type

