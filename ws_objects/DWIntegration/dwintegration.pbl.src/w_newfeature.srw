$PBExportHeader$w_newfeature.srw
forward
global type w_newfeature from window
end type
type cbx_3 from checkbox within w_newfeature
end type
type cbx_2 from checkbox within w_newfeature
end type
type st_6 from statictext within w_newfeature
end type
type ddlb_6 from dropdownlistbox within w_newfeature
end type
type st_5 from statictext within w_newfeature
end type
type st_4 from statictext within w_newfeature
end type
type ddlb_5 from dropdownlistbox within w_newfeature
end type
type ddlb_4 from dropdownlistbox within w_newfeature
end type
type cb_4 from commandbutton within w_newfeature
end type
type cb_3 from commandbutton within w_newfeature
end type
type cb_2 from commandbutton within w_newfeature
end type
type cb_1 from commandbutton within w_newfeature
end type
type ddlb_2 from dropdownlistbox within w_newfeature
end type
type ddlb_3 from dropdownlistbox within w_newfeature
end type
type st_3 from statictext within w_newfeature
end type
type st_2 from statictext within w_newfeature
end type
type cbx_1 from checkbox within w_newfeature
end type
type st_1 from statictext within w_newfeature
end type
type ddlb_1 from dropdownlistbox within w_newfeature
end type
end forward

shared variables
DataWindow 	sdw_1
end variables

global type w_newfeature from window
integer width = 2071
integer height = 996
boolean titlebar = true
string title = "PB171 PDF New Feature"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_3 cbx_3
cbx_2 cbx_2
st_6 st_6
ddlb_6 ddlb_6
st_5 st_5
st_4 st_4
ddlb_5 ddlb_5
ddlb_4 ddlb_4
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
ddlb_2 ddlb_2
ddlb_3 ddlb_3
st_3 st_3
st_2 st_2
cbx_1 cbx_1
st_1 st_1
ddlb_1 ddlb_1
end type
global w_newfeature w_newfeature

type variables

end variables

on w_newfeature.create
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.st_6=create st_6
this.ddlb_6=create ddlb_6
this.st_5=create st_5
this.st_4=create st_4
this.ddlb_5=create ddlb_5
this.ddlb_4=create ddlb_4
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ddlb_2=create ddlb_2
this.ddlb_3=create ddlb_3
this.st_3=create st_3
this.st_2=create st_2
this.cbx_1=create cbx_1
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.Control[]={this.cbx_3,&
this.cbx_2,&
this.st_6,&
this.ddlb_6,&
this.st_5,&
this.st_4,&
this.ddlb_5,&
this.ddlb_4,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.ddlb_2,&
this.ddlb_3,&
this.st_3,&
this.st_2,&
this.cbx_1,&
this.st_1,&
this.ddlb_1}
end on

on w_newfeature.destroy
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.st_6)
destroy(this.ddlb_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.ddlb_5)
destroy(this.ddlb_4)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ddlb_2)
destroy(this.ddlb_3)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.ddlb_1)
end on

event open;

sdw_1 = message.powerobjectparm

 

ddlb_1.selectitem( 1)
ddlb_2.selectitem( 1)
ddlb_3.selectitem( 1)
ddlb_4.selectitem( 1)
ddlb_5.selectitem( 1)
ddlb_6.selectitem( 1)





end event

type cbx_3 from checkbox within w_newfeature
integer x = 1106
integer y = 152
integer width = 229
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "2"
end type

event clicked;If cbx_3.checked Then
	ddlb_2.enabled = false
	ddlb_3.enabled = false
	st_5.visible = true
	st_4.visible = true
	ddlb_4.visible = true
	ddlb_5.visible = true
	sdw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = 0" )
Else
	ddlb_2.enabled = true
	ddlb_3.enabled = true
	st_5.visible = false
	st_4.visible = false
	ddlb_4.visible = false
	ddlb_5.visible = false
	sdw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = 1")
End If

end event

type cbx_2 from checkbox within w_newfeature
integer x = 1042
integer y = 1388
integer width = 293
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "2"
end type

