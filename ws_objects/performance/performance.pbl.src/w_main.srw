$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_8 from commandbutton within w_main
end type
type cb_11 from commandbutton within w_main
end type
type cb_7 from commandbutton within w_main
end type
type cb_6 from commandbutton within w_main
end type
type cb_5 from uo_saveas within w_main
end type
type cbx_3 from checkbox within w_main
end type
type cbx_2 from checkbox within w_main
end type
type cbx_1 from checkbox within w_main
end type
type cb_4 from commandbutton within w_main
end type
type em_5 from editmask within w_main
end type
type st_4 from statictext within w_main
end type
type em_4 from editmask within w_main
end type
type st_3 from statictext within w_main
end type
type em_3 from editmask within w_main
end type
type st_2 from statictext within w_main
end type
type em_2 from editmask within w_main
end type
type st_1 from statictext within w_main
end type
type cb_3 from commandbutton within w_main
end type
type cb_2 from commandbutton within w_main
end type
type em_1 from editmask within w_main
end type
type cb_1 from commandbutton within w_main
end type
type dw_1 from datawindow within w_main
end type
type gb_1 from groupbox within w_main
end type
end forward

global type w_main from window
integer width = 3424
integer height = 2460
boolean titlebar = true
string title = "Performance"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_8 cb_8
cb_11 cb_11
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
cb_4 cb_4
em_5 em_5
st_4 st_4
em_4 em_4
st_3 st_3
em_3 em_3
st_2 st_2
em_2 em_2
st_1 st_1
cb_3 cb_3
cb_2 cb_2
em_1 em_1
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_main w_main

on w_main.create
this.cb_8=create cb_8
this.cb_11=create cb_11
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.cb_4=create cb_4
this.em_5=create em_5
this.st_4=create st_4
this.em_4=create em_4
this.st_3=create st_3
this.em_3=create em_3
this.st_2=create st_2
this.em_2=create em_2
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.em_1=create em_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_8,&
this.cb_11,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.cb_4,&
this.em_5,&
this.st_4,&
this.em_4,&
this.st_3,&
this.em_3,&
this.st_2,&
this.em_2,&
this.st_1,&
this.cb_3,&
this.cb_2,&
this.em_1,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_main.destroy
destroy(this.cb_8)
destroy(this.cb_11)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.cb_4)
destroy(this.em_5)
destroy(this.st_4)
destroy(this.em_4)
destroy(this.st_3)
destroy(this.em_3)
destroy(this.st_2)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.em_1)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;f_test(1)
end event

type cb_8 from commandbutton within w_main
integer x = 1902
integer y = 2232
integer width = 402
integer height = 112
integer taborder = 110
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

type cb_11 from commandbutton within w_main
integer x = 133
integer y = 2756
integer width = 402
integer height = 112
integer taborder = 110
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

type cb_7 from commandbutton within w_main
integer x = 581
integer y = 2216
integer width = 457
integer height = 132
integer taborder = 100
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "printSetup"
end type

event clicked;printsetup()
end event

type cb_6 from commandbutton within w_main
integer x = 1202
integer y = 2212
integer width = 457
integer height = 132
integer taborder = 100
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "print"
end type

event clicked;dw_1.print()
end event

type cb_5 from uo_saveas within w_main
integer x = 485
integer y = 1924
integer taborder = 90
end type

event clicked;call super::clicked;
long ll_start, ll_used

//ll_start = Cpu()
of_saveas(dw_1,cbx_3.checked)  
//ll_used = Cpu() - ll_start
//messagebox("",ll_used)
//messagebox("",ll_used)


end event

type cbx_3 from checkbox within w_main
integer x = 160
integer y = 1944
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
string text = "pb"
end type

type cbx_2 from checkbox within w_main
integer x = 3141
integer y = 1968
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
string text = "none"
end type

type cbx_1 from checkbox within w_main
integer x = 1115
integer y = 1564
integer width = 370
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "3D-Look"
boolean checked = true
end type

event clicked;//<DW Control Name>.Object.<Columnname>.CheckBox.3D='<Yes or No>'
//<DW Control Name>.Object.<Columnname>.RadioButtons.3D='<Yes or No>'\

string ls_modify,ls_yes,ls_error

if this.checked then
	ls_modify = "s_radio.radiobuttons.3d='yes' s_radio.radiobuttons.lefttext='yes' s_check.checkbox.3d='yes' s_check.checkbox.lefttext='yes' "
