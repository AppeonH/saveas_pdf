$PBExportHeader$w_dw_editmask.srw
forward
global type w_dw_editmask from window
end type
type em_3 from editmask within w_dw_editmask
end type
type em_2 from editmask within w_dw_editmask
end type
type em_1 from editmask within w_dw_editmask
end type
type st_7 from statictext within w_dw_editmask
end type
type cb_2 from commandbutton within w_dw_editmask
end type
type sle_1 from singlelineedit within w_dw_editmask
end type
type st_6 from statictext within w_dw_editmask
end type
type cb_1 from commandbutton within w_dw_editmask
end type
type tab_1 from tab within w_dw_editmask
end type
type tabpage_1 from userobject within tab_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_3 cb_3
st_1 st_1
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type cb_4 from commandbutton within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_4 cb_4
st_2 st_2
dw_2 dw_2
end type
type tabpage_3 from userobject within tab_1
end type
type cb_6 from commandbutton within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type dw_3 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_6 cb_6
st_3 st_3
dw_3 dw_3
end type
type tabpage_4 from userobject within tab_1
end type
type cb_7 from commandbutton within tabpage_4
end type
type st_4 from statictext within tabpage_4
end type
type dw_4 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_7 cb_7
st_4 st_4
dw_4 dw_4
end type
type tabpage_5 from userobject within tab_1
end type
type cb_8 from commandbutton within tabpage_5
end type
type dw_5 from datawindow within tabpage_5
end type
type st_5 from statictext within tabpage_5
end type
type tabpage_5 from userobject within tab_1
cb_8 cb_8
dw_5 dw_5
st_5 st_5
end type
type tab_1 from tab within w_dw_editmask
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
type cb_5 from commandbutton within w_dw_editmask
end type
type gb_1 from groupbox within w_dw_editmask
end type
end forward

global type w_dw_editmask from window
integer width = 2903
integer height = 2108
boolean titlebar = true
string title = "DataWindow EditMask"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_3 em_3
em_2 em_2
em_1 em_1
st_7 st_7
cb_2 cb_2
sle_1 sle_1
st_6 st_6
cb_1 cb_1
tab_1 tab_1
cb_5 cb_5
gb_1 gb_1
end type
global w_dw_editmask w_dw_editmask

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
datawindow   dw_cur
String       is_colname
Integer      ii_index

end variables

on w_dw_editmask.create
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.st_7=create st_7
this.cb_2=create cb_2
this.sle_1=create sle_1
this.st_6=create st_6
this.cb_1=create cb_1
this.tab_1=create tab_1
this.cb_5=create cb_5
this.gb_1=create gb_1
this.Control[]={this.em_3,&
this.em_2,&
this.em_1,&
this.st_7,&
this.cb_2,&
this.sle_1,&
this.st_6,&
this.cb_1,&
this.tab_1,&
this.cb_5,&
this.gb_1}
end on

on w_dw_editmask.destroy
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_7)
destroy(this.cb_2)
destroy(this.sle_1)
destroy(this.st_6)
destroy(this.cb_1)
destroy(this.tab_1)
destroy(this.cb_5)
destroy(this.gb_1)
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

dw_cur = tab_1.tabpage_1.dw_1


end event

type em_3 from editmask within w_dw_editmask
boolean visible = false
integer x = 352
integer y = 1692
integer width = 782
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy-mm-dd hh:mm:ss"
boolean spin = true
end type

type em_2 from editmask within w_dw_editmask
boolean visible = false
integer x = 347
integer y = 1696
integer width = 795
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm:ss:fffff"
boolean spin = true
end type

type em_1 from editmask within w_dw_editmask
boolean visible = false
integer x = 343
integer y = 1696
integer width = 786
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy-mm-dd"
boolean spin = true
end type

type st_7 from statictext within w_dw_editmask
integer x = 1614
integer y = 1696
integer width = 855
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "Display Value"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_dw_editmask
integer x = 2491
integer y = 1692
integer width = 274
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get"
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
Choose Case ii_index
	Case 1 //stringmask
		st_7.Text = dw_cur.GetItemString(1,is_colname)
	Case 2 //numbermask
		st_7.Text = String(dw_cur.GetItemNumber(1,is_colname))
	Case 3
		st_7.Text = String(dw_cur.GetItemDate(1,is_colname))
	Case 4
		st_7.Text = String(dw_cur.GetItemTime(1,is_colname))
	Case 5
		st_7.Text = String(dw_cur.GetItemDateTime(1,is_colname))
