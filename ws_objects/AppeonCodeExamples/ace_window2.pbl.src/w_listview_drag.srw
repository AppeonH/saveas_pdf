$PBExportHeader$w_listview_drag.srw
forward
global type w_listview_drag from window
end type
type cb_3 from commandbutton within w_listview_drag
end type
type sle_1 from uo_singleedit within w_listview_drag
end type
type uo_1 from uo_treeview within w_listview_drag
end type
type dw_1 from datawindow within w_listview_drag
end type
type cb_2 from commandbutton within w_listview_drag
end type
type lv_2 from listview within w_listview_drag
end type
type cb_1 from commandbutton within w_listview_drag
end type
type mle_1 from multilineedit within w_listview_drag
end type
type lv_1 from listview within w_listview_drag
end type
type gb_1 from groupbox within w_listview_drag
end type
type gb_4 from groupbox within w_listview_drag
end type
type gb_2 from groupbox within w_listview_drag
end type
type gb_3 from groupbox within w_listview_drag
end type
end forward

global type w_listview_drag from window
integer width = 3515
integer height = 1988
boolean titlebar = true
string title = "ListView Drag/Drop"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_postopen ( )
event ue_refresh_items ( )
cb_3 cb_3
sle_1 sle_1
uo_1 uo_1
dw_1 dw_1
cb_2 cb_2
lv_2 lv_2
cb_1 cb_1
mle_1 mle_1
lv_1 lv_1
gb_1 gb_1
gb_4 gb_4
gb_2 gb_2
gb_3 gb_3
end type
global w_listview_drag w_listview_drag

type variables
DataStore ids_Products
int i
string is_msg
end variables

forward prototypes
public function string of_set_label (integer ai_row)
public subroutine of_output (string as_msg)
public subroutine of_dragobject (dragobject ado_ctr)
end prototypes

event ue_postopen();Integer		li_Columns, li_Cnt, li_Width
String		ls_Column, ls_Label, ls_ColType
Alignment	lal_Align

SetPointer(Hourglass!)

// Using a datastore to retrieve data from the database
ids_Products = Create DataStore
ids_Products.DataObject = "d_products"

// Set the large and small picture sizes
lv_1.LargePictureWidth = 48
lv_1.LargePictureHeight = 48
lv_1.SmallPictureWidth = 24
lv_1.SmallPictureHeight = 24

lv_2.LargePictureWidth = 48
lv_2.LargePictureHeight = 48
lv_2.SmallPictureWidth = 24
lv_2.SmallPictureHeight = 24

// Add the columns for report view.
li_Columns = Integer(ids_Products.Object.DataWindow.Column.Count)

For li_Cnt = 1 To li_Columns
	ls_Column = ids_Products.Describe("#" + String(li_Cnt) + ".Name")

	// Do not add any columns with 'Display as BitMap' checked
	If ids_Products.Describe(ls_Column + ".BitMapName")	= "no" Then

		ls_Label = ids_Products.Describe(ls_Column + "_t.Text")
		li_Width = Integer(ids_Products.Describe(ls_Column + ".Width"))
		If Lower(LeftA(ids_Products.Describe(ls_Column + ".Coltype"), 4)) = "char" Then
			lal_Align = Left!
		Else
			lal_Align = Right!
		End If
	
		lv_1.AddColumn(ls_Label, lal_Align, li_Width)
	End If
Next

Post Event ue_refresh_items()

end event

event ue_refresh_items();Integer			li_Rows, li_Cnt
ListViewItem	llvi_Item

SetPointer(Hourglass!)

lv_1.DeleteItems()

// Retrieve data into the datastore
ids_Products.SetTransObject(sqlca)
li_Rows = ids_Products.Retrieve()

// Get all rows from the datastore and add as items to the listview
For li_Cnt = 1 To li_Rows
	llvi_Item.PictureIndex = lv_1.AddLargePicture(ids_Products.Object.picture_name[li_Cnt])
	lv_1.AddSmallPicture(ids_Products.Object.picture_name[li_Cnt])

	// Save the picture name in the data attribute so it can be referenced when the item is dropped.
	llvi_Item.Data = ids_Products.Object.picture_name[li_Cnt]
	
	// The label is comprised of all the data displayed in the Report view
	llvi_Item.Label = of_set_label(li_Cnt)
	
	lv_1.AddItem(llvi_Item)
Next

end event

public function string of_set_label (integer ai_row);// Multiple columns separated by a tab ("~t") are displayed as the columns in the report
// view.  The first is displayed as the label on the icon in icon view.

Integer		li_Columns, li_Cnt
String		ls_Column, ls_Label
Long			ll_Value
Double		ldb_Value
Date			ldt_Value

li_Columns = Integer(ids_Products.Object.DataWindow.Column.Count)

