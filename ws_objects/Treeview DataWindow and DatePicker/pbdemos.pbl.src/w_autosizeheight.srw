$PBExportHeader$w_autosizeheight.srw
forward
global type w_autosizeheight from w_basesheet
end type
type cb_1 from commandbutton within w_autosizeheight
end type
type cbx_border from checkbox within w_autosizeheight
end type
type cb_dw_back from commandbutton within w_autosizeheight
end type
type rb_func from radiobutton within w_autosizeheight
end type
type rb_dot from radiobutton within w_autosizeheight
end type
type cbx_crossh3 from checkbox within w_autosizeheight
end type
type cbx_crossh2 from checkbox within w_autosizeheight
end type
type cbx_crossh1 from checkbox within w_autosizeheight
end type
type ddlb_dw from dropdownlistbox within w_autosizeheight
end type
type cbx_gtrailer2 from checkbox within w_autosizeheight
end type
type cbx_gheader2 from checkbox within w_autosizeheight
end type
type cbx_gtrailer1 from checkbox within w_autosizeheight
end type
type cbx_gheader1 from checkbox within w_autosizeheight
end type
type cbx_footer from checkbox within w_autosizeheight
end type
type cbx_summary from checkbox within w_autosizeheight
end type
type cbx_detail from checkbox within w_autosizeheight
end type
type cbx_header from checkbox within w_autosizeheight
end type
type cb_dw from commandbutton within w_autosizeheight
end type
type dw_1 from datawindow within w_autosizeheight
end type
type cb_height from commandbutton within w_autosizeheight
end type
type gb_1 from groupbox within w_autosizeheight
end type
type gb_2 from groupbox within w_autosizeheight
end type
end forward

global type w_autosizeheight from w_basesheet
integer width = 4439
integer height = 2680
string title = "AutoSize Height"
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
cbx_border cbx_border
cb_dw_back cb_dw_back
rb_func rb_func
rb_dot rb_dot
cbx_crossh3 cbx_crossh3
cbx_crossh2 cbx_crossh2
cbx_crossh1 cbx_crossh1
ddlb_dw ddlb_dw
cbx_gtrailer2 cbx_gtrailer2
cbx_gheader2 cbx_gheader2
cbx_gtrailer1 cbx_gtrailer1
cbx_gheader1 cbx_gheader1
cbx_footer cbx_footer
cbx_summary cbx_summary
cbx_detail cbx_detail
cbx_header cbx_header
cb_dw cb_dw
dw_1 dw_1
cb_height cb_height
gb_1 gb_1
gb_2 gb_2
end type
global w_autosizeheight w_autosizeheight

type variables
string isa_dw[] = {"d_composite", "d_crosstab", "d_freeform_picture", "d_grid_button", "d_group_roundrectangle",  &
						"d_group_arguments", "d_group2_rectangle", "d_nup_graph", &
						"d_tabular_oval", "d_tree_line", "d_tree_arguments" }
						
string is_nested = "No"

int ii_index


end variables

forward prototypes
public subroutine wf_chg_band_autosize (string as_band, boolean ab_enabled)
public function string wf_get_band_autosize (string as_band)
public subroutine wf_get_bands_state ()
public subroutine wf_cur_dw_bands ()
public subroutine wf_printpreview ()
end prototypes

public subroutine wf_chg_band_autosize (string as_band, boolean ab_enabled);string ls_enabled, ls_ret

if ab_enabled then ls_enabled = "yes" else ls_enabled = "no"

//accessing property using methods or expressions
if rb_func.checked then
	ls_ret = dw_1.modify("datawindow." + as_band + ".height.autosize = " + ls_enabled)
else
	choose case as_band
		case "header"
			dw_1.object.datawindow.header.height.autosize = ls_enabled
		case "detail"
			dw_1.object.datawindow.detail.height.autosize = ls_enabled
		case "summary"
			dw_1.object.datawindow.summary.height.autosize = ls_enabled
		case "footer"
			dw_1.object.datawindow.footer.height.autosize = ls_enabled
		case else		//some bands like group header/trailer cannot use dot notation
			ls_ret = dw_1.modify("datawindow." + as_band + ".height.autosize = '" + ls_enabled + "'")
	end choose

end if

if ls_ret <> "" then messagebox("set property error", ls_ret)
end subroutine

public function string wf_get_band_autosize (string as_band);string ls_rtn

//accessing property using methods or expressions
if rb_func.checked then
	ls_rtn = dw_1.describe("datawindow." + as_band + ".height.autosize")
