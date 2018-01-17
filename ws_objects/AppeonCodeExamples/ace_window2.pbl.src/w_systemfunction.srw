$PBExportHeader$w_systemfunction.srw
forward
global type w_systemfunction from window
end type
type em_1 from editmask within w_systemfunction
end type
type st_4 from statictext within w_systemfunction
end type
type ddlb_1 from dropdownlistbox within w_systemfunction
end type
type st_2 from statictext within w_systemfunction
end type
type cb_2 from commandbutton within w_systemfunction
end type
type cbx_null from checkbox within w_systemfunction
end type
type cb_clear from commandbutton within w_systemfunction
end type
type lb_output from listbox within w_systemfunction
end type
type st_tip from singlelineedit within w_systemfunction
end type
type cb_1 from commandbutton within w_systemfunction
end type
type lb_functionparm from listbox within w_systemfunction
end type
type lb_functionname from listbox within w_systemfunction
end type
type sle_functionparm from singlelineedit within w_systemfunction
end type
type st_1 from statictext within w_systemfunction
end type
type gb_1 from groupbox within w_systemfunction
end type
type gb_4 from groupbox within w_systemfunction
end type
type gb_2 from groupbox within w_systemfunction
end type
end forward

global type w_systemfunction from window
integer width = 2569
integer height = 1328
boolean titlebar = true
string title = "System Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_1 em_1
st_4 st_4
ddlb_1 ddlb_1
st_2 st_2
cb_2 cb_2
cbx_null cbx_null
cb_clear cb_clear
lb_output lb_output
st_tip st_tip
cb_1 cb_1
lb_functionparm lb_functionparm
lb_functionname lb_functionname
sle_functionparm sle_functionparm
st_1 st_1
gb_1 gb_1
gb_4 gb_4
gb_2 gb_2
end type
global w_systemfunction w_systemfunction

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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

integer iflag = 0
integer i = 1
n_util inv_util
pointer p1
end variables

forward prototypes
public subroutine wf_additem (string as_data, listbox alst_ctrl)
public subroutine wf_random (string as_type, listbox alst)
public function integer wf_str2array (string as_data, ref string as_rv[])
public function string wf_execute (string as_testvalue, string as_testvaluearr[])
end prototypes

public subroutine wf_additem (string as_data, listbox alst_ctrl);//====================================================================
// Function: wf_additem()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	string 	as_data  		
//		value	listbox	alst_ctrl		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long 	  ll_upperBound, ll_cur
string  ls_data[]
ll_upperBound = wf_str2array(as_data,ls_data)

for ll_cur = 1 to ll_upperBound
	alst_ctrl.AddItem(ls_data[ll_cur])
next
end subroutine

public subroutine wf_random (string as_type, listbox alst);//====================================================================
// Function: wf_random()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	string 	as_type		
//		value	listbox	alst   		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string   ls_dataType[]
String	ls_parm, ls_booltmp
long 		ll_parmNum, ll_cur
integer  li_cnt

alst.Reset()

if lower(as_type) = 'boolean' then
	alst.AddItem('True')
	alst.AddItem('False')
	return
end if

for li_cnt =  1 to 5
	ls_parm = ''
	ll_parmNum = wf_str2array(as_type, ls_dataType)
	
	for ll_cur = 1 to ll_parmNum
		ls_parm = ls_parm + ','+ inv_util.of_make_arguments(ls_dataType[ll_cur],li_cnt)
	next
	
	alst.AddItem(MidA(ls_parm, 2))
next
end subroutine

public function integer wf_str2array (string as_data, ref string as_rv[]);//====================================================================
// Function: wf_str2array()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value    	string	as_data		
//		reference	string	as_rv[]		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if isnull(as_data) or as_data = '' then return 0

long		ll_startPos, ll_endPos, ll_upperBound

ll_upperBound = 1
ll_startPos = 1
ll_endPos     = PosA(as_data, ',', ll_startPos)

do while ll_endPos <> 0
	as_rv[ll_upperBound] = MidA(as_data,ll_startPos,ll_endPos - ll_startPos)
	ll_startPos 	= ll_endPos + 1
	ll_endPos 		= PosA(as_data,',',ll_startPos)
	ll_upperBound 	= ll_upperBound + 1
loop
as_rv[ll_upperBound] = MidA(as_data,ll_startPos)
return ll_upperBound
end function

public function string wf_execute (string as_testvalue, string as_testvaluearr[]);//====================================================================
// Function: wf_execute()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	string 	as_testvalue		
//		value	string		as_testvaluearr[]   		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	caifangpeng		Date: 2006/02/24
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
int li_Null
long ll_Null
string ls_Null
string ls_ExeValue

SetNull(li_Null)
SetNull(ls_Null)
SetNull(ll_Null)

Choose Case lb_functionname.SelectedItem()
	Case 'ChooseColor'
		long j,ll_Color
		long ll_CstColors[]		
		if cbx_null.checked then
			ls_ExeValue = string(ChooseColor(ll_NULL))
		else
			ll_Color = long(as_TestValueArr[1])
			for j = 2 to UpperBound(as_TestValueArr)
				ll_CstColors[j - 1] = long(as_TestValueArr[j])
			next
			ls_ExeValue = string(ChooseColor(ll_Color, ll_CstColors))
			if ls_ExeValue="1" then
				lb_OutPut.AddItem(String(lb_OutPut.TotalItems())+".Choose color:  " + String(ll_Color))
			end if
		end if
End Choose

Return ls_ExeValue
end function

on w_systemfunction.create
this.em_1=create em_1
this.st_4=create st_4
this.ddlb_1=create ddlb_1
this.st_2=create st_2
this.cb_2=create cb_2
this.cbx_null=create cbx_null
this.cb_clear=create cb_clear
this.lb_output=create lb_output
this.st_tip=create st_tip
this.cb_1=create cb_1
this.lb_functionparm=create lb_functionparm
this.lb_functionname=create lb_functionname
this.sle_functionparm=create sle_functionparm
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_4=create gb_4
this.gb_2=create gb_2
this.Control[]={this.em_1,&
this.st_4,&
this.ddlb_1,&
this.st_2,&
this.cb_2,&
this.cbx_null,&
this.cb_clear,&
this.lb_output,&
this.st_tip,&
this.cb_1,&
this.lb_functionparm,&
this.lb_functionname,&
this.sle_functionparm,&
this.st_1,&
this.gb_1,&
this.gb_4,&
this.gb_2}
end on

on w_systemfunction.destroy
destroy(this.em_1)
destroy(this.st_4)
destroy(this.ddlb_1)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.cbx_null)
destroy(this.cb_clear)
destroy(this.lb_output)
destroy(this.st_tip)
destroy(this.cb_1)
destroy(this.lb_functionparm)
destroy(this.lb_functionname)
destroy(this.sle_functionparm)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_4)
destroy(this.gb_2)
end on

event timer;//====================================================================
// Event: timer()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_timer]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if i = 1 then
	st_tip.text = 'End time is ' +  string(now()) + '.'
	i = 0
else 
	return
end if
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y=0

ddlb_1.selectitem(1)
ddlb_1.postEvent("selectionChanged")
inv_util=create n_util
end event

type em_1 from editmask within w_systemfunction
boolean visible = false
integer x = 1719
integer y = 32
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm-dd-yyyy"
end type

type st_4 from statictext within w_systemfunction
integer x = 46
integer y = 36
integer width = 1669
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "This example shows PowerBuilder system functions that Appeon supports."
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_systemfunction
integer x = 82
integer y = 212
integer width = 782
integer height = 692
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"Array","DataType Checking and Conversion","Date,Day and Time","Miscellaneous","Numeric","String","System and Environment"}
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
// Returns: long [pbm_cbnselchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_functionname.Reset()
lb_functionparm.Reset()
sle_functionparm.Text = ''
sle_functionparm.Enabled = True
lb_functionparm.Enabled = True
cbx_null.Checked = False
cbx_null.Enabled = True

Choose Case ddlb_1.Text
	Case 'Array'
		wf_additem('LowerBound,UpperBound',lb_functionname)
		
	Case 'DataType Checking and Conversion'
		wf_additem('Asc,AscA,Char,CharA,Date,DateTime,Dec,Double,Integer,Long,IsDate,IsNull,IsNumber,IsTime,Real,String,Time',lb_functionname)
		
	Case 'Date,Day and Time'
		wf_additem('Day,DayName,DayNumber,DaysAfter,Hour,Minute,Month,Now,RelativeDate,RelativeTime,Second,SecondsAfter,Today,Year',lb_functionname)
		
	Case 'Miscellaneous'
		wf_additem('ClassName,IntHigh,IntLow,IsValid,MessageBox,SetNull,SetPointer',lb_functionname)
		
	Case 'Numeric'
		wf_additem('Abs,ACos,ASin,ATan,Ceiling,Cos,Exp,Fact,Int,Log,LogTen,Max,Min,Mod,Pi,Rand,Round,Sign,Sin,Sqrt,Tan,Truncate',lb_functionname)

	Case 'String'
		wf_additem('Asc,AscA,Char,CharA,Fill,FillA,LastPos,Left,LeftA,LeftTrim,Len,LenA,Lower,Match,Mid,MidA,Pos,PosA,Replace,ReplaceA,Reverse,Right,RightA,RightTrim,Space,Trim,WordCap,Upper',lb_functionname)
		
	Case 'System and Environment'
