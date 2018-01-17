$PBExportHeader$w_printfunction.srw
forward
global type w_printfunction from window
end type
type dw_functionparm from datawindow within w_printfunction
end type
type lb_functionname from listbox within w_printfunction
end type
type st_4 from statictext within w_printfunction
end type
type cb_2 from commandbutton within w_printfunction
end type
type cb_clear from commandbutton within w_printfunction
end type
type lb_output from listbox within w_printfunction
end type
type cb_1 from commandbutton within w_printfunction
end type
type gb_1 from groupbox within w_printfunction
end type
type gb_4 from groupbox within w_printfunction
end type
type gb_2 from groupbox within w_printfunction
end type
end forward

global type w_printfunction from window
integer width = 2642
integer height = 1328
boolean titlebar = true
string title = "Print Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_functionparm dw_functionparm
lb_functionname lb_functionname
st_4 st_4
cb_2 cb_2
cb_clear cb_clear
lb_output lb_output
cb_1 cb_1
gb_1 gb_1
gb_4 gb_4
gb_2 gb_2
end type
global w_printfunction w_printfunction

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

CONSTANT String	NO_ACTION = '$'

integer iflag = 0
integer i = 1
n_util inv_util
pointer p1
end variables

forward prototypes
public function integer wf_str2array (string as_data, ref string as_rv[])
public subroutine wf_functionparm (string as_parmname, string as_parmvalue, integer ai_tagindex)
public function string wf_printdefinefont ()
public function string wf_print ()
public function string wf_printbitmap ()
public function string wf_printline ()
public function string wf_printoval ()
public function string wf_printrect ()
public function string wf_printroundrect ()
public function string wf_printscreen ()
public function string wf_printsetfont ()
public function string wf_printsetspacing ()
public function string wf_printtext ()
public function string wf_printwidth ()
public subroutine wf_getprinters ()
end prototypes

public function integer wf_str2array (string as_data, ref string as_rv[]);//====================================================================
// Function: wf_str2array()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value    	string	as_data		
//		reference	string	as_rv[]		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	fujinrong Date:2004/04/23
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if isnull(as_data) then return 0

long		ll_startPos, ll_endPos, ll_upperBound

ll_upperBound = 1
ll_startPos = 1
ll_endPos     = PosA(as_data, ',', ll_startPos)

if ll_endPos = 0 then
	as_rv[ll_upperBound] = as_data
else
	do while ll_endPos <> 0
		as_rv[ll_upperBound] = MidA(as_data,ll_startPos,ll_endPos - ll_startPos)
		ll_startPos 	= ll_endPos + 1
		ll_endPos 		= PosA(as_data,',',ll_startPos)
		ll_upperBound 	= ll_upperBound + 1
	loop
	as_rv[ll_upperBound] = MidA(as_data,ll_startPos)
end if

return ll_upperBound
end function

public subroutine wf_functionparm (string as_parmname, string as_parmvalue, integer ai_tagindex);
Integer	li_row,li_i
String	ls_name[],ls_value[]

wf_str2array(as_parmname,ls_name)
wf_str2array(as_parmvalue,ls_value)

if upperBound(ls_name) <> upperBound(ls_value) then
	return
end if

dw_functionparm.setRedraw(false)
dw_functionparm.reset()
dw_functionparm.enabled = true

for li_i = 1 to upperBound(ls_name)
	li_row = dw_functionparm.insertrow(0)
	dw_functionparm.object.parmname[li_row] = ls_name[li_i]
	dw_functionparm.object.parmvalue[li_row] = ls_value[li_i]
	if li_i = ai_tagIndex then
		dw_functionparm.object.tag[li_row] = '1'
	end if
next

if dw_functionparm.rowcount() > 0 then	
	if ai_tagIndex <> 1 then
		dw_functionparm.setfocus()
		dw_functionparm.scrolltorow(1)
	else		
		if ai_tagIndex + 1 <= dw_functionparm.rowcount() then
			dw_functionparm.setfocus()
			dw_functionparm.scrolltorow(ai_tagIndex + 1)
		end if
	end if
	if dw_functionparm.rowcount() = 1 and ai_tagindex > 0 then
		dw_functionparm.enabled = false
	end if
end if
dw_functionparm.setRedraw(true)
end subroutine

public function string wf_printdefinefont ();//====================================================================
// Function: wf_printdefinefont()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
 	
String	strexevalue,ls_x,ls_y,ls_w,ls_h
Long  li_job
String ls_fontnumber,ls_facename,ls_fontpitch,ls_fontfamily,ls_italic,ls_underline

