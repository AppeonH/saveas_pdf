$PBExportHeader$w_powerscript_in_validation.srw
$PBExportComments$DW that calls PowerScript function in a validation formula.  Also has examples of complex validation rules.
forward
global type w_powerscript_in_validation from window
end type
type st_5 from statictext within w_powerscript_in_validation
end type
type st_3 from statictext within w_powerscript_in_validation
end type
type cb_1 from commandbutton within w_powerscript_in_validation
end type
type dw_1 from datawindow within w_powerscript_in_validation
end type
end forward

global type w_powerscript_in_validation from window
integer x = 192
integer y = 260
integer width = 2318
integer height = 1136
boolean titlebar = true
string title = "DataWindow Validation Rules"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_5 st_5
st_3 st_3
cb_1 cb_1
dw_1 dw_1
end type
global w_powerscript_in_validation w_powerscript_in_validation

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description:  open event
//              Set the tranasaction object and retrieve data into the datawindow.
//              The validation rules that exist for this example are contained in the datawindow
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

dw_1.SetTransObject (sqlca)

dw_1.Retrieve ()

end event

on w_powerscript_in_validation.create
this.st_5=create st_5
this.st_3=create st_3
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_5,&
this.st_3,&
this.cb_1,&
this.dw_1}
end on

on w_powerscript_in_validation.destroy
destroy(this.st_5)
destroy(this.st_3)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type st_5 from statictext within w_powerscript_in_validation
integer x = 41
integer y = 52
integer width = 453
integer height = 68
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Validation Rule:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_powerscript_in_validation
integer x = 37
integer y = 132
integer width = 613
integer height = 340
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
boolean enabled = false
string text = "Name consists of alphabetic characters only.  The first character of Name must be uppercase.The salary must be less than 100000"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_powerscript_in_validation
integer x = 1874
integer y = 892
integer width = 357
integer height = 100
integer taborder = 20
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

close(parent)
end event

type dw_1 from datawindow within w_powerscript_in_validation
integer x = 686
integer y = 116
integer width = 1541
integer height = 740
integer taborder = 10
string dataobject = "d_powerscript_function_validation"
borderstyle borderstyle = stylelowered!
end type

