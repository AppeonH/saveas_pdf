$PBExportHeader$w_global_replace.srw
$PBExportComments$Window showing function overloading using a Global Replace function
forward
global type w_global_replace from window
end type
type sle_end from singlelineedit within w_global_replace
end type
type sle_start from singlelineedit within w_global_replace
end type
type cb_reset from commandbutton within w_global_replace
end type
type st_syntax from statictext within w_global_replace
end type
type st_6 from statictext within w_global_replace
end type
type sle_num from singlelineedit within w_global_replace
end type
type st_5 from statictext within w_global_replace
end type
type cbx_case from checkbox within w_global_replace
end type
type st_4 from statictext within w_global_replace
end type
type sle_new from singlelineedit within w_global_replace
end type
type sle_old from singlelineedit within w_global_replace
end type
type st_3 from statictext within w_global_replace
end type
type st_2 from statictext within w_global_replace
end type
type st_1 from statictext within w_global_replace
end type
type cb_close from commandbutton within w_global_replace
end type
type cb_ok from commandbutton within w_global_replace
end type
type mle_1 from multilineedit within w_global_replace
end type
type gb_1 from groupbox within w_global_replace
end type
end forward

global type w_global_replace from window
integer x = 453
integer y = 52
integer width = 2222
integer height = 1368
boolean titlebar = true
string title = "Function Overloading"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
sle_end sle_end
sle_start sle_start
cb_reset cb_reset
st_syntax st_syntax
st_6 st_6
sle_num sle_num
st_5 st_5
cbx_case cbx_case
st_4 st_4
sle_new sle_new
sle_old sle_old
st_3 st_3
st_2 st_2
st_1 st_1
cb_close cb_close
cb_ok cb_ok
mle_1 mle_1
gb_1 gb_1
end type
global w_global_replace w_global_replace

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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String	is_Text,is_OrgText
end variables

forward prototypes
public function integer of_global_replace (string as_source, string as_old, string as_new, boolean ab_usecase, integer ai_start, integer ai_end)
public function integer of_global_replace (string as_source, string as_old, string as_new)
public function string of_get_syntax ()
public function integer of_global_replace (string as_source, string as_old, string as_new, boolean ab_usecase)
end prototypes

public function integer of_global_replace (string as_source, string as_old, string as_new, boolean ab_usecase, integer ai_start, integer ai_end);//====================================================================
// Function: of_global_replace()
//--------------------------------------------------------------------
// Description: This function replaces all occurrences in as_Source of as_Old with as_New
//              it returns the number of replacements made.
//--------------------------------------------------------------------
// Arguments: 
//		value	string 	as_source 		
//		value	string 	as_old    		
//		value	string 	as_new    		
//		value	boolean	ab_usecase		
//		value	integer	ai_start  		
//		value	integer	ai_end    		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Integer		li_Pos, li_OldLen, li_NewLen, li_Cnt
Boolean		lb_GetLen

li_OldLen = LenA(as_Old)
li_NewLen = LenA(as_New)

// If ai_End is 0 then replace to the end of as_Source
If ai_End = 0 Then
	ai_End = LenA(as_Source)
	lb_GetLen = True
Else
	lb_GetLen = False
End if

//Find the first occurrence of as_Old
If ab_UseCase Then
	li_Pos = PosA(as_Source, as_Old, ai_Start)
Else
	li_Pos = PosA(Upper(as_Source), Upper(as_Old), ai_Start)
End if


Do While (li_Pos > 0) And (li_Pos < ai_End)
	as_Source = ReplaceA(as_Source, li_Pos, li_OldLen, as_New)
	
	If ab_UseCase Then
		li_Pos = PosA(as_Source, as_Old, (li_Pos + li_NewLen))
	Else
		li_Pos = PosA(Upper(as_Source), Upper(as_Old), (li_Pos + li_NewLen))
	End if

	// Because the length of as_Source may have changed, get it again
	If lb_GetLen Then
		ai_End = LenA(as_Source)
	End if

	li_Cnt ++
Loop

is_text = as_Source

Return li_Cnt

end function

