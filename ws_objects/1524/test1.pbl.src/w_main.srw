$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_4 from commandbutton within w_main
end type
type cb_3 from commandbutton within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cbx_1 from checkbox within w_main
end type
type cb_1 from commandbutton within w_main
end type
type dw_1 from datawindow within w_main
end type
end forward

global type w_main from window
integer width = 3662
integer height = 2036
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cbx_1 cbx_1
cb_1 cb_1
dw_1 dw_1
end type
global w_main w_main

type prototypes
Function Long AddFontResourceW(String lpFile) Library "gdi32.dll"
Function Long RemoveFontResourceW(String lpFile) Library "gdi32.dll"

end prototypes

type variables
String		is_font
end variables

on w_main.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cbx_1,&
this.cb_1,&
this.dw_1}
end on

on w_main.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;is_font = "C39P36HR.TTF"
AddFontResourceW(is_font)

end event

event close;RemoveFontResourceW(is_font)

end event

type cb_4 from commandbutton within w_main
integer x = 2414
integer y = 780
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
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

type cb_3 from commandbutton within w_main
integer x = 1938
integer y = 776
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "print"
end type

event clicked;dw_1.Print()
end event

type cb_2 from commandbutton within w_main
integer x = 1431
integer y = 784
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "printSetup"
end type

event clicked;printsetup()
end event

type cbx_1 from checkbox within w_main
integer x = 439
integer y = 784
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Native"
end type

type cb_1 from commandbutton within w_main
integer x = 914
integer y = 772
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;if cbx_1.Checked = true Then
	dw_1.object.datawindow.export.pdf.method = nativepdf!
Else
	dw_1.object.datawindow.export.pdf.method = distill!
End IF

dw_1.saveas("", pdf!, True)
end event

type dw_1 from datawindow within w_main
integer x = 347
integer y = 256
integer width = 2482
integer height = 468
integer taborder = 10
string title = "none"
string dataobject = "d_testa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

