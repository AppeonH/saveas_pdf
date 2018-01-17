$PBExportHeader$w_salary_admin.srw
forward
global type w_salary_admin from window
end type
type cb_1 from commandbutton within w_salary_admin
end type
type cb_highlight from commandbutton within w_salary_admin
end type
type st_4 from statictext within w_salary_admin
end type
type st_10 from statictext within w_salary_admin
end type
type sle_pct from singlelineedit within w_salary_admin
end type
type cb_calculate from commandbutton within w_salary_admin
end type
type cb_update from commandbutton within w_salary_admin
end type
type cb_cancel from commandbutton within w_salary_admin
end type
type cb_reset from commandbutton within w_salary_admin
end type
type rb_active from radiobutton within w_salary_admin
end type
type rb_leave from radiobutton within w_salary_admin
end type
type rb_terminated from radiobutton within w_salary_admin
end type
type rb_plus from radiobutton within w_salary_admin
end type
type rb_minus from radiobutton within w_salary_admin
end type
type st_2 from statictext within w_salary_admin
end type
type st_3 from statictext within w_salary_admin
end type
type dw_employees from datawindow within w_salary_admin
end type
type gb_1 from groupbox within w_salary_admin
end type
type gb_2 from groupbox within w_salary_admin
end type
type dw_dept from datawindow within w_salary_admin
end type
end forward

global type w_salary_admin from window
integer width = 2715
integer height = 1600
boolean titlebar = true
string title = "Change Employee Salary"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_postopen ( )
cb_1 cb_1
cb_highlight cb_highlight
st_4 st_4
st_10 st_10
sle_pct sle_pct
cb_calculate cb_calculate
cb_update cb_update
cb_cancel cb_cancel
cb_reset cb_reset
rb_active rb_active
rb_leave rb_leave
rb_terminated rb_terminated
rb_plus rb_plus
rb_minus rb_minus
st_2 st_2
st_3 st_3
dw_employees dw_employees
gb_1 gb_1
gb_2 gb_2
dw_dept dw_dept
end type
global w_salary_admin w_salary_admin

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

Integer	ii_Rows, ii_Dept=0
Double	id_Pct = 1.0
String	is_Status = "A"
end variables

event ue_postopen();//====================================================================
// Event: ue_postopen()
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

//datawindowchild	ldwc_Dept

SetPointer(Hourglass!)

//dw_dept.InsertRow(0)
//dw_dept.GetChild("dept_id", ldwc_Dept)
//ldwc_Dept.SetTransObject(sqlca)
//ldwc_Dept.Retrieve()

dw_employees.SetTransObject(sqlca)

end event

on w_salary_admin.create
this.cb_1=create cb_1
this.cb_highlight=create cb_highlight
this.st_4=create st_4
this.st_10=create st_10
this.sle_pct=create sle_pct
this.cb_calculate=create cb_calculate
this.cb_update=create cb_update
this.cb_cancel=create cb_cancel
this.cb_reset=create cb_reset
this.rb_active=create rb_active
this.rb_leave=create rb_leave
this.rb_terminated=create rb_terminated
this.rb_plus=create rb_plus
this.rb_minus=create rb_minus
this.st_2=create st_2
this.st_3=create st_3
this.dw_employees=create dw_employees
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_dept=create dw_dept
this.Control[]={this.cb_1,&
this.cb_highlight,&
this.st_4,&
this.st_10,&
this.sle_pct,&
this.cb_calculate,&
this.cb_update,&
this.cb_cancel,&
this.cb_reset,&
this.rb_active,&
this.rb_leave,&
this.rb_terminated,&
this.rb_plus,&
this.rb_minus,&
this.st_2,&
this.st_3,&
this.dw_employees,&
this.gb_1,&
this.gb_2,&
this.dw_dept}
end on

on w_salary_admin.destroy
destroy(this.cb_1)
destroy(this.cb_highlight)
destroy(this.st_4)
destroy(this.st_10)
destroy(this.sle_pct)
destroy(this.cb_calculate)
destroy(this.cb_update)
destroy(this.cb_cancel)
destroy(this.cb_reset)
destroy(this.rb_active)
destroy(this.rb_leave)
destroy(this.rb_terminated)
destroy(this.rb_plus)
destroy(this.rb_minus)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_employees)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_dept)
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

this.x =0
this.y=0
datawindowchild	ldwc_Dept

dw_dept.settransobject(SQLCA)
dw_dept.InsertRow(0)
this.postevent("ue_postopen")
end event

type cb_1 from commandbutton within w_salary_admin
integer x = 2085
integer y = 776
integer width = 549
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_employees.saveas( )
end event

type cb_highlight from commandbutton within w_salary_admin
integer x = 2085
integer y = 432
integer width = 549
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Highlight Employees"
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

String	ls_Filter
long  ll

dw_dept.accepttext()
ii_Dept = dw_dept.getitemnumber(1,'dept_id')

