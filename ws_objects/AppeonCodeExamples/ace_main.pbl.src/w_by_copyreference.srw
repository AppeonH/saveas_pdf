$PBExportHeader$w_by_copyreference.srw
forward
global type w_by_copyreference from window
end type
type st_1 from statictext within w_by_copyreference
end type
type mle_2 from multilineedit within w_by_copyreference
end type
type rb_2 from radiobutton within w_by_copyreference
end type
type rb_1 from radiobutton within w_by_copyreference
end type
type cb_3 from commandbutton within w_by_copyreference
end type
type cb_2 from commandbutton within w_by_copyreference
end type
type cb_1 from commandbutton within w_by_copyreference
end type
type mle_1 from multilineedit within w_by_copyreference
end type
type lb_2 from listbox within w_by_copyreference
end type
type lb_1 from listbox within w_by_copyreference
end type
type gb_1 from groupbox within w_by_copyreference
end type
type gb_3 from groupbox within w_by_copyreference
end type
type gb_4 from groupbox within w_by_copyreference
end type
type gb_2 from groupbox within w_by_copyreference
end type
type gb_5 from groupbox within w_by_copyreference
end type
end forward

global type w_by_copyreference from window
integer width = 2441
integer height = 1744
boolean titlebar = true
string title = "By Copy or by Reference"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
mle_2 mle_2
rb_2 rb_2
rb_1 rb_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
mle_1 mle_1
lb_2 lb_2
lb_1 lb_1
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
gb_2 gb_2
gb_5 gb_5
end type
global w_by_copyreference w_by_copyreference

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
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String is_array[]

end variables

forward prototypes
public function integer wf_checkvalue ()
public function integer wf_integer (integer ai_data)
public function integer wf_long (long al_data)
public function integer wf_string (string as_data)
public function integer wf_date (date ad_data)
public function integer wf_addoutput (string as_before, string as_after)
public function integer wf_stringtoarray (string as_data)
public function integer wf_time (time at_data)
public function integer wf_array (string as_data[])
public function integer wf_object (u_object au_data)
public function string wf_displayscript (string as_objecttype, string as_value, string as_mode)
public function integer wf_any (any aa_data)
end prototypes

public function integer wf_checkvalue ();//====================================================================
// Function: wf_checkvalue()
//--------------------------------------------------------------------
// Description: check
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================


If lb_1.SelectedIndex() = -1 Then
	MessageBox("Appeon","Please select Data Type!")
	Return -1
End If

If lb_2.SelectedIndex() = -1 Then
	MessageBox("Appeon","Please select Test Data!")
	Return -1
End If

Return 1

end function

public function integer wf_integer (integer ai_data);//====================================================================
// Function: wf_integer()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	ai_data		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
ai_data = 25
Return 1

end function

public function integer wf_long (long al_data);//====================================================================
// Function: wf_long()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	al_data		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
al_data = 58

Return 1

end function

public function integer wf_string (string as_data);//====================================================================
// Function: wf_string()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_data		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
as_data = "Borland"
Return 1

end function

public function integer wf_date (date ad_data);//====================================================================
// Function: wf_date()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		date	ad_data		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Date ld_today
ld_today = Date(Now())

ad_data = ld_today

Return 1

end function

public function integer wf_addoutput (string as_before, string as_after);//====================================================================
// Function: wf_addoutput()
//--------------------------------------------------------------------
// Description: output data of datawindow.
//--------------------------------------------------------------------
// Arguments: 
//		string	as_before		
//		string	as_after 		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//====================================================================
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
If mle_1.Text = "" Then
	mle_1.Text = "The Value of Before Change:"+as_before+" The Value of After Change:"+as_after
Else
	mle_1.Text+= "~r~n"+"The Value of Before Change:"+as_before+" The Value of After Change:"+as_after
End If
Return 1

end function

public function integer wf_stringtoarray (string as_data);//====================================================================
// Function: wf_stringtoarray()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_data		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_array,ls_empty[]
Long ll_position

is_array = ls_empty
ls_array = MidA(as_data,2,LenA(as_data) - 2)
ll_position = PosA(ls_array,',')

