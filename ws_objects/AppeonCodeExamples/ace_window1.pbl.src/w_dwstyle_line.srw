$PBExportHeader$w_dwstyle_line.srw
forward
global type w_dwstyle_line from window
end type
type cb_5 from commandbutton within w_dwstyle_line
end type
type cbx_1 from checkbox within w_dwstyle_line
end type
type cb_4 from commandbutton within w_dwstyle_line
end type
type cb_3 from commandbutton within w_dwstyle_line
end type
type dw_1 from datawindow within w_dwstyle_line
end type
type cb_2 from commandbutton within w_dwstyle_line
end type
type cb_1 from commandbutton within w_dwstyle_line
end type
type rb_2 from radiobutton within w_dwstyle_line
end type
type rb_1 from radiobutton within w_dwstyle_line
end type
type gb_1 from groupbox within w_dwstyle_line
end type
end forward

global type w_dwstyle_line from window
integer width = 2734
integer height = 2036
boolean titlebar = true
string title = "DataWindow Line Controls"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_changestyle ( string as_stylename )
cb_5 cb_5
cbx_1 cbx_1
cb_4 cb_4
cb_3 cb_3
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
global w_dwstyle_line w_dwstyle_line

event ue_changestyle(string as_stylename);//====================================================================
// Event: ue_changestyle()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_stylename		
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
String  		ls_DataObject


Choose Case Lower(as_StyleName)
	Case 'freeform'
		If cbx_1.Checked = True Then
			ls_DataObject = "d_dwexample_line_freeform"
		Else
			ls_DataObject = "d_dwexample_line_freeform_no"
		End If
	Case 'tabular'
		If cbx_1.Checked = True Then
			ls_DataObject = "d_dwexample_line_tabular"
		Else
			ls_DataObject = "d_dwexample_line_tabular_no"
		End If
End Choose

dw_1.DataObject = ls_DataObject
dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

end event

on w_dwstyle_line.create
this.cb_5=create cb_5
this.cbx_1=create cbx_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.cb_5,&
this.cbx_1,&
this.cb_4,&
this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.rb_2,&
this.rb_1,&
this.gb_1}
end on

on w_dwstyle_line.destroy
destroy(this.cb_5)
destroy(this.cbx_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

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

end event

type cb_5 from commandbutton within w_dwstyle_line
integer x = 1929
integer y = 80
integer width = 320
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New PDF"
end type

event clicked;OpenWithparm( w_newfeature,dw_1)
end event

type cbx_1 from checkbox within w_dwstyle_line
integer x = 142
integer y = 60
integer width = 1051
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Display the line controls in the DataWindow"
boolean checked = true
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
String ls_style

If rb_1.Checked = True Then
	ls_style = "freeform"
Else
	ls_style = "tabular"
End If
Parent.Event ue_changestyle(ls_style)

end event

type cb_4 from commandbutton within w_dwstyle_line
integer x = 1929
integer y = 196
integer width = 320
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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
//dw_1.object.datawindow.export.pdf.method = distill!
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
dw_1.object.datawindow.export.pdf.method =nativepdf!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
dw_1.SaveAs()

end event

type cb_3 from commandbutton within w_dwstyle_line
integer x = 1586
integer y = 196
integer width = 320
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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

type dw_1 from datawindow within w_dwstyle_line
integer x = 50
integer y = 368
integer width = 2597
integer height = 1520
integer taborder = 30
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_dwstyle_line
integer x = 2272
integer y = 196
integer width = 320
integer height = 92
integer taborder = 30
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

type cb_1 from commandbutton within w_dwstyle_line
integer x = 1243
integer y = 196
integer width = 320
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Refresh"
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
dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

end event

type rb_2 from radiobutton within w_dwstyle_line
integer x = 229
integer y = 228
integer width = 530
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tabular Example"
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
Parent.Event ue_changestyle("tabular")

end event

type rb_1 from radiobutton within w_dwstyle_line
integer x = 229
integer y = 144
integer width = 517
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Freeform Example"
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
Parent.Event ue_changestyle("freeform")

end event

type gb_1 from groupbox within w_dwstyle_line
integer x = 41
integer y = 12
integer width = 2615
integer height = 320
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

