$PBExportHeader$w_postsend_function.srw
forward
global type w_postsend_function from window
end type
type cb_3 from commandbutton within w_postsend_function
end type
type dw_2 from datawindow within w_postsend_function
end type
type mle_2 from multilineedit within w_postsend_function
end type
type cb_4 from commandbutton within w_postsend_function
end type
type dw_1 from datawindow within w_postsend_function
end type
type cb_2 from commandbutton within w_postsend_function
end type
type cb_1 from commandbutton within w_postsend_function
end type
type lb_1 from listbox within w_postsend_function
end type
type gb_1 from groupbox within w_postsend_function
end type
type gb_2 from groupbox within w_postsend_function
end type
type gb_3 from groupbox within w_postsend_function
end type
type gb_4 from groupbox within w_postsend_function
end type
end forward

global type w_postsend_function from window
integer width = 2903
integer height = 1760
boolean titlebar = true
string title = "Send and Post Function"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
dw_2 dw_2
mle_2 mle_2
cb_4 cb_4
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
lb_1 lb_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_postsend_function w_postsend_function

type variables
integer ii_index
end variables

forward prototypes
public subroutine wf_arg_list (string as_function)
public subroutine wf_execute_script ()
public subroutine wf_init_data ()
public subroutine wf_output (datawindow ad_dw, string as_title, string as_text, boolean ab_flag)
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

mle_2.text =''
Choose case as_function 
	case 'Send'
		  mle_2.text = 'Send ( handle, message#, lowword, long )'
	case 'Post'
		  mle_2.text = 'Post ( handle, message#, word, long )'	
end choose
	

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
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
ulong ll_handle,ll_msg,ll_lowword,ll_long,ll_row,ll_rtn
string ls_fun 
boolean lb_rtn

ls_fun = lb_1.SelectedItem()
ll_row = dw_1.getrow()
ll_handle = dw_1.getitemnumber(ll_row,1)
ll_msg = dw_1.getitemnumber(ll_row,2)
ll_lowword = dw_1.getitemnumber(ll_row,3)
ll_long = dw_1.getitemnumber(ll_row,4)

Choose case ls_fun 
	case 'Send'		 
		  ll_rtn = send(ll_handle,ll_msg,ll_lowword,ll_long)
		  wf_output(dw_2,'Return value : ',string(ll_rtn),True)		  
		  mle_2.text = 'Send( '+string(ll_handle) +', '+string(ll_msg)+', '+string(ll_lowword)+', '+string(ll_long)  +' )' +'~r~n~r~n'
		  mle_2.text += 'Note:~r~n'+space(5)+dw_1.getitemstring(ll_row,5)
	case 'Post'
		  lb_rtn = post(ll_handle,ll_msg,ll_lowword,ll_long)
		  wf_output(dw_2,'Return value : ',string(lb_rtn),True)		  
		  mle_2.text = 'post( '+string(ll_handle) +', '+string(ll_msg)+', '+string(ll_lowword)+', '+string(ll_long)  +' )' +'~r~n~r~n'		  
		  mle_2.text += 'Note:~r~n'+space(5)+dw_1.getitemstring(ll_row,5)
	case ''		  
	     Messagebox('Warning','Please select testing file function.')
		  return
end choose
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

long ll_rowcount,ll_row

ll_rowcount = dw_1.rowcount()

FOR ll_row = 1 TO ll_rowcount
	dw_1.setitem(ll_row,1,handle(this))
	if ll_row = 2 then			
		dw_1.setitem(ll_row,4,handle(cb_3))
	end if		
NEXT

end subroutine

public subroutine wf_output (datawindow ad_dw, string as_title, string as_text, boolean ab_flag);//====================================================================
// Function: wf_output()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		datawindow 	   ad_dw
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
string ls_text
long ll_row
if ab_flag then
	ad_dw.reset()
	ii_index = 0 
end if
ll_row = ad_dw.insertrow(0)
ls_text = string(ii_index)+'.'+as_title  + as_text
ad_dw.setitem(ll_row,1,ls_text)
ii_index ++
end subroutine

on w_postsend_function.create
this.cb_3=create cb_3
this.dw_2=create dw_2
this.mle_2=create mle_2
this.cb_4=create cb_4
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.lb_1=create lb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.cb_3,&
this.dw_2,&
this.mle_2,&
this.cb_4,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.lb_1,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4}
end on

on w_postsend_function.destroy
destroy(this.cb_3)
destroy(this.dw_2)
destroy(this.mle_2)
destroy(this.cb_4)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.lb_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;This.X = 0
This.Y = 0
post wf_init_data()
end event

type cb_3 from commandbutton within w_postsend_function
integer x = 27
integer y = 1056
integer width = 631
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Message"
end type

event clicked;Messagebox('Hello','How are you ?')
end event

type dw_2 from datawindow within w_postsend_function
integer x = 69
integer y = 1232
integer width = 2715
integer height = 344
integer taborder = 50
boolean enabled = false
string title = "none"
string dataobject = "d_output_note"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_2 from multilineedit within w_postsend_function
integer x = 1998
integer y = 80
integer width = 791
integer height = 908
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_postsend_function
integer x = 2080
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
dw_2.reset()
//messagebox('','send')
end event

type dw_1 from datawindow within w_postsend_function
integer x = 759
integer y = 76
integer width = 1115
integer height = 916
integer taborder = 30
string title = "none"
string dataobject = "d_postsend_arg"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.object.datawindow.readonly = 'yes'
this.selectrow(1,true)
end event

event rowfocuschanged;this.selectrow(0,false)
this.selectrow(currentrow,true)
end event

type cb_2 from commandbutton within w_postsend_function
integer x = 1691
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

type cb_1 from commandbutton within w_postsend_function
integer x = 2469
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

type lb_1 from listbox within w_postsend_function
integer x = 59
integer y = 76
integer width = 567
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
string item[] = {"Send","Post"}
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_postsend_function
integer x = 18
integer y = 8
integer width = 654
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
string text = "Functions"
end type

type gb_2 from groupbox within w_postsend_function
integer x = 713
integer y = 8
integer width = 1207
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
string text = "Argument"
end type

type gb_3 from groupbox within w_postsend_function
integer x = 1957
integer y = 8
integer width = 873
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
string text = "Synax"
end type

type gb_4 from groupbox within w_postsend_function
integer x = 23
integer y = 1164
integer width = 2811
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