event clicked;If cbx_2.checked Then
	ddlb_2.enabled = false
	ddlb_3.enabled = false
	st_5.visible = true
	st_4.visible = true
	ddlb_4.visible = true
	ddlb_5.visible = true
	sdw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = 0" )
Else
	ddlb_2.enabled = true
	ddlb_3.enabled = true
	st_5.visible = false
	st_4.visible = false
	ddlb_4.visible = false
	ddlb_5.visible = false
	sdw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = 1")
End If

end event

type st_6 from statictext within w_newfeature
integer x = 41
integer y = 540
integer width = 343
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ImageFormat"
boolean focusrectangle = false
end type

type ddlb_6 from dropdownlistbox within w_newfeature
integer x = 389
integer y = 528
integer width = 571
integer height = 360
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"BMP(0)","JPG(1)","PNG(2)","GIF(3)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_set6,ls_ret
//0:JPG 1：BMP 2：PNG 3：GIF (默认为0：jpg)
choose case ddlb_6.text
	case 'BMP(0)'
		ls_set6 = '0'
	case 'JPG(1)'
		ls_set6 = '1'
	case 'PNG(2)'
		ls_set6 = '2'
	case 'GIF(3)'
		ls_set6 = '3'
case else
		ls_set6 = '0'
End choose

ls_ret = sdw_1.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat = " + ls_set6  )
if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If
end event

type st_5 from statictext within w_newfeature
boolean visible = false
integer x = 41
integer y = 788
integer width = 343
integer height = 80
integer textsize = -9
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

type st_4 from statictext within w_newfeature
boolean visible = false
integer x = 41
integer y = 660
integer width = 343
integer height = 80
integer textsize = -9
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

type ddlb_5 from dropdownlistbox within w_newfeature
boolean visible = false
integer x = 389
integer y = 780
integer width = 951
integer height = 752
integer taborder = 50
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

event selectionchanged;string ls_set5, ls_ret

choose case ddlb_5.text
	case 'Default (0)'
		ls_set5 = '0'
	case 'Landscape (1)'
		ls_set5 = '1'
	case 'Portrait (2)'
		ls_set5 = '2'		
	case else
		ls_set5 = '0'
End choose

ls_ret = sdw_1.Modify("DataWindow.Print.Orientation = " + ls_set5  )

if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If
end event

type ddlb_4 from dropdownlistbox within w_newfeature
boolean visible = false
integer x = 389
integer y = 652
integer width = 951
integer height = 752
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"Default (0)","Letter 8 1/2 x 11 in(1)","Letter Small 8 1/2 x 11 in(2)","Tabloid 11 x 17 in(3)","Ledger 17 x 11 in(4)","Legal 8 1/2 x 14 in(5)","Statement 5 1/2 x 8 1/2 in(6)","Executive 7 1/4 x 10 1/2 in(7)","A3 297 x 420 mm(8)","A4 210 x 297 mm(9)","A4 Small 210 x 297 mm(10)","A5 148 x 210 mm(11)","B4 250 x 354 mm(12)","B5 182 x 257 mm(13)","Folio 8 1/2 x 13 in(14)","Quarto 215 x 275 mm (15)","10 x 14 in(16)","11 x 17 in(17)","Note 8 1/2 x 11 in(18)","Envelop #9 3 7/8 x 7/8(19)","Envelop #10 4 1/8 x 9 1/2(20)","Envelop #11 4 1/2 x 10 3/8(21)","Envelop #12 4 x 11(22)","Envelop #14 5 x 11 1/2(23)","C size sheet(24)","D size sheet(25)","E size sheet(26)","Envelope DL 110 x 220 mm(27)","Envelope C5 162 x 229 mm(28)","Envelope C3 324 x 458 mm(29)","Envelope C4 229 x 324 mm(30)","Envelope C6 114 x 162 mm(31)","Envelope C65 114 x 229 mm(32)","Envelope B4 250 x 353 mm(33) ","Envelope B5 176 x 250 mm(34)","Envelope B6 176 x 125 mm(35)","Envelope 110 x230 mm(36)","Envelope Monarch 3.875 x 7.5 in(37)","6 3/4 Envelope 3 5/8 x 6 1/2 in(38)","US Std Fanfold 14 7/8 x 11 in(39)","German Std Fanfold 8 1/2 x 12 in(40)","German Legal Fanfold 8 1/2 x 13 in(41)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_set4, ls_ret

