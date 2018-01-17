$PBExportHeader$w_registerandprofile.srw
forward
global type w_registerandprofile from window
end type
type cb_8 from commandbutton within w_registerandprofile
end type
type cb_7 from commandbutton within w_registerandprofile
end type
type cb_6 from commandbutton within w_registerandprofile
end type
type cb_5 from commandbutton within w_registerandprofile
end type
type st_8 from statictext within w_registerandprofile
end type
type cb_4 from commandbutton within w_registerandprofile
end type
type dw_1 from datawindow within w_registerandprofile
end type
type cb_3 from commandbutton within w_registerandprofile
end type
type sle_8 from singlelineedit within w_registerandprofile
end type
type sle_7 from singlelineedit within w_registerandprofile
end type
type sle_6 from singlelineedit within w_registerandprofile
end type
type st_7 from statictext within w_registerandprofile
end type
type st_6 from statictext within w_registerandprofile
end type
type st_5 from statictext within w_registerandprofile
end type
type cb_2 from commandbutton within w_registerandprofile
end type
type sle_5 from singlelineedit within w_registerandprofile
end type
type st_4 from statictext within w_registerandprofile
end type
type sle_4 from singlelineedit within w_registerandprofile
end type
type sle_3 from singlelineedit within w_registerandprofile
end type
type sle_2 from singlelineedit within w_registerandprofile
end type
type st_3 from statictext within w_registerandprofile
end type
type st_2 from statictext within w_registerandprofile
end type
type st_1 from statictext within w_registerandprofile
end type
type cb_1 from commandbutton within w_registerandprofile
end type
type sle_1 from singlelineedit within w_registerandprofile
end type
type gb_1 from groupbox within w_registerandprofile
end type
type gb_2 from groupbox within w_registerandprofile
end type
type gb_3 from groupbox within w_registerandprofile
end type
end forward

global type w_registerandprofile from window
integer width = 2848
integer height = 1800
boolean titlebar = true
string title = "Register and Profile"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
st_8 st_8
cb_4 cb_4
dw_1 dw_1
cb_3 cb_3
sle_8 sle_8
sle_7 sle_7
sle_6 sle_6
st_7 st_7
st_6 st_6
st_5 st_5
cb_2 cb_2
sle_5 sle_5
st_4 st_4
sle_4 sle_4
sle_3 sle_3
sle_2 sle_2
st_3 st_3
st_2 st_2
st_1 st_1
cb_1 cb_1
sle_1 sle_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_registerandprofile w_registerandprofile

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
Transaction its_sql

end variables

forward prototypes
public function integer wf_check_databaseinfo ()
end prototypes

public function integer wf_check_databaseinfo ();//====================================================================
// Function: wf_check_databaseinfo()
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
If LenA(Trim(sle_6.Text)) = 0 Or IsNull(sle_6.Text) Then
	Return -1
End If

If LenA(Trim(sle_7.Text)) = 0 Or IsNull(sle_7.Text) Then
	Return -1
End If

If LenA(Trim(sle_8.Text)) = 0 Or IsNull(sle_8.Text) Then
	Return -1
End If

Return 1

end function

on w_registerandprofile.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.st_8=create st_8
this.cb_4=create cb_4
this.dw_1=create dw_1
this.cb_3=create cb_3
this.sle_8=create sle_8
this.sle_7=create sle_7
this.sle_6=create sle_6
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.cb_2=create cb_2
this.sle_5=create sle_5
this.st_4=create st_4
this.sle_4=create sle_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.sle_1=create sle_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.st_8,&
this.cb_4,&
this.dw_1,&
this.cb_3,&
this.sle_8,&
this.sle_7,&
this.sle_6,&
this.st_7,&
this.st_6,&
this.st_5,&
this.cb_2,&
this.sle_5,&
this.st_4,&
this.sle_4,&
this.sle_3,&
this.sle_2,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_1,&
this.sle_1,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_registerandprofile.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.st_8)
destroy(this.cb_4)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.sle_8)
destroy(this.sle_7)
destroy(this.sle_6)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.cb_2)
destroy(this.sle_5)
destroy(this.st_4)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event close;//====================================================================
// Event: close()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_close]
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Destroy its_sql

end event

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
String ls_dev,ls_web,ls_server

This.X = 0
This.Y = 0

ls_dev = "HKEY_LOCAL_MACHINE\SOFTWARE\APPEON\Appeon Code Examples\ADT"
ls_web = "HKEY_LOCAL_MACHINE\SOFTWARE\APPEON\Appeon Code Examples\AWL"
ls_server = "HKEY_LOCAL_MACHINE\SOFTWARE\APPEON\Appeon Code Examples\AS"

RegistrySet( ls_dev, "Version",RegString!,"2.8")
RegistrySet( ls_web, "Version",RegString!,"2.8")
RegistrySet( ls_server, "Version",RegString!,"2.8")

end event

type cb_8 from commandbutton within w_registerandprofile
integer x = 2258
integer y = 1120
integer width = 448
integer height = 92
integer taborder = 90
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

type cb_7 from commandbutton within w_registerandprofile
integer x = 2350
integer y = 340
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_2.Text = ""
sle_3.Text = ""
sle_4.Text = ""

end event

