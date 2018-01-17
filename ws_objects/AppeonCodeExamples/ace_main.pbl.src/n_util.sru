$PBExportHeader$n_util.sru
forward
global type n_util from nonvisualobject
end type
end forward

global type n_util from nonvisualobject
end type
global n_util n_util

type variables
string is_temp[]
end variables

forward prototypes
public function character of_boolean_to_char (boolean ab_boolean)
public function boolean of_char_to_boolean (character ach_char)
public function boolean of_check_dayname (string as_dayname, date ad_testdate)
public function date of_closest_date (string as_dayname, date ad_testdate)
public function string of_convert_to_upper (string as_string)
public function string of_make_arguments (string as_datatype, integer ai_seq)
public function integer of_parse_color (long al_srccolor, ref integer ai_red, ref integer ai_green, ref integer ai_blue)
public function boolean of_string_to_boolean (string as_type)
public function string of_dwo_property_arg (string as_data, string as_obj)
public function string of_array_to_string (string as_data, string as_obj, listbox as_lb)
end prototypes

public function character of_boolean_to_char (boolean ab_boolean);//////////////////////////////////////////////////////////////////////
//
// Function: of_boolean_to_char
//
// Purpose: returns the character 'representation' of a boolean
//
//	Scope: public
//
//	Arguments: ab_boolean
//
//	Returns: character	'Y' when ab_boolean is true
//								'N' when ab_boolean is false
//////////////////////////////////////////////////////////////////////

If ab_boolean Then
	Return 'Y'
Else
	Return 'N'
End If

end function

public function boolean of_char_to_boolean (character ach_char);//////////////////////////////////////////////////////////////////////
//
// Function: of_char_to_boolean
//
// Purpose: returns the 'boolean representation' of a character
//
//	Scope: public
//
//	Arguments: ach_char
//
//	Returns: boolean		true when ach_char is 'Y'
//								false when ach_char is 'N'
//////////////////////////////////////////////////////////////////////

If Upper (ach_char) = 'Y' Then
	Return True
Else
	Return False
End If

end function

public function boolean of_check_dayname (string as_dayname, date ad_testdate);//////////////////////////////////////////////////////////////////////
//
// Function: f_check_dayname
//
// Purpose: determines whether the ad_testdate argument has the same
//				day name (Monday, Tuesday, etc.) as the as_dayname argument.
//
//	Scope:  public
//
//	Arguments: as_dayname	the name of the day (Sunday, Monday, etc.)
//									that you want to test as_testdate against.
//				  ad_testdate	any valid date
//		
//	Returns: true		if ad_testdate has the same day name as as_dayname
//				false		if ad_testdate has a different day name than as_dayname
//
//////////////////////////////////////////////////////////////////////

String  ls_DayName

ls_DayName = DayName (ad_testdate)
If  ls_DayName = as_dayname Then
	Return True
Else
	Return False
End If



end function

public function date of_closest_date (string as_dayname, date ad_testdate);//////////////////////////////////////////////////////////////////////
//
// Function: f_closest_date
//
// Purpose: returns the date that is the closest day name (as_dayname)
//				to as_testdate
//
//	Scope: public	
//
//	Arguments: as_dayname	a valid name of a day (Sunday, Monday, ...)
//				  ad_testdate	any valid date
//
//	Returns: date		the date which is:
//							1) the closest date to as_test date AND
//							2) which has the same day name as as_dayname
//
//////////////////////////////////////////////////////////////////////

Int		li_testdate, &
	li_dayname, &
	li_difference

String ls_profile,ls_isja

//Begin read  ini file to distinguish JP append by wangmingli 2014/07/10
ls_profile = 'appeon_code_examples.ini'
ls_isja = "0"
if profilestring(ls_profile, "Language", "isja", "0")="1" then	ls_isja = "1"
//End read&write ini file to distinguish JP append by wangmingli 2014/07/10
// Obtain the day number of ad_testdate and as_dayname

li_testdate = DayNumber (ad_testdate)

