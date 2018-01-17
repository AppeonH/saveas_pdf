$PBExportHeader$w_dwselection_functions.srw
$PBExportComments$DW.ImportFile, DW.ImportString，DW. ImportClipboard Function test.
forward
global type w_dwselection_functions from window
end type
type cb_3 from commandbutton within w_dwselection_functions
end type
type dw_1 from datawindow within w_dwselection_functions
end type
type cb_2 from commandbutton within w_dwselection_functions
end type
type cb_clear from commandbutton within w_dwselection_functions
end type
type st_tip from singlelineedit within w_dwselection_functions
end type
type cb_1 from commandbutton within w_dwselection_functions
end type
type lb_functionparm from listbox within w_dwselection_functions
end type
type lb_functionname from listbox within w_dwselection_functions
end type
type sle_functionparm from singlelineedit within w_dwselection_functions
end type
type st_1 from statictext within w_dwselection_functions
end type
type gb_1 from groupbox within w_dwselection_functions
end type
type gb_4 from groupbox within w_dwselection_functions
end type
type gb_2 from groupbox within w_dwselection_functions
end type
end forward

global type w_dwselection_functions from window
integer width = 3013
integer height = 1344
boolean titlebar = true
string title = "DataWindow Selection Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
dw_1 dw_1
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
global w_dwselection_functions w_dwselection_functions

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

on w_dwselection_functions.create
this.cb_3=create cb_3
this.dw_1=create dw_1
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
this.Control[]={this.cb_3,&
this.dw_1,&
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

on w_dwselection_functions.destroy
destroy(this.cb_3)
destroy(this.dw_1)
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

lb_functionname.AddItem("SelectedLength")
lb_functionname.AddItem("SelectedStart")
lb_functionname.AddItem("SelectedText")
lb_functionname.AddItem("SelectText")
lb_functionname.AddItem("ReplaceText")





end event

type cb_3 from commandbutton within w_dwselection_functions
integer x = 1687
integer y = 940
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

type dw_1 from datawindow within w_dwselection_functions
integer x = 1257
integer y = 28
integer width = 1687
integer height = 876
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

type cb_2 from commandbutton within w_dwselection_functions
integer x = 2569
integer y = 932
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

type cb_clear from commandbutton within w_dwselection_functions
integer x = 2167
integer y = 932
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

dw_1.retrieve()
st_tip.text =''
end event

type st_tip from singlelineedit within w_dwselection_functions
integer x = 1298
integer y = 1088
integer width = 1605
integer height = 104
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

type cb_1 from commandbutton within w_dwselection_functions
integer x = 672
integer y = 1084
integer width = 507
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
//				zhouchaoqun  Date: 2005/03/25
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

String strtip , strexevalue, strtestvalue,ls_path,ls_name
String strar[]
Int li_parm1,li_parm2,li_num

strtestvalue = sle_functionparm.Text

Choose Case lb_functionname.SelectedItem()
	Case 'SelectedLength'
		dw_1.SelectText(1,5)
		strexevalue = String(dw_1.SelectedLength())
		
	Case 'SelectedStart'	
		dw_1.SelectText(2,5)
		strexevalue = String(dw_1.SelectedStart())
		
	Case 'SelectedText'	
		dw_1.SelectText(1,5)
		strexevalue = String(dw_1.SelectedText())
	Case 'SelectText'	
		   if LenA(trim(strtestvalue)) <= 0 then
				messagebox('Warning','Please input Parameter!')
				return
			end if	
			li_num = PosA(strtestvalue,',')
			if li_num > 0 then
				li_parm1 = integer(trim(LeftA(strtestvalue , li_num - 1)))
				li_parm2 = integer(trim(MidA(strtestvalue , li_num + 1)))
				strexevalue = String(dw_1.SelectText(li_parm1,li_parm2))
			else
				messagebox('Warning','Parameter is invalid!')
				return
			end if
	Case 'ReplaceText'
		  dw_1.setcolumn(2)
		  dw_1.SelectText(1, LenA(dw_1.GetText()))
		  strexevalue = String(dw_1.ReplaceText(strtestvalue))	
End Choose

If IsNull(strexevalue) Then strexevalue = 'NULL'
strtip =  "Return value is " + strexevalue + "."
st_tip.Text = strtip
dw_1.setfocus()
dw_1.accepttext()
end event

type lb_functionparm from listbox within w_dwselection_functions
integer x = 667
integer y = 80
integer width = 512
integer height = 764
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

if lb_functionname.SelectedItem()="ReplaceText" or &
	 lb_functionname.SelectedItem()="SelectText" then
	sle_functionparm.text = lb_functionparm.SelectedItem()
end if
end event

type lb_functionname from listbox within w_dwselection_functions
integer x = 64
integer y = 72
integer width = 489
integer height = 1104
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

dw_1.setfocus()

Choose Case lb_functionname.SelectedItem()
	Case 'SelectText'
		lb_functionparm.additem('1,2')
		lb_functionparm.additem('1,1')
		Return
	Case 'ReplaceText'
		lb_functionparm.additem('Jones')
		lb_functionparm.additem('1900/02/01')
		lb_functionparm.additem('18:20:58')
		lb_functionparm.additem('60')		
	Case else
		sle_functionparm.Enabled = false
		lb_functionparm.Enabled = false
End Choose




end event

type sle_functionparm from singlelineedit within w_dwselection_functions
integer x = 677
integer y = 964
integer width = 512
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

type st_1 from statictext within w_dwselection_functions
integer x = 667
integer y = 872
integer width = 507
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

type gb_1 from groupbox within w_dwselection_functions
integer x = 23
integer width = 571
integer height = 1216
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

type gb_4 from groupbox within w_dwselection_functions
integer x = 622
integer y = 4
integer width = 603
integer height = 1212
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

type gb_2 from groupbox within w_dwselection_functions
integer x = 1257
integer y = 1028
integer width = 1687
integer height = 196
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

