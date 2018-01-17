$PBExportHeader$w_dwo_rectangle.srw
forward
global type w_dwo_rectangle from w_dwobject_ancestor
end type
type gb_3 from groupbox within tabpage_1
end type
type gb_5 from groupbox within tabpage_1
end type
end forward

global type w_dwo_rectangle from w_dwobject_ancestor
string title = "Rectangle Object"
end type
global w_dwo_rectangle w_dwo_rectangle

on w_dwo_rectangle.create
int iCurrent
call super::create
end on

on w_dwo_rectangle.destroy
call super::destroy
end on

event ue_initialize;call super::ue_initialize;is_obj_name = 'r_1' 
end event

type gb_1 from w_dwobject_ancestor`gb_1 within w_dwo_rectangle
end type

type mle_1 from w_dwobject_ancestor`mle_1 within w_dwo_rectangle
integer x = 123
integer width = 1883
end type

type tab_1 from w_dwobject_ancestor`tab_1 within w_dwo_rectangle
end type

event tab_1::selectionchanged;call super::selectionchanged;choose case newindex
	case 1
		dw_1.dataobject = 'd_datawindow_rectangle'
	case 2
		dw_1.dataobject = 'd_datawindow_create'
		tab_1.tabpage_2.mle_2.text ='dw_1.Modify(~'create rectangle(band=detail x="786" y="48" height="452" width="745"  name=r_1 visible="1" brush.hatch="4" brush.color="65535" pen.style="0" pen.width="9" pen.color="255"  background.mode="2" background.color="16711680")~')'
end choose

dw_1.insertrow(0)
mle_1.text = ''
end event

type tabpage_1 from w_dwobject_ancestor`tabpage_1 within tab_1
gb_3 gb_3
gb_5 gb_5
end type

on tabpage_1.create
this.gb_3=create gb_3
this.gb_5=create gb_5
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_3
this.Control[iCurrent+2]=this.gb_5
end on

on tabpage_1.destroy
call super::destroy
destroy(this.gb_3)
destroy(this.gb_5)
end on

type dw_2 from w_dwobject_ancestor`dw_2 within tabpage_1
integer x = 64
integer y = 736
integer width = 919
integer height = 924
end type

type cb_get from w_dwobject_ancestor`cb_get within tabpage_1
integer height = 100
end type

type cb_set from w_dwobject_ancestor`cb_set within tabpage_1
integer height = 100
end type

type st_1 from w_dwobject_ancestor`st_1 within tabpage_1
end type

type lb_propparm from w_dwobject_ancestor`lb_propparm within tabpage_1
integer x = 1088
integer y = 732
integer width = 859
end type

type sle_propparm from w_dwobject_ancestor`sle_propparm within tabpage_1
integer y = 1584
integer width = 603
end type

type tabpage_2 from w_dwobject_ancestor`tabpage_2 within tab_1
end type

type cb_4 from w_dwobject_ancestor`cb_4 within tabpage_2
end type

type cb_3 from w_dwobject_ancestor`cb_3 within tabpage_2
end type

event cb_3::clicked;call super::clicked;string ls_rtn


ls_rtn = dw_1.Modify('create rectangle(band=detail x="786" y="48" height="452" width="745"  name=r_1 visible="1" brush.hatch="4" brush.color="65535" pen.style="0" pen.width="9" pen.color="255"  background.mode="2" background.color="16711680")')
                             
if ls_rtn <>'' then
	mle_1.text = '1. fail'
	mle_1.text +='2. '+ls_rtn	
else
	mle_1.text ='1. succeeds'
end if

end event

type mle_2 from w_dwobject_ancestor`mle_2 within tabpage_2
end type

type gb_2 from w_dwobject_ancestor`gb_2 within tabpage_2
end type

type cb_2 from w_dwobject_ancestor`cb_2 within w_dwo_rectangle
integer x = 2121
integer height = 100
end type

type gb_4 from w_dwobject_ancestor`gb_4 within w_dwo_rectangle
integer x = 78
integer width = 1966
end type

type dw_1 from w_dwobject_ancestor`dw_1 within w_dwo_rectangle
string dataobject = "d_datawindow_rectangle"
end type

type cb_1 from w_dwobject_ancestor`cb_1 within w_dwo_rectangle
integer height = 100
end type

event cb_1::clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
CHOOSE CASE tab_1.SelectedTab	
	CASE 1
		dw_1.dataobject ='d_datawindow_rectangle'
	CASE 2
		dw_1.dataobject ='d_datawindow_create' 
END CHOOSE

dw_1.insertrow(0)
mle_1.text = ''
end event

type gb_3 from groupbox within tabpage_1
integer x = 18
integer y = 672
integer width = 1010
integer height = 1024
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within tabpage_1
integer x = 1051
integer y = 684
integer width = 933
integer height = 1012
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

