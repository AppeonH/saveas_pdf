$PBExportHeader$w_datawindow_event.srw
forward
global type w_datawindow_event from window
end type
type cb_8 from commandbutton within w_datawindow_event
end type
type cb_7 from commandbutton within w_datawindow_event
end type
type st_1 from statictext within w_datawindow_event
end type
type gb_7 from groupbox within w_datawindow_event
end type
type cb_6 from commandbutton within w_datawindow_event
end type
type cb_5 from commandbutton within w_datawindow_event
end type
type cb_4 from commandbutton within w_datawindow_event
end type
type cb_3 from commandbutton within w_datawindow_event
end type
type gb_6 from groupbox within w_datawindow_event
end type
type lb_2 from listbox within w_datawindow_event
end type
type gb_5 from groupbox within w_datawindow_event
end type
type gb_4 from groupbox within w_datawindow_event
end type
type cb_2 from commandbutton within w_datawindow_event
end type
type cb_1 from commandbutton within w_datawindow_event
end type
type dw_1 from datawindow within w_datawindow_event
end type
type lb_1 from listbox within w_datawindow_event
end type
type lb_3 from listbox within w_datawindow_event
end type
type gb_1 from groupbox within w_datawindow_event
end type
type gb_3 from groupbox within w_datawindow_event
end type
type mle_1 from multilineedit within w_datawindow_event
end type
end forward

global type w_datawindow_event from window
integer width = 2592
integer height = 1904
boolean titlebar = true
string title = "TabOrder and Required Property"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event afc_addrow ( )
event afc_insertrow ( )
event afc_deleterow ( )
event afc_update ( )
event afc_retrieve ( )
event ue_keydown pbm_keydown
event ue_contextmenu pbm_contextmenu
event ue_lbuttondown pbm_lbuttondown
event ue_lbuttonup pbm_lbuttonup
event ue_rbuttondown pbm_rbuttondown
event ue_rbuttonup pbm_rbuttonup
cb_8 cb_8
cb_7 cb_7
st_1 st_1
gb_7 gb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
gb_6 gb_6
lb_2 lb_2
gb_5 gb_5
gb_4 gb_4
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
lb_1 lb_1
lb_3 lb_3
gb_1 gb_1
gb_3 gb_3
mle_1 mle_1
end type
global w_datawindow_event w_datawindow_event

forward prototypes
public function integer wf_checkrequired ()
public function integer wf_addoutput (string as_event)
public function integer wf_addoutput (string as_type, string as_item, string as_taborder, string as_property)
end prototypes

event afc_addrow();//====================================================================
// Event: afc_addrow()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long row

row = dw_1.InsertRow(0)
dw_1.ScrollToRow(row)

end event

event afc_insertrow();//====================================================================
// Event: afc_insertrow()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long row

row = dw_1.InsertRow(dw_1.GetRow())
dw_1.ScrollToRow(row)


end event

event afc_deleterow();//====================================================================
// Event: afc_deleterow()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
dw_1.DeleteRow(dw_1.GetRow())

end event

event afc_update();//====================================================================
// Event: afc_update()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

If dw_1.UPDATE() = 1 Then
	MessageBox("Appeon","Update Success!")
	COMMIT Using sqlca;
Else
	MessageBox("Appeon","Update Failed!")
	ROLLBACK Using sqlca;
End If

end event

event afc_retrieve();//====================================================================
// Event: afc_retrieve()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

dw_1.Retrieve()

end event

event ue_keydown;//====================================================================
// Event: ue_keydown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		keycode     	key     		
//		unsignedlong	keyflags		
//--------------------------------------------------------------------
// Returns: long [pbm_keydown]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
wf_addoutput("key down ")


end event

event ue_contextmenu;//====================================================================
// Event: ue_contextmenu()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	xpos		
//		integer	ypos		
//--------------------------------------------------------------------
// Returns: long [pbm_contextmenu]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
wf_addoutput("pbm_contextmenu")

end event

event ue_lbuttondown;//====================================================================
// Event: ue_lbuttondown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		unsignedlong	flags		
//		integer     	xpos 		
//		integer     	ypos 		
//--------------------------------------------------------------------
// Returns: long [pbm_lbuttondown]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
wf_addoutput("pbm_lbuttondown")

end event

event ue_lbuttonup;//====================================================================
// Event: ue_lbuttonup()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		unsignedlong	flags		
//		integer     	xpos 		
//		integer     	ypos 		
//--------------------------------------------------------------------
// Returns: long [pbm_lbuttonup]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
wf_addoutput("pbm_lbuttonup")

