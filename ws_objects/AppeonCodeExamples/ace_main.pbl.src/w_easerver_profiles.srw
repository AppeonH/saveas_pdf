$PBExportHeader$w_easerver_profiles.srw
forward
global type w_easerver_profiles from window
end type
type st_7 from statictext within w_easerver_profiles
end type
type em_port from editmask within w_easerver_profiles
end type
type cb_4 from commandbutton within w_easerver_profiles
end type
type cb_3 from commandbutton within w_easerver_profiles
end type
type cb_1 from commandbutton within w_easerver_profiles
end type
type sle_password from singlelineedit within w_easerver_profiles
end type
type sle_username from singlelineedit within w_easerver_profiles
end type
type sle_servername from singlelineedit within w_easerver_profiles
end type
type st_6 from statictext within w_easerver_profiles
end type
type st_5 from statictext within w_easerver_profiles
end type
type st_4 from statictext within w_easerver_profiles
end type
type st_3 from statictext within w_easerver_profiles
end type
type ddlb_2 from dropdownlistbox within w_easerver_profiles
end type
type st_2 from statictext within w_easerver_profiles
end type
type ddlb_profilelist from dropdownlistbox within w_easerver_profiles
end type
type st_1 from statictext within w_easerver_profiles
end type
end forward

global type w_easerver_profiles from window
integer width = 2030
integer height = 920
boolean titlebar = true
string title = "EAServer Server Profiles"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_7 st_7
em_port em_port
cb_4 cb_4
cb_3 cb_3
cb_1 cb_1
sle_password sle_password
sle_username sle_username
sle_servername sle_servername
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
ddlb_2 ddlb_2
st_2 st_2
ddlb_profilelist ddlb_profilelist
st_1 st_1
end type
global w_easerver_profiles w_easerver_profiles

type variables
int  ii_count
end variables

on w_easerver_profiles.create
this.st_7=create st_7
this.em_port=create em_port
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_1=create cb_1
this.sle_password=create sle_password
this.sle_username=create sle_username
this.sle_servername=create sle_servername
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.ddlb_2=create ddlb_2
this.st_2=create st_2
this.ddlb_profilelist=create ddlb_profilelist
this.st_1=create st_1
this.Control[]={this.st_7,&
this.em_port,&
this.cb_4,&
this.cb_3,&
this.cb_1,&
this.sle_password,&
this.sle_username,&
this.sle_servername,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.ddlb_2,&
this.st_2,&
this.ddlb_profilelist,&
this.st_1}
end on

on w_easerver_profiles.destroy
destroy(this.st_7)
destroy(this.em_port)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.sle_password)
destroy(this.sle_username)
destroy(this.sle_servername)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.ddlb_2)
destroy(this.st_2)
destroy(this.ddlb_profilelist)
destroy(this.st_1)
end on

event open;//Create default table to store profile lists
int  li
long ll_port
string  ls_ProfileName,ls_serverName,ls_UserName,ls_Passowrd


ii_count = integer(profilestring(gs_IniFileName,"easerver_profiles","count","0"))

for li=1 to ii_count
	ls_ProfileName = profilestring(gs_IniFileName,"easerver_profiles","item"+string(li),"")
	ddlb_profilelist.additem(ls_profileName)
next
ls_ProfileName = profilestring(gs_IniFileName,"easerver_profiles","default","")

IF	ls_ProfileName<>'' THEN
	ddlb_profilelist.text=ls_ProfileName
	sle_servername.text = profilestring(gs_IniFileName,ls_ProfileName,"servername","localhost")
	em_port.text = profilestring(gs_IniFileName,ls_ProfileName,"port","9989")
	sle_username.text = profilestring(gs_IniFileName,ls_ProfileName,"username","jagadmin")
	sle_password.text = profilestring(gs_IniFileName,ls_ProfileName,"password","")
END IF
	


end event

type st_7 from statictext within w_easerver_profiles
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
string text = "Please select an EAServer you want to connect:"
boolean focusrectangle = false
end type

type em_port from editmask within w_easerver_profiles
integer x = 384
integer y = 464
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
string text = "9989"
borderstyle borderstyle = stylelowered!
string mask = "#####0"
end type

type cb_4 from commandbutton within w_easerver_profiles
integer x = 1509
integer y = 388
integer width = 430
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Test..."
end type

event clicked;Connection i_conn

i_conn = Create Connection
i_conn.Driver = "jaguar"
i_conn.Application = gs_ServerPackage
i_conn.Location = sle_servername.text+":"+em_port.text
i_conn.UserID = sle_username.text
i_conn.Password = sle_password.text

If i_conn.ConnectToServer() = 0 Then
	messagebox("Appeon Code Examples","Connect to server successfully.")
ELSE
	MessageBox("Appeon Code Examples","Cannot connect to specified server, the possible reasons are: ~n&
1. Given Server Name, Port, UserID or Password is incorrect. ~n&
2. This Appeon Server does not support PowerBuilder NVOs.~n&
3. The connection to Appeon Server failed.~n&
4. The application server may not have suitable PBVM installed!",exclamation!)

End If

Destroy i_conn

end event

type cb_3 from commandbutton within w_easerver_profiles
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

type cb_1 from commandbutton within w_easerver_profiles
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
if sle_username.text='' or trim(sle_username.text)='' THEN
	messagebox("Alert","Please provide a valid user name.")
	return
END IF

ls_serverName = profilestring(gs_IniFileName,ls_ProfileName,"servername","")

IF ls_serverName = '' THEN
	ii_count++
	setprofilestring(gs_IniFileName,"easerver_profiles","count",string(ii_count))
	setprofilestring(gs_IniFileName,"easerver_profiles","item"+string(ii_count),ls_ProfileName)
END IF

setprofilestring(gs_IniFileName,ls_ProfileName,"servername",sle_servername.text)
setprofilestring(gs_IniFileName,ls_ProfileName,"port",em_port.text)
setprofilestring(gs_IniFileName,ls_ProfileName,"username",sle_username.text)
setprofilestring(gs_IniFileName,ls_ProfileName,"password",sle_password.text)
setprofilestring(gs_IniFileName,"easerver_profiles","default",ls_ProfileName)


closewithreturn(parent,ls_ProfileName)
end event

type sle_password from singlelineedit within w_easerver_profiles
integer x = 384
integer y = 676
integer width = 1024
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_username from singlelineedit within w_easerver_profiles
integer x = 384
integer y = 568
integer width = 1024
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "jagadmin"
borderstyle borderstyle = stylelowered!
end type

type sle_servername from singlelineedit within w_easerver_profiles
integer x = 384
integer y = 352
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

type st_6 from statictext within w_easerver_profiles
integer x = 46
integer y = 696
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
string text = "Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_easerver_profiles
integer x = 46
integer y = 584
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
string text = "Login Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_easerver_profiles
integer x = 46
integer y = 476
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

type st_3 from statictext within w_easerver_profiles
integer x = 46
integer y = 368
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

type ddlb_2 from dropdownlistbox within w_easerver_profiles
integer x = 384
integer y = 248
integer width = 1024
integer height = 524
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean enabled = false
string text = "EAServer"
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"EAServer","JBoss","Weblogic","WebSphere"}
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_easerver_profiles
integer x = 46
integer y = 260
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
string text = "Server Type:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_profilelist from dropdownlistbox within w_easerver_profiles
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
	sle_username.text = profilestring(gs_IniFileName,ls_ProfileName,"username","jagadmin")
	sle_password.text = profilestring(gs_IniFileName,ls_ProfileName,"password","")
END IF
	


end event

type st_1 from statictext within w_easerver_profiles
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

