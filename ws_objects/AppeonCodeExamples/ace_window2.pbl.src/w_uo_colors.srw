﻿$PBExportHeader$w_uo_colors.srw
$PBExportComments$UO:  Shows 2 color-changer UOs
forward
global type w_uo_colors from window
end type
type st_2 from statictext within w_uo_colors
end type
type st_1 from statictext within w_uo_colors
end type
type cb_cancel from commandbutton within w_uo_colors
end type
type uo_back_color from u_color_selection within w_uo_colors
end type
type uo_label_color from u_color_selection within w_uo_colors
end type
type gb_2 from groupbox within w_uo_colors
end type
type gb_1 from groupbox within w_uo_colors
end type
end forward

global type w_uo_colors from window
integer x = 64
integer y = 480
integer width = 2126
integer height = 1012
boolean titlebar = true
string title = "User Objects for Changing Colors"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_2 st_2
st_1 st_1
cb_cancel cb_cancel
uo_back_color uo_back_color
uo_label_color uo_label_color
gb_2 gb_2
gb_1 gb_1
end type
global w_uo_colors w_uo_colors

type prototypes

end prototypes

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

dec {2} pct_complete

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y = 0
//////////////////////////////////////////////////////////////////////
// get the rgb value of the window background color
//////////////////////////////////////////////////////////////////////

long	ll_rgb
int	li_color_window = 5		// enum 'color_window' for window background

// If background has been set to a real color in the window style,
// use 'this.background'. If a special color has been used
// like 'transparent' or 'window', the high order bits in the
// background attribute are used by PowerBuilder. Therefore,
// the backgound attribute doesn't contain a true rgb value. If 'special'
// colors were used, the rgb should be obtained using the
// 'GetSystemColor' SDK function to get the default window background. 

if (this.backcolor < 0 or this.backcolor > RGB (255,255,255)) then
	//ll_rgb = gu_ext_func.uf_GetSysColor (li_color_window)
else
	ll_rgb = this.backcolor
end if

// pass the window background and text colors to the user objects.
// the uf_set_rgb function will set the red, green, and blue values
// on the user objects to the appropriate values for the window 
// background color and text color on this window.
uo_back_color.uf_set_rgb (ll_rgb)
uo_label_color.uf_set_rgb (st_1.TextColor)


end event

on w_uo_colors.create
this.st_2=create st_2
this.st_1=create st_1
this.cb_cancel=create cb_cancel
this.uo_back_color=create uo_back_color
this.uo_label_color=create uo_label_color
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.st_1,&
this.cb_cancel,&
this.uo_back_color,&
this.uo_label_color,&
this.gb_2,&
this.gb_1}
end on

on w_uo_colors.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cancel)
destroy(this.uo_back_color)
destroy(this.uo_label_color)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type st_2 from statictext within w_uo_colors
integer x = 46
integer y = 92
integer width = 2016
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Color can be changed by manually entering in RGB values or by using the buttons."
boolean focusrectangle = false
end type

type st_1 from statictext within w_uo_colors
integer x = 46
integer y = 28
integer width = 2021
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Change the color of the window background and text by utilizing the two user objects below."
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_uo_colors
integer x = 1701
integer y = 784
integer width = 347
integer height = 108
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
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

Close (parent)
end event

type uo_back_color from u_color_selection within w_uo_colors
integer x = 110
integer y = 268
integer width = 727
integer height = 416
integer taborder = 40
boolean border = false
long backcolor = 74481808
end type

event color_changed;//====================================================================
// Event: color_changed()
//--------------------------------------------------------------------
// Description: Change the background color of the window and all controls on the
// window to the rgb values specified by this user object.
//--------------------------------------------------------------------
// Arguments: 
//		value	unsignedlong	wparam		
//		value	long        	lparam		
//--------------------------------------------------------------------
// Returns: long [pbm_custom01]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long	ll_rgb

ll_rgb = this.uf_get_rgb()

parent.st_1.BackColor = ll_rgb
parent.st_2.BackColor = ll_rgb
parent.BackColor = ll_rgb




end event

on uo_back_color.destroy
call u_color_selection::destroy
end on

type uo_label_color from u_color_selection within w_uo_colors
integer x = 1221
integer y = 268
integer width = 727
integer height = 416
integer taborder = 50
boolean border = false
long backcolor = 74481808
end type

event color_changed;//====================================================================
// Event: color_changed()
//--------------------------------------------------------------------
// Description:  Change the text color of the window controls to the rgb values 
// specified by this user object.
//--------------------------------------------------------------------
// Arguments: 
//		value	unsignedlong	wparam		
//		value	long        	lparam		
//--------------------------------------------------------------------
// Returns: long [pbm_custom01]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long	ll_rgb

ll_rgb = this.uf_get_rgb()

parent.st_1.TextColor = ll_rgb
parent.st_2.TextColor = ll_rgb
gb_1.TextColor = ll_rgb
gb_2.TextColor = ll_rgb

end event

on uo_label_color.destroy
call u_color_selection::destroy
end on

type gb_2 from groupbox within w_uo_colors
integer x = 1147
integer y = 196
integer width = 896
integer height = 548
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Text color"
end type

type gb_1 from groupbox within w_uo_colors
integer x = 46
integer y = 196
integer width = 896
integer height = 548
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Window Background color"
end type

