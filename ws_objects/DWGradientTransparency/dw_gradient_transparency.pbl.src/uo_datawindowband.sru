$PBExportHeader$uo_datawindowband.sru
forward
global type uo_datawindowband from userobject
end type
type ddlb_band from dropdownlistbox within uo_datawindowband
end type
type st_5 from statictext within uo_datawindowband
end type
type htb_6 from htrackbar within uo_datawindowband
end type
type htb_5 from htrackbar within uo_datawindowband
end type
type htb_4 from htrackbar within uo_datawindowband
end type
type htb_3 from htrackbar within uo_datawindowband
end type
type htb_2 from htrackbar within uo_datawindowband
end type
type cb_4 from commandbutton within uo_datawindowband
end type
type st_gcol from statictext within uo_datawindowband
end type
type st_27 from statictext within uo_datawindowband
end type
type st_26 from statictext within uo_datawindowband
end type
type htb_1 from htrackbar within uo_datawindowband
end type
type cb_3 from commandbutton within uo_datawindowband
end type
type st_col from statictext within uo_datawindowband
end type
type st_16 from statictext within uo_datawindowband
end type
type em_repetitionunitlength from editmask within uo_datawindowband
end type
type st_12 from statictext within uo_datawindowband
end type
type em_repetitioncount from editmask within uo_datawindowband
end type
type st_11 from statictext within uo_datawindowband
end type
type ddlb_repetitionmode from dropdownlistbox within uo_datawindowband
end type
type st_10 from statictext within uo_datawindowband
end type
type st_9 from statictext within uo_datawindowband
end type
type st_8 from statictext within uo_datawindowband
end type
type st_7 from statictext within uo_datawindowband
end type
type st_6 from statictext within uo_datawindowband
end type
type st_4 from statictext within uo_datawindowband
end type
type st_3 from statictext within uo_datawindowband
end type
type st_2 from statictext within uo_datawindowband
end type
type st_1 from statictext within uo_datawindowband
end type
type ddlb_brushmode from dropdownlistbox within uo_datawindowband
end type
type ln_3 from line within uo_datawindowband
end type
type ln_4 from line within uo_datawindowband
end type
type ln_5 from line within uo_datawindowband
end type
type ln_6 from line within uo_datawindowband
end type
end forward

global type uo_datawindowband from userobject
integer width = 1426
integer height = 2712
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ddlb_band ddlb_band
st_5 st_5
htb_6 htb_6
htb_5 htb_5
htb_4 htb_4
htb_3 htb_3
htb_2 htb_2
cb_4 cb_4
st_gcol st_gcol
st_27 st_27
st_26 st_26
htb_1 htb_1
cb_3 cb_3
st_col st_col
st_16 st_16
em_repetitionunitlength em_repetitionunitlength
st_12 st_12
em_repetitioncount em_repetitioncount
st_11 st_11
ddlb_repetitionmode ddlb_repetitionmode
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
ddlb_brushmode ddlb_brushmode
ln_3 ln_3
ln_4 ln_4
ln_5 ln_5
ln_6 ln_6
end type
global uo_datawindowband uo_datawindowband

type variables
datawindow	idw
string dwBand
end variables

forward prototypes
public subroutine uf_initialize ()
public subroutine uf_initialize_band ()
end prototypes

public subroutine uf_initialize ();st_col.BackColor = rgb(255,255,255)
htb_1.Position = htb_1.MinPosition
ddlb_brushmode.Text = "Solid(0)"
st_gcol.BackColor = rgb(0,0,0)
htb_2.Position = htb_2.MinPosition
htb_3.Position = htb_3.MinPosition
htb_4.Position = htb_4.MinPosition
htb_5.Position = htb_5.MaxPosition
htb_6.Position = htb_6.MaxPosition
ddlb_repetitionmode.Text = "Count(0)"
em_repetitioncount.Text="0"
em_repetitionunitlength.Text = "100"

end subroutine

public subroutine uf_initialize_band ();ddlb_band.Text = "Header"
end subroutine

