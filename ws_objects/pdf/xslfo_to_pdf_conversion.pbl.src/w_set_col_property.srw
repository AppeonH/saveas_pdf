$PBExportHeader$w_set_col_property.srw
forward
global type w_set_col_property from window
end type
type cb_ok from commandbutton within w_set_col_property
end type
type st_3 from statictext within w_set_col_property
end type
type ddlb_size from dropdownlistbox within w_set_col_property
end type
type st_2 from statictext within w_set_col_property
end type
type ddlb_border from dropdownlistbox within w_set_col_property
end type
type ddlb_alignment from dropdownlistbox within w_set_col_property
end type
type st_1 from statictext within w_set_col_property
end type
type cbx_strikeout from checkbox within w_set_col_property
end type
type cbx_underline from checkbox within w_set_col_property
end type
type cbx_italic from checkbox within w_set_col_property
end type
type cbx_bold from checkbox within w_set_col_property
end type
type cb_bgcolor from commandbutton within w_set_col_property
end type
type cb_2 from commandbutton within w_set_col_property
end type
type sle_1 from singlelineedit within w_set_col_property
end type
type lb_font from listbox within w_set_col_property
end type
type cb_txtcolor from commandbutton within w_set_col_property
end type
type gb_1 from groupbox within w_set_col_property
end type
type r_txtcolorchoose from rectangle within w_set_col_property
end type
type r_bgcolorchoose from rectangle within w_set_col_property
end type
end forward

global type w_set_col_property from window
integer width = 2126
integer height = 1372
boolean titlebar = true
string title = "Select Property"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_ok cb_ok
st_3 st_3
ddlb_size ddlb_size
st_2 st_2
ddlb_border ddlb_border
ddlb_alignment ddlb_alignment
st_1 st_1
cbx_strikeout cbx_strikeout
cbx_underline cbx_underline
cbx_italic cbx_italic
cbx_bold cbx_bold
cb_bgcolor cb_bgcolor
cb_2 cb_2
sle_1 sle_1
lb_font lb_font
cb_txtcolor cb_txtcolor
gb_1 gb_1
r_txtcolorchoose r_txtcolorchoose
r_bgcolorchoose r_bgcolorchoose
end type
global w_set_col_property w_set_col_property

on w_set_col_property.create
this.cb_ok=create cb_ok
this.st_3=create st_3
this.ddlb_size=create ddlb_size
this.st_2=create st_2
this.ddlb_border=create ddlb_border
this.ddlb_alignment=create ddlb_alignment
this.st_1=create st_1
this.cbx_strikeout=create cbx_strikeout
this.cbx_underline=create cbx_underline
this.cbx_italic=create cbx_italic
this.cbx_bold=create cbx_bold
this.cb_bgcolor=create cb_bgcolor
this.cb_2=create cb_2
this.sle_1=create sle_1
this.lb_font=create lb_font
this.cb_txtcolor=create cb_txtcolor
this.gb_1=create gb_1
this.r_txtcolorchoose=create r_txtcolorchoose
this.r_bgcolorchoose=create r_bgcolorchoose
this.Control[]={this.cb_ok,&
this.st_3,&
this.ddlb_size,&
this.st_2,&
this.ddlb_border,&
this.ddlb_alignment,&
this.st_1,&
this.cbx_strikeout,&
this.cbx_underline,&
this.cbx_italic,&
this.cbx_bold,&
this.cb_bgcolor,&
this.cb_2,&
this.sle_1,&
this.lb_font,&
this.cb_txtcolor,&
this.gb_1,&
this.r_txtcolorchoose,&
this.r_bgcolorchoose}
end on

on w_set_col_property.destroy
destroy(this.cb_ok)
destroy(this.st_3)
destroy(this.ddlb_size)
destroy(this.st_2)
destroy(this.ddlb_border)
destroy(this.ddlb_alignment)
destroy(this.st_1)
destroy(this.cbx_strikeout)
destroy(this.cbx_underline)
destroy(this.cbx_italic)
destroy(this.cbx_bold)
destroy(this.cb_bgcolor)
destroy(this.cb_2)
destroy(this.sle_1)
destroy(this.lb_font)
destroy(this.cb_txtcolor)
destroy(this.gb_1)
destroy(this.r_txtcolorchoose)
destroy(this.r_bgcolorchoose)
end on