Do While ll_position > 0
	is_array[UpperBound(is_array)+1] = LeftA(ls_array,ll_position - 1)
	ls_array = RightA(ls_array,LenA(ls_array) - ll_position)
	ll_position = PosA(ls_array,',')
Loop

If Trim(ls_array) <> "" Then
	is_array[UpperBound(is_array)+1] = ls_array
End If

Return 1

end function

public function integer wf_time (time at_data);//====================================================================
// Function: wf_time()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		time	at_data		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Time lt_now

lt_now = Time(Now())
at_data = lt_now

Return 1

end function

public function integer wf_array (string as_data[]);//====================================================================
// Function: wf_array()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_data[]		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
as_data[1] = "Sun"
as_data[2] = "Hello"
as_data[3] = "World"

Return 1

end function

public function integer wf_object (u_object au_data);//====================================================================
// Function: wf_object()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		u_object	au_data		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
au_data.of_set("Sybase")

Return 1

end function

public function string wf_displayscript (string as_objecttype, string as_value, string as_mode);//====================================================================
// Function: wf_displayscript()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_objecttype		
//		string	as_value     		
//		string	as_mode      		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_script,ls_declare,ls_body

ls_declare = " //Test Script:"
ls_declare += "~r~n"+as_objecttype +" i_test,i_change~r~n"
Choose Case as_objecttype
	Case "String"
		ls_declare += "~r~ni_test = '"+as_value+"'~r~ni_change = i_test"
	Case "Object"
		ls_declare += "~r~ni_test = Create Object~r~ni_test.name = '"+as_value+"'~r~ni_change=i_test"
	Case "Date"
		ls_declare += "~r~ni_test = date('"+as_value+"')~r~ni_change=i_test"
	Case "Time"
		ls_declare += "~r~ni_test = time('"+as_value+"')~r~ni_change=i_test"
	Case Else
		ls_declare += "~r~ni_test = "+as_value+"~r~ni_change=i_test"
End Choose

ls_declare += "~r~n //Print the value of i_test"
Choose Case as_mode
	Case "assignment"
		Choose Case as_objecttype
			Case 'Integer'
				ls_body = "i_change = 20"
			Case 'Long'
				ls_body = "i_change = 6999"
			Case 'String'
				ls_body = "i_change = 'Oracle'"
			Case 'Date'
				ls_body = "i_change = date('2003-03-03')"
			Case 'Time'
				ls_body = "i_change = time('12:06:06')"
			Case 'Any'
				ls_body = "i_change = 'Appeon'"
			Case 'Array'
				ls_body = "i_change = {3,5,7}"
			Case 'Object'
				ls_body = "i_change.name = 'Sybase'"
		End Choose
	Case "parameter"
		ls_body = "wf_change(i_change)"
End Choose

ls_script = ls_declare+"~r~n"+ls_body
ls_script+= "~r~n //Print the value of i_test"
mle_2.Text = ls_script

Return 'ok'

end function

public function integer wf_any (any aa_data);//====================================================================
// Function: wf_any()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		any	aa_data		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
aa_data = "Appeon"
Return 1

end function

on w_by_copyreference.create
this.st_1=create st_1
this.mle_2=create mle_2
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_1=create mle_1
this.lb_2=create lb_2
this.lb_1=create lb_1
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_2=create gb_2
this.gb_5=create gb_5
this.Control[]={this.st_1,&
this.mle_2,&
this.rb_2,&
this.rb_1,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.mle_1,&
this.lb_2,&
this.lb_1,&
this.gb_1,&
this.gb_3,&
this.gb_4,&
this.gb_2,&
this.gb_5}
end on

on w_by_copyreference.destroy
destroy(this.st_1)
destroy(this.mle_2)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.lb_2)
destroy(this.lb_1)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_2)
destroy(this.gb_5)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: add item data
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.X = 0
This.Y = 0

lb_1.AddItem("Integer")
lb_1.AddItem("Long")
lb_1.AddItem("String")
lb_1.AddItem("Date")
lb_1.AddItem("Time")
lb_1.AddItem("Any")
lb_1.AddItem("Array")
lb_1.AddItem("Object")


