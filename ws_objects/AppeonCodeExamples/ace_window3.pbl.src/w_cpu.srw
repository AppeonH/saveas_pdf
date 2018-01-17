$PBExportHeader$w_cpu.srw
$PBExportComments$Use CPU function to show execution time of loop
forward
global type w_cpu from window
end type
type st_6 from statictext within w_cpu
end type
type st_5 from statictext within w_cpu
end type
type cbx_yield from checkbox within w_cpu
end type
type st_elapsed from statictext within w_cpu
end type
type st_count from statictext within w_cpu
end type
type cb_stop from commandbutton within w_cpu
end type
type st_4 from statictext within w_cpu
end type
type em_counter from editmask within w_cpu
end type
type cb_close from commandbutton within w_cpu
end type
type cb_start from commandbutton within w_cpu
end type
type st_3 from statictext within w_cpu
end type
type st_2 from statictext within w_cpu
end type
type st_1 from statictext within w_cpu
end type
end forward

global type w_cpu from window
integer x = 494
integer y = 388
integer width = 2048
integer height = 1032
boolean titlebar = true
string title = "CPU and Yield"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_6 st_6
st_5 st_5
cbx_yield cbx_yield
st_elapsed st_elapsed
st_count st_count
cb_stop cb_stop
st_4 st_4
em_counter em_counter
cb_close cb_close
cb_start cb_start
st_3 st_3
st_2 st_2
st_1 st_1
end type
global w_cpu w_cpu

type variables
boolean ib_break_requested
end variables

event open;// initial value
this.x = 0
this.y = 0
em_counter.text = '100000'
em_counter.setfocus()
end event

on w_cpu.create
this.st_6=create st_6
this.st_5=create st_5
this.cbx_yield=create cbx_yield
this.st_elapsed=create st_elapsed
this.st_count=create st_count
this.cb_stop=create cb_stop
this.st_4=create st_4
this.em_counter=create em_counter
this.cb_close=create cb_close
this.cb_start=create cb_start
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.st_6,&
this.st_5,&
this.cbx_yield,&
this.st_elapsed,&
this.st_count,&
this.cb_stop,&
this.st_4,&
this.em_counter,&
this.cb_close,&
this.cb_start,&
this.st_3,&
this.st_2,&
this.st_1}
end on

on w_cpu.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.cbx_yield)
destroy(this.st_elapsed)
destroy(this.st_count)
destroy(this.cb_stop)
destroy(this.st_4)
destroy(this.em_counter)
destroy(this.cb_close)
destroy(this.cb_start)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

type st_6 from statictext within w_cpu
integer x = 37
integer y = 220
integer width = 1111
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Stop button will not work with Yielding turned off."
boolean focusrectangle = false
end type

type st_5 from statictext within w_cpu
integer x = 32
integer y = 160
integer width = 1033
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Try Loop with and without Yielding. "
boolean focusrectangle = false
end type

type cbx_yield from checkbox within w_cpu
integer x = 1285
integer y = 216
integer width = 494
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Yield() During Loop"
boolean checked = true
boolean lefttext = true
end type

type st_elapsed from statictext within w_cpu
integer x = 649
integer y = 688
integer width = 558
integer height = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_count from statictext within w_cpu
integer x = 649
integer y = 552
integer width = 558
integer height = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_stop from commandbutton within w_cpu
integer x = 1463
integer y = 536
integer width = 329
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "S&top"
boolean default = true
end type

on clicked;ib_break_requested = True
end on

type st_4 from statictext within w_cpu
integer x = 165
integer y = 708
integer width = 471
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Elapsed Seconds:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_counter from editmask within w_cpu
integer x = 649
integer y = 412
integer width = 558
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###"
boolean autoskip = true
boolean spin = true
string minmax = "1~~999999"
end type

type cb_close from commandbutton within w_cpu
integer x = 1463
integer y = 688
integer width = 329
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

on clicked;close (parent)
end on

type cb_start from commandbutton within w_cpu
integer x = 1463
integer y = 396
integer width = 329
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Start"
boolean default = true
end type

event clicked;// Remember the start cpu time in the long variable 'start'
// Loop from 1 to the number in sle_counter, updating the number of
// iterations in sle_total every 10 iterations.
// At the end of the loop, set used to the ending CPU time minus
// the time in 'start' and display seconds used in a message box.
int 		li_ret
long 	ll_index, ll_limit
long 	ll_start,ll_used

ll_limit = Long(em_counter.Text)
st_elapsed.text = ""
ib_break_requested = false
cb_stop.enabled = true
cb_close.enabled = false
cb_start.enabled = false

if ll_limit > 100000 then
	li_ret = messagebox("Careful!", "Do you really want that long a loop?", &
					Exclamation!,yesno!)
	If li_ret = 2 then
		cb_start.enabled = true
		cb_stop.enabled = false
		cb_close.enabled = true		
		return
	end if
End If

ll_start = cpu()
for ll_index = 1 to ll_limit
	If mod(ll_index,10) = 0 Then st_count.text = string( ll_index, "###,##0")

	// This yield function will take place any time the check box is turned on.
	// NOTE: if the checkbox is turned off, The STOP button will not be functional 
	// during the loop, because its message will not be processed until the loop
	// completes.

	If cbx_yield.checked Then Yield ( )
	If ib_break_requested Then EXIT
next

ll_used = Cpu() - ll_start
 
cb_stop.enabled = false
cb_close.enabled = true
cb_start.enabled = true
st_elapsed.text = string(ll_used/1000)
end event

type st_3 from statictext within w_cpu
integer x = 37
integer y = 100
integer width = 855
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Enter loop limit and press Start."
boolean focusrectangle = false
end type

type st_2 from statictext within w_cpu
integer x = 155
integer y = 572
integer width = 480
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Running Count: "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_cpu
integer x = 37
integer y = 436
integer width = 599
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Enter Loop Limit: "
alignment alignment = right!
boolean focusrectangle = false
end type

