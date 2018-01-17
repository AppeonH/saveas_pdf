$PBExportHeader$w_dwotherfuc_new.srw
$PBExportComments$DW.ImportFile, DW.ImportString，DW. ImportClipboard Function test.
forward
global type w_dwotherfuc_new from window
end type
type dw_1 from datawindow within w_dwotherfuc_new
end type
type st_4 from statictext within w_dwotherfuc_new
end type
type st_2 from statictext within w_dwotherfuc_new
end type
type cb_2 from commandbutton within w_dwotherfuc_new
end type
type cb_clear from commandbutton within w_dwotherfuc_new
end type
type st_tip from singlelineedit within w_dwotherfuc_new
end type
type cb_1 from commandbutton within w_dwotherfuc_new
end type
type lb_functionparm from listbox within w_dwotherfuc_new
end type
type lb_functionname from listbox within w_dwotherfuc_new
end type
type sle_functionparm from singlelineedit within w_dwotherfuc_new
end type
type st_1 from statictext within w_dwotherfuc_new
end type
type gb_1 from groupbox within w_dwotherfuc_new
end type
type gb_4 from groupbox within w_dwotherfuc_new
end type
type gb_2 from groupbox within w_dwotherfuc_new
end type
end forward

global type w_dwotherfuc_new from window
integer width = 3013
integer height = 1344
boolean titlebar = true
string title = "DataWindow Import Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
st_4 st_4
st_2 st_2
cb_2 cb_2
cb_clear cb_clear
st_tip st_tip
cb_1 cb_1
lb_functionparm lb_functionparm
lb_functionname lb_functionname
sle_functionparm sle_functionparm
st_1 st_1
gb_1 gb_1
gb_4 gb_4
gb_2 gb_2
end type
global w_dwotherfuc_new w_dwotherfuc_new

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

on w_dwotherfuc_new.create
this.dw_1=create dw_1
this.st_4=create st_4
this.st_2=create st_2
this.cb_2=create cb_2
this.cb_clear=create cb_clear
this.st_tip=create st_tip
this.cb_1=create cb_1
this.lb_functionparm=create lb_functionparm
this.lb_functionname=create lb_functionname
this.sle_functionparm=create sle_functionparm
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_4=create gb_4
this.gb_2=create gb_2
this.Control[]={this.dw_1,&
this.st_4,&
this.st_2,&
this.cb_2,&
this.cb_clear,&
this.st_tip,&
this.cb_1,&
this.lb_functionparm,&
this.lb_functionname,&
this.sle_functionparm,&
this.st_1,&
this.gb_1,&
this.gb_4,&
this.gb_2}
end on

on w_dwotherfuc_new.destroy
destroy(this.dw_1)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.cb_clear)
destroy(this.st_tip)
destroy(this.cb_1)
destroy(this.lb_functionparm)
destroy(this.lb_functionname)
destroy(this.sle_functionparm)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_4)
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

lb_functionname.AddItem("ImportFile")
lb_functionname.AddItem("ImportString")
lb_functionname.AddItem("ImportClipboard")
lb_functionname.SelectItem(1)
lb_functionname.Event SelectionChanged(1)





end event

type dw_1 from datawindow within w_dwotherfuc_new
integer x = 1435
integer y = 196
integer width = 1449
integer height = 640
integer taborder = 40
string title = "none"
string dataobject = "d_9k"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_dwotherfuc_new
integer x = 46
integer y = 36
integer width = 2322
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example shows how to apply ImportFile, ImportString, and ImportClipboard functions in a DataWindow."
boolean focusrectangle = false
end type

type st_2 from statictext within w_dwotherfuc_new
integer x = 1445
integer y = 852
integer width = 489
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Last Return Value:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_dwotherfuc_new
integer x = 2226
integer y = 1048
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

type cb_clear from commandbutton within w_dwotherfuc_new
integer x = 1833
integer y = 1048
integer width = 366
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear All"
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

dw_1.Reset()
end event

type st_tip from singlelineedit within w_dwotherfuc_new
integer x = 1435
integer y = 932
integer width = 1458
integer height = 92
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

