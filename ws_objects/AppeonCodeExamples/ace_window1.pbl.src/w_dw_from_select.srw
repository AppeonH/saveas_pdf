$PBExportHeader$w_dw_from_select.srw
$PBExportComments$Create DW from user-selected table & columns
forward
global type w_dw_from_select from window
end type
type cb_1 from commandbutton within w_dw_from_select
end type
type rb_dwsyntax from radiobutton within w_dw_from_select
end type
type rb_sql from radiobutton within w_dw_from_select
end type
type dw_new from datawindow within w_dw_from_select
end type
type dw_columns from datawindow within w_dw_from_select
end type
type dw_tables from datawindow within w_dw_from_select
end type
type cb_create from commandbutton within w_dw_from_select
end type
type rb_grid from radiobutton within w_dw_from_select
end type
type rb_freeform from radiobutton within w_dw_from_select
end type
type rb_tabular from radiobutton within w_dw_from_select
end type
type cb_close from commandbutton within w_dw_from_select
end type
type mle_1 from multilineedit within w_dw_from_select
end type
type gb_1 from groupbox within w_dw_from_select
end type
type gb_dwtype from groupbox within w_dw_from_select
end type
type gb_2 from groupbox within w_dw_from_select
end type
type gb_3 from groupbox within w_dw_from_select
end type
type gb_4 from groupbox within w_dw_from_select
end type
type gb_5 from groupbox within w_dw_from_select
end type
end forward

global type w_dw_from_select from window
integer width = 2853
integer height = 1996
boolean titlebar = true
string title = "Create DataWindow from SQL or dwSyntax"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
rb_dwsyntax rb_dwsyntax
rb_sql rb_sql
dw_new dw_new
dw_columns dw_columns
dw_tables dw_tables
cb_create cb_create
rb_grid rb_grid
rb_freeform rb_freeform
rb_tabular rb_tabular
cb_close cb_close
mle_1 mle_1
gb_1 gb_1
gb_dwtype gb_dwtype
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
end type
global w_dw_from_select w_dw_from_select

type variables
string is_report_type, is_table




end variables

forward prototypes
public function string wf_build_sql_syntax ()
public function string wf_build_dw_syntax ()
end prototypes

public function string wf_build_sql_syntax ();// This will build a sql syntax string based on the selected items in 
// the dw_columns and dw_tables datawindows.

// The function will return a string 

string	ls_columns, ls_column, ls_sql_syntax
long	ll_rows, ll_index

//Scan the columns datawindow and find all the selected columns. 
//Build a string of columns based on the selected rows.
ll_rows = dw_columns.RowCount ( )

For ll_index = 1 to ll_rows
	If dw_columns.IsSelected(ll_index) Then 
		If ls_columns <> "" Then ls_columns = ls_columns + ", "
//		ls_column = dw_columns.object.data[ll_index, 1]
		ls_column = dw_columns.GetItemString(ll_index, 1)
		ls_columns = ls_columns + ls_column
	End If
Next

//contsruct the sql string 
If ls_columns <> "" Then		
	// Construct the Select statement
	ls_sql_syntax = "Select " + ls_columns + " from " + is_table
	return ls_sql_syntax
Else
	return ""
End If
end function

public function string wf_build_dw_syntax ();//This function will build the datawindow syntax based on the columns, and rows
//selected and the radio button for datawindow style.

//The function returns a string with the syntax in it.

string	ls_dw_err,	ls_dw_syntax, ls_style,	ls_sql_syntax

// Construct the style options
ls_style = "style(type=" + is_report_type + ") datawindow(units=2 )"

// Create the DW syntax from the select
ls_dw_err = ""

//If there is now sql then do not build a syntax string
ls_sql_syntax =  wf_build_sql_syntax()
If ls_sql_syntax = "" Then
	return ""
Else
	ls_dw_syntax = SQLCA.SyntaxFromSQL(wf_build_sql_syntax(), ls_style, ls_dw_err)
	if ls_dw_err <> "" then
		MessageBox("Error!", ls_dw_err)
	end if
	return ls_dw_syntax
End If

end function

event open;//call super::open;//Open script for w_dw_from_select
long	ll_ret

This.X = 0
This.Y = 0
// For new datawindows, the default units will be inches, the default
// style will be tabular.
is_report_type = "grid"


sqlca.AutoCommit = True

dw_columns.SetTransObject(sqlca)
dw_tables.SetTransObject(sqlca)

// f_set_table_select is a user function to modify the select used by
// the table selection data window, based on which DBMS we're connected
// to; This function adjusts to the differences in catalog structures
// between the DBMS's

