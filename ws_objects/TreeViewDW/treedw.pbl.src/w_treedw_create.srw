$PBExportHeader$w_treedw_create.srw
forward
global type w_treedw_create from window
end type
type cb_5 from commandbutton within w_treedw_create
end type
type cbx_1 from checkbox within w_treedw_create
end type
type cb_4 from uo_saveas within w_treedw_create
end type
type cb_3 from commandbutton within w_treedw_create
end type
type cb_2 from commandbutton within w_treedw_create
end type
type cb_1 from commandbutton within w_treedw_create
end type
type cb_pdf from commandbutton within w_treedw_create
end type
type cb_rowcount from commandbutton within w_treedw_create
end type
type cb_close from commandbutton within w_treedw_create
end type
type ddlb_mode from dropdownlistbox within w_treedw_create
end type
type dw_1 from datawindow within w_treedw_create
end type
type cb_createdw from commandbutton within w_treedw_create
end type
end forward

global type w_treedw_create from window
integer width = 4178
integer height = 2580
boolean titlebar = true
string title = "TreeViewDW Create"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_5 cb_5
cbx_1 cbx_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_pdf cb_pdf
cb_rowcount cb_rowcount
cb_close cb_close
ddlb_mode ddlb_mode
dw_1 dw_1
cb_createdw cb_createdw
end type
global w_treedw_create w_treedw_create

type variables
integer i_mode=1
string is_pdfname
end variables

on w_treedw_create.create
this.cb_5=create cb_5
this.cbx_1=create cbx_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_pdf=create cb_pdf
this.cb_rowcount=create cb_rowcount
this.cb_close=create cb_close
this.ddlb_mode=create ddlb_mode
this.dw_1=create dw_1
this.cb_createdw=create cb_createdw
this.Control[]={this.cb_5,&
this.cbx_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_pdf,&
this.cb_rowcount,&
this.cb_close,&
this.ddlb_mode,&
this.dw_1,&
this.cb_createdw}
end on

on w_treedw_create.destroy
destroy(this.cb_5)
destroy(this.cbx_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_pdf)
destroy(this.cb_rowcount)
destroy(this.cb_close)
destroy(this.ddlb_mode)
destroy(this.dw_1)
destroy(this.cb_createdw)
end on

event open;dw_1.setTransObject(SQLCA)
dw_1.retrieve()
end event

type cb_5 from commandbutton within w_treedw_create
integer x = 2002
integer y = 208
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF"
end type

event clicked;OpenWithparm( w_newfeature,dw_1)
end event

type cbx_1 from checkbox within w_treedw_create
integer x = 1536
integer y = 220
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

type cb_4 from uo_saveas within w_treedw_create
integer x = 1083
integer y = 212
integer taborder = 20
end type

event clicked;call super::clicked;of_saveas(dw_1,cbx_1.checked)  
end event

type cb_3 from commandbutton within w_treedw_create
integer x = 3685
integer y = 68
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;dw_1.dataobject="d_dept_test"
dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type cb_2 from commandbutton within w_treedw_create
integer x = 2784
integer y = 72
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print"
end type

event clicked;dw_1.print()
end event

type cb_1 from commandbutton within w_treedw_create
integer x = 1042
integer y = 68
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ChgDW"
end type

event clicked;integer li_ret
string ls_dwsyntax,ls_presentation,ls_error
string ls_sql

dw_1.dataobject=""
choose case i_mode
	case 1
		dw_1.dataObject = "d_treeview_demo_simple"
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 2
			Messagebox("","Pls select the item which index > 3")
	case 3
			Messagebox("","Pls select the item which index > 3")
	case 4
		dw_1.dataObject = "d_treeview_controls"
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(200,'F')<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 5
		dw_1.dataObject = "d_treeview_controls2"
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(200,'F')<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 6
		dw_1.dataObject = "d_treeview_quickselect"
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 7
		dw_1.dataObject = "d_treeview_query"
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 8
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 9
		dw_1.dataObject = "d_treeview_sp"
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 10
		dw_1.dataobject="d_treeview_controls_grid"
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 11
		dw_1.dataObject = "d_treeview_dept"
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 12
		dw_1.dataObject = "d_tree_454606"
//		dw_1.settransobject(sqlca)
//		if dw_1.retrieve()<=0 then
//			Messagebox("","Retrieve failed"+ls_error)
//		end if	
end choose

end event

type cb_pdf from commandbutton within w_treedw_create
integer x = 2327
integer y = 68
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Saveas"
end type

event clicked;int ret
string ls_return
is_pdfname=is_pdfname+".pdf"
//ret=dw_1.saveas(is_pdfname,PDF!,true)

//ls_return = dw_1.modify("DataWindow.Export.PDF.Method=NativePDF!")
//dw_1.Object.DataWindow.Export.PDF.method = "NativePDF!"
//dw_1.Object.DataWindow.Export.PDF.Method =  XSLFOP!
ls_return = dw_1.describe("DataWindow.Export.PDF.Method")

//if lower(ls_return) <> 'nativepdf!' then
//	dw_1.modify("DataWindow.Export.PDF.Method=NativePDF!")
//	
//end if
//messagebox('',ls_return)
//dw_1.object.datawindow.export.pdf.method = distill!
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

