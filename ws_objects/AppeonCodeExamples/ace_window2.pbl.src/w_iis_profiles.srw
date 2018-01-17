$PBExportHeader$w_iis_profiles.srw
forward
global type w_iis_profiles from window
end type
type st_7 from statictext within w_iis_profiles
end type
type em_port from editmask within w_iis_profiles
end type
type cb_3 from commandbutton within w_iis_profiles
end type
type cb_1 from commandbutton within w_iis_profiles
end type
type sle_servername from singlelineedit within w_iis_profiles
end type
type st_4 from statictext within w_iis_profiles
end type
type st_3 from statictext within w_iis_profiles
end type
type ddlb_profilelist from dropdownlistbox within w_iis_profiles
end type
type st_1 from statictext within w_iis_profiles
end type
end forward

global type w_iis_profiles from window
integer width = 2030
integer height = 592
boolean titlebar = true
string title = "IIS Profiles"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_7 st_7
em_port em_port
cb_3 cb_3
cb_1 cb_1
sle_servername sle_servername
st_4 st_4
st_3 st_3
ddlb_profilelist ddlb_profilelist
st_1 st_1
end type
global w_iis_profiles w_iis_profiles

type variables
int  ii_count
end variables

on w_iis_profiles.create
this.st_7=create st_7
this.em_port=create em_port
this.cb_3=create cb_3
this.cb_1=create cb_1
this.sle_servername=create sle_servername
this.st_4=create st_4
this.st_3=create st_3
this.ddlb_profilelist=create ddlb_profilelist
this.st_1=create st_1
this.Control[]={this.st_7,&
this.em_port,&
this.cb_3,&
this.cb_1,&
this.sle_servername,&
this.st_4,&
this.st_3,&
this.ddlb_profilelist,&
this.st_1}
end on

on w_iis_profiles.destroy
destroy(this.st_7)
destroy(this.em_port)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.sle_servername)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.ddlb_profilelist)
destroy(this.st_1)
end on

event open;//Create default table to store profile lists
int  li
long ll_port
string  ls_ProfileName,ls_serverName,ls_UserName,ls_Passowrd


ii_count = integer(profilestring(gs_IniFileName,"iis_profiles","count","0"))

for li=1 to ii_count
	ls_ProfileName = profilestring(gs_IniFileName,"iis_profiles","item"+string(li),"")
	ddlb_profilelist.additem(ls_profileName)
next
ls_ProfileName = profilestring(gs_IniFileName,"iis_profiles","default","")

IF	ls_ProfileName<>'' THEN
	ddlb_profilelist.text=ls_ProfileName
	sle_servername.text = profilestring(gs_IniFileName,ls_ProfileName,"servername","localhost")
	em_port.text = profilestring(gs_IniFileName,ls_ProfileName,"port","")

END IF
	


end event

type st_7 from statictext within w_iis_profiles
integer x = 37
integer y = 28
integer width = 1399
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Please select an IIS you want to connect:"
boolean focusrectangle = false
end type

type em_port from editmask within w_iis_profiles
integer x = 384
integer y = 364
integer width = 1024
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "80"
borderstyle borderstyle = stylelowered!
string mask = "#####0"
end type

type cb_3 from commandbutton within w_iis_profiles
integer x = 1509
integer y = 268
integer width = 430
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;closewithreturn(parent,"")
end event

type cb_1 from commandbutton within w_iis_profiles
integer x = 1509
integer y = 148
integer width = 430
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;//Create default table to store profile lists

string  ls_ProfileName,ls_servername

ls_ProfileName = ddlb_profilelist.text
if ls_ProfileName='' or trim(ls_ProfileName)='' THEN
	messagebox("Alert","Please provide a valid profile name.")
	return
END IF
if sle_servername.text='' or trim(sle_servername.text)='' THEN
	messagebox("Alert","Please provide a valid server name or IP.")
	return
END IF
if em_port.text='' or trim(em_port.text)='' THEN
	messagebox("Alert","Please provide a valid port.")
	return
END IF


ls_serverName = profilestring(gs_IniFileName,ls_ProfileName,"servername","")

IF ls_serverName = '' THEN
	ii_count++
	setprofilestring(gs_IniFileName,"iis_profiles","count",string(ii_count))
	setprofilestring(gs_IniFileName,"iis_profiles","item"+string(ii_count),ls_ProfileName)
END IF

setprofilestring(gs_IniFileName,ls_ProfileName,"servername",sle_servername.text)
setprofilestring(gs_IniFileName,ls_ProfileName,"port",em_port.text)
setprofilestring(gs_IniFileName,"iis_profiles","default",ls_ProfileName)


closewithreturn(parent,ls_ProfileName)
end event

type sle_servername from singlelineedit within w_iis_profiles
integer x = 384
integer y = 252
integer width = 1024
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "localhost"
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_iis_profiles
integer x = 46
integer y = 376
integer width = 320
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Port:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_iis_profiles
integer x = 46
integer y = 268
integer width = 320
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Server Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_profilelist from dropdownlistbox within w_iis_profiles
integer x = 384
integer y = 148
integer width = 1024
integer height = 524
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//Create default table to store profile lists
string  ls_ProfileName


ls_ProfileName = this.text

IF	ls_ProfileName<>'' THEN
	sle_servername.text = profilestring(gs_IniFileName,ls_ProfileName,"servername","localhost")
	em_port.text = profilestring(gs_IniFileName,ls_ProfileName,"port","9989")
END IF
	


end event

type st_1 from statictext within w_iis_profiles
integer x = 46
integer y = 156
integer width = 320
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profile Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

