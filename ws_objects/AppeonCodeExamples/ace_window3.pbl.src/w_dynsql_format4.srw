$PBExportHeader$w_dynsql_format4.srw
$PBExportComments$Example of dynamic SQL: format 4
forward
global type w_dynsql_format4 from window
end type
type st_6 from statictext within w_dynsql_format4
end type
type st_5 from statictext within w_dynsql_format4
end type
type st_4 from statictext within w_dynsql_format4
end type
type cb_close from commandbutton within w_dynsql_format4
end type
type cb_execute from commandbutton within w_dynsql_format4
end type
type cb_describe from commandbutton within w_dynsql_format4
end type
type st_3 from statictext within w_dynsql_format4
end type
type st_2 from statictext within w_dynsql_format4
end type
type dw_out_parms from datawindow within w_dynsql_format4
end type
type dw_in_parms from datawindow within w_dynsql_format4
end type
type st_1 from statictext within w_dynsql_format4
end type
type mle_sql from multilineedit within w_dynsql_format4
end type
end forward

global type w_dynsql_format4 from window
integer x = 233
integer y = 268
integer width = 2441
integer height = 1460
boolean titlebar = true
string title = "Dynamic SQL Format 4"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
event ue_describe pbm_custom01
event ue_execute pbm_custom02
st_6 st_6
st_5 st_5
st_4 st_4
cb_close cb_close
cb_execute cb_execute
cb_describe cb_describe
st_3 st_3
st_2 st_2
dw_out_parms dw_out_parms
dw_in_parms dw_in_parms
st_1 st_1
mle_sql mle_sql
end type
global w_dynsql_format4 w_dynsql_format4

type variables
declare ic_cursor dynamic cursor for sqlsa;


end variables

event ue_describe;int					i
long				ll_row
string				ls_type


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Prepare the dynamic staging area 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
prepare sqlsa from :mle_sql.text;
if sqlca.sqlcode = -1 then
	MessageBox ("Prepare failed", sqlca.sqlerrtext, exclamation!)
	return
end if


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Describe the dynamic staging area into the dynamic description area
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
describe sqlsa into sqlda;
if sqlca.sqlcode = -1 then
	MessageBox ("Describe failed", sqlca.sqlerrtext, exclamation!)
	return
end if


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Populate DataWindows to show input parms
// The number & type of input parameters can be obtained through attributes of 
// sqlda (the dynamic description area).  
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_in_parms.Reset()
dw_out_parms.Reset()

for i = 1 to sqlda.NumInputs
	ls_type = ""

	choose case sqlda.InParmType[i]

		case TypeString!
			ls_type = "string"		
	
		case TypeInteger!
			ls_type = "integer"

		case TypeUnknown!
			ls_type = "unknown"

	end choose

	if Len (ls_type) > 0 then
		ll_row = dw_in_parms.InsertRow (0)
		dw_in_parms.object.parm_type[ll_row] = ls_type
	end if
next


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Input parm values should be set before the dynamic SQL is executed
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if sqlda.NumInputs = 0 then
	cb_execute.enabled = true
else
	cb_execute.enabled = false
end if	
end event

event ue_execute;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 
// Purpose:  Execute the dynamic SQL statement
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_col_name, &
		ls_type, &
		ls_val
long	ll_required_row, &
		ll_row
int		li_col = 1, &
		i


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Be sure that all input parameters have been assigned values first
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_in_parms.AcceptText()
dw_in_parms.FindRequired(primary!, ll_required_row, li_col, ls_col_name, false)
if ll_required_row > 0 then
	MessageBox("Required Field", "All input parameters must be assigned values before executing " + &
					"the dynamic SQL statement")
	dw_in_parms.SetFocus()
	dw_in_parms.ScrollToRow(ll_required_row)
end if


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Open the dynamic cursor using the dynamic description area
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
open dynamic ic_cursor using descriptor sqlda;
if sqlca.sqlcode = -1 then
	MessageBox("Open Dynamic Cursor Failed", sqlca.sqlerrtext, exclamation!)
	return
end if


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Fetch rows using the dynamic description area.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_out_parms.Reset()

do while sqlca.sqlcode = 0
	fetch ic_cursor using descriptor sqlda;

	if sqlca.sqlcode = 0 then

		// For each row that is fetched, display the result set data types and values 
		for i = 1 to sqlda.NumOutputs
			ls_type = ""

			choose case sqlda.OutParmType[i]

				case TypeString!
					ls_type = "string"		
					ls_val = GetDynamicString(sqlda, i)
	
				case TypeInteger!, TypeReal!, TypeDouble!, TypeLong!
					ls_type = "integer"
					ls_val = String(GetDynamicNumber (sqlda, i))

				case TypeDate!
					ls_type = "date"
					ls_val = String(GetDynamicDate (sqlda, i))
	
				case TypeDateTime!
					ls_type = "datetime"
					ls_val = String(GetDynamicDateTime (sqlda, i))

				case TypeUnknown!
					ls_type = "unknown"
					ls_val = ""

			end choose

			if Len (ls_type) > 0 then
				ll_row = dw_out_parms.InsertRow (0)
				dw_out_parms.object.parm_type[ll_row] = ls_type
				dw_out_parms.object.parm_val[ll_row] = ls_val
			end if
		next
	end if
