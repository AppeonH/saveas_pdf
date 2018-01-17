$PBExportHeader$w_file_profile.srw
forward
global type w_file_profile from window
end type
type mle_2 from multilineedit within w_file_profile
end type
type cb_4 from commandbutton within w_file_profile
end type
type dw_1 from datawindow within w_file_profile
end type
type cb_2 from commandbutton within w_file_profile
end type
type mle_1 from multilineedit within w_file_profile
end type
type cb_1 from commandbutton within w_file_profile
end type
type lb_1 from listbox within w_file_profile
end type
type gb_1 from groupbox within w_file_profile
end type
type gb_2 from groupbox within w_file_profile
end type
type gb_3 from groupbox within w_file_profile
end type
type gb_4 from groupbox within w_file_profile
end type
end forward

global type w_file_profile from window
integer width = 2702
integer height = 1752
boolean titlebar = true
string title = "Profile Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_2 mle_2
cb_4 cb_4
dw_1 dw_1
cb_2 cb_2
mle_1 mle_1
cb_1 cb_1
lb_1 lb_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_file_profile w_file_profile

type variables
string is_CurrentDirectory
integer ii_index
n_resfile  lnv_file
end variables

forward prototypes
public subroutine wf_arg_list (string as_function)
public subroutine wf_output (multilineedit actl_mle, string as_title, string as_text, boolean ab_flag)
public subroutine wf_execute_script ()
public subroutine wf_initi_dw (string as_parm, datawindow ad_dw)
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

mle_1.text =''
CHOOSE CASE as_function 
	CASE 'SetProfileString'
		  mle_1.text = 'SetProfileString ( filename, section, key, value )'		
	CASE 'ProfileString'
		  mle_1.text = 'ProfileString ( filename, section, key, default )'		  
	CASE 'ProfileInt'
		  mle_1.text = 'ProfileInt ( filename, section, key, default )'
END CHOOSE

	

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

actl_mle.text += string(ii_index) +'.'+as_title  + as_text +'~r~n'

ii_index ++
end subroutine

public subroutine wf_execute_script ();//====================================================================
// Function: wf_execute_script()
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
//			  zhouchaoqun     Date:  2005-08-18
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_fun,ls_p1,ls_p2,ls_p3,ls_p4,ls_rtn
int li_rtn

dw_1.accepttext()
ls_p1 = dw_1.getitemstring(1,'col1')
ls_p2 = dw_1.getitemstring(1,'col2')
ls_p3 = dw_1.getitemstring(1,'col3')
ls_p4 = dw_1.getitemstring(1,'col4')
ls_fun = trim(lb_1.selecteditem())

Choose case ls_fun 
	case 'SetProfileString'				  				
	  li_rtn = SetProfileString(ls_p1, ls_p2, ls_p3, ls_p4)
	  IF ls_p4 ='' THEN ls_p4 = '~'~''	
	  wf_output(mle_1,ls_fun,'('+ls_p1+','+ls_p2+','+ls_p3+','+ls_p4+')',True)
	  wf_output(mle_1,'Return value : ',string(li_rtn),False)
	  wf_output(mle_1,'Profile file : ',ls_p1,False)		 
	case 'ProfileString'				  
	  ls_rtn = ProfileString(ls_p1, ls_p2, ls_p3,ls_p4)
	  IF ls_p4 ='' THEN ls_p4 = '~'~''
	  wf_output(mle_1,ls_fun,'('+ls_p1+','+ls_p2+','+ls_p3+','+ls_p4+')',True)
	  wf_output(mle_1,'Return value : ',ls_rtn,False)
	  wf_output(mle_1,'Profile file : ',ls_p1,False)		 
	case 'ProfileInt'					  
	  li_rtn = ProfileInt(ls_p1, ls_p2, ls_p3, integer(ls_p4))				  
	  IF not isnumber(ls_p4) THEN ls_p4 = '0' 
	  wf_output(mle_1,ls_fun,'('+ls_p1+','+ls_p2+','+ls_p3+','+ls_p4+')',True)				  
	  wf_output(mle_1,'Return value : ',string(li_rtn),False)
	  wf_output(mle_1,'Profile file : ',ls_p1,False)
	case ''
	  Messagebox('Warning','Please select testing profile function.')
	  return
