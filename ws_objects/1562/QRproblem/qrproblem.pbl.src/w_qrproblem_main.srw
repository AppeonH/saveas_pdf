$PBExportHeader$w_qrproblem_main.srw
$PBExportComments$Generated SDI Main Window
forward
global type w_qrproblem_main from window
end type
type cb_4 from commandbutton within w_qrproblem_main
end type
type dw from datawindow within w_qrproblem_main
end type
end forward

global type w_qrproblem_main from window
integer width = 4251
integer height = 2292
boolean titlebar = true
string title = "Main Window"
string menuname = "m_qrproblem_main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79416533
boolean center = true
cb_4 cb_4
dw dw
end type
global w_qrproblem_main w_qrproblem_main

on w_qrproblem_main.create
if this.MenuName = "m_qrproblem_main" then this.MenuID = create m_qrproblem_main
this.cb_4=create cb_4
this.dw=create dw
this.Control[]={this.cb_4,&
this.dw}
end on

on w_qrproblem_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_4)
destroy(this.dw)
end on

event open;dw.SetItem(dw.InsertRow(0),'qrcode', '2005G0805KD9NJ01JL6A1D2DR3GGKOR35MRSIQ027C32DEV1KULCJ4UOQHG652F1U2KP1ICSO0K9BI55T9Q5070FPV8OO29071UOJUE0K5GDIBD4QQ6MN3A6DTJ1CIPUQC0VR6V1RLAD6B3RPJT86EV7IRHUMHOHUH0HEAH1D0G7PTOHEUKBHQ7EJVE6GIIVG6JCFMEQ816N5128EF2N5JP2GR4SCB8FSK0T2OMALS0NT69JQ34TSLL4JIBM9VAOGR8C0RIHRU3LG3N5C8H3C91DCM5GG4LCVRFUJHCP5IDJ6GQDF33K0TN5T6NOPFBF5UEMH7OF3JG9TK0FMLNUAC373B7DFAAQFA2T26C34CKHN44LI90KAVUN3IEHTAH10NLKE6CTS73V2GMOKM800')

end event

type cb_4 from commandbutton within w_qrproblem_main
integer x = 247
integer y = 1456
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

event clicked;
OpenWithparm( w_newfeature,dw)
end event

type dw from datawindow within w_qrproblem_main
integer width = 4078
integer height = 1984
integer taborder = 10
string title = "none"
string dataobject = "dw_main"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;If dwo.name='b_pdfnative' Then
	dw.Object.DataWindow.Export.PDF.Method = NativePDF!
	dw.Object.DataWindow.Export.PDF.NativePDF.CustomSize=0
	this.SaveAs("native.pdf", PDF!, True)
ElseIf dwo.name='b_pdfdistill' Then
	dw.Object.DataWindow.Export.PDF.Method = Distill!
	dw.Object.DataWindow.Export.PDF.NativePDF.CustomSize=0
	this.SaveAs("distill.pdf", PDF!, True)
End if
end event

