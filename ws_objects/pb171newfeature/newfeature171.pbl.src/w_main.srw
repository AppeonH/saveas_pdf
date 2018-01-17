$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type dw_2 from datawindow within w_main
end type
type cb_4 from commandbutton within w_main
end type
type cb_3 from commandbutton within w_main
end type
type st_5 from statictext within w_main
end type
type st_4 from statictext within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
type ddlb_2 from dropdownlistbox within w_main
end type
type ddlb_3 from dropdownlistbox within w_main
end type
type st_3 from statictext within w_main
end type
type st_2 from statictext within w_main
end type
type cbx_1 from checkbox within w_main
end type
type st_1 from statictext within w_main
end type
type ddlb_1 from dropdownlistbox within w_main
end type
type dw_1 from datawindow within w_main
end type
end forward

global type w_main from window
integer width = 3433
integer height = 1936
boolean titlebar = true
string title = "PB171PDF New feature"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_2 dw_2
cb_4 cb_4
cb_3 cb_3
st_5 st_5
st_4 st_4
cb_2 cb_2
cb_1 cb_1
ddlb_2 ddlb_2
ddlb_3 ddlb_3
st_3 st_3
st_2 st_2
cbx_1 cbx_1
st_1 st_1
ddlb_1 ddlb_1
dw_1 dw_1
end type
global w_main w_main

type variables

end variables

on w_main.create
this.dw_2=create dw_2
this.cb_4=create cb_4
this.cb_3=create cb_3
this.st_5=create st_5
this.st_4=create st_4
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ddlb_2=create ddlb_2
this.ddlb_3=create ddlb_3
this.st_3=create st_3
this.st_2=create st_2
this.cbx_1=create cbx_1
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.dw_1=create dw_1
this.Control[]={this.dw_2,&
this.cb_4,&
this.cb_3,&
this.st_5,&
this.st_4,&
this.cb_2,&
this.cb_1,&
this.ddlb_2,&
this.ddlb_3,&
this.st_3,&
this.st_2,&
this.cbx_1,&
this.st_1,&
this.ddlb_1,&
this.dw_1}
end on

on w_main.destroy
destroy(this.dw_2)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ddlb_2)
destroy(this.ddlb_3)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.dw_1)
end on

event open;
ddlb_1.selectitem( 1)
ddlb_2.selectitem( 1)
ddlb_3.selectitem( 1)





end event

type dw_2 from datawindow within w_main
boolean visible = false
integer x = 1856
integer y = 1592
integer width = 567
integer height = 212
integer taborder = 40
string title = "none"
string dataobject = "d_test_pdf_banben"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_main
boolean visible = false
integer x = 2478
integer y = 1660
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;// Profile PB Demo DB V2017
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017;UID=dba;PWD=sql'"

connect;

dw_2.SetTransObject ( SQLCA )
dw_2.Retrieve()

dw_2.Modify("DataWindow.Export.PDF.Method = NativePDF!")

dw_2.Saveas('', pdf!, TRUE)
end event

type cb_3 from commandbutton within w_main
integer x = 2519
integer y = 1112
integer width = 841
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Setting2(object.propert=value)"
end type

event clicked;long 	ls_set1, ls_set2, ls_set3

string 	ls_set11, ls_set22, ls_set33,ls_set44

string 	ls_ret

dw_1.Modify("DataWindow.Export.PDF.Method = NativePDF!")
choose case ddlb_1.text
	case 'None(0)'
		ls_set1 = 0
	case 'PDF/A-1a(1)'
		ls_set1 = 1
	case 'PDF/A-1b(2)'
		ls_set1 = 2
	case 'PDF/A-3a(3)'
		ls_set1 = 3
	case 'PDF/A-3b(4)'
		ls_set1 = 4
	case 'PDF/A-3u(5)'
		ls_set1 = 5
	case else
		ls_set1 = 0
End choose

dw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard =ls_set1

if cbx_1.checked Then
	dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = true
	//dw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = yes" )
Else
	dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = false
	//dw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = no")
	choose case ddlb_2.text
		case 'Default (0)'
			ls_set2 = 0
		case 'A1 540 x 841 mm (1)'
			ls_set2 = 1
		case 'A2 420 x 594 mm (2)'
			ls_set2 = 2
		case 'A3 297 x 420 mm (3)'
			ls_set2 = 3
		case 'A4 210 x 297 mm (4)'
			ls_set2 = 4
		case 'letter 8 1/2 x 11 in (5)'
			ls_set2 = 5
		case 'Legal 8 1/2 x 14 in (6)'
			ls_set2 = 6
		case else
			ls_set2 = 0
	End choose

	dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize = ls_set2
	
	choose case ddlb_3.text
		case 'Default (0)'
			ls_set3 = 0
		case 'Landscape (1)'
			ls_set3 = 1
		case 'Portrait (2)'
			ls_set3 = 2		
		case else
			ls_set3 = 0
	End choose
	dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = ls_set3
 	
End If

ls_set11 = dw_1.describe( "DataWindow.Export.PDF.NativePDF.PDFStandard")
ls_set22 = dw_1.describe( "DataWindow.Export.PDF.NativePDF.UsePrintSpec")
If cbx_1.Checked Then
	ls_set33 = dw_1.describe( "DataWindow.Print.Paper.Size")
	ls_set44 = dw_1.describe( "DataWindow.Print.Orientation")
Else	
	ls_set33 = dw_1.describe( "DataWindow.Export.PDF.NativePDF.CustomSize")
	ls_set44 = dw_1.describe( "DataWindow.Export.PDF.NativePDF.CustomOrientation")
End If

