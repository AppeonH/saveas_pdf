$PBExportHeader$w_timing_object.srw
forward
global type w_timing_object from window
end type
type cb_3 from commandbutton within w_timing_object
end type
type st_2 from statictext within w_timing_object
end type
type sle_time from singlelineedit within w_timing_object
end type
type st_1 from statictext within w_timing_object
end type
type cb_stop from commandbutton within w_timing_object
end type
type cb_start from commandbutton within w_timing_object
end type
end forward

global type w_timing_object from window
integer width = 1678
integer height = 756
boolean titlebar = true
string title = "Timing Object"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
st_2 st_2
sle_time sle_time
st_1 st_1
cb_stop cb_stop
cb_start cb_start
end type
global w_timing_object w_timing_object

type variables
n_timing inv_timing
end variables

on w_timing_object.create
this.cb_3=create cb_3
this.st_2=create st_2
this.sle_time=create sle_time
this.st_1=create st_1
this.cb_stop=create cb_stop
this.cb_start=create cb_start
this.Control[]={this.cb_3,&
this.st_2,&
this.sle_time,&
this.st_1,&
this.cb_stop,&
this.cb_start}
end on

on w_timing_object.destroy
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.sle_time)
destroy(this.st_1)
destroy(this.cb_stop)
destroy(this.cb_start)
end on

event open;this.Move(0, 0)

inv_timing = Create n_timing
end event

event close;if IsValid(inv_timing) then
	inv_timing.Stop()
	Destroy inv_timing
end if
end event

type cb_3 from commandbutton within w_timing_object
integer x = 1221
integer y = 464
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close(Parent)
end event

type st_2 from statictext within w_timing_object
integer x = 78
integer y = 224
integer width = 393
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Current time is:"
boolean focusrectangle = false
end type

type sle_time from singlelineedit within w_timing_object
integer x = 489
integer y = 208
integer width = 549
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_timing_object
integer x = 78
integer y = 44
integer width = 1490
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Get current time with timing object, please click Start button."
boolean focusrectangle = false
end type

type cb_stop from commandbutton within w_timing_object
integer x = 695
integer y = 460
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Stop"
end type

event clicked;inv_timing.Stop()

this.Enabled = false
cb_start.Enabled = true

end event

type cb_start from commandbutton within w_timing_object
integer x = 315
integer y = 460
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Start"
end type

event clicked;inv_timing.of_Start(1, sle_time)

this.Enabled = false
cb_stop.Enabled = true
end event

