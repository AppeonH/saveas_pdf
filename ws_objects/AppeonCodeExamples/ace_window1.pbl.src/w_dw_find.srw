$PBExportHeader$w_dw_find.srw
$PBExportComments$Datawindow Find window (ZFC)
forward
global type w_dw_find from window
end type
type rb_all from radiobutton within w_dw_find
end type
type ddlb_column from dropdownlistbox within w_dw_find
end type
type cbx_wholeword from checkbox within w_dw_find
end type
type rb_down from radiobutton within w_dw_find
end type
type rb_up from radiobutton within w_dw_find
end type
type cbx_matchcase from checkbox within w_dw_find
end type
type cb_cancel from commandbutton within w_dw_find
end type
type cb_ok from commandbutton within w_dw_find
end type
type sle_value from singlelineedit within w_dw_find
end type
type st_2 from statictext within w_dw_find
end type
type st_1 from statictext within w_dw_find
end type
type gb_1 from groupbox within w_dw_find
end type
end forward

global type w_dw_find from window
integer x = 823
integer y = 360
integer width = 1513
integer height = 644
boolean titlebar = true
string title = "Find"
boolean controlmenu = true
windowtype windowtype = popup!
long backcolor = 79741120
boolean center = true
event type integer ue_find ( )
rb_all rb_all
ddlb_column ddlb_column
cbx_wholeword cbx_wholeword
rb_down rb_down
rb_up rb_up
cbx_matchcase cbx_matchcase
cb_cancel cb_cancel
cb_ok cb_ok
sle_value sle_value
st_2 st_2
st_1 st_1
gb_1 gb_1
end type
global w_dw_find w_dw_find

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
Protected:
String	is_Column
datawindow idw_active

Private:

String	is_ColumnName[]
Long il_rowcur //

end variables

forward prototypes
public function integer wf_default ()
public function integer wf_find (long al_start, long al_end)
public function string wf_getitemany (datawindow adw_toacton, long al_row, string as_column)
public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase)
public function string wf_buildexpre (string as_column, string as_value)
public function string wf_strip (string as_zarg)
end prototypes

event type integer ue_find();//====================================================================
// Event: ue_find()
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
Long		ll_start,ll_end

SetPointer(HourGlass!)

If IsNull(idw_active) Or Not IsValid(idw_active) Then
	Return -1
End If

ll_end = idw_active.RowCount()
If rb_up.Checked Then
	ll_end	 = 1
	ll_start	 = idw_active.GetRow() - 1
ElseIf rb_down.Checked Then
	ll_start	 = idw_active.GetRow() + 1
Else
	ll_start = il_rowcur + 1 //--add by firmrock on 20030302
End If

Return This.wf_Find(ll_start,ll_end)

end event

public function integer wf_default ();//====================================================================
// Function: wf_default()
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
Long		ll_start,ll_end

SetPointer(HourGlass!)

If IsNull(idw_active) Or Not IsValid(idw_active) Then
	Return -1
End If

ll_end = idw_active.RowCount()
If rb_up.Checked Then
	ll_end	 = 1
	ll_start	 = idw_active.GetRow() - 1
Else
	ll_start	 = idw_active.GetRow() + 1
End If

Return This.wf_Find(ll_start,ll_end)

end function

public function integer wf_find (long al_start, long al_end);//====================================================================
// Function: wf_find()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	al_start		
//		long	al_end  		
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
String   ls_findexp
Long		ll_rowfound

If IsNull(is_column) Or LenA(Trim(is_column)) = 0 Or &
	IsNull(sle_value.Text) Or LenA(Trim(sle_value.Text)) = 0 Or &
	IsNull(al_start) Or al_start < 0 Or &
	IsNull(al_end)	Or al_end < 0 Then
	Return -1
End If

ls_findexp = wf_BuildExpre(is_column,sle_value.Text)

If ls_findexp = "!" Or ls_findexp = '-1' Then Return -1

ll_rowfound = idw_active.Find (ls_findexp, al_start, al_end)
//add by firmrock on 20030302
il_rowcur = ll_rowfound

Return ll_rowfound

end function

public function string wf_getitemany (datawindow adw_toacton, long al_row, string as_column);//====================================================================
// Function: wf_getitemany()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		datawindow	adw_toacton		
//		long      	al_row     		
//		string    	as_column  		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String	ls_ColType,ls_ret

SetNull(ls_ret)
ls_ColType = LeftA(adw_toacton.Describe ( as_column + ".coltype" ), 5)

Choose Case Lower(ls_ColType)
	Case "char("
		ls_ret = adw_toacton.GetItemString(al_row,as_column)
	Case "date"
		ls_ret = String(adw_toacton.GetItemDate(al_row,as_column))
	Case "datet"
		ls_ret = String(adw_toacton.GetItemDateTime(al_row,as_column))
	Case "time", "times"
		ls_ret = String(adw_toacton.GetItemTime(al_row,as_column))
	Case "decim"
		ls_ret = String(adw_toacton.GetItemDecimal(al_row,as_column))
	Case 	Else
		ls_ret = String(adw_toacton.GetItemNumber(al_row,as_column))
