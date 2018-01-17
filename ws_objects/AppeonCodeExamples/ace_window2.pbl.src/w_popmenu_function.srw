$PBExportHeader$w_popmenu_function.srw
forward
global type w_popmenu_function from window
end type
type st_3 from statictext within w_popmenu_function
end type
type sle_functionparm from singlelineedit within w_popmenu_function
end type
type st_2 from statictext within w_popmenu_function
end type
type cb_1 from commandbutton within w_popmenu_function
end type
type lb_parm from listbox within w_popmenu_function
end type
type lb_function from listbox within w_popmenu_function
end type
type st_1 from statictext within w_popmenu_function
end type
type cb_2 from commandbutton within w_popmenu_function
end type
type rb_8 from radiobutton within w_popmenu_function
end type
type rb_7 from radiobutton within w_popmenu_function
end type
type rb_6 from radiobutton within w_popmenu_function
end type
type rb_5 from radiobutton within w_popmenu_function
end type
type rb_4 from radiobutton within w_popmenu_function
end type
type rb_3 from radiobutton within w_popmenu_function
end type
type rb_2 from radiobutton within w_popmenu_function
end type
type rb_1 from radiobutton within w_popmenu_function
end type
type dw_1 from datawindow within w_popmenu_function
end type
type gb_1 from groupbox within w_popmenu_function
end type
type gb_3 from groupbox within w_popmenu_function
end type
type gb_2 from groupbox within w_popmenu_function
end type
type gb_4 from groupbox within w_popmenu_function
end type
end forward

global type w_popmenu_function from window
integer width = 3456
integer height = 1888
boolean titlebar = true
string title = "Appeon Popmenu Function"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_changestyle ( string as_stylename )
st_3 st_3
sle_functionparm sle_functionparm
st_2 st_2
cb_1 cb_1
lb_parm lb_parm
lb_function lb_function
st_1 st_1
cb_2 cb_2
rb_8 rb_8
rb_7 rb_7
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
dw_1 dw_1
gb_1 gb_1
gb_3 gb_3
gb_2 gb_2
gb_4 gb_4
end type
global w_popmenu_function w_popmenu_function

type variables
string is_Style
end variables

event ue_changestyle(string as_stylename);//====================================================================
// Event: 		ue_changestyle()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:  string	as_stylename		
//--------------------------------------------------------------------
// Returns: 	(none)
//--------------------------------------------------------------------
// Author: 	 	zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String  ls_DataObject

if is_Style = as_StyleName then return
Choose Case Lower(as_StyleName)
	Case 'grid'
		ls_DataObject = "d_dwexample_grid"
	Case 'freeform'
		ls_DataObject = "d_dwexample_freeform"
	Case 'graph'
		ls_DataObject = "d_dwexample_graph"
	Case 'group'
		ls_DataObject = "d_dwexample_group"
	Case 'label'
		ls_DataObject = "d_dwexample_label"
	Case 'tabular'
		ls_DataObject = "d_dwexample_tabular"
	Case 'n-up'
		ls_DataObject = "d_dwexample_nup"
	Case 'crosstab'
		ls_DataObject = "d_dwstyle_crosstab2"
End Choose

is_Style = as_StyleName

dw_1.DataObject = ls_DataObject
dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

end event

on w_popmenu_function.create
this.st_3=create st_3
this.sle_functionparm=create sle_functionparm
this.st_2=create st_2
this.cb_1=create cb_1
this.lb_parm=create lb_parm
this.lb_function=create lb_function
this.st_1=create st_1
this.cb_2=create cb_2
this.rb_8=create rb_8
this.rb_7=create rb_7
this.rb_6=create rb_6
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_4=create gb_4
this.Control[]={this.st_3,&
this.sle_functionparm,&
this.st_2,&
this.cb_1,&
this.lb_parm,&
this.lb_function,&
this.st_1,&
this.cb_2,&
this.rb_8,&
this.rb_7,&
this.rb_6,&
this.rb_5,&
this.rb_4,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.dw_1,&
this.gb_1,&
this.gb_3,&
this.gb_2,&
this.gb_4}
end on

on w_popmenu_function.destroy
destroy(this.st_3)
destroy(this.sle_functionparm)
destroy(this.st_2)
destroy(this.cb_1)
destroy(this.lb_parm)
destroy(this.lb_function)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.rb_8)
destroy(this.rb_7)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_4)
end on

event open;This.X = 0
This.Y = 0

end event

type st_3 from statictext within w_popmenu_function
integer x = 27
integer y = 4
integer width = 2597
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example applies only to Appeon Server versions which support appeonpopmenu and appeonpopmenuon function."
boolean focusrectangle = false
end type

type sle_functionparm from singlelineedit within w_popmenu_function
integer x = 800
integer y = 1396
integer width = 517
integer height = 88
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_popmenu_function
integer x = 713
integer y = 1328
integer width = 585
integer height = 72
integer textsize = -9
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

type cb_1 from commandbutton within w_popmenu_function
integer x = 974
integer y = 1508
integer width = 343
integer height = 96
integer taborder = 60
integer textsize = -9
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
// Author: 	zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String strtip , strexevalue, strtestvalue
String strar[]
Int 	 parmnumber
date   ld_date

strtestvalue = sle_functionparm.Text
//parmnumber = wf_str2array(strtestvalue,strar)

If IsNull(strtestvalue) Then strtestvalue = ''
If lb_function.SelectedIndex() < 0 Then
	MessageBox('Warning','Please select testing function.')
	Return
