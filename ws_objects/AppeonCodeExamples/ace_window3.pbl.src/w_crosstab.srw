$PBExportHeader$w_crosstab.srw
$PBExportComments$Enhanced crosstab tab window.
forward
global type w_crosstab from window
end type
type cbx_1 from checkbox within w_crosstab
end type
type st_2 from statictext within w_crosstab
end type
type st_status from statictext within w_crosstab
end type
type cb_print from commandbutton within w_crosstab
end type
type cb_close from commandbutton within w_crosstab
end type
type dw_1 from datawindow within w_crosstab
end type
end forward

global type w_crosstab from window
integer x = 87
integer y = 40
integer width = 3310
integer height = 2064
boolean titlebar = true
string title = "Enhanced Crosstab DataWindow"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
cbx_1 cbx_1
st_2 st_2
st_status st_status
cb_print cb_print
cb_close cb_close
dw_1 dw_1
end type
global w_crosstab w_crosstab

forward prototypes
public subroutine wf_change_xtab (ref datawindow adw_datawindow)
end prototypes

event ue_postopen;///////////////////////////////////////////////////////////////////////////////////////////////////
//Ue_postopen for w_crosstab
///////////////////////////////////////////////////////////////////////////////////////////////////

//set the transaction object
dw_1.settransobject(sqlca)

//retrieve the data
dw_1.setredraw(false)
dw_1.retrieve()
st_status.text = " Ready"
dw_1.setredraw(true)
end event

public subroutine wf_change_xtab (ref datawindow adw_datawindow);// This function will dynamically change a crosstab to have a 
// more formatted appearance.

int li_column_count
int li_counter
int li_cur, li_next
string	ls_split
string 	ls_rc, ls_object, ls_return, ls_modstring
string 	ls_temp
string	ls_colname

//returns a list of all of the objects on the datawindow
ls_rc = adw_datawindow.Object.datawindow.objects

li_cur = 1
li_next = pos(ls_rc,'~t')

do until li_next = 0
	ls_object = mid(ls_rc,li_cur, li_next - li_cur)

//center text in the heading	
	If Lower(Left(adw_datawindow.describe(ls_object + ".Band"),6)) = "header"  Then
		ls_modstring = ls_modstring + ls_object + ".Alignment=2 " + &
			ls_object + ".Font.Weight=700 "
	End If

//format detail and total columns differently
	If adw_datawindow.describe(ls_object + ".Type") = "compute"  Then
		ls_temp = adw_datawindow.describe(ls_object + ".Expression")
		If pos(ls_temp,"sum") > 0 Then
			ls_modstring = ls_modstring + ls_object + ".Format='$#,##0' " 
		ElseIf pos(ls_temp,"count") > 0 Then 
			ls_modstring = ls_modstring + ls_object + ".Format='#,##0' " 
		End If
	ElseIf adw_datawindow.describe(ls_object + ".Type") = "column"  Then
		ls_temp = adw_datawindow.describe(ls_object + ".Coltype")
		If pos(ls_temp,"dec") > 0 Then
			ls_modstring = ls_modstring + ls_object + ".Format='$#,##0.00' " 
		ElseIf pos(ls_temp,"num") > 0 Then 
			ls_modstring = ls_modstring + ls_object + ".Format='#,##0.00' " 
		End If
	End If


//loop throgh all the objects on the datawindow
	li_cur = li_next + 1
	li_next = pos(ls_rc,'~t',li_cur)
loop
int li_min, li_x, li_rightside

