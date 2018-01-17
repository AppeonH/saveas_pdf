$PBExportHeader$w_dot_notation.srw
$PBExportComments$Window to customize a datawindow using describe/modify and direct object reference syntax
forward
global type w_dot_notation from window
end type
type cb_1 from commandbutton within w_dot_notation
end type
type st_30 from statictext within w_dot_notation
end type
type ddlb_6 from dropdownlistbox within w_dot_notation
end type
type ddlb_5 from dropdownlistbox within w_dot_notation
end type
type sle_4 from singlelineedit within w_dot_notation
end type
type ddlb_4 from dropdownlistbox within w_dot_notation
end type
type ddlb_3 from dropdownlistbox within w_dot_notation
end type
type ddlb_2 from dropdownlistbox within w_dot_notation
end type
type sle_3 from singlelineedit within w_dot_notation
end type
type ddlb_1 from dropdownlistbox within w_dot_notation
end type
type st_29 from statictext within w_dot_notation
end type
type st_28 from statictext within w_dot_notation
end type
type st_27 from statictext within w_dot_notation
end type
type st_17 from statictext within w_dot_notation
end type
type st_16 from statictext within w_dot_notation
end type
type st_15 from statictext within w_dot_notation
end type
type st_14 from statictext within w_dot_notation
end type
type st_13 from statictext within w_dot_notation
end type
type st_12 from statictext within w_dot_notation
end type
type st_11 from statictext within w_dot_notation
end type
type sle_1 from singlelineedit within w_dot_notation
end type
type st_10 from statictext within w_dot_notation
end type
type st_9 from statictext within w_dot_notation
end type
type st_8 from statictext within w_dot_notation
end type
type st_7 from statictext within w_dot_notation
end type
type cb_close from commandbutton within w_dot_notation
end type
type dw_1 from datawindow within w_dot_notation
end type
end forward

shared variables

end variables

global type w_dot_notation from window
integer x = 87
integer y = 4
integer width = 2450
integer height = 1900
boolean titlebar = true
string title = "Direct Object Reference"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
st_30 st_30
ddlb_6 ddlb_6
ddlb_5 ddlb_5
sle_4 sle_4
ddlb_4 ddlb_4
ddlb_3 ddlb_3
ddlb_2 ddlb_2
sle_3 sle_3
ddlb_1 ddlb_1
st_29 st_29
st_28 st_28
st_27 st_27
st_17 st_17
st_16 st_16
st_15 st_15
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
sle_1 sle_1
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
cb_close cb_close
dw_1 dw_1
end type
global w_dot_notation w_dot_notation

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
String   is_object_name
String   is_text_attr[]
String   is_column_attr[]

// determines if we are currently selecting a column or text
Boolean   ib_column

end variables

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
String	ls_Names

This.X = 0
This.Y = 0

// Retrieve Data into the Main Data Window
dw_1.SetTransObject (sqlca)
dw_1.Retrieve()



end event

on w_dot_notation.create
this.cb_1=create cb_1
this.st_30=create st_30
this.ddlb_6=create ddlb_6
this.ddlb_5=create ddlb_5
this.sle_4=create sle_4
this.ddlb_4=create ddlb_4
this.ddlb_3=create ddlb_3
this.ddlb_2=create ddlb_2
this.sle_3=create sle_3
this.ddlb_1=create ddlb_1
this.st_29=create st_29
this.st_28=create st_28
this.st_27=create st_27
this.st_17=create st_17
this.st_16=create st_16
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.sle_1=create sle_1
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.cb_close=create cb_close
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.st_30,&
this.ddlb_6,&
this.ddlb_5,&
this.sle_4,&
this.ddlb_4,&
this.ddlb_3,&
this.ddlb_2,&
this.sle_3,&
this.ddlb_1,&
this.st_29,&
this.st_28,&
this.st_27,&
this.st_17,&
this.st_16,&
this.st_15,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.sle_1,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.cb_close,&
this.dw_1}
end on

on w_dot_notation.destroy
destroy(this.cb_1)
destroy(this.st_30)
destroy(this.ddlb_6)
destroy(this.ddlb_5)
destroy(this.sle_4)
destroy(this.ddlb_4)
destroy(this.ddlb_3)
destroy(this.ddlb_2)
destroy(this.sle_3)
destroy(this.ddlb_1)
destroy(this.st_29)
destroy(this.st_28)
destroy(this.st_27)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.sle_1)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_dot_notation
integer x = 1984
integer y = 1048
integer width = 343
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas( )
end event

