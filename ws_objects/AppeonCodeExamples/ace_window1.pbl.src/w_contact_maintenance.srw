$PBExportHeader$w_contact_maintenance.srw
$PBExportComments$Window displaying DataWindow using buttons
forward
global type w_contact_maintenance from window
end type
type dw_contact from datawindow within w_contact_maintenance
end type
end forward

global type w_contact_maintenance from window
integer x = 832
integer y = 360
integer width = 2272
integer height = 1248
boolean titlebar = true
string title = "Contact Maintenance Using DataWindow Buttons"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
dw_contact dw_contact
end type
global w_contact_maintenance w_contact_maintenance

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

dw_contact.SetTransObject(sqlca)
dw_contact.InsertRow(0)


end event

on w_contact_maintenance.create
this.dw_contact=create dw_contact
this.Control[]={this.dw_contact}
end on

on w_contact_maintenance.destroy
destroy(this.dw_contact)
end on

type dw_contact from datawindow within w_contact_maintenance
integer x = 46
integer y = 52
integer width = 2089
integer height = 1044
integer taborder = 1
string dataobject = "d_contact_maintenance"
boolean border = false
end type

event buttonclicked;//====================================================================
// Event: buttonclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row             		
//		long    	actionreturncode		
//		dwobject	dwo             		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnbuttonclicked]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String	ls_Object
String				ls_Win

ls_Object = String(dwo.Name)

If ls_Object = "cb_close" Then
	CLOSE(Parent)
ElseIf ls_Object = "cb_reset" Then
	Reset()
	This.InsertRow(0)
ElseIf ls_Object = "b_delete" Then
	If This.RowCount() <= 1 Then
		This.Post InsertRow(0)
	End If
End If


end event

