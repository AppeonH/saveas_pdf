$PBExportHeader$w_inet_object.srw
forward
global type w_inet_object from window
end type
type cb_1 from commandbutton within w_inet_object
end type
type st_3 from statictext within w_inet_object
end type
type st_2 from statictext within w_inet_object
end type
type cb_geturl from commandbutton within w_inet_object
end type
type ddlb_site from dropdownlistbox within w_inet_object
end type
type st_1 from statictext within w_inet_object
end type
type cb_close from commandbutton within w_inet_object
end type
type cb_visit from commandbutton within w_inet_object
end type
type gb_1 from groupbox within w_inet_object
end type
end forward

global type w_inet_object from window
integer width = 2469
integer height = 1012
boolean titlebar = true
string title = "Inet & InternetResult Object"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
st_3 st_3
st_2 st_2
cb_geturl cb_geturl
ddlb_site ddlb_site
st_1 st_1
cb_close cb_close
cb_visit cb_visit
gb_1 gb_1
end type
global w_inet_object w_inet_object

type prototypes


end prototypes

on w_inet_object.create
this.cb_1=create cb_1
this.st_3=create st_3
this.st_2=create st_2
this.cb_geturl=create cb_geturl
this.ddlb_site=create ddlb_site
this.st_1=create st_1
this.cb_close=create cb_close
this.cb_visit=create cb_visit
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.st_3,&
this.st_2,&
this.cb_geturl,&
this.ddlb_site,&
this.st_1,&
this.cb_close,&
this.cb_visit,&
this.gb_1}
end on

on w_inet_object.destroy
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_geturl)
destroy(this.ddlb_site)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.cb_visit)
destroy(this.gb_1)
end on

event open;This.x = 0
This.y = 0

ddlb_site.selectitem( 1)
end event

type cb_1 from commandbutton within w_inet_object
integer x = 1509
integer y = 640
integer width = 343
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Reset"
end type

event clicked;ddlb_site.Text = "http://"
ddlb_site.setfocus( )
ddlb_site.SelectText(Len(ddlb_site.Text) + 1,1) 
end event

type st_3 from statictext within w_inet_object
integer x = 197
integer y = 264
integer width = 2112
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "When click GetURL button,will display HTML return of the specified URL;"
boolean focusrectangle = false
end type

type st_2 from statictext within w_inet_object
integer x = 197
integer y = 204
integer width = 2139
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "When click Visit button,will open the specified URL using the default web browser;"
boolean focusrectangle = false
end type

type cb_geturl from commandbutton within w_inet_object
integer x = 1138
integer y = 640
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&GetURL"
end type

event clicked;blob     lb_Data
String   ls_webSite
integer  li_FileNum
Inet  	linet_base
n_ir_msg	ln_ir_msg

SetPointer(HourGlass!)
ls_webSite = ddlb_site.text

//check web site is valid
If Pos(ls_webSite,"http://") <> 1 Then
	Messagebox(Parent.Title,"Please input a valid web address!")
	Return
End If

//create instance
linet_base = Create  Inet
ln_ir_msg = Create n_ir_msg

If isValid(linet_base) Then
	//open default browse to visite web address
	If linet_base.GetURL(ls_webSite,ln_ir_msg) <> 1 Then
		Messagebox(Parent.Title,"Use GetURL function to access HTML source failed!~r~nPlease make sure your Internet browser work well.")	
	End If
	
	//open html source code with Notepad
	lb_Data =  ln_ir_msg.uf_gethtml()
	IF not DirectoryExists('C:\ACETemp\') THEN CreateDirectory('C:\ACETemp\')
	li_FileNum = FileOpen("C:\ACETemp\inet_html.txt", StreamMode!, Write!, LockWrite!, Replace!)
	FileWrite(li_FileNum, lb_Data)
	FileClose(li_FileNum)

	Run("notepad C:\ACETemp\inet_html.txt")
	
	Destroy linet_base
	Destroy ln_ir_msg
End If

SetPointer(Arrow!)
end event

type ddlb_site from dropdownlistbox within w_inet_object
integer x = 119
integer y = 416
integer width = 2176
integer height = 516
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean allowedit = true
string item[] = {"http://www.sybase.com","http://www.sun.com","http://www.google.com","http://www.microsoft.com","http://www.appeon.com","http://www.ibm.com"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_inet_object
integer x = 151
integer y = 144
integer width = 1463
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select one web site then click buttion to open URL."
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_inet_object
integer x = 1879
integer y = 640
integer width = 343
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
end type

event clicked;Close(Parent)
end event

type cb_visit from commandbutton within w_inet_object
integer x = 768
integer y = 640
integer width = 343
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Visit"
end type

event clicked;Inet  	linet_base
String	ls_webSite

ls_webSite = ddlb_site.text

//check web site is valid
If Pos(ls_webSite,"http://") <> 1 Then
	Messagebox(Parent.Title,"Please input a valid web address!")
	Return
End If

//create instance
linet_base = Create  Inet

If isValid(linet_base) Then
	//open default browse to visite web address
	linet_base.HyperlinkToURL(ls_webSite)
	Destroy linet_base
End If




end event

type gb_1 from groupbox within w_inet_object
integer x = 78
integer y = 60
integer width = 2272
integer height = 772
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inet and InternetResult Function"
end type

