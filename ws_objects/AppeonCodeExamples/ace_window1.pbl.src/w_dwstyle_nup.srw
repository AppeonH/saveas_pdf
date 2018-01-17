$PBExportHeader$w_dwstyle_nup.srw
$PBExportComments$DataWindow graph style
forward
global type w_dwstyle_nup from window
end type
type cb_1 from commandbutton within w_dwstyle_nup
end type
type st_1 from statictext within w_dwstyle_nup
end type
type rb_3 from radiobutton within w_dwstyle_nup
end type
type rb_2 from radiobutton within w_dwstyle_nup
end type
type cb_save from commandbutton within w_dwstyle_nup
end type
type cb_print from commandbutton within w_dwstyle_nup
end type
type cb_close from commandbutton within w_dwstyle_nup
end type
type cb_refresh from commandbutton within w_dwstyle_nup
end type
type rb_1 from radiobutton within w_dwstyle_nup
end type
type dw_1 from datawindow within w_dwstyle_nup
end type
type gb_1 from groupbox within w_dwstyle_nup
end type
end forward

global type w_dwstyle_nup from window
integer width = 3095
integer height = 1708
boolean titlebar = true
string title = "N-Up DataWindows"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_changestyle ( string as_stylename )
cb_1 cb_1
st_1 st_1
rb_3 rb_3
rb_2 rb_2
cb_save cb_save
cb_print cb_print
cb_close cb_close
cb_refresh cb_refresh
rb_1 rb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_dwstyle_nup w_dwstyle_nup

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

//switch DataWindow Object to graph type
Choose Case Lower(as_StyleName)
	Case 'nup_1'
		ls_DataObject = "d_dwstyle_nup1"
	Case 'nup_2'
		ls_DataObject = "d_dwstyle_nup2"
	Case 'nup_3'
		ls_DataObject = "d_dwstyle_nup3"
End Choose

dw_1.DataObject = ls_DataObject
dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

end event

on w_dwstyle_nup.create
this.cb_1=create cb_1
this.st_1=create st_1
this.rb_3=create rb_3
this.rb_2=create rb_2
this.cb_save=create cb_save
this.cb_print=create cb_print
this.cb_close=create cb_close
this.cb_refresh=create cb_refresh
this.rb_1=create rb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.st_1,&
this.rb_3,&
this.rb_2,&
this.cb_save,&
this.cb_print,&
this.cb_close,&
this.cb_refresh,&
this.rb_1,&
this.dw_1,&
this.gb_1}
end on

on w_dwstyle_nup.destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.cb_save)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.cb_refresh)
destroy(this.rb_1)
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

type cb_1 from commandbutton within w_dwstyle_nup
integer x = 2290
integer y = 20
integer width = 320
integer height = 96
integer taborder = 10
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

type st_1 from statictext within w_dwstyle_nup
integer x = 50
integer y = 12
integer width = 2377
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example applies only to Appeon Server versions which support N-Up DataWindow."
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_dwstyle_nup
integer x = 1061
integer y = 136
integer width = 457
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "N-Up Example 3"
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
Parent.Event ue_changestyle("nup_3")

end event

type rb_2 from radiobutton within w_dwstyle_nup
integer x = 567
integer y = 136
integer width = 457
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "N-Up Example 2"
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
Parent.Event ue_changestyle("nup_2")

end event

type cb_save from commandbutton within w_dwstyle_nup
integer x = 2290
integer y = 124
integer width = 320
integer height = 96
integer taborder = 60
integer textsize = -9
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

type cb_print from commandbutton within w_dwstyle_nup
integer x = 1934
integer y = 124
integer width = 320
integer height = 96
integer taborder = 40
integer textsize = -9
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

type cb_close from commandbutton within w_dwstyle_nup
integer x = 2647
integer y = 124
integer width = 320
integer height = 96
integer taborder = 50
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

type cb_refresh from commandbutton within w_dwstyle_nup
integer x = 1577
integer y = 124
integer width = 320
integer height = 96
integer taborder = 10
integer textsize = -9
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
dw_1.Retrieve()

end event

type rb_1 from radiobutton within w_dwstyle_nup
integer x = 73
integer y = 136
integer width = 457
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "N-Up Example 1"
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
Parent.Event ue_changestyle("nup_1")

end event

type dw_1 from datawindow within w_dwstyle_nup
integer x = 37
integer y = 280
integer width = 2976
integer height = 1296
integer taborder = 30
string title = "none"
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

type gb_1 from groupbox within w_dwstyle_nup
integer x = 41
integer y = 64
integer width = 2976
integer height = 196
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