ls_fontnumber = dw_functionparm.object.parmvalue[2]
ls_facename = dw_functionparm.object.parmvalue[3]
ls_h = dw_functionparm.object.parmvalue[4]
ls_w = dw_functionparm.object.parmvalue[5]
ls_fontpitch = dw_functionparm.object.parmvalue[6]
ls_fontfamily = dw_functionparm.object.parmvalue[7]
ls_italic = dw_functionparm.object.parmvalue[8]
ls_underline = dw_functionparm.object.parmvalue[9]

if Not isNumber(ls_fontnumber) then
	messagebox('Warning','The parameter fontnumber should be a number(1 to 8) which you want to assign to the font.')
	dw_functionparm.scrolltorow(2)
	return NO_ACTION
end if
if Not isNumber(ls_h) then
	messagebox('Warning','The parameter height should be an integer whose value is the height ' + &
			'of the type in thousandths of an inch (for example, 250 for 18-point 10Cpi)' + &
			' or a negative number representing the point size (for example, -18 for 18-point).')
	dw_functionparm.scrolltorow(4)
	return NO_ACTION
end if
if Not isNumber(ls_w) then
	messagebox('Warning','The parameter height should be an integer,' + &
			'The stroke weight of the type. Normal weight is 400 and bold is 700.')
	dw_functionparm.scrolltorow(5)
	return NO_ACTION
end if

FontPitch lfp
Choose Case lower(trim(ls_fontpitch))
	Case 'default!'
		lfp = Default!
	Case 'fixed!'
		lfp = Fixed!
	Case 'variable!'
		lfp = Variable!
	Case Else
		messagebox('Warning','The parameter fontpitch should be Default! or Fixed! or Variable!.')
		dw_functionparm.scrolltorow(6)
		return NO_ACTION
End choose

FontFamily lff
Choose Case lower(trim(ls_fontfamily))
	Case 'anyfont!'
		lff = anyfont!

	Case 'decorative!'
		lff = decorative!
	Case 'modern!'
		lff = modern!
	Case 'roman!'
		lff = roman!
	Case 'script!'
		lff = script!
	Case 'swiss!'
		lff = swiss!
	Case Else
		messagebox('Warning','The parameter fontfamily should be AnyFont! or Decorative! or ~r~n' + &
		'Modern! or Roman! or Script! or Swiss!.')
		dw_functionparm.scrolltorow(7)
		return NO_ACTION
End Choose

Boolean lb_italic
choose case lower(trim(ls_italic))
	case 'true'
		lb_italic = true
	case 'false'
		lb_italic = false
	case else
		messagebox('Warning','The parameter italic should be a ~r~nboolean value(True or False) indicating whether the font is italic.')
		dw_functionparm.scrolltorow(8)
		return NO_ACTION
end choose

Boolean lb_underline
choose case lower(trim(ls_underline))
	case 'false'
		lb_underline = false
	case 'true'
		lb_underline = true
	case else
		messagebox('Warning','The parameter italic should be a ~r~nboolean value(True or False) indicating whether the font is underlined.')
		dw_functionparm.scrolltorow(9)
		return NO_ACTION
end choose	

li_job = printOpen()
strexevalue = String(printDefineFont(li_job,Integer(ls_fontnumber),ls_facename,&
	Integer(ls_h),Integer(ls_w),lfp,lff,lb_italic,lb_underline))
printClose(li_job)

Return strexevalue
end function

public function string wf_print ();//====================================================================
// Function: wf_print()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
 	
String	strexevalue,ls_x,ls_y,ls_w,ls_h
Long  li_job
	
ls_x = dw_functionparm.object.parmvalue[2]
ls_y = dw_functionparm.object.parmvalue[3]
ls_w = dw_functionparm.object.parmvalue[4]
ls_h = dw_functionparm.object.parmvalue[5]

if Not isNumber(ls_x) then
	messagebox('Warning','The parameter x should be an integer.')
	dw_functionparm.scrolltorow(2)
	return NO_ACTION
end if
if Not isNumber(ls_y) then
	messagebox('Warning','The parameter y should be an integer.')
	dw_functionparm.scrolltorow(3)
	return NO_ACTION
end if
if LenA(ls_w) > 0 then
	if Not isNumber(ls_w) then
		messagebox('Warning','The parameter width should be an integer or empty.')
		dw_functionparm.scrolltorow(4)
		return NO_ACTION
	end if
end if
if LenA(ls_h) > 0 then
	if Not isNumber(ls_h) then
		messagebox('Warning','The parameter height should be an integer or empty.')
		dw_functionparm.scrolltorow(5)
		return NO_ACTION
	end if
