$PBExportHeader$w_openuo_new.srw
$PBExportComments$OpenUserObject,OpenUserObjectWithParm,CloseUserObject Function test.
forward
global type w_openuo_new from window
end type
type lb_1 from listbox within w_openuo_new
end type
type sle_1 from singlelineedit within w_openuo_new
end type
type cb_4 from commandbutton within w_openuo_new
end type
type cb_3 from commandbutton within w_openuo_new
end type
type cb_2 from commandbutton within w_openuo_new
end type
type st_1 from statictext within w_openuo_new
end type
type cb_1 from commandbutton within w_openuo_new
end type
type gb_1 from groupbox within w_openuo_new
end type
end forward

global type w_openuo_new from window
integer width = 2560
integer height = 1540
boolean titlebar = true
string title = "Dynamic User Objects"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
lb_1 lb_1
sle_1 sle_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
st_1 st_1
cb_1 cb_1
gb_1 gb_1
end type
global w_openuo_new w_openuo_new

type variables
DragObject u_to_open[]
Integer Ii_Count
end variables

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Open script for w_sort_and_filter
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//This window will load a datawindow and perform various functions on it.
//The Sort and Filter Column DDLB's are dynamically loaded from the current datawindow
this.x = 0
this.y = 0

lb_1.SelectItem (1)


end event

on w_openuo_new.create
this.lb_1=create lb_1
this.sle_1=create sle_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_1=create st_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.lb_1,&
this.sle_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.st_1,&
this.cb_1,&
this.gb_1}
end on

on w_openuo_new.destroy
destroy(this.lb_1)
destroy(this.sle_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event close;//====================================================================
// Event: close()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/26/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer li_Count,i

li_Count = UpperBound(u_to_open[])

if li_Count < 1 then Return 0
For i = 1 to Li_Count
	if isvalid(u_to_open[i]) then
		CloseUserObject(u_to_open[i])
		destroy u_to_open[i]
	end if
Next

Return 1

end event

type lb_1 from listbox within w_openuo_new
integer x = 55
integer y = 160
integer width = 411
integer height = 204
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string item[] = {"u_numeric_edit","u_progress_bar","u_style_ancestor"}
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_openuo_new
integer x = 965
integer y = 272
integer width = 617
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "parameter"
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_openuo_new
integer x = 512
integer y = 272
integer width = 407
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "CloseUserObject"
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
// Author:HuangHui 	 		Date: 2004/26/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
Integer li_Count 

//debugbreak()
li_Count = UpperBound(u_to_open[])

if li_Count = 0 or li_Count = Ii_count then Return 0
	
CloseUserObject(u_to_open[li_Count - Ii_Count])
destroy u_to_open[li_Count - Ii_Count]
Ii_Count ++

Return 1

end event

type cb_3 from commandbutton within w_openuo_new
integer x = 965
integer y = 164
integer width = 617
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OpenUserObjectWithParm"
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
// Author:HuangHui 	 		Date: 2004/26/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string  ls_UO
string  ls_Message
Integer li_Count,li_X,li_Y

ls_UO = lb_1.SelectedItem()
choose case ls_UO
	case "u_numeric_edit"
		ls_Message = sle_1.text
	case "u_progress_bar"
		ls_Message = sle_1.text
		if not IsNumber(ls_Message) then 
			MessageBox("Information","Please input parameter of number.")
			Return
		end if
		if Dec(ls_Message)>=101 then 
			MessageBox("Information","The parameter must be less than 101.")
			Return
		end if		
	case "u_style_ancestor"
		ls_Message = sle_1.text
		ls_Message = "#DYNAMICUO#" + ls_Message
end choose
		
li_count = UpperBound(u_to_open[])
li_Count = li_Count - Ii_Count
if li_Count = 0 then
	li_X = 150;li_Y= 450	
else
	li_X = u_to_open[li_Count].X;li_Y = u_to_open[li_Count].Y + u_to_open[li_Count].Height + 10
end if

OpenUserObjectWithParm(u_to_open[li_Count + 1],ls_Message,ls_UO,li_X,li_Y)
u_to_open[li_Count + 1].visible = true

if Ii_Count <> 0 then Ii_Count --
end event

type cb_2 from commandbutton within w_openuo_new
integer x = 512
integer y = 164
integer width = 407
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OpenUserObject"
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
// Author:HuangHui	 		Date: 2004/26/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
Integer li_Count,li_X,li_Y

li_count = UpperBound(u_to_open[])
li_Count = li_Count - Ii_Count
if li_Count = 0 then
	li_X = 150;li_Y= 450	
else
	li_X = u_to_open[li_Count].X;li_Y = u_to_open[li_Count].Y + u_to_open[li_Count].Height + 10
end if
OpenUserObject(u_to_open[li_Count + 1],lb_1.SelectedItem(),li_X,li_Y)
u_to_open[li_Count + 1].visible = true

if Ii_Count <> 0 then Ii_Count --
end event

type st_1 from statictext within w_openuo_new
integer x = 55
integer y = 20
integer width = 2414
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "User objects are created dynamically using OpenUserObject, CloseUserObject, and OpenUserObjectWithParm functions."
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_openuo_new
integer x = 2075
integer y = 164
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close(Parent)
end event

type gb_1 from groupbox within w_openuo_new
integer x = 55
integer y = 404
integer width = 2414
integer height = 964
integer taborder = 40
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

