$PBExportHeader$w_register_function.srw
forward
global type w_register_function from window
end type
type cb_4 from commandbutton within w_register_function
end type
type dw_1 from datawindow within w_register_function
end type
type cb_2 from commandbutton within w_register_function
end type
type mle_1 from multilineedit within w_register_function
end type
type cb_1 from commandbutton within w_register_function
end type
type lb_1 from listbox within w_register_function
end type
type gb_1 from groupbox within w_register_function
end type
type gb_2 from groupbox within w_register_function
end type
type gb_4 from groupbox within w_register_function
end type
end forward

global type w_register_function from window
integer width = 2702
integer height = 1752
boolean titlebar = true
string title = "Registration Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
dw_1 dw_1
cb_2 cb_2
mle_1 mle_1
cb_1 cb_1
lb_1 lb_1
gb_1 gb_1
gb_2 gb_2
gb_4 gb_4
end type
global w_register_function w_register_function

type variables
string is_CurrentDirectory ='HKEY_LOCAL_MACHINE\SOFTWARE\APPEON\Appeon Code Examples\ADT'
integer ii_index
end variables

forward prototypes
public subroutine wf_arg_list (string as_function)
public subroutine wf_initi_dw (string as_parm, string as_dwo, datawindow ad_dw)
public subroutine wf_output (multilineedit actl_mle, string as_title, string as_text, boolean ab_flag)
public subroutine wf_init_data ()
public subroutine wf_execute_script ()
end prototypes

public subroutine wf_arg_list (string as_function);//====================================================================
// Function: wf_arg_list()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_function
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_key

Choose case as_function
	case 'RegistryDelete'	
		  wf_init_data()
		  mle_1.text = 'RegistryDelete ( key, valuename )'		
		  dw_1.setitem(1,'col2','DEL')
	case 'RegistryValues'
		  mle_1.text = 'RegistryValues ( key, valuename )'
		  dw_1.setitem(1,'col2','valuearray')
	case 'RegistryGet'
		  mle_1.text = 'RegistryGet ( key, valuename, { valuetype }, valuevariable )'		  
	case 'RegistrySet'
		  mle_1.text = 'RegistrySet ( key, valuename, valuetype, value )'		  
end choose


end subroutine

public subroutine wf_initi_dw (string as_parm, string as_dwo, datawindow ad_dw);//====================================================================
// Function: wf_initi_dw()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_parm
//		string   as_dwo
//		datawindow ad_dw
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
ad_dw.setredraw(False)
ad_dw.dataobject = as_dwo
wf_arg_list(as_parm)
ad_dw.setredraw(True)
end subroutine

public subroutine wf_output (multilineedit actl_mle, string as_title, string as_text, boolean ab_flag);//====================================================================
// Function: wf_output()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		multilineedit 	actl_mle
//		string			as_title
//		string 			as_text
//		boolean			ab_flag
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
if ab_flag then
	actl_mle.text =''
	ii_index = 0 
end if

actl_mle.text += string(ii_index)+'.'+as_title  + as_text +'~r~n'

ii_index ++
end subroutine

public subroutine wf_init_data ();//====================================================================
// Function: wf_init_data()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

RegistrySet(is_CurrentDirectory,'DEL', RegString!, '11')


end subroutine

public subroutine wf_execute_script ();//====================================================================
// Function: wf_execute_script()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//			zhouchaoqun       Date: 2005/03/15
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_fun,ls_p1,ls_p2,ls_p3,ls_p4,ls_key,ls_value,ls_valuearray[],ls_temp[]
integer li_rtn,li,li_upper
RegistryValueType lrv
ulong lul_pl
blob lblb_plb
ls_fun = trim(lb_1.selecteditem())
dw_1.accepttext()