//		wf_additem('GetApplication,HyperlinkToURL,CommandParm,ClipBoard,GetEnvironment,PixelsToUnits,UnitsToPixels',lb_functionname)
		wf_additem('GetApplication,CommandParm,ClipBoard,GetEnvironment,PixelsToUnits,UnitsToPixels,Run,Cpu,Beep,Sleep,ChooseColor',lb_functionname)
End Choose

end event

type st_2 from statictext within w_systemfunction
integer x = 1682
integer y = 852
integer width = 489
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Last Return Value:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_systemfunction
integer x = 2089
integer y = 1048
integer width = 366
integer height = 100
integer taborder = 60
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
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type cbx_null from checkbox within w_systemfunction
integer x = 983
integer y = 1068
integer width = 215
integer height = 80
integer textsize = -8
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

If this.Checked then 
	lb_functionparm.enabled = false 
	sle_functionparm.enabled = false 
else 
	lb_functionparm.enabled = true 
	sle_functionparm.enabled = true 
end if
end event

type cb_clear from commandbutton within w_systemfunction
integer x = 1678
integer y = 1048
integer width = 366
integer height = 100
integer taborder = 60
integer textsize = -8
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

lb_OutPut.Reset()
end event

type lb_output from listbox within w_systemfunction
integer x = 1673
integer y = 208
integer width = 782
integer height = 624
integer taborder = 50
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
boolean extendedselect = true
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

st_tip.text = This.SelectedItem()
end event

type st_tip from singlelineedit within w_systemfunction
integer x = 1673
integer y = 932
integer width = 782
integer height = 92
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

type cb_1 from commandbutton within w_systemfunction
integer x = 1216
integer y = 1048
integer width = 366
integer height = 100
integer taborder = 50
integer textsize = -8
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
//	        zhouchaoqun     date:2005-03-01
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String strtip , strexevalue, strtestvalue
String strar[]
Int 	 parmnumber
date   ld_date
n_resfile  lnv_file

//Test NUll Value as a Argument;
Int li_null
long ll_Null
String ls_null
CommandButton cb_null
SetNull(cb_null)
SetNull(li_null)
SetNull(ls_null)
SetNull(ll_Null)

strtestvalue = sle_functionparm.Text
parmnumber = wf_str2array(strtestvalue,strar)

If IsNull(strtestvalue) Then strtestvalue = ''

If lb_functionname.SelectedIndex() < 0 Then
	iFlag = 1
	MessageBox('Warning','Please select testing function.')
	Return
End If

If cbx_null.Checked Then
Else
	If strtestvalue = '' And lb_functionparm.TotalItems() > 0 Then
		iFlag = 1
		MessageBox('Warning','Please select testing data.')
		Return
	End If
	iFlag = 0
End If

