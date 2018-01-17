$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_5 from commandbutton within w_main
end type
type cbx_1 from checkbox within w_main
end type
type rb_2 from radiobutton within w_main
end type
type rb_1 from radiobutton within w_main
end type
type cb_4 from commandbutton within w_main
end type
type cb_3 from commandbutton within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
type dw_1 from datawindow within w_main
end type
type gb_1 from groupbox within w_main
end type
end forward

global type w_main from window
integer width = 3717
integer height = 1988
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_5 cb_5
cbx_1 cbx_1
rb_2 rb_2
rb_1 rb_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_main w_main

on w_main.create
this.cb_5=create cb_5
this.cbx_1=create cbx_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_5,&
this.cbx_1,&
this.rb_2,&
this.rb_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_main.destroy
destroy(this.cb_5)
destroy(this.cbx_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type cb_5 from commandbutton within w_main
integer x = 55
integer y = 416
integer width = 357
integer height = 120
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF"
end type

event clicked;
OpenWithparm( w_newfeature,dw_1)
end event

type cbx_1 from checkbox within w_main
integer x = 2853
integer y = 72
integer width = 558
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Orientation(V)"
end type

type rb_2 from radiobutton within w_main
integer x = 2208
integer y = 100
integer width = 475
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "8.26 * 11.7"
end type

event clicked;
dw_1.DataObject = "d_a4_826_1170"
rb_1.Checked = false
end event

type rb_1 from radiobutton within w_main
integer x = 1531
integer y = 100
integer width = 457
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "8.5 * 11"
boolean checked = true
end type

event clicked;dw_1.DataObject = "d_a4_850_1100"
rb_2.Checked = false
end event

type cb_4 from commandbutton within w_main
integer x = 503
integer y = 36
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "distillPDF"
end type

event clicked;dw_1.object.datawindow.export.pdf.method = distill!
if(cbx_1.checked = true) Then
	dw_1.Object.DataWindow.Print.Orientation=1
Else
	dw_1.Object.DataWindow.Print.Orientation=0
End If
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

dw_1.saveas()
end event

type cb_3 from commandbutton within w_main
integer x = 59
integer y = 156
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "printsetup"
end type

event clicked;printsetup()
end event

type cb_2 from commandbutton within w_main
integer x = 59
integer y = 272
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "print"
end type

event clicked;//dw_1.object.datawindow.export.pdf.method = distill!
////dw_1.object.datawindow.printer = "Ghostscript PDF"
////dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

//dw_1.saveas()

dw_1.print()
end event

type cb_1 from commandbutton within w_main
integer x = 59
integer y = 40
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "nativePDF"
end type

event clicked;dw_1.object.datawindow.export.pdf.method =nativepdf!
if(cbx_1.checked = true) Then
	dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
Else
	dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=0
End If
//dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
dw_1.saveas()
end event

type dw_1 from datawindow within w_main
integer x = 425
integer y = 240
integer width = 3182
integer height = 1628
integer taborder = 10
string title = "none"
string dataobject = "d_a4_850_1100"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_main
integer x = 1312
integer y = 40
integer width = 1399
integer height = 184
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Size(in)"
end type