event open;string sarray[], s
boolean b
long l1,l2, i, k,n
str_colproperties str_colprop

str_colprop = Message.PowerObjectParm

//HKEY_LOCAL_MACHINE\SOFTWARE\Mircrosoft\Windows NT\CurrentVersion\Fonts
l1 = RegistryValues("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts",sarray)
l1 = upperbound(sarray)
for i = 1 to l1
	
	if match(sarray[i], 'VGA') then
		k = Pos(sarray[i], '(')
		s = Trim(Left(sarray[i], k - 1))
		//messagebox("",s)
		k = LastPos(s,' ')
		s = Trim(Left(s, k - 1))
	else
		k = Pos(sarray[i], '(')
		s = Trim(Left(sarray[i], k - 1))
	end if
	l2 = lb_font.TotalItems()
	b = false
	for n = 1 to l2
		if s = lb_font.Text(n) then
			b = true
		end if
	next
	if not b then
		lb_font.AddItem(s)
	end if
next

r_txtcolorchoose.fillcolor = long(str_colprop.txtcolor)
r_bgcolorchoose.fillcolor = long(str_colprop.bgcolor)

CHOOSE CASE long(str_colprop.alignment)
CASE 0
	ddlb_alignment.selectitem(1)
CASE 1
	ddlb_alignment.selectitem(2)
CASE 2
	ddlb_alignment.selectitem(3)
CASE 3
	ddlb_alignment.selectitem(4)
END CHOOSE

CHOOSE CASE long(str_colprop.border)
CASE 0
	ddlb_border.selectitem(1)
CASE 1
	ddlb_border.selectitem(2)
CASE 2
	ddlb_border.selectitem(3)
CASE 3
	ddlb_border.selectitem(4)
CASE 4
	ddlb_border.selectitem(5)
CASE 5
	ddlb_border.selectitem(6)
CASE 6
	ddlb_border.selectitem(7)
END CHOOSE
lb_font.selectitem(str_colprop.font,0)
if long(str_colprop.bold) = 700 then
	cbx_bold.checked = true
else
	cbx_bold.checked = false
end if
if long(str_colprop.italic) = 1 then
	cbx_italic.checked = true
else
	cbx_italic.checked = false
end if
if long(str_colprop.underline) = 1 then
	cbx_underline.checked = true
else
	cbx_underline.checked = false
end if
if long(str_colprop.strikeout) = 1 then
	cbx_strikeout.checked = true
else
	cbx_strikeout.checked = false
end if

CHOOSE CASE long(str_colprop.size)
CASE -8
	ddlb_size.selectitem(1)
CASE -10
	ddlb_size.selectitem(2)
CASE -12
	ddlb_size.selectitem(3)
CASE -14
	ddlb_size.selectitem(4)
CASE -18
	ddlb_size.selectitem(5)
CASE -24
	ddlb_size.selectitem(6)
END CHOOSE


end event

type cb_ok from commandbutton within w_set_col_property
integer x = 914
integer y = 1152
integer width = 183
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;str_colproperties str_colpropreturn

str_colpropreturn.txtcolor = string(r_txtcolorchoose.fillcolor)
str_colpropreturn.bgcolor = string(r_bgcolorchoose.fillcolor)

CHOOSE CASE long(ddlb_alignment.Finditem(ddlb_alignment.Text,0))
CASE 1
	str_colpropreturn.alignment = string(0)
CASE 2
	str_colpropreturn.alignment = string(1)
CASE 3
	str_colpropreturn.alignment = string(2)
CASE 4
	str_colpropreturn.alignment = string(3)
END CHOOSE

CHOOSE CASE long(ddlb_border.Finditem(ddlb_border.Text,0))
CASE 1
	str_colpropreturn.border = string(0)
CASE 2
	str_colpropreturn.border = string(1)
CASE 3
	str_colpropreturn.border = string(2)
CASE 4
	str_colpropreturn.border = string(3)
CASE 5
	str_colpropreturn.border = string(4)
CASE 6
	str_colpropreturn.border = string(5)
CASE 7
	str_colpropreturn.border = string(6)
END CHOOSE

str_colpropreturn.font = lb_font.SelectedItem()

if cbx_bold.checked then
	str_colpropreturn.bold = string(700)
else
	str_colpropreturn.bold = string(400)
end if
if cbx_italic.checked then
	str_colpropreturn.italic = string(1)