If ls_isja <> "1" Then
	Choose Case as_dayname
	
		Case 'Sunday'
			li_dayname = 1
		Case 'Monday'
			li_dayname = 2
		Case 'Tuesday'
			li_dayname = 3
		Case 'Wednesday'
			li_dayname = 4
		Case 'Thursday'
			li_dayname = 5
		Case 'Friday'
			li_dayname = 6
		Case 'Saturday'
			li_dayname = 7
			
	End Choose
Else
	Choose Case as_dayname
		Case '日曜日'
			li_dayname = 1
		Case '月曜日'
			li_dayname = 2
		Case '火曜日'
			li_dayname = 3
		Case '水曜日'
			li_dayname = 4
		Case '木曜日'
			li_dayname = 5
		Case '金曜日'
			li_dayname = 6
		Case '土曜日'
			li_dayname = 7
	End Choose
End If


// If ad_testdate is already the same day name as as_dayname, then
//	return ad_testdate, else calculate the closest date.

If li_dayname = li_testdate Then
	Return ad_testdate
Else
	li_difference = li_dayname - li_testdate
	If li_difference < -3 Then
		li_difference = li_difference + 7
	Else
		If li_difference > 3 Then
			li_difference = li_difference - 7
		End If
	End If
	Date  ld
	ld = RelativeDate (ad_testdate, li_difference)
	Return ld
End If


end function

public function string of_convert_to_upper (string as_string);//////////////////////////////////////////////////////////////////////
//
// Function: of_convert_to_upper
//
// Purpose: convert 'true'/'false' to 'TRUE'/'FALSE'  
//
//	Scope: public	
//
//	Arguments: as_daynamea valid string incluing "true" or "false" 
//	Returns: 
//
//////////////////////////////////////////////////////////////////////
Integer  li_pos

li_pos = PosA(Lower(as_string),'true')

If li_pos > 0 Then
	Return LeftA(as_string,li_pos - 1) + 'TRUE' + MidA(as_string,li_pos + 5)
End If

li_pos = PosA(Lower(as_string),'false')
If li_pos > 0 Then
	Return LeftA(as_string,li_pos - 1) + 'FALSE' + MidA(as_string,li_pos + 6)
End If

Return as_string

end function

public function string of_make_arguments (string as_datatype, integer ai_seq);//====================================================================
// Function: of_make_arguments()
//--------------------------------------------------------------------
// Description: Used to make some dynamic arguments.
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_datatype		
//		integer	ai_seq     		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_type,ls_Temp[]

ls_type = LeftA(Lower(as_DataType), 4)
ls_type = Trim(ls_type)
Choose Case ls_type
	Case 'colo' //Color
		ls_Temp[] = {'255','0','65280','16777215','16711680'}
	Case 'bool','5boo' //5boolean
		ls_Temp[] = {'True','False','True','False','True'}
	Case 'char'
		ls_Temp[] = {'A','B','C','D','E'}
	Case 'deci', 'dec','real'
		ls_Temp[] = {'125.78','23.45','456.54','2000.00','9999.99'}
	Case 'doub','long'
		ls_Temp[] = {'255','0','65280','16777215','16711680'}
		//		ls_Temp[] = {'255','500','24','352	','9999'}
	Case 'int','inte'
		ls_Temp[] = {'20','300','340','120','80'}
	Case 'stri'
		ls_Temp[] = {'Appeon','Sybase','EAServer','Database','Software'}
	Case 'tsiz' //textsize
		ls_Temp[] = {'9','12','18','20','36'}
	Case 'weig' //weight
		If ai_Seq > 2 Then Return ''
		ls_Temp[] = {'400','700'}
	Case 'font'
		ls_Temp[] = {'Arial','MS Sans Serif','Fixedsys','Courier','Modern'}
	Case 'inde'
		ls_Temp[] = {'1','2','3','4','5'}
	Case 'from' //SelectText from 
		ls_Temp[] = {'1','2','3','4','5'}
	Case 'to'
		ls_Temp[] = {'6','7','8','9','10'}
	Case 'date'
		ls_Temp[] = {'1900-01-01','1978.09.18','2000.02.29','2050/02/12','03/15/2080'}
	Case 'time'
		ls_Temp[] = {'03:23:31','8:23:45','14:23:58','21:23:02','23:59:59'}
	Case Else
		Return ''
