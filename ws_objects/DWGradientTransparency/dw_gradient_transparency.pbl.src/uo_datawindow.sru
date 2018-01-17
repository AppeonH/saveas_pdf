$PBExportHeader$uo_datawindow.sru
forward
global type uo_datawindow from userobject
end type
type st_clipb from statictext within uo_datawindow
end type
type st_clipr from statictext within uo_datawindow
end type
type htb_pic from htrackbar within uo_datawindow
end type
type st_5 from statictext within uo_datawindow
end type
type htb_6 from htrackbar within uo_datawindow
end type
type htb_5 from htrackbar within uo_datawindow
end type
type htb_4 from htrackbar within uo_datawindow
end type
type htb_3 from htrackbar within uo_datawindow
end type
type htb_2 from htrackbar within uo_datawindow
end type
type cb_4 from commandbutton within uo_datawindow
end type
type st_gcol from statictext within uo_datawindow
end type
type st_27 from statictext within uo_datawindow
end type
type st_26 from statictext within uo_datawindow
end type
type htb_1 from htrackbar within uo_datawindow
end type
type cb_3 from commandbutton within uo_datawindow
end type
type st_col from statictext within uo_datawindow
end type
type st_25 from statictext within uo_datawindow
end type
type em_clipbottom from editmask within uo_datawindow
end type
type em_cliptop from editmask within uo_datawindow
end type
type st_clipt from statictext within uo_datawindow
end type
type em_clipright from editmask within uo_datawindow
end type
type em_clipleft from editmask within uo_datawindow
end type
type st_clipl from statictext within uo_datawindow
end type
type em_scaley from editmask within uo_datawindow
end type
type st_picy from statictext within uo_datawindow
end type
type em_scalex from editmask within uo_datawindow
end type
type ddlb_tilemode from dropdownlistbox within uo_datawindow
end type
type cb_file from commandbutton within uo_datawindow
end type
type sle_file from singlelineedit within uo_datawindow
end type
type st_picx from statictext within uo_datawindow
end type
type st_18 from statictext within uo_datawindow
end type
type st_17 from statictext within uo_datawindow
end type
type st_16 from statictext within uo_datawindow
end type
type em_repetitionunitlength from editmask within uo_datawindow
end type
type st_12 from statictext within uo_datawindow
end type
type em_repetitioncount from editmask within uo_datawindow
end type
type st_11 from statictext within uo_datawindow
end type
type ddlb_repetitionmode from dropdownlistbox within uo_datawindow
end type
type st_10 from statictext within uo_datawindow
end type
type st_9 from statictext within uo_datawindow
end type
type st_8 from statictext within uo_datawindow
end type
type st_7 from statictext within uo_datawindow
end type
type st_6 from statictext within uo_datawindow
end type
type st_4 from statictext within uo_datawindow
end type
type st_3 from statictext within uo_datawindow
end type
type st_2 from statictext within uo_datawindow
end type
type st_1 from statictext within uo_datawindow
end type
type ddlb_brushmode from dropdownlistbox within uo_datawindow
end type
type ln_3 from line within uo_datawindow
end type
type ln_4 from line within uo_datawindow
end type
type ln_5 from line within uo_datawindow
end type
type ln_6 from line within uo_datawindow
end type
type ln_1 from line within uo_datawindow
end type
type ln_2 from line within uo_datawindow
end type
end forward

global type uo_datawindow from userobject
integer width = 1431
integer height = 2760
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_clipb st_clipb
st_clipr st_clipr
htb_pic htb_pic
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
st_25 st_25
em_clipbottom em_clipbottom
em_cliptop em_cliptop
st_clipt st_clipt
em_clipright em_clipright
em_clipleft em_clipleft
st_clipl st_clipl
em_scaley em_scaley
st_picy st_picy
em_scalex em_scalex
ddlb_tilemode ddlb_tilemode
cb_file cb_file
sle_file sle_file
st_picx st_picx
st_18 st_18
st_17 st_17
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
ln_1 ln_1
ln_2 ln_2
end type
global uo_datawindow uo_datawindow

type variables
datawindow	idw
end variables

forward prototypes
public subroutine uf_filemode (boolean b_switch)
public subroutine uf_initialize ()
end prototypes