CHOOSE CASE ls_fun 
	CASE 'RegistryDelete'		   
		   ls_key = is_CurrentDirectory + '\Del'		   
			li_rtn = RegistryDelete ( is_CurrentDirectory, 'Del' )			
			wf_output(mle_1,'Syntax :','RegistryDelete ( '+is_CurrentDirectory+', ~'Del~' )',True)
			wf_output(mle_1,'Return Value :',string(li_rtn),False)
	CASE 'RegistryGet'
		 ls_p1 = dw_1.getitemstring(1,'col1')
		 ls_p2 = dw_1.getitemstring(1,'col2')
		 ls_p3 = dw_1.getitemstring(1,'col3')
		 ls_p4 = dw_1.getitemstring(1,'col4')
		 CHOOSE CASE ls_p3
			CASE 'RegString!'
				lrv = RegString!
				RegistrySet(is_CurrentDirectory,ls_p2,lrv,ls_p4)
				li_rtn = RegistryGet(is_CurrentDirectory, ls_p2, lrv, ls_value)
			CASE 'RegExpandString!'
				lrv = RegExpandString!
				RegistrySet(is_CurrentDirectory,ls_p2,lrv,ls_p4)
				li_rtn = RegistryGet(is_CurrentDirectory, ls_p2, lrv, ls_value)
//			CASE 'RegBinary!'
//				lrv = RegBinary!
//				lblb_plb = blob(ls_p4)
//				li_rtn = RegistryGet(is_CurrentDirectory, ls_p2, lrv, lblb_plb)
//				ls_value = string(lblb_plb)
			CASE 'ReguLong!'
				lrv = ReguLong!
				RegistrySet(is_CurrentDirectory,ls_p2,lrv,long(ls_p4))
				li_rtn = RegistryGet(is_CurrentDirectory, ls_p2, lrv, lul_pl)
				ls_value = string(lul_pl)
			CASE 'ReguLongBigEndian!'
				lrv = ReguLongBigEndian!
				RegistrySet(is_CurrentDirectory,ls_p2,lrv,long(ls_p4))
				li_rtn = RegistryGet(is_CurrentDirectory, ls_p2, lrv, lul_pl)
				ls_value = string(lul_pl)
//			CASE 'RegLink!'
//				lrv = RegLink!
//				li_rtn = RegistryGet(is_CurrentDirectory, ls_p2, lrv, ls_value)
//			CASE 'RegMultiString!'	
//				lrv = RegMultiString!		
//				ls_temp[1] = 'Appeon'
//				RegistrySet(is_CurrentDirectory,ls_p2,lrv,ls_temp)
//				li_rtn = RegistryGet(is_CurrentDirectory, ls_p2, lrv,ls_valuearray)					
//				ls_value = ls_valuearray[1]
		END CHOOSE		
   	 wf_output(mle_1,'Syntax :','RegistryGet( '+is_CurrentDirectory +','+ ls_p2+ ','+ls_p3+', value)',True)
		 wf_output(mle_1,'Return Value :',string(li_rtn),False)
		 if li_rtn = 1 then
		 	wf_output(mle_1,'value= ',+ls_value,False)	
		 else
			wf_output(mle_1,"value= ",+ '',False)	
		  end if
	CASE 'RegistrySet'		 
		 ls_p1 = dw_1.getitemstring(1,'col1')
		 ls_p2 = dw_1.getitemstring(1,'col2')
		 ls_p3 = dw_1.getitemstring(1,'col3')
		 ls_p4 = dw_1.getitemstring(1,'col4')
		 ls_value = ls_p4
		 CHOOSE CASE ls_p3
			CASE 'RegString!'
				lrv = RegString!
				li_rtn =  RegistrySet(is_CurrentDirectory,ls_p2,lrv, ls_value)
			CASE 'RegExpandString!'
				lrv = RegExpandString!
				li_rtn =  RegistrySet(is_CurrentDirectory,ls_p2,lrv, ls_value)
//			CASE 'RegBinary!'
//				lrv = RegBinary!
//				lblb_plb = blob(ls_p4)
//				li_rtn =  RegistrySet(is_CurrentDirectory,ls_p2,lrv, lblb_plb)
			CASE 'ReguLong!'
				lrv = ReguLong!
				lul_pl = long(ls_p4)
				li_rtn =  RegistrySet(is_CurrentDirectory,ls_p2,lrv, lul_pl)
			CASE 'ReguLongBigEndian!'
				lrv = ReguLongBigEndian!
				lul_pl = long(ls_p4)
				li_rtn =  RegistrySet(is_CurrentDirectory,ls_p2,lrv, lul_pl)
