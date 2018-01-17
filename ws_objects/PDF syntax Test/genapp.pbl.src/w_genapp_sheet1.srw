$PBExportHeader$w_genapp_sheet1.srw
$PBExportComments$Generated MDI Sheet #1
forward
global type w_genapp_sheet1 from w_genapp_basesheet
end type
type cb_4 from commandbutton within w_genapp_sheet1
end type
type cb_3 from commandbutton within w_genapp_sheet1
end type
type cb_2 from commandbutton within w_genapp_sheet1
end type
type ddlb_1 from dropdownlistbox within w_genapp_sheet1
end type
type cb_modify from commandbutton within w_genapp_sheet1
end type
type cb_object from commandbutton within w_genapp_sheet1
end type
type sle_1 from singlelineedit within w_genapp_sheet1
end type
type lb_parameter from listbox within w_genapp_sheet1
end type
type lb_point from listbox within w_genapp_sheet1
end type
type cb_1 from commandbutton within w_genapp_sheet1
end type
type mle_output from multilineedit within w_genapp_sheet1
end type
type dw_1 from datawindow within w_genapp_sheet1
end type
type cbx_1 from checkbox within w_genapp_sheet1
end type
end forward

global type w_genapp_sheet1 from w_genapp_basesheet
string tag = "無題 シート1"
integer y = 264
integer width = 2792
integer height = 1877
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
ddlb_1 ddlb_1
cb_modify cb_modify
cb_object cb_object
sle_1 sle_1
lb_parameter lb_parameter
lb_point lb_point
cb_1 cb_1
mle_output mle_output
dw_1 dw_1
cbx_1 cbx_1
end type
global w_genapp_sheet1 w_genapp_sheet1

type variables
Integer		ii_Big=0
end variables
forward prototypes
public subroutine wf_output (string as_output, boolean ab_clear, multilineedit amle_output)
public subroutine wf_initial ()
end prototypes

public subroutine wf_output (string as_output, boolean ab_clear, multilineedit amle_output);//wf_output(string	as_output,	boolean	ab_clear,	multilineedit	amle_output) Return	None
If	Not	Isvalid(amle_output)	Then	Return

If	ab_Clear	Then	amle_output.Text	=	""

amle_output.Text	+=	as_output+"~r~n"
end subroutine

public subroutine wf_initial ();//wf_initial()

lb_point.additem( "NPDFW01P001:NativePDF.UsePrintSpec")
lb_point.additem( "NPDFW01P002:Method")
lb_point.additem( "NPDFW01P003:NativePDF.CustomOrientation")

lb_point.additem( "NPDFW01P004:NativePDF.CustomSize")
lb_point.additem( "NPDFW01P005:NativePDF.ImageFormat")
lb_point.additem( "NPDFW01P006:NativePDF.PDFStandard")

lb_point.additem( "NPDFW01P007:Distill.CustomPostScript")
lb_point.additem( "NPDFW01P008:Print.Paper.Size")
lb_point.additem( "NPDFW01P009:Print.Orientation")


//wf_output("the Native Print PDF Property value:",	True,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec="+dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.Method="+dw_1.Object.DataWindow.Export.PDF.Method,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation="+dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize="+dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.ImageFormat="+dw_1.Object.DataWindow.Export.PDF.NativePDF.ImageFormat,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard="+dw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript="+dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Print.Paper.Size="+dw_1.Object.DataWindow.Print.Paper.Size,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Print.Orientation="+dw_1.Object.DataWindow.Print.Orientation,	False,	mle_output)
//wf_output("~r~nDescribe property value:",	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.UsePrintSpec')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.UsePrintSpec'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.Method')="+dw_1.Describe('DataWindow.Export.PDF.Method'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomOrientation')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomOrientation'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomSize')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomSize'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.ImageFormat')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.ImageFormat'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.PDFStandard')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.PDFStandard'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.Distill.CustomPostScript')="+dw_1.Describe('DataWindow.Export.PDF.Distill.CustomPostScript'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Print.Paper.Size')="+dw_1.Describe('DataWindow.Print.Paper.Size'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Print.Orientation')="+dw_1.Describe("DataWindow.Print.Orientation"),	False,	mle_output)

