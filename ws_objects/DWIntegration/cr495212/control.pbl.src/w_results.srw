$PBExportHeader$w_results.srw
forward
global type w_results from window
end type
type mle_results from multilineedit within w_results
end type
type st_build from statictext within w_results
end type
type st_messages from statictext within w_results
end type
type st_status from statictext within w_results
end type
type cb_viewdb from commandbutton within w_results
end type
type cb_find from commandbutton within w_results
end type
type cb_resetlog from commandbutton within w_results
end type
type sle_message from singlelineedit within w_results
end type
type cb_print from commandbutton within w_results
end type
type sle_failure from singlelineedit within w_results
end type
type sle_find from singlelineedit within w_results
end type
type st_heading from statictext within w_results
end type
type st_version from statictext within w_results
end type
type cb_close from commandbutton within w_results
end type
type dw_result from datawindow within w_results
end type
end forward

global type w_results from window
integer width = 3639
integer height = 2044
boolean titlebar = true
string title = "Results"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
mle_results mle_results
st_build st_build
st_messages st_messages
st_status st_status
cb_viewdb cb_viewdb
cb_find cb_find
cb_resetlog cb_resetlog
sle_message sle_message
cb_print cb_print
sle_failure sle_failure
sle_find sle_find
st_heading st_heading
st_version st_version
cb_close cb_close
dw_result dw_result
end type
global w_results w_results

type variables
Boolean ib_findNext
nvo_results invo_results
end variables

forward prototypes
public function boolean wf_failurenotice ()
public function boolean wf_changeresultset (string as_result)
end prototypes

public function boolean wf_failurenotice ();

//rte_results.SetRedraw(FALSE)
//mle_results.SetRedraw(FALSE)
SetPointer(HourGlass!)

//IF rte_results.Find('FAIL', TRUE, TRUE, FALSE, FALSE) > 0 Then
//	sle_failure.TextColor = RGB(255, 0, 0)
//	sle_failure.text = " One or more failures have occurred"
//Else
//	sle_failure.TextColor = RGB(0, 150, 0)
//	sle_failure.text = " No failures found"
//End IF

//Find fail result in mle control, add by jianfeng
IF Pos(mle_results.text, 'Fail')<>0 or Pos(mle_results.text, 'FAIL')<>0 Then
	sle_failure.TextColor = RGB(255, 0, 0)
	sle_failure.text = " One or more failures have occurred"
Else
	sle_failure.TextColor = RGB(0, 150, 0)
	sle_failure.text = " No failures found"
End IF

// Highlight all failures
//Long ll_fromLine, ll_fromChar, ll_toLine, ll_toChar
//DO 
//	rte_results.Position ( ll_fromLine, ll_fromChar, ll_toLine, ll_toChar )
//	rte_results.SelectText ( ll_fromLine, ll_fromChar, ll_toLine, ll_toChar )
//	rte_results.SetTextStyle(TRUE, FALSE, FALSE, FALSE, FALSE, FALSE) // Bold
//	rte_results.SelectText ( ll_fromLine, ll_fromChar, ll_toLine, ll_toChar )
//	rte_results.SetTextColor ( RGB(255, 0, 0) ) // Red
//LOOP WHILE rte_results.FindNext() > 0
//
//rte_results.SelectText(1,1,1,1)
//
//rte_results.SetRedraw(TRUE)
SetPointer(Arrow!)

sle_message.Text = 'Ready...'
Return TRUE
end function

public function boolean wf_changeresultset (string as_result);

IF TRIM(UPPER(as_result)) = 'DB' Then
	cb_viewDB.Text = 'View Log'
	
	mle_results.Hide()
	mle_results.Enabled = FALSE
	
//	rte_results.Hide()
//	rte_results.Enabled = FALSE
	
	sle_find.Hide()
	sle_find.Enabled = FALSE
	
	cb_find.Hide()
	cb_find.Enabled = FALSE
	
	cb_resetlog.Hide()
	cb_resetlog.Enabled = FALSE
	
	cb_print.Hide()
	cb_print.Enabled = FALSE
	
	dw_result.Show()
	dw_result.Enabled = TRUE
END IF

IF TRIM(UPPER(as_result)) = 'LOG' Then
	cb_viewDB.Text = 'View DB'
	
	mle_results.Show()
	mle_results.Enabled = TRUE
	
//	rte_results.Show()
//	rte_results.Enabled = TRUE
	
	sle_find.Show()
	sle_find.Enabled = TRUE
	
	cb_find.Show()
	cb_find.Enabled = TRUE
	
	cb_resetlog.Show()
	cb_resetlog.Enabled = TRUE
	
	cb_print.Show()
	cb_print.Enabled = TRUE
	
	dw_result.Hide()
	dw_result.Enabled = FALSE
	
END IF


Return TRUE
end function

on w_results.create
this.mle_results=create mle_results
this.st_build=create st_build
this.st_messages=create st_messages
this.st_status=create st_status
this.cb_viewdb=create cb_viewdb
this.cb_find=create cb_find
this.cb_resetlog=create cb_resetlog
this.sle_message=create sle_message
this.cb_print=create cb_print
this.sle_failure=create sle_failure
this.sle_find=create sle_find
this.st_heading=create st_heading
this.st_version=create st_version
this.cb_close=create cb_close
this.dw_result=create dw_result
this.Control[]={this.mle_results,&
this.st_build,&
this.st_messages,&
this.st_status,&
this.cb_viewdb,&
this.cb_find,&
this.cb_resetlog,&
this.sle_message,&
this.cb_print,&
this.sle_failure,&
this.sle_find,&
this.st_heading,&
this.st_version,&
this.cb_close,&
this.dw_result}
end on

