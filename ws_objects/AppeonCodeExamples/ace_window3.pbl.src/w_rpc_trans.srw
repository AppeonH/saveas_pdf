$PBExportHeader$w_rpc_trans.srw
forward
global type w_rpc_trans from window
end type
type cb_reset from commandbutton within w_rpc_trans
end type
type dw_employees from datawindow within w_rpc_trans
end type
type st_10 from statictext within w_rpc_trans
end type
type sle_pct from singlelineedit within w_rpc_trans
end type
type rb_minus from radiobutton within w_rpc_trans
end type
type rb_plus from radiobutton within w_rpc_trans
end type
type dw_dept from datawindow within w_rpc_trans
end type
type st_4 from statictext within w_rpc_trans
end type
type st_3 from statictext within w_rpc_trans
end type
type st_2 from statictext within w_rpc_trans
end type
type cb_2 from commandbutton within w_rpc_trans
end type
type cb_1 from commandbutton within w_rpc_trans
end type
type gb_1 from groupbox within w_rpc_trans
end type
end forward

global type w_rpc_trans from window
integer width = 2487
integer height = 1992
boolean titlebar = true
string title = "Using Transaction Objects to Call Stored Procedures"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_reset cb_reset
dw_employees dw_employees
st_10 st_10
sle_pct sle_pct
rb_minus rb_minus
rb_plus rb_plus
dw_dept dw_dept
st_4 st_4
st_3 st_3
st_2 st_2
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_rpc_trans w_rpc_trans

type variables
Integer	ii_Dept=0
Double	id_Pct = 1.0

end variables

on w_rpc_trans.create
this.cb_reset=create cb_reset
this.dw_employees=create dw_employees
this.st_10=create st_10
this.sle_pct=create sle_pct
this.rb_minus=create rb_minus
this.rb_plus=create rb_plus
this.dw_dept=create dw_dept
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.cb_reset,&
this.dw_employees,&
this.st_10,&
this.sle_pct,&
this.rb_minus,&
this.rb_plus,&
this.dw_dept,&
this.st_4,&
this.st_3,&
this.st_2,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_rpc_trans.destroy
destroy(this.cb_reset)
destroy(this.dw_employees)
destroy(this.st_10)
destroy(this.sle_pct)
destroy(this.rb_minus)
destroy(this.rb_plus)
destroy(this.dw_dept)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;This.x = 0
This.y = 0

dw_dept.setTransObject(sqlca)
dw_dept.InsertRow(0)
dw_employees.setTransObject(sqlca)
end event

type cb_reset from commandbutton within w_rpc_trans
integer x = 1006
integer y = 1744
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Retrieve"
end type

event clicked;dw_dept.accepttext()
ii_Dept = dw_dept.getitemnumber(1,'dept_id')

If isnull(ii_Dept) OR ii_Dept <= 0 Then
	MessageBox("Warning", "Please select a department.", Exclamation!)
	Return
End if

dw_employees.Retrieve(ii_dept)

end event

type dw_employees from datawindow within w_rpc_trans
integer x = 18
integer y = 244
integer width = 2409
integer height = 1468
integer taborder = 40
string title = "none"
string dataobject = "d_salary_rpc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_10 from statictext within w_rpc_trans
integer x = 2350
integer y = 108
integer width = 41
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "%"
boolean focusrectangle = false
end type

type sle_pct from singlelineedit within w_rpc_trans
integer x = 2103
integer y = 100
integer width = 247
integer height = 68
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean autohscroll = false
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

If rb_minus.Checked Then
	id_Pct = 1 - (Double(This.Text) / 100)
Else
	id_Pct = 1 + (Double(This.Text) / 100)
End if

end event

type rb_minus from radiobutton within w_rpc_trans
integer x = 1861
integer y = 144
integer width = 224
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Minus"
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

sle_pct.textcolor = 255
id_Pct = 1 - (Double(sle_pct.Text) / 100)

end event

type rb_plus from radiobutton within w_rpc_trans
integer x = 1861
integer y = 68
integer width = 224
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Plus"
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

sle_pct.textcolor = 0
id_Pct = 1 + (Double(sle_pct.Text) / 100)

end event

type dw_dept from datawindow within w_rpc_trans
integer x = 965
integer y = 24
integer width = 832
integer height = 120
integer taborder = 10
string title = "none"
string dataobject = "d_salary_cond"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within w_rpc_trans
integer x = 27
integer y = 148
integer width = 1093
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Execute button to update salary by RPC method."
boolean focusrectangle = false
end type

type st_3 from statictext within w_rpc_trans
integer x = 27
integer y = 80
integer width = 933
integer height = 52
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "(or deduction) percentage,then click "
boolean focusrectangle = false
end type

type st_2 from statictext within w_rpc_trans
integer x = 27
integer y = 20
integer width = 855
integer height = 48
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Select a Department ,and enter a raise "
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_rpc_trans
integer x = 1371
integer y = 1744
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Execute"
end type

event clicked;u_trans_rpc	lu_trans

//create transaction instance and set connection properties
lu_trans = create u_trans_rpc
lu_trans.DBMS = "ODB-ASA"
lu_trans.AutoCommit = False
lu_trans.DBParm = "ConnectString='DSN=AppeonSample;UID=dba;PWD=sql',CacheName='appeonsample'"

//connect to database using transaction object
Connect using lu_trans;

If lu_trans.sqlcode < 0 Then
	If isValid(lu_trans) Then Destroy lu_trans
	Messagebox("Failed","Connect failed!~r~n" + lu_trans.sqlerrtext )
	Return
End If

//call rpc use transaction object
lu_trans.sp_rpc_call(ii_Dept,id_Pct)

If lu_trans.sqlcode < 0 Then
	Rollback using lu_trans;
	Messagebox("Failed","Execute failed!~r~n" + lu_trans.sqlerrtext )
Else
	//update successful,then refresh
	Commit using lu_trans;
	cb_reset.Event Clicked()	
End If 

//disconnect from database
DisConnect using lu_trans;

If isValid(lu_trans) Then Destroy lu_trans
end event

type cb_1 from commandbutton within w_rpc_trans
integer x = 1737
integer y = 1744
integer width = 343
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
end type

event clicked;Close(Parent)
end event

type gb_1 from groupbox within w_rpc_trans
integer x = 1829
integer y = 16
integer width = 594
integer height = 208
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Salary Treatment"
end type