For li_Cnt = 1 To li_Columns
	ls_Column = ids_Products.Describe("#" + String(li_Cnt) + ".Name")
	
	// Do not add any columns with 'Display as BitMap' checked
	If ids_Products.Describe(ls_Column + ".BitMapName")	= "no" Then
		If li_Cnt > 1 Then ls_Label += "~t"
	
		Choose Case Lower(LeftA(ids_Products.Describe(ls_Column + ".Coltype"), 3))
			Case "dec"
				ldb_Value = ids_Products.GetItemDecimal(ai_Row, ls_Column)
				ls_Label += String(ldb_Value, "$#0.00")
			Case "cha"
				ls_Label += ids_Products.GetItemString(ai_Row, ls_Column)
			Case "dat"
				ldt_Value = ids_Products.GetItemDate(ai_Row, ls_Column)
				ls_Label += String(ldt_Value)
			Case Else
				ll_Value = ids_Products.GetItemNumber(ai_Row, ls_Column)
				ls_Label += String(ll_Value)
		End Choose
	End If
Next

Return ls_Label

end function

public subroutine of_output (string as_msg);string ls_pos
long ll_pos


ll_pos = PosA(as_msg,':') - 1

ls_pos = MidA(as_msg,1,ll_pos)

if ls_pos = is_msg then return
i++
mle_1.text += string(i)+'.'+as_msg +'~r~n'
is_msg = ls_pos

end subroutine

public subroutine of_dragobject (dragobject ado_ctr);//choose case ado_ctr.typeof()
//	case listview!
//end choose

return 
end subroutine

on w_listview_drag.create
this.cb_3=create cb_3
this.sle_1=create sle_1
this.uo_1=create uo_1
this.dw_1=create dw_1
this.cb_2=create cb_2
this.lv_2=create lv_2
this.cb_1=create cb_1
this.mle_1=create mle_1
this.lv_1=create lv_1
this.gb_1=create gb_1
this.gb_4=create gb_4
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_3,&
this.sle_1,&
this.uo_1,&
this.dw_1,&
this.cb_2,&
this.lv_2,&
this.cb_1,&
this.mle_1,&
this.lv_1,&
this.gb_1,&
this.gb_4,&
this.gb_2,&
this.gb_3}
end on

on w_listview_drag.destroy
destroy(this.cb_3)
destroy(this.sle_1)
destroy(this.uo_1)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.lv_2)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.lv_1)
destroy(this.gb_1)
destroy(this.gb_4)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;This.X = 0
This.Y = 0
Post Event ue_postopen()
end event

event close;if isvalid(ids_Products) then
	Destroy ids_Products
end if
end event

event dragdrop;of_output('window Event dragdrop : Source ='+source.classname() )
end event

event dragenter;of_output('window Event Dragenter : Source ='+source.classname() )
end event

event dragleave;of_output('window Event Dragleave : Source ='+source.classname() )
end event

event dragwithin;of_output('window Event Dragwithin : Source ='+source.classname() )
end event

event resize;long  li_height,li_width

li_height = uo_1.height
li_width = uo_1.width

uo_1.tv_1.move(0,0)
uo_1.tv_1.resize(li_width,li_height)
end event

type cb_3 from commandbutton within w_listview_drag
integer x = 3054
integer y = 1748
integer width = 384
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;close(parent)
end event

type sle_1 from uo_singleedit within w_listview_drag
integer x = 146
integer y = 864
integer taborder = 40
integer textsize = -8
end type

event dragdrop;call super::dragdrop;of_output('sle_1 Event Dragdrop : Source ='+source.classname() )
end event

event dragenter;call super::dragenter;of_output('sle_1 Event Dragenter : Source ='+source.classname() )
end event

event dragleave;call super::dragleave;of_output('sle_1 Event Dragleave : Source ='+source.classname() )
end event

event dragwithin;call super::dragwithin;of_output('sle_1 Event Dragwithin : Source ='+source.classname() )
end event

type uo_1 from uo_treeview within w_listview_drag
integer x = 37
integer y = 1056
integer width = 914
integer height = 768
integer taborder = 30
boolean dragauto = true
end type

on uo_1.destroy
call uo_treeview::destroy
end on

event dragdrop;call super::dragdrop;of_output('uo_1 Event Dragdrop : Source ='+source.classname() )
end event

event dragenter;call super::dragenter;of_output('uo_1 Event Dragenter : Source ='+source.classname() )
end event

event dragleave;call super::dragleave;of_output('uo_1 Event Dragleave : Source ='+source.classname() )
end event

event dragwithin;call super::dragwithin;of_output('uo_1 Event Dragwithin : Source ='+source.classname() )
end event

event ue_output;call super::ue_output;of_OutPut(as_Message)
end event

type dw_1 from datawindow within w_listview_drag
integer x = 1061
integer y = 1056
integer width = 951
integer height = 768
integer taborder = 30
boolean dragauto = true
string title = "Drag"
string dataobject = "d_add_sales_order_items"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve()
end event

