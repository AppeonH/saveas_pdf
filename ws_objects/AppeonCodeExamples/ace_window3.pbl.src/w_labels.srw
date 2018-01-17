$PBExportHeader$w_labels.srw
$PBExportComments$Mailing labels for the contact table, uses Avery 5267 format.
forward
global type w_labels from window
end type
type cb_1 from commandbutton within w_labels
end type
type cbx_rulers from checkbox within w_labels
end type
type st_1 from statictext within w_labels
end type
type rb_custom from radiobutton within w_labels
end type
type rb_200 from radiobutton within w_labels
end type
type rb_100 from radiobutton within w_labels
end type
type rb_65 from radiobutton within w_labels
end type
type rb_30 from radiobutton within w_labels
end type
type em_zoom from editmask within w_labels
end type
type ddlb_label_type from dropdownlistbox within w_labels
end type
type cb_print_dw1 from commandbutton within w_labels
end type
type cb_close from commandbutton within w_labels
end type
type dw_label from datawindow within w_labels
end type
type gb_1 from groupbox within w_labels
end type
end forward

global type w_labels from window
integer x = 64
integer y = 176
integer width = 3136
integer height = 2020
boolean titlebar = true
string title = "Enhanced Label DataWindow"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
cbx_rulers cbx_rulers
st_1 st_1
rb_custom rb_custom
rb_200 rb_200
rb_100 rb_100
rb_65 rb_65
rb_30 rb_30
em_zoom em_zoom
ddlb_label_type ddlb_label_type
cb_print_dw1 cb_print_dw1
cb_close cb_close
dw_label dw_label
gb_1 gb_1
end type
global w_labels w_labels

type variables

end variables

forward prototypes
public function long wf_load_label_types (ref dropdownlistbox ax_ddlb)
end prototypes

public function long wf_load_label_types (ref dropdownlistbox ax_ddlb);string ls_Key
string ls_Label
long ll_Items = 1

do
	ls_Key = "Label" + String(ll_Items)
	ls_Label = ProfileString("pblab80.ini", "Labels", ls_Key, "")	
	if ls_Label<>"" then
		ax_ddlb.AddItem(ls_Label)
		ll_Items ++
	else
		Exit
	end if
loop until false

Return ll_Items - 1
end function

event open;//Open event for w_labels
//this window will show all of the valid label types
//visiually show a print preview of the types

This.x = 0
This.y = 0

//set transation for the datawindow preview
dw_label.settransobject(sqlca)
dw_label.retrieve()
	
//load the load selector listbox
wf_load_label_types(ddlb_label_type)

//select the first label
ddlb_label_type.selectitem(1)

end event

on w_labels.create
this.cb_1=create cb_1
this.cbx_rulers=create cbx_rulers
this.st_1=create st_1
this.rb_custom=create rb_custom
this.rb_200=create rb_200
this.rb_100=create rb_100
this.rb_65=create rb_65
this.rb_30=create rb_30
this.em_zoom=create em_zoom
this.ddlb_label_type=create ddlb_label_type
this.cb_print_dw1=create cb_print_dw1
this.cb_close=create cb_close
this.dw_label=create dw_label
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cbx_rulers,&
this.st_1,&
this.rb_custom,&
this.rb_200,&
this.rb_100,&
this.rb_65,&
this.rb_30,&
this.em_zoom,&
this.ddlb_label_type,&
this.cb_print_dw1,&
this.cb_close,&
this.dw_label,&
this.gb_1}
end on

on w_labels.destroy
destroy(this.cb_1)
destroy(this.cbx_rulers)
destroy(this.st_1)
destroy(this.rb_custom)
destroy(this.rb_200)
destroy(this.rb_100)
destroy(this.rb_65)
destroy(this.rb_30)
destroy(this.em_zoom)
destroy(this.ddlb_label_type)
destroy(this.cb_print_dw1)
destroy(this.cb_close)
destroy(this.dw_label)
destroy(this.gb_1)
end on

