$PBExportHeader$w_ocx_new.srw
forward
global type w_ocx_new from w_standard_ancestor2
end type
type ocx_test from olecustomcontrol within w_ocx_new
end type
end forward

global type w_ocx_new from w_standard_ancestor2
integer width = 2734
integer height = 1924
string title = "OCX Control"
ocx_test ocx_test
end type
global w_ocx_new w_ocx_new

type variables
n_util	inv_util

string is_path
boolean ib_clear = True
end variables

on w_ocx_new.create
int iCurrent
call super::create
this.ocx_test=create ocx_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ocx_test
end on

on w_ocx_new.destroy
call super::destroy
destroy(this.ocx_test)
end on

event ue_open;call super::ue_open;ocx_test.object.text = 'OCX'

is_prop_data = "Text,Alignment,Enabled"
is_fuction_data = "SetText,SetTextAlignment,SetEnable"
end event

type tab_1 from w_standard_ancestor2`tab_1 within w_ocx_new
integer x = 5
integer y = 668
integer width = 2661
integer height = 928
end type

type tabpage_1 from w_standard_ancestor2`tabpage_1 within tab_1
integer width = 2624
integer height = 812
end type

type cb_get from w_standard_ancestor2`cb_get within tabpage_1
end type

event cb_get::clicked;call super::clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/04/13
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_Return

If lb_prop.SelectedIndex() < 0 Then	
	MessageBox('Warning','Please select testing property.')
	Return
End If

Choose Case lb_prop.SelectedItem()	
	Case 'Text'
		ls_Return = String(ocx_test.object.Text)		
	Case 'Alignment'
		ls_Return = String(ocx_test.object.Alignment)			
	Case 'Enabled'
		ls_Return = string(ocx_test.object.Enabled)
	Case 'Visible'
		ls_Return = String(ocx_test.object.Visible)			
End Choose

//ls_Return = inv_util.of_convert_to_upper(ls_Return)
st_tip.Text = "The OCX's " + lb_prop.SelectedItem() + " property is " + ls_Return + "."



end event

type cb_set from w_standard_ancestor2`cb_set within tabpage_1
end type

event cb_set::clicked;call super::clicked;//====================================================================
// Event: 		clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 	(none)
//--------------------------------------------------------------------
// Returns: 	long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 		zhouchaoqun		Date: 2005/04/13
//--------------------------------------------------------------------
// CopyRight 	2003----???? Appeon Inc.
//====================================================================
String ls_Param,ls_Return

ls_Param = Trim(sle_propparm.Text)
If lb_prop.SelectedIndex() < 0 Then	
	MessageBox('Warning','Please select testing property.')
	Return
End If

If ls_Param = '' Then	
	MessageBox('Warning','Please select testing data.')
	Return
End If

Choose Case lb_prop.SelectedItem()
	Case 'Text'		
		ocx_test.object.text = ls_Param		
		ls_Return = ocx_test.object.text
	case 'Alignment'
		ocx_test.object.Alignment = integer(LeftA(ls_Param,1))
		ls_Return = String(ocx_test.object.Alignment)
	Case 'Enabled'
		choose case ls_param
			case 'False'
				ocx_test.object.Enabled = False
			case 'True'
				ocx_test.object.Enabled = True
		end choose
		ls_Return = String(ocx_test.object.Enabled)
	Case 'Visible'
		choose case ls_param
			case 'False'
				ocx_test.Visible = False
			case 'True'
				ocx_test.Visible = True
		end choose	
		ls_Return = String(ocx_test.object.Visible)
End Choose

st_tip.Text = "The OCX's " + lb_prop.SelectedItem() + " property is set to " + ls_Return + "."


end event

type st_1 from w_standard_ancestor2`st_1 within tabpage_1
end type

type lb_propparm from w_standard_ancestor2`lb_propparm within tabpage_1
end type