End Choose

Return ls_Temp[ai_Seq]



end function

public function integer of_parse_color (long al_srccolor, ref integer ai_red, ref integer ai_green, ref integer ai_blue);//====================================================================
// Function: of_parse_color()
//--------------------------------------------------------------------
// Description: Parse a long color value to Red,Green,Blue
//--------------------------------------------------------------------
// Arguments: 
//		    	long	al_srccolor		
//		ref 	integer    	ai_red  		
//		ref 	integer    	ai_green		
//		ref 	integer    	ai_blue 		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
If al_SrcColor > 16777215  Or al_SrcColor < 0 Then
	Return -1
End If

ai_blue = Truncate(al_SrcColor / 65536,0)
ai_green = Truncate((al_SrcColor - ai_blue*65536)/256,0)
ai_red = al_SrcColor - ai_blue*65536 - ai_green * 256

Return 1

end function

public function boolean of_string_to_boolean (string as_type);//====================================================================
// Function: of_string_to_boolean()
//--------------------------------------------------------------------
// Description: COnvert a string to booln
//--------------------------------------------------------------------
// Arguments: 
//		string	as_type		
//--------------------------------------------------------------------
// Returns: boolean
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
IF isnull(as_Type) THEN 
	boolean  lb_temp
	
	setnull(lb_temp)
	return lb_temp
END IF

CHOOSE CASE lower(as_Type)
	CASE 'true','yes','t','y','on','1'
		return true
	CASE ELSE
		return FALSE
END CHOOSE

end function

public function string of_dwo_property_arg (string as_data, string as_obj);//====================================================================
// Function: of_dwo_property_arg()
//--------------------------------------------------------------------
// Description: Used to make some dynamic arguments for datawindow object.
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_data		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/10/18
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_temp[]

is_temp = ls_temp //initialize array

Choose Case Trim(as_data)
	Case 'border' 
			choose case as_obj							
					 case'gb'
					 		is_Temp[] = {'2 - Rectangle','5 - 3D Lowered','6 - 3D Raised'}
					 case else
							is_Temp[] = {'0 - None','1 - Shadow','2 - Rectangle','3 - Resize','4 - Line','5 - 3D Lowered','6 - 3D Raised'}
			end choose		
	Case 'filename','picturename' 
		is_Temp[] = {'shortsb.bmp','tshirto.bmp','tshirtb.bmp','donews_88.gif','prodattr.jpg'}
	Case 'height','pen.width','width','x','y','x1','x2','y1','y2','ellipseheight','ellipsewidth'
		is_Temp[] = {'-32769','-32768','0','300','32767','32768'}
	Case 'hidesnaked','moveable','resizeable','visible','invert'
		is_Temp[] = {'0','1'}	
	Case 'slideleft' ,'defaultpicture','suppresseventprocessing','height.autosize','lineremove','multiline','width.autosize','height.autosize','newpage','trail_footer'
		is_Temp[] = {'Yes','No'}	
	Case 'pointer'		
		is_Temp[] = {'Arrow!','Cross!','HourGlass!','IBeam!','Icon!','Size!','SizeNESW!','SizeNS!','SizeNWSE!','SizeWE!','UpArrow!','hcross.cur'}	
	Case 'slideup'		
		is_Temp[] = {'No','DirectlyAbove','AllAbove'}
	Case 'tag','text'
		is_Temp[] = {'1','A','323.44','T1@&>,?P{}":|\_-k'}		
	Case 'background.color','brush.color','pen.color','color'		 