end if

//li_job = printOpen()
//if len(ls_w) > 0 and len(ls_h) > 0 then
//	strexevalue = string(this.print(li_job,integer(ls_x),integer(ls_y),integer(ls_w),integer(ls_h)))
//else
//	strexevalue = string(this.print(li_job,integer(ls_x),integer(ls_y)))
//end if
//printClose(li_job)

Return strexevalue
end function

public function string wf_printbitmap ();//====================================================================
// Function: wf_printbitmap()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
 	
String	strexevalue,ls_x,ls_y,ls_w,ls_h,ls_bitmap
Long  li_job

ls_bitmap = dw_functionparm.object.parmvalue[2]
ls_x = dw_functionparm.object.parmvalue[3]
ls_y = dw_functionparm.object.parmvalue[4]
ls_w = dw_functionparm.object.parmvalue[5]
ls_h = dw_functionparm.object.parmvalue[6]

//if Not fileExists(ls_bitmap) then
//	messagebox('Warning','File "' + ls_bitmap + '" does not exist.')
//	dw_functionparm.scrolltorow(2)
//	return NO_ACTION
//end if
if Not isNumber(ls_x) then
	messagebox('Warning','The parameter x should be an integer.')
	dw_functionparm.scrolltorow(3)
	return NO_ACTION
end if
if Not isNumber(ls_y) then
	messagebox('Warning','The parameter y should be an integer.')
	dw_functionparm.scrolltorow(4)
	return NO_ACTION
end if
if Not isNumber(ls_w) then
	messagebox('Warning','The parameter width should be an integer.')
	dw_functionparm.scrolltorow(5)
	return NO_ACTION
end if
if Not isNumber(ls_h) then
	messagebox('Warning','The parameter height should be an integer.')
	dw_functionparm.scrolltorow(6)
	return NO_ACTION
end if

li_job = printOpen()
strexevalue = string(printBitmap(li_job,ls_bitmap,integer(ls_x),integer(ls_y),integer(ls_w),integer(ls_h)))
printClose(li_job)

Return strexevalue
end function

public function string wf_printline ();//====================================================================
// Function: wf_printline()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
 	
String	strexevalue,ls_x1,ls_y1,ls_x2,ls_y2,ls_thickness
Long  li_job
	
ls_x1 = dw_functionparm.object.parmvalue[2]
ls_y1 = dw_functionparm.object.parmvalue[3]
ls_x2 = dw_functionparm.object.parmvalue[4]
ls_y2 = dw_functionparm.object.parmvalue[5]
ls_thickness = dw_functionparm.object.parmvalue[6]

if Not isNumber(ls_x1) then
	messagebox('Warning','The parameter x1 should be an integer.')
	dw_functionparm.scrolltorow(2)
	return NO_ACTION
end if
if Not isNumber(ls_y1) then
	messagebox('Warning','The parameter y1 should be an integer.')
	dw_functionparm.scrolltorow(3)
	return NO_ACTION
end if
if LenA(ls_x2) > 0 then
	if Not isNumber(ls_x2) then
		messagebox('Warning','The parameter x2 should be an integer.')
		dw_functionparm.scrolltorow(4)
		return NO_ACTION
	end if
end if
if LenA(ls_y2) > 0 then
	if Not isNumber(ls_y2) then
		messagebox('Warning','The parameter y2 should be an integer.')
		dw_functionparm.scrolltorow(5)
		return NO_ACTION
	end if
end if
if LenA(ls_thickness) > 0 then
	if Not isNumber(ls_thickness) then
		messagebox('Warning','The parameter thickness should be an integer.')
		dw_functionparm.scrolltorow(6)
		return NO_ACTION
	end if
end if

li_job = printOpen()
strexevalue = string(printLine(li_job,integer(ls_x1),integer(ls_y1),integer(ls_x2),integer(ls_y2),integer(ls_thickness)))
printClose(li_job)

Return strexevalue
end function

public function string wf_printoval ();//====================================================================
// Function: wf_printoval()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
 	
String	strexevalue,ls_x,ls_y,ls_w,ls_h,ls_thickness
Long  li_job

ls_x = dw_functionparm.object.parmvalue[2]
ls_y = dw_functionparm.object.parmvalue[3]
ls_w = dw_functionparm.object.parmvalue[4]
ls_h = dw_functionparm.object.parmvalue[5]
ls_thickness = dw_functionparm.object.parmvalue[6]

