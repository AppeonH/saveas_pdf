$PBExportHeader$w_parser_sql.srw
$PBExportComments$SQL Parse Service
forward
global type w_parser_sql from window
end type
type cb_3 from commandbutton within w_parser_sql
end type
type st_1 from statictext within w_parser_sql
end type
type st_9 from statictext within w_parser_sql
end type
type sle_where from singlelineedit within w_parser_sql
end type
type sle_order from singlelineedit within w_parser_sql
end type
type sle_group from singlelineedit within w_parser_sql
end type
type sle_having from singlelineedit within w_parser_sql
end type
type sle_value from singlelineedit within w_parser_sql
end type
type sle_columns from singlelineedit within w_parser_sql
end type
type sle_tables from singlelineedit within w_parser_sql
end type
type sle_verb from singlelineedit within w_parser_sql
end type
type st_8 from statictext within w_parser_sql
end type
type st_7 from statictext within w_parser_sql
end type
type st_6 from statictext within w_parser_sql
end type
type st_5 from statictext within w_parser_sql
end type
type st_4 from statictext within w_parser_sql
end type
type st_3 from statictext within w_parser_sql
end type
type cb_2 from commandbutton within w_parser_sql
end type
type cb_1 from commandbutton within w_parser_sql
end type
type mle_2 from multilineedit within w_parser_sql
end type
type mle_1 from multilineedit within w_parser_sql
end type
type gb_3 from groupbox within w_parser_sql
end type
type gb_2 from groupbox within w_parser_sql
end type
type gb_1 from groupbox within w_parser_sql
end type
type mle_3 from multilineedit within w_parser_sql
end type
end forward

global type w_parser_sql from window
integer x = 823
integer y = 360
integer width = 3278
integer height = 1468
boolean titlebar = true
string title = "Parse SQL Statement"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
cb_3 cb_3
st_1 st_1
st_9 st_9
sle_where sle_where
sle_order sle_order
sle_group sle_group
sle_having sle_having
sle_value sle_value
sle_columns sle_columns
sle_tables sle_tables
sle_verb sle_verb
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
cb_2 cb_2
cb_1 cb_1
mle_2 mle_2
mle_1 mle_1
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
mle_3 mle_3
end type
global w_parser_sql w_parser_sql

type variables

end variables

on w_parser_sql.create
this.cb_3=create cb_3
this.st_1=create st_1
this.st_9=create st_9
this.sle_where=create sle_where
this.sle_order=create sle_order
this.sle_group=create sle_group
this.sle_having=create sle_having
this.sle_value=create sle_value
this.sle_columns=create sle_columns
this.sle_tables=create sle_tables
this.sle_verb=create sle_verb
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_2=create mle_2
this.mle_1=create mle_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.mle_3=create mle_3
this.Control[]={this.cb_3,&
this.st_1,&
this.st_9,&
this.sle_where,&
this.sle_order,&
this.sle_group,&
this.sle_having,&
this.sle_value,&
this.sle_columns,&
this.sle_tables,&
this.sle_verb,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.cb_2,&
this.cb_1,&
this.mle_2,&
this.mle_1,&
this.gb_3,&
this.gb_2,&
this.gb_1,&
this.mle_3}
end on

on w_parser_sql.destroy
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.st_9)
destroy(this.sle_where)
destroy(this.sle_order)
destroy(this.sle_group)
destroy(this.sle_having)
destroy(this.sle_value)
destroy(this.sle_columns)
destroy(this.sle_tables)
destroy(this.sle_verb)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_2)
destroy(this.mle_1)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.mle_3)
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y = 0

mle_1.text = 'SELECT "sales_order_items"."id", "sales_order_items"."line_id", "sales_order_items"."prod_id",  "sales_order_items"."quantity", "sales_order_items"."ship_date",  "product"."description",   "product"."unit_price", "product"."picture_name" FROM "sales_order_items", "product"  WHERE ( "product"."id" = "sales_order_items"."prod_id" ) and  ( ( "sales_order_items"."id" = :order_id ) ) ORDER BY "sales_order_items"."id" ASC,   "sales_order_items"."line_id" ASC   '
end event

type cb_3 from commandbutton within w_parser_sql
integer x = 2770
integer y = 1192
integer width = 416
integer height = 108
integer taborder = 160
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type st_1 from statictext within w_parser_sql
integer x = 1682
integer y = 208
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Verb:"
boolean focusrectangle = false
end type

