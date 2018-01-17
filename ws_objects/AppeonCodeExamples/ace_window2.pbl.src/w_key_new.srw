$PBExportHeader$w_key_new.srw
$PBExportComments$Hot Keys, Shortcut Keys, Accelerator Keys test
forward
global type w_key_new from window
end type
type st_1 from statictext within w_key_new
end type
type cb_1 from commandbutton within w_key_new
end type
type tab_1 from tab within w_key_new
end type
type tabpage_1 from userobject within tab_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type sle_1 from singlelineedit within tabpage_1
end type
type cb_test from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_3 cb_3
cb_2 cb_2
sle_1 sle_1
cb_test cb_test
end type
type tabpage_2 from userobject within tab_1
end type
type st_13 from statictext within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_13 st_13
end type
type tabpage_3 from userobject within tab_1
end type
type rb_2 from radiobutton within tabpage_3
end type
type st_12 from statictext within tabpage_3
end type
type dw_1 from datawindow within tabpage_3
end type
type tv_1 from treeview within tabpage_3
end type
type st_11 from statictext within tabpage_3
end type
type st_10 from statictext within tabpage_3
end type
type lv_1 from listview within tabpage_3
end type
type plb_1 from picturelistbox within tabpage_3
end type
type st_9 from statictext within tabpage_3
end type
type st_8 from statictext within tabpage_3
end type
type lb_1 from listbox within tabpage_3
end type
type ddplb_1 from dropdownpicturelistbox within tabpage_3
end type
type st_7 from statictext within tabpage_3
end type
type st_6 from statictext within tabpage_3
end type
type ddlb_1 from dropdownlistbox within tabpage_3
end type
type st_4 from statictext within tabpage_3
end type
type mle_1 from multilineedit within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type rb_1 from radiobutton within tabpage_3
end type
type cbx_1 from checkbox within tabpage_3
end type
type st_2 from statictext within tabpage_3
end type
type sle_2 from singlelineedit within tabpage_3
end type
type gb_1 from groupbox within tabpage_3
end type
type em_1 from editmask within tabpage_3
end type
type tabpage_3 from userobject within tab_1
rb_2 rb_2
st_12 st_12
dw_1 dw_1
tv_1 tv_1
st_11 st_11
st_10 st_10
lv_1 lv_1
plb_1 plb_1
st_9 st_9
st_8 st_8
lb_1 lb_1
ddplb_1 ddplb_1
st_7 st_7
st_6 st_6
ddlb_1 ddlb_1
st_4 st_4
mle_1 mle_1
st_3 st_3
rb_1 rb_1
cbx_1 cbx_1
st_2 st_2
sle_2 sle_2
gb_1 gb_1
em_1 em_1
end type
type tabpage_4 from userobject within tab_1
end type
type mle_2 from multilineedit within tabpage_4
end type
type lb_items from listbox within tabpage_4
end type
type gb_2 from groupbox within tabpage_4
end type
type gb_3 from groupbox within tabpage_4
end type
type tabpage_4 from userobject within tab_1
mle_2 mle_2
lb_items lb_items
gb_2 gb_2
gb_3 gb_3
end type
type tab_1 from tab within w_key_new
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
end forward

global type w_key_new from window
integer width = 2386
integer height = 1580
boolean titlebar = true
string title = "Key Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_1 cb_1
tab_1 tab_1
end type
global w_key_new w_key_new

forward prototypes
public subroutine wf_init_items ()
end prototypes

