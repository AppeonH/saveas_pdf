$PBExportHeader$w_dw_print_options.srw
$PBExportComments$Print Options Dialog
forward
global type w_dw_print_options from window
end type
type ddlb_range from dropdownlistbox within w_dw_print_options
end type
type st_4 from statictext within w_dw_print_options
end type
type cb_printer from commandbutton within w_dw_print_options
end type
type cb_cancel from commandbutton within w_dw_print_options
end type
type cbx_collate from checkbox within w_dw_print_options
end type
type cbx_print_to_file from checkbox within w_dw_print_options
end type
type st_3 from statictext within w_dw_print_options
end type
type sle_page_range from singlelineedit within w_dw_print_options
end type
type rb_pages from radiobutton within w_dw_print_options
end type
type rb_current_page from radiobutton within w_dw_print_options
end type
type rb_all from radiobutton within w_dw_print_options
end type
type em_copies from editmask within w_dw_print_options
end type
type st_2 from statictext within w_dw_print_options
end type
type sle_printer from singlelineedit within w_dw_print_options
end type
type st_1 from statictext within w_dw_print_options
end type
type cb_ok from commandbutton within w_dw_print_options
end type
type gb_1 from groupbox within w_dw_print_options
end type
end forward

global type w_dw_print_options from window
integer x = 672
integer y = 268
integer width = 1833
integer height = 900
boolean titlebar = true
string title = "Datawindow Print Options"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 78748035
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
ddlb_range ddlb_range
st_4 st_4
cb_printer cb_printer
cb_cancel cb_cancel
cbx_collate cbx_collate
cbx_print_to_file cbx_print_to_file
st_3 st_3
sle_page_range sle_page_range
rb_pages rb_pages
rb_current_page rb_current_page
rb_all rb_all
em_copies em_copies
st_2 st_2
sle_printer sle_printer
st_1 st_1
cb_ok cb_ok
gb_1 gb_1
end type
global w_dw_print_options w_dw_print_options

type variables
string is_page_range
datawindow idw_dw
end variables

forward prototypes
private subroutine wf_page_range (radiobutton who)
end prototypes

private subroutine wf_page_range (radiobutton who);choose case who
	case rb_all
		sle_page_range.text = ''
		sle_page_range.enabled = false
		is_page_range = 'a'
	case rb_current_page
		sle_page_range.text = ''
		sle_page_range.enabled = false
		is_page_range = 'c'
	case rb_pages		
		sle_page_range.enabled = true
		is_page_range = 'p'
end choose
end subroutine

event open;// we assume that this window will be opened using openwitparm and that
// a datawindow control will be passed to it

idw_dw = message.powerobjectparm
sle_printer.text = idw_dw.describe('datawindow.printer')
wf_page_range(rb_all)
end event

on w_dw_print_options.create
this.ddlb_range=create ddlb_range
this.st_4=create st_4
this.cb_printer=create cb_printer
this.cb_cancel=create cb_cancel
this.cbx_collate=create cbx_collate
this.cbx_print_to_file=create cbx_print_to_file
this.st_3=create st_3
this.sle_page_range=create sle_page_range
this.rb_pages=create rb_pages
this.rb_current_page=create rb_current_page
this.rb_all=create rb_all
this.em_copies=create em_copies
this.st_2=create st_2
this.sle_printer=create sle_printer
this.st_1=create st_1
this.cb_ok=create cb_ok
this.gb_1=create gb_1
this.Control[]={this.ddlb_range,&
this.st_4,&
this.cb_printer,&
this.cb_cancel,&
this.cbx_collate,&
this.cbx_print_to_file,&
this.st_3,&
this.sle_page_range,&
this.rb_pages,&
this.rb_current_page,&
this.rb_all,&
this.em_copies,&
this.st_2,&
this.sle_printer,&
this.st_1,&
this.cb_ok,&
this.gb_1}
end on

on w_dw_print_options.destroy
destroy(this.ddlb_range)
destroy(this.st_4)
destroy(this.cb_printer)
destroy(this.cb_cancel)
destroy(this.cbx_collate)
destroy(this.cbx_print_to_file)
destroy(this.st_3)
destroy(this.sle_page_range)
destroy(this.rb_pages)
destroy(this.rb_current_page)
destroy(this.rb_all)
destroy(this.em_copies)
destroy(this.st_2)
destroy(this.sle_printer)
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.gb_1)
end on

