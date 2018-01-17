$PBExportHeader$w_cursor.srw
forward
global type w_cursor from window
end type
type cb_6 from commandbutton within w_cursor
end type
type cb_5 from commandbutton within w_cursor
end type
type cb_4 from commandbutton within w_cursor
end type
type cb_3 from commandbutton within w_cursor
end type
type st_2 from statictext within w_cursor
end type
type st_1 from statictext within w_cursor
end type
type cb_2 from commandbutton within w_cursor
end type
type cb_1 from commandbutton within w_cursor
end type
type dw_cursor from datawindow within w_cursor
end type
type dw_emp from datawindow within w_cursor
end type
end forward

global type w_cursor from window
integer width = 2331
integer height = 1340
boolean titlebar = true
string title = "Operating Cursor and Stored Procedure"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
st_2 st_2
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_cursor dw_cursor
dw_emp dw_emp
end type
global w_cursor w_cursor

on w_cursor.create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_cursor=create dw_cursor
this.dw_emp=create dw_emp
this.Control[]={this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.st_2,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_cursor,&
this.dw_emp}
end on

on w_cursor.destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_cursor)
destroy(this.dw_emp)
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.X = 0
This.Y = 0

//Set Transaction;
dw_Emp.SetTransObject(Sqlca)
dw_Cursor.SetTransObject(Sqlca)
dw_Emp.Retrieve()



end event

type cb_6 from commandbutton within w_cursor
integer x = 1943
integer y = 12
integer width = 247
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas2"
end type

event clicked;dw_cursor.saveas( )
end event

type cb_5 from commandbutton within w_cursor
integer x = 699
integer y = 16
integer width = 247
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas1"
end type

event clicked;dw_emp.saveas( )
end event

type cb_4 from commandbutton within w_cursor
integer x = 727
integer y = 1100
integer width = 425
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Run Procedure"
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
Integer li_id
String ls_fname,ls_lname
Long   ll_NewRow,ll_RowCount


DECLARE get_emp Procedure For sp_get_employee  ;

//Open PROCEDURE;	 
EXECUTE get_emp;
//Fetch data from PROCEDURE;
FETCH get_emp Into :li_id,:ls_fname,:ls_lname;

Do While SqlCa.SQLCode = 0
	ll_RowCount = Dw_Cursor.RowCount() +1
	ll_NewRow = Dw_Cursor.InsertRow(ll_RowCount)
	Dw_Cursor.SetItem(ll_NewRow,'emp_id',li_id)
	Dw_Cursor.SetItem(ll_NewRow,'emp_fname',ls_fname)
	Dw_Cursor.SetItem(ll_NewRow,'emp_lname',ls_lname)
	FETCH get_emp Into :li_id,:ls_fname,:ls_lname;
Loop

CLOSE get_emp;




end event

type cb_3 from commandbutton within w_cursor
integer x = 1929
integer y = 1100
integer width = 315
integer height = 92
integer taborder = 30
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

type st_2 from statictext within w_cursor
integer x = 1184
integer y = 48
integer width = 658
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Destination DataWindow"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cursor
integer x = 46
integer y = 44
integer width = 585
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Source DataWindow"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_cursor
integer x = 1573
integer y = 1100
integer width = 315
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
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
dw_cursor.Reset()

end event

type cb_1 from commandbutton within w_cursor
integer x = 1193
integer y = 1100
integer width = 338
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Run Cursor"
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
Integer li_id
String ls_fname,ls_lname
Long   ll_NewRow,ll_RowCount

DECLARE Cur_Emp CURSOR FOR
	SELECT "employee"."emp_id",
	"employee"."emp_fname",
	"employee"."emp_lname"
	FROM "employee"
	Order By "employee"."emp_id" Asc  ;
	
//Open cursor;	 
OPEN Cur_Emp;
//Fetch data from cursor;
FETCH Cur_Emp Into :li_id,:ls_fname,:ls_lname;

Do While SqlCa.SQLCode = 0
	ll_RowCount = Dw_Cursor.RowCount() +1
	ll_NewRow = Dw_Cursor.InsertRow(ll_RowCount)
	Dw_Cursor.SetItem(ll_NewRow,'emp_id',li_id)
	Dw_Cursor.SetItem(ll_NewRow,'emp_fname',ls_fname)
	Dw_Cursor.SetItem(ll_NewRow,'emp_lname',ls_lname)
	FETCH Cur_Emp Into :li_id,:ls_fname,:ls_lname;
Loop

CLOSE Cur_Emp;



end event

type dw_cursor from datawindow within w_cursor
integer x = 1161
integer y = 112
integer width = 1083
integer height = 948
integer taborder = 20
string title = "none"
string dataobject = "d_employee"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_emp from datawindow within w_cursor
integer x = 41
integer y = 112
integer width = 1083
integer height = 948
integer taborder = 10
string title = "none"
string dataobject = "d_employee"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

