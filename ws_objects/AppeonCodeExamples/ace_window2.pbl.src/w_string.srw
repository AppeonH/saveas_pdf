$PBExportHeader$w_string.srw
forward
global type w_string from window
end type
type st_5 from statictext within w_string
end type
type cb_3 from commandbutton within w_string
end type
type cb_2 from commandbutton within w_string
end type
type lb_output from listbox within w_string
end type
type cbx_null from checkbox within w_string
end type
type sle_f4 from singlelineedit within w_string
end type
type sle_f3 from singlelineedit within w_string
end type
type sle_f2 from singlelineedit within w_string
end type
type st_11 from statictext within w_string
end type
type st_10 from statictext within w_string
end type
type st_9 from statictext within w_string
end type
type st_8 from statictext within w_string
end type
type st_7 from statictext within w_string
end type
type sle_syntax from singlelineedit within w_string
end type
type cb_1 from commandbutton within w_string
end type
type sle_f1 from singlelineedit within w_string
end type
type st_4 from statictext within w_string
end type
type st_3 from statictext within w_string
end type
type st_2 from statictext within w_string
end type
type st_1 from statictext within w_string
end type
type sle_s from singlelineedit within w_string
end type
type sle_n from singlelineedit within w_string
end type
type sle_t from singlelineedit within w_string
end type
type sle_d from singlelineedit within w_string
end type
type lb_type from listbox within w_string
end type
type gb_1 from groupbox within w_string
end type
type gb_3 from groupbox within w_string
end type
type gb_4 from groupbox within w_string
end type
type gb_2 from groupbox within w_string
end type
end forward

global type w_string from window
integer width = 2629
integer height = 1456
boolean titlebar = true
string title = "Convert to String"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_5 st_5
cb_3 cb_3
cb_2 cb_2
lb_output lb_output
cbx_null cbx_null
sle_f4 sle_f4
sle_f3 sle_f3
sle_f2 sle_f2
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
sle_syntax sle_syntax
cb_1 cb_1
sle_f1 sle_f1
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
sle_s sle_s
sle_n sle_n
sle_t sle_t
sle_d sle_d
lb_type lb_type
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
gb_2 gb_2
end type
global w_string w_string

on w_string.create
this.st_5=create st_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.lb_output=create lb_output
this.cbx_null=create cbx_null
this.sle_f4=create sle_f4
this.sle_f3=create sle_f3
this.sle_f2=create sle_f2
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.sle_syntax=create sle_syntax
this.cb_1=create cb_1
this.sle_f1=create sle_f1
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_s=create sle_s
this.sle_n=create sle_n
this.sle_t=create sle_t
this.sle_d=create sle_d
this.lb_type=create lb_type
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_2=create gb_2
this.Control[]={this.st_5,&
this.cb_3,&
this.cb_2,&
this.lb_output,&
this.cbx_null,&
this.sle_f4,&
this.sle_f3,&
this.sle_f2,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.sle_syntax,&
this.cb_1,&
this.sle_f1,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_s,&
this.sle_n,&
this.sle_t,&
this.sle_d,&
this.lb_type,&
this.gb_1,&
this.gb_3,&
this.gb_4,&
this.gb_2}
end on

on w_string.destroy
destroy(this.st_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.lb_output)
destroy(this.cbx_null)
destroy(this.sle_f4)
destroy(this.sle_f3)
destroy(this.sle_f2)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.sle_syntax)
destroy(this.cb_1)
destroy(this.sle_f1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_s)
destroy(this.sle_n)
destroy(this.sle_t)
destroy(this.sle_d)
destroy(this.lb_type)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_2)
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y = 0

end event

type st_5 from statictext within w_string
integer x = 46
integer y = 40
integer width = 2181
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example shows the usage of the String function, which converts other type data to string value. "
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_string
integer x = 2153
integer y = 1164
integer width = 347
integer height = 100
integer taborder = 50
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type cb_2 from commandbutton within w_string
integer x = 2153
integer y = 1032
integer width = 347
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear All"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_output.reset()
end event

type lb_output from listbox within w_string
integer x = 78
integer y = 836
integer width = 1993
integer height = 428
integer taborder = 70
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

type cbx_null from checkbox within w_string
integer x = 1774
integer y = 228
integer width = 233
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Null"
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

sle_d.Enabled = not this.checked
sle_t.Enabled = not this.checked
sle_n.Enabled = not this.checked
sle_s.Enabled = not this.checked

end event

type sle_f4 from singlelineedit within w_string
integer x = 1641
integer y = 644
integer width = 384
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_f3 from singlelineedit within w_string
integer x = 1641
integer y = 540
integer width = 384
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_f2 from singlelineedit within w_string
integer x = 1019
integer y = 644
integer width = 384
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within w_string
integer x = 1435
integer y = 652
integer width = 183
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Format4"
boolean focusrectangle = false
end type