event dragdrop;of_output('dw_1 Event Dragdrop : Source ='+source.classname() )
end event

event dragenter;of_output('dw_1 Event Dragenter : Source ='+source.classname())
end event

event dragleave;of_output('dw_1 Event Dragleave : Source ='+source.classname() )
end event

event dragwithin;of_output('dw_1 Event Dragwithin : Source ='+source.classname() )
end event

type cb_2 from commandbutton within w_listview_drag
integer x = 1207
integer y = 864
integer width = 658
integer height = 96
integer taborder = 20
boolean dragauto = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Button"
end type

event dragdrop;of_output('cb_2 Event Dragdrop : Source ='+source.classname() )
end event

event dragenter;of_output('cb_2 Event Dragenter : Source ='+source.classname() )
end event

event dragleave;of_output('cb_2 Event Dragleave : Source ='+source.classname() )
end event

event dragwithin;of_output('cb_2 Event Dragwithin : Source ='+source.classname() )
end event

type lv_2 from listview within w_listview_drag
integer x = 1042
integer y = 64
integer width = 987
integer height = 672
integer taborder = 30
boolean dragauto = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean editlabels = true
long largepicturemaskcolor = 12632256
integer smallpicturewidth = 16
integer smallpictureheight = 16
long smallpicturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type

event begindrag;of_output('lv_2 Event Begindrag : Index ='+string(index))
end event

event beginrightdrag;of_output('lv_2 Event BeginrightDrag : Index ='+string(index))
end event

event dragdrop;if source.classname()<>'lv_1' then return 
ListView llv_source
ListViewItem llvi_item
string ls_picturename
int li_index 
llv_source = source


li_index  = llv_source.selectedindex()
llv_source.getitem(li_index ,llvi_item)

ls_picturename = llvi_item.data
llvi_Item.PictureIndex = this.AddLargePicture(ls_picturename)

this.additem(llvi_item)

llv_source.deleteitem(li_index)
of_output('lv_2 Event Dragdrop : Source ='+source.classname() )
end event

event dragenter;of_output('lv_2 Event Dragenter : Source ='+source.classname())
end event

event dragleave;of_output('lv_2 Event Dragleave : Source ='+source.classname() )
end event

event dragwithin;of_output('lv_2 Event Dragwithin : Source ='+source.classname() )
end event

type cb_1 from commandbutton within w_listview_drag
integer x = 2656
integer y = 1748
integer width = 384
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Clear"
end type

event clicked;i = 0
mle_1.text =''
end event

type mle_1 from multilineedit within w_listview_drag
integer x = 2139
integer y = 64
integer width = 1271
integer height = 1620
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type lv_1 from listview within w_listview_drag
integer x = 59
integer y = 64
integer width = 951
integer height = 672
integer taborder = 10
boolean dragauto = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean editlabels = true
boolean extendedselect = true
integer largepicturewidth = 32
integer largepictureheight = 32
long largepicturemaskcolor = 12632256
integer smallpicturewidth = 16
integer smallpictureheight = 16
long smallpicturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type

event dragdrop;//of_output('lv_1 Event Dragdrop : Source ='+source.classname())
if source.classname() <> 'lv_2' then return 
ListView llv_source
ListViewItem llvi_item
string ls_picturename
int li_index 
llv_source = source


li_index  = llv_source.selectedindex()
llv_source.getitem(li_index ,llvi_item)

ls_picturename = llvi_item.data
llvi_Item.PictureIndex = this.AddLargePicture(ls_picturename)

this.additem(llvi_item)

llv_source.deleteitem(li_index)
of_output('lv_1 Event Dragdrop : Source ='+source.classname() )
end event

event begindrag;of_output('lv_1 Event Begindrag : Index ='+string(index))
end event

event beginrightdrag;of_output('lv_1 Event BeginrightDrag : Index ='+string(index))
end event

event dragenter;of_output('lv_1 Event Dragenter : Source ='+source.classname())
end event

event dragleave;of_output('lv_1 Event Dragleave : Source ='+source.classname() )
end event

event dragwithin;of_output('lv_1 Event Dragwithin : Source ='+source.classname())
end event

type gb_1 from groupbox within w_listview_drag
integer x = 18
integer width = 2048
integer height = 768
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Drag Listview Item"
end type

type gb_4 from groupbox within w_listview_drag
integer x = 2098
integer width = 1358
integer height = 1716
integer taborder = 30
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

type gb_2 from groupbox within w_listview_drag
integer x = 1042
integer y = 768
integer width = 1024
integer height = 1088
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Drag Control"
end type

type gb_3 from groupbox within w_listview_drag
integer x = 18
integer y = 768
integer width = 987
integer height = 1088
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Drag UserObject"
end type

