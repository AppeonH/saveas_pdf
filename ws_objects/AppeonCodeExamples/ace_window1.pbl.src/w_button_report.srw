$PBExportHeader$w_button_report.srw
$PBExportComments$Window displaying DataWindow report using buttons
forward
global type w_button_report from window
end type
type cb_1 from commandbutton within w_button_report
end type
type dw_1 from datawindow within w_button_report
end type
end forward

global type w_button_report from window
integer x = 123
integer y = 24
integer width = 2606
integer height = 1728
boolean titlebar = true
string title = "Report with DataWindow Buttons"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
cb_1 cb_1
dw_1 dw_1
end type
global w_button_report w_button_report

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

dw_1.SetTransObject(sqlca)
dw_1.Retrieve()


end event

on w_button_report.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_1}
end on

on w_button_report.destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_button_report
integer x = 2181
integer y = 1496
integer width = 343
integer height = 108
integer taborder = 11
integer textsize = -8
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

type dw_1 from datawindow within w_button_report
integer x = 46
integer y = 32
integer width = 2478
integer height = 1436
integer taborder = 1
string dataobject = "d_button_report"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;//====================================================================
// Event: buttonclicked()
//--------------------------------------------------------------------
// Description: close current object.
//--------------------------------------------------------------------
// Arguments: 
//		value	long    	row             		
//		value	long    	actionreturncode		
//		value	dwobject	dwo             		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnbuttonclicked]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String	ls_Object
String	ls_win

ls_Object = String(dwo.Name)

If ls_Object = "cb_exit" Then
	CLOSE(Parent)
ElseIf ls_Object = "cb_help" Then
	ls_win = Parent.ClassName()
End If


end event