else
	choose case as_band
		case "header"
			ls_rtn = dw_1.object.datawindow.header.height.autosize
		case "detail"
			ls_rtn = dw_1.object.datawindow.detail.height.autosize
		case "summary"
			ls_rtn = dw_1.object.datawindow.summary.height.autosize
		case "footer"
			ls_rtn = dw_1.object.datawindow.footer.height.autosize
		case else //some bands like group header/trailer cannot use dot notation
			ls_rtn = dw_1.describe("datawindow." + as_band + ".height.autosize")
	end choose
end if

if ls_rtn = '!' or ls_rtn = '?' then messagebox("get property error!", ls_rtn)
return ls_rtn
end function

public subroutine wf_get_bands_state ();if dw_1.dataobject = "" then return

// Get autosize height states

string ls_bands
ls_bands = dw_1.Object.DataWindow.Bands

cbx_header.enabled = pos(ls_bands, "header~t") > 0
cbx_detail.enabled = pos(ls_bands, "detail") > 0
cbx_footer.enabled = pos(ls_bands, "footer") > 0
cbx_summary.enabled = pos(ls_bands, "summary") > 0
cbx_gheader1.enabled = pos(ls_bands, "header.1") > 0
if not cbx_gheader1.enabled then
	cbx_gheader1.enabled = pos(ls_bands, "tree.level.1") > 0
	if cbx_gheader1.enabled then cbx_gheader1.text = "tree.level.1"
else
	cbx_gheader1.text = "header.1"
end if
cbx_gheader2.enabled = pos(ls_bands, "header.2") > 0
if not cbx_gheader2.enabled then
	cbx_gheader2.enabled = pos(ls_bands, "tree.level.2") > 0
	if cbx_gheader2.enabled then cbx_gheader2.text = "tree.level.2"
else
	cbx_gheader2.text = "header.1"
end if

cbx_gtrailer1.enabled = pos(ls_bands, "trailer.1") > 0
cbx_gtrailer2.enabled = pos(ls_bands, "trailer.2") > 0

cbx_crossh1.enabled = pos(ls_bands, "header[1]") > 0
cbx_crossh2.enabled = pos(ls_bands, "header[2]") > 0
cbx_crossh3.enabled = pos(ls_bands, "header[3]") > 0

cbx_header.checked = cbx_header.enabled and wf_get_band_autosize("header") = "yes"
cbx_detail.checked = cbx_detail.enabled and wf_get_band_autosize("detail") = "yes"
cbx_footer.checked = cbx_footer.enabled and wf_get_band_autosize("footer") = "yes"
cbx_summary.checked = cbx_summary.enabled and wf_get_band_autosize("summary") = "yes"

// for Group & TreeView DW

if cbx_gheader1.enabled then
	if wf_get_band_autosize(cbx_gheader1.text) = "yes" then
		cbx_gheader1.checked =  true
	else
		cbx_gheader1.checked =  false
	end if
else
	cbx_gheader1.checked =  false
end if	

if cbx_gheader2.enabled then
	if wf_get_band_autosize(cbx_gheader2.text) = "yes" then
		cbx_gheader2.checked =  true
	else
		cbx_gheader2.checked =  false
	end if
else
	cbx_gheader2.checked =  false
end if	

if cbx_gtrailer1.enabled then
	if wf_get_band_autosize("trailer.1") = "yes" then
		cbx_gtrailer1.checked =  true
	else
		cbx_gtrailer1.checked =  false
	end if
else
	cbx_gtrailer1.checked =  false
end if	

if cbx_gtrailer2.enabled then
	if wf_get_band_autosize("trailer.2") = "yes" then
		cbx_gtrailer2.checked =  true
	else
		cbx_gtrailer2.checked =  false
	end if
else
	cbx_gtrailer2.checked =  false
end if	


// for Crosstab DW
if cbx_crossh1.enabled then
	if dw_1.describe("datawindow.header[1].height.autosize") = "yes" then
		cbx_crossh1.checked =  true
	else
		cbx_crossh1.checked =  false
	end if
else
	cbx_crossh1.checked =  false
end if	

if cbx_crossh2.enabled then
	if dw_1.describe("datawindow.header[2].height.autosize") = "yes" then
		cbx_crossh2.checked =  true
	else
		cbx_crossh2.checked =  false
	end if
else
	cbx_crossh2.checked =  false
end if	

if cbx_crossh3.enabled then
	if dw_1.describe("datawindow.header[3].height.autosize") = "yes" then
		cbx_crossh3.checked =  true
	else
		cbx_crossh3.checked =  false
	end if
else
	cbx_crossh3.checked =  false
end if	
	
end subroutine

public subroutine wf_cur_dw_bands ();
end subroutine

public subroutine wf_printpreview ();/*Check to see if it is a nested/composite report
if not, place DataWindow in Print.Preview Mode */
is_nested = dw_1.Object.DataWindow.Nested
if is_nested = 'no' then dw_1.object.DataWindow.Print.Preview = TRUE
cbx_border.checked = TRUE
end subroutine

