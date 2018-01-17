$PBExportHeader$w_gradtrans.srw
forward
global type w_gradtrans from window
end type
type cb_9 from commandbutton within w_gradtrans
end type
type cb_8 from commandbutton within w_gradtrans
end type
type tab_1 from tab within w_gradtrans
end type
type tabpage_1 from userobject within tab_1
end type
type cb_7 from commandbutton within tabpage_1
end type
type cb_4 from uo_saveas within tabpage_1
end type
type cbx_1 from checkbox within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type uo_1 from uo_datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_7 cb_7
cb_4 cb_4
cbx_1 cbx_1
cb_1 cb_1
dw_1 dw_1
uo_1 uo_1
end type
type tabpage_2 from userobject within tab_1
end type
type cbx_2 from checkbox within tabpage_2
end type
type cb_5 from uo_saveas within tabpage_2
end type
type cb_2 from commandbutton within tabpage_2
end type
type dw_2 from datawindow within tabpage_2
end type
type uo_2 from uo_datawindowband within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cbx_2 cbx_2
cb_5 cb_5
cb_2 cb_2
dw_2 dw_2
uo_2 uo_2
end type
type tabpage_3 from userobject within tab_1
end type
type cb_6 from uo_saveas within tabpage_3
end type
type cbx_3 from checkbox within tabpage_3
end type
type cb_3 from commandbutton within tabpage_3
end type
type dw_3 from datawindow within tabpage_3
end type
type uo_3 from uo_datawindowcolumn within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_6 cb_6
cbx_3 cbx_3
cb_3 cb_3
dw_3 dw_3
uo_3 uo_3
end type
type tab_1 from tab within w_gradtrans
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
end forward

global type w_gradtrans from window
integer width = 4713
integer height = 3344
boolean titlebar = true
string title = "DataWindow Gradiant and Transparent"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
integer animationtime = 1000
cb_9 cb_9
cb_8 cb_8
tab_1 tab_1
end type
global w_gradtrans w_gradtrans

type variables
datawindow idw_1
end variables

forward prototypes
public subroutine wf_saveas (datawindow adw)
end prototypes

public subroutine wf_saveas (datawindow adw);adw.saveas()
end subroutine

on w_gradtrans.create
this.cb_9=create cb_9
this.cb_8=create cb_8
this.tab_1=create tab_1
this.Control[]={this.cb_9,&
this.cb_8,&
this.tab_1}
end on

on w_gradtrans.destroy
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.tab_1)
end on

event open;
tab_1.tabpage_2.uo_2.idw = tab_1.tabpage_2.dw_2
tab_1.tabpage_2.dw_2.Settransobject(sqlca)
tab_1.tabpage_2.dw_2.Retrieve()
tab_1.tabpage_2.uo_2.uf_initialize_band()
tab_1.tabpage_2.uo_2.uf_initialize()
//tab_1.tabpage_2.uo_2.idw.Modify("DataWindow.Header.color="+string(custom[1]))
			
tab_1.tabpage_3.uo_3.idw = tab_1.tabpage_3.dw_3
tab_1.tabpage_3.dw_3.Settransobject(sqlca)
tab_1.tabpage_3.dw_3.Retrieve()
//tab_1.tabpage_3.uo_3.uf_initialize()			

tab_1.tabpage_1.uo_1.idw = tab_1.tabpage_1.dw_1
tab_1.tabpage_1.dw_1.Settransobject(sqlca)
tab_1.tabpage_1.dw_1.Retrieve()
tab_1.tabpage_1.uo_1.uf_initialize()

end event

type cb_9 from commandbutton within w_gradtrans
integer x = 1042
integer y = 2796
integer width = 352
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New PDF"
end type

event clicked;OpenWithparm( w_newfeature,idw_1)
end event

type cb_8 from commandbutton within w_gradtrans
integer x = 3488
integer y = 2800
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "print"
end type

event clicked;tab_1.tabpage_1.dw_1.Print()
end event

type tab_1 from tab within w_gradtrans
integer width = 4635
integer height = 3036
integer taborder = 10
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean focusonbuttondown = true
tabposition tabposition = tabsonright!
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event selectionchanged;//if newindex = 3 then
//	
//	
//	sleep(3)
//	
//end if

choose case newindex
	case 1
		idw_1 = tab_1.tabpage_1.dw_1
	case 2 
		idw_1 = tab_1.tabpage_2.dw_2
	case 3
		idw_1 = tab_1.tabpage_3.dw_3
end choose
		
		


end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 16
integer width = 4457
integer height = 3004
long backcolor = 67108864
string text = "DataWindow"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_7 cb_7
cb_4 cb_4
cbx_1 cbx_1
cb_1 cb_1
dw_1 dw_1
uo_1 uo_1
end type

on tabpage_1.create
this.cb_7=create cb_7
this.cb_4=create cb_4
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.uo_1=create uo_1
this.Control[]={this.cb_7,&
this.cb_4,&
this.cbx_1,&
this.cb_1,&
this.dw_1,&
this.uo_1}
end on