If isnull(ii_Dept) OR ii_Dept <= 0 Then
	MessageBox("Warning", "Please select a department.", Exclamation!)
	Return
End if

dw_employees.selectrow(0,false)

FOR ll =  1 TO dw_employees.rowcount()
	if dw_employees.getitemstring(ll,"employee_status") = is_status then dw_employees.selectrow(ll,TRUE)
NEXT
end event

type st_4 from statictext within w_salary_admin
integer x = 41
integer y = 168
integer width = 640
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "percentage."
boolean focusrectangle = false
end type

type st_10 from statictext within w_salary_admin
integer x = 2560
integer y = 112
integer width = 41
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "%"
boolean focusrectangle = false
end type

type sle_pct from singlelineedit within w_salary_admin
integer x = 2313
integer y = 104
integer width = 247
integer height = 68
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
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

If rb_minus.Checked Then
	id_Pct = 1 - (Double(This.Text) / 100)
Else
	id_Pct = 1 + (Double(This.Text) / 100)
End if

end event

type cb_calculate from commandbutton within w_salary_admin
integer x = 2085
integer y = 548
integer width = 549
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Calculate Salaries"
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
Dec{3}  ldc_salary

dw_dept.AcceptText()
ii_Dept = dw_dept.GetItemNumber(1,'dept_id')

If IsNull(ii_Dept) Or ii_Dept <= 0 Then
	MessageBox("Warning", "You must select a department.", Exclamation!)
	Return
End If

For li_Cnt = 1 To ii_Rows
	If dw_employees.Object.employee_status[li_Cnt] = is_Status  Then
		ldc_salary = dw_employees.GetItemDecimal(li_Cnt,"employee_salary") * id_Pct
		dw_employees.SetItem(li_Cnt,"employee_salary",ldc_salary)
	End If
Next


end event

type cb_update from commandbutton within w_salary_admin
integer x = 2085
integer y = 664
integer width = 549
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update"
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

string  ls_Err

IF dw_employees.Update() > 0 THEN
	Commit;
ELSE
	ls_Err =  sqlca.sqlerrtext
	rollback;
	messagebox("Error","Unable to update employee salary data.~r~n"+ls_err)
END IF

end event

type cb_cancel from commandbutton within w_salary_admin
integer x = 2085
integer y = 1360
integer width = 549
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
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

type cb_reset from commandbutton within w_salary_admin
integer x = 2085
integer y = 320
integer width = 549
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Retrieve"
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

dw_dept.accepttext()
ii_Dept = dw_dept.getitemnumber(1,'dept_id')

If isnull(ii_Dept) OR ii_Dept <= 0 Then
	MessageBox("Warning", "Please select a department.", Exclamation!)
	Return
End if

dw_employees.Retrieve(ii_dept)

ii_Rows = dw_employees.RowCount()

end event

type rb_active from radiobutton within w_salary_admin
integer x = 1637
integer y = 72
integer width = 256
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Active"
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

is_Status = "A"

end event

type rb_leave from radiobutton within w_salary_admin
integer x = 1637
integer y = 144
integer width = 329
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "On Leave"
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

is_Status = "L"

end event

type rb_terminated from radiobutton within w_salary_admin
integer x = 1637
integer y = 212
integer width = 361
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Terminated"
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

is_Status = "T"

end event

type rb_plus from radiobutton within w_salary_admin
integer x = 2071
integer y = 72
integer width = 224
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Plus"
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

sle_pct.textcolor = 0
id_Pct = 1 + (Double(sle_pct.Text) / 100)

end event

type rb_minus from radiobutton within w_salary_admin
integer x = 2071
integer y = 148
integer width = 224
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Minus"
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

sle_pct.textcolor = 255
id_Pct = 1 - (Double(sle_pct.Text) / 100)

end event

type st_2 from statictext within w_salary_admin
integer x = 41
integer y = 32
integer width = 741
integer height = 48
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Select a Department and Status,"
boolean focusrectangle = false
end type

type st_3 from statictext within w_salary_admin
integer x = 41
integer y = 100
integer width = 777
integer height = 52
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "and enter a raise (or deduction) "
boolean focusrectangle = false
end type

type dw_employees from datawindow within w_salary_admin
integer x = 37
integer y = 320
integer width = 2011
integer height = 1132
integer taborder = 10
string title = "none"
string dataobject = "d_salary_adm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_salary_admin
integer x = 2039
integer y = 20
integer width = 594
integer height = 208
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Salary Treatment"
end type

type gb_2 from groupbox within w_salary_admin
integer x = 1627
integer y = 20
integer width = 384
integer height = 272
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Status"
end type

type dw_dept from datawindow within w_salary_admin
integer x = 782
integer y = 36
integer width = 859
integer height = 120
integer taborder = 40
string title = "none"
string dataobject = "d_salary_cond"
boolean border = false
boolean livescroll = true
end type

