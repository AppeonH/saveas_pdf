$PBExportHeader$w_lan.srw
forward
global type w_lan from window
end type
type cb_7 from commandbutton within w_lan
end type
type pb_1 from picturebutton within w_lan
end type
type cb_6 from commandbutton within w_lan
end type
type cbx_1 from checkbox within w_lan
end type
type cb_5 from uo_saveas within w_lan
end type
type rte_1 from richtextedit within w_lan
end type
type cb_4 from commandbutton within w_lan
end type
type cb_3 from commandbutton within w_lan
end type
type cb_2 from commandbutton within w_lan
end type
type cb_1 from commandbutton within w_lan
end type
type dw_1 from datawindow within w_lan
end type
end forward

global type w_lan from window
integer width = 4197
integer height = 2016
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16711935
string icon = "AppIcon!"
boolean center = true
cb_7 cb_7
pb_1 pb_1
cb_6 cb_6
cbx_1 cbx_1
cb_5 cb_5
rte_1 rte_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_lan w_lan

on w_lan.create
this.cb_7=create cb_7
this.pb_1=create pb_1
this.cb_6=create cb_6
this.cbx_1=create cbx_1
this.cb_5=create cb_5
this.rte_1=create rte_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_7,&
this.pb_1,&
this.cb_6,&
this.cbx_1,&
this.cb_5,&
this.rte_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_lan.destroy
destroy(this.cb_7)
destroy(this.pb_1)
destroy(this.cb_6)
destroy(this.cbx_1)
destroy(this.cb_5)
destroy(this.rte_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;//dw_1.settransobject( sqlca)
//dw_1.retrieve( )

dw_1.insertrow( 0)

end event

type cb_7 from commandbutton within w_lan
integer x = 2715
integer y = 1760
integer width = 457
integer height = 132
integer taborder = 40
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

type pb_1 from picturebutton within w_lan
integer x = 645
integer y = 384
integer width = 558
integer height = 460
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
string picturename = "Toolkit Size Calculator_2!"
alignment htextalign = left!
end type

event clicked;string ls_date
//dw_1.setitem(1,1,"Tesgfdghsdgfhjh fsgfjhhsf jgfjhfd vhhfejn")
//dw_1.setrichtextcolor(255)
end event

type cb_6 from commandbutton within w_lan
integer x = 1152
integer y = 1512
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Select1"
end type

event clicked;string ls_file,ls_path
long ll_return
string ls_rtf


ll_return = getfileopenname("Select Doc",ls_path,ls_file,'Doc',"Doc file(*.doc;*.docx),*.doc;*.docx")

if ll_return > 0 then
	rte_1.selecttextall( )
	rte_1.clear( )
	rte_1.insertdocument( ls_file,true, filetypedoc!)
	rte_1.selecttextall( )
	ls_rtf = rte_1.copyrtf( )
	dw_1.setitem( 1,1,ls_rtf)
end if

end event

type cbx_1 from checkbox within w_lan
integer x = 73
integer y = 1652
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

type cb_5 from uo_saveas within w_lan
integer x = 59
integer y = 1772
integer taborder = 30
end type

event clicked;call super::clicked;of_saveas(dw_1,cbx_1.checked)
end event

type rte_1 from richtextedit within w_lan
boolean visible = false
integer x = 96
integer y = 260
integer width = 2926
integer height = 1380
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_lan
integer x = 1627
integer y = 1760
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Select2"
end type

event clicked;string ls_file,ls_path
long ll_return
string ls_rtf


ll_return = getfileopenname("Select Doc",ls_path,ls_file,'Doc',"Doc file(*.doc;*.docx),*.doc;*.docx")

if ll_return > 0 then
	rte_1.selecttextall( )
	rte_1.clear( )
	rte_1.insertdocument( ls_file,true, filetypedoc!)
	rte_1.selecttextall( )
	ls_rtf = rte_1.copyrtf( )
	dw_1.setitem( 1,"t_lang2",ls_rtf)
end if
end event

type cb_3 from commandbutton within w_lan
integer x = 1106
integer y = 1764
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Select1"
end type

event clicked;string ls_file,ls_path
long ll_return
string ls_rtf


ll_return = getfileopenname("Select Doc",ls_path,ls_file,'Doc',"Doc file(*.doc;*.docx),*.doc;*.docx")

if ll_return > 0 then
	rte_1.selecttextall( )
	rte_1.clear( )
	rte_1.insertdocument( ls_file,true, filetypedoc!)
	rte_1.selecttextall( )
	ls_rtf = rte_1.copyrtf( )
	dw_1.setitem( 1,"t_lang1",ls_rtf)
end if

end event

type cb_2 from commandbutton within w_lan
integer x = 2158
integer y = 1760
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "update"
end type

event clicked;dw_1.accepttext( )

if dw_1.update( ) = 1 then
	commit;
else
	messagebox("Error",sqlca.sqlerrtext)
	rollback;
end if
end event

type cb_1 from commandbutton within w_lan
integer x = 549
integer y = 1768
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Retrieve"
end type

event clicked;dw_1.retrieve()
end event

type dw_1 from datawindow within w_lan
integer width = 4151
integer height = 1736
integer taborder = 10
string title = "none"
string dataobject = "d_2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

