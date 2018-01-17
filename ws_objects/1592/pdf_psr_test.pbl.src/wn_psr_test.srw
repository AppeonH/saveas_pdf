$PBExportHeader$wn_psr_test.srw
forward
global type wn_psr_test from window
end type
type cb_1 from commandbutton within wn_psr_test
end type
type cb_pdf from commandbutton within wn_psr_test
end type
type dc_data from datawindow within wn_psr_test
end type
end forward

global type wn_psr_test from window
integer width = 4754
integer height = 1980
boolean titlebar = true
string title = "PDF / PSR Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
cb_pdf cb_pdf
dc_data dc_data
end type
global wn_psr_test wn_psr_test

on wn_psr_test.create
this.cb_1=create cb_1
this.cb_pdf=create cb_pdf
this.dc_data=create dc_data
this.Control[]={this.cb_1,&
this.cb_pdf,&
this.dc_data}
end on

on wn_psr_test.destroy
destroy(this.cb_1)
destroy(this.cb_pdf)
destroy(this.dc_data)
end on

type cb_1 from commandbutton within wn_psr_test
integer x = 777
integer y = 1508
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF"
end type

event clicked;OpenWithparm( w_newfeature,dc_data)
end event

type cb_pdf from commandbutton within wn_psr_test
integer x = 91
integer y = 1512
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "PDF"
end type

event clicked;Integer  	li_rtn
String    	ls_file_name = "CIPTEST.pdf"
String		ls_rc

//ls_rc	=	dc_data.Modify("DataWindow.Export.PDF.Method = Distill!")			// Works OK!
ls_rc	=	dc_data.Modify("DataWindow.Export.PDF.Method = NativePDF!")		// Does NOT work.

li_rtn 	=	dc_data.saveas ( ls_file_name, PDF!, FALSE)

//int li_ret
//dc_data.Object.DataWindow.Export.PDF.Method = NativePDF!
//dc_data.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=2
//
//li_ret = dc_data.SaveAs("custom.pdf", PDF!, true)


Beep (1)

messagebox("li_rtn",string(li_rtn))
end event

type dc_data from datawindow within wn_psr_test
integer width = 4640
integer height = 1320
integer taborder = 10
string title = "none"
string dataobject = "fustatus.psr"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