if f_set_table_select(dw_tables) < 0 then
	MessageBox("Error", &
					"Unable to set SQL select statement for tables list", &
					StopSign!)
	this.TriggerEvent(Close!)
end if

ll_ret = dw_tables.Retrieve( )
if ll_ret < 1 then
	MessageBox ("Retrieve return code is:", ll_ret)
end if

dw_tables.setfilter("tname <> 't_examples'")
dw_tables.filter()
end event

on w_dw_from_select.create
this.cb_1=create cb_1
this.rb_dwsyntax=create rb_dwsyntax
this.rb_sql=create rb_sql
this.dw_new=create dw_new
this.dw_columns=create dw_columns
this.dw_tables=create dw_tables
this.cb_create=create cb_create
this.rb_grid=create rb_grid
this.rb_freeform=create rb_freeform
this.rb_tabular=create rb_tabular
this.cb_close=create cb_close
this.mle_1=create mle_1
this.gb_1=create gb_1
this.gb_dwtype=create gb_dwtype
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.Control[]={this.cb_1,&
this.rb_dwsyntax,&
this.rb_sql,&
this.dw_new,&
this.dw_columns,&
this.dw_tables,&
this.cb_create,&
this.rb_grid,&
this.rb_freeform,&
this.rb_tabular,&
this.cb_close,&
this.mle_1,&
this.gb_1,&
this.gb_dwtype,&
this.gb_2,&
this.gb_3,&
this.gb_4,&
this.gb_5}
end on

on w_dw_from_select.destroy
destroy(this.cb_1)
destroy(this.rb_dwsyntax)
destroy(this.rb_sql)
destroy(this.dw_new)
destroy(this.dw_columns)
destroy(this.dw_tables)
destroy(this.cb_create)
destroy(this.rb_grid)
destroy(this.rb_freeform)
destroy(this.rb_tabular)
destroy(this.cb_close)
destroy(this.mle_1)
destroy(this.gb_1)
destroy(this.gb_dwtype)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event close;//Close script for w_dw_from_select

sqlca.AutoCommit = False

//w_main.Show( )
end event

type cb_1 from commandbutton within w_dw_from_select
integer x = 2359
integer y = 276
integer width = 375
integer height = 96
integer taborder = 130
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_new.saveas( )
end event

type rb_dwsyntax from radiobutton within w_dw_from_select
integer x = 1737
integer y = 612
integer width = 389
integer height = 64
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "DW Synta&x"
end type

on clicked;//call funtion to build datawindow syntax -- update mle to display result
mle_1.text = wf_build_dw_syntax()

end on

type rb_sql from radiobutton within w_dw_from_select
integer x = 1737
integer y = 520
integer width = 389
integer height = 64
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&SQL"
boolean checked = true
end type

on clicked;//call function to build sql syntax-- set mle to result

mle_1.text = wf_build_sql_syntax ()
end on

type dw_new from datawindow within w_dw_from_select
integer x = 82
integer y = 1316
integer width = 2656
integer height = 512
integer taborder = 110
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_columns from datawindow within w_dw_from_select
integer x = 859
integer y = 60
integer width = 658
integer height = 616
integer taborder = 20
string dataobject = "d_column_list"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for dw_columns
//////////////////////////////////////////////////////////////////////////////////////////////////////////

// If user clicks on no row do not continue processing
If row = 0 Then Return	

// As a column is selected, add it to the list in the select
//If already selected, turn off selection
If dw_columns.IsSelected(row) then
	dw_columns.SelectRow(row, False)
Else
	dw_columns.SelectRow(row, True)
End If

//update the multilineedit to display the updated syntax
If rb_sql.checked Then
	mle_1.text = wf_build_sql_syntax()
else
	mle_1.text = wf_build_dw_syntax()
End If
end event

type dw_tables from datawindow within w_dw_from_select
integer x = 82
integer y = 60
integer width = 658
integer height = 616
integer taborder = 10
string dataobject = "d_table_list"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for dw_tables
///////////////////////////////////////////////////////////////////////////////////////////////////////

// if user clicks on no row do not continue processing
If row = 0 Then Return	

// Select the clicked row
dw_tables.SelectRow(0, False)
dw_tables.SelectRow(row, True)

// f_set_column_select is a user function to modify the select used by
// the column selection data window, based on which DBMS we're connected
// to; This function adjusts to the differences in catalog structures
// between the DBMS's

//is_Table = dw_tables.Object.data[row, 1]
is_Table = dw_tables.GetItemString(row, 1)