loop


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Close the dynamic cursor
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
close ic_cursor;

end event

on w_dynsql_format4.create
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.cb_close=create cb_close
this.cb_execute=create cb_execute
this.cb_describe=create cb_describe
this.st_3=create st_3
this.st_2=create st_2
this.dw_out_parms=create dw_out_parms
this.dw_in_parms=create dw_in_parms
this.st_1=create st_1
this.mle_sql=create mle_sql
this.Control[]={this.st_6,&
this.st_5,&
this.st_4,&
this.cb_close,&
this.cb_execute,&
this.cb_describe,&
this.st_3,&
this.st_2,&
this.dw_out_parms,&
this.dw_in_parms,&
this.st_1,&
this.mle_sql}
end on

on w_dynsql_format4.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.cb_close)
destroy(this.cb_execute)
destroy(this.cb_describe)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_out_parms)
destroy(this.dw_in_parms)
destroy(this.st_1)
destroy(this.mle_sql)
end on

event open;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Initialize dynamic SQL statement used for this example & parms DataWindows
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
this.x = 0
this.y = 0
mle_sql.text = "SELECT id, last_name, city, state FROM contact WHERE city = ? and state = ?"

dw_out_parms.object.parm_val.edit.required = 'no'
end event

type st_6 from statictext within w_dynsql_format4
integer x = 110
integer y = 1272
integer width = 1093
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Then click Execute button to get result set."
boolean focusrectangle = false
end type

type st_5 from statictext within w_dynsql_format4
integer x = 37
integer y = 1200
integer width = 1207
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Tip:Firstly click Describe button and input parameters,"
boolean focusrectangle = false
end type

type st_4 from statictext within w_dynsql_format4
integer x = 41
integer y = 584
integer width = 1093
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "For Example,with value ~'Houston~',~'TX~':"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_dynsql_format4
integer x = 2021
integer y = 1224
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;Close(Parent)
end event

type cb_execute from commandbutton within w_dynsql_format4
integer x = 1641
integer y = 1224
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Execute"
end type

event constructor;This.Enabled = False
end event

event clicked;Parent.TriggerEvent("ue_execute")
end event

type cb_describe from commandbutton within w_dynsql_format4
integer x = 1262
integer y = 1224
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Describe"
end type

event clicked;Parent.TriggerEvent("ue_describe")
end event

type st_3 from statictext within w_dynsql_format4
integer x = 1225
integer y = 584
integer width = 306
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Result Set:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_dynsql_format4
integer x = 41
integer y = 524
integer width = 1102
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Input Parameters:"
boolean focusrectangle = false
end type

type dw_out_parms from datawindow within w_dynsql_format4
integer x = 1225
integer y = 660
integer width = 1138
integer height = 508
integer taborder = 30
string dataobject = "d_parms"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_in_parms from datawindow within w_dynsql_format4
integer x = 41
integer y = 660
integer width = 1138
integer height = 508
integer taborder = 20
string dataobject = "d_parms"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable commandbutton that can execute the dynamic sql
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
cb_execute.enabled = true
end event

event itemerror;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Return 3 =
// 		Reject the data value but allow the focus to change. 
//			Replace the column value just entered with the value originally in the column.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Return 3
end event

on itemchanged;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Purpose:  Use the SetDynamicParm function to set the value of each input parameter
//			in the dynamic description area
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_cur_row


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the current row
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ll_cur_row = this.GetRow()
if ll_cur_row <= 0 then
	return
end if


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Set the input parameter value to the value specified in the DataWindow
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if SetDynamicParm (sqlda, ll_cur_row, this.GetText()) = -1 then
	MessageBox ("Error", "SetDynamicParm failed", exclamation!)
end if
end on

type st_1 from statictext within w_dynsql_format4
integer x = 41
integer y = 60
integer width = 658
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Dynamic SQL Statement:"
boolean focusrectangle = false
end type

type mle_sql from multilineedit within w_dynsql_format4
event ue_char pbm_char
integer x = 41
integer y = 136
integer width = 2327
integer height = 360
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_char;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// As soon as a character is entered into the multilineedit, changing the SQL statement,
// the dynamic staging area must be prepared again, and described into the dynamic 
// description area.  Therefore, disable the commandbutton to execute the dynamic sql
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

cb_execute.enabled = false
end event