public subroutine wf_init_items ();tab_1.tabpage_4.lb_items.reset()
//script below  use to add test item into listbox control
tab_1.tabpage_4.lb_items.additem("P001: Key Esc")
tab_1.tabpage_4.lb_items.additem("P002: Key F1")
tab_1.tabpage_4.lb_items.additem("P003: Key F2")
tab_1.tabpage_4.lb_items.additem("P004: Key F3")
tab_1.tabpage_4.lb_items.additem("P005: Key F4")
tab_1.tabpage_4.lb_items.additem("P006: Key F5")
tab_1.tabpage_4.lb_items.additem("P007: Key F6")
tab_1.tabpage_4.lb_items.additem("P008: Key F7")
tab_1.tabpage_4.lb_items.additem("P009: Key F8")
tab_1.tabpage_4.lb_items.additem("P010: Key F9")
//tab_1.tabpage_4.lb_items.additem("P011: Key F10")
tab_1.tabpage_4.lb_items.additem("P012: Key F11")
tab_1.tabpage_4.lb_items.additem("P013: Key F12")
/*************************************************/
tab_1.tabpage_4.lb_items.additem("P014: Key `")
tab_1.tabpage_4.lb_items.additem("P015: Key 1")
tab_1.tabpage_4.lb_items.additem("P016: Key 2")
tab_1.tabpage_4.lb_items.additem("P017: Key 3")
tab_1.tabpage_4.lb_items.additem("P018: Key 4")
tab_1.tabpage_4.lb_items.additem("P019: Key 5")
tab_1.tabpage_4.lb_items.additem("P010: Key 6")
tab_1.tabpage_4.lb_items.additem("P021: Key 7")
tab_1.tabpage_4.lb_items.additem("P022: Key 8")
tab_1.tabpage_4.lb_items.additem("P023: Key 9")
tab_1.tabpage_4.lb_items.additem("P024: Key 0")
tab_1.tabpage_4.lb_items.additem("P025: Key -")
tab_1.tabpage_4.lb_items.additem("P026: Key =")
tab_1.tabpage_4.lb_items.additem("P027: Key \")
tab_1.tabpage_4.lb_items.additem("P028: Key BackSpace")
//tab_1.tabpage_4.lb_items.additem("P029: Key Tab")
tab_1.tabpage_4.lb_items.additem("P030: Key q")
tab_1.tabpage_4.lb_items.additem("P031: Key w")
tab_1.tabpage_4.lb_items.additem("P032: Key e")
tab_1.tabpage_4.lb_items.additem("P033: Key r")
tab_1.tabpage_4.lb_items.additem("P034: Key t")
tab_1.tabpage_4.lb_items.additem("P035: Key y")
tab_1.tabpage_4.lb_items.additem("P036: Key u")
tab_1.tabpage_4.lb_items.additem("P037: Key i")
tab_1.tabpage_4.lb_items.additem("P038: Key o")
tab_1.tabpage_4.lb_items.additem("P039: Key p")
tab_1.tabpage_4.lb_items.additem("P040: Key [")
tab_1.tabpage_4.lb_items.additem("P041: Key ]")
tab_1.tabpage_4.lb_items.additem("P042: Key Enter")
tab_1.tabpage_4.lb_items.additem("P043: Key Caps Lock")
tab_1.tabpage_4.lb_items.additem("P044: Key a")
tab_1.tabpage_4.lb_items.additem("P045: Key s")
tab_1.tabpage_4.lb_items.additem("P046: Key d")
tab_1.tabpage_4.lb_items.additem("P047: Key f")
tab_1.tabpage_4.lb_items.additem("P048: Key g")
tab_1.tabpage_4.lb_items.additem("P049: Key h")
tab_1.tabpage_4.lb_items.additem("P050: Key j")
tab_1.tabpage_4.lb_items.additem("P051: Key k")
tab_1.tabpage_4.lb_items.additem("P052: Key l")
tab_1.tabpage_4.lb_items.additem("P053: Key ;")
tab_1.tabpage_4.lb_items.additem("P054: Key '")
tab_1.tabpage_4.lb_items.additem("P055: Key Shift")
tab_1.tabpage_4.lb_items.additem("P056: Key Z")
tab_1.tabpage_4.lb_items.additem("P057: Key X")
tab_1.tabpage_4.lb_items.additem("P058: Key C")
tab_1.tabpage_4.lb_items.additem("P059: Key V")
tab_1.tabpage_4.lb_items.additem("P060: Key B")
tab_1.tabpage_4.lb_items.additem("P061: Key N")
tab_1.tabpage_4.lb_items.additem("P062: Key M")
tab_1.tabpage_4.lb_items.additem("P063: Key ,")
tab_1.tabpage_4.lb_items.additem("P064: Key .")
tab_1.tabpage_4.lb_items.additem("P065: Key /")
tab_1.tabpage_4.lb_items.additem("P066: Key Ctrl")
//tab_1.tabpage_4.lb_items.additem("P067: Key Alt")
tab_1.tabpage_4.lb_items.additem("P068: Key SpaceBar")
/*************************************************/
tab_1.tabpage_4.lb_items.additem("P069: Key ScrollLock")
tab_1.tabpage_4.lb_items.additem("P070: Key Pause Break")
tab_1.tabpage_4.lb_items.additem("P071: Key Insert")
tab_1.tabpage_4.lb_items.additem("P072: Key Home")
tab_1.tabpage_4.lb_items.additem("P073: Key Page Up")
tab_1.tabpage_4.lb_items.additem("P074: Key Delete")
tab_1.tabpage_4.lb_items.additem("P075: Key End")
tab_1.tabpage_4.lb_items.additem("P076: Key Page Down")
tab_1.tabpage_4.lb_items.additem("P077: Key LeftArrow")
tab_1.tabpage_4.lb_items.additem("P078: Key UpArrow")
tab_1.tabpage_4.lb_items.additem("P079: Key RightArrow")
tab_1.tabpage_4.lb_items.additem("P080: Key DownArrow")
/*************************************************/
//Below on numeric keypad
tab_1.tabpage_4.lb_items.additem("P081: Key KeyNumLock on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P082: Key Divide / on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P083: Key Multiply * on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P084: Key Subtract - on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P085: Key Add + on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P086: Key Decimal . on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P087: Key 1 on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P088: Key 2 on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P089: Key 3 on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P090: Key 4 on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P091: Key 5 on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P092: Key 6 on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P093: Key 7 on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P094: Key 8 on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P095: Key 9 on numeric keypad")
tab_1.tabpage_4.lb_items.additem("P096: Key 0 on numeric keypad")

end subroutine

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Open script for w_sort_and_filter
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

//This window will load a datawindow and perform various functions on it.
//The Sort and Filter Column DDLB's are dynamically loaded from the current datawindow
this.x = 0
this.y = 0

Wf_Init_Items()
end event

on w_key_new.create
this.st_1=create st_1
this.cb_1=create cb_1
this.tab_1=create tab_1
this.Control[]={this.st_1,&
this.cb_1,&
this.tab_1}
end on

on w_key_new.destroy
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.tab_1)
end on

