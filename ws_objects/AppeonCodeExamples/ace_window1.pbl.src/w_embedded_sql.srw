$PBExportHeader$w_embedded_sql.srw
$PBExportComments$Embedded SQL example
forward
global type w_embedded_sql from window
end type
type cbx_1 from checkbox within w_embedded_sql
end type
type cb_9 from commandbutton within w_embedded_sql
end type
type cb_7 from commandbutton within w_embedded_sql
end type
type dw_1 from datawindow within w_embedded_sql
end type
type cb_6 from commandbutton within w_embedded_sql
end type
type cb_5 from commandbutton within w_embedded_sql
end type
type cb_4 from commandbutton within w_embedded_sql
end type
type cb_3 from commandbutton within w_embedded_sql
end type
type cb_2 from commandbutton within w_embedded_sql
end type
type cb_1 from commandbutton within w_embedded_sql
end type
type gb_1 from groupbox within w_embedded_sql
end type
type gb_2 from groupbox within w_embedded_sql
end type
type gb_3 from groupbox within w_embedded_sql
end type
type mle_result from multilineedit within w_embedded_sql
end type
type mle_syntax from multilineedit within w_embedded_sql
end type
end forward

global type w_embedded_sql from window
integer width = 2661
integer height = 1776
boolean titlebar = true
string title = "Embedded SQL"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_1 cbx_1
cb_9 cb_9
cb_7 cb_7
dw_1 dw_1
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
mle_result mle_result
mle_syntax mle_syntax
end type
global w_embedded_sql w_embedded_sql

on w_embedded_sql.create
this.cbx_1=create cbx_1
this.cb_9=create cb_9
this.cb_7=create cb_7
this.dw_1=create dw_1
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.mle_result=create mle_result
this.mle_syntax=create mle_syntax
this.Control[]={this.cbx_1,&
this.cb_9,&
this.cb_7,&
this.dw_1,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.mle_result,&
this.mle_syntax}
end on

on w_embedded_sql.destroy
destroy(this.cbx_1)
destroy(this.cb_9)
destroy(this.cb_7)
destroy(this.dw_1)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.mle_result)
destroy(this.mle_syntax)
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

//Move this window the left top
This.X = 0
This.Y = 0

//set autocommit property to true.
SQLCA.AutoCommit = True

dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

end event

event close;//====================================================================
// Event: close()
//--------------------------------------------------------------------
// Description: Restore autocommit property setting
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_close]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

COMMIT Using sqlca;
sqlca.AutoCommit = False


end event

type cbx_1 from checkbox within w_embedded_sql
integer x = 1842
integer y = 448
integer width = 361
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "AutoCommit"
boolean checked = true
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
SQLCA.AutoCommit = This.Checked

end event

type cb_9 from commandbutton within w_embedded_sql
integer x = 2235
integer y = 1520
integer width = 343
integer height = 104
integer taborder = 60
integer textsize = -9
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

type cb_7 from commandbutton within w_embedded_sql
integer x = 2235
integer y = 428
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Refresh"
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
dw_1.Retrieve()

end event

type dw_1 from datawindow within w_embedded_sql
integer x = 69
integer y = 80
integer width = 1710
integer height = 532
integer taborder = 20
string title = "none"
string dataobject = "d_dept"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within w_embedded_sql
integer x = 2235
integer y = 304
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Rollback"
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

//////////////////////////////////////////////////////////////////////////////////////////
// Run embedded rollback sql statement
//////////////////////////////////////////////////////////////////////////////////////////
Int    li_Ret

If sqlca.AutoCommit Then
	MessageBox('Alert','Please uncheck AutoCommit to test the embedded ROLLBACK statement.')
	Return
End If

ROLLBACK Using sqlca;

mle_syntax.Text = 'ROLLBACK using SQLCA;'
li_Ret = sqlca.SQLCode
If li_Ret <> 0 Then
	mle_result.TextColor = 255
	mle_result.Text = "Execute embedded SQL error:~r~n"+sqlca.SQLErrText
Else
	mle_result.TextColor = 0
	mle_result.Text = "Data changes have been rollbacked. Please refresh data to check it."
End If



end event

type cb_5 from commandbutton within w_embedded_sql
integer x = 2235
integer y = 176
integer width = 343
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Commit"
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

//////////////////////////////////////////////////////////////////////////////////////////
// Run embedded commit sql statement
//////////////////////////////////////////////////////////////////////////////////////////
Int    li_Ret

If sqlca.AutoCommit Then
	MessageBox('Alert','Please uncheck AutoCommit to test the embedded COMMIT statement.')
	Return
End If

COMMIT Using sqlca;