type st_10 from statictext within w_string
integer x = 795
integer y = 652
integer width = 206
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Format2"
boolean focusrectangle = false
end type

type st_9 from statictext within w_string
integer x = 1435
integer y = 548
integer width = 183
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Format3"
boolean focusrectangle = false
end type

type st_8 from statictext within w_string
integer x = 795
integer y = 548
integer width = 206
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Format1"
boolean focusrectangle = false
end type

type st_7 from statictext within w_string
integer x = 795
integer y = 228
integer width = 206
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Syntax"
boolean focusrectangle = false
end type

type sle_syntax from singlelineedit within w_string
integer x = 1019
integer y = 220
integer width = 727
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 134217739
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_string
integer x = 2153
integer y = 632
integer width = 347
integer height = 100
integer taborder = 50
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Choose Case Upper(Lb_type.SelectedItem())
	Case 'DATE'
		If Cbx_null.Checked Then
			Date ld_null
			SetNull(ld_null)
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(NUll,'+sle_f1.Text+';'+sle_f2.Text+')='+String(ld_null,sle_f1.Text+';'+sle_f2.Text))
			Return
		End If
		
		If Trim(sle_f1.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(Date('+sle_d.Text+'))='+String(Date(sle_d.Text)))
		ElseIf Trim(sle_f2.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(Date('+sle_d.Text+'),'+sle_f1.Text+')='+String(Date(sle_d.Text),sle_f1.Text))
		Else
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(Date('+sle_d.Text+'),'+sle_f1.Text+','+sle_f2.Text+')='+String(Date(sle_d.Text),sle_f1.Text+','+sle_f2.Text))
		End If
		
	Case 'TIME'
		If Cbx_null.Checked Then
			Time lt_null
			SetNull(lt_null)
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(NUll,'+sle_f1.Text+';'+sle_f2.Text+')='+String(lt_null,sle_f1.Text+';'+sle_f2.Text))
			Return
		End If
		
		If Trim(sle_f1.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(Time('+sle_t.Text+'))='+String(Time(sle_t.Text)))
		ElseIf Trim(sle_f2.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(Time('+sle_t.Text+'),'+sle_f1.Text+')='+String(Time(sle_t.Text),sle_f1.Text))
		Else
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(Time('+sle_t.Text+'),'+sle_f1.Text+';'+sle_f2.Text+')='+String(Time(sle_t.Text),sle_f1.Text+';'+sle_f2.Text))
		End If
		
	Case 'DATETIME'
		
		If Cbx_null.Checked Then
			DateTime ldt_null
			SetNull(ldt_null)
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(NUll,'+sle_f1.Text+';'+sle_f2.Text+')='+String(ldt_null,sle_f1.Text+';'+sle_f2.Text))
			Return
		End If
		
		If Trim(sle_f1.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(DateTime(date('+sle_d.Text+'),Time('+sle_t.Text+'))='+String(DateTime(Date(sle_d.Text),Time(sle_t.Text))))
		ElseIf Trim(sle_f2.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(DateTime(date('+sle_d.Text+'),Time('+sle_t.Text+')),'+sle_f1.Text+')='+String(DateTime(Date(sle_d.Text),Time(sle_t.Text)),sle_f1.Text))
		Else
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(DateTime(date('+sle_d.Text+'),Time('+sle_t.Text+')),'+sle_f1.Text+";"+sle_f2.Text+')='+String(DateTime(Date(sle_d.Text),Time(sle_t.Text)),sle_f1.Text+';'+sle_f2.Text))
		End If
		
	Case 'NUMBER'
		
		If Cbx_null.Checked Then
			Double ldb_null
			SetNull(ldb_null)
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(NUll,'+sle_f1.Text+';'+sle_f2.Text+";"+sle_f3.Text+";"+sle_f4.Text+')='+String(ldb_null,sle_f1.Text+';'+sle_f2.Text+";"+sle_f3.Text+";"+sle_f4.Text))
			Return
		End If
		
		If Trim(sle_f1.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(Double('+sle_n.Text+'))='+String(Double(sle_n.Text)))
		ElseIf Trim(sle_f2.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(Double('+sle_n.Text+'),'+sle_f1.Text+')='+String(Double(sle_n.Text),sle_f1.Text))
		ElseIf Trim(sle_f3.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(Double('+sle_n.Text+'),'+sle_f1.Text+";"+sle_f2.Text+')='+String(Double(sle_n.Text),sle_f1.Text+";"+sle_f2.Text))
		ElseIf Trim(sle_f4.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(Double('+sle_n.Text+'),'+sle_f1.Text+";"+sle_f2.Text+";"+sle_f3.Text+')='+String(Double(sle_n.Text),sle_f1.Text+";"+sle_f2.Text+";"+sle_f3.Text))
		Else
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(Double('+sle_n.Text+'),'+sle_f1.Text+";"+sle_f2.Text+";"+sle_f3.Text+";"+sle_f4.Text+')='+String(Double(sle_n.Text),sle_f1.Text+";"+sle_f2.Text+";"+sle_f3.Text+";"+sle_f4.Text))
		End If
		
	Case 'STRING'
		
		If Cbx_null.Checked Then
			String ls_null
			SetNull(ls_null)
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String(NUll,'+sle_f1.Text+';'+sle_f2.Text+')='+String(ls_null,sle_f1.Text+';'+sle_f2.Text))
			Return
		End If
		
		If Trim(sle_f1.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String('+sle_s.Text+')='+String(sle_s.Text))
		ElseIf Trim(sle_f2.Text) = '' Then
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String('+sle_s.Text+','+sle_f1.Text+')='+String(sle_s.Text,sle_f1.Text))
		Else
			Lb_OutPut.AddItem(String(Lb_OutPut.TotalItems())+"."+&
				'String('+sle_s.Text+','+sle_f1.Text+";"+sle_f2.Text+')='+String(sle_s.Text,sle_f1.Text+";"+sle_f2.Text))
		End If
		
End Choose


end event

type sle_f1 from singlelineedit within w_string
integer x = 1019
integer y = 540
integer width = 384
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_string
integer x = 795
integer y = 444
integer width = 206
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "String"
boolean focusrectangle = false
end type

type st_3 from statictext within w_string
integer x = 1435
integer y = 444
integer width = 183
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Number"
boolean focusrectangle = false
end type

type st_2 from statictext within w_string
integer x = 1435
integer y = 340
integer width = 183
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Time"
boolean focusrectangle = false
end type

type st_1 from statictext within w_string
integer x = 795
integer y = 340
integer width = 206
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date"
boolean focusrectangle = false
end type

type sle_s from singlelineedit within w_string
integer x = 1019
integer y = 436
integer width = 384
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "TestClient"
borderstyle borderstyle = stylelowered!
end type

type sle_n from singlelineedit within w_string
integer x = 1641
integer y = 436
integer width = 384
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "123456.789"
borderstyle borderstyle = stylelowered!
end type

type sle_t from singlelineedit within w_string
integer x = 1641
integer y = 332
integer width = 384
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "16:25:56"
borderstyle borderstyle = stylelowered!
end type

type sle_d from singlelineedit within w_string
integer x = 1019
integer y = 332
integer width = 384
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "2002-03-26"
borderstyle borderstyle = stylelowered!
end type

type lb_type from listbox within w_string
integer x = 78
integer y = 212
integer width = 594
integer height = 524
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Date","Time","DateTime","Number","String"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

sle_f3.Enabled = False
sle_f4.Enabled = False
Choose Case Upper(This.SelectedItem())
	Case 'DATE'
		sle_syntax.Text = "String(Data,{format{,format}})"
		sle_d.Enabled = True
		sle_t.Enabled = False
		sle_n.Enabled = False
		sle_s.Enabled = False
		
	Case 'TIME'
		sle_syntax.Text = "String(Time,{format{,format}})"
		sle_d.Enabled = False
		sle_t.Enabled = True
		sle_n.Enabled = False
		sle_s.Enabled = False
		
	Case 'DATETIME'
		sle_syntax.Text = "String(DataTime,{format{,format}})"
		sle_d.Enabled = True
		sle_t.Enabled = True
		sle_n.Enabled = False
		sle_s.Enabled = False
		
	Case 'NUMBER'
		sle_syntax.Text = "String(Number,{format{format,{format{,format}}}})"
		sle_d.Enabled = False
		sle_t.Enabled = False
		sle_n.Enabled = True
		sle_s.Enabled = False
		sle_f3.Enabled = True
		sle_f4.Enabled = True
		
	Case 'STRING'
		sle_syntax.Text = "String(String,{format{,format}})"
		sle_d.Enabled = False
		sle_t.Enabled = False
		sle_n.Enabled = False
		sle_s.Enabled = True
		
End Choose


end event

type gb_1 from groupbox within w_string
integer x = 41
integer y = 132
integer width = 672
integer height = 640
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parameter Type"
end type

type gb_3 from groupbox within w_string
integer x = 750
integer y = 132
integer width = 1317
integer height = 640
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parameter Value"
end type

type gb_4 from groupbox within w_string
integer x = 2117
integer y = 132
integer width = 425
integer height = 640
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Execute"
end type

type gb_2 from groupbox within w_string
integer x = 41
integer y = 772
integer width = 2501
integer height = 536
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Output"
end type