end choose


end subroutine

public subroutine wf_initi_dw (string as_parm, datawindow ad_dw);//====================================================================
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

ad_dw.Setredraw(False)
CHOOSE CASE as_parm
	CASE 'ProfileString','ProfileInt'		
		ad_dw.modify("col4_t.text = 'Default :'")
	CASE 'SetProfileString'		
		ad_dw.modify("col4_t.text = 'Value :'")
END CHOOSE
ad_dw.setredraw(True)

wf_arg_list(as_parm)
end subroutine

on w_file_profile.create
this.mle_2=create mle_2
this.cb_4=create cb_4
this.dw_1=create dw_1
this.cb_2=create cb_2
this.mle_1=create mle_1
this.cb_1=create cb_1
this.lb_1=create lb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.mle_2,&
this.cb_4,&
this.dw_1,&
this.cb_2,&
this.mle_1,&
this.cb_1,&
this.lb_1,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4}
end on

on w_file_profile.destroy
destroy(this.mle_2)
destroy(this.cb_4)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.lb_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;x = 0
y = 0

mle_2.text = "[User Info]~r~nName =James Smith~r~nJobTitle =Window Washer~r~nUser ID =1002~r~nSecurity =9"

end event

type mle_2 from multilineedit within w_file_profile
integer x = 1797
integer y = 76
integer width = 791
integer height = 908
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_file_profile
integer x = 1874
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

type dw_1 from datawindow within w_file_profile
integer x = 878
integer y = 76
integer width = 795
integer height = 916
string title = "none"
string dataobject = "d_profile_format"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;
IF trim(lb_1.selecteditem()) ='ProfileInt' THEN
	CHOOSE CASE dwo.name
		CASE 'col3'
			IF not isnumber(this.getitemstring(row,'col4')) THEN
				this.setitem(row,'col4','0')
			END IF	
		CASE 'col4'
			IF not isnumber(data) THEN
				this.post setitem(row,'col4','0')
			END IF
	END CHOOSE		
END IF		

end event

type cb_2 from commandbutton within w_file_profile
integer x = 1486
integer y = 1056
integer width = 357
integer height = 108
integer taborder = 20
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

type mle_1 from multilineedit within w_file_profile
integer x = 59
integer y = 1228
integer width = 2537
integer height = 356
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

type cb_1 from commandbutton within w_file_profile
integer x = 2263
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

type lb_1 from listbox within w_file_profile
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
string item[] = {"SetProfileString","ProfileString","ProfileInt"}
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
	case 'SetProfileString'
		  	wf_initi_dw('SetProfileString',dw_1)
		   dw_1.setitem(1,"col3",'name')
			dw_1.setitem(1,"col4",'James Smith')
	case 'ProfileString'
			wf_initi_dw('ProfileString',dw_1)
			dw_1.setitem(1,"col3",'name')
			dw_1.setitem(1,"col4",'James Smith')
	case 'ProfileInt'
			wf_initi_dw('ProfileInt',dw_1)	
			dw_1.setitem(1,"col3",'Security')
			dw_1.setitem(1,"col4",'100')
end choose

end event

type gb_1 from groupbox within w_file_profile
integer x = 18
integer y = 8
integer width = 786
integer height = 1024
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profile Functions"
end type

type gb_2 from groupbox within w_file_profile
integer x = 837
integer y = 8
integer width = 882
integer height = 1024
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Argument~tDescription"
end type

type gb_3 from groupbox within w_file_profile
integer x = 1755
integer y = 8
integer width = 873
integer height = 1024
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profile File"
end type

type gb_4 from groupbox within w_file_profile
integer x = 23
integer y = 1164
integer width = 2610
integer height = 452
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