type cb_6 from commandbutton within w_registerandprofile
integer x = 2350
integer y = 796
integer width = 343
integer height = 92
integer taborder = 70
integer textsize = -8
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
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
sle_6.Text = ""
sle_7.Text = ""
sle_8.Text = ""

end event

type cb_5 from commandbutton within w_registerandprofile
integer x = 2254
integer y = 1512
integer width = 448
integer height = 92
integer taborder = 110
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

type st_8 from statictext within w_registerandprofile
integer x = 82
integer y = 104
integer width = 539
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Key Path:"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_registerandprofile
integer x = 2258
integer y = 1380
integer width = 448
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Retrieve"
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
If Not IsValid(its_sql) Then
	MessageBox("Appeon","User-defined transaction has been created.")
	Return -1
End If

dw_1.SetTransObject(its_sql)
dw_1.Retrieve()

end event

type dw_1 from datawindow within w_registerandprofile
integer x = 82
integer y = 1020
integer width = 2144
integer height = 584
integer taborder = 100
string title = "none"
string dataobject = "d_retrieve_cust"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_registerandprofile
integer x = 2258
integer y = 1248
integer width = 448
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Create Transaction"
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
If wf_check_databaseinfo() = -1 Then
	MessageBox("Appeon","Please get the database information.")
	Return -1
End If

its_sql = Create Transaction

its_sql.DBMS = sle_6.Text
its_sql.AutoCommit = (Lower(sle_7.Text) = "true")
its_sql.DBParm = sle_8.Text

CONNECT Using its_sql;

If its_sql.SQLCode <> 0 Then
	MessageBox("Appeon","Connection to database failed.")
	Return -1
Else
	MessageBox("Appeon","The transaction is successfully created. ~r~nNow you can click Retrieve to retrieve data into the DataWindow.")
End If

end event

type sle_8 from singlelineedit within w_registerandprofile
integer x = 782
integer y = 808
integer width = 1449
integer height = 76
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_7 from singlelineedit within w_registerandprofile
integer x = 782
integer y = 724
integer width = 1152
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_6 from singlelineedit within w_registerandprofile
integer x = 782
integer y = 640
integer width = 1152
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within w_registerandprofile
integer x = 82
integer y = 820
integer width = 302
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "DBParm:"
boolean focusrectangle = false
end type

type st_6 from statictext within w_registerandprofile
integer x = 82
integer y = 736
integer width = 398
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "AutoCommit:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_registerandprofile
integer x = 82
integer y = 652
integer width = 311
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "DBMS:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_registerandprofile
integer x = 1979
integer y = 548
integer width = 713
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get Database Information"
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
String ls_ini
ls_ini = sle_5.Text

sle_6.Text = ProfileString(ls_ini,"Database","DBMS","")
sle_7.Text = ProfileString(ls_ini,"Database","AutoCommit","")
sle_8.Text = ProfileString(ls_ini,"Database","DBPARM","")

end event

type sle_5 from singlelineedit within w_registerandprofile
integer x = 782
integer y = 556
integer width = 1152
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "appeon_code_examples.ini"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_registerandprofile
integer x = 82
integer y = 568
integer width = 425
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "INI File:"
boolean focusrectangle = false
end type

type sle_4 from singlelineedit within w_registerandprofile
integer x = 782
integer y = 356
integer width = 448
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_3 from singlelineedit within w_registerandprofile
integer x = 782
integer y = 268
integer width = 448
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_registerandprofile
integer x = 782
integer y = 180
integer width = 448
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_registerandprofile
integer x = 82
integer y = 368
integer width = 654
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Appeon Server Version:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_registerandprofile
integer x = 82
integer y = 280
integer width = 658
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Appeon Web Library Version:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_registerandprofile
integer x = 82
integer y = 192
integer width = 677
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Appeon  Developer Version:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_registerandprofile
integer x = 1979
integer y = 84
integer width = 713
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get registry Information"
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
String ls_path,ls_devversion,ls_webversion,ls_serverversion
String ls_devpath,ls_webpath,ls_serverpath

ls_path = sle_1.Text

ls_devpath = sle_1.Text+"\ADT"
ls_webpath = sle_1.Text+"\AWL"
ls_serverpath = sle_1.Text+"\AS"

RegistryGet(ls_devpath,"Version",RegString!,ls_devversion)
RegistryGet(ls_webpath,"Version",RegString!,ls_webversion)
RegistryGet(ls_serverpath,"Version",RegString!,ls_serverversion)

sle_2.Text = ls_devversion
sle_3.Text = ls_webversion
sle_4.Text = ls_serverversion



end event

type sle_1 from singlelineedit within w_registerandprofile
integer x = 782
integer y = 92
integer width = 1152
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "HKEY_LOCAL_MACHINE\SOFTWARE\APPEON\Appeon Code Examples"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_registerandprofile
integer x = 41
integer y = 20
integer width = 2711
integer height = 456
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Register"
end type

type gb_2 from groupbox within w_registerandprofile
integer x = 41
integer y = 492
integer width = 2711
integer height = 432
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profile"
end type

type gb_3 from groupbox within w_registerandprofile
integer x = 41
integer y = 944
integer width = 2711
integer height = 708
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "User-defined Transaction"
end type

