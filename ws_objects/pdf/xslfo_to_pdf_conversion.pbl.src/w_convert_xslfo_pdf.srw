$PBExportHeader$w_convert_xslfo_pdf.srw
forward
global type w_convert_xslfo_pdf from window
end type
type cb_6 from commandbutton within w_convert_xslfo_pdf
end type
type cbx_1 from checkbox within w_convert_xslfo_pdf
end type
type cb_5 from uo_saveas within w_convert_xslfo_pdf
end type
type cb_4 from commandbutton within w_convert_xslfo_pdf
end type
type cbx_complex from checkbox within w_convert_xslfo_pdf
end type
type cb_3 from commandbutton within w_convert_xslfo_pdf
end type
type rb_10 from radiobutton within w_convert_xslfo_pdf
end type
type rb_9 from radiobutton within w_convert_xslfo_pdf
end type
type cb_2 from commandbutton within w_convert_xslfo_pdf
end type
type cb_1 from commandbutton within w_convert_xslfo_pdf
end type
type cb_all from commandbutton within w_convert_xslfo_pdf
end type
type rb_8 from radiobutton within w_convert_xslfo_pdf
end type
type rb_childrpt from radiobutton within w_convert_xslfo_pdf
end type
type cb_print from commandbutton within w_convert_xslfo_pdf
end type
type rb_composite from radiobutton within w_convert_xslfo_pdf
end type
type rb_graph from radiobutton within w_convert_xslfo_pdf
end type
type rb_distill from radiobutton within w_convert_xslfo_pdf
end type
type rb_xslfo from radiobutton within w_convert_xslfo_pdf
end type
type rb_pdf from radiobutton within w_convert_xslfo_pdf
end type
type rb_xsl from radiobutton within w_convert_xslfo_pdf
end type
type cb_exporttods from commandbutton within w_convert_xslfo_pdf
end type
type st_1 from statictext within w_convert_xslfo_pdf
end type
type rb_7 from radiobutton within w_convert_xslfo_pdf
end type
type rb_6 from radiobutton within w_convert_xslfo_pdf
end type
type rb_5 from radiobutton within w_convert_xslfo_pdf
end type
type rb_4 from radiobutton within w_convert_xslfo_pdf
end type
type cb_openpdf from commandbutton within w_convert_xslfo_pdf
end type
type rb_3 from radiobutton within w_convert_xslfo_pdf
end type
type rb_2 from radiobutton within w_convert_xslfo_pdf
end type
type rb_1 from radiobutton within w_convert_xslfo_pdf
end type
type cb_close from commandbutton within w_convert_xslfo_pdf
end type
type cb_convpdf from commandbutton within w_convert_xslfo_pdf
end type
type dw_1 from datawindow within w_convert_xslfo_pdf
end type
type gb_1 from groupbox within w_convert_xslfo_pdf
end type
type gb_2 from groupbox within w_convert_xslfo_pdf
end type
type gb_3 from groupbox within w_convert_xslfo_pdf
end type
end forward

global type w_convert_xslfo_pdf from window
integer width = 4553
integer height = 2676
boolean titlebar = true
string title = "Converter from XSL-FO to PDF"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_6 cb_6
cbx_1 cbx_1
cb_5 cb_5
cb_4 cb_4
cbx_complex cbx_complex
cb_3 cb_3
rb_10 rb_10
rb_9 rb_9
cb_2 cb_2
cb_1 cb_1
cb_all cb_all
rb_8 rb_8
rb_childrpt rb_childrpt
cb_print cb_print
rb_composite rb_composite
rb_graph rb_graph
rb_distill rb_distill
rb_xslfo rb_xslfo
rb_pdf rb_pdf
rb_xsl rb_xsl
cb_exporttods cb_exporttods
st_1 st_1
rb_7 rb_7
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
cb_openpdf cb_openpdf
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cb_close cb_close
cb_convpdf cb_convpdf
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_convert_xslfo_pdf w_convert_xslfo_pdf

type variables

end variables

event open;string s
int result
s = 'abcdef'
result = 1012

//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=EAS Demo DB V110;UID=dba;PWD=sql'"

//SQLCA.DBMS       =ProfileString("xsl_fo.ini","DBINFO","DBMS"," ODBC") 
//SQLCA.Database   =ProfileString("xsl_fo.ini","DBINFO","AutoCommit","false") 
//SQLCA.DBParm     =ProfileString("xsl_fo.ini","DBINFO","DBParm","ConnectString='DSN=EAS Demo DB V125;UID=dba;PWD=sql'")

// Profile PB Demo DB V2017R2
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017R2;UID=dba;PWD=sql'"


connect using SQLCA;

dw_1.SettransObject(SQLCA)
rb_1.checked = true
//rb_xsl.checked = true
rb_pdf.checked = true

//dw_1.saveas('1.pdf',Nativepdf!,false)

//rb_distill.checked = false
//rb_xslfo.checked = false
//rb_distill.visible = false
//rb_xslfo.visible = false
//gb_3.visible = false
//cb_print.visible = false

