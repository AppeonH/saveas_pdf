$PBExportHeader$u_style_ancestor.sru
$PBExportComments$Edit Box with 3 pictures to set style (bold, italic, underline)
forward
global type u_style_ancestor from userobject
end type
type p_underline from picture within u_style_ancestor
end type
type p_italic from picture within u_style_ancestor
end type
type p_bold from picture within u_style_ancestor
end type
type sle_text from singlelineedit within u_style_ancestor
end type
end forward

global type u_style_ancestor from userobject
integer width = 1006
integer height = 156
boolean border = true
long backcolor = 78682240
long tabtextcolor = 33554432
p_underline p_underline
p_italic p_italic
p_bold p_bold
sle_text sle_text
end type
global u_style_ancestor u_style_ancestor

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
string   Alignment
end variables

on u_style_ancestor.create
this.p_underline=create p_underline
this.p_italic=create p_italic
this.p_bold=create p_bold
this.sle_text=create sle_text
this.Control[]={this.p_underline,&
this.p_italic,&
this.p_bold,&
this.sle_text}
end on

on u_style_ancestor.destroy
destroy(this.p_underline)
destroy(this.p_italic)
destroy(this.p_bold)
destroy(this.sle_text)
end on

event constructor;string  ls_Parm

//Is Dynamic Object
if LeftA(Message.StringParm,11)="#DYNAMICUO#" then 
	ls_Parm = RightA(Message.StringParm,LenA(Message.StringParm) - 11)
	sle_text.Text = ls_Parm
end if
end event

type p_underline from picture within u_style_ancestor
integer x = 841
integer y = 20
integer width = 82
integer height = 80
integer taborder = 40
string picturename = "pb_u_up.jpg"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Make the single line edit text underlined
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if this.picturename = "pb_u_up.jpg" then
	this.picturename = "pb_u_dn.jpg"
	sle_text.underline = true
else
	this.picturename = "pb_u_up.jpg"
	sle_text.underline = false
end if
end event

type p_italic from picture within u_style_ancestor
integer x = 759
integer y = 20
integer width = 82
integer height = 80
integer taborder = 30
string picturename = "pb_i_up.jpg"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Make the single line edit text italic
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if this.picturename = "pb_i_up.jpg" then
	this.picturename = "pb_i_dn.jpg"
	sle_text.italic = true
else
	this.picturename = "pb_i_up.jpg"
	sle_text.italic = false
end if
end event

type p_bold from picture within u_style_ancestor
integer x = 677
integer y = 20
integer width = 82
integer height = 80
integer taborder = 20
string picturename = "pb_b_up.jpg"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Make the single line edit text bold
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if this.picturename = "pb_b_up.jpg" then
	this.picturename = "pb_b_dn.jpg"
	sle_text.weight = 700
else
	this.picturename = "pb_b_up.jpg"
	sle_text.weight = 400
end if

end event

type sle_text from singlelineedit within u_style_ancestor
integer x = 18
integer y = 20
integer width = 576
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "u_style_ancestor"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