end subroutine

on w_genapp_sheet1.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.ddlb_1=create ddlb_1
this.cb_modify=create cb_modify
this.cb_object=create cb_object
this.sle_1=create sle_1
this.lb_parameter=create lb_parameter
this.lb_point=create lb_point
this.cb_1=create cb_1
this.mle_output=create mle_output
this.dw_1=create dw_1
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.ddlb_1
this.Control[iCurrent+5]=this.cb_modify
this.Control[iCurrent+6]=this.cb_object
this.Control[iCurrent+7]=this.sle_1
this.Control[iCurrent+8]=this.lb_parameter
this.Control[iCurrent+9]=this.lb_point
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.mle_output
this.Control[iCurrent+12]=this.dw_1
this.Control[iCurrent+13]=this.cbx_1
end on

on w_genapp_sheet1.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.ddlb_1)
destroy(this.cb_modify)
destroy(this.cb_object)
destroy(this.sle_1)
destroy(this.lb_parameter)
destroy(this.lb_point)
destroy(this.cb_1)
destroy(this.mle_output)
destroy(this.dw_1)
destroy(this.cbx_1)
end on

event open;call super::open;wf_initial()
end event

event resize;call super::resize;
dw_1.Width	=	NewWidth	-	dw_1.X	-	100
dw_1.Height	=	(NewHeight	-	dw_1.Y)/2

mle_output.Y	=	dw_1.Y + dw_1.height +10

mle_output.width	=	NewWidth	-	mle_output.X	-	100
mle_output.Height	=	NewHeight	-	dw_1.Y	-	dw_1.height		-	40

end event

type cb_4 from commandbutton within w_genapp_sheet1
integer x = 1556
integer y = 171
integer width = 280
integer height = 85
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
string text = "clear"
end type

event clicked;wf_output("",	True,	mle_output)
end event

type cb_3 from commandbutton within w_genapp_sheet1
integer x = 1404
integer y = 32
integer width = 448
integer height = 75
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
string text = "Native PDF SaveAs"
end type

event clicked;//use appeon native pdf need pdf.method = NativePDF!
String		ls_ModifyReturn
ls_ModifyReturn	=	dw_1.Modify("DataWindow.Export.PDF.Method = NativePDF!")
wf_output('dw_1.Modify(Datawindow.Export.PDF.Method) return:'+ls_ModifyReturn,	False,	mle_output)
wf_output('dw_1.Describe("DataWindow.Export.PDF.Method"):'+dw_1.Describe("DataWindow.Export.PDF.Method") ,	True,	mle_output)

wf_output("dw_1.SaveAs return value"+String(dw_1.Saveas('', pdf!, TRUE)),	False,	mle_output)
end event

type cb_2 from commandbutton within w_genapp_sheet1
integer x = 1048
integer y = 36
integer width = 340
integer height = 75
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
string text = "GHost SaveAs"
end type

event clicked;//use Ghostscript PDF need set method/printer/distill.custompostscript Property value
dw_1.object.datawindow.export.pdf.method = distill!
wf_output("dw_1.object.datawindow.export.pdf.method="+dw_1.object.datawindow.export.pdf.method,	False,	mle_output)
dw_1.object.datawindow.printer = "Ghostscript PDF"
wf_output("dw_1.object.datawindow.printer="+dw_1.object.datawindow.printer,	False,	mle_output)
dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
wf_output("dw_1.object.datawindow.export.pdf.distill.custompostscript="+dw_1.object.datawindow.export.pdf.distill.custompostscript,	False,	mle_output)

wf_output("dw_1.SaveAs Return value:"+String(dw_1.Saveas('', pdf!, TRUE)),	False,	mle_output)
end event