public subroutine uf_filemode (boolean b_switch);sle_file.enabled=b_switch
cb_file.enabled=b_switch
ddlb_tilemode.enabled=b_switch

st_picx.enabled=b_switch
em_scalex.enabled = b_switch

st_picy.enabled=b_switch
em_scaley.enabled = b_switch

st_clipl.enabled=b_switch
em_clipleft.enabled = b_switch

st_clipr.enabled=b_switch
em_clipright.enabled = b_switch

st_clipt.enabled=b_switch
em_cliptop.enabled = b_switch

st_clipb.enabled=b_switch
em_clipbottom.enabled = b_switch

htb_pic.visible=b_switch


end subroutine

public subroutine uf_initialize ();integer ll_value
ll_value=0



st_col.backcolor = long(idw.object.DataWindow.Color)
st_gcol.backcolor = long(idw.object.DataWindow.Gradient.Color)

ll_value = integer( idw.object.datawindow.brushmode)
choose	case	ll_value
	case	0
		ddlb_brushmode.Text = 'Solid(0)'
	case	1
		ddlb_brushmode.Text = 'HorizontalGradient(1)'
	case	2
		ddlb_brushmode.Text ='VerticalGradient(2)'
	case	3
		ddlb_brushmode.Text ='AngleGradient(3)'
	case	4
		ddlb_brushmode.Text ='ScaledAngleGradient(4)'
	case	5
		ddlb_brushmode.Text = 'RadialGradient(5)'
	case	6
		ddlb_brushmode.Text = 'Picture(6)'
end choose

htb_1.Position= long(idw.object.DataWindow.Transparency)
htb_2.Position= long(idw.object.DataWindow.Gradient.Transparency)

htb_3.Position= long( idw.object.DataWindow.Gradient.Angle)
htb_4.Position= long(idw.object.DataWindow.Gradient.Focus)
htb_5.Position= long (idw.object.DataWindow.Gradient.Scale)
htb_6.Position= long (idw.object.DataWindow.Gradient.Spread)

ddlb_repetitionmode.Text = "Count(0)"
em_repetitioncount.Text = "0"
em_repetitionunitlength.Text = "100"

uf_filemode(false)








end subroutine

on uo_datawindow.create
this.st_clipb=create st_clipb
this.st_clipr=create st_clipr
this.htb_pic=create htb_pic
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
this.st_25=create st_25
this.em_clipbottom=create em_clipbottom
this.em_cliptop=create em_cliptop
this.st_clipt=create st_clipt
this.em_clipright=create em_clipright
this.em_clipleft=create em_clipleft
this.st_clipl=create st_clipl
this.em_scaley=create em_scaley
this.st_picy=create st_picy
this.em_scalex=create em_scalex
this.ddlb_tilemode=create ddlb_tilemode
this.cb_file=create cb_file
this.sle_file=create sle_file
this.st_picx=create st_picx
this.st_18=create st_18
this.st_17=create st_17
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
this.ln_1=create ln_1
this.ln_2=create ln_2
this.Control[]={this.st_clipb,&
this.st_clipr,&
this.htb_pic,&
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
this.st_25,&
this.em_clipbottom,&
this.em_cliptop,&
this.st_clipt,&
this.em_clipright,&
this.em_clipleft,&
this.st_clipl,&
this.em_scaley,&
this.st_picy,&
this.em_scalex,&
this.ddlb_tilemode,&
this.cb_file,&
this.sle_file,&
this.st_picx,&
this.st_18,&
this.st_17,&
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
this.ln_6,&
this.ln_1,&
this.ln_2}
end on

on uo_datawindow.destroy
destroy(this.st_clipb)
destroy(this.st_clipr)
destroy(this.htb_pic)
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
destroy(this.st_25)
destroy(this.em_clipbottom)
destroy(this.em_cliptop)
destroy(this.st_clipt)
destroy(this.em_clipright)
destroy(this.em_clipleft)
destroy(this.st_clipl)
destroy(this.em_scaley)
destroy(this.st_picy)
destroy(this.em_scalex)
destroy(this.ddlb_tilemode)
destroy(this.cb_file)
destroy(this.sle_file)
destroy(this.st_picx)
destroy(this.st_18)
destroy(this.st_17)
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
destroy(this.ln_1)
destroy(this.ln_2)
end on

