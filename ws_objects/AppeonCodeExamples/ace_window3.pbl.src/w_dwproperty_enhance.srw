$PBExportHeader$w_dwproperty_enhance.srw
$PBExportComments$DataWindow Enhance property
forward
global type w_dwproperty_enhance from window
end type
type st_1 from statictext within w_dwproperty_enhance
end type
type cb_save from commandbutton within w_dwproperty_enhance
end type
type cb_print from commandbutton within w_dwproperty_enhance
end type
type cb_close from commandbutton within w_dwproperty_enhance
end type
type cb_refresh from commandbutton within w_dwproperty_enhance
end type
type dw_1 from datawindow within w_dwproperty_enhance
end type
type gb_1 from groupbox within w_dwproperty_enhance
end type
end forward

global type w_dwproperty_enhance from window
integer width = 3209
integer height = 2116
boolean titlebar = true
string title = "Enhanced DataWindow Object Properties"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_save cb_save
cb_print cb_print
cb_close cb_close
cb_refresh cb_refresh
dw_1 dw_1
gb_1 gb_1
end type
global w_dwproperty_enhance w_dwproperty_enhance

on w_dwproperty_enhance.create
this.st_1=create st_1
this.cb_save=create cb_save
this.cb_print=create cb_print
this.cb_close=create cb_close
this.cb_refresh=create cb_refresh
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.cb_save,&
this.cb_print,&
this.cb_close,&
this.cb_refresh,&
this.dw_1,&
this.gb_1}
end on

on w_dwproperty_enhance.destroy
destroy(this.st_1)
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

dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()
end event

type st_1 from statictext within w_dwproperty_enhance
integer x = 101
integer y = 84
integer width = 1417
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tip:Use DataWindows Property of Sparse, SlideUp and SlideLeft."
boolean focusrectangle = false
end type

type cb_save from commandbutton within w_dwproperty_enhance
integer x = 2286
integer y = 68
integer width = 320
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "SaveAs..."
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

type cb_print from commandbutton within w_dwproperty_enhance
integer x = 1929
integer y = 68
integer width = 320
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print.."
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
OpenWithParm(w_dw_print_options, dw_1)

If Message.DoubleParm = -1 Then Return
dw_1.Print(True)


end event

type cb_close from commandbutton within w_dwproperty_enhance
integer x = 2642
integer y = 68
integer width = 320
integer height = 92
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

type cb_refresh from commandbutton within w_dwproperty_enhance
integer x = 1573
integer y = 68
integer width = 320
integer height = 92
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

type dw_1 from datawindow within w_dwproperty_enhance
integer x = 32
integer y = 212
integer width = 3099
integer height = 1740
integer taborder = 30
string title = "none"
string dataobject = "d_dwstyle_composite2"
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

type gb_1 from groupbox within w_dwproperty_enhance
integer x = 32
integer y = 12
integer width = 2976
integer height = 180
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

