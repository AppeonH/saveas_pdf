$PBExportHeader$w_dwo_bitmap.srw
forward
global type w_dwo_bitmap from w_dwobject_ancestor
end type
type gb_3 from groupbox within tabpage_1
end type
type gb_5 from groupbox within tabpage_1
end type
end forward

global type w_dwo_bitmap from w_dwobject_ancestor
string title = "Bitmap Object"
end type
global w_dwo_bitmap w_dwo_bitmap

on w_dwo_bitmap.create
int iCurrent
call super::create
end on

on w_dwo_bitmap.destroy
call super::destroy
end on

event ue_initialize;call super::ue_initialize;is_obj_name = 'p_1' 
end event

type gb_1 from w_dwobject_ancestor`gb_1 within w_dwo_bitmap
end type

type mle_1 from w_dwobject_ancestor`mle_1 within w_dwo_bitmap
integer x = 128
integer width = 1888
end type

type tab_1 from w_dwobject_ancestor`tab_1 within w_dwo_bitmap
end type

event tab_1::selectionchanged;call super::selectionchanged;choose case newindex
	case 1
		dw_1.dataobject = 'd_datawindow_bitmap'
	case 2
		dw_1.dataobject = 'd_datawindow_create'
		tab_1.tabpage_2.mle_2.text ='dw_1.Modify(~'create bitmap(band=detail filename="tshirto.bmp" x="873" y="60" height="428" width="517" border="0"  name=p_1 visible="1" )~')'
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
integer width = 923
integer height = 912
end type

type cb_get from w_dwobject_ancestor`cb_get within tabpage_1
integer height = 100
end type

type cb_set from w_dwobject_ancestor`cb_set within tabpage_1
integer height = 100
end type

event cb_set::clicked;//====================================================================
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
//	     Modify Bug  zhouchaoqun  2005/02/25
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_param,ls_prop,ls_modify,ls_rtn
long ll_row,ll_rowcount,ll_pos

ll_row = tab_1.tabpage_1.dw_2.getrow()
ll_rowcount = tab_1.tabpage_1.dw_2.rowcount()

If ll_rowcount > 0 and ll_row <= 0 Then	
	MessageBox('Warning','Please select testing property.')
	Return
End If
 
ls_prop = tab_1.tabpage_1.dw_2.getitemstring(ll_row,'fp')

ls_Param = Trim(sle_propparm.Text)
ll_pos = PosA(ls_Param,' ')
if ll_pos > 0 then
	ls_param = LeftA(ls_param,(ll_pos - 1))
end if
If ls_Param = '' or LenA(ls_param) <0 Then	
	MessageBox('Warning','Please select testing data.')
	Return
End If

ls_modify = is_obj_name+"."+ls_prop + "= '"+ls_Param+"'"
ls_rtn = dw_1.Modify(ls_modify)

if ls_rtn <>'' then
	messagebox('Warning','Modify returns an error occurs.')
	Return 
end if
cb_get.postevent(clicked!)
end event

type st_1 from w_dwobject_ancestor`st_1 within tabpage_1
integer y = 1584
end type

type lb_propparm from w_dwobject_ancestor`lb_propparm within tabpage_1
integer x = 1083
integer y = 736
integer width = 873
integer height = 816
end type

type sle_propparm from w_dwobject_ancestor`sle_propparm within tabpage_1
integer y = 1572
integer width = 608
end type

type tabpage_2 from w_dwobject_ancestor`tabpage_2 within tab_1
end type

type cb_4 from w_dwobject_ancestor`cb_4 within tabpage_2
end type

type cb_3 from w_dwobject_ancestor`cb_3 within tabpage_2
end type

event cb_3::clicked;call super::clicked;string ls_rtn


ls_rtn = dw_1.Modify('create bitmap(band=detail filename="tshirto.bmp" x="873" y="60" height="428" width="517" border="0"  name=p_1 visible="1" )')
                             
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

type cb_2 from w_dwobject_ancestor`cb_2 within w_dwo_bitmap
integer y = 2056
integer height = 100
end type

type gb_4 from w_dwobject_ancestor`gb_4 within w_dwo_bitmap
integer x = 73
integer width = 1993
end type

type dw_1 from w_dwobject_ancestor`dw_1 within w_dwo_bitmap
string dataobject = "d_datawindow_bitmap"
end type

type cb_1 from w_dwobject_ancestor`cb_1 within w_dwo_bitmap
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
		dw_1.dataobject ='d_datawindow_bitmap'
	CASE 2
		dw_1.dataobject ='d_datawindow_create' 
END CHOOSE

dw_1.insertrow(0)
mle_1.text = ''
end event

type gb_3 from groupbox within tabpage_1
integer x = 14
integer y = 684
integer width = 1015
integer height = 1000
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within tabpage_1
integer x = 1047
integer y = 684
integer width = 960
integer height = 1000
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