type cb_1 from commandbutton within w_dwotherfuc_new
integer x = 1010
integer y = 1052
integer width = 325
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

String strtip , strexevalue, strtestvalue,ls_path,ls_name
String strar[]
Int parmnumber,li_num

//Test NUll Value as a Argument;

string null_str

SetNull(null_str)
/*
strtestvalue = sle_functionparm.Text

If IsNull(strtestvalue) Then strtestvalue = ''

If lb_functionname.SelectedIndex() < 0 Then
	iFlag = 1
	MessageBox('Warning','Please select testing function.')
	Return
End If

if strtestvalue = '' And lb_functionparm.totalitems() > 0 then
	iFlag = 1
	MessageBox('Warning','Please select testing data.')
	Return
End if
*/

Choose Case lb_functionname.SelectedItem()
	Case 'ImportFile'
		strexevalue = String(dw_1.ImportFile(null_str))
		
	Case 'ImportString'
		if sle_functionparm.Text="" then
			MessageBox('Warning','Please select testing data.')
			Return
		end if
		strexevalue = String(dw_1.ImportString(sle_functionparm.Text))
		
	Case 'ImportClipboard'
		strtestvalue = 'Jones~tQ1~tCosmic~t5~r~n'
		strtestvalue += 'Simpson~tQ1~tGalactic~t6~r~n'
		strtestvalue += 'Perez~tQ1~tCosmic~t26~r~n'
		strtestvalue += 'Simpson~tQ4~tCosmic~t60'
		
		Clipboard(strtestvalue)		
		strexevalue = String(dw_1.ImportClipboard())
	
End Choose

If IsNull(strexevalue) Then strexevalue = 'NULL'
strtip =  "Return value is " + strexevalue + "."
st_tip.Text = strtip

end event

type lb_functionparm from listbox within w_dwotherfuc_new
integer x = 686
integer y = 208
integer width = 649
integer height = 624
integer taborder = 40
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
string item[] = {"","","","",""}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if lb_functionname.SelectedItem()="ImportString" then
	sle_functionparm.text = lb_functionparm.SelectedItem()
end if
end event

type lb_functionname from listbox within w_dwotherfuc_new
integer x = 82
integer y = 212
integer width = 480
integer height = 936
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

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	HuangHui		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_functionparm.Reset()
sle_functionparm.Enabled = True
sle_functionparm.Text = ''

sle_functionparm.Enabled = True
lb_functionparm.Enabled = True

Choose Case lb_functionname.SelectedItem()
	Case 'ImportFile'
		//sle_functionparm.Enabled = False
//		sle_functionparm.Text = "ImportFile.txt"
		lb_functionparm.Enabled = false
		sle_functionparm.Enabled = false
				
	Case 'ImportString'
		lb_functionparm.additem('Jones~tQ1~tCosmic~t5')
		lb_functionparm.additem('Simpson~tQ1~tGalactic~t6')
		lb_functionparm.additem('Perez~tQ1~tCosmic~t26')
		lb_functionparm.additem('Simpson~tQ4~tCosmic~t60')		
		sle_functionparm.Enabled = false
		
	Case 'ImportClipboard'
		lb_functionparm.additem('Jones~tQ1~tCosmic~t5')
		lb_functionparm.additem('Simpson~tQ1~tGalactic~t6')
		lb_functionparm.additem('Perez~tQ1~tCosmic~t26')
		lb_functionparm.additem('Simpson~tQ4~tCosmic~t60')	
		sle_functionparm.Enabled = false
		
End Choose




end event

type sle_functionparm from singlelineedit within w_dwotherfuc_new
integer x = 686
integer y = 932
integer width = 649
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
end type

type st_1 from statictext within w_dwotherfuc_new
integer x = 686
integer y = 848
integer width = 590
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Function Parameter:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_dwotherfuc_new
integer x = 41
integer y = 140
integer width = 571
integer height = 1048
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

type gb_4 from groupbox within w_dwotherfuc_new
integer x = 631
integer y = 140
integer width = 750
integer height = 1048
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test Data"
end type

type gb_2 from groupbox within w_dwotherfuc_new
integer x = 1403
integer y = 140
integer width = 1527
integer height = 1048
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