type st_1 from statictext within w_key_new
integer x = 27
integer y = 24
integer width = 1641
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test hot keys, shortcut keys, accelerator keys, and the KeyDown function."
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_key_new
integer x = 1970
integer y = 60
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close(Parent)
end event

type tab_1 from tab within w_key_new
integer x = 32
integer y = 176
integer width = 2281
integer height = 1268
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

event selectionchanged;ListViewItem llvi_Item

choose case NewIndex
	case 3
		tab_1.tabpage_3.lv_1.GetItem(1,llvi_Item)
		llvi_Item.Selected = true
		tab_1.tabpage_3.lv_1.SetItem(1,llvi_Item)
	case 4
		tab_1.tabpage_4.lb_items.setfocus()
end choose
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2245
integer height = 1152
long backcolor = 67108864
string text = "Hot Keys"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_3 cb_3
cb_2 cb_2
sle_1 sle_1
cb_test cb_test
end type

on tabpage_1.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.sle_1=create sle_1
this.cb_test=create cb_test
this.Control[]={this.cb_3,&
this.cb_2,&
this.sle_1,&
this.cb_test}
end on

on tabpage_1.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.sle_1)
destroy(this.cb_test)
end on

type cb_3 from commandbutton within tabpage_1
integer x = 123
integer y = 368
integer width = 882
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Press Escape Key"
boolean cancel = true
end type

event clicked;MessageBox("Hot Key test","You have pressed the escape key!")
parent.SetFocus()
end event