type ddlb_1 from dropdownlistbox within w_genapp_sheet1
integer x = 452
integer y = 39
integer width = 560
integer height = 277
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
integer limit = 10
string item[] = {"d_test"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String			ls_Dataobject

ls_Dataobject	=	this.selectedtext( )
dw_1.dataObject	=	ls_Dataobject
dw_1.SetTransObject( SQLCA	)
dw_1.Retrieve()

end event

type cb_modify from commandbutton within w_genapp_sheet1
integer x = 1244
integer y = 171
integer width = 300
integer height = 85
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
string text = "modify設定"
end type

event clicked;String		ls_Return
Choose	Case	Left(lb_Point.selecteditem( ),11)		
	Case	'NPDFW01P001'
		ls_Return	=	dw_1.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec="+Sle_1.Text)	
		wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.UsePrintSpec')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.UsePrintSpec'),	False,	mle_output)
		wf_output("modify return value:"+ls_Return,False,mle_output)
	Case	'NPDFW01P002'
		ls_Return	=	dw_1.Modify("DataWindow.Export.PDF.Method="+Sle_1.Text)
		wf_output("dw_1.Describe('DataWindow.Export.PDF.Method')="+dw_1.Describe('DataWindow.Export.PDF.Method'),	False,	mle_output)
		wf_output("modify return value:"+ls_Return,False,mle_output)
	Case	'NPDFW01P003'
		ls_Return	=	dw_1.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation="+Sle_1.Text)
		wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomOrientation')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomOrientation'),	False,	mle_output)
		wf_output("modify return value:"+ls_Return,False,mle_output)
	Case	'NPDFW01P004'
		ls_Return	=	dw_1.Modify("DataWindow.Export.PDF.NativePDF.CustomSize="+Sle_1.Text)
		wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomSize')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomSize'),	False,	mle_output)
		wf_output("modify return value:"+ls_Return,False,mle_output)
	Case	'NPDFW01P005'
		ls_Return	=	dw_1.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat="+Sle_1.Text)
		wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.ImageFormat')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.ImageFormat'),	False,	mle_output)
		wf_output("modify return value:"+ls_Return,False,mle_output)
	Case	'NPDFW01P006'
		ls_Return	=	dw_1.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard="+Sle_1.Text)
		wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.PDFStandard')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.PDFStandard'),	False,	mle_output)
		wf_output("modify return value:"+ls_Return,False,mle_output)
	Case	'NPDFW01P007'
		ls_Return	=	dw_1.Modify("DataWindow.Export.PDF.Distill.CustomPostScript="+Sle_1.Text)
		wf_output("dw_1.Describe('DataWindow.Export.PDF.Distill.CustomPostScript')="+dw_1.Describe('DataWindow.Export.PDF.Distill.CustomPostScript'),	False,	mle_output)
		wf_output("modify return value:"+ls_Return,False,mle_output)
	Case	'NPDFW01P008'
		ls_Return	=	dw_1.Modify("DataWindow.Print.Paper.Size='"+Sle_1.Text+"'")
		wf_output("dw_1.Describe('DataWindow.Print.Paper.Size')="+dw_1.Describe('DataWindow.Print.Paper.Size'),	False,	mle_output)
		wf_output("modify return value:"+ls_Return,False,mle_output)
	Case	'NPDFW01P009'
		ls_Return	=	dw_1.Modify("DataWindow.Print.Orientation= '"+Sle_1.Text+"'")
		wf_output("dw_1.Describe('DataWindow.Print.Orientation')="+dw_1.Describe("DataWindow.Print.Orientation"),	False,	mle_output)
		wf_output("modify return value:"+ls_Return,False,mle_output)
	Case Else		
End	Choose
end event

type cb_object from commandbutton within w_genapp_sheet1
integer x = 936
integer y = 171
integer width = 300
integer height = 85
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
string text = "object Set"
end type

