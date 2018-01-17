$PBExportHeader$w_customize_dw.srw
$PBExportComments$Window to customize a datawindow using describe/modify and direct object reference syntax
forward
global type w_customize_dw from window
end type
type cb_4 from commandbutton within w_customize_dw
end type
type cb_3 from commandbutton within w_customize_dw
end type
type cb_2 from commandbutton within w_customize_dw
end type
type cb_1 from commandbutton within w_customize_dw
end type
type st_5 from statictext within w_customize_dw
end type
type sle_command from singlelineedit within w_customize_dw
end type
type st_14 from statictext within w_customize_dw
end type
type lb_objects from listbox within w_customize_dw
end type
type lb_attributes from listbox within w_customize_dw
end type
type lb_attrib_val from listbox within w_customize_dw
end type
type st_val_header from statictext within w_customize_dw
end type
type st_header from statictext within w_customize_dw
end type
type st_16 from statictext within w_customize_dw
end type
type cb_apply from commandbutton within w_customize_dw
end type
type cb_close from commandbutton within w_customize_dw
end type
type dw_1 from datawindow within w_customize_dw
end type
end forward

shared variables

end variables

global type w_customize_dw from window
integer x = 87
integer y = 4
integer width = 2510
integer height = 1836
boolean titlebar = true
string title = "Modify and Describe"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_5 st_5
sle_command sle_command
st_14 st_14
lb_objects lb_objects
lb_attributes lb_attributes
lb_attrib_val lb_attrib_val
st_val_header st_val_header
st_header st_header
st_16 st_16
cb_apply cb_apply
cb_close cb_close
dw_1 dw_1
end type
global w_customize_dw w_customize_dw

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
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
String   is_object_name
String   is_text_attr[]
String   is_column_attr[]

// determines if we are currently selecting a column or text
Boolean   ib_column

end variables

forward prototypes
protected subroutine of_fill_attributes (string as_attribute, string as_val)
end prototypes

protected subroutine of_fill_attributes (string as_attribute, string as_val);//====================================================================
// Function: of_fill_attributes()
//--------------------------------------------------------------------
// Description: populates the attribute values listbox with the correct
//				values based on the attribute name that is passed.
//				Selects the item in the listbox with text equal to as_val
//--------------------------------------------------------------------
// Arguments: 
//		string	as_attribute		
//		string	as_val      		
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
lb_attrib_val.Reset()

Choose Case as_attribute

	Case 'border'
		lb_attrib_val.AddItem ('0 - None')
		//lb_attrib_val.AddItem ('1 - Shadow')
		lb_attrib_val.AddItem ('2 - Rectangle')
		//lb_attrib_val.AddItem ('3 - Resize')
		//lb_attrib_val.AddItem ('4 - Line')
		lb_attrib_val.AddItem ('5 - 3D Lowered')
		lb_attrib_val.AddItem ('6 - 3D Raised')
		
	Case 'alignment'
		lb_attrib_val.AddItem ('0 - Left')
		lb_attrib_val.AddItem ('1 - Right')
		lb_attrib_val.AddItem ('2 - Center')
		
	Case 'font.italic', 'font.underline', 'visible', 'font.strikethrough', &
		'moveable', 'resizeable'
	lb_attrib_val.AddItem ('0 - False (No)')
	lb_attrib_val.AddItem ('1 - True (Yes)')
	
Case 'font.family'
	lb_attrib_val.AddItem ('0 - AnyFont')
	lb_attrib_val.AddItem ('1 - Roman')
	lb_attrib_val.AddItem ('2 - Swiss')
	lb_attrib_val.AddItem ('3 - Modern')
	lb_attrib_val.AddItem ('4 - Script')
	lb_attrib_val.AddItem ('5 - Decorative')
	
Case 'font.pitch'
	lb_attrib_val.AddItem ('0 - System default')
	lb_attrib_val.AddItem ('1 - Fixed')
	lb_attrib_val.AddItem ('2 - Variable')
	
	
End Choose

lb_attrib_val.SelectItem (as_val, 0)


//====================================================================
// Function: of_fill_attributes()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_attribute		
//		string	as_val      		
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
//====================================================================
// Function: of_fill_attributes()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_attribute		
//		string	as_val      		
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

end subroutine

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String	ls_Names

This.X = 0
This.Y = 0

// Retrieve Data into the Main Data Window
dw_1.SetTransObject (sqlca)
dw_1.Retrieve()

// Populate listboxes on first tab
// Get list and number of columns from the datawindow
ls_Names = dw_1.Describe ("datawindow.objects")

// Get each object from the list and add it to the objects listbox
Do
	is_object_name = f_get_token (ls_Names, "~t")
	lb_objects.AddItem (is_object_name)
Loop Until ls_Names = ""

