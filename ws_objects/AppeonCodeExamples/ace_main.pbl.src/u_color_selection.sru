$PBExportHeader$u_color_selection.sru
$PBExportComments$Color selector, with SLEs and HScrollBars for R,G,B
forward
global type u_color_selection from userobject
end type
type cb_3 from commandbutton within u_color_selection
end type
type cb_2 from commandbutton within u_color_selection
end type
type cb_1 from commandbutton within u_color_selection
end type
type st_3 from statictext within u_color_selection
end type
type st_2 from statictext within u_color_selection
end type
type st_1 from statictext within u_color_selection
end type
type sle_blue from singlelineedit within u_color_selection
end type
type sle_green from singlelineedit within u_color_selection
end type
type sle_red from singlelineedit within u_color_selection
end type
type r_1 from rectangle within u_color_selection
end type
end forward

global type u_color_selection from userobject
integer width = 754
integer height = 460
boolean border = true
long backcolor = 78682240
long tabtextcolor = 33554432
event color_changed pbm_custom01
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_3 st_3
st_2 st_2
st_1 st_1
sle_blue sle_blue
sle_green sle_green
sle_red sle_red
r_1 r_1
end type
global u_color_selection u_color_selection

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

Int   ii_r, ii_g, ii_b

end variables

forward prototypes
public subroutine uf_set_rgb (long al_rgb)
public function long uf_get_rgb ()
end prototypes

public subroutine uf_set_rgb (long al_rgb);//====================================================================
// Function: uf_set_rgb()
//--------------------------------------------------------------------
// Description: initialize the RGB values on this user object to the
//				long value that is passed to this function
//--------------------------------------------------------------------
// Arguments: 
//		value	long	al_rgb		
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

// set the red color value
ii_r = Mod (al_rgb, 256)
al_rgb = al_rgb / 256

// set the green color value
ii_g = Mod (al_rgb, 256)
al_rgb = al_rgb / 256

// set the blue color value
ii_b = Mod (al_rgb, 256)

// set the fill color on the 'test color palette' to the current RGB value
r_1.FillColor = RGB (ii_r, ii_g, ii_b)

// set the horizontal scrollbars to the correct positions


// set the red, green, and blue text values to the correct values.
sle_red.Text = String (ii_r)
sle_green.Text = String (ii_g)
sle_blue.Text = String (ii_b)



end subroutine

public function long uf_get_rgb ();//====================================================================
// Function: uf_get_rgb()
//--------------------------------------------------------------------
// Description: returns the current RGB value for this user object
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Return RGB (ii_r, ii_g, ii_b)


end function

on u_color_selection.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_blue=create sle_blue
this.sle_green=create sle_green
this.sle_red=create sle_red
this.r_1=create r_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_blue,&
this.sle_green,&
this.sle_red,&
this.r_1}
end on

on u_color_selection.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_blue)
destroy(this.sle_green)
destroy(this.sle_red)
destroy(this.r_1)
end on

event constructor;ii_r = 0
ii_g = 0
ii_b = 0

end event

type cb_3 from commandbutton within u_color_selection
integer x = 411
integer y = 328
integer width = 293
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Blue"
end type

event clicked;ii_b = rand(255)
sle_blue.text = String (ii_b)

r_1.fillcolor = RGB (ii_r, ii_g, ii_b)
parent.TriggerEvent ('color_changed')
end event

type cb_2 from commandbutton within u_color_selection
integer x = 411
integer y = 232
integer width = 293
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Green"
end type

event clicked;ii_g = rand(255)
sle_green.text = String (ii_g)
r_1.fillcolor = RGB (ii_r, ii_g, ii_b)

parent.TriggerEvent ('color_changed')
end event

type cb_1 from commandbutton within u_color_selection
integer x = 411
integer y = 132
integer width = 293
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Red"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Decrement the red color value by 10
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 			Date: 2003/12/31
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

ii_r = rand(255)
sle_red.text = String (ii_r)
r_1.fillcolor = RGB (ii_r, ii_g, ii_b)

parent.TriggerEvent ('color_changed')
end event

type st_3 from statictext within u_color_selection
integer x = 41
integer y = 324
integer width = 151
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 78682240
string text = "Blue:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within u_color_selection
integer x = 9
integer y = 228
integer width = 192
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 65280
long backcolor = 78682240
string text = "Green:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within u_color_selection
integer x = 69
integer y = 136
integer width = 133
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 78682240
string text = "Red:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_blue from singlelineedit within u_color_selection
integer x = 224
integer y = 324
integer width = 151
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
long textcolor = 16777215
long backcolor = 16711680
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on getfocus;// select the text when this single line edit get focus

this.SelectText (1, LenA (this.text))
end on

event modified;//////////////////////////////////////////////////////////////////////
// Change the blue color value based on the data entered
//////////////////////////////////////////////////////////////////////

int	li_new_value


if IsNumber (this.text) then
	li_new_value = Integer (this.text)
	if li_new_value < 0 or li_new_value > 255 then
		this.text = String (ii_b)
	else
		ii_b = li_new_value
		r_1.fillcolor = RGB (ii_r, ii_g, ii_b)
		parent.TriggerEvent ("color_changed")
	end if
else
	this.text = String (ii_b)
end if


end event

type sle_green from singlelineedit within u_color_selection
integer x = 224
integer y = 228
integer width = 151
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
long textcolor = 16777215
long backcolor = 65280
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on getfocus;// select the text when this single line edit get focus

this.SelectText (1, LenA (this.text))
end on

event modified;//////////////////////////////////////////////////////////////////////
// Change the green color value based on the data entered
//////////////////////////////////////////////////////////////////////

int	li_new_value


if IsNumber (this.text) then
	li_new_value = Integer (this.text)
	if li_new_value < 0 or li_new_value > 255 then
		this.text = String (ii_g)
	else
		ii_g = li_new_value
		r_1.fillcolor = RGB (ii_r, ii_g, ii_b)
		parent.TriggerEvent ("color_changed")
	end if
else
	this.text = String (ii_g)
end if


end event

type sle_red from singlelineedit within u_color_selection
integer x = 224
integer y = 136
integer width = 151
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
long textcolor = 16777215
long backcolor = 255
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on getfocus;// select the text when this single line edit get focus

this.SelectText (1, LenA (this.text))
end on

event modified;//////////////////////////////////////////////////////////////////////
// Change the red color value based on the data entered
//////////////////////////////////////////////////////////////////////

int	li_new_value


if IsNumber (this.text) then
	li_new_value = Integer (this.text)
	if li_new_value < 0 or li_new_value > 255 then
		this.text = String (ii_r)
	else
		ii_r = li_new_value
		r_1.fillcolor = RGB (ii_r, ii_g, ii_b)
		parent.TriggerEvent ("color_changed")
	end if
else
	this.text = String (ii_r)
end if


end event

type r_1 from rectangle within u_color_selection
long linecolor = 1090519039
integer linethickness = 4
long fillcolor = 16777215
integer x = 224
integer y = 24
integer width = 274
integer height = 76
end type