on uo_datawindowband.create
this.ddlb_band=create ddlb_band
this.st_5=create st_5
this.htb_6=create htb_6
this.htb_5=create htb_5
this.htb_4=create htb_4
this.htb_3=create htb_3
this.htb_2=create htb_2
this.cb_4=create cb_4
this.st_gcol=create st_gcol
this.st_27=create st_27
this.st_26=create st_26
this.htb_1=create htb_1
this.cb_3=create cb_3
this.st_col=create st_col
this.st_16=create st_16
this.em_repetitionunitlength=create em_repetitionunitlength
this.st_12=create st_12
this.em_repetitioncount=create em_repetitioncount
this.st_11=create st_11
this.ddlb_repetitionmode=create ddlb_repetitionmode
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_brushmode=create ddlb_brushmode
this.ln_3=create ln_3
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_6=create ln_6
this.Control[]={this.ddlb_band,&
this.st_5,&
this.htb_6,&
this.htb_5,&
this.htb_4,&
this.htb_3,&
this.htb_2,&
this.cb_4,&
this.st_gcol,&
this.st_27,&
this.st_26,&
this.htb_1,&
this.cb_3,&
this.st_col,&
this.st_16,&
this.em_repetitionunitlength,&
this.st_12,&
this.em_repetitioncount,&
this.st_11,&
this.ddlb_repetitionmode,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.ddlb_brushmode,&
this.ln_3,&
this.ln_4,&
this.ln_5,&
this.ln_6}
end on

on uo_datawindowband.destroy
destroy(this.ddlb_band)
destroy(this.st_5)
destroy(this.htb_6)
destroy(this.htb_5)
destroy(this.htb_4)
destroy(this.htb_3)
destroy(this.htb_2)
destroy(this.cb_4)
destroy(this.st_gcol)
destroy(this.st_27)
destroy(this.st_26)
destroy(this.htb_1)
destroy(this.cb_3)
destroy(this.st_col)
destroy(this.st_16)
destroy(this.em_repetitionunitlength)
destroy(this.st_12)
destroy(this.em_repetitioncount)
destroy(this.st_11)
destroy(this.ddlb_repetitionmode)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_brushmode)
destroy(this.ln_3)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_6)
end on

event constructor;uf_initialize()
end event

type ddlb_band from dropdownlistbox within uo_datawindowband
integer x = 434
integer y = 128
integer width = 878
integer height = 416
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Header","Detail","Summary","Footer"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;uf_initialize()
end event

type st_5 from statictext within uo_datawindowband
integer x = 59
integer y = 140
integer width = 343
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Band"
boolean focusrectangle = false
end type

type htb_6 from htrackbar within uo_datawindowband
integer x = 32
integer y = 1808
integer width = 1326
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;
	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.Gradient.Spread="+string(position))
		case "Detail"
			idw.Modify("DataWindow.Detail.Gradient.Spread="+string(position))
		case "Summary"
			idw.Modify("DataWindow.Summary.Gradient.Spread="+string(position))
		case "Footer"
			idw.Modify("DataWindow.Footer.Gradient.Spread="+string(position))
	end choose


end event

type htb_5 from htrackbar within uo_datawindowband
integer x = 32
integer y = 1628
integer width = 1326
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;
	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.Gradient.Scale="+string(position))
		case "Detail"
			idw.Modify("DataWindow.Detail.Gradient.Scale="+string(position))
		case "Summary"
			idw.Modify("DataWindow.Summary.Gradient.Scale="+string(position))
		case "Footer"
			idw.Modify("DataWindow.Footer.Gradient.Scale="+string(position))
	end choose


end event

type htb_4 from htrackbar within uo_datawindowband
integer x = 32
integer y = 1484
integer width = 1326
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;
	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.Gradient.Focus="+string(position))
		case "Detail"
			idw.Modify("DataWindow.Detail.Gradient.Focus="+string(position))
		case "Summary"
			idw.Modify("DataWindow.Summary.Gradient.Focus="+string(position))
		case "Footer"
			idw.Modify("DataWindow.Footer.Gradient.Focus="+string(position))
	end choose



end event

type htb_3 from htrackbar within uo_datawindowband
integer x = 32
integer y = 1312
integer width = 1326
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;
	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.Gradient.Angle="+string(position))
		case "Detail"
			idw.Modify("DataWindow.Detail.Gradient.Angle="+string(position))
		case "Summary"
			idw.Modify("DataWindow.Summary.Gradient.Angle="+string(position))
		case "Footer"
			idw.Modify("DataWindow.Footer.Gradient.Angle="+string(position))
	end choose

end event