// Initialize attributes for column object type
is_column_attr[1]  = "height"
is_column_attr[2]  = "width"
is_column_attr[3]  = "border"
is_column_attr[4]  = "alignment"
is_column_attr[5]  = "background.color"
is_column_attr[6]  = "color"
is_column_attr[7]  = "font.face"
is_column_attr[8]  = "font.height"
is_column_attr[9]  = "font.italic"
is_column_attr[10]  = "font.underline"
is_column_attr[11]  = "font.weight"
is_column_attr[12]  = "visible"
is_column_attr[13] = "x"
//is_column_attr[12]  = "format"
//is_column_attr[15] = "font.family"
//is_column_attr[16] = "font.pitch"
//is_column_attr[17] = "font.strikethrough"
//is_column_attr[18] = "moveable"
//is_column_attr[19] = "resizeable"
//is_column_attr[20] = "tabsequence"
is_column_attr[14] = "y"

// Initialize attributes for text object type
is_text_attr[1]  = "height"
is_text_attr[2]  = "width"
is_text_attr[3]  = "border"
is_text_attr[4]  = "alignment"
is_text_attr[5]  = "background.color"
is_text_attr[6]  = "color"
is_text_attr[7]  = "font.face"
is_text_attr[8]  = "font.height"
is_text_attr[9]  = "font.italic"
is_text_attr[10]  = "font.underline"
is_text_attr[11]  = "font.weight"
is_text_attr[12]  = "text"
is_text_attr[13]  = "visible"
is_text_attr[14] = "x"
//is_text_attr[15] = "font.family"
//is_text_attr[16] = "font.pitch"
//is_text_attr[17] = "font.strikethrough"
//is_text_attr[18] = "moveable"
//is_text_attr[19] = "resizeable"
is_text_attr[15] = "y"

// Now select the first object
lb_objects.SelectItem (1)
is_object_name = lb_objects.SelectedItem()
lb_objects.TriggerEvent (SelectionChanged!)

// Put pointer within SLE_COMMAND
sle_command.SetFocus()


end event

on w_customize_dw.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_5=create st_5
this.sle_command=create sle_command
this.st_14=create st_14
this.lb_objects=create lb_objects
this.lb_attributes=create lb_attributes
this.lb_attrib_val=create lb_attrib_val
this.st_val_header=create st_val_header
this.st_header=create st_header
this.st_16=create st_16
this.cb_apply=create cb_apply
this.cb_close=create cb_close
this.dw_1=create dw_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.st_5,&
this.sle_command,&
this.st_14,&
this.lb_objects,&
this.lb_attributes,&
this.lb_attrib_val,&
this.st_val_header,&
this.st_header,&
this.st_16,&
this.cb_apply,&
this.cb_close,&
this.dw_1}
end on

on w_customize_dw.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_5)
destroy(this.sle_command)
destroy(this.st_14)
destroy(this.lb_objects)
destroy(this.lb_attributes)
destroy(this.lb_attrib_val)
destroy(this.st_val_header)
destroy(this.st_header)
destroy(this.st_16)
destroy(this.cb_apply)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type cb_4 from commandbutton within w_customize_dw
integer x = 2062
integer y = 948
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Saveas"
end type

event clicked;dw_1.saveas( )
end event

type cb_3 from commandbutton within w_customize_dw
integer x = 1102
integer y = 1600
integer width = 544
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Evaluating Expressions"
end type

event clicked;dw_1.modify("Salary.Color='255 ~t if( salary < median(  salary  for all ),255,0)' ")
dw_1.retrieve()

end event

type cb_2 from commandbutton within w_customize_dw
integer x = 640
integer y = 1600
integer width = 439
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Evaluating a Row"
end type

event clicked;string ls_evaluate

ls_evaluate = dw_1.Describe("evaluate('max(salary)',1)")
messagebox('Maximum value of salary',ls_evaluate)
end event

type cb_1 from commandbutton within w_customize_dw
integer x = 37
integer y = 1600
integer width = 581
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get DataWindow Data"
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
String ls_syntax

ls_syntax = dw_1.Describe("datawindow.syntax.data")
MessageBox("DataWindow Data",ls_syntax)

end event

