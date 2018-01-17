$PBExportHeader$w_oleobject_support.srw
forward
global type w_oleobject_support from window
end type
type cb_5 from commandbutton within w_oleobject_support
end type
type cb_4 from commandbutton within w_oleobject_support
end type
type cb_3 from commandbutton within w_oleobject_support
end type
type cb_2 from commandbutton within w_oleobject_support
end type
type cb_1 from commandbutton within w_oleobject_support
end type
type dw_1 from datawindow within w_oleobject_support
end type
type gb_1 from groupbox within w_oleobject_support
end type
type oleobject_1 from oleobject within w_oleobject_support
end type
end forward

global type w_oleobject_support from window
integer width = 3035
integer height = 1804
boolean titlebar = true
string title = "OLEObject"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
oleobject_1 oleobject_1
end type
global w_oleobject_support w_oleobject_support

type prototypes

end prototypes

on w_oleobject_support.create
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.oleobject_1=create oleobject_1
this.Control[]={this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_oleobject_support.destroy
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.oleobject_1)
end on

event open;This.X = 0
This.Y = 0
end event

type cb_5 from commandbutton within w_oleobject_support
integer x = 37
integer y = 1576
integer width = 571
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Insert Data From Excel"
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
// Author: 	zhouchaoqun		Date: 2005/05/14
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2005----???? Appeon Inc.
//====================================================================
/*
Return value 

Integer. Returns 0 if it succeeds and one of the following negative values if an error occurs:

-1  Invalid call: the argument is the Object property of a control
-2  Class name not found
-3  Object could not be created
-4  Could not connect to object
-5  Can't connect to the currently active object
-6  Filename is not valid
-7  File not found or file couldn't be opened
-8  Load from file not supported by server
-9  Other error
-15  MTS is not loaded on this computer
-16  Invalid Call: this function not applicable to OLETxnObject

If any argument's value is NULL, ConnectToObject returns NULL.
*/
OLEObject ole_server
integer li_rtn,li_row,li_int,li_col
string ls_excel,ls_class,ls_string,ls_named,ls_len
any la_any
double ldb_double
n_resfile  lnv_file
long  ll_handle,ll_getwindow,ll_getwintext
boolean lb_excel = false

if lnv_file.of_writefile('expense.xls') = -1 then return

ole_server = Create OLEObject
ls_excel = lnv_file.IS_FilePath + 'expense.xls'
li_rtn = ole_server.ConnectToObject(ls_excel)

If li_rtn <> 0 Then
	MessageBox("Connect Error","Could not connect to excel~r~nError Code: " + string(li_rtn))
	Return
End If

setpointer(Hourglass!)
dw_1.Reset()

for li_row = 1 to 10
	 dw_1.insertrow(0)
	 for li_col = 1 to 20  
        la_any = ole_server.application.workbooks(1).worksheets(1).Cells(li_row + 1,li_col).value	
		  if isnull(la_any) then la_any =''
		  ls_named = dw_1.Describe("#"+string(li_col)+".name")
		  ls_class = dw_1.Describe(ls_named+".Coltype")
		  choose case LeftA(lower(ls_class),3)
			case 'cha'
					dw_1.object.data[li_row,li_col] = string(la_any)
		   case 'dat'
					dw_1.object.data[li_row,li_col] = date(la_any)
			case 'dec'
				   dw_1.object.data[li_row,li_col] = dec(la_any)
			case 'int'
					 dw_1.object.data[li_row,li_col] = integer(la_any)
			case 'lon'
				    dw_1.object.data[li_row,li_col] = long(la_any)
			case 'num'
					dw_1.object.data[li_row,li_col] = integer(la_any)
			case 'rea'
				   dw_1.object.data[li_row,li_col] = real(la_any)
			case 'tim'
					dw_1.object.data[li_row,li_col] = time(la_any)
			case 'ulo'
					dw_1.object.data[li_row,li_col] = long(la_any)
		end choose		  
	next		
	
	if dw_1.getitemstring(1,"street") <> '49 East Washington Street' then
		messagebox("Warning","Please close the excel file.")
		dw_1.reset()
		setpointer(Arrow!)
		li_rtn = ole_server.DisconnectObject()
		Destroy ole_server
		return 
	end if
next	

setpointer(Arrow!)
li_rtn = ole_server.DisconnectObject()
Destroy ole_server

If li_rtn <> 0 Then
	MessageBox("Disconnect Error","Could not disconnect from excel" + &
					"~r~nError Code: " + string(li_rtn))
	Return
End If

end event

type cb_4 from commandbutton within w_oleobject_support
integer x = 622
integer y = 1576
integer width = 553
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Output Data To Excel"
end type

event clicked;Long		ll_rownum,ll_row,ll_colnum,ll_col,ll_rtn
string ls_lable

//create a new Excel object and connect to it
 ll_rtn = oleobject_1.ConnectToNewObject("excel.application")
 if ll_rtn <> 0 then
	Messagebox('warning','Excel connect to Fail!')
	Return
 end if

oleobject_1.Application.Workbooks.Add
oleobject_1.Application.Visible = False 

setpointer(HourGlass!)

ll_rownum = dw_1.rowcount()
ll_colnum = long(dw_1.object.datawindow.column.count)

for ll_col = 1 to ll_colnum
  ls_lable = dw_1.Describe("#"+string(ll_col)+".Name") +'_t'   
  oleobject_1.Application.Worksheets[1].Cells[1,ll_col].value = dw_1.Describe(ls_lable+".text") 
next

for ll_row = 1 to ll_rownum
	for ll_col = 1 to ll_colnum
			oleobject_1.Application.Worksheets[1].Cells[ll_row + 1,ll_col].value = string(dw_1.object.data[ll_row,ll_col])
	next
next

setpointer(Arrow!)
oleobject_1.Application.Visible = True

ll_rtn = oleobject_1.DisConnectObject()
if ll_rtn <> 0 then
	messagebox('warnning','Releases object previously connected fail')
end if
end event

type cb_3 from commandbutton within w_oleobject_support
integer x = 2249
integer y = 1576
integer width = 347
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
end type

event clicked;dw_1.reset()
end event

type cb_2 from commandbutton within w_oleobject_support
integer x = 1184
integer y = 1576
integer width = 347
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Retrieve"
end type

event clicked;dw_1.Retrieve()
end event

type cb_1 from commandbutton within w_oleobject_support
integer x = 2606
integer y = 1576
integer width = 347
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close(Parent)
end event

type dw_1 from datawindow within w_oleobject_support
integer x = 59
integer y = 56
integer width = 2885
integer height = 1468
integer taborder = 10
string title = "none"
string dataobject = "d_oleobject"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)

end event

type gb_1 from groupbox within w_oleobject_support
integer x = 27
integer width = 2953
integer height = 1552
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "DataWindow"
end type

type oleobject_1 from oleobject within w_oleobject_support descriptor "pb_nvo" = "true" 
end type

on oleobject_1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on oleobject_1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