type lb_prop from w_standard_ancestor2`lb_prop within tabpage_1
end type

event lb_prop::selectionchanged;call super::selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/04/13
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_propparm.Reset()
sle_propparm.text = ''

cb_get.enabled = True
choose case lb_prop.selecteditem()
	case 'Text'
		lb_propparm.additem('OCX Control!')
		lb_propparm.additem('OCX Text')		
	case 'Alignment'
		lb_propparm.additem('0 Left')
		lb_propparm.additem('1 Center')
		lb_propparm.additem('2 Right')
	case 'Enabled'
		lb_propparm.additem('True')
		lb_propparm.additem('False')
	case 'Visible'
		lb_propparm.additem('True')
		lb_propparm.additem('False')	   
end choose

end event

type sle_propparm from w_standard_ancestor2`sle_propparm within tabpage_1
end type

type tabpage_2 from w_standard_ancestor2`tabpage_2 within tab_1
integer width = 2624
integer height = 812
end type

type cb_execute from w_standard_ancestor2`cb_execute within tabpage_2
end type

event cb_execute::clicked;call super::clicked;//====================================================================
// Event: 		clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: 	long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 		zhouchaoqun		Date: 2005/04/13
//--------------------------------------------------------------------
// CopyRight 	2003----???? Appeon Inc.
//====================================================================
String ls_Return, ls_Param
int li_rtn

ls_Param = Trim(sle_functionparm.Text)
If lb_function.SelectedIndex() < 0 Then	
	MessageBox('Warning','Please select testing function.')
	Return
End If

If ls_Param = '' And lb_functionparm.TotalItems() > 0  Then	
	MessageBox('Warning','Please select testing data.')
	Return
End If

choose case lb_function.selecteditem()
	case 'SetText'	
		ls_return = String(ocx_test.object.SetText(ls_Param))
	case 'SetTextAlignment'	
		ls_return = String(ocx_test.object.SetTextAlignment(integer(LeftA(ls_Param,1))))		
	case 'SetEnable'
		choose case ls_Param
			case 'True'
				ls_return = String(ocx_test.object.SetEnable(True))
			case 'False'
				ls_return = String(ocx_test.object.SetEnable(False))
		end choose
end choose		

st_tip.Text =  "Function "+lb_function.SelectedItem()+" is executed. The return value is " + ls_Return + "."
end event

type sle_functionparm from w_standard_ancestor2`sle_functionparm within tabpage_2
end type

type st_2 from w_standard_ancestor2`st_2 within tabpage_2
end type

type lb_function from w_standard_ancestor2`lb_function within tabpage_2
end type

event lb_function::selectionchanged;call super::selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	integer	index		
//--------------------------------------------------------------------
// Returns: long [pbm_lbnselchange]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/04/13
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

lb_functionparm.Reset()
sle_functionparm.text = ''

choose case lb_function.selecteditem()
	case 'SetText'
		 lb_functionparm.additem('OCX Control')
		 lb_functionparm.additem('OCX Text')
	case 'SetTextAlignment'
		 lb_functionparm.additem('0 Left')
		 lb_functionparm.additem('1 Center')
		 lb_functionparm.additem('2 Right')
	case 'SetEnable'	
		lb_functionparm.additem('True')
		lb_functionparm.additem('False')	
end choose		














end event

type lb_functionparm from w_standard_ancestor2`lb_functionparm within tabpage_2
end type

type tabpage_3 from w_standard_ancestor2`tabpage_3 within tab_1
integer width = 2624
integer height = 812
end type

type cb_4 from w_standard_ancestor2`cb_4 within tabpage_3
end type

type cb_3 from w_standard_ancestor2`cb_3 within tabpage_3
end type

type lb_out from w_standard_ancestor2`lb_out within tabpage_3
end type

type cb_2 from w_standard_ancestor2`cb_2 within w_ocx_new
integer x = 2304
integer y = 1656
end type

type cb_1 from w_standard_ancestor2`cb_1 within w_ocx_new
integer x = 1883
integer y = 256
end type

event cb_1::clicked;call super::clicked;ocx_test.object.text = 'OCX Control'
ocx_test.object.Enabled = True
ocx_test.object.Alignment = 1
ocx_test.visible = True

tab_1.tabpage_3.lb_out.reset()
end event