on w_autosizeheight.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cbx_border=create cbx_border
this.cb_dw_back=create cb_dw_back
this.rb_func=create rb_func
this.rb_dot=create rb_dot
this.cbx_crossh3=create cbx_crossh3
this.cbx_crossh2=create cbx_crossh2
this.cbx_crossh1=create cbx_crossh1
this.ddlb_dw=create ddlb_dw
this.cbx_gtrailer2=create cbx_gtrailer2
this.cbx_gheader2=create cbx_gheader2
this.cbx_gtrailer1=create cbx_gtrailer1
this.cbx_gheader1=create cbx_gheader1
this.cbx_footer=create cbx_footer
this.cbx_summary=create cbx_summary
this.cbx_detail=create cbx_detail
this.cbx_header=create cbx_header
this.cb_dw=create cb_dw
this.dw_1=create dw_1
this.cb_height=create cb_height
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cbx_border
this.Control[iCurrent+3]=this.cb_dw_back
this.Control[iCurrent+4]=this.rb_func
this.Control[iCurrent+5]=this.rb_dot
this.Control[iCurrent+6]=this.cbx_crossh3
this.Control[iCurrent+7]=this.cbx_crossh2
this.Control[iCurrent+8]=this.cbx_crossh1
this.Control[iCurrent+9]=this.ddlb_dw
this.Control[iCurrent+10]=this.cbx_gtrailer2
this.Control[iCurrent+11]=this.cbx_gheader2
this.Control[iCurrent+12]=this.cbx_gtrailer1
this.Control[iCurrent+13]=this.cbx_gheader1
this.Control[iCurrent+14]=this.cbx_footer
this.Control[iCurrent+15]=this.cbx_summary
this.Control[iCurrent+16]=this.cbx_detail
this.Control[iCurrent+17]=this.cbx_header
this.Control[iCurrent+18]=this.cb_dw
this.Control[iCurrent+19]=this.dw_1
this.Control[iCurrent+20]=this.cb_height
this.Control[iCurrent+21]=this.gb_1
this.Control[iCurrent+22]=this.gb_2
end on

on w_autosizeheight.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cbx_border)
destroy(this.cb_dw_back)
destroy(this.rb_func)
destroy(this.rb_dot)
destroy(this.cbx_crossh3)
destroy(this.cbx_crossh2)
destroy(this.cbx_crossh1)
destroy(this.ddlb_dw)
destroy(this.cbx_gtrailer2)
destroy(this.cbx_gheader2)
destroy(this.cbx_gtrailer1)
destroy(this.cbx_gheader1)
destroy(this.cbx_footer)
destroy(this.cbx_summary)
destroy(this.cbx_detail)
destroy(this.cbx_header)
destroy(this.cb_dw)
destroy(this.dw_1)
destroy(this.cb_height)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;dw_1.setTransObject(SQLCA);
ddlb_dw.selectitem(1)
ddlb_dw.event selectionChanged(1)
end event

event resize;dw_1.height = newheight - 200
end event

type cb_1 from commandbutton within w_autosizeheight
integer x = 2542
integer y = 24
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "saveas"
end type

event clicked;//dw_1.object.datawindow.export.pdf.method = distill!
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

dw_1.object.datawindow.export.pdf.method =nativepdf!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=2
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=3
dw_1.saveas( )
end event

type cbx_border from checkbox within w_autosizeheight
integer x = 1678
integer y = 32
integer width = 823
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Print Preview Margin Border"
boolean checked = true
end type

event clicked;if this.checked then
	//Turn on the Print Preview margin border line
	if is_nested = "no" then
		dw_1.Object.DataWindow.Print.Preview = TRUE
	end if
	dw_1.object.DataWindow.print.preview.outline = TRUE
else
	//Turn off the Print Preview margin border line
	if is_nested = "no" then
		dw_1.Object.DataWindow.Print.Preview = FALSE
	end if
	dw_1.object.DataWindow.print.preview.outline = FALSE
end if

end event

type cb_dw_back from commandbutton within w_autosizeheight
integer x = 622
integer y = 32
integer width = 96
integer height = 100
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<"
end type

event clicked;string sqlselect

// Iterate all dws stored in isa_dw
if ii_index > 1 then
	ii_index --
else
	ii_index = upperbound(isa_dw)
end if

dw_1.dataObject = isa_dw[ii_index]
dw_1.setTransObject(sqlca)

// Take too long to retrieve all data
sqlselect = dw_1.getsqlselect( )
if (pos(sqlselect, "FROM ~"sales_order~"") > 0) then
	dw_1.setfilter("id < 2050")
end if

dw_1.retrieve()

wf_printPreview()

ddlb_dw.selectItem(ii_index)