public function integer of_global_replace (string as_source, string as_old, string as_new);//====================================================================
// Function: of_global_replace()
//--------------------------------------------------------------------
// Description: This function replaces all occurrences in as_Source of as_Old with as_New
//              it returns the number of replacements made.
//--------------------------------------------------------------------
// Arguments: 
//		value	string	as_source		
//		value	string	as_old   		
//		value	string	as_new   		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Integer	li_Pos, li_OldLen, li_NewLen, li_Cnt

li_OldLen = LenA(as_Old)
li_NewLen = LenA(as_New)

//Find the first occurrence of as_Old
li_Pos = PosA(Upper(as_Source), Upper(as_Old), 1)

Do While li_Pos > 0
	as_Source = ReplaceA(as_Source, li_Pos, li_OldLen, as_New)
	li_Pos = PosA(Upper(as_Source), Upper(as_Old), (li_Pos + li_NewLen))
	li_Cnt ++
Loop

is_text = as_Source

Return li_Cnt


end function

public function string of_get_syntax ();//====================================================================
// Function: of_get_syntax()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String	ls_Syntax
Integer	ldb_Start, ldb_End

ls_Syntax = "of_global_replace(mle_1.Text, ~"" + sle_old.Text + "~", ~"" + sle_new.Text + "~""

If cbx_case.Checked Then
	ls_Syntax = ls_Syntax + ", True"
End If

ldb_Start = Integer(sle_start.Text)
ldb_End = Integer(sle_end.Text)

If ldb_Start > 0 Then
	If Not cbx_case.Checked Then
		ls_Syntax = ls_Syntax + ", False"
	End If
	
	ls_Syntax = ls_Syntax + ", " + String(ldb_Start) + ", " + String(ldb_End)
End If

ls_Syntax = ls_Syntax + ")"


Return ls_Syntax


end function

public function integer of_global_replace (string as_source, string as_old, string as_new, boolean ab_usecase);//====================================================================
// Function: of_global_replace()
//--------------------------------------------------------------------
// Description: This function replaces all occurrences in as_Source of as_Old with as_New
//              it returns the number of replacements made.
//--------------------------------------------------------------------
// Arguments: 
//		value	string 	as_source 		
//		value	string 	as_old    		
//		value	string 	as_new    		
//		value	boolean	ab_usecase		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Integer	li_Pos, li_OldLen, li_NewLen, li_Cnt

li_OldLen = LenA(as_Old)
li_NewLen = LenA(as_New)

//Find the first occurrence of as_Old
If ab_UseCase Then
	li_Pos = PosA(as_Source, as_Old, 1)
Else
	li_Pos = PosA(Upper(as_Source), Upper(as_Old), 1)
End If

Do While li_Pos > 0
	as_Source = ReplaceA(as_Source, li_Pos, li_OldLen, as_New)
	
	If ab_UseCase Then
		li_Pos = PosA(as_Source, as_Old, (li_Pos + li_NewLen))
	Else
		li_Pos = PosA(Upper(as_Source), Upper(as_Old), (li_Pos + li_NewLen))
	End If
	
	li_Cnt ++
Loop

is_text = as_Source

Return li_Cnt


end function

on w_global_replace.destroy
destroy(this.sle_end)
destroy(this.sle_start)
destroy(this.cb_reset)
destroy(this.st_syntax)
destroy(this.st_6)
destroy(this.sle_num)
destroy(this.st_5)
destroy(this.cbx_case)
destroy(this.st_4)
destroy(this.sle_new)
destroy(this.sle_old)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.cb_ok)
destroy(this.mle_1)
destroy(this.gb_1)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y = 0

is_Text = "The Code Examples provide a demonstration of the functionality of PowerBuilder.  " + &
			"Each example highlights one or more features while providing examples of ways in " + &
			"which the features may be used.  The Code Examples are grouped by topics indicating " + &
			"their primary focus.  However, many examples may use several PowerBuilder features.  " + &
			"Each example is also an example of proper coding techniques for the features.  " + &
			"Developers may copy example code from the Code Examples and paste it into their own " + &
			"application."

mle_1.Text = is_Text
is_OrgText = is_Text

end event

