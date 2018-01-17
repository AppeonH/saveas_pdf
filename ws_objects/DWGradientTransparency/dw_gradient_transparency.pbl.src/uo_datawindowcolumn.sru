$PBExportHeader$uo_datawindowcolumn.sru
forward
global type uo_datawindowcolumn from userobject
end type
type mle_1 from multilineedit within uo_datawindowcolumn
end type
type htb_6 from htrackbar within uo_datawindowcolumn
end type
type htb_5 from htrackbar within uo_datawindowcolumn
end type
type htb_4 from htrackbar within uo_datawindowcolumn
end type
type htb_3 from htrackbar within uo_datawindowcolumn
end type
type htb_2 from htrackbar within uo_datawindowcolumn
end type
type cb_4 from commandbutton within uo_datawindowcolumn
end type
type st_gcol from statictext within uo_datawindowcolumn
end type
type st_27 from statictext within uo_datawindowcolumn
end type
type htb_1 from htrackbar within uo_datawindowcolumn
end type
type cb_3 from commandbutton within uo_datawindowcolumn
end type
type st_col from statictext within uo_datawindowcolumn
end type
type st_16 from statictext within uo_datawindowcolumn
end type
type em_repetitionunitlength from editmask within uo_datawindowcolumn
end type
type st_12 from statictext within uo_datawindowcolumn
end type
type em_repetitioncount from editmask within uo_datawindowcolumn
end type
type st_11 from statictext within uo_datawindowcolumn
end type
type ddlb_repetitionmode from dropdownlistbox within uo_datawindowcolumn
end type
type st_10 from statictext within uo_datawindowcolumn
end type
type st_9 from statictext within uo_datawindowcolumn
end type
type st_8 from statictext within uo_datawindowcolumn
end type
type st_7 from statictext within uo_datawindowcolumn
end type
type st_6 from statictext within uo_datawindowcolumn
end type
type st_4 from statictext within uo_datawindowcolumn
end type
type st_3 from statictext within uo_datawindowcolumn
end type
type st_2 from statictext within uo_datawindowcolumn
end type
type st_1 from statictext within uo_datawindowcolumn
end type
type ddlb_brushmode from dropdownlistbox within uo_datawindowcolumn
end type
type ln_3 from line within uo_datawindowcolumn
end type
type ln_5 from line within uo_datawindowcolumn
end type
type ln_6 from line within uo_datawindowcolumn
end type
type st_26 from statictext within uo_datawindowcolumn
end type
type ln_4 from line within uo_datawindowcolumn
end type
end forward

global type uo_datawindowcolumn from userobject
integer width = 1426
integer height = 2712
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
mle_1 mle_1
htb_6 htb_6
htb_5 htb_5
htb_4 htb_4
htb_3 htb_3
htb_2 htb_2
cb_4 cb_4
st_gcol st_gcol
st_27 st_27
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
ln_5 ln_5
ln_6 ln_6
st_26 st_26
ln_4 ln_4
end type
global uo_datawindowcolumn uo_datawindowcolumn

type variables
datawindow	idw
string dwBand
string dwc_name
end variables

on uo_datawindowcolumn.create
this.mle_1=create mle_1
this.htb_6=create htb_6
this.htb_5=create htb_5
this.htb_4=create htb_4
this.htb_3=create htb_3
this.htb_2=create htb_2
this.cb_4=create cb_4
this.st_gcol=create st_gcol
this.st_27=create st_27
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
this.ln_5=create ln_5
this.ln_6=create ln_6
this.st_26=create st_26
this.ln_4=create ln_4
this.Control[]={this.mle_1,&
this.htb_6,&
this.htb_5,&
this.htb_4,&
this.htb_3,&
this.htb_2,&
this.cb_4,&
this.st_gcol,&
this.st_27,&
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
this.ln_5,&
this.ln_6,&
this.st_26,&
this.ln_4}
end on

on uo_datawindowcolumn.destroy
destroy(this.mle_1)
destroy(this.htb_6)
destroy(this.htb_5)
destroy(this.htb_4)
destroy(this.htb_3)
destroy(this.htb_2)
destroy(this.cb_4)
destroy(this.st_gcol)
destroy(this.st_27)
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
destroy(this.ln_5)
destroy(this.ln_6)
destroy(this.st_26)
destroy(this.ln_4)
end on

type mle_1 from multilineedit within uo_datawindowcolumn
integer x = 101
integer y = 2188
integer width = 1239
integer height = 348
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Click in a DataWindow column , then change the background and gradient property settings to see the effects of these property changes on the selected column"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

type htb_6 from htrackbar within uo_datawindowcolumn
integer x = 46
integer y = 1596
integer width = 1330
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;idw.Modify( dwc_name +".Background.Gradient.Spread="+string(position))


end event

type htb_5 from htrackbar within uo_datawindowcolumn
integer x = 46
integer y = 1416
integer width = 1330
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;idw.Modify( dwc_name +".Background.Gradient.Scale="+string(position))


end event

type htb_4 from htrackbar within uo_datawindowcolumn
integer x = 46
integer y = 1260
integer width = 1330
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;idw.Modify( dwc_name +".Background.Gradient.Focus="+string(position))



end event

