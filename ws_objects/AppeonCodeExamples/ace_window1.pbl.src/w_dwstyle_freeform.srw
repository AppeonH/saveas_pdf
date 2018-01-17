$PBExportHeader$w_dwstyle_freeform.srw
$PBExportComments$DataWindow crosstab style
forward
global type w_dwstyle_freeform from window
end type
type cb_2 from commandbutton within w_dwstyle_freeform
end type
type cb_1 from commandbutton within w_dwstyle_freeform
end type
type rb_2 from radiobutton within w_dwstyle_freeform
end type
type rb_1 from radiobutton within w_dwstyle_freeform
end type
type cb_save from commandbutton within w_dwstyle_freeform
end type
type cb_print from commandbutton within w_dwstyle_freeform
end type
type cb_close from commandbutton within w_dwstyle_freeform
end type
type cb_refresh from commandbutton within w_dwstyle_freeform
end type
type dw_1 from datawindow within w_dwstyle_freeform
end type
type gb_1 from groupbox within w_dwstyle_freeform
end type
end forward

global type w_dwstyle_freeform from window
integer width = 3273
integer height = 1708
boolean titlebar = true
string title = "Freeform DataWindows"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_changestyle ( string as_stylename )
cb_2 cb_2
cb_1 cb_1
rb_2 rb_2
rb_1 rb_1
cb_save cb_save
cb_print cb_print
cb_close cb_close
cb_refresh cb_refresh
dw_1 dw_1
gb_1 gb_1
end type
global w_dwstyle_freeform w_dwstyle_freeform

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
	Case 'freeform_1'
		ls_DataObject = "d_dwstyle_freeform1"
	Case 'freeform_2'
		ls_DataObject = "d_dwstyle_freeform2"
End Choose

dw_1.DataObject = ls_DataObject
dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

end event

on w_dwstyle_freeform.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_save=create cb_save
this.cb_print=create cb_print
this.cb_close=create cb_close
this.cb_refresh=create cb_refresh
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.rb_2,&
this.rb_1,&
this.cb_save,&
this.cb_print,&
this.cb_close,&
this.cb_refresh,&
this.dw_1,&
this.gb_1}
end on

on w_dwstyle_freeform.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_save)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.cb_refresh)
destroy(this.dw_1)
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

type cb_2 from commandbutton within w_dwstyle_freeform
integer x = 2917
integer y = 64
integer width = 297
integer height = 104
integer taborder = 60
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

type cb_1 from commandbutton within w_dwstyle_freeform
integer x = 1915
integer y = 64
integer width = 320
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "PrintJob"
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
//long job
//
//job = PrintOpen( )
//
//PrintDataWindow(job, dw_1)
//
//PrintClose(job)

dw_1.Print(false)
end event

type rb_2 from radiobutton within w_dwstyle_freeform
integer x = 663
integer y = 72
integer width = 539
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Freeform Example 2"
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
Parent.Event ue_changestyle("freeform_2")

end event

type rb_1 from radiobutton within w_dwstyle_freeform
integer x = 91
integer y = 72
integer width = 558
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Freeform Example 1"
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
Parent.Event ue_changestyle("freeform_1")

end event

type cb_save from commandbutton within w_dwstyle_freeform
integer x = 2249
integer y = 64
integer width = 320
integer height = 96
integer taborder = 60
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

type cb_print from commandbutton within w_dwstyle_freeform
integer x = 1582
integer y = 64
integer width = 320
integer height = 96
integer taborder = 40
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

type cb_close from commandbutton within w_dwstyle_freeform
integer x = 2583
integer y = 64
integer width = 320
integer height = 96
integer taborder = 50
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

type cb_refresh from commandbutton within w_dwstyle_freeform
integer x = 1248
integer y = 64
integer width = 320
integer height = 96
integer taborder = 10
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

type dw_1 from datawindow within w_dwstyle_freeform
integer x = 32
integer y = 220
integer width = 3173
integer height = 1356
integer taborder = 30
string title = "none"
string dataobject = "d_dwstyle_freeform1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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

type gb_1 from groupbox within w_dwstyle_freeform
integer x = 32
integer y = 4
integer width = 2930
integer height = 196
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