end event

event ue_rbuttondown;//====================================================================
// Event: ue_rbuttondown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		unsignedlong	flags		
//		integer     	xpos 		
//		integer     	ypos 		
//--------------------------------------------------------------------
// Returns: long [pbm_rbuttondown]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
wf_addoutput("pbm_rbuttondown")

end event

event ue_rbuttonup;//====================================================================
// Event: ue_rbuttonup()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		unsignedlong	flags		
//		integer     	xpos 		
//		integer     	ypos 		
//--------------------------------------------------------------------
// Returns: long [pbm_rbuttonup]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
wf_addoutput("pbm_rbuttonup")

end event

public function integer wf_checkrequired ();//====================================================================
// Function: wf_checkrequired()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer	li_checkcolumn = 1
Integer	li_rc
Long		ll_checkrow = 1
String	ls_checkcolname = ""
Boolean	lb_updateonly = True
dw_1.FindRequired(primary!, ll_checkrow, li_checkcolumn, ls_checkcolname, lb_updateonly)

MessageBox(ls_checkcolname,ll_checkrow)

Return 1

end function

public function integer wf_addoutput (string as_event);//====================================================================
// Function: wf_addoutput()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_event		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_event

ls_event = "The "+as_event+" event has been triggered."

If mle_1.Text = "" Then
	mle_1.Text = ls_event
Else
	mle_1.Text += "~r~n"+ls_event
End If

Return 1

end function

public function integer wf_addoutput (string as_type, string as_item, string as_taborder, string as_property);//====================================================================
// Function: wf_addoutput()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_type    		
//		string	as_item    		
//		string	as_taborder		
//		string	as_property		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_comment

If as_type = 'set' Then
	ls_comment = "The column "+as_item+"'s "+as_property+" property is set to "+as_taborder+"."
	If mle_1.Text = "" Then
		mle_1.Text = ls_comment
	Else
		mle_1.Text+= "~r~n"+ls_comment
	End If
Else
	ls_comment = "The column "+as_item+"'s "+as_property+"property is "+as_taborder+"."
	If mle_1.Text = "" Then
		mle_1.Text = ls_comment
	Else
		mle_1.Text+= "~r~n"+ls_comment
	End If
End If

Return 1

end function

on w_datawindow_event.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.st_1=create st_1
this.gb_7=create gb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.gb_6=create gb_6
this.lb_2=create lb_2
this.gb_5=create gb_5
this.gb_4=create gb_4
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.lb_1=create lb_1
this.lb_3=create lb_3
this.gb_1=create gb_1
this.gb_3=create gb_3
this.mle_1=create mle_1
this.Control[]={this.cb_8,&
this.cb_7,&
this.st_1,&
this.gb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.gb_6,&
this.lb_2,&
this.gb_5,&
this.gb_4,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.lb_1,&
this.lb_3,&
this.gb_1,&
this.gb_3,&
this.mle_1}
end on

on w_datawindow_event.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.st_1)
destroy(this.gb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.gb_6)
destroy(this.lb_2)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.lb_1)
destroy(this.lb_3)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.mle_1)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.X = 0
This.Y = 0

dw_1.SetTransObject(sqlca)
end event

type cb_8 from commandbutton within w_datawindow_event
integer x = 2094
integer y = 1364
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas( )
end event

type cb_7 from commandbutton within w_datawindow_event
integer x = 2075
integer y = 920
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Find Required"
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
Long ll_row = 1
Integer colnbr = 0
String colname,ls_message

Do While ll_row <> 0
	colnbr++
	If dw_1.FindRequired(Primary!, ll_row, colnbr,colname, False) < 0 Then Exit
	If ll_row <> 0 Then
		ls_message = "Row Number   : "+String(ll_row) + "~r~nColumn Name  : " + colname + "~r~n"
		MessageBox("Find Required",ls_message)
		Exit
	End If
Loop

end event

type st_1 from statictext within w_datawindow_event
integer x = 64
integer y = 40
integer width = 2368
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "You can right click on the DataWindow and manipulate the DataWindow data with the popup menu: "
boolean focusrectangle = false
end type

type gb_7 from groupbox within w_datawindow_event
integer x = 1161
integer y = 868
integer width = 489
integer height = 408
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Required Value"
end type

