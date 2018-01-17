forward
global type w_1 from window
end type
type dw_1 from datawindow within w_1
end type
type cb_1 from commandbutton within w_1
end type
end forward


global type w_1 from window 

dw_1 dw_1 
cb_1 cb_1 
end type


global w_1 w_1

event open;SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=EAS Demo DB V10 Unicode;UID=dba;PWD=sql'"
//
//SQLCA.DBMS       =ProfileString("xsl_fo.ini","DBINFO","DBMS"," ") 
//SQLCA.Database   =ProfileString("xsl_fo.ini","DBINFO","AutoCommit"," ") 
//SQLCA.DBParm     =ProfileString("xsl_fo.ini","DBINFO","DBParm"," ")

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

end type



type cb_1 from commandbutton within w_1 

end type


event clicked;int result 
	
dw_1.SettransObject(SQLCA)

dw_1.retrieve()
	dw_1.Object.DataWindow.Export.PDF.Method = XSLFOP!
	result = dw_1.SaveAs("aa.pdf", PDF!, true)
	messagebox("",result)

end event
