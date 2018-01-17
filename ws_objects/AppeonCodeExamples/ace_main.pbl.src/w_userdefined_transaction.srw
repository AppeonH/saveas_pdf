$PBExportHeader$w_userdefined_transaction.srw
forward
global type w_userdefined_transaction from window
end type
type st_1 from statictext within w_userdefined_transaction
end type
type cb_1 from commandbutton within w_userdefined_transaction
end type
type mle_1 from multilineedit within w_userdefined_transaction
end type
type dw_1 from datawindow within w_userdefined_transaction
end type
type rb_3 from radiobutton within w_userdefined_transaction
end type
type rb_2 from radiobutton within w_userdefined_transaction
end type
type rb_1 from radiobutton within w_userdefined_transaction
end type
type gb_2 from groupbox within w_userdefined_transaction
end type
type gb_1 from groupbox within w_userdefined_transaction
end type
end forward

global type w_userdefined_transaction from window
integer width = 2482
integer height = 1692
boolean titlebar = true
string title = "User-Defined Transaction"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_1 cb_1
mle_1 mle_1
dw_1 dw_1
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
gb_2 gb_2
gb_1 gb_1
end type
global w_userdefined_transaction w_userdefined_transaction

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
Transaction its_sql,its_sqt

end variables

forward prototypes
public function integer wf_output (string as_trans)
end prototypes

public function integer wf_output (string as_trans);//====================================================================
// Function: wf_output()
//--------------------------------------------------------------------
// Description:The current transaction object of datawindow 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_trans		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_comment

ls_comment = "The current transaction object of datawindow: "+as_trans+"."
ls_comment+= "~r~n"+"The Rows of DataWindow: "+String(dw_1.RowCount())

mle_1.Text = ls_comment
Return 1




end function

on w_userdefined_transaction.create
this.st_1=create st_1
this.cb_1=create cb_1
this.mle_1=create mle_1
this.dw_1=create dw_1
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.cb_1,&
this.mle_1,&
this.dw_1,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.gb_2,&
this.gb_1}
end on

on w_userdefined_transaction.destroy
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Connection DataBase.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string ls_nullflagA,ls_nullflagB

This.X = 0
This.Y = 0
its_sql = Create Transaction
its_sqt = Create Transaction

its_sql.DBMS = "ODBC"
its_sql.AutoCommit = False
its_sql.DBParm = "ConnectString='DSN=AppeonSample;UID=dba;PWD=sql'"
CONNECT Using its_sql;

If its_sql.SQLCode <> 0 Then
	MessageBox("Appeon","Connection DataBase Failed!")
	Return
End If
rb_1.Checked = true
rb_1.Event clicked()

//connect other database
SetNull(ls_nullflagA)
SetNull(ls_nullflagB)

its_sqt.DBMS = "ODBC"
its_sqt.AutoCommit = False
its_sqt.DBParm = "ConnectString='DSN=AppeonSample2;UID=dba;PWD=sql'"
//run in web  
If ls_nullflagA = ls_nullflagB Then		
    its_sqt.DBMS = "odb-asa7"
    its_sqt.AutoCommit = false
    its_sqt.DBParm = "CacheName='appeonsample2'"
else	 
	
end if
CONNECT Using its_sqt;

If its_sqt.SQLCode <> 0 Then
	MessageBox("Appeon","Connection DataBase Failed!")
	Return
End If



end event

event close;//====================================================================
// Event: close()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_close]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Destroy its_sql
Destroy its_sqt

end event

type st_1 from statictext within w_userdefined_transaction
integer x = 37
integer y = 44
integer width = 1605
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use global or local transaction to connect with different type of database."
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_userdefined_transaction
integer x = 2053
integer y = 1448
integer width = 343
integer height = 92
integer taborder = 60
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
CLOSE(Parent)

end event

type mle_1 from multilineedit within w_userdefined_transaction
integer x = 87
integer y = 1084
integer width = 1874
integer height = 412
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_userdefined_transaction
integer x = 37
integer y = 336
integer width = 2359
integer height = 668
integer taborder = 30
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_3 from radiobutton within w_userdefined_transaction
integer x = 1358
integer y = 188
integer width = 558
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Local Transaction 2 "
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_1.DataObject = "d_userdefined_sqlca"
dw_1.SetTransObject(its_sqt)
dw_1.Retrieve()
wf_output("Local Transaction 2")

end event

type rb_2 from radiobutton within w_userdefined_transaction
integer x = 686
integer y = 188
integer width = 558
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Local Transaction 1"
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_1.DataObject = "d_userdefined_local1"
dw_1.SetTransObject(its_sql)
dw_1.Retrieve()
wf_output("Local Transaction 1")

end event

type rb_1 from radiobutton within w_userdefined_transaction
integer x = 96
integer y = 188
integer width = 558
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Global SQLCA"
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
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_1.DataObject = "d_userdefined_sqlca"
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()
wf_output("Global SQLCA")

end event

type gb_2 from groupbox within w_userdefined_transaction
integer x = 37
integer y = 116
integer width = 2359
integer height = 180
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transaction Object"
end type

type gb_1 from groupbox within w_userdefined_transaction
integer x = 37
integer y = 1020
integer width = 1979
integer height = 520
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Output"
end type

