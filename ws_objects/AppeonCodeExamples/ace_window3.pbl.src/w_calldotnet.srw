﻿$PBExportHeader$w_calldotnet.srw
forward
global type w_calldotnet from window
end type
type lb_1 from listbox within w_calldotnet
end type
type lb_2 from listbox within w_calldotnet
end type
type cb_2 from commandbutton within w_calldotnet
end type
type cb_1 from commandbutton within w_calldotnet
end type
type cb_5 from commandbutton within w_calldotnet
end type
type cb_3 from commandbutton within w_calldotnet
end type
type cb_4 from commandbutton within w_calldotnet
end type
type mle_1 from multilineedit within w_calldotnet
end type
type st_1 from statictext within w_calldotnet
end type
type gb_2 from groupbox within w_calldotnet
end type
type gb_3 from groupbox within w_calldotnet
end type
type gb_1 from groupbox within w_calldotnet
end type
end forward

global type w_calldotnet from window
integer width = 2862
integer height = 1780
boolean titlebar = true
string title = "Call DotNet Component"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
lb_1 lb_1
lb_2 lb_2
cb_2 cb_2
cb_1 cb_1
cb_5 cb_5
cb_3 cb_3
cb_4 cb_4
mle_1 mle_1
st_1 st_1
gb_2 gb_2
gb_3 gb_3
gb_1 gb_1
end type
global w_calldotnet w_calldotnet

type variables

end variables

on w_calldotnet.create
this.lb_1=create lb_1
this.lb_2=create lb_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_4=create cb_4
this.mle_1=create mle_1
this.st_1=create st_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_1=create gb_1
this.Control[]={this.lb_1,&
this.lb_2,&
this.cb_2,&
this.cb_1,&
this.cb_5,&
this.cb_3,&
this.cb_4,&
this.mle_1,&
this.st_1,&
this.gb_2,&
this.gb_3,&
this.gb_1}
end on

on w_calldotnet.destroy
destroy(this.lb_1)
destroy(this.lb_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.mle_1)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_1)
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
// Author: 	ouyangwu		Date: 2006/09/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

This.X = 0
This.Y = 0

mle_1.Text = "DotNet component : AppeonDNComponentU.dll" + "~r~n" +&
	"Classdescript : DotNetClass" + "~r~n" +&
	"Function definition :" + "~r~n" +&
	"int GetIntAndRefInt(int a, ref int b)" + "~r~n" +&
	"float GetFloatAndRefFloat(float a, ref float b)" + "~r~n" +&
	"char GetCharAndRefChar(char a, ref char b)" + "~r~n" +&
	"double GetDoubleAndRefDouble(double a, ref double b)" + "~r~n" +&
	"string GetStringAndRefString(string a, ref string b)"


end event

type lb_1 from listbox within w_calldotnet
integer x = 73
integer y = 712
integer width = 864
integer height = 764
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
string item[] = {"GetIntAndRefInt","GetFloatAndRefFloat","GetCharAndRefChar","GetDoubleAndRefDouble","GetStringAndRefString"}
borderstyle borderstyle = stylelowered!
end type

type lb_2 from listbox within w_calldotnet
integer x = 1435
integer y = 712
integer width = 1317
integer height = 764
integer taborder = 20
integer textsize = -9
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

type cb_2 from commandbutton within w_calldotnet
integer x = 2034
integer y = 1544
integer width = 352
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
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
// Author: 	ouyangwu		Date: 2006/09/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_2.reset()
end event

type cb_1 from commandbutton within w_calldotnet
integer x = 2427
integer y = 1544
integer width = 352
integer height = 96
integer taborder = 30
integer textsize = -9
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
// Author: 	ouyangwu		Date: 2006/09/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Close(parent)
end event

type cb_5 from commandbutton within w_calldotnet
integer x = 1006
integer y = 984
integer width = 352
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Execute"
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
// Author: 	ouyangwu		Date: 2006/09/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_output
appeondotnetcomponent  comcaller   //
Any paralist[]

if lb_1.SelectedIndex() < 0 then
	messagebox('Warning','Please select testing function.')
	return
end if

comcaller = create appeondotnetcomponent
//call dotnet component
comcaller.componenttype = '1'				// DotNet flag
comcaller.typelib = 'AppeonDNComponentU.dll'			
comcaller.classdescript = 'DotNetClass'

choose case lb_1.selecteditem()
	case "GetIntAndRefInt"
		paralist[1] = 32764
		paralist[2] = 32763
		comcaller.of_execinterface("GetIntAndRefInt",paralist)
		
	case "GetFloatAndRefFloat"
		paralist[1] = 3.402822E+38
		paralist[2] = 3.402822E+38
		comcaller.of_execinterface("GetFloatAndRefFloat",paralist)
		
	case "GetCharAndRefChar"
		paralist[1] = "A"
		paralist[2] = "B"
		comcaller.of_execinterface("GetCharAndRefChar",paralist)
		
	case "GetDoubleAndRefDouble"
		paralist[1] = 1.79769313486233E+14
		paralist[2] = 1.79769313486231E+14
		comcaller.of_execinterface("GetDoubleAndRefDouble",paralist)
		
	case "GetStringAndRefString"
		paralist[1] = "Appeon"
		paralist[2] = "HelloWorld"
		comcaller.of_execinterface("GetStringAndRefString",paralist)
		
	case else
		messagebox('Warning','Your Selected function does not exist.')
		destroy comcaller
		return
end choose

//output information
lb_2.Reset()
ls_output = "paralist[1]="+string(paralist[1])
lb_2.additem(ls_output)
ls_output = "paralist[2]="+string(paralist[2])
lb_2.additem(ls_output)
ls_output = "ReturnValue="+string(comcaller.ReturnValue)
lb_2.additem(ls_output)
ls_output = "ErrorText="+string(comcaller.ErrorText)
lb_2.additem(ls_output)
destroy comcaller
end event

type cb_3 from commandbutton within w_calldotnet
integer x = 2034
integer y = 1544
integer width = 352
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_2.reset()
end event

type cb_4 from commandbutton within w_calldotnet
integer x = 2427
integer y = 1544
integer width = 352
integer height = 96
integer taborder = 20
integer textsize = -9
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Close(parent)
end event

type mle_1 from multilineedit within w_calldotnet
integer x = 73
integer y = 132
integer width = 2679
integer height = 476
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_calldotnet
integer x = 41
integer y = 16
integer width = 1641
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example applies only to Appeon Server versions which support DotNet."
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_calldotnet
integer x = 32
integer y = 648
integer width = 942
integer height = 864
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Function"
end type

type gb_3 from groupbox within w_calldotnet
integer x = 1394
integer y = 648
integer width = 1390
integer height = 864
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Result"
end type

type gb_1 from groupbox within w_calldotnet
integer x = 32
integer y = 68
integer width = 2757
integer height = 576
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Definition of Functions in Component"
end type