type cb_1 from commandbutton within w_labels
integer x = 663
integer y = 1792
integer width = 370
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Saveas..."
end type

event clicked;dw_label.saveas( )
end event

type cbx_rulers from checkbox within w_labels
integer x = 2770
integer y = 84
integer width = 261
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Rulers"
end type

event clicked;// use the print preview rulers attribute

If cbx_rulers.checked = True then 
	dw_label.Object.datawindow.print.preview.rulers = 'yes'
Else
	dw_label.Object.datawindow.print.preview.rulers = 'no'
End If
	
	
	
end event

type st_1 from statictext within w_labels
integer x = 18
integer y = 12
integer width = 352
integer height = 52
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Label Type:"
boolean focusrectangle = false
end type

type rb_custom from radiobutton within w_labels
integer x = 1559
integer y = 84
integer width = 256
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Cus&tom"
end type

type rb_200 from radiobutton within w_labels
integer x = 2459
integer y = 84
integer width = 224
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&200%"
end type

on clicked;//set zoom size to 200 %
em_zoom.text = "200"
em_zoom.triggerevent("ue_rezoom")
end on

type rb_100 from radiobutton within w_labels
integer x = 2245
integer y = 84
integer width = 215
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&100%"
boolean checked = true
end type

on clicked;//set zoom size to 100 %
em_zoom.text = "100"
em_zoom.triggerevent("ue_rezoom")
end on

type rb_65 from radiobutton within w_labels
integer x = 2034
integer y = 84
integer width = 210
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&65%"
end type

on clicked;//set zoom size to 65 %
em_zoom.text = "65"
em_zoom.triggerevent("ue_rezoom")
end on

type rb_30 from radiobutton within w_labels
integer x = 1815
integer y = 84
integer width = 192
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&30%"
end type

on clicked;//set zoom size to 30 %
em_zoom.text = "30"
em_zoom.triggerevent("ue_rezoom")
end on

type em_zoom from editmask within w_labels
event ue_change pbm_enchange
event ue_rezoom pbm_custom01
integer x = 1202
integer y = 76
integer width = 306
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
string minmax = "1~~200"
end type

event ue_change;//This ue_change event will be called any time another radio button is pressed. This is 
//a common area the zoom size is adjusted each time.

//When viewing a datawindow w/labels, the datawindow is automatically placed in print
//preview mode.  This will change the zoom size of the datawindow in print preiew mode.

If Integer(This.Text) > 0 and Integer(This.Text) <= 200 Then
	dw_label.Object.Datawindow.print.preview.zoom = Integer(this.text)
End If

rb_custom.checked = true

end event

event ue_rezoom;If Integer(This.Text) > 0 and Integer(This.Text) <= 200 Then
	dw_label.Object.datawindow.print.preview.zoom = Integer(this.text)
End If
end event

type ddlb_label_type from dropdownlistbox within w_labels
integer x = 18
integer y = 76
integer width = 1097
integer height = 1036
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//This will perform a dwmodify statement of the main datwindow based on the
//label type you have chosen. All of the attributes of the label are loaded 
//based on the pblab60 ini file.
//This will build a large string containing all of the dwmodify attribute adjustments
//and then dwmodify this one string.
//crm

string ls_rc
string ls_newlabel
string ls_labelname
string ls_shape, ls_digits
int		li_pos, li_pos_end

SetPointer(hourglass!)

//get the label anme
ls_labelname = ddlb_label_type.text

//set label name attribute
ls_newlabel = "datawindow.label.name = '" + ddlb_label_type.text + "' "

//set # of columns per sheet
ls_newlabel = ls_newlabel + " Datawindow.Label.Columns = " + &
	ProfileString("pblab80.ini", ls_labelname, "columns","")