choose case ddlb_4.text
	case 'Default (0)'
		ls_set4 = '0'
	case 'Letter 8 1/2 x 11 in(1)'
		ls_set4 = '1'
	case 'Letter Small 8 1/2 x 11 in(2)'
		ls_set4 = '2'	
	case 'Tabloid 11 x 17 in(3)'
		ls_set4 = '3'
	case 'Ledger 17 x 11 in(4)'
		ls_set4 = '4'
	case 'Legal 8 1/2 x 14 in(5)' 
		ls_set4 = '5'	
	case 'Statement 5 1/2 x 8 1/2 in(6)'
		ls_set4 = '6'
	case 	'Executive 7 1/4 x 10 1/2 in(7)'
		ls_set4 = '7'
	case 'A3 297 x 420 mm(8)' 
		ls_set4 = '8'	
	case 'A4 210 x 297 mm(9)'
		ls_set4 = '9'
	case 	'A4 Small 210 x 297 mm(10)'
		ls_set4 = '10'
	case 'A5 148 x 210 mm(11)' 
		ls_set4 = '11'	
	case 'B4 250 x 354 mm(12)'
		ls_set4 = '12'
	case 	'B5 182 x 257 mm(13)'
		ls_set4 = '13'
	case 'B5 182 x 257 mm(13)'
		ls_set4 = '14'
	case 'Quarto 215 x 275 mm (15)' 
		ls_set4 = '15'	
	case '10 x 14 in(16)'
		ls_set4 = '16'
	case 	'11 x 17 in(17)'
		ls_set4 = '17'
	case 'Note 8 1/2 x 11 in(18)' 
		ls_set4 = '18'	
	case 'Envelop #9 3 7/8 x 7/8(19)'
		ls_set4 = '19'
	case 	'Envelop #10 4 1/8 x 9 1/2(20)'
		ls_set4 = '20'
	case 'Envelop #11 4 1/2 x 10 3/8(21)' 
		ls_set4 = '21'	
	case 'Envelop #12 4 x 11(22)'
		ls_set4 = '22'
	case 	'Envelop #14 5 x 11 1/2(23)'
		ls_set4 = '23'
			case 'C size sheet(24)'
		ls_set4 = '24'
	case 'D size sheet(25)' 
		ls_set4 = '25'	
	case 'E size sheet(26)'
		ls_set4 = '26'
	case 	'Envelope DL 110 x 220 mm(27)'
		ls_set4 = '27'
	case 'Envelope C5 162 x 229 mm(28)' 
		ls_set4 = '28'	
	case 'Envelope C3 324 x 458 mm(29)'
		ls_set4 = '29'
	case 	'Envelope C4 229 x 324 mm(30)'
		ls_set4 = '30'
    case 'Envelope C6 114 x 162 mm(31)' 
		ls_set4 = '31'	
	case 'Envelope C65 114 x 229 mm(32)'
		ls_set4 = '32'
	case 	'Envelope B4 250 x 353 mm(33) '
		ls_set4 = '33'
	case 'Envelope B5 176 x 250 mm(34)'
		ls_set4 = '34'
	case 'Envelope B6 176 x 125 mm(35)' 
		ls_set4 = '35'	
	case 'Envelope 110 x230 mm(36)'
		ls_set4 = '36'
	case 	'Envelope Monarch 3.875 x 7.5 in(37)'
		ls_set4 = '37'
	case '6 3/4 Envelope 3 5/8 x 6 1/2 in(38)' 
		ls_set4 = '38'	
	case 'US Std Fanfold 14 7/8 x 11 in(39)'
		ls_set4 = '39'
	case 	'German Std Fanfold 8 1/2 x 12 in(40)'
		ls_set4 = '40'
	case 	'German Legal Fanfold 8 1/2 x 13 in(41)'
		ls_set4 = '41'
	case else
		ls_set4 = '0'