else
	ls_modify = "s_radio.radiobuttons.3d='no' s_radio.radiobuttons.scale='yes' s_radio.radiobuttons.lefttext='no' s_check.checkbox.3d='no' s_check.checkbox.lefttext='no' "
end if

ls_error = dw_1.modify(ls_modify)

if len(ls_error) > 0 then
	messagebox("Error",ls_error)
end if

end event

type cb_4 from commandbutton within w_main
integer x = 2670
integer y = 1560
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Margin"
end type

event clicked;string ls_modify,ls_error

ls_modify = "DataWindow.Print.Margin.Right='"+em_3.text+"' "
ls_modify += "DataWindow.Print.Margin.left='"+em_2.text+"' "
ls_modify += "DataWindow.Print.Margin.top='"+em_5.text+"' "
ls_modify += "DataWindow.Print.Margin.bottom='"+em_4.text+"' "

ls_error = dw_1.modify(ls_modify)

if len(trim(ls_error)) > 0 then
	messagebox("Error",ls_error)
end if

end event

type em_5 from editmask within w_main
integer x = 2779
integer y = 1736
integer width = 343
integer height = 132
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "50"
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
double increment = 10
end type

type st_4 from statictext within w_main
integer x = 2423
integer y = 1768
integer width = 379
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TopMargin"
boolean focusrectangle = false
end type

type em_4 from editmask within w_main
integer x = 2062
integer y = 1736
integer width = 343
integer height = 132
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "50"
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
double increment = 10
end type

type st_3 from statictext within w_main
integer x = 1582
integer y = 1768
integer width = 466
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "BottomMargin"
boolean focusrectangle = false
end type

type em_3 from editmask within w_main
integer x = 1239
integer y = 1736
integer width = 343
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "50"
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
double increment = 10
end type

type st_2 from statictext within w_main
integer x = 846
integer y = 1768
integer width = 402
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "RightMargin"
boolean focusrectangle = false
end type

type em_2 from editmask within w_main
integer x = 434
integer y = 1736
integer width = 347
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "50"
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
double increment = 10
end type

type st_1 from statictext within w_main
integer x = 101
integer y = 1768
integer width = 379
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "LeftMargin"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_main
integer x = 1495
integer y = 1560
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Reset"
end type

event clicked;dw_1.reset()
end event

type cb_2 from commandbutton within w_main
integer x = 2112
integer y = 1560
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Saveas"
end type

event clicked;
//dw_1.object.datawindow.export.pdf.method = distill!
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
dw_1.object.datawindow.export.pdf.method =nativepdf!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
dw_1.saveas()
end event

type em_1 from editmask within w_main
integer x = 585
integer y = 1556
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "1000"
borderstyle borderstyle = stylelowered!
string mask = "#####"
end type

type cb_1 from commandbutton within w_main
integer x = 78
integer y = 1560
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "insert"
end type

event clicked;long ll_count,ll_num,ll_row
dec{2} ldec_data
string ls_name,ls_ra,ls_check,ls_ddlb
datetime ldt_data
str_data lstr_1
this.enabled = false
setpointer(hourglass!)
for ll_count = 1 to long(em_1.text)
	ls_name = "Test_name"+string(ll_count)
	ldec_data = ll_count * 1.023
	if mod(ll_count,2) = 0 then
		ls_ra = "1"
		ls_check = "1"
		ls_ddlb = "1"
	else
		ls_ra = "2"
		ls_check = "2"
		ls_ddlb = "2"
	end if
	ldt_data = datetime(today(),now())
	lstr_1.s_name = ls_name
	lstr_1.l_num = ll_count
	lstr_1.d_num = ldec_data
	lstr_1.s_1 = ls_ra
	lstr_1.s_2 = ls_check
	lstr_1.s_3 = ls_ddlb
	lstr_1.dt_1 = ldt_data
	ll_row = dw_1.insertrow(0)
	dw_1.object.data[ll_row] = lstr_1
next

this.enabled = true
setpointer(arrow!)
end event

type dw_1 from datawindow within w_main
integer width = 3154
integer height = 1448
integer taborder = 10
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

event constructor;this.dataobject = "d_performance_bak"
end event

type gb_1 from groupbox within w_main
integer y = 1448
integer width = 3150
integer height = 720
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