on w_results.destroy
destroy(this.mle_results)
destroy(this.st_build)
destroy(this.st_messages)
destroy(this.st_status)
destroy(this.cb_viewdb)
destroy(this.cb_find)
destroy(this.cb_resetlog)
destroy(this.sle_message)
destroy(this.cb_print)
destroy(this.sle_failure)
destroy(this.sle_find)
destroy(this.st_heading)
destroy(this.st_version)
destroy(this.cb_close)
destroy(this.dw_result)
end on

event open;String ls_logFile, ls_temp

invo_results = Create nvo_results
invo_results = Message.PowerObjectParm

dw_result.SetTransObject(invo_results.iw_testcontroller.nvo_SQLCA)
invo_results.iw_testcontroller.ids_resultSet.ShareData(dw_result)

This.st_version.Text = 'Pb Version : ' + invo_results.iw_testController.dw_testCycle.GetItemString(1, 'version')
This.st_build.Text = 'Build : ' + invo_results.iw_testController.dw_testCycle.GetItemString(1, 'buildno')

//ls_logFile = GetApplication().AppName + '.log'
ls_logFile = invo_results.iw_testcontroller.is_logFile

//Read log file from file and add it into multieditline, added by jianfeng
integer li_retFile, li_temp
string ls_fileLine
//li_retFile = fileopen(ls_logFile,LineMode!,Read!)
li_retFile = fileopen(ls_logFile, TextMode!, Read!, Shared!, Append!, EncodingUTF8!)


if li_retFile <> -1 then	
//	do while filereadex(li_retFile,ls_fileLine) <> -100
//		mle_results.text += ls_fileLine
//		mle_results.text += "~r~n"		
//	loop

	if filereadex(li_retFile,ls_fileLine) <> -100 then
		mle_results.text = ls_fileLine
	end if

	fileclose(li_retFile)
end if
		

//If rte_results.InsertDocument(ls_logFile, TRUE, FileTypeText!) <> 1 Then
//	rte_results.InsertDocument(TRIM(sle_find.Text), TRUE, FileTypeText!)
//End IF

sle_message.Text = 'Display of Results depends on the length of LOG file.... Wait!!'

// Reposition
This.X = invo_results.iw_testController.x
This.y = invo_results.iw_testController.y


Post wf_failureNotice()
end event

event close;

//invo_results.iw_testcontroller.ids_resultSet.ShareDataOff()

Destroy invo_results
end event

type mle_results from multilineedit within w_results
integer x = 73
integer y = 160
integer width = 3145
integer height = 1408
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_build from statictext within w_results
integer x = 2190
integer y = 36
integer width = 846
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_messages from statictext within w_results
integer x = 1207
integer y = 1604
integer width = 274
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Messages"
boolean focusrectangle = false
end type

type st_status from statictext within w_results
integer x = 78
integer y = 1604
integer width = 201
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Status"
boolean focusrectangle = false
end type

type cb_viewdb from commandbutton within w_results
integer x = 2912
integer y = 1656
integer width = 311
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "View DB"
boolean default = true
end type

event clicked;
IF Upper(This.Text) = 'VIEW DB' Then
	wf_changeResultSet('DB')
Else
	wf_changeResultSet('LOG')
End IF
end event

type cb_find from commandbutton within w_results
integer x = 1134
integer y = 1760
integer width = 311
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Find"
end type

event clicked;

//IF ib_findNext Then
//	IF rte_results.FindNext() = 0 Then
//		sle_message.Text = ' No more finding. End of file reached!! '
//	End IF
//Else
//	IF rte_results.Find(TRIM(sle_find.Text), TRUE, TRUE, FALSE, FALSE) < 1 Then
//		sle_message.Text = ' Could not find ' + sle_find.Text + '. Refine/Restart your search!'
//		ib_findNext = FALSE
//	Else
//		ib_findNext = TRUE
//	End IF
//End IF



	
end event

type cb_resetlog from commandbutton within w_results
integer x = 1888
integer y = 1760
integer width = 311
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Reset"
end type

event clicked;
String ls_logFile

ls_logFile = GetApplication().AppName + '.log'

If FileDelete(ls_logFile) Then
	sle_message.Text = 'Log successfully Reset'
//	rte_results.SelectTextAll()
//	rte_results.Clear()
	mle_results.Text =""
Else
	FileDelete(TRIM(sle_find.Text))
	sle_message.Text = "Couldn't Reset the Log file. Check location. Tip : Enter the Logfile name in the find line."
End IF


end event

type sle_message from singlelineedit within w_results
integer x = 1202
integer y = 1668
integer width = 1687
integer height = 84
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_results
integer x = 2226
integer y = 1760
integer width = 311
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Print"
end type

event clicked;
//rte_results.Print ( 1, '', FALSE, TRUE )
end event

type sle_failure from singlelineedit within w_results
integer x = 73
integer y = 1668
integer width = 1056
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_find from singlelineedit within w_results
integer x = 73
integer y = 1772
integer width = 1056
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Enter find text here!!!"
borderstyle borderstyle = stylelowered!
end type

event modified;ib_findNext = FALSE
sle_message.Text = ''
end event

type st_heading from statictext within w_results
integer x = 1065
integer y = 28
integer width = 946
integer height = 92
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "TEST RESULTS"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_version from statictext within w_results
integer x = 69
integer y = 36
integer width = 846
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_results
integer x = 2912
integer y = 1760
integer width = 311
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
boolean default = true
end type

event clicked;Close(Parent)
end event

type dw_result from datawindow within w_results
integer x = 78
integer y = 164
integer width = 3122
integer height = 1404
integer taborder = 10
boolean enabled = false
boolean titlebar = true
string title = "Test Results"
string dataobject = "d_results_group"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;

// Do not display error
Return 1
end event