type cb_2 from commandbutton within tabpage_1
integer x = 123
integer y = 236
integer width = 882
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Press Enter Key"
boolean default = true
end type

event clicked;MessageBox("Hot Key test","You have pressed the enter key!")
parent.SetFocus()
end event

type sle_1 from singlelineedit within tabpage_1
integer x = 1029
integer y = 104
integer width = 1111
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_test from commandbutton within tabpage_1
integer x = 123
integer y = 104
integer width = 882
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Test &!"
end type

event clicked;string ls_current

ls_current = RightA(this.text,1)

sle_1.text = "Key '"+ls_current+"' is pressed"

if AscA(ls_current) < 127 then
	this.text = "Please Press &"+CharA(AscA(ls_current)+1)
end if

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2245
integer height = 1152
long backcolor = 67108864
string text = "Shortcut Keys"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_13 st_13
end type

on tabpage_2.create
this.st_13=create st_13
this.Control[]={this.st_13}
end on

on tabpage_2.destroy
destroy(this.st_13)
end on

type st_13 from statictext within tabpage_2
integer x = 101
integer y = 64
integer width = 1339
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example is shown in the system menu, File > Exit (Ctrl+Q)."
boolean focusrectangle = false
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2245
integer height = 1152
long backcolor = 67108864
string text = "Accelerator Keys"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
rb_2 rb_2
st_12 st_12
dw_1 dw_1
tv_1 tv_1
st_11 st_11
st_10 st_10
lv_1 lv_1
plb_1 plb_1
st_9 st_9
st_8 st_8
lb_1 lb_1
ddplb_1 ddplb_1
st_7 st_7
st_6 st_6
ddlb_1 ddlb_1
st_4 st_4
mle_1 mle_1
st_3 st_3
rb_1 rb_1
cbx_1 cbx_1
st_2 st_2
sle_2 sle_2
gb_1 gb_1
em_1 em_1
end type

on tabpage_3.create
this.rb_2=create rb_2
this.st_12=create st_12
this.dw_1=create dw_1
this.tv_1=create tv_1
this.st_11=create st_11
this.st_10=create st_10
this.lv_1=create lv_1
this.plb_1=create plb_1
this.st_9=create st_9
this.st_8=create st_8
this.lb_1=create lb_1
this.ddplb_1=create ddplb_1
this.st_7=create st_7
this.st_6=create st_6
this.ddlb_1=create ddlb_1
this.st_4=create st_4
this.mle_1=create mle_1
this.st_3=create st_3
this.rb_1=create rb_1
this.cbx_1=create cbx_1
this.st_2=create st_2
this.sle_2=create sle_2
this.gb_1=create gb_1
this.em_1=create em_1
this.Control[]={this.rb_2,&
this.st_12,&
this.dw_1,&
this.tv_1,&
this.st_11,&
this.st_10,&
this.lv_1,&
this.plb_1,&
this.st_9,&
this.st_8,&
this.lb_1,&
this.ddplb_1,&
this.st_7,&
this.st_6,&
this.ddlb_1,&
this.st_4,&
this.mle_1,&
this.st_3,&
this.rb_1,&
this.cbx_1,&
this.st_2,&
this.sle_2,&
this.gb_1,&
this.em_1}
end on

on tabpage_3.destroy
destroy(this.rb_2)
destroy(this.st_12)
destroy(this.dw_1)
destroy(this.tv_1)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.lv_1)
destroy(this.plb_1)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.lb_1)
destroy(this.ddplb_1)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.ddlb_1)
destroy(this.st_4)
destroy(this.mle_1)
destroy(this.st_3)
destroy(this.rb_1)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.sle_2)
destroy(this.gb_1)
destroy(this.em_1)
end on

type rb_2 from radiobutton within tabpage_3
integer x = 1883
integer y = 120
integer width = 261
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Other"
end type

type st_12 from statictext within tabpage_3
integer x = 37
integer y = 772
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "DataWindow"
boolean focusrectangle = false
end type

