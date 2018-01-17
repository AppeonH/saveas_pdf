$PBExportHeader$w_dw_counttimes.srw
$PBExportComments$DataWindow - Count num. of times a column value equal a spec.
forward
global type w_dw_counttimes from window
end type
type cb_1 from commandbutton within w_dw_counttimes
end type
type cb_2 from commandbutton within w_dw_counttimes
end type
type st_1 from statictext within w_dw_counttimes
end type
type cb_save from commandbutton within w_dw_counttimes
end type
type cb_print from commandbutton within w_dw_counttimes
end type
type cb_close from commandbutton within w_dw_counttimes
end type
type cb_refresh from commandbutton within w_dw_counttimes
end type
type dw_1 from datawindow within w_dw_counttimes
end type
end forward

global type w_dw_counttimes from window
integer width = 2976
integer height = 1744
boolean titlebar = true
string title = "Count Num. of Times a Column Value Appeared"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_changestyle ( string as_stylename )
cb_1 cb_1
cb_2 cb_2
st_1 st_1
cb_save cb_save
cb_print cb_print
cb_close cb_close
cb_refresh cb_refresh
dw_1 dw_1
end type
global w_dw_counttimes w_dw_counttimes

event ue_changestyle(string as_stylename);//====================================================================
// Event: ue_changestyle()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_stylename		
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
String  		ls_DataObject


Choose Case Lower(as_StyleName)
	Case 'tabular_1'
		ls_DataObject = "d_dwstyle_tabular1"
	Case 'tabular_2'
		ls_DataObject = "d_dwstyle_tabular2"
End Choose

dw_1.DataObject = ls_DataObject


end event

on w_dw_counttimes.create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_1=create st_1
this.cb_save=create cb_save
this.cb_print=create cb_print
this.cb_close=create cb_close
this.cb_refresh=create cb_refresh
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.cb_2,&
this.st_1,&
this.cb_save,&
this.cb_print,&
this.cb_close,&
this.cb_refresh,&
this.dw_1}
end on

on w_dw_counttimes.destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.cb_save)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.cb_refresh)
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

dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

end event

type cb_1 from commandbutton within w_dw_counttimes
integer x = 32
integer y = 1508
integer width = 635
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Describe Sex Column"
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
MessageBox("Sex Column",dw_1.Describe("sex.values"))

end event

type cb_2 from commandbutton within w_dw_counttimes
integer x = 1536
integer y = 1508
integer width = 306
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Filter"
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
String   ls_Filter

OpenWithParm(w_Filter_single,dw_1)


ls_Filter = Message.StringParm
If ls_Filter = '-1' Then Return
dw_1.SetFilter(ls_Filter)
dw_1.Filter()




end event

type st_1 from statictext within w_dw_counttimes
integer x = 37
integer y = 12
integer width = 2862
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example explains how you can count the number of times a column value is equal to a specific value using a computed column."
boolean focusrectangle = false
end type

type cb_save from commandbutton within w_dw_counttimes
integer x = 2235
integer y = 1508
integer width = 320
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "SaveAs"
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
dw_1.SaveAs()

end event

type cb_print from commandbutton within w_dw_counttimes
integer x = 1879
integer y = 1508
integer width = 320
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
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
dw_1.Print()

end event

type cb_close from commandbutton within w_dw_counttimes
integer x = 2592
integer y = 1508
integer width = 320
integer height = 96
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

type cb_refresh from commandbutton within w_dw_counttimes
integer x = 1179
integer y = 1508
integer width = 320
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Refresh"
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
dw_1.Retrieve()

end event

type dw_1 from datawindow within w_dw_counttimes
integer x = 32
integer y = 104
integer width = 2875
integer height = 1360
integer taborder = 30
string title = "none"
string dataobject = "d_employee_summary_computedcolumn"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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
If currentrow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(currentrow,True)
End If


end event

