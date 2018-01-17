$PBExportHeader$w_dynsql_format3.srw
forward
global type w_dynsql_format3 from window
end type
type cbx_1 from checkbox within w_dynsql_format3
end type
type mle_1 from multilineedit within w_dynsql_format3
end type
type cb_1 from commandbutton within w_dynsql_format3
end type
type gb_7 from groupbox within w_dynsql_format3
end type
type gb_5 from groupbox within w_dynsql_format3
end type
type gb_1 from groupbox within w_dynsql_format3
end type
type lb_1 from listbox within w_dynsql_format3
end type
type sle_9 from singlelineedit within w_dynsql_format3
end type
type cb_5 from commandbutton within w_dynsql_format3
end type
end forward

global type w_dynsql_format3 from window
integer width = 1783
integer height = 1068
boolean titlebar = true
string title = "Dynamic SQL Format 3"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_1 cbx_1
mle_1 mle_1
cb_1 cb_1
gb_7 gb_7
gb_5 gb_5
gb_1 gb_1
lb_1 lb_1
sle_9 sle_9
cb_5 cb_5
end type
global w_dynsql_format3 w_dynsql_format3

on w_dynsql_format3.create
this.cbx_1=create cbx_1
this.mle_1=create mle_1
this.cb_1=create cb_1
this.gb_7=create gb_7
this.gb_5=create gb_5
this.gb_1=create gb_1
this.lb_1=create lb_1
this.sle_9=create sle_9
this.cb_5=create cb_5
this.Control[]={this.cbx_1,&
this.mle_1,&
this.cb_1,&
this.gb_7,&
this.gb_5,&
this.gb_1,&
this.lb_1,&
this.sle_9,&
this.cb_5}
end on

on w_dynsql_format3.destroy
destroy(this.cbx_1)
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.gb_7)
destroy(this.gb_5)
destroy(this.gb_1)
destroy(this.lb_1)
destroy(this.sle_9)
destroy(this.cb_5)
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
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.X = 0
This.Y = 0

end event

type cbx_1 from checkbox within w_dynsql_format3
integer x = 41
integer y = 852
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Center"
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
If This.Checked Then
	Parent.center = True
End If

end event

type mle_1 from multilineedit within w_dynsql_format3
integer x = 78
integer y = 508
integer width = 1550
integer height = 244
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_dynsql_format3
integer x = 1339
integer y = 840
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
CLOSE(Parent)

end event

type gb_7 from groupbox within w_dynsql_format3
integer x = 677
integer y = 52
integer width = 1006
integer height = 368
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Get Employee Name"
end type

type gb_5 from groupbox within w_dynsql_format3
integer x = 41
integer y = 52
integer width = 594
integer height = 368
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Employee ID"
end type

type gb_1 from groupbox within w_dynsql_format3
integer x = 41
integer y = 444
integer width = 1641
integer height = 348
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SQL Syntax"
end type

type lb_1 from listbox within w_dynsql_format3
integer x = 78
integer y = 116
integer width = 512
integer height = 268
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string item[] = {"105","184","586","888"}
borderstyle borderstyle = stylelowered!
end type

type sle_9 from singlelineedit within w_dynsql_format3
integer x = 722
integer y = 292
integer width = 517
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within w_dynsql_format3
integer x = 1271
integer y = 292
integer width = 343
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Execute"
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
String ls_employeeid,ls_fname,ls_lname,sqlstatement
Long ll_employeeid

ls_employeeid = lb_1.SelectedItem()

If IsNull(ls_employeeid) Or LenA(Trim(ls_employeeid)) = 0 Then
	MessageBox("Appeon","Please select an employee ID.")
	Return -1
End If

ll_employeeid = Long(ls_employeeid)

DECLARE my_cursor Dynamic Cursor For SQLSA ;

sqlstatement = "SELECT emp_fname,emp_lname FROM employee WHERE emp_id = ?"

PREPARE SQLSA From :sqlstatement ;

OPEN Dynamic my_cursor Using :ll_employeeid;

FETCH my_cursor Into :ls_fname,:ls_lname ;

CLOSE my_cursor ;

sle_9.Text = ls_fname+" "+ls_lname
mle_1.Text = sqlstatement





end event

