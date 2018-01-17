$PBExportHeader$w_dw_filterstyle.srw
$PBExportComments$Dynamic set filter for datawindow
forward
global type w_dw_filterstyle from window
end type
type cb_3 from commandbutton within w_dw_filterstyle
end type
type st_tip from statictext within w_dw_filterstyle
end type
type cb_2 from commandbutton within w_dw_filterstyle
end type
type cb_1 from commandbutton within w_dw_filterstyle
end type
type st_1 from statictext within w_dw_filterstyle
end type
type cb_close from commandbutton within w_dw_filterstyle
end type
type dw_1 from datawindow within w_dw_filterstyle
end type
end forward

global type w_dw_filterstyle from window
integer x = 256
integer y = 264
integer width = 2555
integer height = 1428
boolean titlebar = true
string title = "Dynamic Filter Settings"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
cb_3 cb_3
st_tip st_tip
cb_2 cb_2
cb_1 cb_1
st_1 st_1
cb_close cb_close
dw_1 dw_1
end type
global w_dw_filterstyle w_dw_filterstyle

type variables

end variables

event ue_postopen();//====================================================================
// Event: ue_postopen()
//--------------------------------------------------------------------
// Description: ue_PostOpen script for w_hightlight_dw_rows
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

// Set the transaction object
dw_1.SetTransObject (sqlca)

// Retrieve the data
dw_1.Retrieve()




end event

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Open script for w_highlight_dw_rows
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

// Post event to retrieve data on postopen (allow window to open faster)
This.X = 0
This.Y = 0

This.Post Event  ue_postopen()



end event

on w_dw_filterstyle.create
this.cb_3=create cb_3
this.st_tip=create st_tip
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_close=create cb_close
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.st_tip,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.cb_close,&
this.dw_1}
end on

on w_dw_filterstyle.destroy
destroy(this.cb_3)
destroy(this.st_tip)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type cb_3 from commandbutton within w_dw_filterstyle
integer x = 1010
integer y = 1220
integer width = 306
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas( )
end event

type st_tip from statictext within w_dw_filterstyle
integer x = 32
integer y = 1164
integer width = 1422
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Current filter expression is : "
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_dw_filterstyle
integer x = 1477
integer y = 1144
integer width = 306
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Filter"
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
String   ls_Filter

OpenWithParm(w_Filter_single,dw_1)


ls_Filter = Message.StringParm
If ls_Filter = '-1' Then Return
dw_1.SetFilter(ls_Filter)
dw_1.Filter()
st_tip.Text = "Current filter expression is : "+ls_Filter





end event

type cb_1 from commandbutton within w_dw_filterstyle
integer x = 1819
integer y = 1144
integer width = 306
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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
dw_1.Reset()
dw_1.Retrieve()

end event

type st_1 from statictext within w_dw_filterstyle
integer x = 32
integer y = 40
integer width = 2711
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "This example shows how to set filter criteria by a response dialog window."
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_dw_filterstyle
integer x = 2162
integer y = 1144
integer width = 306
integer height = 96
integer taborder = 10
integer textsize = -9
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
CLOSE(Parent)


end event

type dw_1 from datawindow within w_dw_filterstyle
integer x = 32
integer y = 140
integer width = 2441
integer height = 968
integer taborder = 30
string dataobject = "d_salary_view"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//====================================================================
// Event: rowfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	currentrow		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrowchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
If currentrow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(currentrow,True)
End If

end event