end event

type st_1 from statictext within w_by_copyreference
integer x = 55
integer y = 48
integer width = 1979
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The standard data types are passed by copy.  The Object data type is passed by reference."
boolean focusrectangle = false
end type

type mle_2 from multilineedit within w_by_copyreference
integer x = 1623
integer y = 184
integer width = 681
integer height = 624
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type rb_2 from radiobutton within w_by_copyreference
integer x = 745
integer y = 840
integer width = 727
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Passed as function parameter"
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
wf_displayscript(lb_1.SelectedItem(),lb_2.SelectedItem(),'parameter')

end event

type rb_1 from radiobutton within w_by_copyreference
integer x = 96
integer y = 840
integer width = 567
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Passed in assignment"
boolean checked = true
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
wf_displayscript(lb_1.SelectedItem(),lb_2.SelectedItem(),'assignment')

end event

type cb_3 from commandbutton within w_by_copyreference
integer x = 1961
integer y = 828
integer width = 343
integer height = 92
integer taborder = 40
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
// Description: output executed result
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String ls_before,ls_after
Integer li_data,li_datachange
Long ll_data,ll_datachange
String ls_data,ls_datachange
Date  ld_data,ld_datachange
Time lt_data,lt_datachange
Any la_data,la_datachange
String ls_arraychange[]
u_object uo_data,uo_datachange

ls_before = lb_2.SelectedItem()

If wf_checkvalue() = 1 Then
	
	If rb_1.Checked = True Then
		Choose Case lb_1.SelectedItem()
			Case "Integer"
				li_data = Integer(ls_before)
				li_datachange = li_data
				li_datachange = 20
				ls_after = String(li_data)
			Case "Long"
				ll_data = Long(ls_before)
				ll_datachange = ll_data
				ll_datachange = 200
				ls_after = String(ll_data)
			Case "String"
				ls_data = ls_before
				ls_datachange = "Oracle"
				ls_after = ls_data
			Case "Date"
				ld_data = Date(ls_before)
				ld_datachange = ld_data
				ld_datachange = Date(Now())
				ls_after = String(ld_data,"yyyy-mm-dd")
			Case "Time"
				lt_data = Time(ls_before)
				lt_datachange = lt_data
				lt_datachange = Time(Now())
				ls_after = String(lt_data,"hh:mm:ss")
			Case "Any"
				la_data = ls_before
				la_datachange = la_data
				la_datachange = "Appeon"
				ls_after = String(la_data)
			Case "Array"
				wf_stringtoarray(ls_before)
				ls_arraychange = is_array
				ls_arraychange[1] = "Eas"
				ls_arraychange[2] = "Syb"
				ls_arraychange[3] = "App"
				ls_after = "{"+is_array[1]+","+is_array[2]+","+is_array[3]+"}"
			Case "Object"
				uo_data = Create u_object
				uo_data.of_set(ls_before)
				uo_datachange = uo_data
				uo_datachange.of_set("Sybase")
				ls_after = uo_data.of_get()
				Destroy uo_data
				Destroy uo_datachange
		End Choose
	End If
	
	If rb_2.Checked = True Then
		Choose Case lb_1.SelectedItem()
			Case "Integer"
				li_data = Integer(ls_before)
				wf_integer(li_data)
				ls_after = String(li_data)
			Case "Long"
				ll_data = Long(ls_before)
				wf_long(ll_data)
				ls_after = String(ll_data)
			Case "String"
				ls_data = ls_before
				wf_string(ls_data)
				ls_after = ls_data
			Case "Date"
				ld_data = Date(ls_before)
				wf_date(ld_data)
				ls_after = String(ld_data,"yyyy-mm-dd")
			Case "Time"
				lt_data = Time(ls_before)
				wf_time(lt_data)
				ls_after = String(lt_data,"hh:mm:ss")
			Case "Any"
				la_data = ls_before
				wf_any(la_data)
				ls_after = String(la_data)
			Case "Array"
				wf_stringtoarray(ls_before)
				wf_array(is_array)
				ls_after = "{"+is_array[1]+","+is_array[2]+","+is_array[3]+"}"
			Case "Object"
				uo_data = Create u_object
				wf_object(uo_data)
				ls_after = uo_data.of_get()
		End Choose
	End If