if Not isNumber(ls_x) then
	messagebox('Warning','The parameter x should be an integer.')
	dw_functionparm.scrolltorow(2)
	return NO_ACTION
end if
if Not isNumber(ls_y) then
	messagebox('Warning','The parameter y should be an integer.')
	dw_functionparm.scrolltorow(3)
	return NO_ACTION
end if
if LenA(ls_w) > 0 then
	if Not isNumber(ls_w) then
		messagebox('Warning','The parameter width should be an integer.')
		dw_functionparm.scrolltorow(4)
		return NO_ACTION
	end if
end if
if LenA(ls_h) > 0 then
	if Not isNumber(ls_h) then
		messagebox('Warning','The parameter height should be an integer.')
		dw_functionparm.scrolltorow(5)
		return NO_ACTION
	end if
end if
if LenA(ls_thickness) > 0 then
	if Not isNumber(ls_thickness) then
		messagebox('Warning','The parameter thickness should be an integer.')
		dw_functionparm.scrolltorow(6)
		return NO_ACTION
	end if
end if

li_job = printOpen()
strexevalue = string(printOval(li_job,integer(ls_x),integer(ls_y),integer(ls_w),integer(ls_h),integer(ls_thickness)))
printClose(li_job)

Return strexevalue
end function

public function string wf_printrect ();//====================================================================
// Function: wf_printrect()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
 	
String	strexevalue,ls_x,ls_y,ls_w,ls_h,ls_thickness
Long  li_job

ls_x = dw_functionparm.object.parmvalue[2]
ls_y = dw_functionparm.object.parmvalue[3]
ls_w = dw_functionparm.object.parmvalue[4]
ls_h = dw_functionparm.object.parmvalue[5]
ls_thickness = dw_functionparm.object.parmvalue[6]

if Not isNumber(ls_x) then
	messagebox('Warning','The parameter x should be an integer.')
	dw_functionparm.scrolltorow(2)
	return NO_ACTION
end if
if Not isNumber(ls_y) then
	messagebox('Warning','The parameter y should be an integer.')
	dw_functionparm.scrolltorow(3)
	return NO_ACTION
end if
if LenA(ls_w) > 0 then
	if Not isNumber(ls_w) then
		messagebox('Warning','The parameter width should be an integer.')
		dw_functionparm.scrolltorow(4)
		return NO_ACTION
	end if
end if
if LenA(ls_h) > 0 then
	if Not isNumber(ls_h) then
		messagebox('Warning','The parameter height should be an integer.')
		dw_functionparm.scrolltorow(5)
		return NO_ACTION
	end if
end if
if LenA(ls_thickness) > 0 then
	if Not isNumber(ls_thickness) then
		messagebox('Warning','The parameter thickness should be an integer.')
		dw_functionparm.scrolltorow(6)
		return NO_ACTION
	end if
end if

li_job = printOpen()
strexevalue = string(printRect(li_job,integer(ls_x),integer(ls_y),integer(ls_w),integer(ls_h),integer(ls_thickness)))
printClose(li_job)

Return strexevalue
end function

public function string wf_printroundrect ();//====================================================================
// Function: wf_PrintRoundRect()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
 	
String	strexevalue,ls_x,ls_y,ls_w,ls_h,ls_xr,ls_yr,ls_thickness
Long  li_job

ls_x = dw_functionparm.object.parmvalue[2]
ls_y = dw_functionparm.object.parmvalue[3]
ls_w = dw_functionparm.object.parmvalue[4]
ls_h = dw_functionparm.object.parmvalue[5]
ls_xr = dw_functionparm.object.parmvalue[6]
ls_yr = dw_functionparm.object.parmvalue[7]
ls_thickness = dw_functionparm.object.parmvalue[8]

if Not isNumber(ls_x) then
	messagebox('Warning','The parameter x should be an integer.')
	dw_functionparm.scrolltorow(2)
	return NO_ACTION
end if
if Not isNumber(ls_y) then
	messagebox('Warning','The parameter y should be an integer.')
	dw_functionparm.scrolltorow(3)
	return NO_ACTION
end if
if LenA(ls_w) > 0 then
	if Not isNumber(ls_w) then
		messagebox('Warning','The parameter width should be an integer.')
		dw_functionparm.scrolltorow(4)
		return NO_ACTION
	end if
end if
if LenA(ls_h) > 0 then
	if Not isNumber(ls_h) then
		messagebox('Warning','The parameter height should be an integer.')
		dw_functionparm.scrolltorow(5)
		return NO_ACTION
	end if