rb_graph.visible = false
rb_composite.visible = false
rb_8.visible = false
gb_1.width = 3100

dw_1.retrieve()


end event

on w_convert_xslfo_pdf.create
this.cb_6=create cb_6
this.cbx_1=create cbx_1
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cbx_complex=create cbx_complex
this.cb_3=create cb_3
this.rb_10=create rb_10
this.rb_9=create rb_9
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_all=create cb_all
this.rb_8=create rb_8
this.rb_childrpt=create rb_childrpt
this.cb_print=create cb_print
this.rb_composite=create rb_composite
this.rb_graph=create rb_graph
this.rb_distill=create rb_distill
this.rb_xslfo=create rb_xslfo
this.rb_pdf=create rb_pdf
this.rb_xsl=create rb_xsl
this.cb_exporttods=create cb_exporttods
this.st_1=create st_1
this.rb_7=create rb_7
this.rb_6=create rb_6
this.rb_5=create rb_5
this.rb_4=create rb_4
this.cb_openpdf=create cb_openpdf
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_close=create cb_close
this.cb_convpdf=create cb_convpdf
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_6,&
this.cbx_1,&
this.cb_5,&
this.cb_4,&
this.cbx_complex,&
this.cb_3,&
this.rb_10,&
this.rb_9,&
this.cb_2,&
this.cb_1,&
this.cb_all,&
this.rb_8,&
this.rb_childrpt,&
this.cb_print,&
this.rb_composite,&
this.rb_graph,&
this.rb_distill,&
this.rb_xslfo,&
this.rb_pdf,&
this.rb_xsl,&
this.cb_exporttods,&
this.st_1,&
this.rb_7,&
this.rb_6,&
this.rb_5,&
this.rb_4,&
this.cb_openpdf,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.cb_close,&
this.cb_convpdf,&
this.dw_1,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_convert_xslfo_pdf.destroy
destroy(this.cb_6)
destroy(this.cbx_1)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cbx_complex)
destroy(this.cb_3)
destroy(this.rb_10)
destroy(this.rb_9)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_all)
destroy(this.rb_8)
destroy(this.rb_childrpt)
destroy(this.cb_print)
destroy(this.rb_composite)
destroy(this.rb_graph)
destroy(this.rb_distill)
destroy(this.rb_xslfo)
destroy(this.rb_pdf)
destroy(this.rb_xsl)
destroy(this.cb_exporttods)
destroy(this.st_1)
destroy(this.rb_7)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.cb_openpdf)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_close)
destroy(this.cb_convpdf)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type cb_6 from commandbutton within w_convert_xslfo_pdf
integer x = 2624
integer y = 2344
integer width = 402
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New PDF"
end type

event clicked;OpenWithparm( w_newfeature,dw_1)
end event

type cbx_1 from checkbox within w_convert_xslfo_pdf
integer x = 1957
integer y = 2420
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
string text = "PB"
end type

type cb_5 from uo_saveas within w_convert_xslfo_pdf
integer x = 1481
integer y = 2412
integer taborder = 100
end type

event clicked;call super::clicked;of_saveas(dw_1,cbx_1.checked)  
end event

type cb_4 from commandbutton within w_convert_xslfo_pdf
integer x = 699
integer y = 2292
integer width = 489
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "All Xslfop"
end type

event clicked;//Save As Distill

//
//Save As XSLFOP
rb_xslfo.triggerevent(clicked!)
rb_xslfo.checked = true
rb_1.checked = true
rb_1.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_2.checked = true
rb_2.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_3.checked = true
rb_3.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_4.checked = true
rb_4.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_5.checked = true
rb_5.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_6.checked = true
rb_6.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_7.checked = true
rb_7.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_childrpt.checked = true
rb_childrpt.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)

end event

type cbx_complex from checkbox within w_convert_xslfo_pdf
integer x = 2592
integer y = 60
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "complex"
end type

event clicked;if this.checked then
	dw_1.dataObject += "_complex"
	dw_1.setTransObject(sqlca)
	dw_1.retrieve()
else
	dw_1.dataObject = left(	dw_1.dataObject, len(dw_1.dataObject) - 8)
	dw_1.setTransObject(sqlca)
	dw_1.retrieve()
end if
end event

type cb_3 from commandbutton within w_convert_xslfo_pdf
integer x = 699
integer y = 2416
integer width = 631
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Single save "
end type

event clicked;//dw_1.object.datawindow.export.pdf.method = distill!
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
dw_1.object.datawindow.export.pdf.method =nativepdf!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
dw_1.saveas()
end event

type rb_10 from radiobutton within w_convert_xslfo_pdf
integer x = 462
integer y = 328
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grid TV"
end type

event clicked;rb_1.checked=false
rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_graph.checked = false
rb_composite.checked = false
rb_childrpt.checked = false
dw_1.dataobject = "d_grid_treeview"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()
end event

type rb_9 from radiobutton within w_convert_xslfo_pdf
integer x = 73
integer y = 328
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "TreeView"
end type