else
	str_colpropreturn.italic = string(0)
end if
if cbx_underline.checked then
	str_colpropreturn.underline = string(1)
else
	str_colpropreturn.underline = string(0)
end if
if cbx_strikeout.checked then
	str_colpropreturn.strikeout = string(1)
else
	str_colpropreturn.strikeout = string(0)
end if

CHOOSE CASE long(ddlb_size.Finditem(ddlb_size.Text,0))
CASE 1
	str_colpropreturn.size = string(-8)
CASE 2
	str_colpropreturn.size = string(-10)
CASE 3
	str_colpropreturn.size = string(-12)
CASE 4
	str_colpropreturn.size = string(-14)
CASE 5
	str_colpropreturn.size = string(-18)
CASE 6
	str_colpropreturn.size = string(-24)
END CHOOSE

CloseWithReturn(w_set_col_property,str_colpropreturn)
end event

type st_3 from statictext within w_set_col_property
integer x = 1243
integer y = 864
integer width = 297
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Size"
boolean focusrectangle = false
end type

type ddlb_size from dropdownlistbox within w_set_col_property
integer x = 1243
integer y = 928
integer width = 622
integer height = 384
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"8","10","12","14","18","24"}
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_set_col_property
integer x = 1033
integer y = 180
integer width = 297
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Border"
boolean focusrectangle = false
end type

type ddlb_border from dropdownlistbox within w_set_col_property
integer x = 1024
integer y = 256
integer width = 622
integer height = 416
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"NoBorder (0)","ShadowBox (1)","Box (2)","ResizeBorder (3)","Underline (4)","Lowered (5)","Raised (6)"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_alignment from dropdownlistbox within w_set_col_property
integer x = 37
integer y = 256
integer width = 622
integer height = 384
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Left (0)","Right (1)","Centre (2)","Justify (3)"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_set_col_property
integer x = 37
integer y = 192
integer width = 297
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Alignment"
boolean focusrectangle = false
end type

type cbx_strikeout from checkbox within w_set_col_property
integer x = 1243
integer y = 736
integer width = 517
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Strike Out"
end type

type cbx_underline from checkbox within w_set_col_property
integer x = 1243
integer y = 640
integer width = 517
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Underline"
end type

type cbx_italic from checkbox within w_set_col_property
integer x = 1243
integer y = 544
integer width = 517
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Italic"
end type

type cbx_bold from checkbox within w_set_col_property
integer x = 1243
integer y = 448
integer width = 517
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bold"
end type

type cb_bgcolor from commandbutton within w_set_col_property
integer x = 1024
integer y = 64
integer width = 777
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Choose Background Color"
end type

event clicked;Long ll_selectedColor, ll_return
ll_return = choosecolor(ll_selectedColor)
r_bgcolorchoose.fillcolor = ll_selectedColor
end event

type cb_2 from commandbutton within w_set_col_property
integer x = 37
integer y = 864
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Change Font"
end type

event clicked;string str_font
//sle_1.FontFamily = lb_1.SelectedItem
str_font = lb_font.SelectedItem ( )
sle_1.FaceName = str_font
end event

type sle_1 from singlelineedit within w_set_col_property
integer x = 37
integer y = 992
integer width = 1024
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier New"
long textcolor = 33554432
string text = "Testing Text Font"
borderstyle borderstyle = stylelowered!
end type

type lb_font from listbox within w_set_col_property
integer x = 37
integer y = 448
integer width = 1024
integer height = 384
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_txtcolor from commandbutton within w_set_col_property
integer x = 37
integer y = 64
integer width = 544
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Choose Text Color"
end type

event clicked;Long ll_selectedColor, ll_return
ll_return = choosecolor(ll_selectedColor)
r_txtcolorchoose.fillcolor = ll_selectedColor
end event

type gb_1 from groupbox within w_set_col_property
integer y = 384
integer width = 2085
integer height = 736
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier New"
long textcolor = 33554432
long backcolor = 67108864
end type

type r_txtcolorchoose from rectangle within w_set_col_property
long linecolor = 33554432
linestyle linestyle = dot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 658
integer y = 64
integer width = 183
integer height = 96
end type

type r_bgcolorchoose from rectangle within w_set_col_property
long linecolor = 33554432
linestyle linestyle = dot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1902
integer y = 64
integer width = 183
integer height = 96
end type

