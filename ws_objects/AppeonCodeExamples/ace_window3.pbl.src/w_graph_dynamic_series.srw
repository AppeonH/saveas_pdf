$PBExportHeader$w_graph_dynamic_series.srw
$PBExportComments$Example showing dynamically adding a series to a graph
forward
global type w_graph_dynamic_series from window
end type
type cb_1 from commandbutton within w_graph_dynamic_series
end type
type cb_print from commandbutton within w_graph_dynamic_series
end type
type cb_close from commandbutton within w_graph_dynamic_series
end type
type cb_mod from commandbutton within w_graph_dynamic_series
end type
type dw_1 from datawindow within w_graph_dynamic_series
end type
end forward

global type w_graph_dynamic_series from window
string tag = "Graph Dynamic Series"
integer x = 78
integer y = 188
integer width = 2761
integer height = 1552
boolean titlebar = true
string title = "Dynamically Adding a Series to a Graph"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
cb_print cb_print
cb_close cb_close
cb_mod cb_mod
dw_1 dw_1
end type
global w_graph_dynamic_series w_graph_dynamic_series

event open;// initial value
this.x = 0
this.y = 0
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

end event

on w_graph_dynamic_series.create
this.cb_1=create cb_1
this.cb_print=create cb_print
this.cb_close=create cb_close
this.cb_mod=create cb_mod
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.cb_print,&
this.cb_close,&
this.cb_mod,&
this.dw_1}
end on

on w_graph_dynamic_series.destroy
destroy(this.cb_1)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.cb_mod)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_graph_dynamic_series
integer x = 2331
integer y = 384
integer width = 384
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
boolean cancel = true
end type

event clicked;dw_1.saveas( )
end event

type cb_print from commandbutton within w_graph_dynamic_series
integer x = 2331
integer y = 160
integer width = 384
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print..."
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
OpenWithParm(w_dw_print_options, dw_1)

If Message.DoubleParm = -1 Then Return
dw_1.Print(True)

end event

type cb_close from commandbutton within w_graph_dynamic_series
integer x = 2331
integer y = 264
integer width = 384
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_mod from commandbutton within w_graph_dynamic_series
integer x = 2331
integer y = 56
integer width = 384
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Series"
end type

event clicked;If This.Text = "Add Series" Then
	// add the series to the graph
	dw_1.Modify("gr_1.series = 'quarter' ")
	This.Text = "Remove Series"

Else
	// remove series from graph
	dw_1.Modify("gr_1.series = '~"noseries ~" ' ")
	This.Text = "Add Series"
End If

end event

type dw_1 from datawindow within w_graph_dynamic_series
integer x = 9
integer y = 20
integer width = 2286
integer height = 1400
integer taborder = 10
string dataobject = "d_graph_dynamic_series"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