// Get all bands autoheight states
wf_get_bands_state()


end event

type rb_func from radiobutton within w_autosizeheight
integer x = 55
integer y = 1432
integer width = 498
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "describe/modify"
boolean checked = true
end type

type rb_dot from radiobutton within w_autosizeheight
integer x = 55
integer y = 1368
integer width = 393
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "dot notation"
end type

type cbx_crossh3 from checkbox within w_autosizeheight
integer x = 69
integer y = 1160
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "header[3]"
end type

event clicked;wf_chg_band_autosize(this.text, this.checked)
end event

type cbx_crossh2 from checkbox within w_autosizeheight
integer x = 69
integer y = 1064
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "header[2]"
end type

event clicked;wf_chg_band_autosize(this.text, this.checked)
end event

type cbx_crossh1 from checkbox within w_autosizeheight
integer x = 69
integer y = 968
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "header[1]"
end type

event clicked;wf_chg_band_autosize(this.text, this.checked)
end event

type ddlb_dw from dropdownlistbox within w_autosizeheight
integer x = 745
integer y = 40
integer width = 768
integer height = 740
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;int li_index
for li_index = 1 to upperbound(isa_dw) 
	this.additem(isa_dw[li_index])
next
end event

event selectionchanged;ii_index = index - 1
cb_dw.event clicked()
end event

type cbx_gtrailer2 from checkbox within w_autosizeheight
integer x = 73
integer y = 816
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "trailer.2"
end type

event clicked;wf_chg_band_autosize(this.text, this.checked)
end event

type cbx_gheader2 from checkbox within w_autosizeheight
integer x = 73
integer y = 720
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "header.2"
end type

event clicked;wf_chg_band_autosize(this.text, this.checked)
end event

type cbx_gtrailer1 from checkbox within w_autosizeheight
integer x = 73
integer y = 624
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "trailer.1"
end type

event clicked;wf_chg_band_autosize(this.text, this.checked)
end event

type cbx_gheader1 from checkbox within w_autosizeheight
integer x = 73
integer y = 528
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "header.1"
end type

event clicked;wf_chg_band_autosize(this.text, this.checked)
end event

type cbx_footer from checkbox within w_autosizeheight
integer x = 73
integer y = 408
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "footer"
end type

event clicked;wf_chg_band_autosize(this.text, this.checked)
end event

type cbx_summary from checkbox within w_autosizeheight
integer x = 73
integer y = 312
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "summary"
end type

event clicked;wf_chg_band_autosize(this.text, this.checked)
end event

type cbx_detail from checkbox within w_autosizeheight
integer x = 73
integer y = 216
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "detail"
end type

event clicked;wf_chg_band_autosize(this.text, this.checked)
end event

type cbx_header from checkbox within w_autosizeheight
integer x = 73
integer y = 120
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "header"
end type

event clicked;wf_chg_band_autosize(this.text, this.checked)
end event

type cb_dw from commandbutton within w_autosizeheight
integer x = 1536
integer y = 32
integer width = 96
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">"
end type

event clicked;string sqlselect

//Iterate all dws stored in isa_dw
if ii_index < upperbound(isa_dw) then
	ii_index ++
else
	ii_index = 1
end if
dw_1.dataObject = isa_dw[ii_index]
dw_1.setTransObject(sqlca)

// Take too long to retrieve all data
sqlselect = dw_1.getsqlselect( )
if (pos(sqlselect, "FROM ~"sales_order~"") > 0) then
	dw_1.setfilter("id < 2050")
end if

dw_1.retrieve()

wf_printPreview()

ddlb_dw.selectItem(ii_index)

//Get all bands autoheight states
wf_get_bands_state()

end event

type dw_1 from datawindow within w_autosizeheight
integer x = 622
integer y = 160
integer width = 3730
integer height = 1216
integer taborder = 10
string title = "none"
string dataobject = "d_comp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;this.setfocus()
end event

type cb_height from commandbutton within w_autosizeheight
boolean visible = false
integer x = 1691
integer y = 180
integer width = 283
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "chg filter"
end type

event clicked;//Get nested report and make it retrieve more rows
DatawindowChild ldwc_1
if 1 <> dw_1.getChild("dw_4", ldwc_1) then messagebox("error", "error or cannot get report dw_1")
ldwc_1.setfilter("")
ldwc_1.filter()

end event

type gb_1 from groupbox within w_autosizeheight
integer x = 37
integer y = 24
integer width = 535
integer height = 1248
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "AutoSize Height"
end type

event constructor;dw_1.modify("datawindow.object.dw_1.dataobject = 'd_nested_ext'")
end event

type gb_2 from groupbox within w_autosizeheight
integer x = 37
integer y = 1304
integer width = 544
integer height = 256
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Method"
end type