End Choose

Return ls_ret

end function

public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase);//====================================================================
// Function: of_globalreplace()
//--------------------------------------------------------------------
// Description: Replace all occurrences of one string inside another with
//						a new string.
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_source    		
//		string 	as_old       		
//		string 	as_new       		
//		boolean	ab_ignorecase		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Long	ll_Start
Long	ll_OldLen
Long	ll_NewLen
String ls_Source

//Check parameters
If IsNull(as_source) Or IsNull(as_old) Or IsNull(as_new) Or IsNull(ab_ignorecase) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Get the string lenghts
ll_OldLen = LenA(as_old)
ll_NewLen = LenA(as_new)

//Should function respect case.
If ab_ignorecase Then
	as_old = Lower(as_old)
	ls_Source = Lower(as_source)
Else
	ls_Source = as_source
End If

//Search for the first occurrence of as_Old
ll_Start = PosA(ls_Source, as_old)

Do While ll_Start > 0
	// replace as_Old with as_New
	as_source = ReplaceA(as_source, ll_Start, ll_OldLen, as_new)
	
	//Should function respect case.
	If ab_ignorecase Then
		ls_Source = Lower(as_source)
	Else
		ls_Source = as_source
	End If
	
	// find the next occurrence of as_Old
	ll_Start = PosA(ls_Source, as_old, (ll_Start + ll_NewLen))
Loop

Return as_source


end function

public function string wf_buildexpre (string as_column, string as_value);//====================================================================
// Function: wf_buildexpre()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_column		
//		string	as_value 		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String	ls_findexp
String	ls_coltype
String	ls_editstyle
//nvo_string lnv_string

If IsNull(idw_active) Or Not IsValid(idw_active) Then
	Return '!'
End If

If IsNull(as_value) Or LenA(as_value) = 0 Or &
	IsNull(as_column) Or LenA(Trim(as_column)) = 0 Then
	Return '!'
End If

ls_coltype		 = idw_active.Describe(as_column+".coltype")
ls_editstyle	 = idw_active.Describe(as_column+".Edit.Style")

If ls_editstyle = 'dddw' Or ls_editstyle = 'ddlb' Then
	MessageBox('Alert',"Can't find in a dddw and ddlb column. ",exclamation!)
	Return '-1'
Else
	Choose Case LeftA(Lower(ls_coltype),4)
		Case 'numb', 'long', 'inte', 'deci'
			If IsNumber(as_value) Then
				ls_findexp = as_column+ " = " + as_value
			Else
				ls_findexp = "!"
			End If
		Case 'date'
			If IsDate(as_value) Then
				ls_findexp = "string("+as_column+ ",'yyyy-mm-dd') = string(Date ('" + as_value + "'),'yyyy-mm-dd')"
			Else
				ls_findexp = "!"
			End If
		Case 'time'
			If IsTime(as_value) Then
				ls_findexp = "string("+as_column+ ",'yyyy-mm-dd') = string(Time ('" + as_value + "'),'yyyy-mm-dd')"
			Else
				ls_findexp = "!"
			End If
		Case Else
			If PosA(as_value, "'") > 0 Then
				as_value = of_GlobalReplace (as_value, "'", "~~'",True)
			End If
			
			If cbx_matchcase.Checked Then
				If cbx_wholeword.Checked Then
					ls_findexp = as_column+ "='" + as_value + "'"
				Else
					ls_findexp = "Pos(" +as_column+ ",'" + as_value + "') > 0"
				End If
			Else
				If cbx_wholeword.Checked Then
					ls_findexp = "Lower(" +as_column+ ")='" +Lower(as_value)+ "'"
				Else
					ls_findexp = "Pos(Lower(" +as_column+ "),'" +Lower(as_value)+ "') > 0"
				End If
			End If
	End Choose
End If

Return ls_findexp

end function

public function string wf_strip (string as_zarg);//====================================================================
// Function: wf_strip()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_zarg		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
If	RightA(as_zarg,1) = ':'	Then
	Return LeftA(as_zarg,LenA(as_zarg) - 1)
Else
	Return as_zarg
End If

end function

on w_dw_find.create
this.rb_all=create rb_all
this.ddlb_column=create ddlb_column
this.cbx_wholeword=create cbx_wholeword
this.rb_down=create rb_down
this.rb_up=create rb_up
this.cbx_matchcase=create cbx_matchcase
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_value=create sle_value
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.rb_all,&
this.ddlb_column,&
this.cbx_wholeword,&
this.rb_down,&
this.rb_up,&
this.cbx_matchcase,&
this.cb_cancel,&
this.cb_ok,&
this.sle_value,&
this.st_2,&
this.st_1,&
this.gb_1}
end on

on w_dw_find.destroy
destroy(this.rb_all)
destroy(this.ddlb_column)
destroy(this.cbx_wholeword)
destroy(this.rb_down)
destroy(this.rb_up)
destroy(this.cbx_matchcase)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.sle_value)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: open datawindow.
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

