$PBExportHeader$w_dwo_groupbox.srw
forward
global type w_dwo_groupbox from w_dwobject_ancestor
end type
type gb_3 from groupbox within tabpage_1
end type
type gb_5 from groupbox within tabpage_1
end type
end forward

global type w_dwo_groupbox from w_dwobject_ancestor
string title = "Groupbox Object"
end type
global w_dwo_groupbox w_dwo_groupbox

on w_dwo_groupbox.create
int iCurrent
call super::create
end on

on w_dwo_groupbox.destroy
call super::destroy
end on

event ue_initialize;call super::ue_initialize;is_obj_name = 'gb_1' 
end event

type gb_1 from w_dwobject_ancestor`gb_1 within w_dwo_groupbox
end type

type mle_1 from w_dwobject_ancestor`mle_1 within w_dwo_groupbox
integer x = 133
integer width = 1865
end type

type tab_1 from w_dwobject_ancestor`tab_1 within w_dwo_groupbox
end type

event tab_1::selectionchanged;call super::selectionchanged;choose case newindex
	case 1
		dw_1.dataobject = 'd_datawindow_groupbox'
	case 2
		dw_1.dataobject = 'd_datawindow_create'
		tab_1.tabpage_2.mle_2.text ='dw_1.Modify(~'create groupbox(band=detail text="Create"border="6" color="255" x="699" y="24" height="452" width="965"  name=gb_1 visible="1"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="553648127" )~')'
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
integer x = 69
integer y = 732
integer width = 891
integer height = 916
end type

type cb_get from w_dwobject_ancestor`cb_get within tabpage_1
integer height = 100
end type

type cb_set from w_dwobject_ancestor`cb_set within tabpage_1
integer height = 100
end type

type st_1 from w_dwobject_ancestor`st_1 within tabpage_1
integer y = 1584
end type

type lb_propparm from w_dwobject_ancestor`lb_propparm within tabpage_1
integer x = 1079
integer y = 732
integer width = 869
integer height = 816
end type

type sle_propparm from w_dwobject_ancestor`sle_propparm within tabpage_1
integer y = 1572
integer width = 590
end type

type tabpage_2 from w_dwobject_ancestor`tabpage_2 within tab_1
end type

type cb_4 from w_dwobject_ancestor`cb_4 within tabpage_2
end type

type cb_3 from w_dwobject_ancestor`cb_3 within tabpage_2
end type

event cb_3::clicked;call super::clicked;string ls_rtn


ls_rtn = dw_1.Modify('create groupbox(band=detail text="Create"border="6" color="255" x="699" y="24" height="452" width="965"  name=gb_1 visible="1"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="553648127" )')
                             
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

type cb_2 from w_dwobject_ancestor`cb_2 within w_dwo_groupbox
integer y = 2044
integer height = 100
end type

type gb_4 from w_dwobject_ancestor`gb_4 within w_dwo_groupbox
integer x = 82
integer width = 1970
end type

type dw_1 from w_dwobject_ancestor`dw_1 within w_dwo_groupbox
string dataobject = "d_datawindow_groupbox"
end type

type cb_1 from w_dwobject_ancestor`cb_1 within w_dwo_groupbox
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
		dw_1.dataobject ='d_datawindow_groupbox'
	CASE 2
		dw_1.dataobject ='d_datawindow_create' 
END CHOOSE

dw_1.insertrow(0)
mle_1.text = ''
end event

type gb_3 from groupbox within tabpage_1
integer x = 18
integer y = 672
integer width = 997
integer height = 1016
integer taborder = 50
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
integer x = 1038
integer y = 672
integer width = 955
integer height = 1016
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

