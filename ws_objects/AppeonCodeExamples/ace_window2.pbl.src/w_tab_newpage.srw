$PBExportHeader$w_tab_newpage.srw
$PBExportComments$OpenUserObject,OpenUserObjectWithParm,CloseUserObject Function test.
forward
global type w_tab_newpage from window
end type
type st_1 from statictext within w_tab_newpage
end type
type tab_1 from tab within w_tab_newpage
end type
type tabpage_1 from userobject within tab_1
end type
type mle_1 from multilineedit within tabpage_1
end type
type tabpage_1 from userobject within tab_1
mle_1 mle_1
end type
type tab_1 from tab within w_tab_newpage
tabpage_1 tabpage_1
end type
type lb_1 from listbox within w_tab_newpage
end type
type sle_1 from singlelineedit within w_tab_newpage
end type
type cb_4 from commandbutton within w_tab_newpage
end type
type cb_3 from commandbutton within w_tab_newpage
end type
type cb_2 from commandbutton within w_tab_newpage
end type
type cb_1 from commandbutton within w_tab_newpage
end type
type gb_1 from groupbox within w_tab_newpage
end type
type gb_2 from groupbox within w_tab_newpage
end type
end forward

global type w_tab_newpage from window
integer width = 2368
integer height = 1564
boolean titlebar = true
string title = "Dynamic Create Tabpage"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
tab_1 tab_1
lb_1 lb_1
sle_1 sle_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
gb_2 gb_2
end type
global w_tab_newpage w_tab_newpage

type variables
UserObject u_to_open


end variables

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: Dynamic create tabpage
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	xunengli		Date: 2004/11/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================


this.x = 0
this.y = 0

lb_1.SelectItem (1)


end event

on w_tab_newpage.create
this.st_1=create st_1
this.tab_1=create tab_1
this.lb_1=create lb_1
this.sle_1=create sle_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_1,&
this.tab_1,&
this.lb_1,&
this.sle_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.gb_1,&
this.gb_2}
end on

on w_tab_newpage.destroy
destroy(this.st_1)
destroy(this.tab_1)
destroy(this.lb_1)
destroy(this.sle_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type st_1 from statictext within w_tab_newpage
integer x = 1051
integer y = 112
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "Parameter :"
boolean focusrectangle = false
end type

type tab_1 from tab within w_tab_newpage
integer x = 32
integer y = 384
integer width = 2272
integer height = 1060
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2235
integer height = 944
long backcolor = 67108864
string text = "tabpage1"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
mle_1 mle_1
end type

on tabpage_1.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on tabpage_1.destroy
destroy(this.mle_1)
end on

event constructor;string ls_param

ls_param = message.stringparm

if LenA(ls_param) > 0 then
    mle_1.text = ls_param
end if
end event

type mle_1 from multilineedit within tabpage_1
integer x = 27
integer y = 36
integer width = 2167
integer height = 876
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "Opens the specified user object as a tab page, making its properties available to scripts."
borderstyle borderstyle = stylelowered!
end type

type lb_1 from listbox within w_tab_newpage
integer x = 82
integer y = 72
integer width = 855
integer height = 276
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string item[] = {"tab_1.tabpage_1","uo_tabpage_single","uo_tabpage_dw"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case index
	case 2
		st_1.text = 'Emp Id >= :'
	case else
		st_1.text = 'Parameter :'
end choose
end event

type sle_1 from singlelineedit within w_tab_newpage
integer x = 1047
integer y = 208
integer width = 562
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_tab_newpage
integer x = 1737
integer y = 204
integer width = 530
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "CloseTab~t"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author:xunengli	 		Date: 2004/11/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
integer li_index

li_index = UpperBound(tab_1.control)
tab_1.CloseTab (tab_1.control[li_index])

li_index = UpperBound(tab_1.control)
tab_1.SelectTab(li_index)

end event

type cb_3 from commandbutton within w_tab_newpage
integer x = 1737
integer y = 112
integer width = 530
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OpenTabWithParm~t"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/11/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_uotype,ls_param
integer li_index

ls_uotype = lb_1.selecteditem()
ls_param = trim(sle_1.text)

choose case ls_uotype
	case 'tab_1.tabpage_1'
		  tab_1.OpenTabWithParm(tab_1.tabpage_1,ls_param, 0)
	case else
		  tab_1.OpenTabWithParm(u_to_open,ls_param, ls_uotype, 0)
end choose
li_index = UpperBound(tab_1.control)
tab_1.control[li_index].text = 'tabpage'+string(li_index)
tab_1.SelectTab(li_index)
end event

type cb_2 from commandbutton within w_tab_newpage
integer x = 1737
integer y = 20
integer width = 530
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OpenTab~t"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author:xunengli	 		Date: 2004/11/06
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string s_u_name
long ll_pages
s_u_name = lb_1.selecteditem( )
choose case s_u_name
	case 'tab_1.tabpage_1'
		   tab_1.OpenTab(tab_1.tabpage_1, 0)
	case else
			tab_1.OpenTab(u_to_open, s_u_name, 0)
	end choose
	
ll_pages = upperbound(tab_1.Control)	
tab_1.control[ll_pages].text	='tabpage'+string(ll_pages)
tab_1.SelectTab(ll_pages)
end event

type cb_1 from commandbutton within w_tab_newpage
integer x = 1737
integer y = 296
integer width = 530
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close(Parent)
end event

type gb_1 from groupbox within w_tab_newpage
integer x = 37
integer y = 8
integer width = 942
integer height = 376
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "TabPage"
end type

type gb_2 from groupbox within w_tab_newpage
integer x = 992
integer y = 8
integer width = 681
integer height = 376
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operation"
end type

