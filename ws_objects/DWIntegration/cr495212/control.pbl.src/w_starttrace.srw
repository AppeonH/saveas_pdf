$PBExportHeader$w_starttrace.srw
forward
global type w_starttrace from Window
end type
type cbx_prompt from checkbox within w_starttrace
end type
type cb_exit from commandbutton within w_starttrace
end type
type cb_view from commandbutton within w_starttrace
end type
type cb_startstop from commandbutton within w_starttrace
end type
type cb_all from commandbutton within w_starttrace
end type
type cb_default from commandbutton within w_starttrace
end type
type cbx_garbagecoll from checkbox within w_starttrace
end type
type cbx_systemerrors from checkbox within w_starttrace
end type
type cbx_userdefined from checkbox within w_starttrace
end type
type cbx_objectcreate from checkbox within w_starttrace
end type
type cbx_embeddedsql from checkbox within w_starttrace
end type
type cbx_routineline from checkbox within w_starttrace
end type
type cbx_routineentry from checkbox within w_starttrace
end type
type rb_timerthread from radiobutton within w_starttrace
end type
type rb_timerproces from radiobutton within w_starttrace
end type
type rb_timerclock from radiobutton within w_starttrace
end type
type rb_timernone from radiobutton within w_starttrace
end type
type sle_tracelabel from singlelineedit within w_starttrace
end type
type st_2 from statictext within w_starttrace
end type
type cb_browse from commandbutton within w_starttrace
end type
type sle_filename from singlelineedit within w_starttrace
end type
type st_1 from statictext within w_starttrace
end type
type gb_2 from groupbox within w_starttrace
end type
type gb_1 from groupbox within w_starttrace
end type
end forward

global type w_starttrace from Window
int X=315
int Y=240
int Width=1408
int Height=1424
boolean TitleBar=true
string Title="Trace Options"
long BackColor=80921269
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
cbx_prompt cbx_prompt
cb_exit cb_exit
cb_view cb_view
cb_startstop cb_startstop
cb_all cb_all
cb_default cb_default
cbx_garbagecoll cbx_garbagecoll
cbx_systemerrors cbx_systemerrors
cbx_userdefined cbx_userdefined
cbx_objectcreate cbx_objectcreate
cbx_embeddedsql cbx_embeddedsql
cbx_routineline cbx_routineline
cbx_routineentry cbx_routineentry
rb_timerthread rb_timerthread
rb_timerproces rb_timerproces
rb_timerclock rb_timerclock
rb_timernone rb_timernone
sle_tracelabel sle_tracelabel
st_2 st_2
cb_browse cb_browse
sle_filename sle_filename
st_1 st_1
gb_2 gb_2
gb_1 gb_1
end type
global w_starttrace w_starttrace

type variables
string is_exename = 'Profiler.exe'
TimerKind itk_kind
string is_title = 'Profiling Options '
string is_starttext
end variables

forward prototypes
public function string of_converterror (errorreturn a_error)
public subroutine of_errmsg (errorreturn ae_error, string as_msg)
end prototypes

public function string of_converterror (errorreturn a_error);// convert enumerated type ErrorReturn parameter to text.
String ls_result
choose case a_error
	Case Success!
		ls_result =  "Success!"
	Case FileCloseError!
		ls_result =  "FileCloseError!"
	Case FileOpenError!
		ls_result =  "FileOpenError!"
	Case FileReadError!
		ls_result =  "FileReadError!"
	Case FileWriteError!
		ls_result =  "FileWriteError!"
	Case FileNotOpenError!
		ls_result =  "FileNotOpenError!"
	Case FileAlreadyOpenError!
		ls_result =  "FileAlreadyOpenError!"
	Case FileInvalidFormatError!
		ls_result =  "FileInvalidFormatError!"
	Case FileNotSetError!
		ls_result =  "FileNotSetError!"
	Case EventNotExistError!
		ls_result =  "EventNotExistError!"
	Case EventWrongPrototypeError!
		ls_result =  "EventWrongPrototypeError!"
	Case ModelNotExistsError!
		ls_result =  "ModelNotExistsError!"
	Case ModelExistsError!
		ls_result =  "ModelExistsError!"
	Case TraceStartedError!
		ls_result =  "TraceStartedError!"
	Case TraceNotStartedError!
		ls_result =  "TraceNotStartedError!"
	Case TraceNoMoreNodes!
		ls_result =  "TraceNoMoreNodes!"
	Case TraceGeneralError!
		ls_result =  "TraceGeneralError!"
	Case FeatureNotSupportedError!
		ls_result =  "FeatureNotSupportedError!"
	case else
		ls_result =  "Unknown Error Code"