type st_30 from statictext within w_dot_notation
integer x = 1531
integer y = 36
integer width = 443
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long backcolor = 73955432
string text = "Attribute Values"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type ddlb_6 from dropdownlistbox within w_dot_notation
integer x = 1531
integer y = 104
integer width = 663
integer height = 436
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean vscrollbar = true
string item[] = {"0 - None","2 - Rectangle","5 - 3D Lowered","6 - 3D Raised"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_1.Text = 'dw_1.Object.name.border = ' + String(Integer(LeftA(This.Text, 1)))
dw_1.Object.Name.Border =  Integer(LeftA(This.Text, 1))

end event

type ddlb_5 from dropdownlistbox within w_dot_notation
integer x = 1531
integer y = 216
integer width = 663
integer height = 436
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean vscrollbar = true
string item[] = {"0 - Left","1 - Right","2 - Center"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_1.Text = 'dw_1.Object.name.alignment = ' + String(Integer(LeftA(This.Text, 1)))
dw_1.Object.Name.Alignment = Integer(LeftA(This.Text, 1))

end event

type sle_4 from singlelineedit within w_dot_notation
integer x = 1531
integer y = 328
integer width = 663
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_1.Text = "dw_1.Object.name.font.face = '" + This.Text + "'"
dw_1.Object.Name.font.face =  This.Text


end event

type ddlb_4 from dropdownlistbox within w_dot_notation
integer x = 1531
integer y = 444
integer width = 663
integer height = 436
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean vscrollbar = true
string item[] = {"400 - Normal","700 - Bold"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_1.Text = 'dw_1.Object.name.font.weight = ' + String(Integer(LeftA(This.Text, 3)))
dw_1.Object.Name.font.Weight = Integer(LeftA(This.Text, 3))


end event

type ddlb_3 from dropdownlistbox within w_dot_notation
integer x = 1531
integer y = 560
integer width = 663
integer height = 436
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean vscrollbar = true
string item[] = {"0 - None","2 - Rectangle","5 - 3D Lowered","6 - 3D Raised"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_1.Text = 'dw_1.Object.name_t.border = ' + String(Integer(LeftA(This.Text, 1)))
dw_1.Object.name_t.Border = Integer(LeftA(This.Text, 1))

end event

type ddlb_2 from dropdownlistbox within w_dot_notation
integer x = 1531
integer y = 676
integer width = 663
integer height = 436
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean vscrollbar = true
string item[] = {"0 - Left","1 - Right","2 - Center"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_1.Text = 'dw_1.Object.name_t.alignment = ' + String(Integer(LeftA(This.Text, 1)))
dw_1.Object.name_t.Alignment = Integer(LeftA(This.Text, 1))

end event

type sle_3 from singlelineedit within w_dot_notation
integer x = 1531
integer y = 792
integer width = 663
integer height = 76
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_1.Text = "dw_1.Object.name_t.font.face = '" + This.Text + "'"
dw_1.Object.name_t.font.face =  This.Text

end event

type ddlb_1 from dropdownlistbox within w_dot_notation
integer x = 1531
integer y = 896
integer width = 663
integer height = 436
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean vscrollbar = true
string item[] = {"400 - Normal","700 - Bold"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_1.Text = 'dw_1.Object.name_t.font.weight = ' + String(Integer(LeftA(This.Text, 3)))
dw_1.Object.name_t.font.Weight = Integer(LeftA(This.Text, 3))

end event

type st_29 from statictext within w_dot_notation
integer x = 791
integer y = 36
integer width = 370
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long backcolor = 73955432
string text = "Object Attributes"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_28 from statictext within w_dot_notation
integer x = 795
integer y = 104
integer width = 206
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = "border"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_27 from statictext within w_dot_notation
integer x = 791
integer y = 208
integer width = 233
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = "alignment"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_17 from statictext within w_dot_notation
integer x = 791
integer y = 316
integer width = 206
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = "font.face"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_16 from statictext within w_dot_notation
integer x = 791
integer y = 436
integer width = 256
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = "font.weight"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_15 from statictext within w_dot_notation
integer x = 791
integer y = 556
integer width = 206
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = "border"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_14 from statictext within w_dot_notation
integer x = 791
integer y = 672
integer width = 233
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = "alignment"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_13 from statictext within w_dot_notation
integer x = 791
integer y = 788
integer width = 206
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = "font.face"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_12 from statictext within w_dot_notation
integer x = 791
integer y = 896
integer width = 256
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = "font.weight"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_11 from statictext within w_dot_notation
integer x = 1792
integer y = 1072
integer width = 64
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = ")"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_dot_notation
integer x = 411
integer y = 1064
integer width = 1371
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_10 from statictext within w_dot_notation
integer x = 64
integer y = 1072
integer width = 338
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Dot Notation: ("
alignment alignment = right!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_9 from statictext within w_dot_notation
integer x = 192
integer y = 556
integer width = 192
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = "name_t"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_8 from statictext within w_dot_notation
integer x = 192
integer y = 104
integer width = 192
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = "name"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_7 from statictext within w_dot_notation
integer x = 59
integer y = 36
integer width = 448
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long backcolor = 73955432
string text = "DataWindow Object"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_dot_notation
integer x = 2039
integer y = 1672
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
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
CLOSE (Parent)

end event

type dw_1 from datawindow within w_dot_notation
integer x = 37
integer y = 1168
integer width = 2345
integer height = 488
integer taborder = 20
string dataobject = "d_emp_for_modify"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

