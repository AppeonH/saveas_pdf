$PBExportHeader$w_sign.srw
forward
global type w_sign from window
end type
type cb_8 from commandbutton within w_sign
end type
type cb_7 from commandbutton within w_sign
end type
type dw_2 from datawindow within w_sign
end type
type cb_6 from uo_saveas within w_sign
end type
type p_2 from picture within w_sign
end type
type cbx_1 from checkbox within w_sign
end type
type cb_5 from commandbutton within w_sign
end type
type cb_4 from commandbutton within w_sign
end type
type cb_3 from commandbutton within w_sign
end type
type cb_2 from uo_saveas within w_sign
end type
type cb_1 from commandbutton within w_sign
end type
type ip_1 from inkpicture within w_sign
end type
type p_1 from picture within w_sign
end type
type st_2 from statictext within w_sign
end type
type st_1 from statictext within w_sign
end type
type gb_1 from groupbox within w_sign
end type
type gb_2 from groupbox within w_sign
end type
type dw_1 from datawindow within w_sign
end type
end forward

global type w_sign from window
integer width = 5225
integer height = 2192
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_8 cb_8
cb_7 cb_7
dw_2 dw_2
cb_6 cb_6
p_2 p_2
cbx_1 cbx_1
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
ip_1 ip_1
p_1 p_1
st_2 st_2
st_1 st_1
gb_1 gb_1
gb_2 gb_2
dw_1 dw_1
end type
global w_sign w_sign

type variables
long il_row
end variables

on w_sign.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.dw_2=create dw_2
this.cb_6=create cb_6
this.p_2=create p_2
this.cbx_1=create cbx_1
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ip_1=create ip_1
this.p_1=create p_1
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_1=create dw_1
this.Control[]={this.cb_8,&
this.cb_7,&
this.dw_2,&
this.cb_6,&
this.p_2,&
this.cbx_1,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.ip_1,&
this.p_1,&
this.st_2,&
this.st_1,&
this.gb_1,&
this.gb_2,&
this.dw_1}
end on

on w_sign.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.dw_2)
destroy(this.cb_6)
destroy(this.p_2)
destroy(this.cbx_1)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ip_1)
destroy(this.p_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve( )

dw_2.settransobject(sqlca)
dw_2.retrieve( )
end event

type cb_8 from commandbutton within w_sign
integer x = 3717
integer y = 1932
integer width = 457
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF2"
end type

event clicked;OpenWithparm( w_newfeature,dw_2)
end event

type cb_7 from commandbutton within w_sign
integer x = 2107
integer y = 1888
integer width = 407
integer height = 124
integer taborder = 50
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

type dw_2 from datawindow within w_sign
integer x = 3301
integer y = 108
integer width = 1856
integer height = 1680
integer taborder = 20
string title = "none"
string dataobject = "d_1_composite"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_6 from uo_saveas within w_sign
integer x = 3717
integer y = 1784
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
string text = "Saveas2"
end type

event clicked;call super::clicked;dw_2.Retrieve()
of_saveas(dw_2,cbx_1.checked)
end event

type p_2 from picture within w_sign
integer x = 4603
integer y = 1820
integer width = 366
integer height = 224
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_sign
integer x = 1810
integer y = 1752
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
string text = "PB"
end type

type cb_5 from commandbutton within w_sign
integer x = 2651
integer y = 1572
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;dw_1.accepttext()

if dw_1.update( ) = 1 then
	commit;
else
	messagebox('',sqlca.sqlerrtext)
	rollback;
	return
end if

cb_1.enabled = true
cb_3.enabled = true
end event

type cb_4 from commandbutton within w_sign
integer x = 1801
integer y = 1580
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Insert"
end type

event clicked;long ll_row

il_row = dw_1.insertrow(0)

dw_1.scrolltorow(il_row)

cb_1.enabled = false

cb_3.enabled = false
end event

type cb_3 from commandbutton within w_sign
integer x = 2638
integer y = 1212
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SelectPic"
end type

event clicked;string ls_pic,ls_file,ls_path
long ll_file,ll_row,ll_fileno,ll_id
blob lb_data

ll_file = getfileopenname("Select Pic",ls_path,ls_file,"bmp","BMP file,*.bmp;*.png")

if ll_file > 0 then
	ll_row = dw_1.getrow( )
	ll_id = dw_1.getitemnumber( ll_row,1)
     ll_fileno = fileopen(ls_file,textmode!,read!,shared!)
	filereadex(ll_fileno,lb_data)
	updateblob t_sign set image = :lb_data where id = :ll_id;
	fileclose(ll_fileno)
	ip_1.picturefilename = ls_file
	if sqlca.sqlcode <> 0 then
		messagebox("Error",sqlca.sqlerrtext)
		rollback;
		return
	else
		commit;
	end if
	dw_1.retrieve()
	dw_1.scrolltorow(ll_row)
end if

end event

type cb_2 from uo_saveas within w_sign
integer x = 2661
integer y = 1724
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
string text = "Saveas"
end type

event clicked;call super::clicked;of_saveas(dw_1,cbx_1.checked)
end event

type cb_1 from commandbutton within w_sign
integer x = 1819
integer y = 1216
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SaveInk"
end type

event clicked;blob lb_data

long ll_id,ll_row,li_return

ll_row = dw_1.getrow( )

if ll_row = 0 then return
ll_id = dw_1.getitemnumber( ll_row,1)

ip_1.saveink( lb_data)

updateblob t_sign set sign = :lb_data where id = :ll_id;

if sqlca.sqlcode <> 0 then
	messagebox("",sqlca.sqlerrtext)
	rollback;
	return
else
	commit;
end if

ip_1.save("test.bmp", 0, true)

Blob Emp_pic
li_return = FileOpen( "test.bmp", StreamMode!)
if li_return <> -1 Then
	FileReadEx(li_return, Emp_pic)
	FileClose(li_return)
	p_2.SetPicture(Emp_pic)
End If

dw_1.Modify( "p_1.Filename='test.bmp'" )
dw_1.retrieve( )
dw_1.scrolltorow(ll_row)


end event

type ip_1 from inkpicture within w_sign
integer x = 1723
integer y = 116
integer width = 1554
integer height = 968
displaysizemode picturesizemode = inkpicstretched!
end type

type p_1 from picture within w_sign
integer x = 2491
integer y = 28
integer width = 73
integer height = 64
boolean originalsize = true
string picturename = "Custom046!"
boolean focusrectangle = false
end type

event clicked;long ll_color

choosecolor(ll_color)

st_2.backcolor = ll_color

ip_1.inkcolor = ll_color
end event

type st_2 from statictext within w_sign
integer x = 2208
integer y = 20
integer width = 270
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "inkcolor"
boolean focusrectangle = false
end type

event clicked;p_1.triggerevent(clicked!)
end event

type st_1 from statictext within w_sign
integer x = 1723
integer y = 20
integer width = 329
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "inkpicture"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_sign
integer x = 1719
integer y = 1092
integer width = 1559
integer height = 348
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operate"
borderstyle borderstyle = stylebox!
end type

type gb_2 from groupbox within w_sign
integer x = 1719
integer y = 1464
integer width = 1559
integer height = 416
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operate"
borderstyle borderstyle = stylebox!
end type

type dw_1 from datawindow within w_sign
integer width = 1691
integer height = 1896
integer taborder = 10
string title = "none"
string dataobject = "d_1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

