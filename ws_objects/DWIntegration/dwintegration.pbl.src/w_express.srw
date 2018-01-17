$PBExportHeader$w_express.srw
forward
global type w_express from window
end type
type st_1 from statictext within w_express
end type
type dw_1 from datawindow within w_express
end type
end forward

global type w_express from window
integer width = 1765
integer height = 1364
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_1 dw_1
end type
global w_express w_express

on w_express.create
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.dw_1}
end on

on w_express.destroy
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;sqlca.dbms = "ODBC"
sqlca.dbparm = "DisableBind=1,Connectstring='DSN=EAS Demo DB V120;UID=dba;PWD=sql',ConnectOption ='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"
connect using sqlca;


dw_1.setTransobject ( SQLCA )

dw_1.retrieve ()
end event

event close;disconnect using SQLCA;
end event

type st_1 from statictext within w_express
integer x = 91
integer y = 980
integer width = 1582
integer height = 252
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "itemchanged/itemfocuschanged triggered, second row has visible expression. The focus not on it when it is getting visible"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_express
integer x = 64
integer y = 56
integer width = 1559
integer height = 880
integer taborder = 10
string title = "none"
string dataobject = "d_express"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//string ls_test
messagebox("","itemchanged triggered")
end event

event itemfocuschanged;messagebox("", getcolumn())
end event

event rowfocuschanged;Setfocus()
messagebox("", "rowfocuschanged triggered")
end event

