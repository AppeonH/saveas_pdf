$PBExportHeader$win_rapport.srw
forward
global type win_rapport from window
end type
type cb_9 from commandbutton within win_rapport
end type
type cb_8 from commandbutton within win_rapport
end type
type cb_7 from uo_saveas within win_rapport
end type
type cbx_2 from checkbox within win_rapport
end type
type cb_6 from uo_saveas within win_rapport
end type
type cbx_1 from checkbox within win_rapport
end type
type cb_5 from commandbutton within win_rapport
end type
type cb_4 from commandbutton within win_rapport
end type
type cb_3 from commandbutton within win_rapport
end type
type cb_2 from commandbutton within win_rapport
end type
type cb_1 from commandbutton within win_rapport
end type
type dw_rapport_bk from datawindow within win_rapport
end type
type dw_rapport from datawindow within win_rapport
end type
end forward

global type win_rapport from window
integer width = 3168
integer height = 1980
boolean titlebar = true
string title = "Test rapport"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cbx_2 cbx_2
cb_6 cb_6
cbx_1 cbx_1
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_rapport_bk dw_rapport_bk
dw_rapport dw_rapport
end type
global win_rapport win_rapport

on win_rapport.create
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cbx_2=create cbx_2
this.cb_6=create cb_6
this.cbx_1=create cbx_1
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_rapport_bk=create dw_rapport_bk
this.dw_rapport=create dw_rapport
this.Control[]={this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cbx_2,&
this.cb_6,&
this.cbx_1,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_rapport_bk,&
this.dw_rapport}
end on

on win_rapport.destroy
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cbx_2)
destroy(this.cb_6)
destroy(this.cbx_1)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_rapport_bk)
destroy(this.dw_rapport)
end on

event open;long	ll_ligne

dw_rapport.object.datawindow.zoom = "100"

ll_ligne = dw_rapport.insertrow(0)
dw_rapport.object.element_1[ll_ligne] = '1Element 1 ligne 1 Element 1 ligne 1 END'
//dw_rapport.object.element_2[ll_ligne] = 'Element 2 ligne 1 Element 2 ligne 1 END'
dw_rapport.object.element_3[ll_ligne] = '2Element 2 ligne 1 Element 2 ligne 1 END'

ll_ligne = dw_rapport.insertrow(0)
dw_rapport.object.element_1[ll_ligne] = '3Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 END'
//dw_rapport.object.element_2[ll_ligne] = 'Element 2 ligne 2 Element 2 ligne 2 END'

ll_ligne = dw_rapport.insertrow(0)
dw_rapport.object.element_1[ll_ligne] = '4Element 1 ligne 3 Element 1 ligne 3 END'
//dw_rapport.object.element_2[ll_ligne] = 'Element 2 ligne 1 Element 2 ligne 1 END'



ll_ligne = dw_rapport.insertrow(0)
dw_rapport.object.opt1[ll_ligne] = 2



dw_rapport_bk.object.datawindow.zoom = "100"

ll_ligne = dw_rapport_bk.insertrow(0)
dw_rapport_bk.object.element_1[ll_ligne] = '1Element 1 ligne 1 Element 1 ligne 1 END'
//dw_rapport.object.element_2[ll_ligne] = 'Element 2 ligne 1 Element 2 ligne 1 END'
dw_rapport_bk.object.element_3[ll_ligne] = '2Element 2 ligne 1 Element 2 ligne 1 END'

ll_ligne = dw_rapport_bk.insertrow(0)
dw_rapport_bk.object.element_1[ll_ligne] = '3Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 Element 1 ligne 2 END'
//dw_rapport.object.element_2[ll_ligne] = 'Element 2 ligne 2 Element 2 ligne 2 END'

ll_ligne = dw_rapport_bk.insertrow(0)
dw_rapport_bk.object.element_1[ll_ligne] = '4Element 1 ligne 3 Element 1 ligne 3 END'
//dw_rapport.object.element_2[ll_ligne] = 'Element 2 ligne 1 Element 2 ligne 1 END'



ll_ligne = dw_rapport_bk.insertrow(0)
dw_rapport_bk.object.opt1[ll_ligne] = 2


end event

type cb_9 from commandbutton within win_rapport
integer x = 2624
integer y = 1380
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF2"
end type

event clicked;OpenWithparm( w_newfeature,dw_rapport_bk)
end event

type cb_8 from commandbutton within win_rapport
integer x = 379
integer y = 1396
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF1"
end type

event clicked;OpenWithparm( w_newfeature,dw_rapport)
end event

type cb_7 from uo_saveas within win_rapport
integer x = 2747
integer y = 1176
integer taborder = 50
end type

event clicked;call super::clicked;of_saveas(dw_rapport_bk,cbx_2.checked)  
end event

type cbx_2 from checkbox within win_rapport
integer x = 2729
integer y = 1012
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

type cb_6 from uo_saveas within win_rapport
integer x = 201
integer y = 1172
integer taborder = 40
end type

event clicked;call super::clicked;of_saveas(dw_rapport,cbx_1.checked)  
end event

type cbx_1 from checkbox within win_rapport
integer x = 251
integer y = 1060
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

type cb_5 from commandbutton within win_rapport
integer x = 2683
integer y = 832
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Saveas2"
end type

event clicked;dw_rapport_bk.object.datawindow.export.pdf.method =nativepdf!
dw_rapport_bk.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
dw_rapport_bk.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
dw_rapport_bk.saveas( )
end event

type cb_4 from commandbutton within win_rapport
integer x = 192
integer y = 872
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Saveas1"
end type

event clicked;dw_rapport.object.datawindow.export.pdf.method =nativepdf!
dw_rapport.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
dw_rapport.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
dw_rapport.saveas( )
end event

type cb_3 from commandbutton within win_rapport
integer x = 1221
integer y = 1084
integer width = 809
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "sub report in row 1(invisible)"
end type

event clicked;dw_rapport.setitem(1,"opt1",1)
dw_rapport_bk.setitem(1,"opt1",1)
end event

type cb_2 from commandbutton within win_rapport
integer x = 1216
integer y = 880
integer width = 763
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "sub report in row 1(visible)"
end type

event clicked;dw_rapport.setitem(1,"opt1",2)
dw_rapport_bk.setitem(1,"opt1",2)
end event

type cb_1 from commandbutton within win_rapport
integer x = 1088
integer y = 388
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;
dw_rapport.SetRedraw(false)
dw_rapport.GroupCalc()
dw_rapport.SetRedraw(true)
end event

type dw_rapport_bk from datawindow within win_rapport
integer x = 1687
integer y = 12
integer width = 1650
integer height = 1832
integer taborder = 10
string title = "none"
string dataobject = "dw_rapport_bk"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_rapport from datawindow within win_rapport
integer x = 41
integer y = 12
integer width = 1650
integer height = 1832
integer taborder = 10
string title = "none"
string dataobject = "dw_rapport"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

