$PBExportHeader$w_n_up.srw
$PBExportComments$Window that shows a DataWindow with 2 rows up per row displayed.
forward
global type w_n_up from window
end type
type cb_1 from commandbutton within w_n_up
end type
type cb_retrieve from commandbutton within w_n_up
end type
type cb_update from commandbutton within w_n_up
end type
type cb_print from commandbutton within w_n_up
end type
type cb_close from commandbutton within w_n_up
end type
type dw_my_nup from datawindow within w_n_up
end type
end forward

global type w_n_up from window
integer x = 146
integer y = 320
integer width = 2789
integer height = 1904
boolean titlebar = true
string title = "Enhanced N-Up Datawindow"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
cb_1 cb_1
cb_retrieve cb_retrieve
cb_update cb_update
cb_print cb_print
cb_close cb_close
dw_my_nup dw_my_nup
end type
global w_n_up w_n_up

on ue_postopen;dw_my_nup.settransobject(sqlca)
dw_my_nup.retrieve()
end on

event open;this.x = 0
this.y = 0

this.postevent("ue_postopen")

end event

on w_n_up.create
this.cb_1=create cb_1
this.cb_retrieve=create cb_retrieve
this.cb_update=create cb_update
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_my_nup=create dw_my_nup
this.Control[]={this.cb_1,&
this.cb_retrieve,&
this.cb_update,&
this.cb_print,&
this.cb_close,&
this.dw_my_nup}
end on

on w_n_up.destroy
destroy(this.cb_1)
destroy(this.cb_retrieve)
destroy(this.cb_update)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_my_nup)
end on

type cb_1 from commandbutton within w_n_up
integer x = 315
integer y = 1660
integer width = 361
integer height = 96
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Saveas"
end type

event clicked;dw_my_nup.saveas( )
end event

type cb_retrieve from commandbutton within w_n_up
integer x = 699
integer y = 1660
integer width = 361
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Retrieve"
end type

event clicked;dw_my_nup.Retrieve()
end event

type cb_update from commandbutton within w_n_up
integer x = 1083
integer y = 1660
integer width = 361
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Update"
end type

event clicked;dw_my_nup.AcceptText()
if dw_my_nup.ModifiedCount()<=0 then Return

If dw_my_nup.Update()=1 Then
	Commit;
	Messagebox(Parent.Title, "Update Successfull!")
Else	
	Rollback;
	Messagebox(Parent.Title, "Update Failed!")
End If


end event

type cb_print from commandbutton within w_n_up
integer x = 1467
integer y = 1660
integer width = 361
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print..."
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
OpenWithParm(w_dw_print_options, dw_my_nup)

If Message.DoubleParm = -1 Then Return
dw_my_nup.Print(True)

end event

type cb_close from commandbutton within w_n_up
integer x = 1851
integer y = 1660
integer width = 361
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;close(parent)
end event

type dw_my_nup from datawindow within w_n_up
integer x = 32
integer y = 40
integer width = 2679
integer height = 1568
integer taborder = 10
string dataobject = "d_n_up"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;messagebox("", sqlerrtext)
end event

