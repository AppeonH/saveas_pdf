$PBExportHeader$u_dw_ribbon_2.sru
$PBExportComments$DataWindow button bar
forward
global type u_dw_ribbon_2 from userobject
end type
type cb_apply from commandbutton within u_dw_ribbon_2
end type
type cb_delete from commandbutton within u_dw_ribbon_2
end type
type cb_new from commandbutton within u_dw_ribbon_2
end type
type cb_last from commandbutton within u_dw_ribbon_2
end type
type cb_prior from commandbutton within u_dw_ribbon_2
end type
type cb_next from commandbutton within u_dw_ribbon_2
end type
type cb_first from commandbutton within u_dw_ribbon_2
end type
type cb_retrieve from commandbutton within u_dw_ribbon_2
end type
type pb_exit from picturebutton within u_dw_ribbon_2
end type
end forward

shared variables

end variables

global type u_dw_ribbon_2 from userobject
integer width = 2693
integer height = 164
boolean border = true
long backcolor = 78682240
long tabtextcolor = 33554432
event close ( )
cb_apply cb_apply
cb_delete cb_delete
cb_new cb_new
cb_last cb_last
cb_prior cb_prior
cb_next cb_next
cb_first cb_first
cb_retrieve cb_retrieve
pb_exit pb_exit
end type
global u_dw_ribbon_2 u_dw_ribbon_2

type variables
datawindow   idw_udo


end variables

forward prototypes
public subroutine uf_setdw (datawindow adw_parm)
public subroutine uf_set_buttons (boolean ab_retrieve, boolean ab_first, boolean ab_next, boolean ab_prior, boolean ab_last, boolean ab_new, boolean ab_delete, boolean ab_apply)
end prototypes

public subroutine uf_setdw (datawindow adw_parm);//====================================================================
// Function: uf_setdw()
//--------------------------------------------------------------------
// Description: set the instance variable idw_udo equal to the datawindow
//	argument passed to this function
//--------------------------------------------------------------------
// Arguments: 
//		value	datawindow	adw_parm		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

idw_udo = adw_parm
end subroutine

public subroutine uf_set_buttons (boolean ab_retrieve, boolean ab_first, boolean ab_next, boolean ab_prior, boolean ab_last, boolean ab_new, boolean ab_delete, boolean ab_apply);//====================================================================
// Function: uf_set_buttons()
//--------------------------------------------------------------------
// Description: enables/disables the command buttons based on the boolean
//				arguments that are passed
//--------------------------------------------------------------------
// Arguments: 
//		value	boolean	ab_retrieve		
//		value	boolean	ab_first   		
//		value	boolean	ab_next    		
//		value	boolean	ab_prior   		
//		value	boolean	ab_last    		
//		value	boolean	ab_new     		
//		value	boolean	ab_delete  		
//		value	boolean	ab_apply   		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

cb_retrieve.Enabled = ab_retrieve
cb_first.Enabled = ab_first
cb_next.Enabled = ab_next
cb_prior.Enabled = ab_prior
cb_last.Enabled = ab_last
cb_new.Enabled = ab_new
cb_delete.Enabled = ab_delete
cb_apply.Enabled = ab_apply

end subroutine

on u_dw_ribbon_2.create
this.cb_apply=create cb_apply
this.cb_delete=create cb_delete
this.cb_new=create cb_new
this.cb_last=create cb_last
this.cb_prior=create cb_prior
this.cb_next=create cb_next
this.cb_first=create cb_first
this.cb_retrieve=create cb_retrieve
this.pb_exit=create pb_exit
this.Control[]={this.cb_apply,&
this.cb_delete,&
this.cb_new,&
this.cb_last,&
this.cb_prior,&
this.cb_next,&
this.cb_first,&
this.cb_retrieve,&
this.pb_exit}
end on

on u_dw_ribbon_2.destroy
destroy(this.cb_apply)
destroy(this.cb_delete)
destroy(this.cb_new)
destroy(this.cb_last)
destroy(this.cb_prior)
destroy(this.cb_next)
destroy(this.cb_first)
destroy(this.cb_retrieve)
destroy(this.pb_exit)
end on

type cb_apply from commandbutton within u_dw_ribbon_2
integer x = 2135
integer y = 16
integer width = 293
integer height = 104
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update"
end type

event clicked;////====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Update the datawindow with any changes that have been made
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 			Date: 2003/12/31
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if idw_udo.Update() = 1 then
	commit;
else
	rollback;
end if

idw_udo.SetFocus()
end event

type cb_delete from commandbutton within u_dw_ribbon_2
integer x = 1833
integer y = 16
integer width = 293
integer height = 104
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Delete the current row of the datawindow and select the current row
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 			Date: 2003/12/31
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

idw_udo.DeleteRow (0)
idw_udo.TriggerEvent (rowfocuschanged!)
idw_udo.SetFocus()
end event

type cb_new from commandbutton within u_dw_ribbon_2
integer x = 1531
integer y = 16
integer width = 293
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "New"
end type

on clicked;// insert a new row in the datawindow before the current row

int	li_row, &
		li_cur_row

li_cur_row = idw_udo.GetRow()
li_row = idw_udo.InsertRow (li_cur_row)
idw_udo.ScrollToRow (li_row)
idw_udo.SetFocus()

end on

type cb_last from commandbutton within u_dw_ribbon_2
integer x = 1230
integer y = 16
integer width = 293
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Last"
end type

on clicked;// scroll to the last row of the datawindow

idw_udo.ScrollToRow (idw_udo.RowCount())
idw_udo.SetFocus()
end on

type cb_prior from commandbutton within u_dw_ribbon_2
integer x = 928
integer y = 16
integer width = 293
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Prior"
end type

on clicked;// scroll to the prior row of the datawindow

idw_udo.ScrollPriorRow()
idw_udo.SetFocus()
end on

type cb_next from commandbutton within u_dw_ribbon_2
integer x = 626
integer y = 16
integer width = 293
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Next"
end type

on clicked;// scroll to the next row of the datawindow

idw_udo.ScrollNextRow()
idw_udo.SetFocus()
end on

type cb_first from commandbutton within u_dw_ribbon_2
integer x = 325
integer y = 16
integer width = 293
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "First"
end type

on clicked;// scroll to the first row of the datawindow

idw_udo.ScrollToRow (1)
idw_udo.SetFocus()

end on

type cb_retrieve from commandbutton within u_dw_ribbon_2
integer x = 23
integer y = 16
integer width = 293
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Retrieve"
end type

on clicked;// retrieve the datawindow

idw_udo.Retrieve()
idw_udo.TriggerEvent (rowfocuschanged!)
idw_udo.SetFocus()

end on

type pb_exit from picturebutton within u_dw_ribbon_2
integer x = 2441
integer y = 16
integer width = 219
integer height = 104
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "exit_new.jpg"
string disabledname = "BorderNone!"
end type

event clicked;// exit this example

parent. Event close()
end event