////find where the crosstab 1st columns stops add a horizontal split bar
//	ls_temp = adw_datawindow.describe("datawindow.crosstab.rows")
//	li_cur = 1
//	li_next = pos(ls_temp,",")
//	li_min = -999
//	//go down through the columns, find the one with the right most ending.
//	do while li_next > 0
//		ls_colname = mid(ls_temp,li_cur,li_next - li_cur)
//		li_x = Integer(adw_datawindow.describe(ls_colname + ".X"))
//		li_rightside = li_x + Integer(adw_datawindow.describe(ls_colname + ".Width"))
//		If li_min < li_rightside Then 
//			ls_split = string (li_rightside)
//			li_min = li_rightside
//
//messagebox(" in loop max is",ls_split)
//		End If
//		li_cur = li_next + 1
//		li_next = pos(ls_temp,",",li_cur)
//	loop
//	
//	
//messagebox("out loop max is ",ls_split)
//
//	ls_modstring = ls_modstring + " Datawindow.HorizontalScrollSplit=" + ls_split
//	ls_modstring = ls_modstring + " Datawindow.HorizontalScrollPosition2=" + ls_split

	ls_return = adw_datawindow.Modify(ls_modstring)
	If ls_return <> "" Then messagebox("Display Change Err" + ls_return, ls_modstring)
	



end subroutine

event resize;///////////////////////////////////////////////////////////////////////////////////////////////////
//Resize script for w_crosstab
///////////////////////////////////////////////////////////////////////////////////////////////////
dw_1.width = workspacewidth() - 50


end event

event open;///////////////////////////////////////////////////////////////////////////////////////////////////
//Open script for w_crosstab
///////////////////////////////////////////////////////////////////////////////////////////////////
this.x = 0
this.y = 0
this.postevent("ue_postopen")
end event

on w_crosstab.create
this.cbx_1=create cbx_1
this.st_2=create st_2
this.st_status=create st_status
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_1=create dw_1
this.Control[]={this.cbx_1,&
this.st_2,&
this.st_status,&
this.cb_print,&
this.cb_close,&
this.dw_1}
end on

on w_crosstab.destroy
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.st_status)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type cbx_1 from checkbox within w_crosstab
integer x = 1591
integer y = 16
integer width = 1010
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 41943040
long backcolor = 74481808
string text = "Just display summary of sales only"
end type

event clicked;if Checked then
	dw_1.object.sales.visible = "0"
else
	dw_1.object.sales.visible = "1"
end if
end event

type st_2 from statictext within w_crosstab
integer x = 123
integer y = 28
integer width = 174
integer height = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Status:"
boolean focusrectangle = false
end type

type st_status from statictext within w_crosstab
integer x = 297
integer y = 20
integer width = 841
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_print from commandbutton within w_crosstab
integer x = 1216
integer y = 1836
integer width = 338
integer height = 100
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
OpenWithParm(w_dw_print_options, dw_1)

If Message.DoubleParm = -1 Then Return
dw_1.Print(True)

end event

type cb_close from commandbutton within w_crosstab
integer x = 1586
integer y = 1836
integer width = 338
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_close
///////////////////////////////////////////////////////////////////////////////////////////////////

Close(parent)
end event

type dw_1 from datawindow within w_crosstab
event ue_messagetext pbm_dwnmessagetext
integer x = 23
integer y = 108
integer width = 3223
integer height = 1692
integer taborder = 10
string dataobject = "d_crosstab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_messagetext;///////////////////////////////////////////////////////////////////////////////////////////////////
// ue_MessageText script for dw_1
///////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////
//This event occurs each time the datawindow has a message to 
//display on status
///////////////////////////////////////////////////////////////////////////////////////////////////

setpointer(hourglass!)
st_status.text = " " + text

end event

event retrievestart;///////////////////////////////////////////////////////////////////////////////////////////////////
// RetrieveStart script for dw_1
///////////////////////////////////////////////////////////////////////////////////////////////////

setpointer(hourglass!)

//Disable buttons
cb_close.enabled = false
cb_print.enabled = false

//Display on-window status
st_status.text = " Retrieving Data..."

end event

event retrieveend;///////////////////////////////////////////////////////////////////////////////////////////////////
// RetrieveEnd script for dw_1
///////////////////////////////////////////////////////////////////////////////////////////////////

//Enable buttons
cb_close.enabled = true
cb_print.enabled = true
end event