end if
if LenA(ls_xr) > 0 then
	if Not isNumber(ls_thickness) then
		messagebox('Warning','The parameter xradius should be an integer.')
		dw_functionparm.scrolltorow(6)
		return NO_ACTION
	end if
end if
if LenA(ls_yr) > 0 then
	if Not isNumber(ls_thickness) then
		messagebox('Warning','The parameter yradiu should be an integer.')
		dw_functionparm.scrolltorow(7)
		return NO_ACTION
	end if
end if
if LenA(ls_thickness) > 0 then
	if Not isNumber(ls_thickness) then
		messagebox('Warning','The parameter thickness should be an integer.')
		dw_functionparm.scrolltorow(8)
		return NO_ACTION
	end if
end if

li_job = printOpen()
strexevalue = string(printRoundRect(li_job,integer(ls_x),integer(ls_y),integer(ls_w),&
	integer(ls_h),integer(ls_xr),integer(ls_yr),integer(ls_thickness)))
printClose(li_job)

Return strexevalue
end function

public function string wf_printscreen ();//====================================================================
// Function: wf_printscreen()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
 	
String	strexevalue,ls_x,ls_y,ls_w,ls_h
Long  li_job

ls_x = dw_functionparm.object.parmvalue[2]
ls_y = dw_functionparm.object.parmvalue[3]
ls_w = dw_functionparm.object.parmvalue[4]
ls_h = dw_functionparm.object.parmvalue[5]

if Not isNumber(ls_x) then
	messagebox('Warning','The parameter x should be a number.')
	dw_functionparm.scrolltorow(2)
	return NO_ACTION
end if
if Not isNumber(ls_y) then
	messagebox('Warning','The parameter y should be a number.')
	dw_functionparm.scrolltorow(3)
	return NO_ACTION
end if
if LenA(ls_w) > 0 then
	if Not isNumber(ls_w) then
		messagebox('Warning','The parameter width should be a number or empty.')
		dw_functionparm.scrolltorow(4)
		return NO_ACTION
	end if
end if
if LenA(ls_h) > 0 then
	if Not isNumber(ls_h) then
		messagebox('Warning','The parameter height should be a number or empty.')
		dw_functionparm.scrolltorow(5)
		return NO_ACTION
	end if
end if

li_job = printOpen()
if LenA(ls_w) > 0 and LenA(ls_h) > 0 then
	strexevalue = string(printScreen(li_job,integer(ls_x),integer(ls_y),integer(ls_w),integer(ls_h)))
else
	strexevalue = string(printScreen(li_job,integer(ls_x),integer(ls_y)))
end if
printClose(li_job)

Return strexevalue
end function

public function string wf_printsetfont ();//====================================================================
// Function: wf_printsetfont()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_fontnumber,strexevalue
Long  li_job

ls_fontnumber = dw_functionparm.object.parmvalue[2]

if Not isNumber(ls_fontnumber) then
	messagebox('Warning','The parameter fontnumber should be a number(1 to 8) which you want to assign to the font.')
	dw_functionparm.scrolltorow(2)
	return NO_ACTION
end if

li_job = printOpen()
PrintDefineFont(li_job, 2, "Courier 10Cps",250, 700, Default!, Modern!, FALSE, FALSE)
strexevalue = String(PrintSetFont(li_job,integer(ls_fontnumber)))
Print(li_job,"Appeon Corporation")
printClose(li_job)

Return strexevalue
end function

public function string wf_printsetspacing ();//====================================================================
// Function: wf_printsetspacing()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_spacingfactor,strexevalue
Long  li_job

ls_spacingfactor = dw_functionparm.object.parmvalue[2]

if Not isNumber(ls_spacingfactor) then
	messagebox('Warning','The parameter spacingfactor should be a number ~r~nby which you want to multiply the character height to ~r~ndetermine the vertical line-to-line spacing. ')
	dw_functionparm.scrolltorow(2)
	return NO_ACTION
end if

li_job = printOpen()
strexevalue = String(PrintSetSpacing(li_job,dec(ls_spacingfactor)))
printClose(li_job)

Return strexevalue
end function

public function string wf_printtext ();//====================================================================
// Function: wf_printtext()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
 	
String	strexevalue,ls_x,ls_y,ls_fontnumber,ls_string
Long  li_job

ls_string = dw_functionparm.object.parmvalue[2]
ls_x = dw_functionparm.object.parmvalue[3]
ls_y = dw_functionparm.object.parmvalue[4]
ls_fontnumber = dw_functionparm.object.parmvalue[5]

