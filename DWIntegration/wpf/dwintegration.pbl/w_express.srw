forward
global type w_express from window
end type
type st_1 from statictext within w_express
end type
type dw_1 from datawindow within w_express
end type
end forward


global type w_express from window 

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

end type



type dw_1 from datawindow within w_express 

end type


event itemchanged;//string ls_test
messagebox("","itemchanged triggered")
end event

event itemfocuschanged;messagebox("", getcolumn())
end event

event rowfocuschanged;Setfocus()
messagebox("", "rowfocuschanged triggered")
end event
