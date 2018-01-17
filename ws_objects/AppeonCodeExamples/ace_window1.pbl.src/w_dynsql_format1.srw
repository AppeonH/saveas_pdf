$PBExportHeader$w_dynsql_format1.srw
$PBExportComments$Dynamic SQL: Format 1 Example
forward
global type w_dynsql_format1 from window
end type
type cbx_1 from checkbox within w_dynsql_format1
end type
type cb_close from commandbutton within w_dynsql_format1
end type
type cb_drop from commandbutton within w_dynsql_format1
end type
type cb_create from commandbutton within w_dynsql_format1
end type
type mle_syntax from multilineedit within w_dynsql_format1
end type
type dw_cols from datawindow within w_dynsql_format1
end type
type dw_tables from datawindow within w_dynsql_format1
end type
type cb_alter from commandbutton within w_dynsql_format1
end type
type st_1 from statictext within w_dynsql_format1
end type
type st_2 from statictext within w_dynsql_format1
end type
type st_3 from statictext within w_dynsql_format1
end type
end forward

global type w_dynsql_format1 from window
integer x = 640
integer y = 468
integer width = 1984
integer height = 1484
boolean titlebar = true
string title = "Dynamic SQL Format 1"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_create ( )
event ue_alter ( )
event ue_drop ( )
event ue_open ( )
cbx_1 cbx_1
cb_close cb_close
cb_drop cb_drop
cb_create cb_create
mle_syntax mle_syntax
dw_cols dw_cols
dw_tables dw_tables
cb_alter cb_alter
st_1 st_1
st_2 st_2
st_3 st_3
end type
global w_dynsql_format1 w_dynsql_format1

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

// menuid of the window
menu   im_menuid

// determines whether the "location" tables was created.
// This will tell us whether to drop the table when the 
// window is closed.
boolean   ib_created
end variables

event ue_create();//====================================================================
// Event: ue_create()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Create a new table
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

String	ls_sql
Long	ll_row



ls_sql = "create table location " + &
	"(loc_code char(6), " + &
	"state char(2), " + &
	"city char(20), " + &
	"address char(30), " + &
	"zip_code char(5), " + &
	"phone char(10))"


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Show SQL statement in the microhelp
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

mle_syntax.Text = ("Dynamic SQL Statement:  " + ls_sql)

EXECUTE Immediate :ls_sql;

If sqlca.SQLCode <> 0 Then
	MessageBox("Error", String (sqlca.SQLDBCode) + ":  " + sqlca.SQLErrText, exclamation!)
Else
	ib_created = True
	// Re-retrieve the table and column listings
	cb_alter.Enabled = True
	cb_drop.Enabled = True
	cb_create.Enabled = False
	
	If dw_tables.Retrieve('location') > 0 Then
		
		// Find the row in the tables DataWindow where the new locations table is
		ll_row = dw_tables.Find("tname = 'location'", 1, dw_tables.RowCount())
		If ll_row > 0 Then
			dw_tables.ScrollToRow(ll_row)
			dw_tables.SelectRow(0,False)
			dw_tables.SelectRow(ll_row,True)
		End If
	End If
End If


end event

event ue_alter();//====================================================================
// Event: ue_alter()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Alter the location table by adding a fax column
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

String	ls_sql
Long	ll_row



ls_sql = "alter table location " + &
	"add fax char(10) NULL"


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Show SQL statement in the microhelp
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
mle_syntax.Text = ("Dynamic SQL Statement:  " + ls_sql)


EXECUTE Immediate :ls_sql;

If sqlca.SQLCode <> 0 Then
	MessageBox("Error", String (sqlca.SQLDBCode) + ":  " + sqlca.SQLErrText, exclamation!)
Else
	
	dw_cols.Retrieve (dw_tables.GetItemString(dw_tables.GetRow(),'tname'))
	cb_alter.Enabled = False
End If


end event

event ue_drop();//====================================================================
// Event: ue_drop()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Drop the location table from the database
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

String	ls_sql



ls_sql = "drop table location"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Show SQL statement in the microhelp
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
mle_syntax.Text = ("Dynamic SQL Statement:  " + ls_sql)

EXECUTE Immediate :ls_sql;

