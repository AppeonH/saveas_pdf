$PBExportHeader$vo_datawindow.sru
forward
global type vo_datawindow from datawindow
end type
end forward

global type vo_datawindow from datawindow
integer width = 773
integer height = 432
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type
global vo_datawindow vo_datawindow

event rowfocuschanged;//messagebox("vo_datawindow rowfocuschanged", string(currentrow))
end event

on vo_datawindow.create
end on

on vo_datawindow.destroy
end on

event itemchanged;int i

if dwo.Name = "emp_id" then
	select count(*) 
		into :i
		from employee 
		where emp_id = :data;
	
	if i > 0 then
		messagebox("error", data + "has existed in DB")
	end if
end if
end event