end choose

return ls_result 
end function

public subroutine of_errmsg (errorreturn ae_error, string as_msg);
Messagebox(this.title,'Error executing '+as_msg+'. Error code : '+of_converterror(ae_error)) 
end subroutine

on w_starttrace.create
this.cbx_prompt=create cbx_prompt
this.cb_exit=create cb_exit
this.cb_view=create cb_view
this.cb_startstop=create cb_startstop
this.cb_all=create cb_all
this.cb_default=create cb_default
this.cbx_garbagecoll=create cbx_garbagecoll
this.cbx_systemerrors=create cbx_systemerrors
this.cbx_userdefined=create cbx_userdefined
this.cbx_objectcreate=create cbx_objectcreate
this.cbx_embeddedsql=create cbx_embeddedsql
this.cbx_routineline=create cbx_routineline
this.cbx_routineentry=create cbx_routineentry
this.rb_timerthread=create rb_timerthread
this.rb_timerproces=create rb_timerproces
this.rb_timerclock=create rb_timerclock
this.rb_timernone=create rb_timernone
this.sle_tracelabel=create sle_tracelabel
this.st_2=create st_2
this.cb_browse=create cb_browse
this.sle_filename=create sle_filename
this.st_1=create st_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={ this.cbx_prompt,&
this.cb_exit,&
this.cb_view,&
this.cb_startstop,&
this.cb_all,&
this.cb_default,&
this.cbx_garbagecoll,&
this.cbx_systemerrors,&
this.cbx_userdefined,&
this.cbx_objectcreate,&
this.cbx_embeddedsql,&
this.cbx_routineline,&
this.cbx_routineentry,&
this.rb_timerthread,&
this.rb_timerproces,&
this.rb_timerclock,&
this.rb_timernone,&
this.sle_tracelabel,&
this.st_2,&
this.cb_browse,&
this.sle_filename,&
this.st_1,&
this.gb_2,&
this.gb_1}
end on

on w_starttrace.destroy
destroy(this.cbx_prompt)
destroy(this.cb_exit)
destroy(this.cb_view)
destroy(this.cb_startstop)
destroy(this.cb_all)
destroy(this.cb_default)
destroy(this.cbx_garbagecoll)
destroy(this.cbx_systemerrors)
destroy(this.cbx_userdefined)
destroy(this.cbx_objectcreate)
destroy(this.cbx_embeddedsql)
destroy(this.cbx_routineline)
destroy(this.cbx_routineentry)
destroy(this.rb_timerthread)
destroy(this.rb_timerproces)
destroy(this.rb_timerclock)
destroy(this.rb_timernone)
destroy(this.sle_tracelabel)
destroy(this.st_2)
destroy(this.cb_browse)
destroy(this.sle_filename)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;application lapp_current

lapp_current = getapplication()
itk_kind = Clock!
is_starttext = cb_startstop.text
sle_filename.text = classname(lapp_current)+'.pbp'
end event

type cbx_prompt from checkbox within w_starttrace
int X=695
int Y=32
int Width=521
int Height=64
string Text="Prompt for Overwrite "
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_exit from commandbutton within w_starttrace
int X=942
int Y=1184
int Width=379
int Height=92
int TabOrder=160
string Text="Exit"
boolean Cancel=true
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close( parent)
end event

type cb_view from commandbutton within w_starttrace
int X=494
int Y=1184
int Width=379
int Height=92
int TabOrder=150
string Text="&View Output..."
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;run(is_exename+" "+sle_filename.text)
end event

type cb_startstop from commandbutton within w_starttrace
int X=27
int Y=1184
int Width=379
int Height=92
int TabOrder=140
string Text="Start &Trace"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;errorreturn le_errorreturn
integer li_key
if this.text = is_starttext then
	if len(trim(sle_filename.text)) = 0 then
		 messagebox(parent.title,'Trace file name is required',information!)
		 sle_filename.setfocus()
		 return
	end if
	If cbx_prompt.checked and fileexists(sle_filename.text) then
		li_key = messagebox(parent.title,'OK to overwrite '+sle_filename.text,question!,okcancel!,1)
		if li_key = 2 then return
	end if
		
