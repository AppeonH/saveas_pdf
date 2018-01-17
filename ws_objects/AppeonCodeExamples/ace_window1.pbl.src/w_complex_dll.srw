$PBExportHeader$w_complex_dll.srw
forward
global type w_complex_dll from window
end type
type cb_2 from commandbutton within w_complex_dll
end type
type cb_1 from commandbutton within w_complex_dll
end type
type poly from structure within w_complex_dll
end type
end forward

type poly from structure
	unsignedlong		Xpos[]
	unsignedlong		Ypos[]
end type

global type w_complex_dll from window
integer width = 2857
integer height = 1688
boolean titlebar = true
string title = "External Functions"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
event ue_post ( )
cb_2 cb_2
cb_1 cb_1
end type
global w_complex_dll w_complex_dll

type prototypes
//FUNCTION ulong FindNextFile(ulong hFindFile,ref WIN32_FIND_DATA lpFindFileData) LIBRARY "kernel32.dll" ALIAS FOR "FindNextFileA"  
FUNCTION long GetDC(long hwnd) LIBRARY "user32.dll"  
FUNCTION long Polygon(long hdc,ref poly lpPoint,long nCount) LIBRARY "gdi32.dll" 

end prototypes

type variables

end variables

event ue_post();long lul_handle,lul_device
int li_cnt
poly poly2

lul_handle = handle(this)
lul_device = GetDC(lul_handle)
li_cnt = 4
poly2.xpos[] = {500,225,181,200,100}
poly2.ypos[] = {100,25,254,300,300}

Polygon(lul_device,poly2,li_cnt)


end event

on w_complex_dll.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.cb_1}
end on

on w_complex_dll.destroy
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;//this.post event ue_post()
this.x = 1106
this.y = 260
end event

event timer;Event ue_post()
end event

type cb_2 from commandbutton within w_complex_dll
integer x = 2121
integer y = 1472
integer width = 338
integer height = 104
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Polygon"
end type

event clicked;Event ue_post()
Timer(0.5)

end event

type cb_1 from commandbutton within w_complex_dll
integer x = 2464
integer y = 1472
integer width = 338
integer height = 104
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;Close(parent)
end event