event clicked;rb_1.checked=false
rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_graph.checked = false
rb_composite.checked = false
rb_childrpt.checked = false
dw_1.dataobject = "d_treeview"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()
end event

type cb_2 from commandbutton within w_convert_xslfo_pdf
integer x = 27
integer y = 2420
integer width = 631
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save in current dir"
end type

event clicked;//dw_1.saveas("a.pdf", PDF!, false)

//Saving as PDF

	if rb_distill.checked = true then
		dw_1.Object.DataWindow.Export.PDF.Method = Distill!
//		fo_path = fo_path +"Distill\"
	end if
	if rb_xslfo.checked = true then
		dw_1.Object.DataWindow.Export.PDF.Method = XSLFOP!
//		fo_path = fo_path +"XSLFOP\"
	end if

int result
if rb_pdf.checked then
	if rb_1.checked = true then
		result = dw_1.SaveAs("table.pdf", PDF!, TRUE)

	end if
	
	if rb_2.checked = true then
		result = dw_1.SaveAs("grid.pdf", PDF!, TRUE)
	end if
	
	if rb_3.checked = true then
		result = dw_1.SaveAs("label.pdf", PDF!, TRUE)
		
	end if
	
	if rb_4.checked = true then
		result = dw_1.SaveAs("nup.pdf", PDF!, TRUE)
		
	end if
	
	if rb_5.checked = true then
		result = dw_1.SaveAs("group.pdf", PDF!, TRUE)
		
	end if
	if rb_6.checked = true then
		result = dw_1.SaveAs("freeform.pdf", PDF!, TRUE)
		
	end if
	if rb_7.checked = true then
		result = dw_1.SaveAs("crosstab.pdf", PDF!, TRUE)
		
	end if
	if rb_8.checked = true then
		result = dw_1.SaveAs("Nested.pdf", PDF!, TRUE)
		
	end if
	if rb_graph.checked = true then
		result = dw_1.SaveAs("graph.pdf", PDF!, TRUE)
		
	end if
	if rb_composite.checked = true then
		result = dw_1.SaveAs("composite.pdf", PDF!, TRUE)
		
	end if
//	if rb_childrpt.checked = true then
//		
//		result = dw_1.GetChild('child_object', dwc_childrpt)
//	end if
end if
end event

type cb_1 from commandbutton within w_convert_xslfo_pdf
integer x = 27
integer y = 2284
integer width = 631
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print in WebForm"
end type

event clicked;dw_1.print()
end event

type cb_all from commandbutton within w_convert_xslfo_pdf
integer x = 1289
integer y = 2160
integer width = 489
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generate all"
end type

event clicked;//Save As Distill
rb_distill.triggerevent(clicked!)
rb_distill.checked = true

rb_1.checked = true
rb_1.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_2.checked = true
rb_2.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_3.checked = true
rb_3.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_4.checked = true
rb_4.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_5.checked = true
rb_5.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_6.checked = true
rb_6.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_7.checked = true
rb_7.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_8.checked = true
rb_8.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_childrpt.checked = true
rb_childrpt.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_graph.checked = true
rb_graph.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_composite.checked = true
rb_composite.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)

//return
//
//Save As XSLFOP
rb_xslfo.triggerevent(clicked!)
rb_xslfo.checked = true
rb_1.checked = true
rb_1.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_2.checked = true
rb_2.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_3.checked = true
rb_3.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_4.checked = true
rb_4.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_5.checked = true
rb_5.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_6.checked = true
rb_6.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_7.checked = true
rb_7.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)
rb_childrpt.checked = true
rb_childrpt.triggerevent(clicked!)
cb_convpdf.triggerevent(clicked!)

end event

type rb_8 from radiobutton within w_convert_xslfo_pdf
integer x = 3077
integer y = 224
integer width = 512
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nested Report"
end type

event clicked;rb_1.checked=false
rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_6.checked=false
rb_7.checked = false
rb_composite.checked = false
rb_graph.Checked = false

dw_1.dataobject = "d_composite_childrpt"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()
end event

type rb_childrpt from radiobutton within w_convert_xslfo_pdf
integer x = 2551
integer y = 224
integer width = 512
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Child Report"
end type

event clicked;rb_1.checked=false
rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_6.checked=false
rb_7.checked = false
rb_composite.checked = false
rb_graph.Checked = false

dw_1.dataobject = "d_composite_childrpt"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()
end event

type cb_print from commandbutton within w_convert_xslfo_pdf
integer x = 2985
integer y = 2148
integer width = 658
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Send to Printer"
end type

event clicked;integer result,i
string s,fo_path

if rb_pdf.checked then
	//Checking for Method
	if rb_distill.checked = true then
		dw_1.Object.DataWindow.Export.PDF.Method = Distill!
 		dw_1.Object.DataWindow.Printer = "Sybase DataWindow PS"
 		dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript="Yes"
//		 li_ret = dw_1.SaveAs("custom.pdf", PDF!, true)
		//		
		//		dw_1.Object.DataWindow.Export.PDF.Method = Distill!