type ddlb_range from dropdownlistbox within w_dw_print_options
integer x = 270
integer y = 696
integer width = 1065
integer height = 288
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "All Pages In Range"
boolean sorted = false
string item[] = {"All Pages in Range","Even Numbered Pages","Odd Numbered Pages"}
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_dw_print_options
integer x = 46
integer y = 712
integer width = 174
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "P&rint:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_printer from commandbutton within w_dw_print_options
integer x = 1408
integer y = 304
integer width = 338
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Prin&ter..."
end type

on clicked;printsetup()
sle_printer.text = idw_dw.describe('datawindow.printer')
end on

type cb_cancel from commandbutton within w_dw_print_options
integer x = 1408
integer y = 196
integer width = 338
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

on clicked;closewithreturn(parent,-1)
end on

type cbx_collate from checkbox within w_dw_print_options
integer x = 1390
integer y = 576
integer width = 489
integer height = 68
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Collate Cop&ies"
boolean checked = true
end type

type cbx_print_to_file from checkbox within w_dw_print_options
integer x = 1390
integer y = 484
integer width = 434
integer height = 68
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Print to Fi&le"
end type

type st_3 from statictext within w_dw_print_options
integer x = 105
integer y = 548
integer width = 1184
integer height = 112
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "Enter page numbers and/or page ranges separated by commas. For example, 2,5,8-10"
boolean focusrectangle = false
end type

type sle_page_range from singlelineedit within w_dw_print_options
integer x = 416
integer y = 448
integer width = 882
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type rb_pages from radiobutton within w_dw_print_options
integer x = 146
integer y = 460
integer width = 297
integer height = 68
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Pa&ges:"
end type

on clicked;wf_page_range(this)
end on

type rb_current_page from radiobutton within w_dw_print_options
integer x = 146
integer y = 392
integer width = 462
integer height = 68
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Curr&ent Page"
end type

on clicked;wf_page_range(this)
end on

type rb_all from radiobutton within w_dw_print_options
integer x = 146
integer y = 324
integer width = 242
integer height = 68
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "&All"
boolean checked = true
end type

on clicked;wf_page_range(this)
end on

type em_copies from editmask within w_dw_print_options
integer x = 306
integer y = 148
integer width = 242
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "#####"
end type

type st_2 from statictext within w_dw_print_options
integer x = 64
integer y = 164
integer width = 210
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "Copies:"
boolean focusrectangle = false
end type

type sle_printer from singlelineedit within w_dw_print_options
integer x = 306
integer y = 52
integer width = 864
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
boolean border = false
boolean autohscroll = false
end type

type st_1 from statictext within w_dw_print_options
integer x = 64
integer y = 52
integer width = 210
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "Printer:"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_dw_print_options
integer x = 1408
integer y = 84
integer width = 338
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

event clicked;long ll_row
int li_value
string ls_tmp, ls_command
string ls_docname, ls_named

// determine rangeinclude (all,even,odd)
choose case lower(left(ddlb_range.text,1)) 
	case 'a' // all
		ls_tmp = '0'
	case 'e' // even
		ls_tmp = '1'
	case 'o' //odd
		ls_tmp = '2'
end choose
ls_command = 'datawindow.print.page.rangeinclude = ' + ls_tmp

// collate output ?
if cbx_collate.checked then 
	ls_command = ls_command +  " datawindow.print.collate = yes"
else
	ls_command = ls_command +  " datawindow.print.collate = no"
end if

// did they pick a page range?
choose case is_page_range 
	case 'a'  // all
		ls_tmp = ''
	case 'c' // current page?
		ll_row = idw_dw.getrow()
		ls_tmp = idw_dw.describe("evaluate('page()'," + string(ll_row) + ")")
	case 'p' // a range?
		ls_tmp = sle_page_range.text
end choose		
if len(ls_tmp) > 0 then ls_command = ls_command +  " datawindow.print.page.range = '" + ls_tmp + "'"

// number of copies ?
if len(em_copies.text) > 0 then ls_command = ls_command +  " datawindow.print.copies = " + em_copies.text

if cbx_print_to_file.checked then // print to file ?
	li_value = GetFileSaveName("Print To File", ls_docname, ls_named, "PRN", "Print (*.PRN),*.PRN")
	if li_value = 1 then 
		ls_command = ls_command + " datawindow.print.filename = '" + ls_docname + "'"
	else // they canceled out of the dialog so quit completely
		return
	end if
end if

// now alter the datawindow
ls_tmp = idw_dw.modify(ls_command)
if len(ls_tmp) > 0 then // if error the display the 
	messagebox('Error Setting Print Options','Error message = ' + ls_tmp + '~r~nls_command = ' + ls_command)
	return
end if

closewithreturn(parent, 1)
end event

type gb_1 from groupbox within w_dw_print_options
integer x = 69
integer y = 264
integer width = 1298
integer height = 408
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Page Range"
end type