//	le_errorreturn = 
	TraceOpen( sle_filename.text, itk_kind )
//	if le_errorreturn <> Success! then
//		of_errmsg(le_errorreturn,'TraceOpen('+sle_filename.text+')')
//		return
//	end if
	
	if cbx_embeddedsql.checked then 
		le_errorreturn = TraceEnableActivity( ActESql! )
		if le_errorreturn <> Success! then
			of_errmsg(le_errorreturn,'TraceEnableActivity( ActESql! )')
			 le_errorreturn = Traceclose()
			if le_errorreturn <> Success! then
				of_errmsg(le_errorreturn,'TraceClose')
			end if
			return
		end if
	end if
	if cbx_routineentry.checked then 
		le_errorreturn = TraceEnableActivity( ActRoutine! )
		if le_errorreturn <> Success! then
			of_errmsg(le_errorreturn,'TraceEnableActivity( ActRoutine! )')
			Traceclose()
			if le_errorreturn <> Success! then
				of_errmsg(le_errorreturn,'TraceClose')
			end if
			return
		end if
	end if
	if cbx_userdefined.checked then 
		le_errorreturn = TraceEnableActivity( ActUser! )
		if le_errorreturn <> Success! then
			of_errmsg(le_errorreturn,'TraceEnableActivity( ActUser! )')
			Traceclose()
			if le_errorreturn <> Success! then
				of_errmsg(le_errorreturn,'TraceClose')
			end if
			return
		end if
	end if
	if cbx_systemerrors.checked then 
		le_errorreturn = TraceEnableActivity( ActError! )
		if le_errorreturn <> Success! then
			of_errmsg(le_errorreturn,'TraceEnableActivity( ActError! )')
			Traceclose()
			if le_errorreturn <> Success! then
				of_errmsg(le_errorreturn,'TraceClose')
			end if
			return
		end if
	end if
	if cbx_routineline.checked then 
		le_errorreturn = TraceEnableActivity( ActLine! )
		if le_errorreturn <> Success! then
			of_errmsg(le_errorreturn,' TraceEnableActivity( ActLine! )')
			Traceclose()
			if le_errorreturn <> Success! then
				of_errmsg(le_errorreturn,'TraceClose')
			end if
			return
		end if
	end if
	if cbx_objectcreate.checked then 
		le_errorreturn = TraceEnableActivity( ActObjectCreate! )
		if le_errorreturn <> Success! then
			of_errmsg(le_errorreturn,'TraceEnableActivity( ActObject! )')
			Traceclose()
			if le_errorreturn <> Success! then
				of_errmsg(le_errorreturn,'TraceClose')
			end if
			return
		end if
		le_errorreturn = TraceEnableActivity( ActObjectDestroy! )
		if le_errorreturn <> Success! then
			of_errmsg(le_errorreturn,'TraceEnableActivity( ActObjectDestroy! )')
			Traceclose()
			if le_errorreturn <> Success! then
				of_errmsg(le_errorreturn,'TraceClose')
			end if
			return
		end if
	end if
	if cbx_garbagecoll.checked then 
		le_errorreturn = TraceEnableActivity( ActGarbageCollect! )
		if le_errorreturn <> Success! then
			of_errmsg(le_errorreturn,'TraceEnableActivity( ActGarbageCollect! )')
			Traceclose()
			if le_errorreturn <> Success! then
				of_errmsg(le_errorreturn,'TraceClose')
			end if
			return
		end if
	end if
	

//TraceEnableActivity( ActRoutine! )
////TraceEnableActivity( ActESql! )
//TraceEnableActivity( ActUser! )
//TraceEnableActivity( ActError! )
//TraceEnableActivity( ActLine! )
//TraceEnableActivity( ActObject! )
//TraceEnableActivity( ActGarbageCollect! )

//TraceBegin( "Startit" )
	le_errorreturn =TraceBegin( sle_tracelabel.text )
	if le_errorreturn <> Success! then
		of_errmsg(le_errorreturn,'TraceBegin')
		return
	end if
	
	parent.title = is_title + '(Tracing)'
	this.text = 'Stop &Tracing'
	cb_view.enabled = false
