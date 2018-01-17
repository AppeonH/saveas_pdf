$PBExportHeader$w_1.srw
forward
global type w_1 from window
end type
type dw_1 from datawindow within w_1
end type
type cb_1 from commandbutton within w_1
end type
end forward

global type w_1 from window
integer width = 2533
integer height = 1408
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
cb_1 cb_1
end type
global w_1 w_1

event open;
//SQLCA.DBMS       =ProfileString("xsl_fo.ini","DBINFO","DBMS"," ") 
//SQLCA.Database   =ProfileString("xsl_fo.ini","DBINFO","AutoCommit"," ") 
//SQLCA.DBParm     =ProfileString("xsl_fo.ini","DBINFO","DBParm"," ")
// Profile PB Demo DB V2017
// Profile PB Demo DB V2017
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017;UID=dba;PWD=<******>'"
// Profile PB Demo DB V2017

SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017;UID=dba;PWD=sql'"

connect using SQLCA;

//dw_1.SettransObject(SQLCA)
//
//dw_1.retrieve()


end event

on w_1.create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_1}
end on

on w_1.destroy
destroy(this.dw_1)
destroy(this.cb_1)
end on

type dw_1 from datawindow within w_1
integer x = 183
integer y = 116
integer width = 1385
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "d_deptment"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_1
integer x = 448
integer y = 832
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;int result 
	
dw_1.SettransObject(SQLCA)

dw_1.retrieve()
	dw_1.Object.DataWindow.Export.PDF.Method = XSLFOP!
	result = dw_1.SaveAs("aa.pdf", PDF!, true)
	messagebox("",result)

end event

