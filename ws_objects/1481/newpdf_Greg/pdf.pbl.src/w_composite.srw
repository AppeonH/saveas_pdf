$PBExportHeader$w_composite.srw
forward
global type w_composite from window
end type
type cb_14 from commandbutton within w_composite
end type
type cb_3 from commandbutton within w_composite
end type
type cb_2 from commandbutton within w_composite
end type
type cb_1 from commandbutton within w_composite
end type
type dw_1 from datawindow within w_composite
end type
end forward

global type w_composite from window
integer width = 3959
integer height = 2196
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_14 cb_14
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_composite w_composite

on w_composite.create
this.cb_14=create cb_14
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_14,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_composite.destroy
destroy(this.cb_14)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event resize;dw_1.Height = newheight - 50
dw_1.width = NewWidth - cb_1.x - cb_1.width - 50

end event

type cb_14 from commandbutton within w_composite
integer x = 37
integer y = 836
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF"
end type

event clicked;OpenWithparm( w_newfeature,dw_1)
end event

type cb_3 from commandbutton within w_composite
integer y = 224
integer width = 649
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "save as NativePDF"
end type

event clicked;//dw_1.saveas()
//dw_1.Print( /*long j*/, /*integer x*/, /*integer y*/, /*integer w*/, /*integer h */)

Double	ldb_Job
Integer	li_Return
//PrintSetup ()
//ldb_Job = PrintOpen()
////li_Return	=	dw_1.Print ( ldb_Job, 1, 1  )
////Messagebox ("",li_Return)
////PrintClose ( ldb_Job )
//
//li_Return=PrintDataWindow ( ldb_Job, dw_1 )
//Messagebox ("",li_Return)
//PrintClose ( ldb_Job )

dw_1.Object.DataWindow.Export.PDF.Method = NativePDF!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=0
dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = True
dw_1.saveas()
end event

type cb_2 from commandbutton within w_composite
integer y = 584
integer width = 681
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "save as Ghostscript"
end type

event clicked;//dw_1.saveas()
//dw_1.Print( /*long j*/, /*integer x*/, /*integer y*/, /*integer w*/, /*integer h */)

Double	ldb_Job
Integer	li_Return
//PrintSetup ()
//ldb_Job = PrintOpen()
////li_Return	=	dw_1.Print ( ldb_Job, 1, 1  )
////Messagebox ("",li_Return)
////PrintClose ( ldb_Job )
//
//li_Return=PrintDataWindow ( ldb_Job, dw_1 )
//Messagebox ("",li_Return)
//PrintClose ( ldb_Job )

//dw_1.Object.DataWindow.Export.PDF.Method = NativePDF!
//dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=0


dw_1.object.datawindow.export.pdf.method = distill!
dw_1.object.datawindow.printer = "Ghostscript PDF"
dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

dw_1.saveas()
end event

type cb_1 from commandbutton within w_composite
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "save as"
end type

event clicked;//dw_1.saveas()
//dw_1.Print( /*long j*/, /*integer x*/, /*integer y*/, /*integer w*/, /*integer h */)

Double	ldb_Job
Integer	li_Return
//PrintSetup ()
//ldb_Job = PrintOpen()
////li_Return	=	dw_1.Print ( ldb_Job, 1, 1  )
////Messagebox ("",li_Return)
////PrintClose ( ldb_Job )
//
//li_Return=PrintDataWindow ( ldb_Job, dw_1 )
//Messagebox ("",li_Return)
//PrintClose ( ldb_Job )

//dw_1.Object.DataWindow.Export.PDF.Method = NativePDF!
//dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=0

dw_1.saveas()
end event

type dw_1 from datawindow within w_composite
integer x = 512
integer width = 3072
integer height = 1864
integer taborder = 10
string title = "none"
string dataobject = "d_sper_fir_reconciliation_report"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;This.SetTransObject(SQLCA)
//This.Retrieve()
end event

