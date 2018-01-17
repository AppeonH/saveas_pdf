$PBExportHeader$w_dde_client.srw
$PBExportComments$Works with w_dde_server to demonstrate how to do a PB DDE server
forward
global type w_dde_client from window
end type
type cb_start from commandbutton within w_dde_client
end type
type st_1 from statictext within w_dde_client
end type
type cb_exit from commandbutton within w_dde_client
end type
type rb_gr_data3 from radiobutton within w_dde_client
end type
type rb_gr_data2 from radiobutton within w_dde_client
end type
type rb_gr_data1 from radiobutton within w_dde_client
end type
type rb_data3 from radiobutton within w_dde_client
end type
type rb_data2 from radiobutton within w_dde_client
end type
type rb_data1 from radiobutton within w_dde_client
end type
type cb_stop from commandbutton within w_dde_client
end type
type cb_starthotlink from commandbutton within w_dde_client
end type
type sle_command from singlelineedit within w_dde_client
end type
type mle_msg from multilineedit within w_dde_client
end type
type cb_getremote from commandbutton within w_dde_client
end type
type cb_exec from commandbutton within w_dde_client
end type
type st_2 from statictext within w_dde_client
end type
type gb_getremote from groupbox within w_dde_client
end type
type gb_hotlinks from groupbox within w_dde_client
end type
type gb_1 from groupbox within w_dde_client
end type
end forward

global type w_dde_client from window
integer x = 1536
integer y = 180
integer width = 1883
integer height = 1576
boolean titlebar = true
string title = "DDE Client Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 78748035
toolbaralignment toolbaralignment = alignatleft!
cb_start cb_start
st_1 st_1
cb_exit cb_exit
rb_gr_data3 rb_gr_data3
rb_gr_data2 rb_gr_data2
rb_gr_data1 rb_gr_data1
rb_data3 rb_data3
rb_data2 rb_data2
rb_data1 rb_data1
cb_stop cb_stop
cb_starthotlink cb_starthotlink
sle_command sle_command
mle_msg mle_msg
cb_getremote cb_getremote
cb_exec cb_exec
st_2 st_2
gb_getremote gb_getremote
gb_hotlinks gb_hotlinks
gb_1 gb_1
end type
global w_dde_client w_dde_client

type prototypes
Function long ShellExecute(long hWnd, string lpOperation, string lpFile, string lpParameters, string lpDirectory, long nShowCmd) Library "shell32.dll" Alias For "ShellExecuteA;ANSI" 

end prototypes

type variables
String is_ddeappl = "Excel"
String is_dde_topic="expense.xls"
String is_hotlink_field = "R1C1"
String is_getremote_field = "R1C1"
string is_hotlink_list[3]
integer ii_hotlink_cnt = 0
boolean  ib_start = false 
end variables

forward prototypes
public subroutine set_msg (string msg)
end prototypes

public subroutine set_msg (string msg);// display the message
mle_msg.text = msg
end subroutine

event close;integer i,resp

// if there are any running hotlinks then stop them before closing
for i = 1 to 3
	if len(is_hotlink_list[i]) > 0 then 
		resp = stophotlink(is_hotlink_list[i], is_ddeappl, is_dde_topic)
	end if
next

if isvalid(w_dde_server) then close(w_dde_server)
end event

event hotlinkalarm;string data
string appl
string topic
string item

// who sent the alarm
getdataddeorigin(appl,topic,item)

// get the data
getdatadde(data)

// tell the sender that we handled the hotlink OK
respondremote(true)
set_msg("Hotlinkalarm triggered. ~r~n  Application = "+appl+" Topic= "+topic+"~r~n  Item = "+item+"~r~n  Data = "+data)

end event

event open;this.Move(0, 0)

end event

on w_dde_client.create
this.cb_start=create cb_start
this.st_1=create st_1
this.cb_exit=create cb_exit
this.rb_gr_data3=create rb_gr_data3
this.rb_gr_data2=create rb_gr_data2
this.rb_gr_data1=create rb_gr_data1
this.rb_data3=create rb_data3
this.rb_data2=create rb_data2
this.rb_data1=create rb_data1
this.cb_stop=create cb_stop
this.cb_starthotlink=create cb_starthotlink
this.sle_command=create sle_command
this.mle_msg=create mle_msg
this.cb_getremote=create cb_getremote
this.cb_exec=create cb_exec
this.st_2=create st_2
this.gb_getremote=create gb_getremote
this.gb_hotlinks=create gb_hotlinks
this.gb_1=create gb_1
this.Control[]={this.cb_start,&
this.st_1,&
this.cb_exit,&
this.rb_gr_data3,&
this.rb_gr_data2,&
this.rb_gr_data1,&
this.rb_data3,&
this.rb_data2,&
this.rb_data1,&
this.cb_stop,&
this.cb_starthotlink,&
this.sle_command,&
this.mle_msg,&
this.cb_getremote,&
this.cb_exec,&
this.st_2,&
this.gb_getremote,&
this.gb_hotlinks,&
this.gb_1}
end on

on w_dde_client.destroy
destroy(this.cb_start)
destroy(this.st_1)
destroy(this.cb_exit)
destroy(this.rb_gr_data3)
destroy(this.rb_gr_data2)
destroy(this.rb_gr_data1)
destroy(this.rb_data3)
destroy(this.rb_data2)
destroy(this.rb_data1)
destroy(this.cb_stop)
destroy(this.cb_starthotlink)
destroy(this.sle_command)
destroy(this.mle_msg)
destroy(this.cb_getremote)
destroy(this.cb_exec)
destroy(this.st_2)
destroy(this.gb_getremote)
destroy(this.gb_hotlinks)
destroy(this.gb_1)
end on

