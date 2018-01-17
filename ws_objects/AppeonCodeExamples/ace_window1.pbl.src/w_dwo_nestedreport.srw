$PBExportHeader$w_dwo_nestedreport.srw
forward
global type w_dwo_nestedreport from w_dwobject_ancestor
end type
type cb_5 from commandbutton within tabpage_1
end type
type gb_3 from groupbox within tabpage_1
end type
type gb_5 from groupbox within tabpage_1
end type
end forward

global type w_dwo_nestedreport from w_dwobject_ancestor
string title = "Nested Report Object"
end type
global w_dwo_nestedreport w_dwo_nestedreport

on w_dwo_nestedreport.create
int iCurrent
call super::create
end on

on w_dwo_nestedreport.destroy
call super::destroy
end on

event ue_initialize;call super::ue_initialize;is_obj_name = 'dw_1' 
end event

type gb_1 from w_dwobject_ancestor`gb_1 within w_dwo_nestedreport
end type

type mle_1 from w_dwobject_ancestor`mle_1 within w_dwo_nestedreport
integer x = 123
integer width = 1883
end type

type tab_1 from w_dwobject_ancestor`tab_1 within w_dwo_nestedreport
end type

event tab_1::selectionchanged;call super::selectionchanged;choose case newindex
	case 1
		dw_1.dataobject = 'd_datawindow_nested'
		dw_1.settransobject(sqlca)
		dw_1.retrieve()
	case 2
		dw_1.dataobject = 'd_datawindow_nested_create'
		tab_1.tabpage_2.mle_2.text ='dw_1.Modify(~'create report(band=detail dataobject="d_dwo_nested_chg" x="407" y="4" height="72" width="1170" border="2"  height.autosize=yes criteria="" nest_arguments=((" string(dept_id) ")) trail_footer = yes  name=dw_1 visible="1"  slideup=directlyabove )~')'
end choose

mle_1.text =''
end event

on tab_1.create
call super::create
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
call super::destroy
end on

type tabpage_1 from w_dwobject_ancestor`tabpage_1 within tab_1
cb_5 cb_5
gb_3 gb_3
gb_5 gb_5
end type

on tabpage_1.create
this.cb_5=create cb_5
this.gb_3=create gb_3
this.gb_5=create gb_5
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_5
this.Control[iCurrent+2]=this.gb_3
this.Control[iCurrent+3]=this.gb_5
end on

on tabpage_1.destroy
call super::destroy
destroy(this.cb_5)
destroy(this.gb_3)
destroy(this.gb_5)
end on

type dw_2 from w_dwobject_ancestor`dw_2 within tabpage_1
integer x = 64
integer y = 740
integer width = 887
integer height = 916
end type

type cb_get from w_dwobject_ancestor`cb_get within tabpage_1
integer height = 100
end type

type cb_set from w_dwobject_ancestor`cb_set within tabpage_1
integer height = 100
end type

event cb_set::clicked;string ls_prop,ls_Param,ls_rtn
long ll_row

ll_row = dw_2.getrow()
If ll_row <= 0 Then	
	MessageBox('Warning','Please select testing property.')
	Return
End If 

ls_prop = lower(dw_2.object.data[ll_row,2])
ls_Param = Trim(sle_propparm.Text)
If ls_Param = '' or LenA(ls_param) <0 Then	
	MessageBox('Warning','Please select testing data.')
	Return
End If

CHOOSE CASE ls_prop
	    CASE 'criteria'
			ls_rtn = dw_1.modify("dw_1.Criteria= '"+ls_Param+"'")
			dw_1.retrieve()
			cb_get.postevent(clicked!)
		 CASE 'nest_arguments'			
			ls_rtn = dw_1.Modify("dw_1.Nest_Arguments= ((~"~'"+ls_Param+"~'~"))") 
			dw_1.retrieve()
			cb_get.postevent(clicked!)
		 CASE 'dataobject'
			ls_rtn =dw_1.Modify("dw_1.DataObject='"+ls_Param+"'")
			dw_1.retrieve()
			cb_get.postevent(clicked!)
		 CASE ELSE
		 	  Super::EVENT Clicked()
END CHOOSE
IF LenA(LS_RTN) > 0 THEN
	MESSAGEBOX('Warnning',ls_rtn)
END IF

end event

type st_1 from w_dwobject_ancestor`st_1 within tabpage_1
integer x = 1042
integer y = 1580
end type

type lb_propparm from w_dwobject_ancestor`lb_propparm within tabpage_1
integer x = 1051
integer y = 740
integer width = 905
integer height = 808
end type

type sle_propparm from w_dwobject_ancestor`sle_propparm within tabpage_1
integer x = 1307
integer y = 1572
integer width = 645
end type

type tabpage_2 from w_dwobject_ancestor`tabpage_2 within tab_1
end type

type cb_4 from w_dwobject_ancestor`cb_4 within tabpage_2
end type

type cb_3 from w_dwobject_ancestor`cb_3 within tabpage_2
end type

event cb_3::clicked;call super::clicked;string ls_rtn

dw_1.dataobject ='d_datawindow_nested_create'
ls_rtn = dw_1.Modify('create report(band=detail dataobject="d_dwo_nested_chg" x="407" y="4" height="72" width="1170" border="2"  height.autosize=yes criteria="" nest_arguments=((" string(dept_id) ")) trail_footer = yes  name=dw_1 visible="1"  slideup=directlyabove )')

dw_1.settransobject(sqlca)
dw_1.retrieve()

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

type cb_2 from w_dwobject_ancestor`cb_2 within w_dwo_nestedreport
integer x = 2103
integer y = 2048
integer height = 100
end type

type gb_4 from w_dwobject_ancestor`gb_4 within w_dwo_nestedreport
integer x = 78
integer width = 1975
end type

type dw_1 from w_dwobject_ancestor`dw_1 within w_dwo_nestedreport
string dataobject = "d_datawindow_nested"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = false
end type

type cb_1 from w_dwobject_ancestor`cb_1 within w_dwo_nestedreport
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
		dw_1.dataobject ='d_datawindow_nested'
		dw_1.settransobject(sqlca)
		dw_1.retrieve()
	CASE 2
		dw_1.dataobject ='d_datawindow_nested_create' 
END CHOOSE

mle_1.text = ''
end event

type cb_5 from commandbutton within tabpage_1
integer x = 2071
integer y = 1088
integer width = 293
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "saveas"
end type

event clicked;dw_1.saveas( )
end event

type gb_3 from groupbox within tabpage_1
integer x = 18
integer y = 676
integer width = 974
integer height = 1012
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
integer x = 1015
integer y = 688
integer width = 978
integer height = 1000
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