event clicked;Choose	Case	Left(lb_Point.selecteditem( ),11)
		
	Case	'NPDFW01P001'
		dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec=sle_1.Text
		wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec="+dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec,	False,	mle_output)
	Case	'NPDFW01P002'
		dw_1.Object.DataWindow.Export.PDF.Method=Integer(sle_1.Text)
		wf_output("dw_1.Object.DataWindow.Export.PDF.Method="+dw_1.Object.DataWindow.Export.PDF.Method,	False,	mle_output)
	Case	'NPDFW01P003'
		dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = Long(sle_1.Text)
		wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation="+dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation,	False,	mle_output)
	Case	'NPDFW01P004'
		dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize	=	Long(Sle_1.Text)
		wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize="+dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize,	False,	mle_output)
	Case	'NPDFW01P005'
		dw_1.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = Long(Sle_1.Text)
		wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.ImageFormat="+dw_1.Object.DataWindow.Export.PDF.NativePDF.ImageFormat,	False,	mle_output)
	Case	'NPDFW01P006'
		dw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = Long(Sle_1.Text)
		wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard="+dw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard,	False,	mle_output)
	Case	'NPDFW01P007'
		dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript = Sle_1.Text
		wf_output("dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript="+dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript,	False,	mle_output)
	Case	'NPDFW01P008'
		dw_1.Object.DataWindow.Print.Paper.Size	=	Sle_1.Text
		wf_output("dw_1.Object.DataWindow.Print.Paper.Size="+dw_1.Object.DataWindow.Print.Paper.Size,	False,	mle_output)
	Case	'NPDFW01P009'
		dw_1.Object.DataWindow.Print.Orientation	=	Long(Sle_1.Text)
		wf_output("dw_1.Object.DataWindow.Print.Orientation="+dw_1.Object.DataWindow.Print.Orientation,	False,	mle_output)
	Case Else
		
End	Choose
end event

type sle_1 from singlelineedit within w_genapp_sheet1
integer x = 36
integer y = 171
integer width = 856
integer height = 85
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type lb_parameter from listbox within w_genapp_sheet1
integer x = 32
integer y = 1095
integer width = 864
integer height = 612
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;sle_1.Text	=	This.SelectedItem( )
end event

type lb_point from listbox within w_genapp_sheet1
integer x = 32
integer y = 267
integer width = 864
integer height = 814
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;

lb_parameter.Reset( )