on w_global_replace.create
this.sle_end=create sle_end
this.sle_start=create sle_start
this.cb_reset=create cb_reset
this.st_syntax=create st_syntax
this.st_6=create st_6
this.sle_num=create sle_num
this.st_5=create st_5
this.cbx_case=create cbx_case
this.st_4=create st_4
this.sle_new=create sle_new
this.sle_old=create sle_old
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_close=create cb_close
this.cb_ok=create cb_ok
this.mle_1=create mle_1
this.gb_1=create gb_1
this.Control[]={this.sle_end,&
this.sle_start,&
this.cb_reset,&
this.st_syntax,&
this.st_6,&
this.sle_num,&
this.st_5,&
this.cbx_case,&
this.st_4,&
this.sle_new,&
this.sle_old,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_close,&
this.cb_ok,&
this.mle_1,&
this.gb_1}
end on

type sle_end from singlelineedit within w_global_replace
integer x = 654
integer y = 636
integer width = 256
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

st_syntax.Text = of_get_syntax()
end event

type sle_start from singlelineedit within w_global_replace
integer x = 242
integer y = 636
integer width = 256
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

st_syntax.Text = of_get_syntax()
end event

type cb_reset from commandbutton within w_global_replace
integer x = 1394
integer y = 1148
integer width = 366
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

mle_1.Text = is_OrgText

end event

type st_syntax from statictext within w_global_replace
integer x = 590
integer y = 868
integer width = 1513
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "of_global_replace(mle_1.Text, ~"example~", ~"fragment~")"
boolean border = true
long bordercolor = 8388608
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_global_replace
integer x = 82
integer y = 872
integer width = 453
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "Function Call Syntax:"
alignment alignment = right!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type sle_num from singlelineedit within w_global_replace
integer x = 891
integer y = 972
integer width = 265
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_global_replace
integer x = 82
integer y = 976
integer width = 768
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "Number of Occurrences Replaced:"
boolean focusrectangle = false
end type

type cbx_case from checkbox within w_global_replace
integer x = 1303
integer y = 636
integer width = 475
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "Match Case"
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

st_syntax.Text = of_get_syntax()

end event

type st_4 from statictext within w_global_replace
integer x = 489
integer y = 648
integer width = 146
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "End:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_new from singlelineedit within w_global_replace
integer x = 1303
integer y = 516
integer width = 864
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "fragment"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

st_syntax.Text = of_get_syntax()

end event

type sle_old from singlelineedit within w_global_replace
integer x = 247
integer y = 512
integer width = 864
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "example"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

st_syntax.Text = of_get_syntax()

end event

type st_3 from statictext within w_global_replace
integer x = 96
integer y = 648
integer width = 128
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "Start:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_global_replace
integer x = 1166
integer y = 524
integer width = 128
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "With:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_global_replace
integer x = 23
integer y = 524
integer width = 210
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "Replace:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_global_replace
integer x = 1801
integer y = 1148
integer width = 366
integer height = 88
integer taborder = 80
integer textsize = -8
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Close(Parent)

end event

type cb_ok from commandbutton within w_global_replace
integer x = 987
integer y = 1148
integer width = 366
integer height = 88
integer taborder = 60
integer textsize = -8
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Integer	li_Cnt
Integer	ldb_Start, ldb_End
String   ls_text,ls_old,ls_new
Boolean  lb_case

ls_old = sle_old.text
If ls_old = '' Then 
	sle_num.Text = '0'
	Return 
End IF

ls_new = sle_new.text
ls_text = mle_1.text
lb_case = cbx_case.Checked 

ldb_Start = Integer(sle_start.text)
ldb_End = Integer(sle_end.text)

If ldb_Start > 0 Then
	li_Cnt = of_global_replace(ls_text, ls_old, ls_new, lb_case, &
											ldb_Start, ldb_End)

Elseif cbx_case.Checked Then
	li_Cnt = of_global_replace(ls_text, ls_old, ls_new, True)

Else
	li_Cnt = of_global_replace(ls_text, ls_old, ls_new)
End If

sle_num.Text = String(li_Cnt)
mle_1.text = is_text

end event

type mle_1 from multilineedit within w_global_replace
integer x = 32
integer y = 32
integer width = 2135
integer height = 452
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_global_replace
integer x = 27
integer y = 780
integer width = 2139
integer height = 316
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "Execution Result"
end type