//set space between columns
ls_newlabel = ls_newlabel + " Datawindow.Label.Columns.Spacing = " + &
	ProfileString("pblab80.ini", ls_labelname, "columns.spacing","")

//set height of the label
ls_newlabel = ls_newlabel + " Datawindow.Label.Height = " + &
	ProfileString("pblab80.ini", ls_labelname, "height","")

//set # or rows on a sheet
ls_newlabel = ls_newlabel + " Datawindow.Label.Rows = " + &
	ProfileString("pblab80.ini", ls_labelname, "rows","")

//set spaces between labels
ls_newlabel = ls_newlabel + " Datawindow.Label.Rows.Spacing = " + &
	ProfileString("pblab80.ini", ls_labelname, "rows.spacing","")

//Set the shape of the label
ls_shape = ProfileString("pblab80.ini", ls_labelname, "shape","")
li_pos = Pos(ls_shape,"(")

//If the label is roundrectange, the pablab.ini file contains the ellipse width and height
//is contained on the same line as the shape. This rountine will break out those elements
//and set thier attributes.
If li_pos > 0 Then
	//set elispse height
	li_pos_end = Pos(ls_shape, ",", li_pos)	
	ls_digits = Mid(ls_shape,li_pos + 1, li_pos_end  - li_pos - 1 )
	ls_newlabel = ls_newlabel + " Datawindow.Label.Ellipse_Width = " + ls_digits
	li_pos = li_pos_end 
	li_pos_end = Pos(ls_shape, ")", li_pos)
	ls_digits = Mid(ls_shape,li_pos + 1, li_pos_end  - li_pos - 1)
	ls_newlabel = ls_newlabel + " Datawindow.Label.Ellipse_Height = " + ls_digits
	li_pos = Pos(ls_shape,"(")
	ls_shape = Left (ProfileString("pblab80.ini", ls_labelname, "shape",""), li_pos - 1)
Else
	ls_shape = ProfileString("pblab80.ini", ls_labelname, "shape","")
End If

ls_newlabel = ls_newlabel + " Datawindow.Label.Shape = " + ls_shape

//set the width of the label
ls_newlabel = ls_newlabel + " Datawindow.Label.Width = " + &
	ProfileString("pblab80.ini", ls_labelname, "width","")

//set the page bottom margin
ls_newlabel = ls_newlabel + " Datawindow.Print.Margin.Bottom = " + &
	ProfileString("pblab80.ini", ls_labelname, "bottom_margin","")

//set the page left margin
ls_newlabel = ls_newlabel + " Datawindow.Print.Margin.Left = " + &
	ProfileString("pblab80.ini", ls_labelname, "left_margin","")

//set the page right margin
ls_newlabel = ls_newlabel + " Datawindow.Print.Margin.right = " + &
	ProfileString("pblab80.ini", ls_labelname, "right_margin","")

//set the page top margin
ls_newlabel = ls_newlabel + " Datawindow.Print.Margin.Top = " + &
	ProfileString("pblab80.ini", ls_labelname, "top_margin","")

//dwmodify the entire string
ls_rc = dw_label.modify(ls_newlabel)

If ls_rc <> "" Then
	 Messagebox("Label Change Error",ls_rc)
	 Messagebox("dwm",ls_newlabel)
End If

end event

type cb_print_dw1 from commandbutton within w_labels
integer x = 1097
integer y = 1792
integer width = 370
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print..."
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
OpenWithParm(w_dw_print_options, dw_label)

If Message.DoubleParm = -1 Then Return
dw_label.Print(True)
end event

type cb_close from commandbutton within w_labels
integer x = 1499
integer y = 1792
integer width = 370
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;
	close(parent)
end on

type dw_label from datawindow within w_labels
integer x = 18
integer y = 196
integer width = 3058
integer height = 1564
string dataobject = "d_label_preview"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_labels
integer x = 1170
integer y = 16
integer width = 1541
integer height = 160
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Display Zoom"
end type