type cb_start from commandbutton within w_dde_client
integer x = 41
integer y = 1344
integer width = 544
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Activate Excel Server"
end type

event clicked;//====================================================================
// Event: Clicked()
//--------------------------------------------------------------------
// Description: Open Excel File
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_close]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2006/04/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string   ls_FilePath
Integer li_return
n_resfile  lnv_file


ls_FilePath = lnv_file.IS_FilePath + 'expense.xls'
if Not FileExists(ls_FilePath) then
	if lnv_file.of_writefile('expense.xls') = -1 then return
end if

ShellExecute(Handle(Parent), "open", ls_FilePath, "", "", 1)
ib_start = true


end event

type st_1 from statictext within w_dde_client
integer x = 105
integer y = 788
integer width = 622
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Please input right Command:"
boolean focusrectangle = false
end type

type cb_exit from commandbutton within w_dde_client
integer x = 1426
integer y = 1344
integer width = 375
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

on clicked;close(parent)
end on

type rb_gr_data3 from radiobutton within w_dde_client
integer x = 722
integer y = 1148
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "R1C3"
end type

on clicked;if this.checked then is_getremote_field= this.text
end on

type rb_gr_data2 from radiobutton within w_dde_client
integer x = 421
integer y = 1148
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "R1C2"
end type

on clicked;if this.checked then is_getremote_field= this.text
end on

type rb_gr_data1 from radiobutton within w_dde_client
integer x = 119
integer y = 1148
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "R1C1"
boolean checked = true
end type

on clicked;if this.checked then is_getremote_field= this.text
end on

type rb_data3 from radiobutton within w_dde_client
integer x = 722
integer y = 520
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "R1C3"
end type

on clicked;if this.checked then is_hotlink_field = this.text
end on

type rb_data2 from radiobutton within w_dde_client
integer x = 421
integer y = 520
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "R1C2"
end type

on clicked;if this.checked then is_hotlink_field = this.text
end on

type rb_data1 from radiobutton within w_dde_client
integer x = 119
integer y = 520
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "R1C1"
boolean checked = true
end type

on clicked;if this.checked then is_hotlink_field = this.text
end on

type cb_stop from commandbutton within w_dde_client
integer x = 1426
integer y = 504
integer width = 334
integer height = 108
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Stop"
end type

event clicked;int resp

resp = stophotlink(is_hotlink_field, is_ddeappl, is_dde_topic)
if resp <> 1 then 
	messagebox("Stophotlink Error", "Error code is: " + string(resp))
	return
ELSE
	mle_msg.text = "Stophotlink Successed!"
end if

this.Enabled = false
cb_starthotlink.Enabled = true

rb_data1.enabled = True
rb_data2.enabled = True
rb_data3.enabled = True

// remove the hotlink field from the hotlink list
for resp = 1 to 3
	if is_hotlink_list[resp] = is_hotlink_field then 
		is_hotlink_list[resp] = ''
		return
	end if
next


end event

type cb_starthotlink from commandbutton within w_dde_client
integer x = 1093
integer y = 504
integer width = 334
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Start "
end type

event clicked;int resp

if not ib_start then
	messagebox("Information","Please click the 'Activate Excel Server' button first.")
	return
end if

resp = starthotlink(is_hotlink_field, is_ddeappl, is_dde_topic)
IF resp <> 1 THEN
	messagebox("Starthotlink Error", "Error code is: " + string(resp))
	return
ELSE
	mle_msg.text = "Starthotlink Successed!"
END IF

this.Enabled = false
cb_stop.Enabled = true

rb_data1.enabled = false
rb_data2.enabled = false
rb_data3.enabled = false

// place the hotlink filed into the hotlink list
for resp = 1 to 3
	if len(is_hotlink_list[resp]) = 0 then 
		is_hotlink_list[resp] = is_hotlink_field
		return
	end if
next


end event

type sle_command from singlelineedit within w_dde_client
integer x = 101
integer y = 852
integer width = 727
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "[save()]"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type mle_msg from multilineedit within w_dde_client
integer x = 37
integer y = 84
integer width = 1769
integer height = 304
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_getremote from commandbutton within w_dde_client
integer x = 1093
integer y = 1128
integer width = 667
integer height = 108
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Getremote "
end type

event clicked;int resp
string data

if not ib_start then
	messagebox("Information","Please click the 'Activate Excel Server' button first.")
	return
end if

resp = getremote(is_getremote_field, data, is_ddeappl, is_dde_topic)
if resp = 1 then 
	set_msg("Getremote " + is_getremote_field + " = " + data)
else
	messagebox("Getremote Error", "Error code is: " + String(resp))
end if
end event

type cb_exec from commandbutton within w_dde_client
integer x = 1093
integer y = 816
integer width = 667
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Execute Command"
end type

event clicked;int resp
string data

if not ib_start then
	messagebox("Information","Please click the 'Activate Excel Server' button first.")
	return
end if

if not cb_starthotlink.enabled then
	cb_stop.triggerevent(clicked!)
end if
// tell the server to execute a command
resp = execremote(sle_command.text,is_ddeappl,is_dde_topic)
if resp <> 1 then messagebox("error on execremote",string(resp))

end event

type st_2 from statictext within w_dde_client
integer x = 37
integer y = 20
integer width = 407
integer height = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "Status :"
end type

type gb_getremote from groupbox within w_dde_client
integer x = 37
integer y = 1024
integer width = 1769
integer height = 296
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "GetRemote"
end type

type gb_hotlinks from groupbox within w_dde_client
integer x = 37
integer y = 400
integer width = 1769
integer height = 296
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Hot Links"
end type

type gb_1 from groupbox within w_dde_client
integer x = 37
integer y = 712
integer width = 1769
integer height = 296
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Execute Remote Command"
end type