//		is_Temp[] = {'-2,147,483,649','-2,147,483,648','0','16758380','2,147,483,647','2,147,483,648'}
		is_Temp[] = {'-2147483649','-2147443665','0','16758380','2147483547','2146483650'}
	Case 'background.mode'
		is_Temp[] = {'0 - Opaque','1 - Transparent'}
		
	//start set font	
	Case 'font.charset'
		is_Temp[] = {'0 - Ansi', '1 - default', '2 - Symbol', '128 - Shift JIS', '255 - OEM'}
	Case 'font.face'
		is_Temp[] = {'Arial','Courier','SYSTEM','MS Sans Serif','Fixedsys','Modern'}
	Case 'font.family'
		is_Temp[] = {'0 - AnyFont','1 - Roman','2 - Swiss','3 - Modern','4 - Script','5 - Decorative'}	
	Case 'font.italic','font.strikethrough','font.underline'
		is_Temp[] = {'0','1'}
	Case 'font.pitch'
		is_Temp[] = {'0 - default','1 - Fixed','2 - Variable'}	
	Case 'font.weight'
		is_Temp[] = {'400 - Normal','700 - Bold'}
	Case 'font.width','font.escapement','font.height'
		is_Temp[] = {'-32769','-32768','0','500','32767','32768'}	
	//end set font	
	
	Case'brush.hatch'
		is_Temp[] = {'0 - Horiz','1 - BDiagonal','2 - Vertical','3 - Cross','4 - FDiagonal','5 - DiagCross','6 - Solid','7 - Transparent'}
	Case'pen.style'
		is_Temp[] = {'0 - Solid', '1 - Dash', '2 - Dot', '3 - DashDot', '4 - DashDotDot', '5 - Null'}
	Case 'action'
//		is_Temp[] = {'0 - User Defined','1 -Retrieve (Yield)', '2 - Retrieve', '3 - Cancel', '4 - Page Next', '5 - Page Prior', '6 - Page First', '7 - Page Last', '8 - Sort', '9 - Filter', '10 - Delete Row', '11 - Append Row', '12 - Insert Row', '13 - Update', '14 - Save Rows As', '15 - Print', '16 - Preview', '17 - Preview With Rulers', '18 - Query Mode', '19 - Query Sort', '20 - Query Clear'}
		is_Temp[] = {'0 - User Defined','1 -Retrieve (Yield)', '2 - Retrieve', '4 - Page Next', '5 - Page Prior', '6 - Page First', '7 - Page Last', '8 - Sort', '9 - Filter', '10 - Delete Row', '11 - Append Row', '12 - Insert Row', '13 - Update', '14 - Save Rows As', '15 - Print'}
		
	Case'alignment'
	   is_Temp[] = {'0 - Left', '1 - Right', '2 - Center'}
	Case'htextalign'
		is_Temp[] = {'0 - Center', '1 - Left', '2 - Right'}
	Case 'vtextalign'
      is_Temp[] = {'0 - Center', '1 - Top', '2 - Bottom', '3 - Multiline'}
	Case'html.link','html.linkargs','html.linktarget'
	Case 'expression'
		is_Temp[] = {"datetime(~~'2004-09-09~~')"}
	Case 'format'
      is_Temp[] = {'[red](@@@) @@@-@@@@', '$#,##0;[RED]($#,##0)','yyyy-mm-dd', '[General]'}
		
	//Neted Report	
	Case 'criteria'
		is_Temp[] = {'>= 800','<=300','<=400~r~n>=1000'}
	Case 'dataobject'
		is_Temp[] = {'d_dwo_nested_chg'}
	Case 'nest_arguments'
		is_Temp[] = {'100','200','300','400','500'}
	//End Neted Report	
//	Case		
//	case
//	Case
//	Case
//	Case
	Case Else	
		Return ''
End Choose


Return as_data

end function

public function string of_array_to_string (string as_data, string as_obj, listbox as_lb);//====================================================================
// Function: of_array_property_arg()
//--------------------------------------------------------------------
// Description: Used to make some dynamic arguments for datawindow object.
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_data		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/10/18
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_data,ls_item
long ll_upper,ll_i
ls_data = of_dwo_property_arg(as_data,as_obj)

ll_upper = UpperBound(is_temp)


for ll_i = 1 to ll_upper
	 ls_item = is_temp[ll_i]
	 as_lb.additem(ls_item)
next
return ls_data
end function

on n_util.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_util.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