End choose

ls_ret = sdw_1.Modify("DataWindow.Print.Paper.Size = " + ls_set4  )

if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If
end event

type cb_4 from commandbutton within w_newfeature
integer x = 1403
integer y = 280
integer width = 613
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ghostscript PDF"
end type

event clicked;
sdw_1.object.datawindow.export.pdf.method = distill!
sdw_1.object.datawindow.printer = "Ghostscript PDF"
sdw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

sdw_1.Saveas('', pdf!, TRUE)
end event

type cb_3 from commandbutton within w_newfeature
integer x = 1403
integer y = 156
integer width = 613
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Setting 2 dot notation"
end type

event clicked;//Setting 2 (object.propert=value)
long 	ls_set1, ls_set2, ls_set3

string 	ls_set11, ls_set22, ls_set33,ls_set44

string 	ls_ret

sdw_1.Modify("DataWindow.Export.PDF.Method = NativePDF!")
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

sdw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard =ls_set1

if cbx_1.checked Then
	sdw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = true
	//sdw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = yes" )
Else
	sdw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = false
	//sdw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = no")
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

	sdw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize = ls_set2
	
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
	sdw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = ls_set3
 	
End If



//sdw_1 dot notation
ls_set11 = sdw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard
ls_set22 = sdw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec

If cbx_1.Checked Then
	ls_set33 = sdw_1.Object.DataWindow.Print.Paper.Size
	ls_set44 = sdw_1.Object.DataWindow.Print.Orientation
Else	
	ls_set33 = sdw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize
	ls_set44 = sdw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
End If
MessageBox ( "Tip- dw_1", "PDFStandard:" + ls_set11 + "~r~n" + "UsePrintSpec:" + ls_set22 + "~r~n" + "CustomSize:" + ls_set33 + "~r~n" + "CustomOrientation:" + ls_set44 )


//MessageBox ( "Tip", "PDFStandard:" + ls_set11 + "~r~n" + "UsePrintSpec:" + ls_set22 + "~r~n" + "CustomSize:" + ls_set33 + "~r~n" + "CustomOrientation:" + ls_set44 )
//

//sdw_1.Saveas('', pdf!, TRUE)



end event

type cb_2 from commandbutton within w_newfeature
integer x = 1403
integer y = 32
integer width = 613
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = " Setting 1 describe"
end type

event clicked;string ls_set11, ls_set22,ls_set33,ls_set44

ls_set11 = sdw_1.describe( "DataWindow.Export.PDF.NativePDF.PDFStandard")
ls_set22 = sdw_1.describe( "DataWindow.Export.PDF.NativePDF.UsePrintSpec")
If cbx_1.Checked Then
	ls_set33 = sdw_1.describe( "DataWindow.Print.Paper.Size")
	ls_set44 = sdw_1.describe( "DataWindow.Print.Orientation")
Else	
	ls_set33 = sdw_1.describe( "DataWindow.Export.PDF.NativePDF.CustomSize")
	ls_set44 = sdw_1.describe( "DataWindow.Export.PDF.NativePDF.CustomOrientation")
End If
MessageBox ( "Tip", "PDFStandard:" + ls_set11 + "~r~n" + "UsePrintSpec:" + ls_set22 + "~r~n" + "CustomSize:" + ls_set33 + "~r~n" + "CustomOrientation:" + ls_set44 )

end event

type cb_1 from commandbutton within w_newfeature
integer x = 1403
integer y = 408
integer width = 613
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

event clicked;string 	ls_set1, ls_set2, ls_set3,ls_set4,ls_set5

string 	ls_set11, ls_set22, ls_set33,ls_set44,ls_set55

string 	ls_ret


sdw_1.Modify("DataWindow.Export.PDF.Method = NativePDF!")