else
	le_errorreturn =TraceEnd()
	if le_errorreturn <> Success! then
		of_errmsg(le_errorreturn,'TraceEnd')
		return
	end if

	le_errorreturn =TraceClose()
	if le_errorreturn <> Success! then
		of_errmsg(le_errorreturn,'TraceClose')
	end if
	this.text = is_starttext
	parent.title = is_title 
	cb_view.enabled = true

end if
end event

type cb_all from commandbutton within w_starttrace
int X=919
int Y=736
int Width=379
int Height=92
int TabOrder=130
string Text="A&ll"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;cbx_embeddedsql.checked = true
cbx_garbagecoll.checked = true
cbx_objectcreate.checked = true
cbx_routineentry.checked = true
cbx_routineline.checked = true
cbx_systemerrors.checked = true
cbx_userdefined.checked = true

end event

type cb_default from commandbutton within w_starttrace
int X=919
int Y=628
int Width=379
int Height=92
int TabOrder=120
string Text="&Default"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;cbx_embeddedsql.checked = true
cbx_garbagecoll.checked = true
cbx_objectcreate.checked = false
cbx_routineentry.checked = true
cbx_routineline.checked = false
cbx_systemerrors.checked = false
cbx_userdefined.checked = false

end event

type cbx_garbagecoll from checkbox within w_starttrace
int X=64
int Y=1044
int Width=686
int Height=76
int TabOrder=110
string Text="&Garbage Collection"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_systemerrors from checkbox within w_starttrace
int X=64
int Y=976
int Width=686
int Height=76
int TabOrder=100
string Text="S&ystem Errors"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_userdefined from checkbox within w_starttrace
int X=64
int Y=908
int Width=686
int Height=76
int TabOrder=90
string Text="&User Defined Activities "
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_objectcreate from checkbox within w_starttrace
int X=64
int Y=840
int Width=713
int Height=76
int TabOrder=80
string Text="Object &Creation/Destruction "
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_embeddedsql from checkbox within w_starttrace
int X=64
int Y=772
int Width=489
int Height=76
int TabOrder=70
string Text="Embedded &SQL"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_routineline from checkbox within w_starttrace
int X=64
int Y=704
int Width=489
int Height=76
int TabOrder=60
string Text="Routine Line &Hits"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_routineentry from checkbox within w_starttrace
int X=64
int Y=636
int Width=489
int Height=76
int TabOrder=50
string Text="&Routine Entry/Exit"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_timerthread from radiobutton within w_starttrace
int X=1015
int Y=448
int Width=274
int Height=76
string Text="Thread"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if this.checked then itk_kind = Thread!

end event

type rb_timerproces from radiobutton within w_starttrace
int X=686
int Y=448
int Width=274
int Height=76
string Text="Process"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if this.checked then itk_kind = Process!

end event

type rb_timerclock from radiobutton within w_starttrace
int X=352
int Y=448
int Width=274
int Height=76
string Text="Clock"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if this.checked then itk_kind = Clock!

end event

type rb_timernone from radiobutton within w_starttrace
int X=50
int Y=448
int Width=274
int Height=76
string Text="None"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if this.checked then itk_kind = TimerNone!

end event

type sle_tracelabel from singlelineedit within w_starttrace
int X=23
int Y=260
int Width=1303
int Height=92
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
int Accelerator=108
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_starttrace
int X=18
int Y=204
int Width=393
int Height=56
boolean Enabled=false
string Text="Trace &Label"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_browse from commandbutton within w_starttrace
int X=1225
int Y=100
int Width=101
int Height=92
int TabOrder=20
string Text="..."
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;integer li_rc
string ls_named,ls_filename
li_rc = GetFileOpenName("Select Profiling Data File", ls_filename, ls_named, "PBP", "Profiling Files (*.PBP),*.PBP,All Files (*.*),*.*" )
if li_rc <> 1 then
	li_rc = -1
else
	sle_filename.text = ls_filename
end if
return li_rc
end event

type sle_filename from singlelineedit within w_starttrace
int X=23
int Y=100
int Width=1193
int Height=92
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
int Accelerator=102
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_starttrace
int X=18
int Y=36
int Width=393
int Height=56
boolean Enabled=false
string Text="Trace &File Name"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_2 from groupbox within w_starttrace
int X=23
int Y=580
int Width=1303
int Height=580
string Text="Trace Activities"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_starttrace
int X=23
int Y=376
int Width=1303
int Height=188
int TabOrder=40
string Text="Timer &Kind"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