type cb_6 from commandbutton within w_datawindow_event
integer x = 2075
integer y = 1036
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set Required"
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
If lb_1.SelectedItem() = "" Then
	MessageBox("Appeon","Please select Column!")
	Return
End If

If lb_3.SelectedItem() = "" Then
	MessageBox("Appeon","Please select data!")
	Return
End If

String ls_set
ls_set = lb_3.SelectedItem()

Choose Case lb_1.SelectedItem()
	Case 'Customer ID'
		dw_1.Object.id.Edit.Required = ls_set
	Case 'First Name'
		dw_1.Object.first_name.Edit.Required = ls_set
	Case 'Last Name'
		dw_1.Object.last_name.Edit.Required = ls_set
	Case 'Address'
		dw_1.Object.Address.Edit.Required = ls_set
	Case 'City'
		dw_1.Object.city.Edit.Required = ls_set
	Case 'State'
		dw_1.Object.State.dddw.Required = ls_set
	Case 'ZIP'
		dw_1.Object.zip.Edit.Required = ls_set
	Case 'Phone'
		dw_1.Object.phone.EditMask.Required = ls_set
	Case 'Company Name'
		dw_1.Object.company_name.Edit.Required = ls_set
End Choose

wf_addoutput('set',lb_1.SelectedItem(),ls_set,"Required")


end event

type cb_5 from commandbutton within w_datawindow_event
integer x = 2075
integer y = 1152
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get Required"
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
If lb_1.SelectedItem() = "" Then
	MessageBox("Appeon","Please select Column!")
	Return
End If

String ls_return

Choose Case lb_1.SelectedItem()
	Case 'Customer ID'
		ls_return = dw_1.Describe("id.Edit.Required")
	Case 'First Name'
		ls_return = dw_1.Describe("first_name.Edit.Required")
	Case 'Last Name'
		ls_return = dw_1.Describe("last_name.Edit.Required")
	Case 'Address'
		ls_return = dw_1.Describe("address.Edit.Required")
	Case 'City'
		ls_return = dw_1.Describe("city.Edit.Required")
	Case 'State'
		ls_return = dw_1.Describe("state.dddw.Required")
	Case 'ZIP'
		ls_return = dw_1.Describe("zip.Edit.Required")
	Case 'Phone'
		ls_return = dw_1.Describe("phone.EditMask.Required")
	Case 'Company Name'
		ls_return = dw_1.Describe("company_name.Edit.Required")
End Choose

wf_addoutput('get',lb_1.SelectedItem(),ls_return,"Required")

end event

type cb_4 from commandbutton within w_datawindow_event
integer x = 1714
integer y = 1152
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get TabOrder"
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

If lb_1.SelectedItem() = "" Then
	MessageBox("Appeon","Please select Column!")
	Return
End If

String ls_return

Choose Case lb_1.SelectedItem()
	Case 'Customer ID'
		ls_return = dw_1.Describe("id.TabSequence")
	Case 'First Name'
		ls_return = dw_1.Describe("first_name.TabSequence")
	Case 'Last Name'
		ls_return = dw_1.Describe("last_name.TabSequence")
	Case 'Address'
		ls_return = dw_1.Describe("address.TabSequence")
	Case 'City'
		ls_return = dw_1.Describe("city.TabSequence")
	Case 'State'
		ls_return = dw_1.Describe("state.TabSequence")
	Case 'ZIP'
		ls_return = dw_1.Describe("zip.TabSequence")
	Case 'Phone'
		ls_return = dw_1.Describe("phone.TabSequence")
	Case 'Company Name'
		ls_return = dw_1.Describe("company_name.TabSequence")
End Choose

wf_addoutput('get',lb_1.SelectedItem(),ls_return,"TabOrder")

end event

type cb_3 from commandbutton within w_datawindow_event
integer x = 1714
integer y = 1036
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set TabOrder"
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
If lb_1.SelectedItem() = "" Then
	MessageBox("Alert","Please select a column name.")
	Return
End If

If lb_2.SelectedItem() = "" Then
	MessageBox("Alert","Please select a TabOrder value.")
	Return
End If

Long ll_tab

ll_tab = Long(lb_2.SelectedItem())

