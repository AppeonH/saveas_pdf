$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_9 from commandbutton within w_main
end type
type cb_8 from uo_saveas within w_main
end type
type cbx_3 from checkbox within w_main
end type
type cb_7 from commandbutton within w_main
end type
type cb_6 from commandbutton within w_main
end type
type cb_5 from commandbutton within w_main
end type
type cb_4 from commandbutton within w_main
end type
type pb_4 from picturebutton within w_main
end type
type pb_3 from picturebutton within w_main
end type
type pb_2 from picturebutton within w_main
end type
type pb_1 from picturebutton within w_main
end type
type ddlb_aln from dropdownlistbox within w_main
end type
type st_3 from statictext within w_main
end type
type ddlb_toolbar from dropdownlistbox within w_main
end type
type st_2 from statictext within w_main
end type
type cb_3 from commandbutton within w_main
end type
type st_col from statictext within w_main
end type
type st_1 from statictext within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
type dw_1 from datawindow within w_main
end type
type cbx_1 from checkbox within w_main
end type
type cbx_2 from checkbox within w_main
end type
type gb_1 from groupbox within w_main
end type
end forward

global type w_main from window
integer width = 4649
integer height = 2964
boolean titlebar = true
string title = "DataWindow RichText EditStyle"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 32174819
string icon = "AppIcon!"
boolean center = true
windowanimationstyle openanimation = toproll!
integer animationtime = 500
cb_9 cb_9
cb_8 cb_8
cbx_3 cbx_3
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
ddlb_aln ddlb_aln
st_3 st_3
ddlb_toolbar ddlb_toolbar
st_2 st_2
cb_3 cb_3
st_col st_col
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
cbx_1 cbx_1
cbx_2 cbx_2
gb_1 gb_1
end type
global w_main w_main

on w_main.create
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cbx_3=create cbx_3
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.ddlb_aln=create ddlb_aln
this.st_3=create st_3
this.ddlb_toolbar=create ddlb_toolbar
this.st_2=create st_2
this.cb_3=create cb_3
this.st_col=create st_col
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.gb_1=create gb_1
this.Control[]={this.cb_9,&
this.cb_8,&
this.cbx_3,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.ddlb_aln,&
this.st_3,&
this.ddlb_toolbar,&
this.st_2,&
this.cb_3,&
this.st_col,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.cbx_1,&
this.cbx_2,&
this.gb_1}
end on

on w_main.destroy
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cbx_3)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.ddlb_aln)
destroy(this.st_3)
destroy(this.ddlb_toolbar)
destroy(this.st_2)
destroy(this.cb_3)
destroy(this.st_col)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.gb_1)
end on

event open;dw_1.Settransobject(sqlca)
dw_1.Retrieve()

ddlb_toolbar.text="On Edit"
ddlb_aln.text = "Left"
end event

type cb_9 from commandbutton within w_main
integer x = 3415
integer y = 364
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New PDF"
end type

event clicked;OpenWithparm( w_newfeature,dw_1)
end event

type cb_8 from uo_saveas within w_main
integer x = 2162
integer y = 392
integer taborder = 40
end type

event clicked;call super::clicked;of_saveas(dw_1,cbx_3.checked)  
end event

type cbx_3 from checkbox within w_main
integer x = 1682
integer y = 404
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
string text = "pb"
end type

type cb_7 from commandbutton within w_main
integer x = 2167
integer y = 112
integer width = 329
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "retrieve"
end type

event clicked;dw_1.retrieve( )
end event

type cb_6 from commandbutton within w_main
integer x = 2665
integer y = 264
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

event clicked;
//dw_1.object.datawindow.export.pdf.method = distill!
//dw_1.object.datawindow.printer = "Ghostscript PDF"
//dw_1.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

dw_1.object.datawindow.export.pdf.method =nativepdf!
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation=1
dw_1.Object.DataWindow.Export.PDF.NativePDF.CustomSize=4
dw_1.saveas( )
end event

type cb_5 from commandbutton within w_main
integer x = 2217
integer y = 264
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Update"
end type

event clicked;dw_1.accepttext( )

if dw_1.update( ) = 1 then
	commit;
	messagebox("","update Success")
else
	messagebox("Error","Error : "+sqlca.sqlerrtext)
	rollback;
end if
end event

type cb_4 from commandbutton within w_main
integer x = 4032
integer y = 308
integer width = 462
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Close"
end type

event clicked;close(parent)
end event

type pb_4 from picturebutton within w_main
integer x = 3767
integer y = 200
integer width = 110
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "VCRLast!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_1.ScrollToRow(dw_1.RowCount())
dw_1.SetRow(dw_1.RowCount())
end event

type pb_3 from picturebutton within w_main
integer x = 3653
integer y = 200
integer width = 110
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "VCRNext!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_1.SetRow(dw_1.ScrollNextRow())
end event

