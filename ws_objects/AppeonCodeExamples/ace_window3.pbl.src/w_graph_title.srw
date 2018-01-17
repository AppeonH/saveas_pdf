$PBExportHeader$w_graph_title.srw
$PBExportComments$General response window to modify a graph title
forward
global type w_graph_title from window
end type
type cb_cancel from commandbutton within w_graph_title
end type
type cb_ok from commandbutton within w_graph_title
end type
type sle_title from singlelineedit within w_graph_title
end type
end forward

global type w_graph_title from window
integer x = 677
integer y = 740
integer width = 1417
integer height = 408
boolean titlebar = true
string title = "Enter Graph Title"
boolean controlmenu = true
boolean resizable = true
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
cb_cancel cb_cancel
cb_ok cb_ok
sle_title sle_title
end type
global w_graph_title w_graph_title

type variables
object io_passed
graph igr_parm
datawindow idw_parm
string is_original_title
end variables

event open;call super::open;// The calling window has passed the current graph object. Initialize 
// the Single Line Edit so the user can modify it.
// the  graph object 'igr_parm' is declared as an instance variable.
graphicobject lgro_hold

lgro_hold = message.powerobjectparm
If lgro_hold.TypeOf() = Graph! Then
	io_passed = Graph!
	igr_parm = message.powerobjectparm
	sle_title.text = igr_parm.title
	sle_title.SelectText (1,999)
	
	// Remember the original title, in case they cancel
	is_original_title = igr_parm.title
Elseif lgro_hold.TypeOf() = Datawindow! Then
	io_passed = Datawindow!
	idw_parm = message.powerobjectparm
	sle_title.text = idw_parm.Object.gr_1.title
	sle_title.SelectText (1,999)

	// Remember original title, in case they cancel
	is_original_title = sle_title.text
End If

end event

on w_graph_title.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_title=create sle_title
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.sle_title}
end on

on w_graph_title.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.sle_title)
end on

type cb_cancel from commandbutton within w_graph_title
integer x = 745
integer y = 184
integer width = 265
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;// Reset the graph title to the original title, since the user
// has hit cancel.

If io_passed = Graph! Then
	igr_parm.title = is_original_title
Elseif io_passed = Datawindow! Then
	// Set the graph title in the datawindow to the modified text.
	idw_parm.Object.gr_1.title = is_original_title
End If

Close (parent)
end event

type cb_ok from commandbutton within w_graph_title
integer x = 430
integer y = 184
integer width = 265
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

on clicked;Close (parent) 
end on

type sle_title from singlelineedit within w_graph_title
integer x = 73
integer y = 60
integer width = 1253
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
borderstyle borderstyle = stylelowered!
end type

event modified;If io_passed = Graph! Then
	igr_parm.title = this.text
Elseif io_passed = Datawindow! Then
	// Set the graph title in the datawindow to the modified text.
	idw_parm.Object.gr_1.title = this.text
End If
end event

