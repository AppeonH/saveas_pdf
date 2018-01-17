$PBExportHeader$w_print_employee_roster_dw.srw
$PBExportComments$Prints the employee roster with control breaks by department; Uses DataWindow Production Reporting and the DataWindow Print function.
forward
global type w_print_employee_roster_dw from window
end type
type cb_saveas from commandbutton within w_print_employee_roster_dw
end type
type cb_close from commandbutton within w_print_employee_roster_dw
end type
type cb_print from commandbutton within w_print_employee_roster_dw
end type
type cb_retrieve from commandbutton within w_print_employee_roster_dw
end type
type dw_employee_roster from datawindow within w_print_employee_roster_dw
end type
end forward

global type w_print_employee_roster_dw from window
integer x = 197
integer y = 300
integer width = 2670
integer height = 1684
boolean titlebar = true
string title = "Computed Columns in a DataWindow"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
cb_saveas cb_saveas
cb_close cb_close
cb_print cb_print
cb_retrieve cb_retrieve
dw_employee_roster dw_employee_roster
end type
global w_print_employee_roster_dw w_print_employee_roster_dw

type variables

end variables

event ue_postopen;//====================================================================
// Event: ue_postopen()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	unsignedlong	wparam		
//		value	long        	lparam		
//--------------------------------------------------------------------
// Returns: long [pbm_custom01]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dw_employee_roster.SetTransObject(sqlca)
cb_retrieve.triggerevent("clicked")
end event

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Open script for w_print_employee_roster_dw
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

this.postevent("ue_postopen")
end event

on w_print_employee_roster_dw.create
this.cb_saveas=create cb_saveas
this.cb_close=create cb_close
this.cb_print=create cb_print
this.cb_retrieve=create cb_retrieve
this.dw_employee_roster=create dw_employee_roster
this.Control[]={this.cb_saveas,&
this.cb_close,&
this.cb_print,&
this.cb_retrieve,&
this.dw_employee_roster}
end on

on w_print_employee_roster_dw.destroy
destroy(this.cb_saveas)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.cb_retrieve)
destroy(this.dw_employee_roster)
end on

event close;//Close script for w_print_employee_roster_dw


end event

type cb_saveas from commandbutton within w_print_employee_roster_dw
integer x = 1728
integer y = 1460
integer width = 407
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "SaveAs"
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

dw_employee_roster.SaveAs()
end event

type cb_close from commandbutton within w_print_employee_roster_dw
integer x = 2181
integer y = 1460
integer width = 407
integer height = 100
integer taborder = 40
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Close(parent)
end event

type cb_print from commandbutton within w_print_employee_roster_dw
integer x = 1275
integer y = 1460
integer width = 407
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print Report"
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

dw_employee_roster.Print( )

end event

type cb_retrieve from commandbutton within w_print_employee_roster_dw
integer x = 823
integer y = 1460
integer width = 407
integer height = 100
integer taborder = 20
integer textsize = -9
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

dw_employee_roster.Retrieve( )

end event

type dw_employee_roster from datawindow within w_print_employee_roster_dw
integer x = 32
integer y = 32
integer width = 2560
integer height = 1404
integer taborder = 10
string dataobject = "d_print_employee_roster_dw"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