type pb_2 from picturebutton within w_main
integer x = 3538
integer y = 200
integer width = 110
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "VCRPrior!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_1.SetRow(dw_1.ScrollPriorRow())
end event

type pb_1 from picturebutton within w_main
integer x = 3424
integer y = 200
integer width = 110
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "VCRFirst!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_1.ScrollToRow(1)
dw_1.SetRow(1)
end event

type ddlb_aln from dropdownlistbox within w_main
integer x = 640
integer y = 268
integer width = 480
integer height = 400
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"Left","Center","Right","Justify"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;alignment	le_align
integer	li_rtn

choose	case	this.text
	case	'Left'
		le_align	= left!
	case	'Center'
		le_align	= center!
	case	'Right'
		le_align	= right!
	case	'Justify'
		le_align	= justify!
end choose

li_rtn	= dw_1.setrichtextalign( le_align )

end event

type st_3 from statictext within w_main
integer x = 169
integer y = 288
integer width = 407
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 32174819
string text = "Text Alignment"
boolean focusrectangle = false
end type

type ddlb_toolbar from dropdownlistbox within w_main
integer x = 640
integer y = 132
integer width = 480
integer height = 400
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"Always","On Edit","Never"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if	this.text="Never" then
	dw_1.RichTextToolbarActivation	= RichTextToolbarActivationNever!
elseif	this.text="On Edit"	then
	dw_1.RichTextToolbarActivation	= RichTextToolbarActivationOnEdit!
elseif	this.text="Always"	then
	dw_1.RichTextToolbarActivation	= RichTextToolbarActivationAlways!
end if

end event

type st_2 from statictext within w_main
integer x = 169
integer y = 152
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 32174819
string text = "Show Toolbar"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_main
integer x = 2889
integer y = 132
integer width = 178
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;long  red, green, blue
long custom_color 
double li_color
string sModify

red = 255

li_color = ChooseColor(custom_color)
dw_1.SetRichTextColor(custom_color)
st_col.BackColor = custom_color
end event

type st_col from statictext within w_main
integer x = 2885
integer y = 268
integer width = 183
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 32174819
boolean focusrectangle = false
end type

type st_1 from statictext within w_main
integer x = 2382
integer y = 152
integer width = 361
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 32174819
string text = "Text Color"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_main
integer x = 4032
integer y = 188
integer width = 462
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Update Data"
end type

event clicked;dw_1.Update()
end event

type cb_1 from commandbutton within w_main
integer x = 4032
integer y = 68
integer width = 462
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Insert Row"
end type

event clicked;dw_1.SetRow(dw_1.InsertRow(0))
dw_1.ScrollToRow(dw_1.GetRow())

end event

type dw_1 from datawindow within w_main
integer x = 78
integer y = 580
integer width = 4448
integer height = 2180
integer taborder = 10
string title = "none"
string dataobject = "d_freeform"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event updatestart;integer i

For i = 1 to this.RowCount()
	if this.GetItemStatus(i,0,Primary!)=NewModified! or this.GetItemStatus(i,0,Primary!)=DataModified! then
		this.SetItem(i,"date_modified",today())		
	end if
Next
end event

event dberror;//messagebox("Infomation","If you get this error message , you need : ~r~n&
//1. From the Database Profiles Dialog, select EAS Demo DB V126 and click Connect ~r~n &
//2. Open the database painter, open the rtedemo.sql file in ISQL painter in database painter of PowerBuilder 12.6 IDE ~r~n &
//3. Select Design --> Execute ISQL to run the SQL or select Execute from the Toolbar.")
messagebox("",sqlerrtext)
messagebox("Infomation","If you get this error message , you need : ~r~n&
1. From the Database Profiles Dialog, select PB Demo DB V2017 and click Connect ~r~n &
2. Open the database painter, open the rtedemo.sql file in ISQL painter in database painter of PowerBuilder 17.0 IDE ~r~n &
3. Select Design --> Execute ISQL to run the SQL or select Execute from the Toolbar.")


end event

type cbx_1 from checkbox within w_main
integer x = 1477
integer y = 276
integer width = 754
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 32174819
string text = "Show Vertical Scrollbar"
boolean checked = true
end type

event clicked;if this.Checked then
	dw_1.Modify( "short_desc.RichEdit.VScrollbar=Yes")
else
	dw_1.Modify( "short_desc.RichEdit.VScrollbar=No")
end if	

end event

type cbx_2 from checkbox within w_main
integer x = 1477
integer y = 140
integer width = 713
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 32174819
string text = "Show Focus Rectangle"
end type

event clicked;if this.Checked then
	dw_1.Modify( "short_desc.RichEdit.FocusRectangle=Yes")
else
	dw_1.Modify( "short_desc.RichEdit.FocusRectangle=No")
end if	

end event

type gb_1 from groupbox within w_main
integer x = 73
integer y = 44
integer width = 3109
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388736
long backcolor = 32174819
borderstyle borderstyle = styleraised!
end type