mle_syntax.Text = 'COMMIT using SQLCA;'
li_Ret = sqlca.SQLCode
If li_Ret <> 0 Then
	mle_result.TextColor = 255
	mle_result.Text = "Execute embedded SQL error:~r~n"+sqlca.SQLErrText
Else
	mle_result.TextColor = 0
	mle_result.Text = "Data changes have been commited. Please refresh data to check it."
End If



end event

type cb_4 from commandbutton within w_embedded_sql
integer x = 2235
integer y = 48
integer width = 343
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update"
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

//////////////////////////////////////////////////////////////////////////////////////////
// Run embedded update sql statement
//////////////////////////////////////////////////////////////////////////////////////////

Int  li_Ret

mle_syntax.Text = "UPDATE department SET dept_head_id = 200 WHERE dept_id=1000;"
UPDATE department Set dept_head_id = 200 Where dept_id = 1000;

li_Ret = sqlca.SQLCode
If li_Ret <> 0 Then
	mle_result.TextColor = 255
	mle_result.Text = "Execute embedded SQL error:~r~n"+sqlca.SQLErrText
Else
	mle_result.TextColor = 0
	mle_result.Text = "The department has been updated. Please refresh data to check it."
End If



end event

type cb_3 from commandbutton within w_embedded_sql
integer x = 1861
integer y = 304
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete"
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

//////////////////////////////////////////////////////////////////////////////////////////
// Run embedded delete sql statement
//////////////////////////////////////////////////////////////////////////////////////////

Int  li_Ret

mle_syntax.Text = "DELETE department WHERE dept_id=1000;"
DELETE department Where dept_id = 1000;

li_Ret = sqlca.SQLCode
If li_Ret <> 0 Then
	mle_result.TextColor = 255
	mle_result.Text = "Execute embedded SQL error:~r~n"+sqlca.SQLErrText
Else
	mle_result.TextColor = 0
	mle_result.Text = "The department has been deleted. Please refresh data to check it."
End If



end event

type cb_2 from commandbutton within w_embedded_sql
integer x = 1865
integer y = 176
integer width = 343
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Insert"
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

//////////////////////////////////////////////////////////////////////////////////////////
// Run embedded insert sql statement
//////////////////////////////////////////////////////////////////////////////////////////

Int  li_Ret

mle_syntax.Text = "INSERT INTO department (dept_id,dept_name,dept_head_id) VALUES ( 1000, 'AppeonTest',100 );"
INSERT Into department (dept_id,dept_name,dept_head_id) Values ( 1000, 'AppeonTest',100 );
//#

li_Ret = sqlca.SQLCode
If li_Ret <> 0 Then
	mle_result.TextColor = 255
	mle_result.Text = "Execute embedded SQL error:~r~n"+sqlca.SQLErrText
Else
	mle_result.TextColor = 0
	mle_result.Text = "New department has been added. Please refresh data to check it."
End If



end event

type cb_1 from commandbutton within w_embedded_sql
integer x = 1865
integer y = 48
integer width = 343
integer height = 104
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select"
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

//////////////////////////////////////////////////////////////////////////////////////////
// Run embedded select sql statement
//////////////////////////////////////////////////////////////////////////////////////////

String  ls_DeptName
Int  li_Ret

mle_syntax.Text = "string  ls_DeptName~r~nSELECT dept_name INTO :ls_DeptName FROM department WHERE dept_id = 100;"
SELECT dept_name Into :ls_DeptName From department Where dept_id = 100;

li_Ret = sqlca.SQLCode
If li_Ret = -1 Then
	mle_result.TextColor = 255
	mle_result.Text = "Execute embedded SQL error:~r~n"+sqlca.SQLErrText
ElseIf li_Ret = 100 Then
	mle_result.TextColor = 255
	mle_result.Text = "Can't find the department from database. Please insert one first."
Else
	mle_result.TextColor = 0
	mle_result.Text = "Return value for local variable 'ls_DeptName' is "+ls_DeptName
End If



end event

type gb_1 from groupbox within w_embedded_sql
integer x = 41
integer y = 1036
integer width = 2537
integer height = 440
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Embedded SQL Syntax"
end type

type gb_2 from groupbox within w_embedded_sql
integer x = 41
integer y = 680
integer width = 2537
integer height = 344
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Return Value"
end type

type gb_3 from groupbox within w_embedded_sql
integer x = 37
integer y = 24
integer width = 1783
integer height = 624
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Data"
end type

type mle_result from multilineedit within w_embedded_sql
integer x = 78
integer y = 744
integer width = 2446
integer height = 248
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type mle_syntax from multilineedit within w_embedded_sql
integer x = 78
integer y = 1116
integer width = 2446
integer height = 324
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

