$PBExportHeader$w_choose_color.srw
$PBExportComments$Choose Color from color datawindow
forward
global type w_choose_color from window
end type
type cb_3 from commandbutton within w_choose_color
end type
type cb_2 from commandbutton within w_choose_color
end type
type cb_1 from commandbutton within w_choose_color
end type
type dw_1 from datawindow within w_choose_color
end type
type gb_1 from groupbox within w_choose_color
end type
end forward

global type w_choose_color from window
integer width = 1266
integer height = 1068
boolean titlebar = true
string title = "Choose Color"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event type integer ue_colorchanged ( long al_newcolor )
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_choose_color w_choose_color

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
Private:
String  is_OrgColor
Integer   ii_Red,ii_Green,ii_Blue
Long  il_SelectedColor = -1

end variables

forward prototypes
public function integer of_parsecolor (long al_srccolor)
end prototypes

event type integer ue_colorchanged(long al_newcolor);//====================================================================
// Event: ue_colorchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	al_newcolor		
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
il_SelectedColor = al_NewColor

Return 1

end event

public function integer of_parsecolor (long al_srccolor);//====================================================================
// Function: of_parsecolor()
//--------------------------------------------------------------------
// Description: Parse a long color value to Red,Green,Blue
//--------------------------------------------------------------------
// Arguments: 
//		long	al_srccolor		
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

//White:RGB(255,255,255)=16777215,65536 * Blue+ 256 * Green+ Red

If al_SrcColor > 16777215  Or al_SrcColor < 0 Then
	Return -1
End If
ii_blue = Truncate(al_SrcColor / 65536,0)
ii_green = Truncate((al_SrcColor - ii_blue*65536)/256,0)
ii_red = al_SrcColor - ii_blue*65536 - ii_green * 256

Return 1

end function

on w_choose_color.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_choose_color.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type cb_3 from commandbutton within w_choose_color
integer x = 82
integer y = 860
integer width = 325
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas"
end type

event clicked;dw_1.saveas( )
end event

type cb_2 from commandbutton within w_choose_color
integer x = 887
integer y = 856
integer width = 325
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
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
CloseWithReturn(Parent,'cancel')


end event

type cb_1 from commandbutton within w_choose_color
integer x = 526
integer y = 856
integer width = 325
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
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
If il_SelectedColor < 0 Then
	MessageBox("Alert","Please select a color.")
	Return
End If

CloseWithReturn(Parent,String(il_SelectedColor))


end event

type dw_1 from datawindow within w_choose_color
integer x = 64
integer y = 60
integer width = 1120
integer height = 748
integer taborder = 10
string title = "none"
string dataobject = "d_colors_panel"
boolean border = false
boolean livescroll = true
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer 	xpos		
//		integer 	ypos		
//		long    	row 		
//		dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnlbuttonclk]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String  ls_Name,ls_Tag
Long  ll_Color
Int  li_Ret

ls_Name = dwo.Name

If This.Describe(ls_Name+'.type') <> 'text' Then Return
ls_Tag = This.Describe(ls_Name+".tag")
If ls_Tag = '' Or ls_Tag = '?' Or ls_Tag = '!'Then Return

If ls_Name = 't_transparent' Then
	ll_Color = 553648127 //Transparent
Else
	ll_Color = Long(This.Describe(ls_Name+".background.color"))
End If


If dwo.Name <> is_OrgColor Then
	This.Modify(is_OrgColor+".border=2")
	is_OrgColor = ls_Name
	This.Modify(ls_Name+".border=5")
	This.Modify("t_colorname.text = '"+ls_Tag+"'")
	This.Modify("t_50.background.color = "+String(ll_Color))
	of_parsecolor(ll_Color)
	If li_Ret < 0 Then
		This.SetItem(1,'red','')
		This.SetItem(1,'Green','')
		This.SetItem(1,'Blue','')
	Else
		This.SetItem(1,'red',String(ii_Red))
		This.SetItem(1,'Green',String(ii_Green))
		This.SetItem(1,'Blue',String(ii_Blue))
	End If
End If


Parent.Event ue_ColorChanged(ll_Color)

end event

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer 	xpos		
//		integer 	ypos		
//		long    	row 		
//		dwobject	dwo 		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnlbuttondblclk]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String  ls_Name,ls_Tag
Long  ll_Color
Int  li_Ret

ls_Name = dwo.Name

If This.Describe(ls_Name+'.type') <> 'text' Then Return
ls_Tag = This.Describe(ls_Name+".tag")
If ls_Tag = '' Or ls_Tag = '?' Or ls_Tag = '!'Then Return

cb_1.Post Event Clicked()


end event

type gb_1 from groupbox within w_choose_color
integer x = 37
integer width = 1175
integer height = 824
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

