$PBExportHeader$w_dynamic_create.srw
$PBExportComments$Dynamic Create Object use create using powerscript
forward
global type w_dynamic_create from window
end type
type cb_1 from commandbutton within w_dynamic_create
end type
type st_2 from statictext within w_dynamic_create
end type
type st_1 from statictext within w_dynamic_create
end type
type ddlb_item from dropdownlistbox within w_dynamic_create
end type
type st_msg from statictext within w_dynamic_create
end type
type cb_close from commandbutton within w_dynamic_create
end type
type cb_start from commandbutton within w_dynamic_create
end type
type st_3 from statictext within w_dynamic_create
end type
type gb_1 from groupbox within w_dynamic_create
end type
type gb_2 from groupbox within w_dynamic_create
end type
end forward

global type w_dynamic_create from window
integer x = 494
integer y = 388
integer width = 2231
integer height = 1208
boolean titlebar = true
string title = "Dynamic Create Objects"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
st_2 st_2
st_1 st_1
ddlb_item ddlb_item
st_msg st_msg
cb_close cb_close
cb_start cb_start
st_3 st_3
gb_1 gb_1
gb_2 gb_2
end type
global w_dynamic_create w_dynamic_create

type variables
boolean ib_break_requested
end variables

event open;// initial value
this.x = 0
this.y = 0
ddlb_item.selectitem( 1)
end event

on w_dynamic_create.create
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_item=create ddlb_item
this.st_msg=create st_msg
this.cb_close=create cb_close
this.cb_start=create cb_start
this.st_3=create st_3
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_1,&
this.st_2,&
this.st_1,&
this.ddlb_item,&
this.st_msg,&
this.cb_close,&
this.cb_start,&
this.st_3,&
this.gb_1,&
this.gb_2}
end on

on w_dynamic_create.destroy
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_item)
destroy(this.st_msg)
destroy(this.cb_close)
destroy(this.cb_start)
destroy(this.st_3)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_1 from commandbutton within w_dynamic_create
integer x = 1618
integer y = 224
integer width = 329
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Reset"
end type

event clicked;st_msg.Text = ""
end event

type st_2 from statictext within w_dynamic_create
integer x = 137
integer y = 396
integer width = 1271
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Object n_cst_manager herited from n_cst_personal"
boolean focusrectangle = false
end type

type st_1 from statictext within w_dynamic_create
integer x = 137
integer y = 324
integer width = 1257
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Object n_cst_employee inherited from n_cst_personal"
boolean focusrectangle = false
end type

type ddlb_item from dropdownlistbox within w_dynamic_create
integer x = 137
integer y = 224
integer width = 1157
integer height = 324
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string item[] = {"n_cst_personal","n_cst_employee","n_cst_manager"}
borderstyle borderstyle = stylelowered!
end type

type st_msg from statictext within w_dynamic_create
integer x = 137
integer y = 700
integer width = 1934
integer height = 348
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_dynamic_create
integer x = 1618
integer y = 328
integer width = 329
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

on clicked;close (parent)
end on

type cb_start from commandbutton within w_dynamic_create
integer x = 1618
integer y = 120
integer width = 329
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "C&reate"
end type

event clicked;n_cst_personal		lnvo_personal
String				ls_object

ls_object = ddlb_item.Text
st_msg.Text = ""

Choose	Case Lower(ls_object)
	Case	"n_cst_personal","n_cst_employee","n_cst_manager"
		//dynamic create object
		lnvo_personal = create using ls_object	
	
	Case Else
		Messagebox(Parent.Title,"Please select one valid object!")
		Return
End Choose
		
//display instance object information
If isValid(lnvo_personal) Then
	st_msg.text = "Create object " + String(lnvo_personal.ClassName()) + " successful."
Else
	st_msg.text = "Create object " + ls_object + " failed."
End If

//destroy instance
If isValid(lnvo_personal) Then
	Destroy lnvo_personal
End If


end event

type st_3 from statictext within w_dynamic_create
integer x = 133
integer y = 136
integer width = 1257
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Select objects and press button to dynamic create "
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_dynamic_create
integer x = 50
integer y = 604
integer width = 2112
integer height = 480
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Object Message"
end type

type gb_2 from groupbox within w_dynamic_create
integer x = 50
integer y = 20
integer width = 2112
integer height = 548
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Object"
end type