Choose Case lb_functionname.SelectedItem()
	Case 'LowerBound'
		Integer a[5], b[2,5]
		Integer c[]
		
		If cbx_null.Checked Then
			strexevalue = String(LowerBound(a,li_null))
		Else
			Choose Case strtestvalue
				Case 'a[5],LowerBound(a)'
					strexevalue = String(LowerBound(a))
					
				Case 'a[5],LowerBound(a,1)'
					strexevalue = String(LowerBound(a,1))
					
				Case 'a[5],LowerBound(a,2)'
					strexevalue = String(LowerBound(a,2))
					
				Case 'b[2,5],LowerBound(b, 2)'
					strexevalue = String(LowerBound(b,2))
					
				Case 'c[],LowerBound(c)'
					strexevalue = String(LowerBound(c))
					
				Case 'c[50] = 90,LowerBound(c)'
					c[50] = 90
					strexevalue = String(LowerBound(c))
					
				Case 'd[-10 to 50],LowerBound(d)'
					Integer d[-10 To 50]
					strexevalue = String(LowerBound(d))
					
			End Choose
		End If
		
	Case 'UpperBound'
		Integer a1[5],b1[10,20],c1[ ]
		
		If cbx_null.Checked Then
			strexevalue = String(UpperBound(a1,li_null))
		Else
			Choose Case strtestvalue
				Case 'a[5],UpperBound(a)'
					strexevalue = String(UpperBound(a1))
					
				Case 'a[5],UpperBound(a,1)'
					strexevalue = String(UpperBound(a1,1))
					
				Case 'a[5],UpperBound(a,2)'
					strexevalue = String(UpperBound(a1,2))
					
				Case 'b[10,20],UpperBound(b, 1)'
					strexevalue = String(UpperBound(b1,1))
					
				Case 'b[10,20],UpperBound(b, 2)'
					strexevalue = String(UpperBound(b1,2))
					
				Case 'c[],UpperBound(c)'
					strexevalue = String(UpperBound(c1))
					
				Case 'c[50] = 900,UpperBound(c)'
					c1[50] = 900
					strexevalue = String(UpperBound(c1))
					
				Case 'c[60] = 800,UpperBound(c)'
					c1[60] = 800
					strexevalue = String(UpperBound(c1))
					
				Case 'c[60] = 800, c[50] = 700,UpperBound(c)'
					c1[60] = 800
					c1[50] = 700
					strexevalue = String(UpperBound(c1))
					
				Case 'd[10 to 50],UpperBound(d)'
					Int d1[10 To 50]
					strexevalue = String(UpperBound(d1))
					
			End Choose
			
		End If
		
	Case 'Asc'
		If cbx_null.Checked Then
			strexevalue = String(Asc(ls_null))
		Else
			strexevalue = String(Asc(strtestvalue))
		End If
		
	Case 'AscA'
		If cbx_null.Checked Then
			strexevalue = String(AscA(ls_null))
		Else
			strexevalue = String(AscA(strtestvalue))
		End If
		
	Case 'Char'
		If cbx_null.Checked Then
			strexevalue = String(Char(li_null))
		Else
			strexevalue = Char(Integer(strtestvalue))
		End If
		
	Case 'CharA'
		If cbx_null.Checked Then
			strexevalue = String(CharA(li_null))
		Else
			strexevalue = CharA(Integer(strtestvalue))
		End If
		
	Case 'Date'
		If cbx_null.Checked Then
			strexevalue = String(Date(ls_null))
		Else
			strexevalue = String(Date(strtestvalue))
		End If
		
	Case 'DateTime'
		If cbx_null.Checked Then
			strexevalue = String(DateTime(Date(ls_null),Time(ls_null)))
		Else
			If parmnumber = 2 Then
				strexevalue = String(DateTime(Date(strar[1]),Time(strar[2])))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'Dec'
		If cbx_null.Checked Then
			strexevalue = String(Dec(li_null))
		Else
			strexevalue = String(Dec(strtestvalue))
		End If
		
	Case 'Double'
		If cbx_null.Checked Then
			strexevalue = String(Dec(li_null))
		Else
			strexevalue = String(Double(strtestvalue))
		End If
		
	Case 'Integer'
		If cbx_null.Checked Then
			strexevalue = String(Integer(li_null))
		Else
			strexevalue = String(Integer(strtestvalue))
		End If
		
	Case 'Long'
		If cbx_null.Checked Then
			strexevalue = String(Long(li_null))
		Else
			If parmnumber = 1 Then
				strexevalue = String(Long(strtestvalue))
			ElseIf parmnumber = 2 Then
				strexevalue = String(Long(Integer(strar[1]),Integer(strar[2])))
			Else
				MessageBox('Warning','The parameter number should be 1 or 2.')
				Return
			End If
		End If
		
	Case 'IsDate'
		If cbx_null.Checked Then
			strexevalue = String(IsDate(ls_null))
		Else
			strexevalue = String(IsDate(strtestvalue))
		End If
		
	Case 'IsNull'
		If cbx_null.Checked Then
			strexevalue = String(IsNull(li_null))
		Else
			Choose Case strtestvalue
				Case 'NullVariable'
					/*String ab
					SetNull(ab)
					strexevalue = String(IsNull(ab))*/
					string ls_NullVariable
					
					SetNull(ls_NullVariable)
					strexevalue = String(IsNull(ls_NullVariable))
				Case 'sle_functionparm'
					strexevalue = String(IsNull(sle_functionparm.Text))
			End Choose
		End If
		
		
	Case 'IsNumber'
		If cbx_null.Checked Then
			strexevalue = String(IsNumber(ls_null))
		Else
			strexevalue = String(IsNumber(strtestvalue))
		End If
		
	Case 'IsTime'
		If cbx_null.Checked Then
			strexevalue = String(IsTime(ls_null))
		Else
			strexevalue = String(IsTime(strtestvalue))
		End If
		
	Case 'Real'
		If cbx_null.Checked Then
			strexevalue = String(Real(li_null))
		Else
			strexevalue = String(Real(strtestvalue))
		End If
		
	Case 'String'
		If cbx_null.Checked Then
			strexevalue = String(ls_null)
		Else
			Choose Case strtestvalue
				Case '1993-05-17'
					strexevalue = String(1993-05-17)
					
				Case '1990/7/21 03:23:32'
					strexevalue = String(DateTime(1990-07-21, 03:23:32))
					
				Case '4563.54'
					strexevalue = String(4563.54)
					
				Case '07:12:28'
					strexevalue = String(07:12:28)
					
				Case 'dfjlj'
					strexevalue = String('dfjlj')
					
				Case Else
					strexevalue = String(strtestvalue)
					
			End Choose
			
		End If
		
	Case 'Time'
		If cbx_null.Checked Then
			strexevalue = String(Time(ls_null))
		Else
			strexevalue = String(Time(strtestvalue))
		End If
		
	Case 'Day'
		If cbx_null.Checked Then
			strexevalue = String(Day(Date(ls_null)))
		Else
			choose case strtestvalue
				case '11-25-1999','03/15/2080'
					em_1.text = strtestvalue
					em_1.getdata(ld_date)
					strexevalue = String(Day(ld_date))
				case else
					strexevalue = String(Day(Date(strtestvalue)))
			end choose			
		End If
	Case 'DayName'
		If cbx_null.Checked Then
			strexevalue = String(DayName(Date(ls_null)))
		Else
			strexevalue = String(DayName(Date(strtestvalue)))
		End If
		
	Case 'DayNumber'
		If cbx_null.Checked Then
			strexevalue = String(DayNumber(Date(ls_null)))
		Else
			strexevalue = String(DayNumber(Date(strtestvalue)))
		End If
		
	Case 'DaysAfter'
		If cbx_null.Checked Then
			strexevalue = String(DaysAfter(Date(ls_null),Date(ls_null)))
		Else
			If parmnumber = 2 Then
				strexevalue = String(DaysAfter(Date(strar[1]),Date(strar[2])))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'Hour'
		If cbx_null.Checked Then
			strexevalue = String(Hour(Time(ls_null)))
		Else
			strexevalue = String(Hour(Time(strtestvalue)))
		End If
		
	Case 'Minute'
		If cbx_null.Checked Then
			strexevalue = String(Minute(Time(ls_null)))
		Else
			strexevalue = String(Minute(Time(strtestvalue)))
		End If
		
	Case 'Month'
		If cbx_null.Checked Then
			strexevalue = String(Month(Date(ls_null)))
		Else
			strexevalue = String(Month(Date(strtestvalue)))
		End If
		
	Case 'Now'
		strexevalue = String(Now())
		
	Case 'RelativeDate'
		If cbx_null.Checked Then
			strexevalue = String(RelativeDate(Date(ls_null),li_null))
		Else
			If parmnumber = 2 Then
				strexevalue = String(RelativeDate(Date(strar[1]),Integer(strar[2])))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'RelativeTime'
		If cbx_null.Checked Then
			strexevalue = String(RelativeTime(Time(ls_null),li_null))
		Else
			If parmnumber = 2 Then
				strexevalue = String(RelativeTime(Time(strar[1]),Integer(strar[2])))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'Second'
		If cbx_null.Checked Then
			strexevalue = String(Second(Time(ls_null)))
		Else
			strexevalue = String(Second(Time(strtestvalue)))
		End If
		
	Case 'SecondsAfter'
		If cbx_null.Checked Then
			strexevalue = String(SecondsAfter(Time(ls_null),Time(ls_null)))
		Else
			If parmnumber = 2 Then
				strexevalue = String(SecondsAfter(Time(strar[1]),Time(strar[2])))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'Today'
		strexevalue = String(Today())
		
	Case 'Year'
		If cbx_null.Checked Then
			strexevalue = String(Year(Date(ls_null)))
		Else
			strexevalue = String(Year(Date(strtestvalue)))
		End If
		
	Case 'ClassName'
		If cbx_null.Checked Then
			strexevalue = ClassName(ls_null)
		Else
			Choose Case strtestvalue
				Case 'strvar'
					String strvar
					strexevalue = ClassName(strvar)
					
				Case 'intvar'
					Integer intvar
					strexevalue = ClassName(intvar)
					
				Case 'longvar'
					Long longvar
					strexevalue = ClassName(longvar)
					
				Case 'lb_functionparm'
					strexevalue = lb_functionparm.ClassName()
					
				Case 'cb_1'
					strexevalue = cb_1.ClassName()
					
			End Choose
			
		End If
		
	Case 'IntHigh'
		If cbx_null.Checked Then
			strexevalue = String(IntHigh(Long(li_null)))
		Else
			strexevalue = String(IntHigh(Long(strtestvalue)))
		End If
		
	Case 'IntLow'
		If cbx_null.Checked Then
			strexevalue = String(IntLow(Long(li_null)))
		Else
			strexevalue = String(IntLow(Long(strtestvalue)))
		End If
		
	Case 'IsValid'
		If cbx_null.Checked Then
			strexevalue = String(IsValid(cb_null))
		Else
			Choose Case strtestvalue
				Case 'w_splash'
					strexevalue = String(IsValid(w_splash))
					
				Case 'cb_1'
					strexevalue = String(IsValid(cb_1))
					
				Case 'sqlca'
					strexevalue = String(IsValid(sqlca))
					
				Case Else
					strexevalue = 'no object'
					
			End Choose
		End If
		
	Case 'KeyDown'
		If cbx_null.Checked Then
			strexevalue = String(KeyDown(AscA(ls_null)))
		Else
			Choose Case strtestvalue
				Case 'KeySpaceBar!'
					If KeyDown(KeySpaceBar!) Then
						strexevalue = 'KeySpaceBar!'
					End If
					
				Case 'KeyEqual!'
					If KeyDown(KeyEqual!) Then
						strexevalue = 'KeyEqual!'
					End If
					
				Case 'KeySemiColon!'
					If KeyDown(KeySemiColon!) Then
						strexevalue = 'KeySemiColon!'
					End If
					
				Case 'KeyShift!'
					If KeyDown(KeyShift!) Then
						strexevalue = 'KeyShift!'
					End If
					
				Case 'KeyF1!'
					If KeyDown(KeyF1!) Then
						strexevalue = 'KeyF1!'
					End If
					
				Case 'KeyLeftArrow!'
					If KeyDown(KeyLeftArrow!) Then
						strexevalue = 'KeyLeftArrow!'
					End If
					
				Case 'KeyNumpad0!'
					If KeyDown(KeyNumpad0!) Then
						strexevalue = 'KeyNumpad0!'
					End If
					
				Case Else
					If KeyDown(AscA(strtestvalue)) Then
						strexevalue = String(AscA(strtestvalue))
					End If
					
			End Choose
		End If
		
	Case 'MessageBox'
		If cbx_null.Checked Then
			strexevalue = String(MessageBox(ls_null,ls_null,Information!,OK!,1))
		Else
			Choose Case strtestvalue
				Case "'Title1','Text1',Information!,OK!,1"
					strexevalue = String(MessageBox('Title1','Text1',Information!,OK!,1))
					
				Case "'Title2','Text2',StopSign!,OKCancel!,2"
					strexevalue = String(MessageBox('Title2','Text2',StopSign!,OKCancel!,2))
					
				Case "'Title3','Text3',Exclamation!,YesNoCancel!,3"
					strexevalue = String(MessageBox('Title3','Text3',Exclamation!,YesNoCancel!,3))
					
				Case "'Title4','Text4',Question!,RetryCancel!,1"
					strexevalue = String(MessageBox('Title4','Text4',Question!,RetryCancel!,1))
					
			End Choose
		End If
		
	Case 'RGB'
		If cbx_null.Checked Then
			strexevalue = String(RGB(li_null,li_null,li_null))
		Else
			If parmnumber = 3 Then
				strexevalue = String(RGB(Integer(strar[1]),Integer(strar[2]),Integer(strar[3])))
			Else
				MessageBox('Warning','The parameter number should be 3.')
				Return
			End If
		End If
		
	Case 'SetNull'
		If cbx_null.Checked Then
			strexevalue = String(SetNull(ls_null))
		Else
			Choose Case strtestvalue
				Case 'inttest'
					Integer inttest
					strexevalue = String(SetNull(inttest))
				Case 'sle_functionparm.text'
					ls_null = sle_functionparm.Text
					strexevalue = String(SetNull(ls_null))
			End Choose
		End If
		
		SetNull(strexevalue)
		
	Case 'SetPointer'
		Choose Case strtestvalue
			Case 'Arrow!'
				p1 = SetPointer(Arrow!)
				
			Case 'Cross!'
				p1 = SetPointer(Cross!)
				
			Case 'Beam!'
				p1 = SetPointer(Beam!)
				
			Case 'HourGlass!'
				p1 = SetPointer(HourGlass!)
				
			Case 'SizeNS!'
				p1 = SetPointer(SizeNs!)
				
			Case 'SizeNESW!'
				p1 = SetPointer(SizeNESW!)
				
			Case 'SizeWE!'
				p1 = SetPointer(SizeWE!)
				
			Case 'SizeNWSE!'
				p1 = SetPointer(SizeNWSE!)
				
			Case 'UpArrow!'
				p1 = SetPointer(UpArrow!)
				
		End Choose
		
		Choose Case p1
			Case UpArrow!
				strexevalue = 'UpArrow!'
				
			Case SizeNWSE!
				strexevalue = 'SizeNWSE!'
				
			Case SizeWE!
				strexevalue = 'SizeWE!'
				strexevalue = 'SizeNS!'
				
			Case SizeNESW!
				strexevalue = 'SizeNESW!'
				
			Case HourGlass!
				strexevalue = 'HourGlass!'
				
			Case Beam!
				strexevalue = 'Beam!'
				
			Case Cross!
				strexevalue = 'Cross!'
				
			Case Arrow!
				strexevalue = 'Arrow!'
				
		End Choose
		
	Case 'Abs'
		If cbx_null.Checked Then
			strexevalue = String(Abs(li_null))
		Else
			If IsNumber(strtestvalue) And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Abs(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Abs(Dec(strtestvalue)))
			End If
		End If
		
	Case 'ACos'
		If cbx_null.Checked Then
			strexevalue = String(Acos(li_null))
		Else
			If IsNumber(strtestvalue) And Abs(Dec(strtestvalue)) <= 1 Then
				strexevalue = String(Acos(Dec(strtestvalue)))
			Else
				MessageBox('Warning','Parameter error.')
			End If
		End If
		
	Case 'ASin'
		If cbx_null.Checked Then
			strexevalue = String(ASin(li_null))
		Else
			If IsNumber(strtestvalue) And Abs(Dec(strtestvalue)) <= 1 Then
				strexevalue = String(ASin(Dec(strtestvalue)))
			Else
				MessageBox('Warning','Parameter error.')
			End If
		End If
		
	Case 'ATan'
		If cbx_null.Checked Then
			strexevalue = String(ATan(li_null))
		Else
			If IsNumber(strtestvalue) And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(ATan(Integer(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(ATan(Dec(strtestvalue)))
			End If
		End If
		
	Case 'Ceiling'
		If cbx_null.Checked Then
			strexevalue = String(Ceiling(li_null))
		Else
			If IsNumber(strtestvalue) And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Ceiling(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Ceiling(Dec(strtestvalue)))
			End If
		End If
		
	Case 'Cos'
		If cbx_null.Checked Then
			strexevalue = String(Cos(li_null))
		Else
			If IsNumber(strtestvalue) And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Cos(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Cos(Dec(strtestvalue)))
			End If
		End If
		
	Case 'Exp'
		If cbx_null.Checked Then
			strexevalue = String(Exp(li_null))
		Else
			If IsNumber(strtestvalue) And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Exp(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Exp(Dec(strtestvalue)))
			End If
		End If
		
	Case 'Fact'
		If cbx_null.Checked Then
			strexevalue = String(Fact(li_null))
		Else
			If IsNumber(strtestvalue) And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Fact(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Fact(Dec(strtestvalue)))
			End If
		End If
		
	Case 'Int'
		If cbx_null.Checked Then
			strexevalue = String(Int(li_null))
		Else
			If IsNumber(strtestvalue) And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Int(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Int(Dec(strtestvalue)))
			End If
		End If
		
	Case 'Log'
		If cbx_null.Checked Then
			strexevalue = String(Log(li_null))
		Else
			If IsNumber(strtestvalue) And Double(strtestvalue)  > 0 And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Log(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And Dec(strtestvalue) > 0 And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Log(Dec(strtestvalue)))
			Else
				MessageBox('Warning','Parameter error.')
				Return
			End If
		End If
		
	Case 'LogTen'
		If cbx_null.Checked Then
			strexevalue = String(LogTen(li_null))
		Else
			If IsNumber(strtestvalue) And Double(strtestvalue)  > 0 And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(LogTen(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And Dec(strtestvalue) > 0 And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(LogTen(Dec(strtestvalue)))
			Else
				MessageBox('Warning','Parameter error.')
				Return
			End If
		End If
		
	Case 'Max'
		If cbx_null.Checked Then
			strexevalue = String(Max(li_null,li_null))
		Else
			If parmnumber = 2 Then
				If IsNumber(strar[1]) And PosA(strar[1],'.') = 0 And IsNumber(strar[2]) And PosA(strar[2],'.') = 0 Then
					strexevalue = String(Max(Double(strar[1]),Double(strar[2])))
				ElseIf IsNumber(strar[1]) And PosA(strar[1],'.') > 0 And IsNumber(strar[2]) And PosA(strar[2],'.') > 0 Then
					strexevalue = String(Max(Dec(strar[1]),Dec(strar[2])))
				ElseIf IsNumber(strar[1]) And PosA(strar[1],'.') > 0 And IsNumber(strar[2]) And PosA(strar[2],'.') = 0 Then
					strexevalue = String(Max(Dec(strar[1]),Double(strar[2])))
				ElseIf IsNumber(strar[1]) And PosA(strar[1],'.') = 0 And IsNumber(strar[2]) And PosA(strar[2],'.') > 0 Then
					strexevalue = String(Max(Double(strar[1]),Dec(strar[2])))
				End If
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'Min'
		If cbx_null.Checked Then
			strexevalue = String(Min(li_null,li_null))
		Else
			If parmnumber = 2 Then
				If IsNumber(strar[1]) And PosA(strar[1],'.') = 0 And IsNumber(strar[2]) And PosA(strar[2],'.') = 0 Then
					strexevalue = String(Min(Double(strar[1]),Double(strar[2])))
				ElseIf IsNumber(strar[1]) And PosA(strar[1],'.') > 0 And IsNumber(strar[2]) And PosA(strar[2],'.') > 0 Then
					strexevalue = String(Min(Dec(strar[1]),Dec(strar[2])))
				ElseIf IsNumber(strar[1]) And PosA(strar[1],'.') > 0 And IsNumber(strar[2]) And PosA(strar[2],'.') = 0 Then
					strexevalue = String(Min(Dec(strar[1]),Double(strar[2])))
				ElseIf IsNumber(strar[1]) And PosA(strar[1],'.') = 0 And IsNumber(strar[2]) And PosA(strar[2],'.') > 0 Then
					strexevalue = String(Min(Double(strar[1]),Dec(strar[2])))
				End If
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'Mod'
		If cbx_null.Checked Then
			strexevalue = String(Mod(li_null,li_null))
		Else
			If parmnumber = 2 Then
				If IsNumber(strar[1]) And PosA(strar[1],'.') = 0 And IsNumber(strar[2]) And PosA(strar[2],'.') = 0 Then
					strexevalue = String(Mod(Double(strar[1]),Double(strar[2])))
				ElseIf IsNumber(strar[1]) And PosA(strar[1],'.') > 0 And IsNumber(strar[2]) And PosA(strar[2],'.') > 0 Then
					strexevalue = String(Mod(Dec(strar[1]),Dec(strar[2])))
				ElseIf IsNumber(strar[1]) And PosA(strar[1],'.') > 0 And IsNumber(strar[2]) And PosA(strar[2],'.') = 0 Then
					strexevalue = String(Mod(Dec(strar[1]),Double(strar[2])))
				ElseIf IsNumber(strar[1]) And PosA(strar[1],'.') = 0 And IsNumber(strar[2]) And PosA(strar[2],'.') > 0 Then
					strexevalue = String(Mod(Double(strar[1]),Dec(strar[2])))
				End If
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'Pi'
		If cbx_null.Checked Then
			strexevalue = String(Pi(li_null))
		Else
			If IsNumber(strtestvalue) And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Pi(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Pi(Dec(strtestvalue)))
			End If
		End If
		
	Case 'Rand'
		If cbx_null.Checked Then
			strexevalue = String(Rand(li_null))
		Else
			strexevalue = String(Rand(Integer(strtestvalue)))
		End If
		
	Case 'Round'
		If cbx_null.Checked Then
			strexevalue = String(Round(li_null,li_null))
		Else
			If parmnumber = 2 Then
				strexevalue = String(Round(Dec(strar[1]),Double(strar[2])))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'Sign'
		If cbx_null.Checked Then
			strexevalue = String(Sign(li_null))
		Else
			If IsNumber(strtestvalue) And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Sign(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Sign(Dec(strtestvalue)))
			End If
		End If
		
	Case 'Sin'
		If cbx_null.Checked Then
			strexevalue = String(Sin(li_null))
		Else
			If IsNumber(strtestvalue) And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Sin(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Sin(Dec(strtestvalue)))
			End If
		End If
		
	Case 'Sqrt'
		If cbx_null.Checked Then
			strexevalue = String(Sqrt(li_null))
		Else
			If IsNumber(strtestvalue) And Double(strtestvalue)  > 0 And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Sqrt(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And Dec(strtestvalue) > 0 And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Sqrt(Dec(strtestvalue)))
			Else
				MessageBox('Warning','Parameter error.')
				Return
			End If
		End If
		
	Case 'Tan'
		If cbx_null.Checked Then
			strexevalue = String(Tan(li_null))
		Else
			If IsNumber(strtestvalue) And PosA(strtestvalue,'.') = 0 Then
				strexevalue = String(Tan(Double(strtestvalue)))
			ElseIf IsNumber(strtestvalue) And PosA(strtestvalue,'.') > 0 Then
				strexevalue = String(Tan(Dec(strtestvalue)))
			End If
		End If
		
	Case 'Truncate'
		If cbx_null.Checked Then
			strexevalue = String(Truncate(li_null,li_null))
		Else
			If parmnumber = 2 Then
				strexevalue = String(Truncate(Dec(strar[1]),Double(strar[2])))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If

	Case 'Fill'
		If cbx_null.Checked Then
			strexevalue = String(Fill(ls_null,li_null))
		Else
			If parmnumber = 2 Then
				strexevalue = String(Fill(strar[1],Integer(strar[2])))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'FillA'
		If cbx_null.Checked Then
			strexevalue = String(FillA(ls_null,li_null))
		Else
			If parmnumber = 2 Then
				strexevalue = String(FillA(strar[1],Integer(strar[2])))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'LastPos'
		If cbx_null.Checked Then
			strexevalue = String(LastPos(ls_null,ls_null,li_null))
		Else
			Choose Case  parmnumber
				Case 3
					strexevalue = String(LastPos(strar[1],strar[2],Integer(strar[3])))
				Case 2
					strexevalue = String(LastPos(strar[1],strar[2]))
				Case Else
					MessageBox('Warning','The parameter number should be 2 or 3.')
					Return
			End Choose
		End If
		
	Case 'Left'
		If cbx_null.Checked Then
			strexevalue = String(Left(ls_null,li_null))
		Else
			If parmnumber = 2 Then
				strexevalue = Left(strar[1],Integer(strar[2]))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'LeftA'
		If cbx_null.Checked Then
			strexevalue = String(LeftA(ls_null,li_null))
		Else
			If parmnumber = 2 Then
				strexevalue = LeftA(strar[1],Integer(strar[2]))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If		
		
	Case 'LeftTrim'
		If cbx_null.Checked Then
			strexevalue = String(LeftTrim(ls_null))
		Else
			strexevalue = LeftTrim(strtestvalue)
		End If
		
	Case 'Len'
		If cbx_null.Checked Then
			strexevalue = String(Len(ls_null))
		Else
			strexevalue = String(Len(strtestvalue))
		End If
		
	Case 'LenA'
		If cbx_null.Checked Then
			strexevalue = String(LenA(ls_null))
		Else
			strexevalue = String(LenA(strtestvalue))
		End If		
		
	Case 'Lower'
		If cbx_null.Checked Then
			strexevalue = String(Lower(ls_null))
		Else
			strexevalue = Lower(strtestvalue)
		End If
		
	Case 'Match'
		If cbx_null.Checked Then
			strexevalue = String(Match(ls_null,ls_null))
		Else
			If parmnumber = 2 Then
				strexevalue = String(Match(strar[1],strar[2]))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'Mid'
		If cbx_null.Checked Then
			strexevalue = String(Mid(ls_null,li_null))
		Else
			Choose Case  parmnumber
				Case 3
					strexevalue = String(Mid(strar[1],Integer(strar[2]),Integer(strar[3])))
				Case 2
					strexevalue = String(Mid(strar[1],Integer(strar[2])))
				Case Else
					MessageBox('Warning','The parameter number should be 2 or 3.')
					Return
			End Choose
		End If

	Case 'MidA'
		If cbx_null.Checked Then
			strexevalue = String(MidA(ls_null,li_null))
		Else
			Choose Case  parmnumber
				Case 3
					strexevalue = String(MidA(strar[1],Integer(strar[2]),Integer(strar[3])))
				Case 2
					strexevalue = String(MidA(strar[1],Integer(strar[2])))
				Case Else
					MessageBox('Warning','The parameter number should be 2 or 3.')
					Return
			End Choose
		End If
		
	Case 'Pos'
		If cbx_null.Checked Then
			strexevalue = String(Pos(ls_null,ls_null))
		Else
			Choose Case  parmnumber
				Case 3
					strexevalue = String(Pos(strar[1],strar[2],Integer(strar[3])))
				Case 2
					strexevalue = String(Pos(strar[1],strar[2]))
				Case Else
					MessageBox('Warning','The parameter number should be 2 or 3.')
					Return
			End Choose
		End If

	Case 'PosA'
		If cbx_null.Checked Then
			strexevalue = String(PosA(ls_null,ls_null))
		Else
			Choose Case  parmnumber
				Case 3
					strexevalue = String(PosA(strar[1],strar[2],Integer(strar[3])))
				Case 2
					strexevalue = String(PosA(strar[1],strar[2]))
				Case Else
					MessageBox('Warning','The parameter number should be 2 or 3.')
					Return
			End Choose
		End If
		
	Case 'Replace'
		If cbx_null.Checked Then
			strexevalue = String(Replace(ls_null,li_null,li_null,ls_null))
		Else
			If parmnumber = 4 Then
				strexevalue = Replace(strar[1],Integer(strar[2]),Integer(strar[3]),strar[4])
			Else
				MessageBox('Warning','The parameter number should be 4.')
				Return
			End If
		End If
		
	Case 'ReplaceA'
		If cbx_null.Checked Then
			strexevalue = String(ReplaceA(ls_null,li_null,li_null,ls_null))
		Else
			If parmnumber = 4 Then
				strexevalue = ReplaceA(strar[1],Integer(strar[2]),Integer(strar[3]),strar[4])
			Else
				MessageBox('Warning','The parameter number should be 4.')
				Return
			End If
		End If
		
	Case 'Reverse'
		If cbx_null.Checked Then
			strexevalue = String(Reverse(ls_null))
		Else
			strexevalue = Reverse(strtestvalue)
		End If
		
	Case 'Right'
		If cbx_null.Checked Then
			strexevalue = String(Right(ls_null,li_null))
		Else
			If parmnumber = 2 Then
				strexevalue = Right(strar[1],Integer(strar[2]))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If

	Case 'RightA'
		If cbx_null.Checked Then
			strexevalue = String(RightA(ls_null,li_null))
		Else
			If parmnumber = 2 Then
				strexevalue = RightA(strar[1],Integer(strar[2]))
			Else
				MessageBox('Warning','The parameter number should be 2.')
				Return
			End If
		End If
		
	Case 'RightTrim'
		If cbx_null.Checked Then
			strexevalue = RightTrim(ls_null)
		Else
			strexevalue = RightTrim(strtestvalue)
		End If
		
	Case 'Space'
		If cbx_null.Checked Then
			strexevalue = Space(li_null)
		Else
			strexevalue = Space(Integer(strtestvalue))
		End If
		
	Case 'Trim'
		If cbx_null.Checked Then
			strexevalue = Trim(ls_null)
		Else
			strexevalue = Trim(strtestvalue)
		End If
		
	Case 'WordCap'
		If cbx_null.Checked Then
			strexevalue = WordCap(ls_null)
		Else
			strexevalue = WordCap(strtestvalue)
		End If
		
	Case 'Upper'
		If cbx_null.Checked Then
			strexevalue = Upper(ls_null)
		Else
			strexevalue = Upper(strtestvalue)
		End If
		
	Case 'GetApplication'
		Application app
		app = GetApplication()
		strexevalue = app.AppName
	
	case 'CommandParm'
		strexevalue = Trim(CommandParm())
	
   case 'HyperlinkToURL'	
//		inet linet
//		linet = create inet
//		IF cbx_null.checked Then 
//			strexevalue = string(linet.HyperlinkToURL(ls_null))
//		Else			
//			strexevalue = string(linet.HyperlinkToURL(strtestvalue))
//		End IF
   Case 'ClipBoard'
		strexevalue = ClipBoard(strtestvalue)
	
	Case 'GetEnvironment'
		environment env
		integer rtn
		string ls_Rtn
		rtn = GetEnvironment(env)
		lb_OutPut.AddItem("Return value:  ")
		CHOOSE CASE env.OSType
			CASE aix!
				ls_Rtn = 'aix'
			CASE Windows!
				ls_Rtn = 'Windows'
			CASE WindowsNT!
				ls_Rtn = 'WindowsNT'
			CASE ELSE
				ls_Rtn = 'Other'
			END CHOOSE
		strexevalue = "Operate System:" + ls_Rtn
		lb_OutPut.AddItem(strexevalue)
		CHOOSE CASE env.CharSet
			CASE CharSetAnsi!
				ls_Rtn = 'CharSetAnsi'
			CASE CharSetUnicode!
				ls_Rtn = 'CharSetUnicode'
			CASE CharSetDBCSJapanese!
				ls_Rtn = 'CharSetDBCSJapanese'
			END CHOOSE
		strexevalue = "CharSet	:" + ls_Rtn
		lb_OutPut.AddItem(strexevalue)
		RETURN
		
	Case 'PixelsToUnits'
		if UpperBound(strar)<>2 then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		end if
		wf_str2array(strtestvalue,strar[])
		if strar[2] = 'XPixelsToUnits!' then
			strexevalue = String(PixelsToUnits(integer(strar[1]),XPixelsToUnits!))
		else
			strexevalue = String(PixelsToUnits(integer(strar[1]),YPixelsToUnits!))
		end if
		
	Case 'UnitsToPixels'
		if UpperBound(strar)<>2 then
			MessageBox('Warning','The parameter number should be 2.')
			Return
		end if
//		debugbreak()
		wf_str2array(strtestvalue,strar[])
		if strar[2] = 'XUnitsToPixels!' then
			strexevalue = String(UnitsToPixels(integer(strar[1]),XUnitsToPixels!))
		else
			strexevalue = String(UnitsToPixels(integer(strar[1]),YUnitsToPixels!))
		end if
	Case 'Run'
		   if cbx_null.checked then
				strexevalue = string(Run(ls_null))
			else				
				if strtestvalue = 'MSpaint.exe' then
					strexevalue = string(Run('MSpaint.exe'))
				else
					if lnv_file.of_writefile('ImportFile.txt') = -1 then return
					
					strexevalue = string(Run('NotePad.EXE  ' + lnv_file.IS_FilePath + 'ImportFile.txt',Maximized!))
				end if
		   end if
	Case 'Cpu'	
		strexevalue = string(Cpu())
	Case 'Beep'
		if cbx_null.checked then
			strexevalue = string(Beep(li_NULL))
		else
			strexevalue = string(Beep(long(strtestvalue)))
		end if		
	Case 'Sleep'
		if cbx_null.checked then
			strexevalue = string(Sleep(li_NULL))	
		else
			strexevalue = string(Sleep(long(strtestvalue)))
		end if
	Case Else
		strexevalue = wf_Execute(strtestvalue, strar)
End Choose

If IsNull(strexevalue) Then strexevalue = 'NULL'
strtip =  "Return value is " + strexevalue + "."
st_tip.Text = strtip

lb_OutPut.AddItem(String(lb_OutPut.TotalItems())+".Return value:  "+strexevalue)
end event

type lb_functionparm from listbox within w_systemfunction
integer x = 983
integer y = 208
integer width = 585
integer height = 624
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
boolean sorted = false
string item[] = {"","","","",""}
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

sle_functionparm.text = lb_functionparm.selecteditem()
end event

type lb_functionname from listbox within w_systemfunction
integer x = 82
integer y = 316
integer width = 782
integer height = 832
integer taborder = 30
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
string item[] = {"LowerBound","UpperBound"}
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

lb_functionparm.Reset()
sle_functionparm.Enabled = True
sle_functionparm.Text = ''
String strleft
Int li
strleft = inv_util.of_make_arguments('string',5)

cbx_null.Checked = False
sle_functionparm.Enabled = True
lb_functionparm.Enabled = True
cbx_null.Enabled = True

Choose Case lb_functionname.SelectedItem()
	Case 'LowerBound'
		sle_functionparm.Enabled = False
		lb_functionparm.AddItem('a[5],LowerBound(a)')
		lb_functionparm.AddItem('a[5],LowerBound(a,1)')
		lb_functionparm.AddItem('a[5],LowerBound(a,2)')
		lb_functionparm.AddItem('b[2,5],LowerBound(b, 2)')
		lb_functionparm.AddItem('c[],LowerBound(c)')
		lb_functionparm.AddItem('c[50] = 90,LowerBound(c)')
		lb_functionparm.AddItem('d[-10 to 50],LowerBound(d)')
		Return
		
	Case 'UpperBound'
		sle_functionparm.Enabled = False
		lb_functionparm.AddItem('a[5],UpperBound(a)')
		lb_functionparm.AddItem('a[5],UpperBound(a,1)')
		lb_functionparm.AddItem('a[5],UpperBound(a,2)')
		lb_functionparm.AddItem('b[10,20],UpperBound(b, 1)')
		lb_functionparm.AddItem('b[10,20],UpperBound(b, 2)')
		lb_functionparm.AddItem('c[],UpperBound(c)')
		lb_functionparm.AddItem('c[50] = 900,UpperBound(c)')
		lb_functionparm.AddItem('c[60] = 800,UpperBound(c)')
		lb_functionparm.AddItem('c[60] = 800, c[50] = 700,UpperBound(c)')
		lb_functionparm.AddItem('d[10 to 50],UpperBound(d)')
		Return
		
	Case 'Asc', 'AscA'
		wf_random('string',lb_functionparm)
		lb_functionparm.AddItem('a')
		lb_functionparm.AddItem('A')
		lb_functionparm.AddItem('?')
		Return
		
	Case 'Char', 'CharA'
		wf_random('integer',lb_functionparm)
		lb_functionparm.AddItem('97')
		lb_functionparm.AddItem('65')
		lb_functionparm.AddItem('63')
		lb_functionparm.AddItem('27491')
		lb_functionparm.AddItem('-27085')		
		Return
		
	Case 'Date'
		wf_random('date',lb_functionparm)
		lb_functionparm.AddItem('99/07/03')
		lb_functionparm.AddItem('99/6/02')
		lb_functionparm.AddItem('97.09.18')
		lb_functionparm.AddItem('97.9.15')
		lb_functionparm.AddItem('99-08-13')
		lb_functionparm.AddItem('99-8-25')
		lb_functionparm.AddItem('1999-11-25')
		lb_functionparm.AddItem('11-25-1999')
		lb_functionparm.AddItem('1996/05/8')
		lb_functionparm.AddItem('1993.09.08')
		lb_functionparm.AddItem('1993.Mar.08')
		lb_functionparm.AddItem('1999-April-25')
		lb_functionparm.AddItem('1998-Aug-17')
		lb_functionparm.AddItem('1987 3 6')
		lb_functionparm.AddItem('1986,07,12')		
		Return
		
	Case 'DateTime'
		wf_random('date,time',lb_functionparm)
		
	Case 'Dec'
		wf_random('string',lb_functionparm)
		lb_functionparm.AddItem('4.35')
		lb_functionparm.AddItem('78.79')
		lb_functionparm.AddItem('46.0')
		Return
		
	Case 'Double'
		wf_random('string',lb_functionparm)
		lb_functionparm.AddItem('4.353')
		lb_functionparm.AddItem('78.7956')
		lb_functionparm.AddItem('46.034')
		lb_functionparm.AddItem('234264834885485')
		Return
		
	Case 'Integer'
		wf_random('string',lb_functionparm)
		lb_functionparm.AddItem('347.345')
		lb_functionparm.AddItem('344.889')
		lb_functionparm.AddItem('32767')
		lb_functionparm.AddItem('-32767')
		lb_functionparm.AddItem('32768')
		lb_functionparm.AddItem('-32768')
		Return
		
	Case 'Long'
		wf_random('string',lb_functionparm)
		wf_random('integer,integer',lb_functionparm)
		lb_functionparm.AddItem('2147483648')
		lb_functionparm.AddItem('-2147483648')
		lb_functionparm.AddItem('2147483649')
		lb_functionparm.AddItem('-2147483649')
		Return
		
	Case 'IsDate'
		wf_random('date',lb_functionparm)
		lb_functionparm.AddItem('99/07/03')
		lb_functionparm.AddItem('99/6/02')
		lb_functionparm.AddItem('97.09.18')
		lb_functionparm.AddItem('97.9.15')
		lb_functionparm.AddItem('99-08-13')
		lb_functionparm.AddItem('99-8-25')
		lb_functionparm.AddItem('1999-11-25')
		lb_functionparm.AddItem('11-25-1999')
		lb_functionparm.AddItem('1996/05/8')
		lb_functionparm.AddItem('1993.09.08')
		lb_functionparm.AddItem('1993.Mar.08')
		lb_functionparm.AddItem('1999-April-25')
		lb_functionparm.AddItem('1998-Aug-17')
		lb_functionparm.AddItem('1987 3 6')
		lb_functionparm.AddItem('1986,07,12')
		Return
		
	Case 'IsNull'
		sle_functionparm.Enabled = False
//		lb_functionparm.AddItem('ab')
		lb_functionparm.AddItem('NullVariable')
		lb_functionparm.AddItem('sle_functionparm')
		Return
		
	Case 'IsNumber'
		wf_random('string',lb_functionparm)
		lb_functionparm.AddItem('645')
		lb_functionparm.AddItem('45.8')
		Return
	Case 'IsTime'
		wf_random('time',lb_functionparm)
		lb_functionparm.AddItem('03:23:31')
		lb_functionparm.AddItem('13:20:31')
		lb_functionparm.AddItem('31:23:31')
		Return
		
	Case 'Real'
		wf_random('string',lb_functionparm)
		lb_functionparm.AddItem('34566.567')
		lb_functionparm.AddItem('454655767')
		lb_functionparm.AddItem('345')
		Return
		
	Case 'String'
		lb_functionparm.AddItem('1993-05-17')	
		lb_functionparm.AddItem('4563.54')
		lb_functionparm.AddItem('07:12:28')
		lb_functionparm.AddItem('dfjlj')
		Return
		
	Case 'Time'
		wf_random('time',lb_functionparm)
		lb_functionparm.AddItem('03:23:31')
		lb_functionparm.AddItem('13:20:31')
		lb_functionparm.AddItem('31:23:31')
		Return
		
	Case 'Day'
		wf_random('date',lb_functionparm)
		lb_functionparm.AddItem('99/07/03')
		lb_functionparm.AddItem('99/6/02')
		lb_functionparm.AddItem('97.09.18')
		lb_functionparm.AddItem('97.9.15')
		lb_functionparm.AddItem('99-08-13')
		lb_functionparm.AddItem('99-8-25')
		lb_functionparm.AddItem('1999-11-25')
		lb_functionparm.AddItem('11-25-1999')
		lb_functionparm.AddItem('1996/05/8')
		lb_functionparm.AddItem('1993.09.08')
		lb_functionparm.AddItem('1993.Mar.08')
		lb_functionparm.AddItem('1999-April-25')
		lb_functionparm.AddItem('1998-Aug-17')
		lb_functionparm.AddItem('1987 3 6')
		lb_functionparm.AddItem('1986,07,12')
		Return
		
	Case 'DayName'
		wf_random('date',lb_functionparm)
		lb_functionparm.AddItem('99/07/03')
		lb_functionparm.AddItem('99/6/02')
		lb_functionparm.AddItem('97.09.18')
		lb_functionparm.AddItem('97.9.15')
		lb_functionparm.AddItem('99-08-13')
		lb_functionparm.AddItem('99-8-25')
		lb_functionparm.AddItem('1999-11-25')
		lb_functionparm.AddItem('11-25-1999')
		lb_functionparm.AddItem('1996/05/8')
		lb_functionparm.AddItem('1993.09.08')
		lb_functionparm.AddItem('1993.Mar.08')
		lb_functionparm.AddItem('1999-April-25')
		lb_functionparm.AddItem('1998-Aug-17')
		lb_functionparm.AddItem('1987 3 6')
		lb_functionparm.AddItem('1986,07,12')		
		Return
		
	Case 'DayNumber'
		wf_random('date',lb_functionparm)
		lb_functionparm.AddItem('99/07/03')
		lb_functionparm.AddItem('99/6/02')
		lb_functionparm.AddItem('97.09.18')
		lb_functionparm.AddItem('97.9.15')
		lb_functionparm.AddItem('99-08-13')
		lb_functionparm.AddItem('99-8-25')
		lb_functionparm.AddItem('1999-11-25')
		lb_functionparm.AddItem('11-25-1999')
		lb_functionparm.AddItem('1996/05/8')
		lb_functionparm.AddItem('1993.09.08')
		lb_functionparm.AddItem('1993.Mar.08')
		lb_functionparm.AddItem('1999-April-25')
		lb_functionparm.AddItem('1998-Aug-17')
		lb_functionparm.AddItem('1987 3 6')
		lb_functionparm.AddItem('1986,07,12')	
		Return
		
	Case 'DaysAfter'
		wf_random('date,date',lb_functionparm)
		lb_functionparm.AddItem('99/07/03,99/7/09')
		lb_functionparm.AddItem('99/6/02,97/09/18')
		lb_functionparm.AddItem('97/09/18,97/9/15')
		lb_functionparm.AddItem('97/9/15,99-08-13')
		lb_functionparm.AddItem('99-08-13,99-8-25')
		lb_functionparm.AddItem('99-8-25,1999-11-25')
		lb_functionparm.AddItem('1999-11-25,11-25-1999')
		lb_functionparm.AddItem('11-25-1999,1996/05/8')
		lb_functionparm.AddItem('1996/05/8,1993/09/08')
		lb_functionparm.AddItem('1986/07/12,99/07/03')
		Return
		
	Case 'Hour'
		wf_random('time',lb_functionparm)
		lb_functionparm.AddItem('03:23:31')
		lb_functionparm.AddItem('13:20:31')
		lb_functionparm.AddItem('31:23:31')
		Return
		
	Case 'Minute'
		wf_random('time',lb_functionparm)
		lb_functionparm.AddItem('03:23:31')
		lb_functionparm.AddItem('13:20:31')
		lb_functionparm.AddItem('31:23:31')
		Return
		
	Case 'Month'
		wf_random('date',lb_functionparm)
		lb_functionparm.AddItem('99/07/03')
		lb_functionparm.AddItem('99/6/02')
		lb_functionparm.AddItem('97.09.18')
		lb_functionparm.AddItem('97.9.15')
		lb_functionparm.AddItem('99-08-13')
		lb_functionparm.AddItem('99-8-25')
		lb_functionparm.AddItem('1999-11-25')
		lb_functionparm.AddItem('11-25-1999')
		lb_functionparm.AddItem('1996/05/8')
		lb_functionparm.AddItem('1993.09.08')
		lb_functionparm.AddItem('1993.Mar.08')
		lb_functionparm.AddItem('1999-April-25')
		lb_functionparm.AddItem('1998-Aug-17')
		lb_functionparm.AddItem('1987 3 6')
		lb_functionparm.AddItem('1986,07,12')
		Return
		
	Case 'Now'
		sle_functionparm.Enabled = False
		
	Case 'RelativeDate'
		wf_random('date,integer',lb_functionparm)
		
	Case 'RelativeTime'
		wf_random('time,integer',lb_functionparm)
		
	Case 'Second'
		wf_random('time',lb_functionparm)
		lb_functionparm.AddItem('03:23:31')
		lb_functionparm.AddItem('13:20:31')
		lb_functionparm.AddItem('31:23:31')
		Return
		
	Case 'SecondsAfter'
		wf_random('time,time',lb_functionparm)
		lb_functionparm.AddItem('03:23:31,03:23:51')
		lb_functionparm.AddItem('07:23:01,07:23:25')
		Return
		
	Case 'Today'
		sle_functionparm.Enabled = False
		
	Case 'Year'
		wf_random('date',lb_functionparm)
		lb_functionparm.AddItem('99/07/03')
		lb_functionparm.AddItem('99/6/02')
		lb_functionparm.AddItem('97.09.18')
		lb_functionparm.AddItem('97.9.15')
		lb_functionparm.AddItem('99-08-13')
		lb_functionparm.AddItem('99-8-25')
		lb_functionparm.AddItem('1999-11-25')
		lb_functionparm.AddItem('11-25-1999')
		lb_functionparm.AddItem('1996/05/8')
		lb_functionparm.AddItem('1993.09.08')
		lb_functionparm.AddItem('1993.Mar.08')
		lb_functionparm.AddItem('1999-April-25')
		lb_functionparm.AddItem('1998-Aug-17')
		lb_functionparm.AddItem('1987 3 6')
		lb_functionparm.AddItem('1986,07,12')
		Return
		
	Case 'ClassName'
		sle_functionparm.Enabled = False
		lb_functionparm.AddItem('strvar')
		lb_functionparm.AddItem('intvar')
		lb_functionparm.AddItem('longvar')
		lb_functionparm.AddItem('lb_functionparm')
		lb_functionparm.AddItem('cb_1')
		Return
		
	Case 'IntHigh'
		wf_random('long',lb_functionparm)
		
	Case 'IntLow'
		wf_random('long',lb_functionparm)
		
	Case 'IsValid'
		sle_functionparm.Enabled = False
		lb_functionparm.AddItem('w_splash')
		lb_functionparm.AddItem('cb_1')
		lb_functionparm.AddItem('sqlca')
		Return
		
	Case 'KeyDown'
		lb_functionparm.AddItem('KeySpaceBar!')
		lb_functionparm.AddItem('KeyEqual!')
		lb_functionparm.AddItem('KeySemiColon!')
		lb_functionparm.AddItem('KeyShift!')
		lb_functionparm.AddItem('KeyF1!')
		lb_functionparm.AddItem('KeyLeftArrow!')
		lb_functionparm.AddItem('KeyNumpad0!')
		lb_functionparm.AddItem(String(CharA(Rand(26)+64)))
		lb_functionparm.AddItem(String(CharA(Rand(10)+47)))
		Return
		
	Case 'MessageBox'
		sle_functionparm.Enabled = False
		lb_functionparm.AddItem("'Title1','Text1',Information!,OK!,1")
		lb_functionparm.AddItem("'Title2','Text2',StopSign!,OKCancel!,2")
		lb_functionparm.AddItem("'Title3','Text3',Exclamation!,YesNoCancel!,3")
		lb_functionparm.AddItem("'Title4','Text4',Question!,RetryCancel!,1")
		Return
		
	Case 'PixelsToUnits'
		lb_functionparm.AddItem('520,' + 'XPixelsToUnits!')
		lb_functionparm.AddItem('520,' + 'YPixelsToUnits!')
				
	Case 'PopulateError'
		wf_random('integer,string',lb_functionparm)
		
	Case 'RGB'
		lb_functionparm.AddItem(String(Rand(255)) + ',' + String(Rand(255)) + ',' + String(Rand(255)))
		Return
		
	Case 'SetNull'
		sle_functionparm.Enabled = False
		lb_functionparm.AddItem('inttest')
		lb_functionparm.AddItem('sle_functionparm.text')
		Return
		
	Case 'SetPointer'
		sle_functionparm.Enabled = False
		lb_functionparm.AddItem('Arrow!')
		lb_functionparm.AddItem('Cross!')
		lb_functionparm.AddItem('Beam!')
		lb_functionparm.AddItem('HourGlass!')
		lb_functionparm.AddItem('SizeNS!')
		lb_functionparm.AddItem('SizeNESW!')
		lb_functionparm.AddItem('SizeWE!')
		lb_functionparm.AddItem('SizeNWSE!')
		lb_functionparm.AddItem('UpArrow!')
		Return
		
	Case 'SignalError'
		wf_random('integer,string',lb_functionparm)
		
	Case 'UnitsToPixels'
		lb_functionparm.AddItem('520,' + 'XUnitsToPixels!')
		lb_functionparm.AddItem('520,' + 'YUnitsToPixels!')
			
	Case 'Abs'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)				
			Case 2
				wf_random('Dec',lb_functionparm)				
		End Choose
		
	Case 'ACos'
		lb_functionparm.AddItem('1')
		lb_functionparm.AddItem('-1')
		lb_functionparm.AddItem('0')
		lb_functionparm.AddItem('0.' + String(Rand(32767)))
		lb_functionparm.AddItem('-0.'+ String(Rand(32767)))
		Return
		
	Case 'ASin'
		lb_functionparm.AddItem('1')
		lb_functionparm.AddItem('-1')
		lb_functionparm.AddItem('0')
		lb_functionparm.AddItem('0.' + String(Rand(32767)))
		lb_functionparm.AddItem('-0.'+ String(Rand(32767)))
		Return
		
	Case 'ATan'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
		lb_functionparm.AddItem('0.707')
		lb_functionparm.AddItem('1')
		lb_functionparm.AddItem('-1')
		lb_functionparm.AddItem('0')
		Return
		
	Case 'Ceiling'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
	Case 'Cos'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
		lb_functionparm.AddItem('0')
		lb_functionparm.AddItem('1')
		Return
		
	Case 'Exp'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
		lb_functionparm.AddItem('0')
		lb_functionparm.AddItem('1')
		Return
		
	Case 'Fact'
		lb_functionparm.AddItem(String(Rand(100)))
		lb_functionparm.AddItem('0')
		lb_functionparm.AddItem('1')
		Return
		
	Case 'Int'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
	Case 'Log'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
		lb_functionparm.AddItem('1')
		lb_functionparm.AddItem('10')
		lb_functionparm.AddItem('2.718')
		Return
		
	Case 'LogTen'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
		lb_functionparm.AddItem('1')
		lb_functionparm.AddItem('10')
		lb_functionparm.AddItem('2.718')
		Return
		
	Case 'Max'
		Choose Case Rand(2)
			Case 1
				wf_random('integer,Dec',lb_functionparm)
				
			Case 2
				wf_random('Dec,Integer',lb_functionparm)
				
		End Choose
		
	Case 'Min'
		Choose Case Rand(2)
			Case 1
				wf_random('Dec,Integer',lb_functionparm)
				
			Case 2
				wf_random('Integer,Dec',lb_functionparm)
				
		End Choose
		
	Case 'Mod'
		Choose Case Rand(4)
			Case 1
				wf_random('integer,integer',lb_functionparm)
				
			Case 2
				wf_random('Dec,Dec',lb_functionparm)
				
			Case 3
				wf_random('Dec,Integer',lb_functionparm)
				
			Case 4
				wf_random('Integer,Dec',lb_functionparm)
				
		End Choose
		
	Case 'Pi'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
		lb_functionparm.AddItem('1')
		Return
		
	Case 'Rand'
		lb_functionparm.AddItem(String(Rand(32767)))
		Return
		
	Case 'Round'
		lb_functionparm.AddItem(String(Rand(32767)) + '.' + String(Rand(32767)) + ',' + String(Rand(5)))
		Return
		
	Case 'Sign'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
		lb_functionparm.AddItem('0')
		lb_functionparm.AddItem('-10.5')
		Return
		
	Case 'Sin'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
		lb_functionparm.AddItem('1.57')
		lb_functionparm.AddItem('3.14')
		lb_functionparm.AddItem('0')
		Return
		
	Case 'Sqrt'
		Choose Case Rand(2)
			Case 1
				wf_random('double',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
	Case 'Tan'
		Choose Case Rand(2)
			Case 1
				wf_random('integer',lb_functionparm)
				
			Case 2
				wf_random('Dec',lb_functionparm)
				
		End Choose
		
		lb_functionparm.AddItem('1.57')
		lb_functionparm.AddItem('3.14')
		lb_functionparm.AddItem('0')
		Return
		
	Case 'Truncate'
		lb_functionparm.AddItem(String(Rand(32767)) + '.' + String(Rand(32767)) + ',' + String(Rand(5)))
		Return
		
	Case 'Fill', 'FillA'
		wf_random('char,index',lb_functionparm)
		lb_functionparm.AddItem('*,10')
		lb_functionparm.AddItem('-+,10')
		Return
		
	Case 'LastPos'
		lb_functionparm.AddItem(strleft + ',' + inv_util.of_make_arguments('string',2))
		lb_functionparm.AddItem(strleft + ',' + inv_util.of_make_arguments('string',3)+ ',' + String(Rand(LenA(strleft))))
		lb_functionparm.AddItem('Appeon Appeon,Ap,1')
		lb_functionparm.AddItem('Appeon Appeon,Ap')
		lb_functionparm.AddItem('Appeon Appeon,Ap,4')
		Return
		
	Case 'Left', 'LeftA'
		lb_functionparm.AddItem(strleft + ',' + String(Rand(LenA(strleft))))
		Return
		
	Case 'LeftTrim'
		lb_functionparm.AddItem(' Appeon  ')
		lb_functionparm.AddItem(' Sybase  ')
		lb_functionparm.AddItem('  EAServer ')
		lb_functionparm.AddItem(' Database  ')
		lb_functionparm.AddItem(' Software ')	
		Return
		
	Case 'Len', 'LenA'
		wf_random('string',lb_functionparm)
		lb_functionparm.AddItem(' Appeon  ')
		lb_functionparm.AddItem('  Sybase  ')
		Return
		
	Case 'Lower'
		wf_random('string',lb_functionparm)
		Return
		
	Case 'Match'
		wf_random('string,string',lb_functionparm)
		lb_functionparm.AddItem('jafa;ewjddf,^[A-Za-z]')
		lb_functionparm.AddItem('1232849348,^[0-9][0-9][0-9]$')
		lb_functionparm.AddItem('ABBBC,ABB*C')
		Return
		
	Case 'Mid', 'MidA'
		lb_functionparm.AddItem(strleft + ',' + String(Rand(LenA(strleft))))
		lb_functionparm.AddItem(strleft + ',' + String(Rand(LenA(strleft)))+ ',' + String(Rand(LenA(strleft))))
		lb_functionparm.AddItem('Appeon Appeon,3')
		lb_functionparm.AddItem('Appeon Appeon,8,3')
		lb_functionparm.AddItem('Appeon Appeon,5,2')
		Return
		
	Case 'Pos', 'PosA'
		Choose Case Rand(2)
			Case 1
				wf_random('string,string',lb_functionparm)
				
			Case 2
				lb_functionparm.AddItem(strleft + ',' + inv_util.of_make_arguments('string',4) + ',' + String(Rand(LenA(strleft))))
				
		End Choose
		
		lb_functionparm.AddItem('Appeon Appeon,on')
		lb_functionparm.AddItem('Appeon Appeon,pp,3')
		lb_functionparm.AddItem('Appeon Appeon,peon,2')
		Return
		
	Case 'Replace', 'ReplaceA'
		lb_functionparm.AddItem(strleft + ',1,20,Appeon')
		lb_functionparm.AddItem('Davis, 4, 2, e')
		lb_functionparm.AddItem('BABE RUTH, 1, 4, BABY')			
		Return
		
	Case 'Reverse'
		wf_random('string',lb_functionparm)
		
	Case 'Right', 'RightA'
		lb_functionparm.AddItem(strleft + ',' + String(Rand(LenA(strleft))))
		lb_functionparm.AddItem('Davis, 4')
		lb_functionparm.AddItem('BABE RUTH, 1')	
		Return
		
	Case 'RightTrim'
		lb_functionparm.AddItem(' Appeon  ')
		lb_functionparm.AddItem(' Sybase  ')
		lb_functionparm.AddItem('  EAServer ')
		lb_functionparm.AddItem(' Database  ')
		lb_functionparm.AddItem(' Software ')
		Return
		
	Case 'Space'
		wf_random('integer',lb_functionparm)
		lb_functionparm.AddItem(String(Rand(20)))
		Return
		
	Case 'Trim'
		lb_functionparm.AddItem(' Appeon  ')
		lb_functionparm.AddItem(' Sybase  ')
		lb_functionparm.AddItem('  EAServer ')
		lb_functionparm.AddItem(' Database  ')
		lb_functionparm.AddItem(' Software ')
		Return
		
	Case 'WordCap'
		wf_random('string',lb_functionparm)
		lb_functionparm.AddItem('this is a book.')
		lb_functionparm.AddItem('how do you do?')
		Return
		
	Case 'Upper'
		wf_random('string',lb_functionparm)
		
	case 'HyperlinkToURL'	
		lb_functionparm.additem('www.appeon.com')
		lb_functionparm.additem('www.sybase.com')
		
	Case 'GetApplication'
		sle_functionparm.Enabled = False
	
	Case 'CommandParm'
		sle_functionparm.Enabled = False
		
	Case 'GetFocus'
		sle_functionparm.Enabled = False
		
	Case 'SignalError'
		sle_functionparm.Enabled = False
		
	Case 'ClipBoard'
		lb_functionparm.additem('Employee Data')
		lb_functionparm.additem('Appeon Test')
		
	Case 'GetEnvironment'
		sle_functionparm.Enabled = False
		
	Case 'Run'
		lb_functionparm.additem('Notepad.exe ImportFile.txt ')
		lb_functionparm.additem('MSpaint.exe')
		
	Case 'Cpu'
		sle_functionparm.Enabled = False
		
	Case 'Beep'
		lb_functionparm.additem('1')
		lb_functionparm.additem('5')
		lb_functionparm.additem('10')
		
	Case 'Sleep'
		lb_functionparm.additem('5')
		lb_functionparm.additem('10')
		lb_functionparm.additem('15')
		
	Case 'ChooseColor'	
		lb_functionparm.additem('255')
		lb_functionparm.additem('65280,255')
		lb_functionparm.additem('16711680,65280,255')		
End Choose




end event

type sle_functionparm from singlelineedit within w_systemfunction
integer x = 983
integer y = 932
integer width = 585
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_systemfunction
integer x = 983
integer y = 848
integer width = 590
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Function Parameter:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_systemfunction
integer x = 41
integer y = 140
integer width = 864
integer height = 1048
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Functions"
end type

type gb_4 from groupbox within w_systemfunction
integer x = 928
integer y = 140
integer width = 690
integer height = 1048
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test Data"
end type

type gb_2 from groupbox within w_systemfunction
integer x = 1641
integer y = 140
integer width = 855
integer height = 1048
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