type dw_1 from datawindow within tabpage_3
integer x = 32
integer y = 852
integer width = 1435
integer height = 272
integer taborder = 100
string title = "none"
string dataobject = "d_9k"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;insertrow(0)
insertrow(0)
end event

type tv_1 from treeview within tabpage_3
integer x = 910
integer y = 356
integer width = 411
integer height = 376
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
integer accelerator = 116
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
string picturename[] = {"Custom039!","Cascade!"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event constructor;long ll_Handle

ll_Handle = this.insertitemlast(0,"item1",1)
this.insertitemlast(ll_Handle,"item11",2)
end event

type st_11 from statictext within tabpage_3
integer x = 910
integer y = 280
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "&TreeView:"
boolean focusrectangle = false
end type

type st_10 from statictext within tabpage_3
integer x = 471
integer y = 280
integer width = 229
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "&LsitView:"
boolean focusrectangle = false
end type

type lv_1 from listview within tabpage_3
integer x = 471
integer y = 356
integer width = 411
integer height = 376
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
integer accelerator = 108
borderstyle borderstyle = stylelowered!
listviewview view = listviewsmallicon!
string largepicturename[] = {"",""}
long largepicturemaskcolor = 536870912
string smallpicturename[] = {"ArrangeTables!","ArrangeIcons!"}
long smallpicturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event constructor;this.additem("item1",1)
this.additem("item2",2)
end event

type plb_1 from picturelistbox within tabpage_3
integer x = 1787
integer y = 356
integer width = 411
integer height = 376
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string item[] = {"item1","item2","item3","item4"}
integer accelerator = 112
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2,3,4}
string picturename[] = {"Copy!","ArrangeIcons!","Asterisk!","Compile!"}
long picturemaskcolor = 536870912
end type

type st_9 from statictext within tabpage_3
integer x = 1787
integer y = 280
integer width = 357
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "&PictureListBox:"
boolean focusrectangle = false
end type

type st_8 from statictext within tabpage_3
integer x = 1349
integer y = 280
integer width = 206
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "List&Box:"
boolean focusrectangle = false
end type

type lb_1 from listbox within tabpage_3
integer x = 1349
integer y = 356
integer width = 411
integer height = 376
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string item[] = {"item1","item2","item3","item4"}
integer accelerator = 98
borderstyle borderstyle = stylelowered!
end type

type ddplb_1 from dropdownpicturelistbox within tabpage_3
integer x = 1513
integer y = 860
integer width = 686
integer height = 292
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
integer accelerator = 110
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

type st_7 from statictext within tabpage_3
integer x = 1513
integer y = 772
integer width = 590
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "DropDow&nPictureListBox:"
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_3
integer x = 32
integer y = 48
integer width = 416
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "&DropDownListBox:"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within tabpage_3
integer x = 32
integer y = 124
integer width = 411
integer height = 356
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
integer accelerator = 100
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within tabpage_3
integer x = 32
integer y = 280
integer width = 325
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "&MultiLineEdit:"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within tabpage_3
integer x = 32
integer y = 356
integer width = 411
integer height = 376
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
integer accelerator = 109
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within tabpage_3
integer x = 910
integer y = 48
integer width = 238
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ed&itMasK:"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within tabpage_3
integer x = 1403
integer y = 120
integer width = 366
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "&RadioButton"
end type

type cbx_1 from checkbox within tabpage_3
integer x = 1513
integer y = 1024
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "&CheckBox"
end type

type st_2 from statictext within tabpage_3
integer x = 471
integer y = 48
integer width = 334
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "&SingleLineEdit:"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within tabpage_3
integer x = 471
integer y = 124
integer width = 411
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
integer accelerator = 115
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within tabpage_3
integer x = 1358
integer y = 44
integer width = 846
integer height = 184
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "&GroupBox"
end type

type em_1 from editmask within tabpage_3
integer x = 910
integer y = 124
integer width = 411
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
integer accelerator = 105
borderstyle borderstyle = stylelowered!
end type