type st_9 from statictext within w_parser_sql
integer x = 1682
integer y = 316
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tables:"
boolean focusrectangle = false
end type

type sle_where from singlelineedit within w_parser_sql
integer x = 1915
integer y = 528
integer width = 1225
integer height = 84
integer taborder = 60
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

type sle_order from singlelineedit within w_parser_sql
integer x = 1915
integer y = 636
integer width = 1225
integer height = 84
integer taborder = 80
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

type sle_group from singlelineedit within w_parser_sql
integer x = 1915
integer y = 744
integer width = 1225
integer height = 84
integer taborder = 100
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

type sle_having from singlelineedit within w_parser_sql
integer x = 1915
integer y = 852
integer width = 1225
integer height = 84
integer taborder = 120
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

type sle_value from singlelineedit within w_parser_sql
integer x = 1915
integer y = 960
integer width = 1225
integer height = 84
integer taborder = 110
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

type sle_columns from singlelineedit within w_parser_sql
integer x = 1915
integer y = 420
integer width = 1225
integer height = 84
integer taborder = 90
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

type sle_tables from singlelineedit within w_parser_sql
integer x = 1915
integer y = 312
integer width = 1225
integer height = 84
integer taborder = 70
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

type sle_verb from singlelineedit within w_parser_sql
integer x = 1915
integer y = 204
integer width = 1225
integer height = 84
integer taborder = 50
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

type st_8 from statictext within w_parser_sql
integer x = 1682
integer y = 856
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Having:"
boolean focusrectangle = false
end type

type st_7 from statictext within w_parser_sql
integer x = 1682
integer y = 748
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Group By:"
boolean focusrectangle = false
end type

type st_6 from statictext within w_parser_sql
integer x = 1682
integer y = 640
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Order By:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_parser_sql
integer x = 1682
integer y = 532
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Where:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_parser_sql
integer x = 1682
integer y = 964
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Values:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_parser_sql
integer x = 1682
integer y = 424
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Columns:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_parser_sql
integer x = 2313
integer y = 1192
integer width = 416
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Parse SQL"
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

n_sqlparse_sqlattrib lnv_sqlattrib
n_sqlparse_service lnv_sqlparse

lnv_sqlparse = create n_sqlparse_service
lnv_sqlparse.of_parse(mle_1.text,lnv_sqlattrib)

	sle_verb.text = lnv_sqlattrib.s_Verb
	sle_tables.text = lnv_sqlattrib.s_tables
	sle_columns.text = lnv_sqlattrib.s_columns
	sle_value.text = lnv_sqlattrib.s_values
	sle_where.text = lnv_sqlattrib.s_where
	sle_order.text = lnv_sqlattrib.s_order
	sle_group.text = lnv_sqlattrib.s_group
	sle_having.text = lnv_sqlattrib.s_having

destroy lnv_sqlparse
end event

type cb_1 from commandbutton within w_parser_sql
integer x = 1856
integer y = 1192
integer width = 416
integer height = 108
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Condition"
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

string ls_SQL

n_sqlparse_service lnv_sqlparse

lnv_sqlparse = create n_sqlparse_service
ls_SQL = mle_1.text
mle_2.text = lnv_sqlparse.of_addcondition(ls_SQL,'"100"<>"200"')

destroy lnv_sqlparse
end event

type mle_2 from multilineedit within w_parser_sql
integer x = 78
integer y = 780
integer width = 1499
integer height = 484
integer taborder = 30
integer textsize = -8
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

type mle_1 from multilineedit within w_parser_sql
integer x = 78
integer y = 184
integer width = 1499
integer height = 484
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_parser_sql
integer x = 1646
integer y = 116
integer width = 1541
integer height = 972
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SQL Parse Result"
end type

type gb_2 from groupbox within w_parser_sql
integer x = 41
integer y = 716
integer width = 1577
integer height = 584
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "New SQL Statement"
end type

type gb_1 from groupbox within w_parser_sql
integer x = 41
integer y = 116
integer width = 1577
integer height = 584
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Original SQL Statement"
end type

type mle_3 from multilineedit within w_parser_sql
integer x = 46
integer y = 28
integer width = 2254
integer height = 56
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " From PFC SQL Parser Service.  Do not support UNION clause in SQL statement."
boolean border = false
end type