//		dw_1.Modify("Export.PDF.Method = Distill!")
// 		dw_1.Modify("Printer = '\\TCGCCUNS1\hplj4kn' ")
// 		dw_1.Modify ("Export.PDF.Distill.CustomPostScript='Yes'")
	end if
	if rb_xslfo.checked = true then
		dw_1.Object.DataWindow.Export.PDF.Method = XSLFOP!
		dw_1.Object.DataWindow.Export.PDF.xslfop.print='Yes'
	end if
	if rb_1.checked = true then
		result = dw_1.SaveAs("table.pdf", PDF!, TRUE)
		
		if result = 1 then
			Messagebox("Distill Print","Print Successfull")
		else
			Messagebox("Distill Print","Print Not Successfull")
		end if
	end if
	
	if rb_2.checked = true then
		result = dw_1.SaveAs("grid.pdf", PDF!, TRUE)
		
		if result = 1 then
			Messagebox("Distill Print","Print Successfull")
		else
			Messagebox("Distill Print","Print Not Successfull")
		end if
	end if
	
	if rb_3.checked = true then
		result = dw_1.SaveAs("label.pdf", PDF!, TRUE)
		
		if result = 1 then
			Messagebox("Distill Print","Print Successfull")
		else
			Messagebox("Distill Print","Print Not Successfull")
		end if
	end if
	
	if rb_4.checked = true then
		result = dw_1.SaveAs("nup.pdf", PDF!, TRUE)
		
		if result = 1 then
			Messagebox("Distill Print","Print Successfull")
		else
			Messagebox("Distill Print","Print Not Successfull")
		end if
	end if
	
	if rb_5.checked = true then
		result = dw_1.SaveAs("group.pdf", PDF!, TRUE)
		
		if result = 1 then
			Messagebox("Distill Print","Print Successfull")
		else
			Messagebox("Distill Print","Print Not Successfull")
		end if
	end if
	if rb_6.checked = true then
		result = dw_1.SaveAs("freeform.pdf", PDF!, TRUE)
		
		if result = 1 then
			Messagebox("Distill Print","Print Successfull")
		else
			Messagebox("Distill Print","Print Not Successfull")
		end if
	end if
	if rb_7.checked = true then
		result = dw_1.SaveAs("crosstab.pdf", PDF!, TRUE)
		
		if result = 1 then
			Messagebox("Distill Print","Print Successfull")
		else
			Messagebox("Distill Print","Print Not Successfull")
		end if
	end if
	if rb_8.checked = true then
		result = dw_1.SaveAs("Nested.pdf", PDF!, TRUE)
		
		if result = 1 then
			Messagebox("Distill Print","Print Successfull")
		else
			Messagebox("Distill Print","Print Not Successfull")
		end if
	end if
	if rb_graph.checked = true then
		result = dw_1.SaveAs("graph.pdf", PDF!, TRUE)
		
		if result = 1 then
			Messagebox("Distill Print","Print Successfull")
		else
			Messagebox("Distill Print","Print Not Successfull")
		end if
	end if
	if rb_composite.checked = true then
		result = dw_1.SaveAs("composite.pdf", PDF!, TRUE)
		
		if result = 1 then
			Messagebox("Distill Print","Print Successfull")
		else
			Messagebox("Distill Print","Print Not Successfull")
		end if
	end if
	if rb_childrpt.checked = true then
		DataWindowChild dwc_childrpt
		result = dw_1.GetChild('child_object', dwc_childrpt)
		if result = -1 THEN 
			MessageBox("Error", "Get Child error for DataWindowChild")
		else
			dwc_childrpt.SaveAs(fo_path + "child_rpt.pdf", PDF!, TRUE)
		
			if result = 1 then
				Messagebox("Distill Print","Print Successfull")
			else
				Messagebox("Distill Print","Print Not Successfull")
			end if
		end if
	end if
end if
end event

type rb_composite from radiobutton within w_convert_xslfo_pdf
integer x = 3995
integer y = 220
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Composite"
end type

event clicked;rb_1.checked=false
rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_6.checked=false
rb_7.checked = false
rb_graph.checked = false
rb_childrpt.checked = false

dw_1.dataobject = "d_composite"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()
end event

type rb_graph from radiobutton within w_convert_xslfo_pdf
integer x = 3662
integer y = 220
integer width = 329
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Graph"
end type

event clicked;rb_1.checked=false
rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_6.checked=false
rb_7.checked = false
rb_composite.checked = false
rb_childrpt.checked = false

dw_1.dataobject = "d_graph"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()
end event

type rb_distill from radiobutton within w_convert_xslfo_pdf
integer x = 1426
integer y = 64
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DISTILL!"
end type

event clicked;rb_xslfo.checked = false
gb_1.width = 4430
rb_graph.visible = true
rb_composite.visible = true
rb_8.visible = true

rb_1.checked=true
rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_6.checked=false
rb_7.checked = false
rb_graph.checked = false
rb_composite.checked = false
cb_print.visible = false

dw_1.dataobject = "d_tabular"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()
end event