if LenA(ls_string) < 1 then
	messagebox('Warning','Please input a string.')
	dw_functionparm.scrolltorow(2)
	return NO_ACTION
end if
if Not isNumber(ls_x) then
	messagebox('Warning','The parameter x should be an integer.')
	dw_functionparm.scrolltorow(3)
	return NO_ACTION
end if
if Not isNumber(ls_y) then
	messagebox('Warning','The parameter y should be an integer.')
	dw_functionparm.scrolltorow(4)
	return NO_ACTION
end if
if LenA(ls_fontnumber) > 0 then
	if Not isNumber(ls_fontnumber) then
		messagebox('Warning','The parameter width fontnumber be a number.')
		dw_functionparm.scrolltorow(5)
		return NO_ACTION
	end if
end if

li_job = printOpen()
if LenA(ls_fontnumber) > 0 then
	strexevalue = string(printText(li_job,ls_string,integer(ls_x),integer(ls_y),integer(ls_fontnumber)))
else
	strexevalue = string(printText(li_job,ls_string,integer(ls_x),integer(ls_y)))
end if
printClose(li_job)

Return strexevalue
end function

public function string wf_printwidth ();//====================================================================
// Function: wf_printwidth()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	fujinrong		Date: 2004/04/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_string,strexevalue
Long  li_job

ls_string = dw_functionparm.object.parmvalue[2]

if LenA(ls_string) < 1 then
	messagebox('Warning','Please input a string.')
	dw_functionparm.scrolltorow(2)
	return NO_ACTION
end if

li_job = printOpen()
strexevalue = String(PrintWidth(li_job,ls_string))
printClose(li_job)

Return strexevalue
end function

public subroutine wf_getprinters ();//====================================================================
// Function: wf_GetPrinters()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		
//--------------------------------------------------------------------
// Returns: None
//--------------------------------------------------------------------
// Author: 	HuangHui		Date: 2004/06/28
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

long ll_place
string ls_setprn
string ls_prntrs 

ls_prntrs = PrintGetPrinters()
ll_place = PosA (ls_prntrs, "~n") 

do while ll_place > 0
	ls_setprn = LeftA (ls_prntrs, ll_place - 1)
	dw_functionparm.object.parmname[dw_functionparm.InsertRow(0)] = ls_setprn
	ls_prntrs = MidA (ls_prntrs,ll_place + 1)
	ll_place = PosA (ls_prntrs, "~n")
Loop

dw_functionparm.object.parmname[dw_functionparm.InsertRow(0)] = ls_prntrs
end subroutine

on w_printfunction.create
this.dw_functionparm=create dw_functionparm
this.lb_functionname=create lb_functionname
this.st_4=create st_4
this.cb_2=create cb_2
this.cb_clear=create cb_clear
this.lb_output=create lb_output
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_4=create gb_4
this.gb_2=create gb_2
this.Control[]={this.dw_functionparm,&
this.lb_functionname,&
this.st_4,&
this.cb_2,&
this.cb_clear,&
this.lb_output,&
this.cb_1,&
this.gb_1,&
this.gb_4,&
this.gb_2}
end on

on w_printfunction.destroy
destroy(this.dw_functionparm)
destroy(this.lb_functionname)
destroy(this.st_4)
destroy(this.cb_2)
destroy(this.cb_clear)
destroy(this.lb_output)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_4)
destroy(this.gb_2)
end on

event timer;////====================================================================
//// Event: timer()
////--------------------------------------------------------------------
//// Description: 
////--------------------------------------------------------------------
//// Arguments: (none)
////--------------------------------------------------------------------
//// Returns: long [pbm_timer]
////--------------------------------------------------------------------
//// Author: 	laihaichun		Date: 2004/01/03
////--------------------------------------------------------------------
//// Modify History: 
////	
////--------------------------------------------------------------------
//// CopyRight 2003----???? Appeon Inc.
////====================================================================
//
//if i = 1 then
//	st_tip.text = 'End time is ' +  string(now()) + '.'
//	i = 0
//else 
//	return
//end if
end event

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	HuangHui		Date: 2004/06/28
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y=0

inv_util=create n_util
end event

type dw_functionparm from datawindow within w_printfunction
integer x = 955
integer y = 208
integer width = 818
integer height = 836
integer taborder = 30
string title = "none"
string dataobject = "d_printfunction"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_functionname from listbox within w_printfunction
integer x = 64
integer y = 208
integer width = 814
integer height = 948
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"PrintBitmap","PrintCancel","PrintClose","PrintDefineFont","PrintLine","PrintOpen","PrintOval","PrintPage","PrintRect","PrintRoundRect","PrintScreen","PrintSetFont","PrintSetSpacing","PrintSetup","PrintSetupPrinter","PrintText","PrintWidth","PrintX","PrintY","PrintGetPrinter","PrintGetPrinters","PrintSetPrinter"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String strleft
Int li,li_row