If sqlca.SQLCode <> 0 Then
	MessageBox("Error", String(sqlca.SQLDBCode) + ":  " + sqlca.SQLErrText, exclamation!)
Else
	ib_created = False
	cb_alter.Enabled = False
	cb_drop.Enabled = False
	cb_create.Enabled = True
	// Re-retrieve the table and column listings
	dw_cols.Reset()
	If dw_tables.Retrieve('location') > 0 Then
		dw_tables.SetRow(1)
	End If
End If


end event

event ue_open();//====================================================================
// Event: ue_open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Set transaction objects for DataWindows
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
sqlca.AutoCommit = True

dw_tables.SetTransObject (sqlca)
dw_cols.SetTransObject (sqlca)


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the column list for the first table in the table list
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
If dw_tables.Retrieve('location') > 0 Then
	String ls_string
	//	ls_string = dw_tables.object.data[1, 1] unsupport; zhuxinping 2002-12-05]
	ls_string = dw_tables.GetItemString(1,'tname')
	dw_cols.Retrieve (ls_string)
End If

end event

on w_dynsql_format1.create
this.cbx_1=create cbx_1
this.cb_close=create cb_close
this.cb_drop=create cb_drop
this.cb_create=create cb_create
this.mle_syntax=create mle_syntax
this.dw_cols=create dw_cols
this.dw_tables=create dw_tables
this.cb_alter=create cb_alter
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.Control[]={this.cbx_1,&
this.cb_close,&
this.cb_drop,&
this.cb_create,&
this.mle_syntax,&
this.dw_cols,&
this.dw_tables,&
this.cb_alter,&
this.st_1,&
this.st_2,&
this.st_3}
end on

on w_dynsql_format1.destroy
destroy(this.cbx_1)
destroy(this.cb_close)
destroy(this.cb_drop)
destroy(this.cb_create)
destroy(this.mle_syntax)
destroy(this.dw_cols)
destroy(this.dw_tables)
destroy(this.cb_alter)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
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

PostEvent('ue_open')

end event

event closequery;//====================================================================
// Event: closequery()
//--------------------------------------------------------------------
// Description: If the location table was created, drop it
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_closequery]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

If ib_created Then
	ib_created = False
	This.Event ue_drop()
End If

sqlca.AutoCommit = False



end event

type cbx_1 from checkbox within w_dynsql_format1
integer x = 37
integer y = 1268
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

type cb_close from commandbutton within w_dynsql_format1
integer x = 1559
integer y = 1256
integer width = 343
integer height = 92
integer taborder = 80
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

type cb_drop from commandbutton within w_dynsql_format1
integer x = 800
integer y = 28
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Drop"
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
Parent.TriggerEvent('ue_drop')

end event

type cb_create from commandbutton within w_dynsql_format1
integer x = 37
integer y = 28
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Create"
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
Parent.TriggerEvent('ue_create')

end event

type mle_syntax from multilineedit within w_dynsql_format1
integer x = 37
integer y = 904
integer width = 1865
integer height = 316
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 134217750
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_cols from datawindow within w_dynsql_format1
integer x = 987
integer y = 228
integer width = 914
integer height = 576
integer taborder = 20
string dataobject = "d_columns"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_tables from datawindow within w_dynsql_format1
integer x = 37
integer y = 228
integer width = 914
integer height = 576
integer taborder = 10
string dataobject = "d_tables"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//====================================================================
// Event: rowfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	currentrow		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrowchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Select the current row.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
If currentrow > 0 Then
	
	// Highlight the current row
	This.SelectRow (0, False)
	This.SelectRow (currentrow, True)
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Retrieve the columns for the current table selected
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	dw_cols.Retrieve (This.GetItemString(currentrow,'tname'))
End If

end event

type cb_alter from commandbutton within w_dynsql_format1
integer x = 416
integer y = 28
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Alter"
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
Parent.TriggerEvent('ue_alter')

end event

type st_1 from statictext within w_dynsql_format1
integer x = 50
integer y = 148
integer width = 279
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Table List:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_dynsql_format1
integer x = 1019
integer y = 144
integer width = 329
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Column List:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_dynsql_format1
integer x = 37
integer y = 828
integer width = 402
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "SQL Syntax:"
boolean focusrectangle = false
end type