MessageBox ( "Tip", "PDFStandard:" + ls_set11 + "~r~n" + "UsePrintSpec:" + ls_set22 + "~r~n" + "CustomSize:" + ls_set33 + "~r~n" + "CustomOrientation:" + ls_set44 )


//dw_1.Saveas('', pdf!, TRUE)



end event

type st_5 from statictext within w_main
boolean visible = false
integer x = 50
integer y = 1580
integer width = 969
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Print Paper Size:10x14 in(16)"
boolean focusrectangle = false
end type

type st_4 from statictext within w_main
boolean visible = false
integer x = 50
integer y = 1668
integer width = 1006
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Print Orientation:Landscape(1)"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_main
integer x = 1687
integer y = 1112
integer width = 567
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "describe setting"
end type

event clicked;string ls_set11, ls_set22,ls_set33,ls_set44

ls_set11 = dw_1.describe( "DataWindow.Export.PDF.NativePDF.PDFStandard")
ls_set22 = dw_1.describe( "DataWindow.Export.PDF.NativePDF.UsePrintSpec")
If cbx_1.Checked Then
	ls_set33 = dw_1.describe( "DataWindow.Print.Paper.Size")
	ls_set44 = dw_1.describe( "DataWindow.Print.Orientation")
Else	
	ls_set33 = dw_1.describe( "DataWindow.Export.PDF.NativePDF.CustomSize")
	ls_set44 = dw_1.describe( "DataWindow.Export.PDF.NativePDF.CustomOrientation")
End If
MessageBox ( "Tip", "PDFStandard:" + ls_set11 + "~r~n" + "UsePrintSpec:" + ls_set22 + "~r~n" + "CustomSize:" + ls_set33 + "~r~n" + "CustomOrientation:" + ls_set44 )

end event

type cb_1 from commandbutton within w_main
integer x = 1687
integer y = 1284
integer width = 567
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save NativePDF"
end type

event clicked;string 	ls_set1, ls_set2, ls_set3

string 	ls_set11, ls_set22, ls_set33,ls_set44

string 	ls_ret

dw_1.Modify("DataWindow.Export.PDF.Method = NativePDF!")


dw_1.Saveas('', pdf!, TRUE)



end event

type ddlb_2 from dropdownlistbox within w_main
integer x = 549
integer y = 1312
integer width = 795
integer height = 752
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Default (0)","A1 540 x 841 mm (1)","A2 420 x 594 mm (2)","A3 297 x 420 mm (3)","A4 210 x 297 mm (4)","letter 8 1/2 x 11 in (5)","Legal 8 1/2 x 14 in (6)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_set2, ls_ret

choose case ddlb_2.text
	case 'Default (0)'
		ls_set2 = '0'
	case 'A1 540 x 841 mm (1)'
		ls_set2 = '1'
	case 'A2 420 x 594 mm (2)'
		ls_set2 = '2'
	case 'A3 297 x 420 mm (3)'
		ls_set2 = '3'
	case 'A4 210 x 297 mm (4)'
		ls_set2 = '4'
	case 'letter 8 1/2 x 11 in (5)'
		ls_set2 = '5'
	case 'Legal 8 1/2 x 14 in (6)'
		ls_set2 = '6'
	case else
		ls_set2 = '0'
End choose

ls_ret = dw_1.Modify("DataWindow.Export.PDF.NativePDF.CustomSize = " + ls_set2  )
if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If
end event

type ddlb_3 from dropdownlistbox within w_main
integer x = 549
integer y = 1452
integer width = 791
integer height = 476
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Default (0)","Landscape (1)","Portrait (2)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_set3, ls_ret

choose case ddlb_3.text
	case 'Default (0)'
		ls_set3 = '0'
	case 'Landscape (1)'
		ls_set3 = '1'
	case 'Portrait (2)'
		ls_set3 = '2'		
	case else
		ls_set3 = '0'
End choose
ls_ret = dw_1.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation = " + ls_set3  )
if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If
end event

type st_3 from statictext within w_main
integer x = 50
integer y = 1460
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Orientation"
boolean focusrectangle = false
end type

type st_2 from statictext within w_main
integer x = 50
integer y = 1320
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Paper Size"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_main
integer x = 50
integer y = 1200
integer width = 1207
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use Settings in Print Specifications"
end type

event clicked;
If checked Then
	ddlb_2.enabled = false
	ddlb_3.enabled = false
	st_5.visible = true
	st_4.visible = true
	dw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = yes" )
Else
	ddlb_2.enabled = true
	ddlb_3.enabled = true
	st_5.visible = false
	st_4.visible = false
	dw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = no")
End If


end event

type st_1 from statictext within w_main
integer x = 50
integer y = 1092
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PDFStandard"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_main
integer x = 549
integer y = 1080
integer width = 549
integer height = 576
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"None(0)","PDF/A-1a(1)","PDF/A-1b(2)","PDF/A-3a(3)","PDF/A-3b(4)","PDF/A-3u(5)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
string ls_set1,ls_ret

choose case ddlb_1.text
	case 'None(0)'
		ls_set1 = '0'
	case 'PDF/A-1a(1)'
		ls_set1 = '1'
	case 'PDF/A-1b(2)'
		ls_set1 = '2'
	case 'PDF/A-3a(3)'
		ls_set1 = '3'
	case 'PDF/A-3b(4)'
		ls_set1 = '4'
	case 'PDF/A-3u(5)'
		ls_set1 = '5'
	case else
		ls_set1 = '0'
End choose

ls_ret = dw_1.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard = " + ls_set1  )
if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If
end event

type dw_1 from datawindow within w_main
integer x = 59
integer y = 12
integer width = 3269
integer height = 1064
integer taborder = 10
string title = "none"
string dataobject = "d_test"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

