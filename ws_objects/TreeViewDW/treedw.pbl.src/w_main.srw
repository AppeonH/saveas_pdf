$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
end forward

global type w_main from window
integer width = 2638
integer height = 1800
boolean titlebar = true
string title = "TreeViewDataWindow"
string menuname = "w_treedw"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global w_main w_main

on w_main.create
if this.MenuName = "w_treedw" then this.MenuID = create w_treedw
end on

on w_main.destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;// Profile PB Demo DB V2017R2
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017R2;UID=dba;PWD=sql'"

Connect;
if sqlca.sqlcode<>0 then
	Messagebox("DB Connect",sqlca.sqlerrtext)
end if
end event