Choose Case lb_1.SelectedItem()
	Case 'Customer ID'
		dw_1.SetTabOrder(1,ll_tab)
	Case 'First Name'
		dw_1.SetTabOrder(2,ll_tab)
	Case 'Last Name'
		dw_1.SetTabOrder(3,ll_tab)
	Case 'Address'
		dw_1.SetTabOrder(4,ll_tab)
	Case 'City'
		dw_1.SetTabOrder(5,ll_tab)
	Case 'State'
		dw_1.SetTabOrder(6,ll_tab)
	Case 'ZIP'
		dw_1.SetTabOrder(7,ll_tab)
	Case 'Phone'
		dw_1.SetTabOrder(8,ll_tab)
	Case 'Company Name'
		dw_1.SetTabOrder(9,ll_tab)
End Choose

wf_addoutput('Set',lb_1.SelectedItem(),lb_2.SelectedItem(),"TabOrder")


end event

type gb_6 from groupbox within w_datawindow_event
integer x = 1682
integer y = 868
integer width = 768
integer height = 408
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Execute"
end type

type lb_2 from listbox within w_datawindow_event
integer x = 690
integer y = 928
integer width = 402
integer height = 316
integer taborder = 40
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

event constructor;//====================================================================
// Event: constructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_constructor]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.AddItem("0")
This.AddItem("10")
This.AddItem("20")
This.AddItem("30")
This.AddItem("40")
This.AddItem("50")
This.AddItem("60")
This.AddItem("70")
This.AddItem("80")
This.AddItem("90")

end event

type gb_5 from groupbox within w_datawindow_event
integer x = 654
integer y = 868
integer width = 475
integer height = 408
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "TabOrder Value"
end type

type gb_4 from groupbox within w_datawindow_event
integer x = 105
integer y = 868
integer width = 521
integer height = 408
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Column"
end type

type cb_2 from commandbutton within w_datawindow_event
integer x = 2103
integer y = 1508
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear"
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
mle_1.Text = ""

end event

type cb_1 from commandbutton within w_datawindow_event
integer x = 2103
integer y = 1616
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
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
CLOSE(Parent)

end event

type dw_1 from datawindow within w_datawindow_event
event ue_dropdown pbm_activate
event ue_enter pbm_dwnprocessenter
event ue_rbuttondown pbm_dwnrbuttondown
integer x = 55
integer y = 120
integer width = 2441
integer height = 664
integer taborder = 10
string title = "none"
string dataobject = "d_cust"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_dropdown;//====================================================================
// Event: ue_dropdown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_activate]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
wf_addoutput("pbm_dwndropdown")

end event

event ue_enter;//====================================================================
// Event: ue_enter()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnprocessenter]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
wf_addoutput("pbm_dwnprocessenter")

end event

event ue_rbuttondown;//====================================================================
// Event: ue_rbuttondown()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer 	xpos		
//		integer 	ypos		
//		long    	row 		
//		dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrbuttondown]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//wf_addoutput("pbm_dwnrbuttondown")

m_popumenu m_popup

m_popup = Create m_popumenu

m_popup.PopMenu(w_main_frame.mdi_1.X+Parent.X+Parent.PointerX() +20,w_main_frame.mdi_1.Y+Parent.Y+Parent.PointerY()+100)




end event

event constructor;//====================================================================
// Event: constructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_constructor]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
wf_addoutput("constructor")

end event

type lb_1 from listbox within w_datawindow_event
integer x = 133
integer y = 928
integer width = 462
integer height = 316
integer taborder = 30
boolean bringtotop = true
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

event constructor;//====================================================================
// Event: constructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_constructor]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.AddItem("Customer ID")
This.AddItem("First Name")
This.AddItem("Last Name")
This.AddItem("Address")
This.AddItem("City")
This.AddItem("State")
This.AddItem("ZIP")
This.AddItem("Phone")
This.AddItem("Company Name")

end event

type lb_3 from listbox within w_datawindow_event
integer x = 1198
integer y = 928
integer width = 416
integer height = 316
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event constructor;//====================================================================
// Event: constructor()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_constructor]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.AddItem('Yes')
This.AddItem('No')

end event

type gb_1 from groupbox within w_datawindow_event
integer x = 105
integer y = 1292
integer width = 1961
integer height = 416
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Execution Result"
end type

type gb_3 from groupbox within w_datawindow_event
integer x = 50
integer y = 804
integer width = 2446
integer height = 948
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Set or Get TabOrder/Required Property"
end type

type mle_1 from multilineedit within w_datawindow_event
integer x = 151
integer y = 1352
integer width = 1870
integer height = 324
integer taborder = 20
boolean bringtotop = true
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