Choose	Case	Left(lb_Point.selecteditem( ),11)
		
	Case	'NPDFW01P001'
		lb_parameter.AddItem('0')
		lb_parameter.AddItem('1')
	Case	'NPDFW01P002'
		lb_parameter.AddItem('Distill!')
		lb_parameter.AddItem('XSLFOP!')
		lb_parameter.AddItem('NativePDF!')
		lb_parameter.AddItem('0')
		lb_parameter.AddItem('1')
		lb_parameter.AddItem('2')
	Case	'NPDFW01P003','NPDFW01P009'
		lb_parameter.AddItem('Default')
		lb_parameter.AddItem('Landscape')
		lb_parameter.AddItem('Portrait')
		lb_parameter.AddItem('0')
		lb_parameter.AddItem('1')
		lb_parameter.AddItem('2')
	Case	'NPDFW01P004'
		lb_parameter.AddItem('Default')
		lb_parameter.AddItem('A1 594 x 841 mm')
		lb_parameter.AddItem('A2 420 x 594 mm')
		lb_parameter.AddItem('A3 297 x 420 mm')
		lb_parameter.AddItem('A4 210 x 297 mm')
		lb_parameter.AddItem('Letter 8 1/2 x 11 in')
		lb_Parameter.AddItem('Legal 8 1/2 x 14 in')
		lb_parameter.AddItem('0')
		lb_parameter.AddItem('1')
		lb_parameter.AddItem('2')
		lb_parameter.AddItem('3')
		lb_parameter.AddItem('4')
		lb_parameter.AddItem('5')
		lb_parameter.AddItem('6')
	Case	'NPDFW01P005'
		lb_parameter.AddItem('BMP')
		lb_parameter.AddItem('JPG')
		lb_parameter.AddItem('PNG')
		lb_parameter.AddItem('GIF')
		lb_parameter.AddItem('0')
		lb_parameter.AddItem('1')
		lb_parameter.AddItem('2')
		lb_parameter.AddItem('3')
	Case	'NPDFW01P006'
		lb_parameter.AddItem('None')
		lb_parameter.AddItem('PDF/A-1a')
		lb_parameter.AddItem('PDF/A-1b')
		lb_parameter.AddItem('PDF/A-3a')
		lb_parameter.AddItem('PDF/A-3b')
		lb_parameter.AddItem('PDF/A-3u')
		lb_parameter.AddItem('0')
		lb_parameter.AddItem('1')
		lb_parameter.AddItem('2')
		lb_parameter.AddItem('3')
		lb_parameter.AddItem('4')
		lb_parameter.AddItem('5')
	Case	'NPDFW01P007'
		lb_parameter.AddItem('yes')
		lb_parameter.AddItem('no')
		lb_parameter.AddItem('0')
		lb_parameter.AddItem('1')
	Case	'NPDFW01P008'
		lb_parameter.AddItem("Default")
		lb_parameter.AddItem("Letter 8 1/2 x 11 in")
		lb_parameter.AddItem("LetterSmall 8 1/2 x 11 in")
		lb_parameter.AddItem("Statement 5 1/2 x 8 1/2 in")
		lb_parameter.AddItem('0')
		lb_parameter.AddItem('1')
		lb_parameter.AddItem('2')
		lb_parameter.AddItem('3')
		lb_parameter.AddItem('4')
		lb_parameter.AddItem('5')
		lb_parameter.AddItem('6')
		lb_parameter.AddItem('7')
		lb_parameter.AddItem('8')
		lb_parameter.AddItem('9')
		lb_parameter.AddItem('10')
		lb_parameter.AddItem('11')
		lb_parameter.AddItem('12')
		lb_parameter.AddItem('13')
		lb_parameter.AddItem('14')
		lb_parameter.AddItem('15')
		lb_parameter.AddItem('16')
		lb_parameter.AddItem('17')
		lb_parameter.AddItem('18')
		lb_parameter.AddItem('19')
		lb_parameter.AddItem('20')
		lb_parameter.AddItem('21')
		lb_parameter.AddItem('22')
		lb_parameter.AddItem('23')
		lb_parameter.AddItem('24')
		lb_parameter.AddItem('25')
		lb_parameter.AddItem('26')
		lb_parameter.AddItem('27')
		lb_parameter.AddItem('28')
		lb_parameter.AddItem('29')
		lb_parameter.AddItem('30')
		lb_parameter.AddItem('31')
		lb_parameter.AddItem('32')
		lb_parameter.AddItem('33')
		lb_parameter.AddItem('34')
		lb_parameter.AddItem('35')
		lb_parameter.AddItem('36')
		lb_parameter.AddItem('37')
		lb_parameter.AddItem('38')
		lb_parameter.AddItem('39')
		lb_parameter.AddItem('40')
		lb_parameter.AddItem('41')
		lb_parameter.AddItem('255')
		lb_parameter.AddItem('265')
		
//	Case	
		
	Case Else
		messagebox ('warning','unkown item please check the script')
		Return
End	Choose
lb_parameter.SelectItem(1)
lb_parameter.Trigger event SelectionChanged(1)
//wf_output("the Native Print PDF Property value:",	True,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec="+dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.Method="+dw_1.Object.DataWindow.Export.PDF.Method,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation="+dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize="+dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.ImageFormat="+dw_1.Object.DataWindow.Export.PDF.NativePDF.ImageFormat,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard="+dw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript="+dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Print.Paper.Size="+dw_1.Object.DataWindow.Print.Paper.Size,	False,	mle_output)
//wf_output("dw_1.Object.DataWindow.Print.Orientation="+dw_1.Object.DataWindow.Print.Orientation,	False,	mle_output)
//wf_output("~r~nDescribe property value:",	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.UsePrintSpec')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.UsePrintSpec'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.Method')="+dw_1.Describe('DataWindow.Export.PDF.Method'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomOrientation')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomOrientation'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomSize')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomSize'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.ImageFormat')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.ImageFormat'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.PDFStandard')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.PDFStandard'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Export.PDF.Distill.CustomPostScript')="+dw_1.Describe('DataWindow.Export.PDF.Distill.CustomPostScript'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Print.Paper.Size')="+dw_1.Describe('DataWindow.Print.Paper.Size'),	False,	mle_output)
//wf_output("dw_1.Describe('DataWindow.Print.Orientation')="+dw_1.Describe("DataWindow.Print.Orientation"),	False,	mle_output)