event constructor;uf_filemode(false)
end event

type st_clipb from statictext within uo_datawindow
integer x = 827
integer y = 2456
integer width = 229
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bottom"
boolean focusrectangle = false
end type

type st_clipr from statictext within uo_datawindow
integer x = 827
integer y = 2340
integer width = 229
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Right"
boolean focusrectangle = false
end type

type htb_pic from htrackbar within uo_datawindow
integer x = 18
integer y = 2624
integer width = 1349
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;//if rb_1.Checked then
//	idw.object.Datawindow.Picture.Transparency	= position
//else
	idw.modify( "Datawindow.Picture.Transparency=" + string(position) )
//end if
end event

type st_5 from statictext within uo_datawindow
integer x = 375
integer y = 1904
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
string text = "Picture"
boolean focusrectangle = false
end type

type htb_6 from htrackbar within uo_datawindow
integer x = 18
integer y = 1436
integer width = 1349
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;
	idw.Modify("DataWindow.Gradient.Spread="+string(position))

end event

type htb_5 from htrackbar within uo_datawindow
integer x = 18
integer y = 1256
integer width = 1349
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;idw.Modify("DataWindow.Gradient.Scale="+string(position))

end event

type htb_4 from htrackbar within uo_datawindow
integer x = 18
integer y = 1120
integer width = 1349
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;idw.Modify("DataWindow.Gradient.Focus="+string(position))

end event

type htb_3 from htrackbar within uo_datawindow
integer x = 18
integer y = 960
integer width = 1349
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;idw.Modify("DataWindow.Gradient.Angle="+string(position))

end event

type htb_2 from htrackbar within uo_datawindow
integer x = 18
integer y = 788
integer width = 1349
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;idw.Modify("DataWindow.Gradient.Transparency="+string(position))
end event

type cb_4 from commandbutton within uo_datawindow
integer x = 727
integer y = 612
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

idw.Modify("DataWindow.Gradient.Color='"+string(custom_color)+"'")

st_gcol.BackColor = custom_color
	

end event

type st_gcol from statictext within uo_datawindow
integer x = 443
integer y = 624
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

type st_27 from statictext within uo_datawindow
integer x = 375
integer y = 548
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

type st_26 from statictext within uo_datawindow
integer x = 375
integer y = 72
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

type htb_1 from htrackbar within uo_datawindow
integer x = 18
integer y = 440
integer width = 1349
integer height = 92
integer maxposition = 100
integer tickfrequency = 1
end type

event moved;idw.Modify("DataWindow.Transparency="+string(position))

end event

type cb_3 from commandbutton within uo_datawindow
integer x = 727
integer y = 272
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

idw.Modify("DataWindow.Color='"+string(custom_color)+"'")

st_col.BackColor = custom_color
	

end event

type st_col from statictext within uo_datawindow
integer x = 443
integer y = 284
integer width = 178
integer height = 76
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

type st_25 from statictext within uo_datawindow
integer x = 50
integer y = 2556
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

type em_clipbottom from editmask within uo_datawindow
integer x = 1083
integer y = 2444
integer width = 261
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "-1000~~1000"
end type

event modified;integer li_value
// Picture Clip Bottom
li_value	= integer(em_clipbottom.text)
idw.Modify("Datawindow.Picture.Clip.Bottom="+string(li_value))



end event

type em_cliptop from editmask within uo_datawindow
integer x = 507
integer y = 2444
integer width = 270
integer height = 80
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "-1000~~1000"
end type

event modified;integer li_value
// Picture Clip Top
li_value	= integer(em_cliptop.text)
idw.Modify("Datawindow.Picture.Clip.Top="+string(li_value))



end event

type st_clipt from statictext within uo_datawindow
integer x = 50
integer y = 2444
integer width = 430
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Picture Clip Top"
boolean focusrectangle = false
end type

type em_clipright from editmask within uo_datawindow
integer x = 1083
integer y = 2332
integer width = 261
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "-1000~~1000"
end type

event modified;integer li_value
// Picture Clip Right
li_value	= 0
li_value	= integer(em_clipright.text)