//			CASE 'RegLink!'
//				lrv = RegLink!
//				li_rtn =  RegistrySet(is_CurrentDirectory,ls_p2,lrv, ls_value)
//			CASE 'RegMultiString!'	
//				lrv = RegMultiString!
//				ls_valuearray[1] = ls_p4
//				li_rtn =  RegistrySet(is_CurrentDirectory,ls_p2,lrv, ls_valuearray)
		END CHOOSE		
		wf_output(mle_1,'Syntax :','RegistrySet( '+is_CurrentDirectory+','+ls_p2+','+ls_p3+', value)',True)
		wf_output(mle_1,'Return Value :',string(li_rtn),False)		
		wf_output(mle_1,'value = ',ls_value,False)
				
	CASE 'RegistryValues'
		 ls_p1 = 'HKEY_LOCAL_MACHINE\SOFTWARE\APPEON\Appeon Code Examples'
		 li_rtn = RegistryValues(is_CurrentDirectory,ls_valuearray)
		 wf_output(mle_1,'Syntax :','RegistryValues( '+is_CurrentDirectory+',valuearray)',True)
		 wf_output(mle_1,'Return Value :',string(li_rtn),False)
		 li_upper = UpperBound(ls_valuearray)
		 for li = 1 to li_upper
		     wf_output(mle_1,'valuearray['+string(li)+'] = ',ls_valuearray[li],False)
		 next
	CASE ''		  
	     Messagebox('Warning','Please select testing registration function.')
		  return
END CHOOSE
end subroutine

on w_register_function.create
this.cb_4=create cb_4
this.dw_1=create dw_1
this.cb_2=create cb_2
this.mle_1=create mle_1
this.cb_1=create cb_1
this.lb_1=create lb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_4=create gb_4
this.Control[]={this.cb_4,&
this.dw_1,&
this.cb_2,&
this.mle_1,&
this.cb_1,&
this.lb_1,&
this.gb_1,&
this.gb_2,&
this.gb_4}
end on

on w_register_function.destroy
destroy(this.cb_4)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.lb_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_4)
end on

event open;x = 0
y = 0
end event

type cb_4 from commandbutton within w_register_function
integer x = 1874
integer y = 1056
integer width = 357
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear &All"
end type

event clicked;//====================================================================
// Event: cllicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Event ID
//		pbm_bnclicked
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
mle_1.text =''
end event

type dw_1 from datawindow within w_register_function
integer x = 878
integer y = 76
integer width = 1714
integer height = 916
integer taborder = 30
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;
choose case dwo.name
	case 'col3'
		choose case data
			case 'RegString!','RegExpandString!'
				dw_1.setitem(1,"col4",'Appeon')				
			case 'ReguLong!','ReguLongBigEndian!'
				dw_1.setitem(1,"col4",'1000')				
		end choose
end choose
end event

type cb_2 from commandbutton within w_register_function
integer x = 1486
integer y = 1056
integer width = 357
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Execute"
end type

event clicked;//====================================================================
// Event: cllicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Event ID
//		pbm_bnclicked
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
wf_execute_script()
end event

type mle_1 from multilineedit within w_register_function
integer x = 59
integer y = 1228
integer width = 2537
integer height = 356
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_register_function
integer x = 2263
integer y = 1056
integer width = 357
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;//====================================================================
// Event: cllicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Event ID
//		pbm_bnclicked
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
Close(Parent)
end event

type lb_1 from listbox within w_register_function
integer x = 59
integer y = 76
integer width = 699
integer height = 916
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
string item[] = {"RegistryDelete","RegistrySet","RegistryGet","RegistryValues"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Event ID
//		pbm_lbnselchange
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

Choose case this.text(index) 
	case 'RegistryDelete'
		  	wf_initi_dw(this.text(index),'d_register_p1',dw_1)			 
	case 'RegistryValues'
			wf_initi_dw(this.text(index),'d_register_p1',dw_1)				
	case 'RegistryGet'				
			wf_initi_dw(this.text(index),'d_register_p2',dw_1)					
	case 'RegistrySet'
		   wf_initi_dw(this.text(index),'d_register_p2',dw_1)				
end choose


end event

type gb_1 from groupbox within w_register_function
integer x = 18
integer y = 8
integer width = 786
integer height = 1024
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "File Functions"
end type

type gb_2 from groupbox within w_register_function
integer x = 837
integer y = 8
integer width = 1797
integer height = 1024
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Argument Description"
end type

type gb_4 from groupbox within w_register_function
integer x = 23
integer y = 1164
integer width = 2610
integer height = 452
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "OutPut"
end type

