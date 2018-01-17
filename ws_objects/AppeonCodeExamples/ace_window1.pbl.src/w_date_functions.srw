$PBExportHeader$w_date_functions.srw
$PBExportComments$Enter a day name/date combination to check if the date entered is valid for the day name entered.
forward
global type w_date_functions from window
end type
type st_1 from statictext within w_date_functions
end type
type st_3 from statictext within w_date_functions
end type
type st_2 from statictext within w_date_functions
end type
type dw_1 from datawindow within w_date_functions
end type
type cb_ok from commandbutton within w_date_functions
end type
type cb_cancel from commandbutton within w_date_functions
end type
type gb_1 from groupbox within w_date_functions
end type
end forward

global type w_date_functions from window
integer x = 521
integer y = 504
integer width = 1870
integer height = 860
boolean titlebar = true
string title = "Date Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_1 st_1
st_3 st_3
st_2 st_2
dw_1 dw_1
cb_ok cb_ok
cb_cancel cb_cancel
gb_1 gb_1
end type
global w_date_functions w_date_functions

forward prototypes
public function string of_getdayname (string as_dayname)
end prototypes

public function string of_getdayname (string as_dayname);//====================================================================
// Function: of_getdayname()
//--------------------------------------------------------------------
// Description:  
//--------------------------------------------------------------------
// Arguments: as_dayname
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	caifangpeng 		Date: 2004/10/18
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string ls_ReturnDayName

choose case Lower(as_DayName)
	case "sunday"
		ls_ReturnDayName = DayName(2004-10-10)
	case "monday"
		ls_ReturnDayName = DayName(2004-10-11)
	case "tuesday"
		ls_ReturnDayName = DayName(2004-10-12)
	case "wednesday"
		ls_ReturnDayName = DayName(2004-10-13)
	case "thursday"
		ls_ReturnDayName = DayName(2004-10-14)
	case "friday"
		ls_ReturnDayName = DayName(2004-10-15)
	case "saturday"
		ls_ReturnDayName = DayName(2004-10-16)
end choose

Return ls_ReturnDayName
end function

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description:  initialize datawindow, set test date default as current date
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
int i
DataWindowChild ldwc_DayNameList

This.X = 0
This.Y = 0
dw_1.InsertRow (0)
dw_1.Object.test_date[1] = Today()

dw_1.GetChild("day_name",ldwc_DayNameList)
for i = 1 to 7
	ldwc_DayNameList.InsertRow(0)
next
ldwc_DayNameList.SetItem(1,"day_name",of_GetDayName("sunday"))
ldwc_DayNameList.SetItem(2,"day_name",of_GetDayName("monday"))
ldwc_DayNameList.SetItem(3,"day_name",of_GetDayName("tuesday"))
ldwc_DayNameList.SetItem(4,"day_name",of_GetDayName("wednesday"))
ldwc_DayNameList.SetItem(5,"day_name",of_GetDayName("thursday"))
ldwc_DayNameList.SetItem(6,"day_name",of_GetDayName("friday"))
ldwc_DayNameList.SetItem(7,"day_name",of_GetDayName("saturday"))

end event

on w_date_functions.create
this.st_1=create st_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_1=create dw_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.st_3,&
this.st_2,&
this.dw_1,&
this.cb_ok,&
this.cb_cancel,&
this.gb_1}
end on

on w_date_functions.destroy
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.gb_1)
end on

type st_1 from statictext within w_date_functions
integer x = 82
integer y = 412
integer width = 1641
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
boolean focusrectangle = false
end type

type st_3 from statictext within w_date_functions
integer x = 82
integer y = 580
integer width = 1664
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
boolean focusrectangle = false
end type

type st_2 from statictext within w_date_functions
integer x = 82
integer y = 512
integer width = 1664
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_date_functions
integer x = 59
integer y = 36
integer width = 1001
integer height = 248
integer taborder = 10
string dataobject = "d_date_functions"
boolean border = false
end type

type cb_ok from commandbutton within w_date_functions
integer x = 1463
integer y = 32
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Execute"
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

////////////////////////////////////////////////////////////////////
// Purpose:  Determine whether the specified test date is valid for
//				 the specified day name.  Display information as to
//				 whether the date is valid or invalid.  
////////////////////////////////////////////////////////////////////

Date		ld_testdate, &
	ld_closest
String	ls_dayname, &
	ls_when
Long		ll_days
n_util   lnv_util

/////////////////////////////////////////////////////////////////////
// Check if both columns have been entered on the datawindow
/////////////////////////////////////////////////////////////////////
If dw_1.AcceptText() = -1 Then
	Return
End If
lnv_util = Create n_util

/////////////////////////////////////////////////////////////////////
// Get the data
/////////////////////////////////////////////////////////////////////
ls_dayname = dw_1.GetItemString(1,"day_name")
ld_testdate = dw_1.GetItemDate(1,"test_date")


/////////////////////////////////////////////////////////////////////
// call the check_dayname function to determine whether the test date
// is valid for the day name.
/////////////////////////////////////////////////////////////////////
If lnv_util.of_check_dayname (ls_dayname, ld_testdate) Then
	// Display message to show that test date is valid for day name
	st_1.Text = 'Yes, ' + String (ld_testdate, 'mm/dd/yyyy') + ' is ' + ls_dayname + '!'
	st_2.Text = ''
	st_3.Text = ''
Else
	st_1.Text = 'No, ' + String (ld_testdate, 'mm/dd/yyyy') + ' is ' + &
		DayName (ld_testdate) + '.'
	
	// Determine which date is the closest [dayname] to [testdate]
	ld_closest = lnv_util.of_closest_date (ls_dayname, ld_testdate)
	st_2.Text = 'The closest ' + ls_dayname + ' to ' + &
		String (ld_testdate, 'mm/dd/yyyy') + ' is ' + String (ld_closest, 'mm/dd/yyyy')
	
	// Determine the relative number of days from closest date to test date
	ll_days = DaysAfter (ld_testdate, ld_closest)
	If ll_days > 0 Then
		ls_when = ' after '
	Else
		ls_when = ' before '
	End If
	st_3.Text = 'which occurs ' + String (Abs (ll_days)) + ' days' + &
		ls_when + String (ld_testdate, 'mm/dd/yyyy') + '.'
End If




end event

type cb_cancel from commandbutton within w_date_functions
integer x = 1463
integer y = 156
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
CLOSE (Parent)

end event

type gb_1 from groupbox within w_date_functions
integer x = 41
integer y = 320
integer width = 1765
integer height = 412
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Execute Information"
end type

