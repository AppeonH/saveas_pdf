$PBExportHeader$w_employee.srw
$PBExportComments$Uses the employee business object.
forward
global type w_employee from w_ancestor_one_dw
end type
type st_1 from statictext within w_employee
end type
type st_2 from statictext within w_employee
end type
type st_3 from statictext within w_employee
end type
type st_4 from statictext within w_employee
end type
type cb_1 from commandbutton within w_employee
end type
type cb_2 from commandbutton within w_employee
end type
type cb_3 from commandbutton within w_employee
end type
type cb_4 from commandbutton within w_employee
end type
end forward

global type w_employee from w_ancestor_one_dw
integer width = 2601
integer height = 1136
string title = "Business Class"
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = main!
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
end type
global w_employee w_employee

event ue_delete_row;//====================================================================
// Event: ue_delete_row()
//--------------------------------------------------------------------
// Description: Display error message if trying to delete an employee with active status.
// AncestorReturnValue is the return value of the ue_delete_row event in 
// w_ancestor_one_dw.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Int  li

li = Super::Event ue_delete_row()

If li = -2 Then
	MessageBox ("Delete Refused", "Employees with active status may not be deleted.")
	
End If

Return 1


end event

event ue_create_businessobject;//====================================================================
// Event: ue_create_businessobject()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
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
iuo_business_object = Create u_employee_object

end event

on w_employee.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.cb_4
end on

on w_employee.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
end on

type cb_saveas from w_ancestor_one_dw`cb_saveas within w_employee
integer x = 2162
integer y = 832
end type

type cb_close from w_ancestor_one_dw`cb_close within w_employee
integer x = 2135
integer y = 608
integer width = 393
end type

type cb_delete from w_ancestor_one_dw`cb_delete within w_employee
integer x = 2135
integer y = 376
integer width = 393
end type

type cb_insert from w_ancestor_one_dw`cb_insert within w_employee
integer x = 2135
integer y = 260
integer width = 393
end type

type cb_update from w_ancestor_one_dw`cb_update within w_employee
integer x = 2135
integer y = 144
integer width = 393
end type

type cb_retrieve from w_ancestor_one_dw`cb_retrieve within w_employee
integer x = 2135
integer y = 28
integer width = 393
end type

type dw_1 from w_ancestor_one_dw`dw_1 within w_employee
integer x = 32
integer y = 288
integer width = 2062
integer height = 704
string dataobject = "d_employee_required"
end type

type st_1 from statictext within w_employee
integer x = 41
integer y = 24
integer width = 937
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Business rules for employee object:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_employee
integer x = 41
integer y = 84
integer width = 1097
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "1) Confirm before adding a new employee."
boolean focusrectangle = false
end type

type st_3 from statictext within w_employee
integer x = 41
integer y = 204
integer width = 1321
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "3) Employees with active status cannot be deleted."
boolean focusrectangle = false
end type

type st_4 from statictext within w_employee
integer x = 41
integer y = 144
integer width = 1257
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "2) Confirm before deleting an existing employee."
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_employee
integer x = 2135
integer y = 496
integer width = 101
integer height = 88
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "|<"
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
dw_1.ScrollToRow(1)

end event

type cb_2 from commandbutton within w_employee
integer x = 2231
integer y = 496
integer width = 101
integer height = 88
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "<"
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
Int  li_Row

li_Row = dw_1.GetRow()
If li_Row <= 1 Then Return
li_Row --
dw_1.ScrollToRow(li_Row)

end event

type cb_3 from commandbutton within w_employee
integer x = 2327
integer y = 496
integer width = 101
integer height = 88
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = ">"
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
Int  li_Row

li_Row = dw_1.GetRow()
If li_Row >= dw_1.RowCount() Then Return
li_Row ++
dw_1.ScrollToRow(li_Row)

end event

type cb_4 from commandbutton within w_employee
integer x = 2423
integer y = 496
integer width = 101
integer height = 88
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = ">|"
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
Int  li_Row

li_Row = dw_1.RowCount()
dw_1.ScrollToRow(li_Row)

end event

