$PBExportHeader$w_mail_logon.srw
forward
global type w_mail_logon from window
end type
type sle_server from singlelineedit within w_mail_logon
end type
type cb_3 from commandbutton within w_mail_logon
end type
type cb_2 from commandbutton within w_mail_logon
end type
type cb_1 from commandbutton within w_mail_logon
end type
type sle_2 from singlelineedit within w_mail_logon
end type
type sle_1 from singlelineedit within w_mail_logon
end type
type st_3 from statictext within w_mail_logon
end type
type st_2 from statictext within w_mail_logon
end type
type st_1 from statictext within w_mail_logon
end type
end forward

global type w_mail_logon from window
integer width = 1317
integer height = 584
boolean titlebar = true
string title = "Mail Logon"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_syscommand pbm_syscommand
sle_server sle_server
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_2 sle_2
sle_1 sle_1
st_3 st_3
st_2 st_2
st_1 st_1
end type
global w_mail_logon w_mail_logon

type variables
wstr_parm iwstr

string is_flag ='Nothing'
end variables

event ue_syscommand;//iwstr.flag = is_flag
//Message.powerobjectparm = iwstr
end event

on w_mail_logon.create
this.sle_server=create sle_server
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.sle_server,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.sle_2,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.st_1}
end on

on w_mail_logon.destroy
destroy(this.sle_server)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

event closequery;iwstr.flag = is_flag
message.powerobjectparm = iwstr
end event

type sle_server from singlelineedit within w_mail_logon
event ue_keydown pbm_keydown
integer x = 590
integer y = 52
integer width = 649
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event ue_keydown;if key = keyenter! then
	sle_1.setfocus()
end if
end event

type cb_3 from commandbutton within w_mail_logon
integer x = 891
integer y = 384
integer width = 343
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;is_flag = 'Close'
Close(parent)
end event

type cb_2 from commandbutton within w_mail_logon
integer x = 480
integer y = 384
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;
is_flag = 'Cancel'
Close(parent)
end event

type cb_1 from commandbutton within w_mail_logon
event ue_keydown pbm_keydown
integer x = 69
integer y = 384
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Ok"
end type

event ue_keydown;if key = keyenter! then
	this.triggerevent(clicked!)
end if
end event

event clicked;//iwstr.profile = trim(ddlb_1.text)
iwstr.profile = trim(sle_server.text)
iwstr.name = trim(sle_1.text)
iwstr.password = trim(sle_2.text)
is_flag = 'Ok'
Close(parent)
end event

type sle_2 from singlelineedit within w_mail_logon
event ue_keydown pbm_keydown
integer x = 590
integer y = 268
integer width = 649
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event ue_keydown;if key = keyenter! then
	cb_1.setfocus()
end if
end event

event getfocus;cb_1.default = true
cb_1.Enabled = True
end event

type sle_1 from singlelineedit within w_mail_logon
event ue_keydown pbm_keydown
integer x = 590
integer y = 160
integer width = 649
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event ue_keydown;if key = keyenter! then
	sle_2.setfocus()
end if
end event

type st_3 from statictext within w_mail_logon
integer x = 160
integer y = 276
integer width = 375
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mail_logon
integer x = 160
integer y = 168
integer width = 375
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "User Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_mail_logon
integer x = 91
integer y = 60
integer width = 443
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mail Server Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