Integer	li_ColumnCount,li_ColumnIndex,li_selectitem
String	ls_Colu,ls_Disp,ls_EditStyle
Long		ll_Row,ll_Total

idw_active = Message.PowerObjectParm
If IsNull(idw_active) Or Not IsValid(idw_active) Then
	Return
End If

li_ColumnCount = Integer( idw_active.Describe("DataWindow.Column.Count"))

For li_ColumnIndex = 1 To li_ColumnCount
	ls_Colu	 = idw_active.Describe( "#" + String(li_ColumnIndex) + ".Name") 
	//	ls_Disp	= idw_active.Describe(ls_Colu+ "_t.Text")
	
	ls_Disp = ls_Colu
	
	ls_EditStyle = idw_active.Describe(ls_Colu+ ".edit.style")
	If ls_EditStyle = 'dddw' Or ls_EditStyle = 'ddlb' Then Continue
	If ls_Disp <> "!" Then
		ls_Disp = wf_strip( ls_Disp)
		ll_Total = ddlb_column.TotalItems()+1
		is_ColumnName[ll_Total] = ls_Colu
		ddlb_column.InsertItem(ls_Disp,ll_Total)
	End If
Next

If Trim(sle_value.Text) <> "" Then
	sle_value.SetFocus()
	cb_ok.Enabled = True
End If

If	ddlb_column.TotalItems() > 0	Then
	ddlb_column.Text = ddlb_column.Text(1)
	is_column	 = 	is_ColumnName[1]
End	If


end event

type rb_all from radiobutton within w_dw_find
integer x = 1221
integer y = 312
integer width = 187
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "All"
boolean checked = true
end type

type ddlb_column from dropdownlistbox within w_dw_find
integer x = 347
integer y = 32
integer width = 1097
integer height = 396
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
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
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//is_column	= is_columnname[index]

is_Column = This.Text(Index)

end event

type cbx_wholeword from checkbox within w_dw_find
integer x = 32
integer y = 344
integer width = 658
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Match Whole Word Only"
end type

type rb_down from radiobutton within w_dw_find
integer x = 974
integer y = 312
integer width = 224
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Down"
end type

type rb_up from radiobutton within w_dw_find
integer x = 786
integer y = 312
integer width = 165
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Up"
end type

type cbx_matchcase from checkbox within w_dw_find
integer x = 32
integer y = 268
integer width = 466
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Match Case"
end type

type cb_cancel from commandbutton within w_dw_find
integer x = 1102
integer y = 436
integer width = 352
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
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

type cb_ok from commandbutton within w_dw_find
integer x = 713
integer y = 436
integer width = 352
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Find Next"
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
Long	ll_ret,ll_end,ll_startpos
String	ls_value

If Trim(sle_value.Text ) = '' Then
	MessageBox('Alert','Please specify the find criteria.')
	sle_value.SetFocus()
	Return
End If

If IsNull(idw_active) Or Not IsValid(idw_active) Then
	Return
End If

ll_ret	 = Parent.Event ue_find()
ll_end	 = idw_active.RowCount()

Choose Case ll_ret
	Case -1
		MessageBox("Alert","The find criteria you specified is incorrect. ",Exclamation!)
		sle_value.SetFocus()
	Case 0
		MessageBox("Alert","Can't find ["+sle_value.Text +"] in column [" + ddlb_column.Text + "]. ")
		sle_value.SetFocus()
	Case ll_end,1
		idw_active.ScrollToRow(ll_ret)
		idw_active.SetColumn(is_column)
		ls_value = wf_getitemany(idw_active,idw_active.GetRow(),is_column)
		If	cbx_matchcase.Checked	Then
			ll_startpos = PosA(ls_value,sle_value.Text)
		Else
			ll_startpos = PosA(Lower(ls_value),Lower(sle_value.Text))
		End	If
		//idw_active.SelectText(ll_startpos,len(sle_value.text))
		If rb_all.Checked And ll_ret = ll_end Then
			MessageBox("Alert","Search complete.")
		End If
		idw_active.SetFocus()
	Case Else
		idw_active.ScrollToRow(ll_ret)
		idw_active.SetColumn(is_column)
		ls_value = wf_getitemany(idw_active,idw_active.GetRow(),is_column)
		If	cbx_matchcase.Checked	Then
			ll_startpos = PosA(ls_value,sle_value.Text)
		Else
			ll_startpos = PosA(Lower(ls_value),Lower(sle_value.Text))
		End	If
		//idw_active.SelectText(ll_startpos,len(sle_value.text))
		idw_active.SetFocus()
End Choose

Return ll_ret

end event

type sle_value from singlelineedit within w_dw_find
event ue_keyup pbm_keyup
integer x = 347
integer y = 140
integer width = 1093
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_ensetfocus]
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.SelectText(1,LenA(This.Text))

end event

event modified;il_rowcur = 0
end event

type st_2 from statictext within w_dw_find
integer x = 69
integer y = 144
integer width = 261
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Find What:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_dw_find
integer x = 55
integer y = 48
integer width = 274
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Find Where:"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_dw_find
integer x = 731
integer y = 260
integer width = 722
integer height = 148
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Direction"
end type