End Choose

end event

type sle_1 from singlelineedit within w_dw_editmask
integer x = 343
integer y = 1692
integer width = 791
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_dw_editmask
integer x = 73
integer y = 1708
integer width = 329
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Set value :"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_dw_editmask
integer x = 1161
integer y = 1692
integer width = 270
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set"
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
DateTime ldt_1
String ls_1
Choose Case ii_index
	Case 1 //stringmask
		dw_cur.SetItem(1,is_colname,sle_1.Text)
	Case 2 //numbermask
		If Not IsNumber(sle_1.Text) Then
			MessageBox("Error","Please input a numeric value.")
			Return
		End If
		dw_cur.SetItem(1,is_colname,Double(sle_1.Text))
	Case 3
		dw_cur.SetItem(1,is_colname,Date(em_1.Text))
	Case 4
		dw_cur.SetItem(1,is_colname,Time(em_2.Text))
	Case 5
		ldt_1 = DateTime(Date(LeftA(em_3.Text,10)),Time(RightA(Trim(em_3.Text),8)))
		dw_cur.SetItem(1,is_colname,ldt_1)
End Choose


end event

type tab_1 from tab within w_dw_editmask
integer x = 46
integer y = 44
integer width = 2821
integer height = 1528
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	oldindex		
//		integer	newindex		
//--------------------------------------------------------------------
// Returns: long [pbm_tcnselchanged]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Choose Case  newindex
	Case 1
		em_1.Visible = False
		em_2.Visible = False
		em_3.Visible = False
		sle_1.Visible = True
		
		dw_cur = This.tabpage_1.dw_1
		is_colname = 's01'
	Case 2
		em_1.Visible = False
		em_2.Visible = False
		em_3.Visible = False
		sle_1.Visible = True
		
		dw_cur = This.tabpage_2.dw_2
		is_colname = 'a01'
	Case 3
		em_1.Visible = True
		em_2.Visible = False
		em_3.Visible = False
		sle_1.Visible = False
		
		dw_cur = This.tabpage_3.dw_3
		is_colname = 'name_12'
	Case 4
		em_1.Visible = False
		em_2.Visible = True
		em_3.Visible = False
		sle_1.Visible = False
		
		dw_cur = This.tabpage_4.dw_4
		is_colname = 't08'
	Case 5
		em_1.Visible = False
		em_2.Visible = False
		em_3.Visible = True
		sle_1.Visible = False
		
		dw_cur = This.tabpage_5.dw_5
		is_colname = 'name_13'
End Choose
ii_index = newindex

end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2784
integer height = 1412
long backcolor = 67108864
string text = "String "
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_3 cb_3
st_1 st_1
dw_1 dw_1
end type

on tabpage_1.create
this.cb_3=create cb_3
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.st_1,&
this.dw_1}
end on

on tabpage_1.destroy
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.dw_1)
end on

type cb_3 from commandbutton within tabpage_1
integer x = 2459
integer y = 604
integer width = 256
integer height = 160
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas"
end type

event clicked;dw_1.saveas()
end event

type st_1 from statictext within tabpage_1
integer x = 46
integer y = 12
integer width = 2395
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The following table shows how the string type values are displayed with different mask settings: "
boolean focusrectangle = false
end type

type dw_1 from datawindow within tabpage_1
integer x = 41
integer y = 104
integer width = 2363
integer height = 1288
integer taborder = 20
string title = "none"
string dataobject = "d_mask_string"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;//====================================================================
// Event: itemfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row		
//		dwobject	dwo		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchangefocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
is_colname = dwo.Name
//dwo.background = 66666666


end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2784
integer height = 1412
long backcolor = 67108864
string text = "Number "
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_4 cb_4
st_2 st_2
dw_2 dw_2
end type

on tabpage_2.create
this.cb_4=create cb_4
this.st_2=create st_2
this.dw_2=create dw_2
this.Control[]={this.cb_4,&
this.st_2,&
this.dw_2}
end on

on tabpage_2.destroy
destroy(this.cb_4)
destroy(this.st_2)
destroy(this.dw_2)
end on

type cb_4 from commandbutton within tabpage_2
integer x = 2482
integer y = 588
integer width = 283
integer height = 252
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas"
end type

event clicked;dw_2.saveas()
end event

