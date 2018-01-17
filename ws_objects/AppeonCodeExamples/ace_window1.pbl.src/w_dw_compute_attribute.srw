$PBExportHeader$w_dw_compute_attribute.srw
$PBExportComments$Min and max salaries by department are different text colors using attribute expressions that reference computed fields.
forward
global type w_dw_compute_attribute from window
end type
type cb_1 from commandbutton within w_dw_compute_attribute
end type
type mle_help from multilineedit within w_dw_compute_attribute
end type
type dw_1 from datawindow within w_dw_compute_attribute
end type
type cb_close from commandbutton within w_dw_compute_attribute
end type
type cb_update from commandbutton within w_dw_compute_attribute
end type
type cb_retrieve from commandbutton within w_dw_compute_attribute
end type
end forward

global type w_dw_compute_attribute from window
integer x = 169
integer y = 40
integer width = 2615
integer height = 1592
boolean titlebar = true
string title = "Referencing Computed Fields in Attribute Expressions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
cb_1 cb_1
mle_help mle_help
dw_1 dw_1
cb_close cb_close
cb_update cb_update
cb_retrieve cb_retrieve
end type
global w_dw_compute_attribute w_dw_compute_attribute

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.X = 0
This.Y = 0

dw_1.SetTransObject (sqlca)

// Post an event that retrieves the DataWindow.
cb_retrieve.PostEvent (Clicked!)

end event

on w_dw_compute_attribute.create
this.cb_1=create cb_1
this.mle_help=create mle_help
this.dw_1=create dw_1
this.cb_close=create cb_close
this.cb_update=create cb_update
this.cb_retrieve=create cb_retrieve
this.Control[]={this.cb_1,&
this.mle_help,&
this.dw_1,&
this.cb_close,&
this.cb_update,&
this.cb_retrieve}
end on

on w_dw_compute_attribute.destroy
destroy(this.cb_1)
destroy(this.mle_help)
destroy(this.dw_1)
destroy(this.cb_close)
destroy(this.cb_update)
destroy(this.cb_retrieve)
end on

type cb_1 from commandbutton within w_dw_compute_attribute
integer x = 1170
integer y = 1356
integer width = 288
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas( )
end event

type mle_help from multilineedit within w_dw_compute_attribute
integer x = 37
integer y = 40
integer width = 2167
integer height = 128
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "If the value of the Salary column in the detail band is equal to one of the computed field values in the group trailer band, the text color changes to the appropriate value. "
boolean border = false
boolean displayonly = true
end type

type dw_1 from datawindow within w_dw_compute_attribute
integer x = 37
integer y = 192
integer width = 2482
integer height = 1132
integer taborder = 10
string dataobject = "d_dw_compute_attribute"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;//====================================================================
// Event: retrieveend()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	rowcount		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnretrieveend]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
cb_update.Enabled = True

end event

event retrievestart;//====================================================================
// Event: retrievestart()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnretrievestart]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
cb_update.Enabled = False

end event

type cb_close from commandbutton within w_dw_compute_attribute
integer x = 2231
integer y = 1356
integer width = 288
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
CLOSE (Parent)

end event

type cb_update from commandbutton within w_dw_compute_attribute
integer x = 1902
integer y = 1356
integer width = 288
integer height = 96
integer taborder = 30
integer textsize = -9
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update the DataWindow
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

If dw_1.UPDATE() = 1 Then
	COMMIT;
Else
	ROLLBACK;
End If

end event

type cb_retrieve from commandbutton within w_dw_compute_attribute
integer x = 1573
integer y = 1356
integer width = 288
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

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the DataWindow
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

dw_1.Retrieve()

end event