type htb_2 from htrackbar within uo_datawindowband
integer x = 32
integer y = 1128
integer width = 1326
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;
	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.Gradient.Transparency="+string(position))
		case "Detail"
			idw.Modify("DataWindow.Detail.Gradient.Transparency="+string(position))
		case "Summary"
			idw.Modify("DataWindow.Summary.Gradient.Transparency="+string(position))
		case "Footer"
			idw.Modify("DataWindow.Footer.Gradient.Transparency="+string(position))
	end choose


end event

type cb_4 from commandbutton within uo_datawindowband
integer x = 704
integer y = 924
integer width = 155
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;double li_color
string sModify
long custom_color

li_color = ChooseColor( custom_color )


	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.Gradient.Color="+string(custom_color))
		case "Detail"
			idw.Modify("DataWindow.Detail.Gradient.Color="+string(custom_color))
		case "Summary"
			idw.Modify("DataWindow.Summary.Gradient.Color="+string(custom_color))
		case "Footer"
			idw.Modify("DataWindow.Footer.Gradient.Color="+string(custom_color))
	end choose


st_gcol.BackColor = custom_color
	


end event

type st_gcol from statictext within uo_datawindowband
integer x = 439
integer y = 928
integer width = 178
integer height = 84
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean focusrectangle = false
end type

type st_27 from statictext within uo_datawindowband
integer x = 375
integer y = 704
integer width = 283
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gradient"
boolean focusrectangle = false
end type

type st_26 from statictext within uo_datawindowband
integer x = 375
integer y = 300
integer width = 549
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Background Color"
boolean focusrectangle = false
end type

type htb_1 from htrackbar within uo_datawindowband
integer x = 32
integer y = 544
integer width = 1326
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;
	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.Transparency="+string(position))
		case "Detail"
			idw.Modify("DataWindow.Detail.Transparency="+string(position))
		case "Summary"
			idw.Modify("DataWindow.Summary.Transparency="+string(position))
		case "Footer"
			idw.Modify("DataWindow.Footer.Transparency="+string(position))
	end choose


end event

type cb_3 from commandbutton within uo_datawindowband
integer x = 727
integer y = 384
integer width = 155
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;double li_color
string sModify
long custom_color

li_color = ChooseColor( custom_color )


	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.color="+string(custom_color))
		case "Detail"
			idw.Modify("DataWindow.Detail.color="+string(custom_color))
		case "Summary"
			idw.Modify("DataWindow.Summary.color="+string(custom_color))
		case "Footer"
			idw.Modify("DataWindow.Footer.color="+string(custom_color))
	end choose
	

st_col.BackColor = custom_color
	

end event

type st_col from statictext within uo_datawindowband
integer x = 434
integer y = 392
integer width = 178
integer height = 84
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean focusrectangle = false
end type

type st_16 from statictext within uo_datawindowband
integer x = 59
integer y = 1060
integer width = 343
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transparency"
boolean focusrectangle = false
end type

type em_repetitionunitlength from editmask within uo_datawindowband
integer x = 645
integer y = 2152
integer width = 690
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "100"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###0"
boolean spin = true
double increment = 1
string minmax = "-1000~~1000"
end type

event modified;integer li_value
// Repetition Unit Length
li_value	= integer(em_repetitionunitlength.text)


	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.Gradient.Repetition.Length="+string(li_value))
		case "Detail"
			idw.Modify("DataWindow.Detail.Gradient.Repetition.Length="+string(li_value))
		case "Summary"
			idw.Modify("DataWindow.Summary.Gradient.Repetition.Length="+string(li_value))
		case "Footer"
			idw.Modify("DataWindow.Footer.Gradient.Repetition.Length="+string(li_value))
	end choose



end event

type st_12 from statictext within uo_datawindowband
integer x = 59
integer y = 2160
integer width = 581
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Repetition Unit Length"
boolean focusrectangle = false
end type

type em_repetitioncount from editmask within uo_datawindowband
integer x = 645
integer y = 2040
integer width = 690
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "-1000~~1000"
end type

event modified;integer li_value

li_value	= integer(em_repetitioncount.text)

	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.Gradient.Repetition.Count="+string(li_value))
		case "Detail"
			idw.Modify("DataWindow.Detail.Gradient.Repetition.Count="+string(li_value))
		case "Summary"
			idw.Modify("DataWindow.Summary.Gradient.Repetition.Count="+string(li_value))
		case "Footer"
			idw.Modify("DataWindow.Footer.Gradient.Repetition.Count="+string(li_value))
	end choose