Else
	Return
End If

wf_addoutput(ls_before,ls_after)


end event

type cb_2 from commandbutton within w_by_copyreference
integer x = 1961
integer y = 1452
integer width = 343
integer height = 92
integer taborder = 70
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
// Description: close currently window
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
CLOSE(Parent)

end event

type cb_1 from commandbutton within w_by_copyreference
integer x = 1961
integer y = 1336
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: clear the mle_1
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

mle_1.Text = ""


end event

type mle_1 from multilineedit within w_by_copyreference
integer x = 101
integer y = 1020
integer width = 1819
integer height = 520
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
boolean autohscroll = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type lb_2 from listbox within w_by_copyreference
integer x = 823
integer y = 196
integer width = 672
integer height = 516
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: set test mode
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String ls_mode

If rb_1.Checked = True Then
	ls_mode = 'assignment'
Else
	ls_mode = 'parameter'
End If

wf_displayscript(lb_1.SelectedItem(),lb_2.SelectedItem(),ls_mode)

end event

type lb_1 from listbox within w_by_copyreference
integer x = 101
integer y = 196
integer width = 626
integer height = 516
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: set test date
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_mode

Choose Case Text(Index)

	Case "Integer"
		lb_2.Reset()
		lb_2.AddItem("3")
		lb_2.AddItem("10")
		lb_2.AddItem("101")
		lb_2.AddItem("99999")
	Case "Long"
		lb_2.Reset()
		lb_2.AddItem("10")
		lb_2.AddItem("98")
		lb_2.AddItem("1993")
		lb_2.AddItem("986333")
	Case "Date"
		lb_2.Reset()
		lb_2.AddItem("1958-11-25")
		lb_2.AddItem("1979-04-11")
		lb_2.AddItem("1985-06-30")
		lb_2.AddItem("2003-06-09")
	Case "Time"
		lb_2.Reset()
		lb_2.AddItem("12:00:00")
		lb_2.AddItem("06:30:56")
		lb_2.AddItem("09:25:47")
		lb_2.AddItem("21:00:05")
	Case "String"
		lb_2.Reset()
		lb_2.AddItem("Sybase")
		lb_2.AddItem("Appeon")
		lb_2.AddItem("Microsoft")
		lb_2.AddItem("Sun")
	Case "Any"
		lb_2.Reset()
		lb_2.AddItem("1")
		lb_2.AddItem("5.12")
		lb_2.AddItem("Sybase")
	Case "Array"
		lb_2.Reset()
		lb_2.AddItem("{3,2,5}")
		lb_2.AddItem("{Sun,IBM,SONY}")
		lb_2.AddItem("{2002,1999,1979}")
		lb_2.AddItem("{1,5.25,Sybase}")
	Case "Object"
		lb_2.Reset()
		lb_2.AddItem("3")
		lb_2.AddItem("Sybase")
		lb_2.AddItem("205")
		lb_2.AddItem("Appeon")
End Choose

If rb_1.Checked = True Then
	ls_mode = 'assignment'
Else
	ls_mode = 'parameter'
End If

wf_displayscript(lb_1.SelectedItem(),lb_2.SelectedItem(),ls_mode)



end event

type gb_1 from groupbox within w_by_copyreference
integer x = 55
integer y = 124
integer width = 709
integer height = 632
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Data Type"
end type

type gb_3 from groupbox within w_by_copyreference
integer x = 55
integer y = 960
integer width = 2295
integer height = 632
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

type gb_4 from groupbox within w_by_copyreference
integer x = 1577
integer y = 124
integer width = 768
integer height = 824
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Execute"
end type

type gb_2 from groupbox within w_by_copyreference
integer x = 791
integer y = 124
integer width = 750
integer height = 632
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test Value (i_test)"
end type

type gb_5 from groupbox within w_by_copyreference
integer x = 55
integer y = 776
integer width = 1481
integer height = 172
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mode"
end type