ls_set11 = sdw_1.describe( "DataWindow.Export.PDF.NativePDF.PDFStandard")
choose case ls_set11
	case 'None'
		ls_set1 = '0'
	case 'PDF/A-1a'
		ls_set1 = '1'
	case 'PDF/A-1b'
		ls_set1 = '2'
	case 'PDF/A-3a'
		ls_set1 = '3'
	case 'PDF/A-3b'
		ls_set1 = '4'
	case 'PDF/A-3u'
		ls_set1 = '5'
	case else
		ls_set1 = '0'
End choose
ls_ret = sdw_1.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard = " + ls_set1  )
if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If

ls_set22 = sdw_1.describe( "DataWindow.Export.PDF.NativePDF.CustomSize")
choose case ls_set22
	case 'Default'
		ls_set2 = '0'
	case 'A1 540 x 841 mm'
		ls_set2 = '1'
	case 'A2 420 x 594 mm'
		ls_set2 = '2'
	case 'A3 297 x 420 mm'
		ls_set2 = '3'
	case 'A4 210 x 297 mm'
		ls_set2 = '4'
	case 'letter 8 1/2 x 11 in'
		ls_set2 = '5'
	case 'Legal 8 1/2 x 14 in'
		ls_set2 = '6'
	case else
		ls_set2 = '0'
End choose
ls_ret = sdw_1.Modify("DataWindow.Export.PDF.NativePDF.CustomSize = " + ls_set2  )
if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If

ls_set33 = sdw_1.describe( "DataWindow.Export.PDF.NativePDF.CustomOrientation")
choose case ls_set33
	case 'Default'
		ls_set3 = '0'
	case 'Landscape'
		ls_set3 = '1'
	case 'Portrait'
		ls_set3 = '2'		
	case else
		ls_set3 = '0'
End choose
ls_ret = sdw_1.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation = " + ls_set3  )
if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If

//ls_set44 = sdw_1.describe( "DataWindow.Print.Paper.Size")
//choose case ls_set44
//	case 'Default'
//		ls_set4 = '0'
//	case 'Letter 8 1/2 x 11 in'
//		ls_set4 = '1'
//	case 'Letter Small 8 1/2 x 11 in'
//		ls_set4 = '2'	
//	case 'Tabloid 11 x 17 in'
//		ls_set4 = '3'
//	case 'Ledger 17 x 11 in'
//		ls_set4 = '4'
//	case 'Legal 8 1/2 x 14 in' 
//		ls_set4 = '5'	
//	case 'Statement 5 1/2 x 8 1/2 in'
//		ls_set4 = '6'
//	case 	'Executive 7 1/4 x 10 1/2 in'
//		ls_set4 = '7'
//	case 'A3 297 x 420 mm' 
//		ls_set4 = '8'	
//	case 'A4 210 x 297 mm'
//		ls_set4 = '9'
//	case 	'A4 Small 210 x 297 mm'
//		ls_set4 = '10'
//	case 'A5 148 x 210 mm' 
//		ls_set4 = '11'	
//	case 'B4 250 x 354 mm'
//		ls_set4 = '12'
//	case 	'B5 182 x 257 mm'
//		ls_set4 = '13'
//	case 'B5 182 x 257 mm'
//		ls_set4 = '14'
//	case 'Quarto 215 x 275 mm ' 
//		ls_set4 = '15'	
//	case '10 x 14 in'
//		ls_set4 = '16'
//	case 	'11 x 17 in'
//		ls_set4 = '17'
//	case 'Note 8 1/2 x 11 in' 
//		ls_set4 = '18'	
//	case 'Envelop #9 3 7/8 x 7/8'
//		ls_set4 = '19'
//	case 	'Envelop #10 4 1/8 x 9 1/2'
//		ls_set4 = '20'
//	case 'Envelop #11 4 1/2 x 10 3/8' 
//		ls_set4 = '21'	
//	case 'Envelop #12 4 x 11'
//		ls_set4 = '22'
//	case 	'Envelop #14 5 x 11 1/2'
//		ls_set4 = '23'
//			case 'C size sheet'
//		ls_set4 = '24'
//	case 'D size sheet' 
//		ls_set4 = '25'	
//	case 'E size sheet'
//		ls_set4 = '26'
//	case 	'Envelope DL 110 x 220 mm'
//		ls_set4 = '27'
//	case 'Envelope C5 162 x 229 mm' 
//		ls_set4 = '28'	
//	case 'Envelope C3 324 x 458 mm'
//		ls_set4 = '29'
//	case 	'Envelope C4 229 x 324 mm'
//		ls_set4 = '30'
//    case 'Envelope C6 114 x 162 mm' 
//		ls_set4 = '31'	
//	case 'Envelope C65 114 x 229 mm'
//		ls_set4 = '32'
//	case 	'Envelope B4 250 x 353 mm '
//		ls_set4 = '33'
//	case 'Envelope B5 176 x 250 mm'
//		ls_set4 = '34'
//	case 'Envelope B6 176 x 125 mm' 
//		ls_set4 = '35'	
//	case 'Envelope 110 x230 mm'
//		ls_set4 = '36'
//	case 	'Envelope Monarch 3.875 x 7.5 in'
//		ls_set4 = '37'
//	case '6 3/4 Envelope 3 5/8 x 6 1/2 in' 
//		ls_set4 = '38'	
//	case 'US Std Fanfold 14 7/8 x 11 in'
//		ls_set4 = '39'
//	case 	'German Std Fanfold 8 1/2 x 12 in'
//		ls_set4 = '40'
//	case 	'German Legal Fanfold 8 1/2 x 13 in'
//		ls_set4 = '41'
//	case else
//		ls_set4 = '0'
//End choose
//ls_ret = sdw_1.Modify("DataWindow.Print.Paper.Size = " + ls_set4  )
//
//if Len ( ls_ret ) > 0 Then
//	MessageBox ( "", ls_ret )
//End If

