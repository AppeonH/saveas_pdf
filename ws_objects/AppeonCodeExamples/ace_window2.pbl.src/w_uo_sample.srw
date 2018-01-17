$PBExportHeader$w_uo_sample.srw
$PBExportComments$Contains user objects for checking input, date scroller, and a progress indicator.
forward
global type w_uo_sample from window
end type
type sle_to from singlelineedit within w_uo_sample
end type
type st_6 from statictext within w_uo_sample
end type
type uo_3 from u_date_edit within w_uo_sample
end type
type uo_2 from u_numeric_edit within w_uo_sample
end type
type st_5 from statictext within w_uo_sample
end type
type st_4 from statictext within w_uo_sample
end type
type st_3 from statictext within w_uo_sample
end type
type st_2 from statictext within w_uo_sample
end type
type sle_from from singlelineedit within w_uo_sample
end type
type uo_range_checker from u_range_checker within w_uo_sample
end type
type uo_progress_bar from u_progress_bar within w_uo_sample
end type
type cb_3 from commandbutton within w_uo_sample
end type
type cb_2 from commandbutton within w_uo_sample
end type
type st_1 from statictext within w_uo_sample
end type
type cb_1 from commandbutton within w_uo_sample
end type
type gb_1 from groupbox within w_uo_sample
end type
type gb_2 from groupbox within w_uo_sample
end type
end forward

global type w_uo_sample from window
integer width = 2066
integer height = 864
boolean titlebar = true
string title = "Custom Visual User Objects"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_to sle_to
st_6 st_6
uo_3 uo_3
uo_2 uo_2
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
sle_from sle_from
uo_range_checker uo_range_checker
uo_progress_bar uo_progress_bar
cb_3 cb_3
cb_2 cb_2
st_1 st_1
cb_1 cb_1
gb_1 gb_1
gb_2 gb_2
end type
global w_uo_sample w_uo_sample

type variables

//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dec {2}  ic_pct_complete

end variables

on w_uo_sample.create
this.sle_to=create sle_to
this.st_6=create st_6
this.uo_3=create uo_3
this.uo_2=create uo_2
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.sle_from=create sle_from
this.uo_range_checker=create uo_range_checker
this.uo_progress_bar=create uo_progress_bar
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_1=create st_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.sle_to,&
this.st_6,&
this.uo_3,&
this.uo_2,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.sle_from,&
this.uo_range_checker,&
this.uo_progress_bar,&
this.cb_3,&
this.cb_2,&
this.st_1,&
this.cb_1,&
this.gb_1,&
this.gb_2}
end on

on w_uo_sample.destroy
destroy(this.sle_to)
destroy(this.st_6)
destroy(this.uo_3)
destroy(this.uo_2)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_from)
destroy(this.uo_range_checker)
destroy(this.uo_progress_bar)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y = 0

//////////////////////////////////////////////////////////////////////
// Initialize range checker default values
//////////////////////////////////////////////////////////////////////
uo_range_checker.uf_set_range (Long (sle_from.text), Long (sle_to.text))

//////////////////////////////////////////////////////////////////////
// Overtype mode example only works on Windows
//////////////////////////////////////////////////////////////////////
end event

type sle_to from singlelineedit within w_uo_sample
integer x = 1659
integer y = 176
integer width = 233
integer height = 88
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
string text = "100"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: Call user object function to set the lower and upper range limits.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

uo_range_checker.uf_set_range (Long (sle_from.text), Long (sle_to.text))
end event

type st_6 from statictext within w_uo_sample
integer x = 1541
integer y = 184
integer width = 101
integer height = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "To:"
alignment alignment = right!
boolean focusrectangle = false
end type

type uo_3 from u_date_edit within w_uo_sample
event destroy ( )
integer x = 526
integer y = 24
integer width = 494
integer taborder = 10
long backcolor = 74481808
end type

on uo_3.destroy
call u_date_edit::destroy
end on

type uo_2 from u_numeric_edit within w_uo_sample
event destroy ( )
integer x = 1545
integer y = 24
integer width = 443
integer height = 124
integer taborder = 20
long backcolor = 74481808
end type

on uo_2.destroy
call u_numeric_edit::destroy
end on

type st_5 from statictext within w_uo_sample
integer x = 1097
integer y = 184
integer width = 137
integer height = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "From:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_uo_sample
integer x = 32
integer y = 184
integer width = 567
integer height = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Numeric Range Checker:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_uo_sample
integer x = 32
integer y = 56
integer width = 457
integer height = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Enter a Valid Friday:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_uo_sample
integer x = 1056
integer y = 56
integer width = 489
integer height = 56
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Enter a Valid Number:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_from from singlelineedit within w_uo_sample
integer x = 1262
integer y = 176
integer width = 261
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description:  Call user object function to set the lower and upper range limits.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

uo_range_checker.uf_set_range (Long (sle_from.text), Long (sle_to.text))
end event

type uo_range_checker from u_range_checker within w_uo_sample
integer x = 613
integer y = 176
integer width = 475
integer taborder = 30
long textcolor = 0
long backcolor = 1086902488
end type

type uo_progress_bar from u_progress_bar within w_uo_sample
event destroy ( )
boolean visible = true
integer x = 489
integer y = 368
integer width = 1463
integer height = 68
integer taborder = 60
boolean border = false
end type

on uo_progress_bar.destroy
call u_progress_bar::destroy
end on

type cb_3 from commandbutton within w_uo_sample
integer x = 1664
integer y = 636
integer width = 329
integer height = 108
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close (parent)
end event

type cb_2 from commandbutton within w_uo_sample
integer x = 389
integer y = 480
integer width = 480
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Progress Meter"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Start the progress meter by setting the timer event on the window
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

ic_pct_complete = 0.0
uo_progress_bar.uf_set_position (ic_pct_complete)

//////////////////////////////////////////////////////////////////////
// Update the progress meter each time the timer event is triggered.
// When the progress meter is at 100%, stop triggering the timer evetn.
//////////////////////////////////////////////////////////////////////

DO While ic_pct_complete < 100.0 
	ic_pct_complete = ic_pct_complete + 1
	uo_progress_bar.uf_set_position (ic_pct_complete)
LOOP

end event

type st_1 from statictext within w_uo_sample
integer x = 32
integer y = 380
integer width = 421
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Percent Complete:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_uo_sample
integer x = 1093
integer y = 480
integer width = 480
integer height = 108
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Progress Reset"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

ic_pct_complete = 0.0
uo_progress_bar.uf_set_position (ic_pct_complete)

end event

type gb_1 from groupbox within w_uo_sample
integer x = 14
integer y = 124
integer width = 1979
integer height = 192
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
end type

type gb_2 from groupbox within w_uo_sample
integer x = 14
integer y = 316
integer width = 1979
integer height = 304
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
end type