strleft = inv_util.of_make_arguments('string',5)

Choose Case lb_functionname.SelectedItem()
	Case 'Print'
		wf_functionParm('printjobnumber,x,y,width,height',',10,10,500,500',1)
		Return
		
	Case 'PrintBitmap'
		wf_functionParm('printjobnumber,bitmap,x,y,width,height',',appeon.jpg,10,10,500,500',1)
		Return	
		 
	Case 'PrintCancel'
		wf_functionParm('printjobnumber','',1)
		Return
		
	Case 'PrintClose'
		wf_functionParm('printjobnumber','',1)
		Return
		
	Case 'PrintDefineFont'
		wf_functionparm('printjobnumber,fontnumber,facename,height,weight,fontpitch,fontfamily,italic,underline',&
				',1,Courier 10Cpi,-18,400,Default!,Decorative!,FALSE,FALSE',1)
		Return
		
	Case 'PrintLine'
		wf_functionparm('printjobnumber, x1, y1, x2, y2, thickness',&
			',1000,1000,7500,1000,10',1)
			Return
			
	Case 'PrintOpen'
		 wf_functionparm('jobname','Phone List',0)
		 Return
		 
	Case 'PrintOval'
		wf_functionparm('printjobnumber,x,y,width,height,thickness',&
		 	',40,30,1000,1000,10',1)
		Return
		
	Case 'PrintPage'
		wf_functionparm('printjobnumber','',1)
		Return
		
	Case 'PrintRect'
		wf_functionparm('printjobnumber,x,y,width,height,thickness',&
			',40,30,1000,1000,125',1)
		Return
		
	Case 'PrintRoundRect'
		wf_functionparm('printjobnumber,x,y,width,height,xradius,yradius,thickness',&
			',100,100,6250,9000,300,300,125',1)
		Return
		
	Case 'PrintScreen'
		wf_functionparm('printjobnumber,x,y,width,height',',50,50,500,500' ,1)
		Return
		
	Case 'PrintSetFont'
		wf_functionparm('printjobnumber,fontnumber',',2',1)
		Return
		
	Case 'PrintSetSpacing'
		wf_functionparm('printjobnumber,spacingfactor',',1.5',1)
		Return
		
	Case 'PrintSetup'
		dw_functionparm.reset()		
		Return
		
	Case 'PrintSetupPrinter'
		dw_functionparm.reset()		
		Return
		
	Case 'PrintText'
		wf_functionparm('printjobnumber,string,x,y,fontnumber',&
			',PowerBuilder,3700,10,8',1)
		Return
		
	Case 'PrintWidth'
		wf_functionparm('printjobnumber,string',',PowerBuilder',1)
		Return
		
	Case 'PrintX'
		wf_functionparm('printjobnumber','',1)
		Return
		
	Case 'PrintY'
		wf_functionparm('printjobnumber','',1)
		Return
	
	Case 'PrintGetPrinter'
		dw_functionparm.reset()	
		Return
		
	Case 'PrintGetPrinters'
		dw_functionparm.reset()	
		Return
		
	Case 'PrintSetPrinter'
		dw_functionparm.reset()	
		wf_GetPrinters()
		Return
End Choose


	
end event

type st_4 from statictext within w_printfunction
integer x = 46
integer y = 36
integer width = 1669
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example shows PowerBuilder print functions that Appeon supports."
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_printfunction
integer x = 2199
integer y = 1064
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type cb_clear from commandbutton within w_printfunction
integer x = 1861
integer y = 1064
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear All"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_OutPut.Reset()
end event

type lb_output from listbox within w_printfunction
integer x = 1861
integer y = 208
integer width = 667
integer height = 836
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
boolean extendedselect = true
end type

event selectionchanged;////====================================================================
//// Event: selectionchanged()
////--------------------------------------------------------------------
//// Description: 
////--------------------------------------------------------------------
//// Arguments: 
////		value	integer	index		
////--------------------------------------------------------------------
//// Returns: long [pbm_lbnselchange]
////--------------------------------------------------------------------
//// Author: 	laihaichun		Date: 2004/01/03
////--------------------------------------------------------------------
//// Modify History: 
////	
////--------------------------------------------------------------------
//// CopyRight 2003----???? Appeon Inc.
////====================================================================
//
//st_tip.text = This.SelectedItem()
end event

