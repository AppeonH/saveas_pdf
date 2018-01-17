$PBExportHeader$u_date_edit.sru
$PBExportComments$Edit mask which checks for a valid Friday
forward
global type u_date_edit from userobject
end type
type em_1 from editmask within u_date_edit
end type
end forward

global type u_date_edit from userobject
integer width = 466
integer height = 124
long backcolor = 78682240
long tabtextcolor = 33554432
em_1 em_1
end type
global u_date_edit u_date_edit

on u_date_edit.create
this.em_1=create em_1
this.Control[]={this.em_1}
end on

on u_date_edit.destroy
destroy(this.em_1)
end on

type em_1 from editmask within u_date_edit
integer x = 9
integer y = 12
integer width = 434
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: Test if the date entered is a Friday.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 			Date: 2003/12/31
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

date	 ld_Inputday
string ls_Friday

this.GetData (ld_Inputday)
ls_Friday = DayName(2004-10-15)

if not DayName(ld_Inputday) = ls_Friday then
	MessageBox("Alert", this.Text + " isn't a Friday.")
	this.Text = ""
end if
end event

