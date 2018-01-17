$PBExportHeader$w_about.srw
$PBExportComments$About box for examples
forward
global type w_about from window
end type
type st_4 from statictext within w_about
end type
type st_exver from statictext within w_about
end type
type cb_ok from commandbutton within w_about
end type
type st_3 from statictext within w_about
end type
type st_1 from statictext within w_about
end type
type st_2 from statictext within w_about
end type
end forward

global type w_about from window
integer x = 731
integer y = 940
integer width = 1659
integer height = 804
boolean titlebar = true
string title = "About"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79416533
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
st_4 st_4
st_exver st_exver
cb_ok cb_ok
st_3 st_3
st_1 st_1
st_2 st_2
end type
global w_about w_about

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
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer	ii_Cntr

end variables

on w_about.create
this.st_4=create st_4
this.st_exver=create st_exver
this.cb_ok=create cb_ok
this.st_3=create st_3
this.st_1=create st_1
this.st_2=create st_2
this.Control[]={this.st_4,&
this.st_exver,&
this.cb_ok,&
this.st_3,&
this.st_1,&
this.st_2}
end on

on w_about.destroy
destroy(this.st_4)
destroy(this.st_exver)
destroy(this.cb_ok)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.st_2)
end on

type st_4 from statictext within w_about
integer y = 424
integer width = 1646
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = " All rights reserved."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_exver from statictext within w_about
integer y = 156
integer width = 1646
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "Last Updated: February  28, 2009"
alignment alignment = center!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_about
integer x = 667
integer y = 572
integer width = 320
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: close currently window
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	         		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Close(Parent)
end event

type st_3 from statictext within w_about
integer y = 348
integer width = 1646
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "Copyright (c) 2000-2009 Appeon, Inc. and its subsidiaries. "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_about
integer y = 24
integer width = 1646
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "Appeon Code Examples"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_about
integer y = 216
integer width = 1646
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
string text = "By Appeon"
alignment alignment = center!
boolean focusrectangle = false
end type

