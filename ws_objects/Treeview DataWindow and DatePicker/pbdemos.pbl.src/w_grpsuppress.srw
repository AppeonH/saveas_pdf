$PBExportHeader$w_grpsuppress.srw
forward
global type w_grpsuppress from w_basesheet
end type
type cb_1 from commandbutton within w_grpsuppress
end type
type cbx_1 from checkbox within w_grpsuppress
end type
type cbx_2 from checkbox within w_grpsuppress
end type
type cbx_3 from checkbox within w_grpsuppress
end type
type cb_dw_back from commandbutton within w_grpsuppress
end type
type ddlb_dw from dropdownlistbox within w_grpsuppress
end type
type cb_dw from commandbutton within w_grpsuppress
end type
type dw_1 from datawindow within w_grpsuppress
end type
type cb_height from commandbutton within w_grpsuppress
end type
type gb_3 from groupbox within w_grpsuppress
end type
end forward

global type w_grpsuppress from w_basesheet
integer width = 4439
integer height = 2628
string title = "Suppress Group Headers"
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
cb_dw_back cb_dw_back
ddlb_dw ddlb_dw
cb_dw cb_dw
dw_1 dw_1
cb_height cb_height
gb_3 gb_3
end type
global w_grpsuppress w_grpsuppress

type variables
string isa_dw[] = {"d_group_1", "d_group_2", "d_group_3" }
						
int ii_index

end variables

forward prototypes
public subroutine wf_get_bands_state ()
public subroutine wf_cur_dw_bands ()
public function string wf_get_grp_suppress (string as_band)
public subroutine wf_chg_band_suppress (string as_band, boolean ab_enabled)
end prototypes

public subroutine wf_get_bands_state ();if dw_1.dataobject = "" then return

// Get autosize height states

string ls_bands
ls_bands = dw_1.Object.DataWindow.Bands
//this.title = ls_bands

cbx_1.enabled = pos(ls_bands, "header.1") > 0
cbx_2.enabled = pos(ls_bands, "header.2") > 0
cbx_3.enabled = pos(ls_bands, "header.3") > 0


//get suppress property
if cbx_1.enabled then
	if wf_get_grp_suppress("header.1") = "yes" then
		cbx_1.checked =  true
	else
		cbx_1.checked =  false
	end if
else
	cbx_1.checked =  false
end if	

if cbx_2.enabled then
	if wf_get_grp_suppress("header.2") = "yes" then
		cbx_2.checked =  true
	else
		cbx_2.checked =  false
	end if
else
	cbx_2.checked =  false
end if	

if cbx_3.enabled then
	if wf_get_grp_suppress("header.3") = "yes" then
		cbx_3.checked =  true
	else
		cbx_3.checked =  false
	end if
else
	cbx_3.checked =  false
end if	
end subroutine

public subroutine wf_cur_dw_bands ();
end subroutine

public function string wf_get_grp_suppress (string as_band);string ls_rtn

ls_rtn = dw_1.describe("datawindow." + as_band + ".suppress")

if ls_rtn = '!' or ls_rtn = '?' then messagebox("get property error!", ls_rtn)
return ls_rtn
end function

public subroutine wf_chg_band_suppress (string as_band, boolean ab_enabled);string ls_enabled, ls_ret

if ab_enabled then ls_enabled = "yes" else ls_enabled = "no"

ls_ret = dw_1.modify("datawindow." + as_band + ".suppress = '" + ls_enabled + "'")

if ls_ret <> "" then messagebox("set property error", ls_ret)
end subroutine

on w_grpsuppress.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cb_dw_back=create cb_dw_back
this.ddlb_dw=create ddlb_dw
this.cb_dw=create cb_dw
this.dw_1=create dw_1
this.cb_height=create cb_height
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.cbx_2
this.Control[iCurrent+4]=this.cbx_3
this.Control[iCurrent+5]=this.cb_dw_back
this.Control[iCurrent+6]=this.ddlb_dw
this.Control[iCurrent+7]=this.cb_dw
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.cb_height
this.Control[iCurrent+10]=this.gb_3
end on

on w_grpsuppress.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cb_dw_back)
destroy(this.ddlb_dw)
destroy(this.cb_dw)
destroy(this.dw_1)
destroy(this.cb_height)
destroy(this.gb_3)
end on

event open;dw_1.setTransObject(SQLCA);
ddlb_dw.selectitem(1)
ddlb_dw.event selectionChanged(1)
end event

event resize;dw_1.height = newheight - 200
end event

type cb_1 from commandbutton within w_grpsuppress
integer x = 1746
integer y = 20
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Saveas"
end type

event clicked;//dw_1.object.datawindow.export.pdf.method = distill!
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

dw_1.object.datawindow.export.pdf.method =nativepdf!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=2
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=3
dw_1.saveas( )
end event

type cbx_1 from checkbox within w_grpsuppress
string tag = "s"
integer x = 101
integer y = 124
integer width = 379
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

event clicked;wf_chg_band_suppress(this.text, this.checked)
end event

type cbx_2 from checkbox within w_grpsuppress
string tag = "s"
integer x = 101
integer y = 212
integer width = 379
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

event clicked;wf_chg_band_suppress(this.text, this.checked)
end event

type cbx_3 from checkbox within w_grpsuppress
string tag = "s"
integer x = 101
integer y = 296
integer width = 379
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
string text = "header.3"
end type

event clicked;wf_chg_band_suppress(this.text, this.checked)
end event

type cb_dw_back from commandbutton within w_grpsuppress
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

ddlb_dw.selectItem(ii_index)

// Get all bands autoheight states
wf_get_bands_state()


end event

type ddlb_dw from dropdownlistbox within w_grpsuppress
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

type cb_dw from commandbutton within w_grpsuppress
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

ddlb_dw.selectItem(ii_index)

//Get all bands autoheight states
wf_get_bands_state()





end event

type dw_1 from datawindow within w_grpsuppress
integer x = 622
integer y = 160
integer width = 3735
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

type cb_height from commandbutton within w_grpsuppress
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

type gb_3 from groupbox within w_grpsuppress
integer x = 41
integer y = 24
integer width = 530
integer height = 388
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Suppress Header"
end type

event constructor;dw_1.modify("datawindow.object.dw_1.dataobject = 'd_nested_ext'")
end event