idw.Modify("Datawindow.Picture.Clip.Right="+string(li_value))




end event

type em_clipleft from editmask within uo_datawindow
integer x = 507
integer y = 2332
integer width = 270
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "-1000~~1000"
end type

event modified;integer li_value
// Picture Clip Left
li_value	= 0
li_value	= integer(em_clipleft.text)

idw.Modify("Datawindow.Picture.Clip.Left="+string(li_value))



end event

type st_clipl from statictext within uo_datawindow
integer x = 50
integer y = 2332
integer width = 402
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Picture Clip Left"
boolean focusrectangle = false
end type

type em_scaley from editmask within uo_datawindow
integer x = 1083
integer y = 2208
integer width = 261
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "-1000~~1000"
end type

event modified;integer li_value
// Picture Scale Y
li_value	= 0
li_value	= integer(em_scaley.text)

idw.Modify("Datawindow.Picture.Scale.Y="+string(li_value))


end event

type st_picy from statictext within uo_datawindow
integer x = 827
integer y = 2220
integer width = 229
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Scale Y"
boolean focusrectangle = false
end type

type em_scalex from editmask within uo_datawindow
integer x = 507
integer y = 2208
integer width = 270
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 1
string minmax = "-1000~~1000"
end type

event modified;integer li_value
// Picture Scale X
li_value	= 0
li_value	= integer(em_scalex.text)

idw.Modify("Datawindow.Picture.Scale.X="+string(li_value))



end event

type ddlb_tilemode from dropdownlistbox within uo_datawindow
integer x = 507
integer y = 2092
integer width = 681
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
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"Original Size(0)","Fit to Width(1)","Fit to Height(2)","Preserve Aspect Ratio/Max to Rect(3)","Stretch to Fit(4)","Tile(5)","FlipX(6)","FlipY(7)","FlipXY(8)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
		choose case ddlb_tilemode.text
			case 'Original Size(0)'
				idw.Modify("Datawindow.Picture.Mode=0")
			case 'Fit to Width(1)'
				idw.Modify("Datawindow.Picture.Mode=1")
			case 'Fit to Height(2)'
				idw.Modify("Datawindow.Picture.Mode=2")
			case 'Preserve Aspect Ratio/Max to Rect(3)'
				idw.Modify("Datawindow.Picture.Mode=3")
			case 'Stretch to Fit(4)'
				idw.Modify("Datawindow.Picture.Mode=4")
			case 'Tile(5)'
				idw.Modify("Datawindow.Picture.Mode=5")
			case 'FlipX(6)'
				idw.Modify("Datawindow.Picture.Mode=6")
			case 'FlipY(7)'
				idw.Modify("Datawindow.Picture.Mode=7")
			case 'FlipXY(8)'
				idw.Modify("Datawindow.Picture.Mode=8")
		end choose
	

end event

type cb_file from commandbutton within uo_datawindow
integer x = 1216
integer y = 1984
integer width = 91
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;string ls_docpath, ls_docname
integer i, li_cnt, li_rtn, li_filenum

li_rtn = GetFileOpenName("Select File", ls_docpath, ls_docname)

IF li_rtn < 1 THEN return
 
sle_file.text = ls_docpath

idw.Modify("DataWindow.Picture.File='"+sle_file.Text+"'")



end event

type sle_file from singlelineedit within uo_datawindow
integer x = 251
integer y = 1984
integer width = 946
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_picx from statictext within uo_datawindow
integer x = 50
integer y = 2208
integer width = 402
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Picture Scale X"
boolean focusrectangle = false
end type

type st_18 from statictext within uo_datawindow
integer x = 50
integer y = 2096
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
string text = "Tile Mode"
boolean focusrectangle = false
end type

type st_17 from statictext within uo_datawindow
integer x = 50
integer y = 1984
integer width = 206
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "File"
boolean focusrectangle = false
end type

type st_16 from statictext within uo_datawindow
integer x = 50
integer y = 724
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
string text = "Transparency"
boolean focusrectangle = false
end type

type em_repetitionunitlength from editmask within uo_datawindow
integer x = 649
integer y = 1760
integer width = 681
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

