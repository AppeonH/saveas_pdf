$PBExportHeader$w_dw_querymode.srw
forward
global type w_dw_querymode from window
end type
type cb_7 from commandbutton within w_dw_querymode
end type
type st_5 from statictext within w_dw_querymode
end type
type st_dwsort from statictext within w_dw_querymode
end type
type st_dwmode from statictext within w_dw_querymode
end type
type st_row from statictext within w_dw_querymode
end type
type sle_row from singlelineedit within w_dw_querymode
end type
type mle_sql from multilineedit within w_dw_querymode
end type
type cb_6 from commandbutton within w_dw_querymode
end type
type cb_5 from commandbutton within w_dw_querymode
end type
type st_1 from statictext within w_dw_querymode
end type
type cb_4 from commandbutton within w_dw_querymode
end type
type cb_3 from commandbutton within w_dw_querymode
end type
type cb_2 from commandbutton within w_dw_querymode
end type
type cb_1 from commandbutton within w_dw_querymode
end type
type dw_1 from datawindow within w_dw_querymode
end type
end forward

global type w_dw_querymode from window
integer width = 2642
integer height = 1888
boolean titlebar = true
string title = "QueryMode And QuerySort"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_7 cb_7
st_5 st_5
st_dwsort st_dwsort
st_dwmode st_dwmode
st_row st_row
sle_row sle_row
mle_sql mle_sql
cb_6 cb_6
cb_5 cb_5
st_1 st_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_dw_querymode w_dw_querymode

on w_dw_querymode.create
this.cb_7=create cb_7
this.st_5=create st_5
this.st_dwsort=create st_dwsort
this.st_dwmode=create st_dwmode
this.st_row=create st_row
this.sle_row=create sle_row
this.mle_sql=create mle_sql
this.cb_6=create cb_6
this.cb_5=create cb_5
this.st_1=create st_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_7,&
this.st_5,&
this.st_dwsort,&
this.st_dwmode,&
this.st_row,&
this.sle_row,&
this.mle_sql,&
this.cb_6,&
this.cb_5,&
this.st_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_dw_querymode.destroy
destroy(this.cb_7)
destroy(this.st_5)
destroy(this.st_dwsort)
destroy(this.st_dwmode)
destroy(this.st_row)
destroy(this.sle_row)
destroy(this.mle_sql)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
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

type cb_7 from commandbutton within w_dw_querymode
integer x = 2217
integer y = 596
integer width = 361
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas( )
end event

type st_5 from statictext within w_dw_querymode
integer x = 27
integer y = 1240
integer width = 2153
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SQL Syntax Generated from Datawindow :"
boolean focusrectangle = false
end type

type st_dwsort from statictext within w_dw_querymode
integer x = 1120
integer y = 124
integer width = 1065
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datawindow QuerySort:"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_dwmode from statictext within w_dw_querymode
integer x = 32
integer y = 124
integer width = 1065
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datawindow QueryMode:"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_row from statictext within w_dw_querymode
integer x = 1609
integer width = 233
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rows Retrieved:"
boolean focusrectangle = false
end type

type sle_row from singlelineedit within w_dw_querymode
integer x = 1842
integer y = 24
integer width = 343
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

type mle_sql from multilineedit within w_dw_querymode
integer x = 27
integer y = 1308
integer width = 2542
integer height = 448
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within w_dw_querymode
integer x = 2217
integer y = 472
integer width = 361
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "QueryClear"
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
// Author: 	xunengli		Date: 2005/01/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_1.setredraw(false)
dw_1.Modify("DataWindow.QueryClear=yes")
st_dwmode.text  = 'Datawindow QueryMode: No'
st_dwsort.text  = 'Datawindow QuerySort: No'
dw_1.setredraw(true)

cb_2.enabled = True
cb_5.enabled = True
end event

type cb_5 from commandbutton within w_dw_querymode
integer x = 2217
integer y = 340
integer width = 361
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "QuerySort"
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
// Author: 	xunengli		Date: 2005/01/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================


//Set the QuerySort properties 
dw_1.Modify("datawindow.querymode= Yes")
dw_1.Modify("DataWindow.QuerySort=yes")

//Clear old SQL Select and row count, if any, from display
mle_sql.text =''
sle_row.text =''

//Show the resulting SQL Select statement
mle_sql.Text = dw_1.GetSQLSelect ()

//Set focus into the DataWindow
dw_1.SetFocus ()

//change datawindow heading to reflect query mode
st_dwsort.text  = 'Datawindow QuerySort: Yes'
st_dwmode.text  = 'Datawindow QueryMode: Yes'
this.enabled = false
end event

type st_1 from statictext within w_dw_querymode
integer x = 50
integer width = 1531
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use the Query Mode or QuerySort to give examples of data you want retrieved or sort. As the criteria is entered, the SQL is built below."
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_dw_querymode
integer x = 2217
integer y = 856
integer width = 361
integer height = 104
integer taborder = 40
integer textsize = -8
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
dw_1.Reset()
cb_2.enabled = True
cb_5.enabled = True
end event

type cb_3 from commandbutton within w_dw_querymode
integer x = 2217
integer y = 1120
integer width = 361
integer height = 104
integer taborder = 40
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

type cb_2 from commandbutton within w_dw_querymode
integer x = 2217
integer y = 208
integer width = 361
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "QueryMode"
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
// Author: 	xunengli		Date: 2005/01/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//Set the QueryMode properties 
dw_1.Modify("datawindow.querymode= Yes")

//Clear old SQL Select and row count, if any, from display
mle_sql.text =''
sle_row.text =''

//Show the resulting SQL Select statement
mle_sql.Text = dw_1.GetSQLSelect ()

//Set focus into the DataWindow
dw_1.SetFocus ()

//change datawindow heading to reflect query mode
st_dwmode.text  = 'Datawindow QueryMode: Yes'

this.enabled = False
end event

type cb_1 from commandbutton within w_dw_querymode
integer x = 2217
integer y = 988
integer width = 361
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Retrieve"
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
// Author: 	xunengli		Date: 2005/01/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2005----???? Appeon Inc.
//====================================================================


// Retrieve from Criteria
dw_1.AcceptText()

// Don't redraw until retrieval is finished
dw_1.SetRedraw (FALSE)

//	Turn off DataWindow Query (Criteria-specification) Mode
dw_1.Object.datawindow.querymode = 'no'
st_dwmode.text  = 'Datawindow QueryMode: No'

//	Show the resulting SQL Select statement
mle_sql.text = dw_1.GetSQLSelect ()
	
//	Retrieve, then redraw
dw_1.Retrieve ()
dw_1.SetRedraw (TRUE)

//	Display count of retrieved rows
sle_row.text = String (dw_1.RowCount() )
cb_2.enabled = True
cb_5.enabled = True

end event

type dw_1 from datawindow within w_dw_querymode
integer x = 27
integer y = 204
integer width = 2158
integer height = 1020
integer taborder = 10
string title = "none"
string dataobject = "d_retrieve_cust"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//====================================================================
// Event: constructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_constructor]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2005/01/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.SetTransObject(sqlca)
sle_row.text = STRING(This.Retrieve())
end event

event itemchanged;/**************************************************************
Show the resulting SQL Select statement
 **************************************************************/
//mle_sql.text = dw_1.Describe ("datawindow.table.select")
mle_sql.text = dw_1.GetSQLSelect()
end event