dw_1.object.datawindow.export.pdf.method =nativepdf!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
dw_1.saveas( )

end event

type cb_rowcount from commandbutton within w_treedw_create
integer x = 1902
integer y = 68
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "RowCount"
end type

event clicked;long ret

ret=dw_1.rowcount()
Messagebox("Return",string(ret))
end event

type cb_close from commandbutton within w_treedw_create
integer x = 3246
integer y = 68
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(parent)
end event

type ddlb_mode from dropdownlistbox within w_treedw_create
integer x = 87
integer y = 76
integer width = 891
integer height = 644
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"CreateBySql","CreateByInvalidSyntax","CreateByValidSyntax","CreateByLibExport_Controls1","CreateByLibExport_Controls2","CreateByLibExport_quickselect","CreateByLibExport_query","CreateByLibExport_external","CreateByLibExport_sp","CreateByLibExport_Controls_Grid","d_treeview_dept","d_tree_454606"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;i_mode=index
is_pdfname=this.text

end event

type dw_1 from datawindow within w_treedw_create
integer x = 78
integer y = 420
integer width = 3977
integer height = 2036
integer taborder = 20
string title = "none"
string dataobject = "bbb"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;m_popup mymenu

mymenu = create m_popup 
//messagebox("",PixelsToUnits(xpos, XPixelsToUnits! ))
mymenu.PopMenu (PixelsToUnits(xpos , XPixelsToUnits! ) + this.x, PixelsToUnits(ypos, YPixelsToUnits! ) +this.y)
end event

event buttonclicked;Messagebox("ButtonClicked triggered",string(row)+":"+string(actionreturncode))
end event

type cb_createdw from commandbutton within w_treedw_create
integer x = 1486
integer y = 68
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CreateDW"
end type

event clicked;integer li_ret
string ls_dwsyntax,ls_presentation,ls_error
string ls_sql

dw_1.dataobject=""
choose case i_mode
	case 1
		ls_sql="SELECT department.dept_name,  "& 
                   +"employee.city, sum(employee.salary), count(employee.emp_id)  "&
                   +" FROM {oj department LEFT OUTER JOIN employee ON department.dept_id = employee.dept_id} " &
				 +" WHERE ( employee.emp_id >= 200 ) AND "  &  
                   +"  ( employee.sex = 'F' ) "  &
                   +"  GROUP BY department.dept_name,employee.city "  &  
                   +"   HAVING ( sum(employee.salary) >= 1000 )   "  &
                   +"  ORDER BY employee.city ASC "
          ls_presentation= " Style(type=Form)"
       	 ls_dwsyntax= SQLCA.SyntaxFromSql(ls_sql,ls_presentation,ls_error)
		 if len(ls_error)>0 then
			Messagebox("",ls_error)
		end if
		li_ret=dw_1.create(ls_dwsyntax)
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed")
		end if
	case 2
		ls_dwsyntax=f_readfile("treeviewdw_syntax_invalid.txt")
		li_ret=dw_1.create(ls_dwsyntax,ls_error)
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed:"+ls_error)
		end if
	case 3
		ls_dwsyntax=f_readfile("treeviewdw_syntax_valid.txt")
		li_ret=dw_1.create(ls_dwsyntax,ls_error)
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if
	case 4
		ls_dwsyntax = LibraryExport("treedw.pbl", "d_treeview_controls", ExportDataWindow!)
         dw_1.Create(ls_dwsyntax, ls_error)
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(200,'F')<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 5
		ls_dwsyntax = LibraryExport("treedw.pbl", "d_treeview_controls2", ExportDataWindow!)
         dw_1.Create(ls_dwsyntax, ls_error)
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(200,'F')<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 6
		ls_dwsyntax = LibraryExport("treedw.pbl", "d_treeview_quickselect", ExportDataWindow!)
         dw_1.Create(ls_dwsyntax, ls_error)
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 7
		ls_dwsyntax = LibraryExport("treedw.pbl", "d_treeview_query", ExportDataWindow!)
         dw_1.Create(ls_dwsyntax, ls_error)
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 8
		ls_dwsyntax = LibraryExport("treedw.pbl", "d_treeview_external", ExportDataWindow!)
         dw_1.Create(ls_dwsyntax, ls_error)
	
	case 9
		ls_dwsyntax = LibraryExport("treedw.pbl", "d_treeview_sp", ExportDataWindow!)
         dw_1.Create(ls_dwsyntax, ls_error)
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 10
		ls_dwsyntax = LibraryExport("treedw.pbl", "d_treeview_controls_grid", ExportDataWindow!)
         dw_1.Create(ls_dwsyntax, ls_error)
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 11
		ls_dwsyntax = LibraryExport("treedw.pbl", "d_treeview_dept", ExportDataWindow!)
//		messagebox("111", ls_dwsyntax)
		li_ret = dw_1.Create(ls_dwsyntax, ls_error)
//		messagebox(string(li_ret), ls_error)
		dw_1.settransobject(sqlca)
		if dw_1.retrieve()<=0 then
			Messagebox("","Retrieve failed"+ls_error)
		end if	
	case 12
			ls_dwsyntax = LibraryExport("treedw.pbl", "d_tree_454606", ExportDataWindow!)
         dw_1.Create(ls_dwsyntax, ls_error)
end choose

end event