end event

type cb_1 from commandbutton within w_genapp_sheet1
integer x = 36
integer y = 39
integer width = 384
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
string text = "Get all Pro value"
end type

event clicked;//dw_control.Object.DataWindow.Export.PDF.Distill.CustomPostScript
wf_output("the Native Print PDF Property value:",	True,	mle_output)
wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec="+dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec,	False,	mle_output)
wf_output("dw_1.Object.DataWindow.Export.PDF.Method="+dw_1.Object.DataWindow.Export.PDF.Method,	False,	mle_output)
wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation="+dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation,	False,	mle_output)
wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize="+dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize,	False,	mle_output)
wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.ImageFormat="+dw_1.Object.DataWindow.Export.PDF.NativePDF.ImageFormat,	False,	mle_output)
wf_output("dw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard="+dw_1.Object.DataWindow.Export.PDF.NativePDF.PDFStandard,	False,	mle_output)
wf_output("dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript="+dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript,	False,	mle_output)
wf_output("dw_1.Object.DataWindow.Print.Paper.Size="+dw_1.Object.DataWindow.Print.Paper.Size,	False,	mle_output)
wf_output("dw_1.Object.DataWindow.Print.Orientation="+dw_1.Object.DataWindow.Print.Orientation,	False,	mle_output)
wf_output("~r~nDescribe property value:",	False,	mle_output)
wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.UsePrintSpec')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.UsePrintSpec'),	False,	mle_output)
wf_output("dw_1.Describe('DataWindow.Export.PDF.Method')="+dw_1.Describe('DataWindow.Export.PDF.Method'),	False,	mle_output)
wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomOrientation')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomOrientation'),	False,	mle_output)
wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomSize')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.CustomSize'),	False,	mle_output)
wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.ImageFormat')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.ImageFormat'),	False,	mle_output)
wf_output("dw_1.Describe('DataWindow.Export.PDF.NativePDF.PDFStandard')="+dw_1.Describe('DataWindow.Export.PDF.NativePDF.PDFStandard'),	False,	mle_output)
wf_output("dw_1.Describe('DataWindow.Export.PDF.Distill.CustomPostScript')="+dw_1.Describe('DataWindow.Export.PDF.Distill.CustomPostScript'),	False,	mle_output)
wf_output("dw_1.Describe('DataWindow.Print.Paper.Size')="+dw_1.Describe('DataWindow.Print.Paper.Size'),	False,	mle_output)
wf_output("dw_1.Describe('DataWindow.Print.Orientation')="+dw_1.Describe("DataWindow.Print.Orientation"),	False,	mle_output)

end event

type mle_output from multilineedit within w_genapp_sheet1
integer x = 944
integer y = 1106
integer width = 1668
integer height = 604
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_genapp_sheet1
integer x = 940
integer y = 267
integer width = 1668
integer height = 825
integer taborder = 10
string title = "未設定"
string dataobject = "d_test"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;this.Bringtotop	=	True

If	ii_Big	=	0	Then
//	this.Width	=	mle_output.Width
	this.Height	=	mle_output.Height	+	this.Height	+	10
	ii_Big	=	1
//	this.Bringtotop	=	True
Else
//	this.X	=	cb_modify.X	+	cb_modify.Width	+	10
//	this.Y	=	0
//	this.Width	=	mle_output.Width
	this.Height	=	this.Height	-	mle_output.Height	-	10
	ii_Big	=	0
End	If

end event

type cbx_1 from checkbox within w_genapp_sheet1
boolean visible = false
integer x = 76
integer y = 39
integer width = 608
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "MS UI Gothic"
long textcolor = 33554432
long backcolor = 67108864
string text = "User Specifications Print"
end type

event clicked;If	This.Checked	Then
	dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = 'Yes'
Else
	dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = 'No'
End	If

wf_output(dw_1.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec,	True,	mle_output)
end event

