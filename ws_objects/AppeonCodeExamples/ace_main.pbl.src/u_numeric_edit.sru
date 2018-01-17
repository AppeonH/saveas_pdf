$PBExportHeader$u_numeric_edit.sru
$PBExportComments$Single line edit which only accepts numeric input
forward
global type u_numeric_edit from userobject
end type
type sle_1 from singlelineedit within u_numeric_edit
end type
end forward

global type u_numeric_edit from userobject
integer width = 512
integer height = 132
long backcolor = 134217739
long tabtextcolor = 33554432
sle_1 sle_1
end type
global u_numeric_edit u_numeric_edit

on u_numeric_edit.create
this.sle_1=create sle_1
this.Control[]={this.sle_1}
end on

on u_numeric_edit.destroy
destroy(this.sle_1)
end on

event constructor;string ls_Param

ls_Param = Message.StringParm
sle_1.text = ls_Param
end event

type sle_1 from singlelineedit within u_numeric_edit
event char pbm_enchange
integer x = 9
integer y = 16
integer width = 466
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: Only allow 0-9 to be entered into the SLE
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

if LenA (this.text) > 0 then
	if not IsNumber (this.text) then
		this.text = "Invalid number."
	end if
end if
end event