End If

If strtestvalue = '' And lb_function.TotalItems() > 0 Then
	MessageBox('Warning','Please select testing data.')
	Return
End If

Choose Case lb_function.SelectedItem()
	Case 'Appeonpopmenu'
		choose case strtestvalue
			case '0,0'
				appeonpopmenu(dw_1,0,0)
			case '100,100'
				appeonpopmenu(dw_1,100,100)
			case '1000,1000'
				appeonpopmenu(dw_1,1000,1000)
		end choose
	Case 'AppeonPopmenuon'
		choose case strtestvalue
			case 'True'
				appeonpopmenuon(dw_1,True)
			case 'False'
				appeonpopmenuon(dw_1,False)
		end choose
End Choose

end event

type lb_parm from listbox within w_popmenu_function
integer x = 713
integer y = 468
integer width = 603
integer height = 852
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
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
// Author: 	zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

sle_functionparm.text = lb_parm.selecteditem()
end event

type lb_function from listbox within w_popmenu_function
integer x = 46
integer y = 468
integer width = 599
integer height = 1136
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: 		selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_parm.reset()
Choose Case lb_function.SelectedItem()
	Case 'Appeonpopmenu'
		lb_parm.additem('0,0')
		lb_parm.additem('100,100')
		lb_parm.additem('1000,1000')
	Case 'AppeonPopmenuon'
		lb_parm.additem('True')
		lb_parm.additem('False')
End Choose




end event

event constructor;lb_function.additem('Appeonpopmenu')
lb_function.additem('AppeonPopmenuon')
end event

type st_1 from statictext within w_popmenu_function
integer x = 27
integer y = 64
integer width = 1403
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "You can right click on the DataWindow with the popup menu:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_popmenu_function
integer x = 3067
integer y = 1660
integer width = 320
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;CLOSE(Parent)

end event

type rb_8 from radiobutton within w_popmenu_function
integer x = 965
integer y = 292
integer width = 256
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "N-Up"
end type

event clicked;//====================================================================
// Event: 		clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: 	long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 		zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Parent.Event ue_changestyle(This.Text)

end event

type rb_7 from radiobutton within w_popmenu_function
integer x = 667
integer y = 292
integer width = 293
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Label"
end type

event clicked;//====================================================================
// Event: 		clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: 	long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 		zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Parent.Event ue_changestyle(This.Text)

end event

type rb_6 from radiobutton within w_popmenu_function
integer x = 73
integer y = 292
integer width = 293
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Group"
end type

event clicked;//====================================================================
// Event: 		clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: 	long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 		zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Parent.Event ue_changestyle(This.Text)

end event

type rb_5 from radiobutton within w_popmenu_function
integer x = 370
integer y = 292
integer width = 293
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Crosstab"
end type

event clicked;//====================================================================
// Event: 		clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: 	long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 		zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Parent.Event ue_changestyle(This.Text)

end event

type rb_4 from radiobutton within w_popmenu_function
integer x = 965
integer y = 196
integer width = 256
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Graph"
end type

event clicked;//====================================================================
// Event: 		clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: 	long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 		zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Parent.Event ue_changestyle(This.Text)

end event

type rb_3 from radiobutton within w_popmenu_function
integer x = 667
integer y = 196
integer width = 293
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tabular"
end type

event clicked;//====================================================================
// Event: 		clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: 	long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 		zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Parent.Event ue_changestyle(This.Text)

end event

type rb_2 from radiobutton within w_popmenu_function
integer x = 370
integer y = 196
integer width = 293
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Freeform"
end type

event clicked;//====================================================================
// Event: 		clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: 	long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 		zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Parent.Event ue_changestyle(This.Text)

end event

type rb_1 from radiobutton within w_popmenu_function
integer x = 73
integer y = 192
integer width = 293
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grid"
boolean checked = true
end type

event clicked;//====================================================================
// Event: 		clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: 	long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 		zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Parent.Event ue_changestyle(This.Text)

end event

event constructor;Parent.Event ue_changestyle(This.Text)
end event

type dw_1 from datawindow within w_popmenu_function
integer x = 1376
integer y = 196
integer width = 1970
integer height = 1420
integer taborder = 10
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//====================================================================
// Event: 	rowfocuschanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	currentrow		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrowchange]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

IF is_style = 'Freeform' then return
If currentrow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(currentrow,True)
End If


end event

event rbuttondown;//====================================================================
// Event: 	rbuttondown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer   xpos
//		integer   ypos
//		long  	 row
//		dwobject  dwo
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrbuttondown]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/04/14
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
//xpos = xpos + 200
//ypos = ypos + 200
//if rb_Appeonpopmenu.Checked then	
//	appeonpopmenu(dw_1,xpos,ypos)
//else
//	appeonpopmenuon(dw_1,True)
//end if


end event

type gb_1 from groupbox within w_popmenu_function
integer x = 18
integer y = 132
integer width = 1317
integer height = 280
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "DataWindow Style"
end type

type gb_3 from groupbox within w_popmenu_function
integer x = 1349
integer y = 128
integer width = 2039
integer height = 1508
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "DataWindow"
end type

type gb_2 from groupbox within w_popmenu_function
integer x = 18
integer y = 412
integer width = 658
integer height = 1220
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Function"
end type

type gb_4 from groupbox within w_popmenu_function
integer x = 690
integer y = 412
integer width = 649
integer height = 1220
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test Data"
end type