end event

type st_11 from statictext within uo_datawindowband
integer x = 59
integer y = 2048
integer width = 466
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Repetition Count"
boolean focusrectangle = false
end type

type ddlb_repetitionmode from dropdownlistbox within uo_datawindowband
integer x = 649
integer y = 1928
integer width = 681
integer height = 236
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Count(0)","Length(1)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;integer ll_value
choose case this.text
	case 'Count(0)'
		ll_value=0
	case 'Length(1)'
		ll_value=1
end choose


	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.Gradient.Repetition.Mode="+string(ll_value))
		case "Detail"
			idw.Modify("DataWindow.Detail.Gradient.Repetition.Mode="+string(ll_value))
		case "Summary"
			idw.Modify("DataWindow.Summary.Gradient.Repetition.Mode="+string(ll_value))
		case "Footer"
			idw.Modify("DataWindow.Footer.Gradient.Repetition.Mode="+string(ll_value))
	end choose


	
end event

type st_10 from statictext within uo_datawindowband
integer x = 59
integer y = 1940
integer width = 466
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Repetition Mode"
boolean focusrectangle = false
end type

type st_9 from statictext within uo_datawindowband
integer x = 59
integer y = 1736
integer width = 343
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Spread"
boolean focusrectangle = false
end type

type st_8 from statictext within uo_datawindowband
integer x = 59
integer y = 1564
integer width = 343
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Scale"
boolean focusrectangle = false
end type

type st_7 from statictext within uo_datawindowband
integer x = 59
integer y = 1416
integer width = 343
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Focus"
boolean focusrectangle = false
end type

type st_6 from statictext within uo_datawindowband
integer x = 59
integer y = 1244
integer width = 343
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Angle"
boolean focusrectangle = false
end type

type st_4 from statictext within uo_datawindowband
integer x = 59
integer y = 952
integer width = 265
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Color"
boolean focusrectangle = false
end type

type st_3 from statictext within uo_datawindowband
integer x = 59
integer y = 480
integer width = 343
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transparency"
boolean focusrectangle = false
end type

type st_2 from statictext within uo_datawindowband
integer x = 69
integer y = 396
integer width = 343
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Color"
boolean focusrectangle = false
end type

type st_1 from statictext within uo_datawindowband
integer x = 59
integer y = 812
integer width = 343
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Brush Mode"
boolean focusrectangle = false
end type

type ddlb_brushmode from dropdownlistbox within uo_datawindowband
integer x = 434
integer y = 804
integer width = 864
integer height = 648
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Solid(0)","Horizontal(1)","Vertical(2)","Angle(3)","ScaledAngle(4)","Radial(5)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;int ll_value

 ll_value	= 0
choose	case	this.text
	case	'Solid(0)'
		ll_value	= 0
	case	'Horizontal(1)'
		ll_value	= 1
	case	'Vertical(2)'
		ll_value	= 2
	case	'Angle(3)'
		ll_value	= 3
	case	'ScaledAngle(4)'
		ll_value	= 4
	case	'Radial(5)'
		ll_value	= 5
end choose


	choose case ddlb_band.text
		case "Header"
			idw.Modify("DataWindow.Header.BrushMode="+string(ll_value))
		case "Detail"
			idw.Modify("DataWindow.Detail.BrushMode="+string(ll_value))
		case "Summary"
			idw.Modify("DataWindow.Summary.BrushMode="+string(ll_value))
		case "Footer"
			idw.Modify("DataWindow.Footer.BrushMode="+string(ll_value))
	end choose

	idw.modify( "datawindow.brushmode=" + string(ll_value) )


end event

type ln_3 from line within uo_datawindowband
long linecolor = 33554432
integer linethickness = 7
integer beginx = 46
integer beginy = 324
integer endx = 370
integer endy = 324
end type

type ln_4 from line within uo_datawindowband
long linecolor = 33554432
integer linethickness = 7
integer beginx = 832
integer beginy = 324
integer endx = 1339
integer endy = 324
end type

type ln_5 from line within uo_datawindowband
long linecolor = 33554432
integer linethickness = 7
integer beginx = 46
integer beginy = 728
integer endx = 370
integer endy = 728
end type

type ln_6 from line within uo_datawindowband
long linecolor = 33554432
integer linethickness = 7
integer beginx = 654
integer beginy = 728
integer endx = 1321
integer endy = 728
end type