type st_tip from w_standard_ancestor2`st_tip within w_ocx_new
integer x = 50
integer y = 1660
integer width = 2194
integer height = 124
end type

type gb_4 from w_standard_ancestor2`gb_4 within w_ocx_new
integer x = 14
integer y = 1612
integer width = 2258
integer height = 192
end type

type gb_1 from w_standard_ancestor2`gb_1 within w_ocx_new
integer x = 37
integer y = 0
integer width = 2633
integer height = 656
end type

type ocx_test from olecustomcontrol within w_ocx_new
event onclicked ( )
event onrightclicked ( )
event ondoubleclicked ( )
event onmousemove ( long xpos,  long ypos )
integer x = 366
integer y = 200
integer width = 901
integer height = 200
integer taborder = 40
boolean bringtotop = true
boolean border = false
boolean focusrectangle = false
string binarykey = "w_ocx_new.win"
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event onclicked();//====================================================================
// Event:     onclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: [none]
//--------------------------------------------------------------------
// Returns:   [None]
//--------------------------------------------------------------------
// Author: 	  zhouchaoqun		Date: 2005/04/13
//--------------------------------------------------------------------
// CopyRight  2004----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ocx's onclicked Event"
tab_1.tabpage_3.lb_out.additem(ls_item)

end event

event onrightclicked();//====================================================================
// Event:     onrightclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: [none]
//--------------------------------------------------------------------
// Returns:   [None]
//--------------------------------------------------------------------
// Author: 	  zhouchaoqun		Date: 2005/04/13
//--------------------------------------------------------------------
// CopyRight  2004----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ocx's onrightclicked Event"
tab_1.tabpage_3.lb_out.additem(ls_item)

end event

event ondoubleclicked();//====================================================================
// Event:     ondoubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: [none]
//--------------------------------------------------------------------
// Returns:   [None]
//--------------------------------------------------------------------
// Author: 	  zhouchaoqun		Date: 2005/04/13
//--------------------------------------------------------------------
// CopyRight  2004----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ocx's ondoubleclicked Event"
tab_1.tabpage_3.lb_out.additem(ls_item)

end event

event onmousemove(long xpos, long ypos);//====================================================================
// Event:     onmousemove()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: Long  Xpos
//				  Long  Ypos
//--------------------------------------------------------------------
// Returns:   [None]
//--------------------------------------------------------------------
// Author: 	  zhouchaoqun		Date: 2005/04/13
//--------------------------------------------------------------------
// CopyRight  2004----???? Appeon Inc.
//====================================================================

string ls_item
ls_item=string(tab_1.tabpage_3.lb_out.totalitems()+1,'000')+':'+"ocx's onmousemove Event"
tab_1.tabpage_3.lb_out.additem(ls_item)

end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
00w_ocx_new.bin 
2D00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000ddc325e001c5447a00000003000003000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000024e00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000030bc3e1f24f0933a5add068b94eafbd1400000000ddc325e001c5447addc325e001c5447a000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000a0000004200000000000000010000000200000003000000040000000500000006000000070000000800000009fffffffe0000000bfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
23ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe000200050bc3e1f24f0933a5add068b94eafbd1400000001fb8f0821101b01640008ed8413c72e2b000000300000021e0000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c00000000000001b00000000300010000000000030000145c000000030000052b000000030000005d0000001e000000040058434f0000004b000001390000fffe000100050be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c0000000700000000000000010001030000000c0074735f00706b636f73706f72000101000000090078655f00746e65740102007800090000655f00006e65747805007974050000016600000000746e6f000001040000000574786574000100000000090065765f006f697372006c006e006e006f002000670070005b006d00620064005f00650064007800650063006500740075005d006500720000006d0065000100000000145c0000052b0000005d58434f030000000000ffffffe3520300ce8f910b00e39d11b84b00aa00000151c0019000040001d4766c6548000000010020ffff0070005b006d00620064005f006500640064006100690076006500730000005d00650072006f006d00650074006f0068006c0074006e00690073006b006f00740020007000200028002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620064005f00650064006e00750064006100690076006500730000005d00650072006f006d006500740065007200750071007300650020007400200028002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620064005f00650064006500720075007100730065005d0074000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10w_ocx_new.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