type cb_1 from commandbutton within w_printfunction
integer x = 1371
integer y = 1064
integer width = 402
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//				Huanghui Date:2004/06/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String 	strexevalue, strtestvalue
String	ls_x,ls_y,ls_w,ls_h
Long parmnumber,li_job

dw_functionparm.acceptText()
Choose Case lb_functionname.SelectedItem()
	Case 'Print'
		strexevalue = wf_print()
		if strexevalue = NO_ACTION then
			return
		end if
	Case 'PrintBitmap'
		 strexevalue = wf_PrintBitmap()
		if strexevalue = NO_ACTION then
			return
		end if
	Case 'PrintCancel'
		li_job = printOpen()
		strexevalue = string(printCancel(li_job))
		
	Case 'PrintClose'
		li_job = printOpen()
		strexevalue = string(printClose(li_job))

	Case 'PrintDefineFont'
		strexevalue = wf_printDefineFont()
		if strexevalue = NO_ACTION then
			return
		end if
		
	Case 'PrintLine'
		strexevalue = wf_printLine()
		if strexevalue = NO_ACTION then
			return
		end if
			
	Case 'PrintOpen'
		 strtestvalue = dw_functionparm.getitemstring(1,'parmvalue')
		 if isnull(strtestvalue) or strtestvalue = '' then
			li_job = printOpen()
		 else
		 	li_job = printOpen(strtestvalue)
		 end if
		 
		 printClose(li_job)
		 strexevalue = string(li_job)
		 
	Case 'PrintOval'
		strexevalue = wf_PrintOval()
		if strexevalue = NO_ACTION then
			return
		end if
		
	Case 'PrintPage'
		li_job = printOpen()
		//this.print(li_job,50,50)
		strexevalue = string(printPage(li_job))
		Print(li_job, "Appeon Corporation")
		printClose(li_job)
		
	Case 'PrintRect'
		strexevalue = wf_PrintRect()
		if strexevalue = NO_ACTION then
			return
		end if
		
	Case 'PrintRoundRect'
		strexevalue = wf_PrintRoundRect()
		if strexevalue = NO_ACTION then
			return
		end if
		
	Case 'PrintScreen'
		strexevalue = wf_PrintScreen()
		if strexevalue = NO_ACTION then
			return
		end if
		
	Case 'PrintSetFont'
		strexevalue = wf_PrintSetFont()
		if strexevalue = NO_ACTION then
			return
		end if
		
	Case 'PrintSetSpacing'
		strexevalue = wf_PrintSetSpacing()
		if strexevalue = NO_ACTION then
			return
		end if
		
	Case 'PrintSetup'
		strexevalue = string(printsetup())
		
	Case 'PrintSetupPrinter'
		strexevalue = string(printsetupprinter())		
		
	Case 'PrintText'
		strexevalue = wf_PrintText()
		if strexevalue = NO_ACTION then
			return
		end if
		
	Case 'PrintWidth'
		strexevalue = wf_PrintWidth()
		if strexevalue = NO_ACTION then
			return
		end if
		
	Case 'PrintX'
		li_job = printOpen()		
		strexevalue = string(PrintX(li_job))
		printClose(li_job)
		
	Case 'PrintY'
		li_job = printOpen()		
		strexevalue = string(PrintY(li_job))
		printClose(li_job)
	
	Case 'PrintGetPrinter'
		strexevalue = PrintGetPrinter()
		
	Case 'PrintGetPrinters'
		strexevalue = PrintGetPrinters()
	
	Case 'PrintSetPrinter'
		parmnumber = dw_functionparm.getrow()
		if Parmnumber < 1 then
			MessageBox("PrintSetPrinter","Please select a printer!")
			Return
		end if
		strexevalue = string(PrintSetPrinter(dw_functionparm.object.parmname[parmnumber]))
End Choose

If IsNull(strexevalue) Then strexevalue = 'NULL'
lb_OutPut.AddItem(String(lb_OutPut.TotalItems())+".Return value:  "+strexevalue)

end event

type gb_1 from groupbox within w_printfunction
integer x = 41
integer y = 140
integer width = 864
integer height = 1048
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Functions"
end type

type gb_4 from groupbox within w_printfunction
integer x = 928
integer y = 140
integer width = 878
integer height = 1048
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Function Parameter"
end type

type gb_2 from groupbox within w_printfunction
integer x = 1829
integer y = 140
integer width = 727
integer height = 1048
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Output"
end type