type rb_xslfo from radiobutton within w_convert_xslfo_pdf
integer x = 1938
integer y = 64
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "XSLFO!"
end type

event clicked;rb_distill.checked = false
rb_graph.visible = false
rb_composite.visible = false
rb_8.visible = false
gb_1.width = 3100

//rb_1.checked=true
//rb_2.checked=false
//rb_3.checked=false
//rb_4.checked=false
//rb_5.checked=false
//rb_6.checked=false
//rb_7.checked=false
//rb_8.checked=false
//rb_graph.checked = false
//rb_composite.checked = false
cb_print.visible = true

//dw_1.dataobject = "d_tabular"
//dw_1.SettransObject(SQLCA)
//dw_1.retrieve()
end event

type rb_pdf from radiobutton within w_convert_xslfo_pdf
integer x = 768
integer y = 64
integer width = 475
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test for PDF"
end type

event clicked;rb_xsl.checked = false
gb_3.visible = true
rb_distill.visible = true
rb_xslfo.visible = true
//rb_distill.checked = true
//rb_xslfo.checked = false

gb_1.width = 4430
rb_graph.visible = true
rb_composite.visible = true
rb_8.visible = true

//rb_1.checked=true
//rb_2.checked=false
//rb_3.checked=false
//rb_4.checked=false
//rb_5.checked=false
//rb_6.checked=false
//rb_7.checked = false
//rb_graph.checked = false
//rb_composite.checked = false
cb_print.visible = true

dw_1.dataobject = "d_tabular"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()
end event

type rb_xsl from radiobutton within w_convert_xslfo_pdf
integer x = 73
integer y = 64
integer width = 622
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test for XSL-FO"
end type

event clicked;rb_pdf.checked = false
rb_distill.checked = false
rb_xslfo.checked = false
rb_distill.visible = false
rb_xslfo.visible = false
gb_3.visible = false

rb_graph.visible = false
rb_composite.visible = false
rb_8.visible = false
gb_1.width = 3100

rb_1.checked=true
rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_6.checked=false
rb_7.checked=false
rb_8.checked=false
rb_graph.checked = false
rb_composite.checked = false
cb_print.visible = false

dw_1.dataobject = "d_tabular"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()
end event

type cb_exporttods from commandbutton within w_convert_xslfo_pdf
integer x = 1998
integer y = 2148
integer width = 882
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Export DataStore To PDF"
end type

event clicked;integer result,i
string s,fo_path
datastore ds_1
blob blb
destroy ds_1
ds_1 = create datastore
DataWindowChild dwc_childrpt

i = dw_1.getfullstate(blb)
if i <> -1 then
	i = ds_1.setfullstate(blb)
	if i <> 3 then
		Messagebox("Import Error","DataStore Import Error")
		destroy ds_1
		return
	end if
else
	Messagebox("Export Error","Data Window to DataStore Export Error")
	destroy ds_1
	return
end if

cb_Openpdf.enabled = false
fo_path = ProfileString("xsl_fo.ini","XSLFO Path","path"," ")

//Save As XSL-FO file
if rb_xsl.checked then
	if rb_1.checked = true then
		result = ds_1.SaveAs(fo_path + "table.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat table",Minimized!)
		
		if result = 1 then
			s = fo_path + "table.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_2.checked = true then
		result = ds_1.SaveAs(fo_path + "grid.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat grid",Minimized!)
		
		if result = 1 then
			s= fo_path + "grid.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_3.checked = true then
		result = ds_1.SaveAs(fo_path + "label.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat label",Minimized!)
		
		if result = 1 then
			s= fo_path + "label.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_4.checked = true then
		result = ds_1.SaveAs(fo_path + "nup.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat nup",Minimized!)
		
		if result = 1 then
			s= fo_path + "nup.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_5.checked = true then
		result = ds_1.SaveAs(fo_path + "group.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat group",Minimized!)
		
		if result = 1 then
			s= fo_path + "group.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_6.checked = true then
		result = ds_1.SaveAs(fo_path + "freeform.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat freeform",Minimized!)
		
		if result = 1 then
			s= fo_path + "freeform.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_7.checked = true then
		result = ds_1.SaveAs(fo_path + "crosstab.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat crosstab",Minimized!)
		
		if result = 1 then
			s= fo_path + "crosstab.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_8.checked = true then
		result = ds_1.SaveAs(fo_path + "Nested.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat Nested",Minimized!)
		
		if result = 1 then
			s= fo_path + "Nested.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_childrpt.checked = true then
		result = ds_1.GetChild('child_object', dwc_childrpt)
		
		if result = -1 THEN 
			MessageBox("Error", "Get Child error for DataWindowChild")
		else
			result = dwc_childrpt.SaveAs(fo_path + "child_rpt.fo", XSLFO!, TRUE)
			if result = 1 then result = run("xslpdf.bat child_rpt",Minimized!)
			if result = 1 then
				s= fo_path + "child_rpt.pdf"
				if FileExists(s) then
					cb_Openpdf.enabled = true
				else
					cb_Openpdf.enabled = false
				end if
			end if
		end if
	end if