type htb_3 from htrackbar within uo_datawindowcolumn
integer x = 46
integer y = 1100
integer width = 1330
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;idw.Modify( dwc_name +".Background.Gradient.Angle="+string(position))




end event

type htb_2 from htrackbar within uo_datawindowcolumn
integer x = 46
integer y = 928
integer width = 1330
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;
idw.Modify( dwc_name +".Background.Gradient.Transparency="+string(position))
//
//
end event

type cb_4 from commandbutton within uo_datawindowcolumn
integer x = 731
integer y = 744
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

idw.Modify( dwc_name +".Background.gradient.Color="+string(custom_color))


st_gcol.BackColor = custom_color
	


end event

type st_gcol from statictext within uo_datawindowcolumn
integer x = 480
integer y = 752
integer width = 178
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 0
boolean focusrectangle = false
end type

type st_27 from statictext within uo_datawindowcolumn
integer x = 402
integer y = 516
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

type htb_1 from htrackbar within uo_datawindowcolumn
integer x = 46
integer y = 384
integer width = 1330
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;idw.Modify( dwc_name +".Background.Transparency="+string(position))



end event

type cb_3 from commandbutton within uo_datawindowcolumn
integer x = 754
integer y = 184
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
string sModify , rtv
long custom_color


li_color = ChooseColor( custom_color )

rtv = idw.Modify(dwc_name +".Background.Color="+string(custom_color))
idw.Modify( dwc_name +".Background.Transparency="+string(htb_1.position))

st_col.BackColor = custom_color

end event

type st_col from statictext within uo_datawindowcolumn
integer x = 480
integer y = 196
integer width = 178
integer height = 72
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

type st_16 from statictext within uo_datawindowcolumn
integer x = 73
integer y = 868
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

type em_repetitionunitlength from editmask within uo_datawindowcolumn
integer x = 672
integer y = 1952
integer width = 677
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###0"
boolean spin = true
double increment = 1
string minmax = "-1000~~1000"
end type

event modified;integer ll_value
// Repetition Unit Length
ll_value	= integer(em_repetitionunitlength.text)

idw.Modify( dwc_name +".Background.Gradient.Repetition.Length="+string(ll_value))




end event

type st_12 from statictext within uo_datawindowcolumn
integer x = 73
integer y = 1952
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

type em_repetitioncount from editmask within uo_datawindowcolumn
integer x = 672
integer y = 1852
integer width = 677
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "-1000~~1000"
end type

event modified;integer ll_value

ll_value	= integer(em_repetitioncount.text)


idw.Modify( dwc_name +".Background.Gradient.Repetition.Count="+string(ll_value))




end event

type st_11 from statictext within uo_datawindowcolumn
integer x = 73
integer y = 1848
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

type ddlb_repetitionmode from dropdownlistbox within uo_datawindowcolumn
integer x = 672
integer y = 1740
integer width = 677
integer height = 368
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

idw.Modify( dwc_name +".Background.Gradient.Repetition.Mode="+string(ll_value))



end event

type st_10 from statictext within uo_datawindowcolumn
integer x = 73
integer y = 1748
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

type st_9 from statictext within uo_datawindowcolumn
integer x = 73
integer y = 1524
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
string text = "Spread"
boolean focusrectangle = false
end type

type st_8 from statictext within uo_datawindowcolumn
integer x = 73
integer y = 1356
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
string text = "Scale"
boolean focusrectangle = false
end type

type st_7 from statictext within uo_datawindowcolumn
integer x = 73
integer y = 1196
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
string text = "Focus"
boolean focusrectangle = false
end type

type st_6 from statictext within uo_datawindowcolumn
integer x = 73
integer y = 1032
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
string text = "Angle"
boolean focusrectangle = false
end type

type st_4 from statictext within uo_datawindowcolumn
integer x = 73
integer y = 772
integer width = 361
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

type st_3 from statictext within uo_datawindowcolumn
integer x = 73
integer y = 312
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

type st_2 from statictext within uo_datawindowcolumn
integer x = 78
integer y = 204
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

type st_1 from statictext within uo_datawindowcolumn
integer x = 73
integer y = 620
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

type ddlb_brushmode from dropdownlistbox within uo_datawindowcolumn
integer x = 466
integer y = 612
integer width = 869
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

idw.Modify( dwc_name +".Background.BrushMode="+string(ll_value))
	



end event

type ln_3 from line within uo_datawindowcolumn
long linecolor = 33554432
integer linethickness = 7
integer beginx = 59
integer beginy = 108
integer endx = 384
integer endy = 108
end type

type ln_5 from line within uo_datawindowcolumn
long linecolor = 33554432
integer linethickness = 7
integer beginx = 59
integer beginy = 540
integer endx = 384
integer endy = 540
end type

type ln_6 from line within uo_datawindowcolumn
long linecolor = 33554432
integer linethickness = 7
integer beginx = 681
integer beginy = 540
integer endx = 1349
integer endy = 540
end type

type st_26 from statictext within uo_datawindowcolumn
integer x = 402
integer y = 84
integer width = 549
integer height = 56
boolean bringtotop = true
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

type ln_4 from line within uo_datawindowcolumn
long linecolor = 33554432
integer linethickness = 7
integer beginx = 859
integer beginy = 108
integer endx = 1367
integer endy = 108
end type

