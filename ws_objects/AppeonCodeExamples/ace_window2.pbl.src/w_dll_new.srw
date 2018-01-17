$PBExportHeader$w_dll_new.srw
$PBExportComments$call dll
forward
global type w_dll_new from window
end type
type st_1 from statictext within w_dll_new
end type
type cb_5 from commandbutton within w_dll_new
end type
type cb_4 from commandbutton within w_dll_new
end type
type cb_3 from commandbutton within w_dll_new
end type
type lb_1 from listbox within w_dll_new
end type
type mle_1 from multilineedit within w_dll_new
end type
type gb_1 from groupbox within w_dll_new
end type
type lb_2 from listbox within w_dll_new
end type
end forward

global type w_dll_new from window
integer width = 2857
integer height = 1688
boolean titlebar = true
string title = "External Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
lb_1 lb_1
mle_1 mle_1
gb_1 gb_1
lb_2 lb_2
end type
global w_dll_new w_dll_new

type prototypes
Function uint GetWindowsDirectory(ref string lpBuffer,uint uSize) alias for "GetWindowDirectoryA;Ansi" Library "kernel32.dll"
Function uint GetSystemDirectory(ref string lpBuffer,uint uSize) alias for "GetSystemDirectoryA;Ansi" Library "kernel32.dll"
Function ulong GetCurrentDirectory(ulong nBufferLength,ref string lpBuffer) alias for "GetCurrentDirectoryA;Ansi" Library "kernel32.dll"
Function boolean GetUserName(ref string lpBuffer, ref ulong nSize) alias for "GetUserNameA;Ansi" library "advapi32.dll"

end prototypes

type variables

end variables

on w_dll_new.create
this.st_1=create st_1
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.lb_1=create lb_1
this.mle_1=create mle_1
this.gb_1=create gb_1
this.lb_2=create lb_2
this.Control[]={this.st_1,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.lb_1,&
this.mle_1,&
this.gb_1,&
this.lb_2}
end on

on w_dll_new.destroy
destroy(this.st_1)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.lb_1)
destroy(this.mle_1)
destroy(this.gb_1)
destroy(this.lb_2)
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

This.X = 0
This.Y = 0

mle_1.Text = "Function uint GetSystemDirectory(ref string lpBuffer,uint uSize) alias for GetWindowDirectoryA Library 'kernel32.dll'" + "~r~n" +&
	"Function ulong GetCurrentDirectoryA(ulong nBufferLength,ref string lpBuffer) alias for GetCurrentDirectoryA Library 'kernel32.dll'" + "~r~n" +&
	"Function boolean GetUserName(ref string lpBuffer, ref ulong nSize) alias for GetUserNameA library 'advapi32.dll'"+ "~r~n" +&
	"Function long Polygon(long hdc,ref poly lpPoint,long nCount) LIBRARY 'gdi32.dll' "




end event

type st_1 from statictext within w_dll_new
integer x = 73
integer y = 96
integer width = 1531
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Declare external functions to call DLLs on the client machine."
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_dll_new
integer x = 955
integer y = 1028
integer width = 384
integer height = 116
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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
// Author: 	HuangHui		Date: 2004/06/28
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string ls_return

if lb_1.SelectedIndex() < 0 then
	messagebox('Warning','Please select testing function.')
	return
end if

string ls_rv
ulong lul_length = 255
ls_rv=space(255)
choose case lb_1.selecteditem()
	case 'GetUserName'
      GetUserName(ls_rv,lul_length)
	case 'GetSystemDirectory'
		GetSystemDirectory(ls_rv,lul_length)
	case 'GetCurrentDirectory'
		GetCurrentDirectory(lul_length,ls_rv)
	case 'Polygon'	
		open(w_complex_dll)
		return
end choose

ls_rv = string(lb_2.totalitems()+1) + '.' + ls_rv
lb_2.additem(ls_rv)
end event

type cb_4 from commandbutton within w_dll_new
integer x = 2427
integer y = 1440
integer width = 352
integer height = 116
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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

type cb_3 from commandbutton within w_dll_new
integer x = 2030
integer y = 1440
integer width = 352
integer height = 116
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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

type lb_1 from listbox within w_dll_new
integer x = 46
integer y = 760
integer width = 864
integer height = 628
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"GetSystemDirectory","GetCurrentDirectory","GetUserName","Polygon"}
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_dll_new
integer x = 73
integer y = 180
integer width = 2679
integer height = 508
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_dll_new
integer x = 32
integer y = 24
integer width = 2757
integer height = 704
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Define Local External Function"
end type

type lb_2 from listbox within w_dll_new
integer x = 1385
integer y = 760
integer width = 1394
integer height = 628
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

