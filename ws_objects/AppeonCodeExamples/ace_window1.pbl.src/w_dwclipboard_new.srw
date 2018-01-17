$PBExportHeader$w_dwclipboard_new.srw
$PBExportComments$DW.ImportFile, DW.ImportString，DW. ImportClipboard Function test.
forward
global type w_dwclipboard_new from window
end type
type cb_3 from commandbutton within w_dwclipboard_new
end type
type dw_1 from datawindow within w_dwclipboard_new
end type
type st_4 from statictext within w_dwclipboard_new
end type
type cb_2 from commandbutton within w_dwclipboard_new
end type
type cb_clear from commandbutton within w_dwclipboard_new
end type
type st_tip from singlelineedit within w_dwclipboard_new
end type
type cb_1 from commandbutton within w_dwclipboard_new
end type
type lb_functionname from listbox within w_dwclipboard_new
end type
type gb_1 from groupbox within w_dwclipboard_new
end type
type gb_2 from groupbox within w_dwclipboard_new
end type
end forward

global type w_dwclipboard_new from window
integer width = 2505
integer height = 1324
boolean titlebar = true
string title = "DataWindow Clipboard Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
dw_1 dw_1
st_4 st_4
cb_2 cb_2
cb_clear cb_clear
st_tip st_tip
cb_1 cb_1
lb_functionname lb_functionname
gb_1 gb_1
gb_2 gb_2
end type
global w_dwclipboard_new w_dwclipboard_new

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

integer iflag = 0
integer i = 1
n_util inv_util
pointer p1

end variables

on w_dwclipboard_new.create
this.cb_3=create cb_3
this.dw_1=create dw_1
this.st_4=create st_4
this.cb_2=create cb_2
this.cb_clear=create cb_clear
this.st_tip=create st_tip
this.cb_1=create cb_1
this.lb_functionname=create lb_functionname
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_3,&
this.dw_1,&
this.st_4,&
this.cb_2,&
this.cb_clear,&
this.st_tip,&
this.cb_1,&
this.lb_functionname,&
this.gb_1,&
this.gb_2}
end on

on w_dwclipboard_new.destroy
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.st_4)
destroy(this.cb_2)
destroy(this.cb_clear)
destroy(this.st_tip)
destroy(this.cb_1)
destroy(this.lb_functionname)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event timer;//====================================================================
// Event: timer()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_timer]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if i = 1 then
	st_tip.text = 'End time is ' +  string(now()) + '.'
	i = 0
else 
	return
end if
end event

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
this.x = 0
this.y=0

lb_functionname.AddItem("Copy")
lb_functionname.AddItem("Cut")
lb_functionname.AddItem("Paste")






end event

type cb_3 from commandbutton within w_dwclipboard_new
integer x = 827
integer y = 880
integer width = 366
integer height = 100
integer taborder = 50
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

type dw_1 from datawindow within w_dwclipboard_new
integer x = 654
integer y = 124
integer width = 1769
integer height = 736
integer taborder = 40
string title = "none"
string dataobject = "d_dwfunction_new"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve()
end event

type st_4 from statictext within w_dwclipboard_new
integer x = 46
integer y = 36
integer width = 2395
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example shows how to apply copy, cut, and Paste functions in a DataWindow."
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_dwclipboard_new
integer x = 2053
integer y = 880
integer width = 366
integer height = 100
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type cb_clear from commandbutton within w_dwclipboard_new
integer x = 1655
integer y = 880
integer width = 366
integer height = 100
integer taborder = 60
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
// Author: 	HuangHui		Date: 2004/06/28
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
st_tip.text =''
dw_1.retrieve()
end event

type st_tip from singlelineedit within w_dwclipboard_new
integer x = 695
integer y = 1044
integer width = 1664
integer height = 120
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

type cb_1 from commandbutton within w_dwclipboard_new
integer x = 1257
integer y = 880
integer width = 366
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Execute"
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
// Author: 	HuangHui		Date: 2004/06/28
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

String strtip , strexevalue

if lb_functionname.selectedindex() <= 0 then
	MessageBox('warning','Please choose testing function!')
	return
end if
Choose Case lb_functionname.SelectedItem()
	Case 'Copy'
		strexevalue = String(dw_1.Copy())
		
	Case 'Cut'			
		strexevalue = String(dw_1.Cut())
		
	Case 'Paste'		
		strexevalue = String(dw_1.Paste())
	
End Choose

strtip =  "Return value is " + strexevalue + "."
st_tip.Text = strtip
dw_1.setfocus()
dw_1.accepttext()
end event

type lb_functionname from listbox within w_dwclipboard_new
integer x = 82
integer y = 172
integer width = 480
integer height = 976
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event selectionchanged; dw_1.setfocus()

choose case this.text(index)
	case 'Copy'		  
			dw_1.setrow(1)				
	case 'Cut'
			dw_1.setrow(2)
	case 'Paste'		   
			dw_1.setrow(3)			
			Return
end choose


end event

type gb_1 from groupbox within w_dwclipboard_new
integer x = 41
integer y = 100
integer width = 571
integer height = 1096
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Functions"
end type

type gb_2 from groupbox within w_dwclipboard_new
integer x = 649
integer y = 980
integer width = 1760
integer height = 216
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