ls_set55 = sdw_1.describe( "DataWindow.Print.Orientation")
choose case ls_set55
	case 'Default (0)','0'
		ls_set5 = '0'
	case 'Landscape (1)','1'
		ls_set5 = '1'
	case 'Portrait (2)','2'
		ls_set5 = '2'		
	case else
		ls_set5 = '0'
End choose

ls_ret = sdw_1.Modify("DataWindow.Print.Orientation = " + ls_set5  )
if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If
sdw_1.Saveas('', pdf!, TRUE)



end event

type ddlb_2 from dropdownlistbox within w_newfeature
integer x = 389
integer y = 284
integer width = 951
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

ls_ret = sdw_1.Modify("DataWindow.Export.PDF.NativePDF.CustomSize = " + ls_set2  )
if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If
end event

type ddlb_3 from dropdownlistbox within w_newfeature
integer x = 389
integer y = 412
integer width = 951
integer height = 752
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
ls_ret = sdw_1.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation = " + ls_set3  )
if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If
end event

type st_3 from statictext within w_newfeature
integer x = 41
integer y = 420
integer width = 343
integer height = 80
integer textsize = -9
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

type st_2 from statictext within w_newfeature
integer x = 41
integer y = 292
integer width = 343
integer height = 80
integer textsize = -9
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

type cbx_1 from checkbox within w_newfeature
integer x = 41
integer y = 152
integer width = 978
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "1 Use Settings in Print Specifications"
end type

event clicked;
If checked Then
	ddlb_2.enabled = false
	ddlb_3.enabled = false
	st_5.visible = true
	st_4.visible = true
	ddlb_4.visible = true
	ddlb_5.visible = true
	sdw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = yes" )
Else
	ddlb_2.enabled = true
	ddlb_3.enabled = true
	st_5.visible = false
	st_4.visible = false
	ddlb_4.visible = false
	ddlb_5.visible = false
	sdw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec = no")
End If


end event

type st_1 from statictext within w_newfeature
integer x = 41
integer y = 52
integer width = 343
integer height = 80
integer textsize = -9
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

type ddlb_1 from dropdownlistbox within w_newfeature
integer x = 389
integer y = 36
integer width = 951
integer height = 752
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

ls_ret = sdw_1.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard = " + ls_set1  )
if Len ( ls_ret ) > 0 Then
	MessageBox ( "", ls_ret )
End If
end event

