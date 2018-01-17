$PBExportHeader$w_employee_summary_footer.srw
$PBExportComments$Produces printed report with control breaks; demonstatrates use of several print functions
forward
global type w_employee_summary_footer from window
end type
type cb_2 from commandbutton within w_employee_summary_footer
end type
type cb_1 from commandbutton within w_employee_summary_footer
end type
type cb_close from commandbutton within w_employee_summary_footer
end type
type dw_1 from datawindow within w_employee_summary_footer
end type
type cb_retrieve from commandbutton within w_employee_summary_footer
end type
end forward

global type w_employee_summary_footer from window
integer x = 197
integer y = 300
integer width = 2642
integer height = 1668
boolean titlebar = true
string title = "Summary & Footer Bands"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_2 cb_2
cb_1 cb_1
cb_close cb_close
dw_1 dw_1
cb_retrieve cb_retrieve
end type
global w_employee_summary_footer w_employee_summary_footer

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Open script for w_print_employee_roster
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

This.X = 0
This.Y = 0

dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

end event

on w_employee_summary_footer.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_close=create cb_close
this.dw_1=create dw_1
this.cb_retrieve=create cb_retrieve
this.Control[]={this.cb_2,&
this.cb_1,&
this.cb_close,&
this.dw_1,&
this.cb_retrieve}
end on

on w_employee_summary_footer.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.dw_1)
destroy(this.cb_retrieve)
end on

type cb_2 from commandbutton within w_employee_summary_footer
integer x = 1906
integer y = 1448
integer width = 311
integer height = 96
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_1.SaveAs()

end event

type cb_1 from commandbutton within w_employee_summary_footer
integer x = 1559
integer y = 1448
integer width = 311
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
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
dw_1.Print()

end event

type cb_close from commandbutton within w_employee_summary_footer
integer x = 2254
integer y = 1448
integer width = 311
integer height = 96
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

////////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for cb_close
////////////////////////////////////////////////////////////////////////////////////////////////////////

CLOSE(Parent)

end event

type dw_1 from datawindow within w_employee_summary_footer
integer x = 37
integer y = 36
integer width = 2523
integer height = 1384
integer taborder = 10
string dataobject = "d_employees_summary_footer"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_retrieve from commandbutton within w_employee_summary_footer
integer x = 1211
integer y = 1448
integer width = 311
integer height = 96
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

////////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for cb_retrieve
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Retrieve the employee data
dw_1.Retrieve( )



end event