If f_set_column_select(dw_columns,string(dw_tables.GetItemString(row, 2))) < 0 Then
	MessageBox("Error", &
					"Unable to Set SQL Select statement For Columns list", &
					StopSign!)
	Return
End If

dw_columns.Retrieve( )	  /* Note:  No Retrieve argument is used, 
									  since F_SET_COLUMN_SELECT inserts
									  the proper table name */

end event

type cb_create from commandbutton within w_dw_from_select
integer x = 2359
integer y = 40
integer width = 375
integer height = 96
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Create &DW"
end type

event clicked;//Clicked script for cb_syntax
string 	ls_sql_syntax, ls_style, ls_dw_syntax, ls_dw_err

// Recreate the DW from the syntax; first, be sure there's 
// something there.
if mle_1.text = "" then
	MessageBox("Sorry!", "No Syntax Exists. Enter valid SQL or " &
	+ "DataWindow Syntax or Select Table and Columns and then click Create")
	Return
end if

// Construct the style options
//ls_style = "style(type=" + is_report_type + ") datawindow(units=2 color=12632256)"
ls_style = "style(type=" + is_report_type + ")"

// Create a datawindow from the MLE. If it displays SQL Syntax, then build
// datawindow from SQL syntax. If it displays DW Syntax, then build 
// from the datawindow syntax.
If rb_sql.checked Then
	ls_sql_syntax = mle_1.text
	ls_dw_err = ""
	
	ls_dw_syntax = SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_style, ls_dw_err)
	If ls_dw_err <> "" Then
		MessageBox("Sorry!", ls_dw_err)
		Return
	End If
	dw_new.Create(ls_dw_syntax)
Else
	dw_new.Create(mle_1.text)
End If


//Retrieve into the new datawindow
dw_new.SetTransObject(sqlca)
dw_new.Retrieve( )

dw_new.SetPosition(ToTop!)

end event

type rb_grid from radiobutton within w_dw_from_select
integer x = 1737
integer y = 300
integer width = 389
integer height = 64
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Grid"
boolean checked = true
end type

on clicked;//Clicked script for rb_3

// Set style of DW to be created to be 'grid'

if this.checked then is_report_type = "grid"

//If displaying the dwsyntax, need to update the box based on new display format
If rb_dwsyntax.checked Then
	rb_dwsyntax.triggerevent("clicked")
End If
end on

type rb_freeform from radiobutton within w_dw_from_select
integer x = 1737
integer y = 84
integer width = 389
integer height = 64
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Free Form"
end type

on clicked;//Clicked script for rb_2

// Set style of DW to be created to be 'form'

if this.checked then is_report_type = "form"

//If displaying the dwsyntax, need to update the box based on new display format
If rb_dwsyntax.checked Then
	rb_dwsyntax.triggerevent("clicked")
End If
end on

type rb_tabular from radiobutton within w_dw_from_select
integer x = 1737
integer y = 188
integer width = 389
integer height = 64
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Tabular"
end type

on clicked;//Clicked script for rb_1

// Set style of DW to be created to be 'tabular'

if this.checked then is_report_type = "tabular"

//If displaying the dwsyntax, need to update the box based on new display format
If rb_dwsyntax.checked Then
	rb_dwsyntax.triggerevent("clicked")
End If
end on

type cb_close from commandbutton within w_dw_from_select
integer x = 2359
integer y = 152
integer width = 375
integer height = 96
integer taborder = 120
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;//Clicked script for cb_close
Close(parent)
end on

type mle_1 from multilineedit within w_dw_from_select
integer x = 82
integer y = 776
integer width = 2656
integer height = 432
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
long textcolor = 41943040
long backcolor = 74481808
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_dw_from_select
integer x = 1600
integer y = 444
integer width = 681
integer height = 272
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Display"
end type

type gb_dwtype from groupbox within w_dw_from_select
integer x = 1595
integer width = 681
integer height = 432
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "DataWindow Type"
end type

type gb_2 from groupbox within w_dw_from_select
integer x = 814
integer width = 750
integer height = 716
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Select a Column"
end type

type gb_3 from groupbox within w_dw_from_select
integer x = 37
integer width = 750
integer height = 716
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Select a Table"
end type

type gb_4 from groupbox within w_dw_from_select
integer x = 37
integer y = 720
integer width = 2752
integer height = 524
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Syntax"
end type

type gb_5 from groupbox within w_dw_from_select
integer x = 37
integer y = 1256
integer width = 2752
integer height = 612
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "DataWindow"
end type