type st_5 from statictext within w_customize_dw
integer x = 1943
integer y = 952
integer width = 64
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
string text = ")"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type sle_command from singlelineedit within w_customize_dw
integer x = 265
integer y = 944
integer width = 1664
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_14 from statictext within w_customize_dw
integer x = 50
integer y = 956
integer width = 206
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Modify: ("
alignment alignment = right!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type lb_objects from listbox within w_customize_dw
integer x = 37
integer y = 116
integer width = 773
integer height = 792
integer taborder = 91
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

// Build Modify syntax based on the object selected.

// Depending on the type of object select (text or column), populate
// the attributes listbox with valid choices.

Integer	li_Cnt, li_Text, li_Col
Long		ll_Gray


// Get the dark grey RGB value
//ll_Gray = RGB (128, 128, 128)


// Get the selected object and begin building Modify syntax
is_object_name = This.SelectedItem()
sle_command.Text = "~"" + is_object_name + "=~""

// Depending on the type of datawindow object, show the appropriate
// list of attributes.

If dw_1.Describe (is_object_name + ".type") = "text" Then
	// If column attributes are being displayed, display text attributes
	If ib_Column Then
		lb_attributes.Reset()
		
		li_Text = UpperBound(is_text_attr)
		For li_Cnt = 1 To li_Text
			lb_attributes.AddItem(is_text_attr[li_Cnt])
		Next
		
		//st_header.Text = 'DW Text attributes'
		ib_Column = False
		
	Else
		// Deselect attributes
		lb_attributes.SelectItem (0)
	End If
Else
	// If column attributes are not being displayed, display them
	If Not ib_Column Then
		lb_attributes.Reset()
		
		
		li_Col = UpperBound(is_column_attr)
		For li_Cnt = 1 To li_Col
			lb_attributes.AddItem (is_column_attr[li_Cnt])
		Next
		
		//st_header.Text = 'DW Column attributes'
		ib_Column = True
	Else
		// Deselect attributes
		lb_attributes.SelectItem (0)
	End If
End If

// Reset the attribute values listbox
lb_attrib_val.Reset()
//st_val_header.Text = 'Attribute values'
st_val_header.TextColor = ll_Gray
lb_attrib_val.Enabled = False


end event

type lb_attributes from listbox within w_customize_dw
integer x = 837
integer y = 116
integer width = 773
integer height = 792
integer taborder = 92
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

// Once an attribute has been selected, get the value of the attribute
// from the datawindow and build the rest of the Modify syntax.

String	ls_Attr, ls_Value
Long		ll_Gray
Integer	li_Pos


// Get the RGB value for dark gray
//ll_Gray = RGB (128, 128, 128)

ls_Attr = This.SelectedItem()
ls_Value = dw_1.Describe (is_object_name + "." + ls_Attr)


// Populate attribute values listbox
of_fill_attributes (ls_Attr, ls_Value)
If lb_attrib_val.TotalItems() > 0 Then
	//st_val_header.Text = ls_attr + ' values'
	st_val_header.TextColor = st_header.TextColor
	lb_attrib_val.Enabled = True
Else
	//st_val_header.Text = 'Attribute values'
	st_val_header.TextColor = ll_Gray
	lb_attrib_val.Enabled = False
End If

//////////////////////////////////////////////////////////////////////
// We now have complete syntax in the SLE. It's ready to modify and
// execute, by hitting the Apply button.
//////////////////////////////////////////////////////////////////////

// If the attribute selected is moveable or resizeable, the Modify
// syntax after the equal sign does not need quotes
If ls_Attr = 'moveable' Or ls_Attr = 'resizeable'  Or ls_Attr = 'color' Then
	sle_command.Text = is_object_name + "." + ls_Attr + '=' + ls_Value
Else
	sle_command.Text = is_object_name + "." + ls_Attr + '="' + ls_Value + '"'
End If

// If attribute values listbox contains values, select the value portion
// of the Modify syntax to make it easy for the user to paste a selection
// from the values listbox

If lb_attrib_val.TotalItems() > 0 Then
	sle_command.SetFocus()
	li_Pos = PosA (sle_command.Text, '"')
	If li_Pos = 0 Then
		li_Pos = PosA (sle_command.Text, '=')
	End If
	If li_Pos > 0 Then
		sle_command.SelectText (li_Pos + 1, 1)
	End If
End If


end event

type lb_attrib_val from listbox within w_customize_dw
integer x = 1641
integer y = 116
integer width = 773
integer height = 792
integer taborder = 91
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 73955432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

// If there is text selected in the dwModify syntax, replace it with
// the new selection from the user

Integer	li_Length, li_Pos

li_Length = sle_command.SelectedLength()
If li_Length > 0 Then
	sle_command.ReplaceText(LeftA(This.SelectedItem(), 1))
	
	// Text has been replaced, set focus back to the single line edit
	// and reselect the attribute value.
	sle_command.SetFocus()
	li_Pos = PosA(sle_command.Text, '"', 1)
	If li_Pos = 0 Then
		li_Pos = PosA(sle_command.Text, '=', 1)
	End If
	sle_command.SelectText (li_Pos + 1, 1)
End If


end event

type st_val_header from statictext within w_customize_dw
integer x = 1641
integer y = 44
integer width = 562
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long backcolor = 73955432
string text = "Attribute Values"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_header from statictext within w_customize_dw
integer x = 837
integer y = 44
integer width = 594
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long backcolor = 73955432
string text = "Object Attributes"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_16 from statictext within w_customize_dw
integer x = 37
integer y = 44
integer width = 581
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long backcolor = 73955432
string text = "DataWindow Objects"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type cb_apply from commandbutton within w_customize_dw
integer x = 1691
integer y = 1600
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Apply"
boolean default = true
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
String	ls_Err,ls_Syn
// Execute the dwModify syntax in the single line edit
ls_Err = dw_1.Modify (sle_command.Text)

If LenA (ls_Err) > 0 Then
	MessageBox ("Modify failed", ls_Err)
End If


end event

type cb_close from commandbutton within w_customize_dw
integer x = 2057
integer y = 1600
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
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
CLOSE (Parent)

end event

type dw_1 from datawindow within w_customize_dw
integer x = 37
integer y = 1064
integer width = 2373
integer height = 488
integer taborder = 20
string dataobject = "d_emp_for_modify"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