type st_2 from statictext within tabpage_2
integer x = 50
integer y = 12
integer width = 2395
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The following table shows how the numeric values are displayed with different mask settings: "
boolean focusrectangle = false
end type

type dw_2 from datawindow within tabpage_2
integer x = 41
integer y = 104
integer width = 2414
integer height = 1288
integer taborder = 30
string title = "none"
string dataobject = "d_mask_number"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;//====================================================================
// Event: itemfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row		
//		dwobject	dwo		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchangefocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
is_colname = dwo.Name

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2784
integer height = 1412
long backcolor = 67108864
string text = "Date "
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_6 cb_6
st_3 st_3
dw_3 dw_3
end type

on tabpage_3.create
this.cb_6=create cb_6
this.st_3=create st_3
this.dw_3=create dw_3
this.Control[]={this.cb_6,&
this.st_3,&
this.dw_3}
end on

on tabpage_3.destroy
destroy(this.cb_6)
destroy(this.st_3)
destroy(this.dw_3)
end on

type cb_6 from commandbutton within tabpage_3
integer x = 2373
integer y = 548
integer width = 343
integer height = 228
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas"
end type

event clicked;dw_3.saveas()
end event

type st_3 from statictext within tabpage_3
integer x = 46
integer y = 16
integer width = 2409
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The following table shows how the date type values are displayed with different mask settings:"
boolean focusrectangle = false
end type

type dw_3 from datawindow within tabpage_3
integer x = 41
integer y = 100
integer width = 2263
integer height = 1288
integer taborder = 30
string title = "none"
string dataobject = "d_mask_date"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;//====================================================================
// Event: itemfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row		
//		dwobject	dwo		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchangefocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
is_colname = dwo.Name

end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2784
integer height = 1412
long backcolor = 67108864
string text = "Time "
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_7 cb_7
st_4 st_4
dw_4 dw_4
end type

on tabpage_4.create
this.cb_7=create cb_7
this.st_4=create st_4
this.dw_4=create dw_4
this.Control[]={this.cb_7,&
this.st_4,&
this.dw_4}
end on

on tabpage_4.destroy
destroy(this.cb_7)
destroy(this.st_4)
destroy(this.dw_4)
end on

type cb_7 from commandbutton within tabpage_4
integer x = 2386
integer y = 556
integer width = 343
integer height = 276
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas"
end type

event clicked;dw_4.saveas()
end event

type st_4 from statictext within tabpage_4
integer x = 46
integer y = 16
integer width = 2395
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The following table shows how the time type values are displayed with different mask settings:"
boolean focusrectangle = false
end type

type dw_4 from datawindow within tabpage_4
integer x = 41
integer y = 104
integer width = 2190
integer height = 1288
integer taborder = 30
string title = "none"
string dataobject = "d_mask_time"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;//====================================================================
// Event: itemfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row		
//		dwobject	dwo		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchangefocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
is_colname = dwo.Name

end event

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2784
integer height = 1412
long backcolor = 67108864
string text = "DateTime "
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_8 cb_8
dw_5 dw_5
st_5 st_5
end type

on tabpage_5.create
this.cb_8=create cb_8
this.dw_5=create dw_5
this.st_5=create st_5
this.Control[]={this.cb_8,&
this.dw_5,&
this.st_5}
end on

on tabpage_5.destroy
destroy(this.cb_8)
destroy(this.dw_5)
destroy(this.st_5)
end on

type cb_8 from commandbutton within tabpage_5
integer x = 2391
integer y = 544
integer width = 343
integer height = 252
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas"
end type

event clicked;dw_5.saveas()
end event

type dw_5 from datawindow within tabpage_5
integer x = 41
integer y = 108
integer width = 2208
integer height = 1288
integer taborder = 40
string title = "none"
string dataobject = "d_mask_datetime"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;//====================================================================
// Event: itemfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row		
//		dwobject	dwo		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchangefocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
is_colname = dwo.name
end event

type st_5 from statictext within tabpage_5
integer x = 46
integer y = 16
integer width = 2459
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The following table shows how the datetime type values are displayed with different mask settings:"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_dw_editmask
integer x = 2450
integer y = 1864
integer width = 375
integer height = 108
integer taborder = 50
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

type gb_1 from groupbox within w_dw_editmask
integer x = 41
integer y = 1612
integer width = 2784
integer height = 220
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Set or get value for the current field"
end type

