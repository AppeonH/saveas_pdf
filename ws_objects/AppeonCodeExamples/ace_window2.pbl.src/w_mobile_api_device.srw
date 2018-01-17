$PBExportHeader$w_mobile_api_device.srw
forward
global type w_mobile_api_device from window
end type
type st_desc from statictext within w_mobile_api_device
end type
type cb_3 from commandbutton within w_mobile_api_device
end type
type cb_4 from commandbutton within w_mobile_api_device
end type
type lb_1 from listbox within w_mobile_api_device
end type
type lb_2 from listbox within w_mobile_api_device
end type
type cb_5 from commandbutton within w_mobile_api_device
end type
type gb_1 from groupbox within w_mobile_api_device
end type
type gb_4 from groupbox within w_mobile_api_device
end type
end forward

global type w_mobile_api_device from window
integer width = 3273
integer height = 2276
boolean titlebar = true
string title = "Device API"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_desc st_desc
cb_3 cb_3
cb_4 cb_4
lb_1 lb_1
lb_2 lb_2
cb_5 cb_5
gb_1 gb_1
gb_4 gb_4
end type
global w_mobile_api_device w_mobile_api_device

type variables
eon_mobile_deviceex inv_mobile
end variables

on w_mobile_api_device.create
this.st_desc=create st_desc
this.cb_3=create cb_3
this.cb_4=create cb_4
this.lb_1=create lb_1
this.lb_2=create lb_2
this.cb_5=create cb_5
this.gb_1=create gb_1
this.gb_4=create gb_4
this.Control[]={this.st_desc,&
this.cb_3,&
this.cb_4,&
this.lb_1,&
this.lb_2,&
this.cb_5,&
this.gb_1,&
this.gb_4}
end on

on w_mobile_api_device.destroy
destroy(this.st_desc)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.lb_1)
destroy(this.lb_2)
destroy(this.cb_5)
destroy(this.gb_1)
destroy(this.gb_4)
end on

event open;//====================================================================
// Event: Open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_Open]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/05/23
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

X = 0
Y = 0
inv_mobile = create eon_mobile_deviceex
end event

event close;destroy inv_mobile
end event

type st_desc from statictext within w_mobile_api_device
integer x = 55
integer y = 2052
integer width = 2103
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_mobile_api_device
integer x = 2533
integer y = 2044
integer width = 325
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
end type

event clicked;lb_2.reset()
end event

type cb_4 from commandbutton within w_mobile_api_device
integer x = 2880
integer y = 2044
integer width = 325
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close(parent)
end event

type lb_1 from listbox within w_mobile_api_device
integer x = 96
integer y = 88
integer width = 1143
integer height = 1892
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
string item[] = {"of_getdeviceid","of_getdevicetype","of_getresolution","of_getplatform","of_getorientation","of_getosversion","of_getdpi","of_getppi","of_getname","of_getfreememory","of_gettotalmemory","of_getstatusbarvisible"}
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;cb_5.event clicked()
end event

event selectionchanged;string ls_desc
choose case  index
	case 1
		ls_desc = "Gets the device's unique identifier."
		
	case 2
		ls_desc = "Gets the device type from the manufacturer."
		
	case 3
		ls_desc = "Gets the device's resolution."
		
	case	4
		ls_desc = "Gets the device's OS name."
		
   case 5
		ls_desc = "Detects if the device screen orientation is Landscape or Portrait."
		
	case 6	
		ls_desc = "Gets the OS version."
	case 7
		ls_desc = "Gets the device DPI value."
	
	case 8
		ls_desc = "Gets the device PPI value."
	
	case 9
		ls_desc = "Gets the device's machine name."
		
	case 10
		ls_desc = "Gets the total number (in KB) of the device's current available free memory."
		
	case 11
		ls_desc = "Gets the total number (in KB) of the device memory."
		
end choose

st_desc.text = ls_desc
end event

type lb_2 from listbox within w_mobile_api_device
integer x = 1371
integer y = 88
integer width = 1787
integer height = 1892
integer taborder = 10
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

type cb_5 from commandbutton within w_mobile_api_device
integer x = 2185
integer y = 2044
integer width = 325
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 700
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
// Author: 	Appeon		Date: 2013/01/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string ls_return, ls_value
integer li_return, li_width,li_height
long  ll_return


if lb_1.SelectedIndex() < 0 then
	messagebox('Warning','Please select testing function.')
	return
end if

ls_return=lb_1.selecteditem()
ls_return +="="

choose case  lb_1.SelectedIndex()
	case 1
		li_return = inv_mobile.of_getdeviceid(ls_value)
		ls_return+= string(li_return)
		if li_return  = 1 then
			ls_return += ", "+ ls_value
		end if
		
	case 2
		li_return =inv_mobile.of_getdevicetype(ls_value)
		ls_return+= string(li_return)
		if li_return  = 1 then
			ls_return += ", "+ ls_value
		end if
		
	case 3
		li_return =inv_mobile.of_getresolution(li_width,li_height)
		ls_return+= string(li_return)
		if li_return  = 1 then
			ls_return +=  ", ("+ string(li_width)+","+ string(li_height)+")"
		end if
		
	case	4
		li_return =inv_mobile.of_getplatform(ls_value)
		ls_return+= string(li_return)
		if li_return  = 1 then
			ls_return += ", "+ ls_value
		end if
		
   case 5
		li_return =inv_mobile.of_getorientation()
		ls_return += string(li_return)
		
		
	case 6	
		li_return =inv_mobile.of_getosversion(ls_value)
		ls_return += string(li_return)
		if li_return  = 1 then
			ls_return += ", "+ ls_value
		end if
		
	case 7
		li_return = inv_mobile.of_getdpi()
		ls_return += string(li_return)
	
	case 8
		li_return = inv_mobile.of_getppi()
		ls_return += string(li_return)
	
	case 9
		li_return =inv_mobile.of_getname(ls_value)
		ls_return += string(li_return)
		if li_return  = 1 then
			ls_return += ", "+ ls_value
		end if
		
	case 10
		ll_return = inv_mobile.of_getfreememory()
		ls_return += string(ll_return)
		
	case 11
		ll_return = inv_mobile.of_gettotalmemory()
		ls_return += string(ll_return)
	case 12
		ll_return = inv_mobile.of_getstatusbarvisible()
		ls_return += string(ll_return)
		
end choose

ls_return = string(lb_2.totalitems()+1) + '.' + ls_return
lb_2.additem(ls_return)
end event

type gb_1 from groupbox within w_mobile_api_device
integer x = 55
integer y = 16
integer width = 1230
integer height = 2004
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Function "
end type

type gb_4 from groupbox within w_mobile_api_device
integer x = 1326
integer y = 16
integer width = 1879
integer height = 2004
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Result"
end type