end if

//Saving as PDF file
if rb_pdf.checked then
	//Checking for Method
	if rb_distill.checked = true then
		dw_1.Object.DataWindow.Export.PDF.Method = Distill!
	end if
	if rb_xslfo.checked = true then
		dw_1.Object.DataWindow.Export.PDF.Method = XSLFOP!
	end if
	if rb_1.checked = true then
		result = ds_1.SaveAs(fo_path + "table.pdf", PDF!, TRUE)
		
		if result = 1 then
			s = fo_path + "table.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_2.checked = true then
		result = ds_1.SaveAs(fo_path + "grid.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "grid.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_3.checked = true then
		result = ds_1.SaveAs(fo_path + "label.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "label.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_4.checked = true then
		result = ds_1.SaveAs(fo_path + "nup.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "nup.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_5.checked = true then
		result = ds_1.SaveAs(fo_path + "group.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "group.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_6.checked = true then
		result = ds_1.SaveAs(fo_path + "freeform.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "freeform.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_7.checked = true then
		result = ds_1.SaveAs(fo_path + "crosstab.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "crosstab.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_8.checked = true then
		result = dw_1.SaveAs(fo_path + "Nested.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "Nested.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_graph.checked = true then
		result = dw_1.SaveAs(fo_path + "graph.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "graph.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_composite.checked = true then
		result = dw_1.SaveAs(fo_path + "composite.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "composite.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_childrpt.checked = true then
		result = dw_1.GetChild('child_object', dwc_childrpt)
		if result = -1 THEN 
			MessageBox("Error", "Get Child error for DataWindowChild")
		else
			dwc_childrpt.SaveAs(fo_path + "child_rpt.pdf", PDF!, TRUE)
		
			if result = 1 then
				s= fo_path + "child_rpt.pdf"
				if FileExists(s) then
					cb_Openpdf.enabled = true
				else
					cb_Openpdf.enabled = false
				end if
			end if
		end if
	end if
end if
destroy ds_1
end event

type st_1 from statictext within w_convert_xslfo_pdf
integer x = 41
integer y = 448
integer width = 2267
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "To Change Column Property Select The Column and Right Mouse Click on it :"
boolean focusrectangle = false
end type

type rb_7 from radiobutton within w_convert_xslfo_pdf
integer x = 2162
integer y = 224
integer width = 366
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Crosstab"
end type

event clicked;rb_1.checked=false
rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_6.checked=false
rb_graph.checked = false
rb_composite.checked = false
rb_childrpt.checked = false
dw_1.dataobject = "d_crosstab"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()


end event

type rb_6 from radiobutton within w_convert_xslfo_pdf
integer x = 1705
integer y = 224
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Free Form"
end type

event clicked;rb_1.checked=false
rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_7.checked=false
rb_graph.checked = false
rb_composite.checked = false
rb_childrpt.checked = false
dw_1.dataobject = "d_freeform"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()


end event

type rb_5 from radiobutton within w_convert_xslfo_pdf
integer x = 1362
integer y = 224
integer width = 329
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Group"
end type

event clicked;rb_1.checked=false
rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_graph.checked = false
rb_composite.checked = false
rb_childrpt.checked = false
dw_1.dataobject = "d_group"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()


end event

type rb_4 from radiobutton within w_convert_xslfo_pdf
integer x = 1061
integer y = 224
integer width = 256
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "N-Up"
end type

event clicked;rb_1.checked=false
rb_2.checked=false
rb_3.checked=false
rb_5.checked=false
rb_graph.checked = false
rb_composite.checked = false
rb_childrpt.checked = false
dw_1.dataobject = "d_nup"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()


end event

type cb_openpdf from commandbutton within w_convert_xslfo_pdf
integer x = 704
integer y = 2148
integer width = 507
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Open PDF"
end type

event clicked;//string s,fo_path
//
//fo_path = ProfileString("xsl_fo.ini","XSLFO Path","path"," ")
//
//
//if rb_1.checked = true then
//		s= fo_path + "table.pdf"
//		ole_1.object.LoadFile(s)
//end if
//
//if rb_2.checked = true then
//		s= fo_path + "grid.pdf"
//		ole_1.object.LoadFile(s)
//end if
//
//if rb_3.checked = true then
//		s= fo_path + "label.pdf"
//		ole_1.object.LoadFile(s)
//end if
//
//if rb_4.checked = true then
//		s= fo_path + "nup.pdf"
//		ole_1.object.LoadFile(s)
//end if
//
//if rb_5.checked = true then
//		s= fo_path + "group.pdf"
//		ole_1.object.LoadFile(s)
//end if
//
//if rb_6.checked = true then
//		s= fo_path + "freeform.pdf"
//		ole_1.object.LoadFile(s)
//end if
//
//if rb_7.checked = true then
//		s= fo_path + "crosstab.pdf"
//		ole_1.object.LoadFile(s)
//end if
//
//if rb_8.checked = true then
//		s= fo_path + "Nested.pdf"
//		ole_1.object.LoadFile(s)
//end if
//
//if rb_graph.checked = true then
//		s= fo_path + "graph.pdf"
//		ole_1.object.LoadFile(s)
//end if
//
//if rb_composite.checked = true then
//		s= fo_path + "composite.pdf"
//		ole_1.object.LoadFile(s)
//end if
//
//if rb_childrpt.checked = true then
//		s= fo_path + "child_rpt.pdf"
//		ole_1.object.LoadFile(s)
//end if
//
end event

type rb_3 from radiobutton within w_convert_xslfo_pdf
integer x = 704
integer y = 224
integer width = 347
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Label"
end type

event clicked;rb_1.checked=false
rb_2.checked=false
rb_4.checked=false
rb_5.checked=false
rb_graph.checked = false
rb_composite.checked = false
rb_childrpt.checked = false
dw_1.dataobject = "d_label"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()


end event

type rb_2 from radiobutton within w_convert_xslfo_pdf
integer x = 434
integer y = 224
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grid"
end type

event clicked;rb_1.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_graph.checked = false
rb_composite.checked = false
rb_childrpt.checked = false
dw_1.dataobject = "d_grid"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()

end event

type rb_1 from radiobutton within w_convert_xslfo_pdf
integer x = 73
integer y = 224
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tabular"
end type

event clicked;rb_2.checked=false
rb_3.checked=false
rb_4.checked=false
rb_5.checked=false
rb_graph.checked = false
rb_composite.checked = false
rb_childrpt.checked = false
dw_1.dataobject = "d_tabular"
dw_1.SettransObject(SQLCA)
dw_1.retrieve()
end event

type cb_close from commandbutton within w_convert_xslfo_pdf
integer x = 3995
integer y = 2144
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;close(w_convert_xslfo_pdf)
end event

type cb_convpdf from commandbutton within w_convert_xslfo_pdf
integer x = 27
integer y = 2148
integer width = 631
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Convert To PDF"
end type

event clicked;integer result,i
string s,fo_path
DataWindowChild dwc_childrpt

cb_Openpdf.enabled = false
fo_path = ProfileString("xsl_fo.ini","XSLFO Path","path","c:\")
//messagebox("fo_path",fo_path)
//Saving as XSL-FO
if rb_xsl.checked then
//graph
	if rb_1.checked = true then
		result = dw_1.SaveAs(fo_path + "table.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat table",Minimized!)
		
		if result = 1 then
			s = fo_path + "table.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_2.checked = true then
		result = dw_1.SaveAs(fo_path + "grid.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat grid",Minimized!)
		
		if result = 1 then
			s= fo_path + "grid.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_3.checked = true then
		result = dw_1.SaveAs(fo_path + "label.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat label",Minimized!)
		
		if result = 1 then
			s= fo_path + "label.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_4.checked = true then
		result = dw_1.SaveAs(fo_path + "nup.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat nup",Minimized!)
		
		if result = 1 then
			s= fo_path + "nup.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_5.checked = true then
		result = dw_1.SaveAs(fo_path + "group.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat group",Minimized!)
		
		if result = 1 then
			s= fo_path + "group.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_6.checked = true then
		result = dw_1.SaveAs(fo_path + "freeform.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat freeform",Minimized!)
		
		if result = 1 then
			s= fo_path + "freeform.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_7.checked = true then
		result = dw_1.SaveAs(fo_path + "crosstab.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat crosstab",Minimized!)
		
		if result = 1 then
			s= fo_path + "crosstab.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_8.checked = true then
		result = dw_1.SaveAs(fo_path + "Nested.fo", XSLFO!, TRUE)
		//convert fo file to pdf
		result = run("xslpdf.bat Nested",Minimized!)
		
		if result = 1 then
			s= fo_path + "Nested.pdf"
			if not FileExists(s) then 
					sleep(3)
			end if
			
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_childrpt.checked = true then
		result = dw_1.GetChild('child_object', dwc_childrpt)
		
		if result = -1 THEN 
			MessageBox("Error", "Get Child error for DataWindowChild")
		else
			result = dwc_childrpt.SaveAs(fo_path + "child_rpt.fo", XSLFO!, TRUE)
			if result = 1 then result = run("xslpdf.bat child_rpt",Minimized!)
			if result = 1 then
				s= fo_path + "child_rpt.pdf"
				if FileExists(s) then
					cb_Openpdf.enabled = true
				else
					cb_Openpdf.enabled = false
				end if
			end if
		end if
	end if
//	if rb_graph.checked = true then
//		result = dw_1.SaveAs(fo_path + "graph.fo", XSLFO!, TRUE)
//		//convert fo file to pdf
//		result = run("xslpdf.bat graph",Minimized!)
//		
//		if result = 1 then
//			s= fo_path + "graph.pdf"
//			if not FileExists(s) then 
//					sleep(3)
//			end if
//			
//			if FileExists(s) then
//				cb_Openpdf.enabled = true
//			else
//				cb_Openpdf.enabled = false
//			end if
//		end if
//	end if
end if
//Saving as PDF
if rb_pdf.checked then
	//Checking for Method
	if rb_distill.checked = true then
		dw_1.Object.DataWindow.Export.PDF.Method = Distill!
		fo_path = fo_path +"Distill\"
	end if
	if rb_xslfo.checked = true then
		dw_1.Object.DataWindow.Export.PDF.Method = XSLFOP!
		fo_path = fo_path +"XSLFOP\"
	end if
	createDirectory(fo_path)
//int iCreateDir
//	iCreateDir = createDirectory(fo_path)
//	messagebox("iCreateDir",iCreateDir)
//	messagebox("fo_path",fo_path)
	
	if rb_1.checked = true then
		result = dw_1.SaveAs(fo_path + "table.pdf", PDF!, TRUE)
		
		if result = 1 then
			s = fo_path + "table.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_2.checked = true then
		result = dw_1.SaveAs(fo_path + "grid.pdf", PDF!, TRUE)
		if result = 1 then
			s= fo_path + "grid.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_3.checked = true then
		result = dw_1.SaveAs(fo_path + "label.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "label.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_4.checked = true then
		result = dw_1.SaveAs(fo_path + "nup.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "nup.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	
	if rb_5.checked = true then
		result = dw_1.SaveAs(fo_path + "group.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "group.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_6.checked = true then
		result = dw_1.SaveAs(fo_path + "freeform.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "freeform.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_7.checked = true then
		result = dw_1.SaveAs(fo_path + "crosstab.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "crosstab.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_8.checked = true then
		result = dw_1.SaveAs(fo_path + "Nested.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "Nested.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_graph.checked = true then
		result = dw_1.SaveAs(fo_path + "graph.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "graph.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_composite.checked = true then
		result = dw_1.SaveAs(fo_path + "composite.pdf", PDF!, TRUE)
		
		if result = 1 then
			s= fo_path + "composite.pdf"
			if FileExists(s) then
				cb_Openpdf.enabled = true
			else
				cb_Openpdf.enabled = false
			end if
		end if
	end if
	if rb_childrpt.checked = true then
		
		result = dw_1.GetChild('child_object', dwc_childrpt)
		if result = -1 THEN 
			MessageBox("Error", "Get Child error for DataWindowChild")
		else
			result = dwc_childrpt.SaveAs(fo_path + "child_rpt.pdf", PDF!, TRUE)
		
			if result = 1 then
				s= fo_path + "child_rpt.pdf"
				if FileExists(s) then
					cb_Openpdf.enabled = true
				else
					cb_Openpdf.enabled = false
				end if
			end if
		end if
	end if
end if
end event

type dw_1 from datawindow within w_convert_xslfo_pdf
integer x = 37
integer y = 528
integer width = 4434
integer height = 1552
integer taborder = 10
string title = "none"
string dataobject = "d_deptment"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;str_colproperties str_dwoprop

string s
s=dwo.name

if dwo.Type = "column" then
	if rb_7.checked then
		if s <> "emp_lname" then
			if s <> "emp_fname" then
				return
			end if
		end if
	end if
	str_dwoprop.txtcolor = string(dwo.Color)
	str_dwoprop.bgcolor = string(dwo.Background.Color)
	str_dwoprop.alignment = string(dwo.Alignment)
	str_dwoprop.border = string(dwo.Border)
	str_dwoprop.font = string(dwo.Font.Face)
	str_dwoprop.bold = string(dwo.Font.Weight)
	str_dwoprop.italic = string(dwo.Font.italic)
	str_dwoprop.underline = string(dwo.Font.underline)
	str_dwoprop.strikeout = string(dwo.Font.strikethrough)
	str_dwoprop.size = string(dwo.Font.Height)
	
	//messagebox("",string(str_dwoprop.font))
	OpenWithParm(w_set_col_property, str_dwoprop)

	str_dwoprop = Message.PowerObjectParm
		
	dwo.color = long(str_dwoprop.txtcolor)
	dwo.Background.Color = long(str_dwoprop.bgcolor)
	dwo.Alignment = long(str_dwoprop.alignment)
	dwo.Border = long(str_dwoprop.border)
	dwo.Font.Face = str_dwoprop.font
	dwo.Font.Weight = long(str_dwoprop.bold)
	dwo.Font.italic = long(str_dwoprop.italic)
	dwo.Font.underline = long(str_dwoprop.underline)
	dwo.Font.strikethrough = long(str_dwoprop.strikeout)
	dwo.Font.Height = long(str_dwoprop.size)
	
else
	return
End if



end event

type gb_1 from groupbox within w_convert_xslfo_pdf
integer x = 37
integer y = 160
integer width = 4430
integer height = 272
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
end type

type gb_2 from groupbox within w_convert_xslfo_pdf
integer x = 37
integer width = 1248
integer height = 152
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
end type

type gb_3 from groupbox within w_convert_xslfo_pdf
integer x = 1353
integer width = 1102
integer height = 152
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
end type