type tabpage_4 from userobject within tab_1
event key pbm_keydown
integer x = 18
integer y = 100
integer width = 2245
integer height = 1152
long backcolor = 67108864
string text = "KeyDown Function"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
mle_2 mle_2
lb_items lb_items
gb_2 gb_2
gb_3 gb_3
end type

event key;
Choose Case KeyDown(key)
	/*****************************************************/
	Case KeyDown(KeyEscape!)
		mle_2.text = 'P001: Key Esc is keydown'
	Case KeyDown(KeyF1!)
		mle_2.text = 'P002: Key F1 is keydown'
	Case KeyDown(KeyF2!)
		mle_2.text = 'P003: Key F2 is keydown'
	Case KeyDown(KeyF3!)
		mle_2.text = 'P004: Key F3 is keydown'
	Case KeyDown(KeyF4!)
		mle_2.text = 'P005: Key F4 is keydown'
	Case KeyDown(KeyF5!)	
		mle_2.text = 'P006: Key F5 is keydown'
	Case KeyDown(KeyF6!)
		mle_2.text = 'P007: Key F6 is keydown'
	Case KeyDown(KeyF7!)
		mle_2.text = 'P008: Key F7 is keydown'
	Case KeyDown(KeyF8!)
		mle_2.text = 'P009: Key F8 is keydown'
	Case KeyDown(KeyF9!)
		mle_2.text = 'P010: Key F9 is keydown'
	Case KeyDown(KeyF10!)
		mle_2.text = 'P011: Key F10 is keydown'
	Case KeyDown(KeyF11!)
		mle_2.text = 'P012: Key F11 is keydown'
	Case KeyDown(KeyF12!)
		mle_2.text = 'P013: Key F12 is keydown'
	/*****************************************************/
	
	Case KeyDown(KeyBackQuote!)
		mle_2.text = 'P014: Key ` is keydown'
	Case KeyDown(Key1!)
		mle_2.text = 'P015: Key 1 is keydown'
	Case KeyDown(Key2!)
		mle_2.text = 'P016: Key 2 is keydown'
	Case KeyDown(Key3!)
		mle_2.text = 'P017: Key 3 is keydown'
	Case KeyDown(Key4!)
		mle_2.text = 'P018: Key 4 is keydown'
	Case KeyDown(Key5!)
		mle_2.text = 'P019: Key 5 is keydown'
	Case KeyDown(Key6!)
		mle_2.text = 'P020: Key 6 is keydown'
	Case KeyDown(Key7!)
		mle_2.text = 'P021: Key 7 is keydown'
	Case KeyDown(Key8!)
		mle_2.text = 'P022: Key 8 is keydown'
	Case KeyDown(Key9!)
		mle_2.text = 'P023: Key 9 is keydown'
	Case KeyDown(Key0!)
		mle_2.text = 'P024: Key 0 is keydown'
	Case KeyDown(KeyDash!)
		mle_2.text = 'P025: Key - is keydown'
	Case KeyDown(KeyEqual!)
		mle_2.text = 'P026: Key = is keydown'
	Case KeyDown(KeyBackSlash!)
		mle_2.text = 'P027: Key \ is keydown'
	Case KeyDown(KeyBack!)
		mle_2.text = 'P028: Key BackSpace is keydown'
	Case KeyDown(KeyTab!)
		mle_2.text = 'P029: Key Tab is keydown'
	Case KeyDown(KeyQ!) and KeyDown(81)
		mle_2.text = 'P030: Key Q is keydown'
	Case KeyDown(KeyW!) and KeyDown(87)
		mle_2.text = 'P031: Key W is keydown'
	Case KeyDown(KeyE!) and KeyDown(69)
		mle_2.text = 'P032: Key E is keydown'
	Case KeyDown(KeyR!) and KeyDown(82)
		mle_2.text = 'P033: Key R is keydown'
	Case KeyDown(KeyT!) and KeyDown(84)
		mle_2.text = 'P034: Key T is keydown'
	Case KeyDown(KeyY!) and KeyDown(89)
		mle_2.text = 'P035: Key Y is keydown'
	Case KeyDown(KeyU!) and KeyDown(85)
		mle_2.text = 'P036: Key U is keydown'
	Case KeyDown(KeyI!) and KeyDown(73)
		mle_2.text = 'P037: Key I is keydown'
	Case KeyDown(KeyO!) and KeyDown(79)
		mle_2.text = 'P038: Key O is keydown'
	Case KeyDown(KeyP!) and KeyDown(80)
		mle_2.text = 'P039: Key P is keydown'
	Case KeyDown(KeyLeftBracket!)
		mle_2.text = 'P040: Key [ is keydown'
	Case KeyDown(KeyRightBracket!)
		mle_2.text = 'P041: Key ] is keydown'
	Case KeyDown(KeyEnter!)
		mle_2.text = 'P042: Key Enter is keydown'
	Case KeyDown(KeyCapsLock!)
		mle_2.text = 'P043: Key Caps Lock is keydown'
	Case KeyDown(keyA!) and KeyDown(65)
		mle_2.text = 'P044: Key A is keydown'
	Case KeyDown(keyS!) and KeyDown(83)
		mle_2.text = 'P045: Key S is keydown'
	Case KeyDown(keyD!) and KeyDown(68)
		mle_2.text = 'P046: Key D is keydown'
	Case KeyDown(keyF!) and KeyDown(70)
		mle_2.text = 'P047: Key F is keydown'
	Case KeyDown(keyG!) and KeyDown(71)
		mle_2.text = 'P048: Key G is keydown'
	Case KeyDown(keyH!) and KeyDown(72)
		mle_2.text = 'P049: Key H is keydown'
	Case KeyDown(keyJ!) and KeyDown(74)
		mle_2.text = 'P050: Key J is keydown'
	Case KeyDown(keyK!) and KeyDown(75)
		mle_2.text = 'P051: Key K is keydown'
	Case KeyDown(keyL!) and KeyDown(76)
		mle_2.text = 'P052: Key L is keydown'
	Case KeyDown(KeySemiColon!)
		mle_2.text = 'P053: Key ; is keydown'
	Case KeyDown(KeyQuote!)
		mle_2.text = 'P054: Key ~' is keydown'
	Case KeyDown(KeyShift!)
		mle_2.text = 'P055: Key Shift is keydown'
	Case KeyDown(keyZ!) and KeyDown(90)
		mle_2.text = 'P056: Key Z is keydown'
	Case KeyDown(keyX!) and KeyDown(88)
		mle_2.text = 'P057: Key X is keydown'
	Case KeyDown(keyC!) and KeyDown(67)
		mle_2.text = 'P058: Key C is keydown'
	Case KeyDown(keyV!) and KeyDown(86)
		mle_2.text = 'P059: Key V is keydown'
	Case KeyDown(keyB!) and KeyDown(66)
		mle_2.text = 'P060: Key B is keydown'
	Case KeyDown(keyN!) and KeyDown(78)
		mle_2.text = 'P061: Key N is keydown'
	Case KeyDown(keyM!) and KeyDown(77)
		mle_2.text = 'P062: Key M is keydown'
	Case KeyDown(KeyComma!)
		mle_2.text = 'P063: Key , is keydown'
	Case KeyDown(KeyPeriod!)
		mle_2.text = 'P064: Key . is keydown'
	Case KeyDown(KeySlash!)
		mle_2.text = 'P065: Key / is keydown'
	Case KeyDown(KeyControl!)
		mle_2.text = 'P066: Key Ctrl is keydown'
	Case KeyDown(KeyAlt!)
		mle_2.text = 'P067: Key Alt is keydown'
	Case KeyDown(KeySpaceBar!)
		mle_2.text = 'P068: Key SpaceBar is keydown'
		
	/***********************************************************/
	Case KeyDown(KeyScrollLock!)
		mle_2.text = 'P069: Key ScrollLock is keydown'
	Case KeyDown(KeyPause!)
		mle_2.text = 'P070: Key Pause is keydown'
	Case KeyDown(KeyInsert!)
		mle_2.text = 'P071: Key Insert is keydown'
	Case KeyDown(KeyHome!)
		mle_2.text = 'P072: Key Home is keydown'
	Case KeyDown(KeyPageUp!)
		mle_2.text = 'P073: Key PageUp is keydown'
	Case KeyDown(KeyDelete!)
		mle_2.text = 'P074: Key Delete is keydown'
	Case KeyDown(KeyEnd!)
		mle_2.text = 'P075: Key End is keydown'
	Case KeyDown(KeyPageDown!)
		mle_2.text = 'P076: Key PageDown is keydown'
	Case KeyDown(KeyLeftArrow!)
		mle_2.text = 'P077: Key LeftArrow is keydown'
	Case KeyDown(KeyUpArrow!)
		mle_2.text = 'P078: Key UpArrow is keydown'
	Case KeyDown(KeyRightArrow!)
		mle_2.text = 'P079: Key RightArrow is keydown'
	Case KeyDown(KeyDownArrow!)
		mle_2.text = 'P080: Key DownArrow is keydown'
	/***********************************************************/
	//Below on numeric keypad	
	Case KeyDown(KeyNumLock!)
		mle_2.text = 'P081: Key NumLock on numeric keypad is keydown'
	Case KeyDown(KeyDivide!)
		mle_2.text = 'P082: Key Divide / on numeric keypad is keydown'
	Case KeyDown(KeyMultiply!)
		mle_2.text = 'P083: Key Multiply * on numeric keypad is keydown'
	Case KeyDown(KeySubtract!)
		mle_2.text = 'P084: Key Subtract - on numeric keypad is keydown'
	Case KeyDown(KeyAdd!)
		mle_2.text = 'P085: Key Add + on numeric keypad is keydown'
	Case KeyDown(KeyDecimal!)
		mle_2.text = 'P086: Key Decimal . on numeric keypad is keydown'
	Case KeyDown(KeyNumpad1!)
		mle_2.text = 'P095: Key 1 on numeric keypad is keydown'
	Case KeyDown(KeyNumpad2!)
		mle_2.text = 'P087: Key 2 on numeric keypad is keydown'
	Case KeyDown(KeyNumpad3!)
		mle_2.text = 'P088: Key 3 on numeric keypad is keydown'
	Case KeyDown(KeyNumpad4!)
		mle_2.text = 'P089: Key 4 on numeric keypad is keydown'
	Case KeyDown(KeyNumpad5!)
		mle_2.text = 'P090: Key 5 on numeric keypad is keydown'
	Case KeyDown(KeyNumpad6!)
		mle_2.text = 'P091: Key 6 on numeric keypad is keydown'
	Case KeyDown(KeyNumpad7!)
		mle_2.text = 'P092: Key 7 on numeric keypad is keydown'
	Case KeyDown(KeyNumpad8!)
		mle_2.text = 'P093: Key 8 on numeric keypad is keydown'
	Case KeyDown(KeyNumpad9!)
		mle_2.text = 'P094: Key 9 on numeric keypad is keydown'
	Case KeyDown(KeyNumpad0!)
		mle_2.text = 'P096: Key 0 on numeric keypad is keydown'
	/*****************************************************************************/
	Case Else
		mle_2.text = 'This key no code'
End Choose
end event

on tabpage_4.create
this.mle_2=create mle_2
this.lb_items=create lb_items
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.mle_2,&
this.lb_items,&
this.gb_2,&
this.gb_3}
end on

on tabpage_4.destroy
destroy(this.mle_2)
destroy(this.lb_items)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type mle_2 from multilineedit within tabpage_4
integer x = 1129
integer y = 60
integer width = 1061
integer height = 1040
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type lb_items from listbox within tabpage_4
integer x = 55
integer y = 60
integer width = 978
integer height = 1044
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within tabpage_4
integer x = 23
integer width = 1047
integer height = 1136
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test Items"
end type

type gb_3 from groupbox within tabpage_4
integer x = 1097
integer width = 1129
integer height = 1136
integer taborder = 20
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

