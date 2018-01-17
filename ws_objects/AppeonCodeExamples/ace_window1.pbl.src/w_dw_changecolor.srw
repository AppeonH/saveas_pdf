$PBExportHeader$w_dw_changecolor.srw
$PBExportComments$Change  datawindow object color
forward
global type w_dw_changecolor from window
end type
type cb_3 from commandbutton within w_dw_changecolor
end type
type st_2 from statictext within w_dw_changecolor
end type
type cb_2 from commandbutton within w_dw_changecolor
end type
type cb_1 from commandbutton within w_dw_changecolor
end type
type st_1 from statictext within w_dw_changecolor
end type
type cb_close from commandbutton within w_dw_changecolor
end type
type dw_1 from datawindow within w_dw_changecolor
end type
end forward

global type w_dw_changecolor from window
integer x = 256
integer y = 264
integer width = 2555
integer height = 1444
boolean titlebar = true
string title = "Change Objects~' Color and Background Color"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
cb_3 cb_3
st_2 st_2
cb_2 cb_2
cb_1 cb_1
st_1 st_1
cb_close cb_close
dw_1 dw_1
end type
global w_dw_changecolor w_dw_changecolor

type variables

end variables

event ue_postopen();//====================================================================
// Event: ue_postopen()
//--------------------------------------------------------------------
// Description: ue_PostOpen script for w_hightlight_dw_rows
//--------------------------------------------------------------------
// Arguments: 
//		None		
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

// Set the transaction object
dw_1.SetTransObject (sqlca)

// Retrieve the data
dw_1.Retrieve()




end event

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description:  Open script for w_highlight_dw_rows
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
// Post event to retrieve data on postopen (allow window to open faster)
This.X = 0
This.Y = 0

This.Post Event  ue_postopen()



end event

on w_dw_changecolor.create
this.cb_3=create cb_3
this.st_2=create st_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_close=create cb_close
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.st_2,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.cb_close,&
this.dw_1}
end on

on w_dw_changecolor.destroy
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type cb_3 from commandbutton within w_dw_changecolor
integer x = 805
integer y = 1216
integer width = 334
integer height = 96
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

type st_2 from statictext within w_dw_changecolor
integer x = 32
integer y = 120
integer width = 2359
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = " dialog window, which provides a good idea for choosing color."
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_dw_changecolor
integer x = 1303
integer y = 1216
integer width = 334
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Text Color"
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
String  ls_Ret

OPEN(w_choose_color)
ls_Ret = Message.StringParm
If ls_Ret = 'cancel' Then Return

Long  li_Cnt,li_Count
String ls_Name

li_Count = Long(dw_1.Describe('datawindow.column.count'))
For li_Cnt =  1 To li_Count
	ls_Name = dw_1.Describe("#"+String(li_Cnt)+".name")
	dw_1.Modify(ls_Name+".color="+ls_Ret)
	dw_1.Modify(ls_Name+"_t.color="+ls_Ret)
Next
st_1.TextColor = Long(ls_Ret)
st_2.TextColor = Long(ls_Ret)



end event

type cb_1 from commandbutton within w_dw_changecolor
integer x = 1673
integer y = 1216
integer width = 448
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Background Color"
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
String  ls_Ret

OPEN(w_choose_color)
ls_Ret = Message.StringParm
If ls_Ret = 'cancel' Then Return

Long  li_Cnt,li_Count,ll_Color
String ls_Name

ll_Color = Long(ls_Ret)
li_Count = Long(dw_1.Describe('datawindow.column.count'))
For li_Cnt =  1 To li_Count
	ls_Name = dw_1.Describe("#"+String(li_Cnt)+".name")
	dw_1.Modify(ls_Name+".background.color="+ls_Ret)
	dw_1.Modify(ls_Name+"_t.background.color="+ls_Ret)
Next

st_1.BackColor = ll_Color
st_2.BackColor = ll_Color
Parent.BackColor = ll_Color

end event

type st_1 from statictext within w_dw_changecolor
integer x = 32
integer y = 44
integer width = 2592
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "This example shows how to change DataWindow objects~' color and background color properties by a response"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_dw_changecolor
integer x = 2162
integer y = 1216
integer width = 306
integer height = 96
integer taborder = 10
integer textsize = -9
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

type dw_1 from datawindow within w_dw_changecolor
integer x = 32
integer y = 212
integer width = 2441
integer height = 968
integer taborder = 30
string dataobject = "d_cust_sort"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