on tabpage_1.destroy
destroy(this.cb_7)
destroy(this.cb_4)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.uo_1)
end on

type cb_7 from commandbutton within tabpage_1
integer x = 3013
integer y = 2788
integer width = 402
integer height = 112
integer taborder = 60
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

type cb_4 from uo_saveas within tabpage_1
integer x = 2345
integer y = 2716
integer taborder = 50
end type

event clicked;call super::clicked;of_saveas(dw_1,cbx_1.checked)
end event

type cbx_1 from checkbox within tabpage_1
integer x = 1920
integer y = 2736
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
string text = "pb"
end type

type cb_1 from commandbutton within tabpage_1
integer x = 1477
integer y = 2704
integer width = 352
integer height = 104
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Saveas"
end type

event clicked;dw_1.object.datawindow.export.pdf.method =nativepdf!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
//dw_1.object.datawindow.export.pdf.method = distill!
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
//dw_1.saveas()

dw_1.saveas("C:\Users\appeon\Desktop\print\graph5.pdf",pdf!,false)
end event

type dw_1 from datawindow within tabpage_1
integer x = 1472
integer y = 48
integer width = 2944
integer height = 2652
integer taborder = 20
string title = "none"
string dataobject = "d_freeform"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_1 from uo_datawindow within tabpage_1
integer x = 64
integer y = 16
integer width = 1403
integer height = 2800
integer taborder = 30
end type

on uo_1.destroy
call uo_datawindow::destroy
end on

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 4457
integer height = 3004
long backcolor = 67108864
string text = "Band"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cbx_2 cbx_2
cb_5 cb_5
cb_2 cb_2
dw_2 dw_2
uo_2 uo_2
end type

on tabpage_2.create
this.cbx_2=create cbx_2
this.cb_5=create cb_5
this.cb_2=create cb_2
this.dw_2=create dw_2
this.uo_2=create uo_2
this.Control[]={this.cbx_2,&
this.cb_5,&
this.cb_2,&
this.dw_2,&
this.uo_2}
end on

on tabpage_2.destroy
destroy(this.cbx_2)
destroy(this.cb_5)
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.uo_2)
end on

type cbx_2 from checkbox within tabpage_2
integer x = 2533
integer y = 2716
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
string text = "pb"
end type

type cb_5 from uo_saveas within tabpage_2
integer x = 1952
integer y = 2700
integer taborder = 60
end type

event clicked;call super::clicked;of_saveas(dw_2,cbx_2.checked)  
end event

type cb_2 from commandbutton within tabpage_2
integer x = 1440
integer y = 2676
integer width = 393
integer height = 128
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Saveas"
end type

event clicked;dw_2.object.datawindow.export.pdf.method =nativepdf!
dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
dw_2.saveas()
end event

type dw_2 from datawindow within tabpage_2
integer x = 1445
integer y = 32
integer width = 2971
integer height = 2652
integer taborder = 30
string title = "none"
string dataobject = "d_group"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_2 from uo_datawindowband within tabpage_2
event destroy ( )
integer x = 27
integer y = 12
integer height = 2456
integer taborder = 10
end type

on uo_2.destroy
call uo_datawindowband::destroy
end on

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 4457
integer height = 3004
long backcolor = 67108864
string text = "Control"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_6 cb_6
cbx_3 cbx_3
cb_3 cb_3
dw_3 dw_3
uo_3 uo_3
end type

on tabpage_3.create
this.cb_6=create cb_6
this.cbx_3=create cbx_3
this.cb_3=create cb_3
this.dw_3=create dw_3
this.uo_3=create uo_3
this.Control[]={this.cb_6,&
this.cbx_3,&
this.cb_3,&
this.dw_3,&
this.uo_3}
end on

on tabpage_3.destroy
destroy(this.cb_6)
destroy(this.cbx_3)
destroy(this.cb_3)
destroy(this.dw_3)
destroy(this.uo_3)
end on

type cb_6 from uo_saveas within tabpage_3
integer x = 2098
integer y = 2688
integer taborder = 60
end type

event clicked;call super::clicked;of_saveas(dw_3,cbx_3.checked)  
end event

type cbx_3 from checkbox within tabpage_3
integer x = 1829
integer y = 2692
integer width = 517
integer height = 112
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "pb"
end type

type cb_3 from commandbutton within tabpage_3
integer x = 1385
integer y = 2680
integer width = 398
integer height = 128
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Saveas"
end type

event clicked;dw_3.object.datawindow.export.pdf.method =nativepdf!
dw_3.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
dw_3.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
dw_3.saveas()
end event

type dw_3 from datawindow within tabpage_3
integer x = 1390
integer y = 36
integer width = 3035
integer height = 2644
integer taborder = 30
string title = "none"
string dataobject = "d_tabular_control"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;
uo_3.dwc_name = dwo.name
//messagebox("",uo_3.dwc_name)
end event

type uo_3 from uo_datawindowcolumn within tabpage_3
event destroy ( )
integer x = 5
integer width = 1367
integer height = 2684
integer taborder = 10
end type

on uo_3.destroy
call uo_datawindowcolumn::destroy
end on