event modified;integer li_value
// Repetition Unit Length
li_value	= integer(em_repetitionunitlength.text)
idw.Modify("Datawindow.Gradient.Repetition.Length="+string(li_value))

end event

type st_12 from statictext within uo_datawindow
integer x = 50
integer y = 1760
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

type em_repetitioncount from editmask within uo_datawindow
integer x = 649
integer y = 1660
integer width = 681
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

event modified;integer li_value

li_value	= integer(em_repetitioncount.text)

idw.Modify("Datawindow.Gradient.Repetition.Count="+string(li_value))



end event

type st_11 from statictext within uo_datawindow
integer x = 50
integer y = 1660
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

type ddlb_repetitionmode from dropdownlistbox within uo_datawindow
integer x = 649
integer y = 1552
integer width = 681
integer height = 252
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

event selectionchanged;
	choose case this.text
		case 'Count(0)'
			idw.Modify("Datawindow.Gradient.Repetition.Mode = 0")
		case 'Length(1)'
			idw.Modify("Datawindow.Gradient.Repetition.Mode = 1")
	end choose

	
end event

type st_10 from statictext within uo_datawindow
integer x = 50
integer y = 1560
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

type st_9 from statictext within uo_datawindow
integer x = 50
integer y = 1360
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

type st_8 from statictext within uo_datawindow
integer x = 50
integer y = 1200
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
string text = "Scale"
boolean focusrectangle = false
end type

type st_7 from statictext within uo_datawindow
integer x = 50
integer y = 1056
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
string text = "Focus"
boolean focusrectangle = false
end type

type st_6 from statictext within uo_datawindow
integer x = 50
integer y = 892
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

type st_4 from statictext within uo_datawindow
integer x = 50
integer y = 640
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

type st_3 from statictext within uo_datawindow
integer x = 50
integer y = 376
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

type st_2 from statictext within uo_datawindow
integer x = 55
integer y = 288
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
string text = "Color"
boolean focusrectangle = false
end type

type st_1 from statictext within uo_datawindow
integer x = 50
integer y = 192
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

type ddlb_brushmode from dropdownlistbox within uo_datawindow
integer x = 434
integer y = 164
integer width = 859
integer height = 556
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Solid(0)","HorizontalGradient(1)","VerticalGradient(2)","AngleGradient(3)","ScaledAngleGradient(4)","RadialGradient(5)","Picture(6)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;int ll_value
ll_value	= 0
choose	case	ddlb_brushmode.text
	case	'Solid(0)'
		ll_value	= 0
	case	'HorizontalGradient(1)'
		ll_value	= 1
	case	'VerticalGradient(2)'
		ll_value	= 2
	case	'AngleGradient(3)'
		ll_value	= 3
	case	'ScaledAngleGradient(4)'
		ll_value	= 4
	case	'RadialGradient(5)'
		ll_value	= 5
	case	'Picture(6)'
		ll_value	= 6
end choose
if ll_value=6 then
	uf_filemode(true)
else
	uf_filemode(false)
end if

// Brush Mode
	
	idw.modify( "datawindow.brushmode=" + string(ll_value) )


end event

type ln_3 from line within uo_datawindow
long linecolor = 33554432
integer linethickness = 7
integer beginx = 32
integer beginy = 96
integer endx = 357
integer endy = 96
end type

type ln_4 from line within uo_datawindow
long linecolor = 33554432
integer linethickness = 7
integer beginx = 832
integer beginy = 108
integer endx = 1339
integer endy = 108
end type

type ln_5 from line within uo_datawindow
long linecolor = 33554432
integer linethickness = 7
integer beginx = 32
integer beginy = 580
integer endx = 357
integer endy = 580
end type

type ln_6 from line within uo_datawindow
long linecolor = 33554432
integer linethickness = 7
integer beginx = 654
integer beginy = 580
integer endx = 1321
integer endy = 580
end type

type ln_1 from line within uo_datawindow
long linecolor = 33554432
integer linethickness = 7
integer beginx = 32
integer beginy = 1928
integer endx = 357
integer endy = 1928
end type

type ln_2 from line within uo_datawindow
long linecolor = 33554432
integer linethickness = 7
integer beginx = 654
integer beginy = 1928
integer endx = 1321
integer endy = 1928
end type

