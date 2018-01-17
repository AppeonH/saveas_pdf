$PBExportHeader$w_main_frame.srw
$PBExportComments$Main Window
forward
global type w_main_frame from window
end type
type mdi_1 from mdiclient within w_main_frame
end type
type p_scroll from picture within w_main_frame
end type
type ddplb_state from dropdownpicturelistbox within w_main_frame
end type
type dw_group from datawindow within w_main_frame
end type
type dw_examples from datawindow within w_main_frame
end type
type tv_examples from treeview within w_main_frame
end type
type st_vertical from statictext within w_main_frame
end type
end forward

global type w_main_frame from window
integer width = 2533
integer height = 2056
boolean titlebar = true
string title = "Appeon Code Examples"
string menuname = "m_mdi"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
integer toolbarheight = 500
boolean center = true
event ue_resizemdi ( )
event ue_shownew ( boolean ab_onlyshownew )
event ue_run ( long al_exampleid )
event ue_showpanel ( boolean ab_show )
event ue_arrangesheet ( integer as_type )
event ue_postopen ( )
mdi_1 mdi_1
p_scroll p_scroll
ddplb_state ddplb_state
dw_group dw_group
dw_examples dw_examples
tv_examples tv_examples
st_vertical st_vertical
end type
global w_main_frame w_main_frame

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: define instance variables.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String	is_Filter ,is_OnlyNew = " And (1 = 1)"

Long il_root,il_LastID



end variables

forward prototypes
public function boolean of_separatestr (string as_source, ref string as_string1, ref string as_string2)
public function boolean of_getwindowcount (string as_category)
public subroutine of_showscroll_pic (boolean ab_switch)
public subroutine of_setmenuvisible ()
public function integer of_findexample (string as_tag)
end prototypes

event ue_resizemdi();//====================================================================
// Event: ue_resizemdi()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 zhouchaoqun		Date: 2006/05/09
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
window  lw_win
string   ls_winname
boolean  lb_flag = False

lw_win = GetActiveSheet()
if isvalid(lw_win) then
	ls_winname = lw_win.classname()
	if ls_winname = 'w_menu_cascading' or ls_winname = 'w_menu_functions' then
		lb_flag = true
	end if
end if

If	tv_examples.Visible Then		
	if lb_flag then
		//modify by zhoujunwei at 20121227
		//<modification reason> mdi doesn't need to resize in the mobile
		If upper(AppeonGetClientType()) <> 'MOBILE' then
			ddplb_state.y = 220
			tv_examples.Height = mdi_1.Height - 220 - ddplb_state.height
		ELse
			tv_examples.Height = mdi_1.Height - 108 - ddplb_state.height
		End If
		//end modify
		ddplb_state.x = tv_examples.x
		tv_examples.Y = ddplb_state.Y + 108
	else
		//modify by zhoujunwei at 20121227
		//<modification reason> mdi doesn't need to resize in the mobile
		If upper(AppeonGetClientType()) <> 'MOBILE' then
			ddplb_state.y = 110
			tv_examples.Height = mdi_1.Height - 110
		Else
			tv_examples.Height = mdi_1.Height - 108
		End If
		//end modify
		ddplb_state.x = tv_examples.x
		tv_examples.Y = ddplb_state.Y + 108
	end if
	
	mdi_1.Height =  This.WorkSpaceHeight() - 75
	mdi_1.Width = This.WorkSpaceWidth() - tv_examples.Width - 50
	
	
	st_vertical.y=ddplb_state.y
	st_vertical.height = mdi_1.Height 
	st_vertical.x = tv_examples.x+tv_examples.width+4
	st_vertical.show()
	
	mdi_1.Y = ddplb_state.Y 
	mdi_1.X = st_vertical.X + st_vertical.Width 

Else
	mdi_1.X = ddplb_state.X
	mdi_1.Y = ddplb_state.Y
	mdi_1.Width = This.WorkSpaceWidth() - 10
	mdi_1.Height =  This.WorkSpaceHeight() - 75
End If

end event

event ue_shownew(boolean ab_onlyshownew);//====================================================================
// Event: ue_shownew()
//--------------------------------------------------------------------
// Description: reset categories
//--------------------------------------------------------------------
// Arguments: 
//		boolean	ab_onlyshownew		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
If ab_onlyshownew Then
	is_OnlyNew = " And (isnew = '1')"
Else
	is_OnlyNew = " And (1 = 1)"
End If

tv_examples.Event ue_reset_categories()

//Set menu visible
f_show_new(ab_onlyshownew)
of_setmenuvisible()

end event

event ue_run(long al_exampleid);//====================================================================
// Event: ue_run()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	al_exampleid		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long  ll_Current,ll_Find
String  ls_WinName
treeviewitem ltvi
window    lw_new,lw_sheet

If al_exampleid < 1 Or IsNull(al_exampleid) Then
	ll_Current = tv_examples.FindItem(currenttreeitem!,0)
	If ll_Current <= 0 Then Return
	If tv_examples.GetItem(ll_Current,ltvi) > 0 Then
		If ltvi.Children Then Return
		al_exampleid = Long(ltvi.Data)
	End If
	If al_exampleid < 1 Or IsNull(al_exampleid) Then Return
End If

If is_Filter <> '' Then
	is_Filter = ''
	dw_examples.SetFilter("")
	dw_examples.Filter()
End If

ll_Find = dw_examples.Find("Example_ID="+String(al_exampleid),1,dw_examples.RowCount())
If ll_Find < 1 Then Return
ls_WinName = dw_examples.GetItemString(ll_Find,'window')
If IsNull(ls_WinName) Or ls_WinName = '' Then Return

//Make sure this window is not opened
lw_sheet = w_main_frame.GetActiveSheet()
Do While IsValid(lw_sheet)
	If lw_sheet.ClassName() = ls_WinName Then
		lw_sheet.BringToTop = True
		Return
	End If
	lw_sheet = w_main_frame.GetNextSheet(lw_sheet)
Loop

OpenSheet(lw_new,ls_WinName,w_main_frame,9,original!)




end event

event ue_showpanel(boolean ab_show);//====================================================================
// Event: ue_showpanel()
//--------------------------------------------------------------------
// Description: reset panel size
//--------------------------------------------------------------------
// Arguments: 
//		boolean	ab_show		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 zhouchaoqun		Date: 2006/05/09
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.setRedraw(False)
If ab_show Then
	tv_examples.Visible = True
	ddplb_state.Visible = True
	st_vertical.show()//Added by Frank, 2013-02-21
	of_showscroll_pic(true)
Else
	tv_examples.Visible = False
	ddplb_state.Visible = False
	st_vertical.hide()//Added by Frank, 2013-02-21
	of_showscroll_pic(false)
End If

This.Event ue_resizemdi()
This.setRedraw(True)
end event

event ue_arrangesheet(integer as_type);//====================================================================
// Event: ue_arrangesheet()
//--------------------------------------------------------------------
// Description: Arrange Sheets Window
//--------------------------------------------------------------------
// Arguments: 
//		integer	as_type		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Choose Case as_type
	Case 1
		This.ArrangeSheets(Tile!)
	Case 2
		This.ArrangeSheets(TileHorizontal!)
	Case 3
		This.ArrangeSheets(Layer!)
	Case 4
		This.ArrangeSheets(Cascade!)
	Case 5
		This.ArrangeSheets(Icons!)
	Case 6
		
End Choose

end event

event ue_postopen();//Retrieve data from group and example item 

int   li_server_type
string ls_client_type

li_server_type=appeongetservertype()
ls_client_type=appeongetclienttype()

dw_group.Retrieve(li_server_type,ls_client_type)

dw_examples.Retrieve(li_server_type,ls_client_type,GI_PBVERSION)


/*IF li_server_type=1 THEN
	//Java Appeon Server
	m_mdi.m_dotnetsupport.visible=false
ELSEIF li_server_type=2 THEN
	//Net Appeon Server
	m_mdi.m_n_tiersupport.visible=false
END IF
*/

tv_examples.Event  ue_reset_categories()

of_setmenuvisible()
end event

public function boolean of_separatestr (string as_source, ref string as_string1, ref string as_string2);integer li_Pos

li_Pos = Pos(as_Source, " - ")
if li_Pos>0 then
	as_String1 = Left(as_Source, (li_Pos - 1))
	as_String2 = Mid(as_Source, (li_Pos + 3))
	Return true
else
	as_String1 = ""
	as_String2 = ""
	Return false
end if
end function

public function boolean of_getwindowcount (string as_category);long ll_RowCount
string ls_Filter

ls_Filter = "group_id='" + as_Category + "'" + is_OnlyNew
dw_examples.SetFilter(ls_Filter)
dw_examples.Filter()
ll_RowCount = dw_examples.RowCount()

if ll_RowCount>0 then
	Return true
else
	Return false
end if
end function

public subroutine of_showscroll_pic (boolean ab_switch);if appeongetclienttype()='MOBILE' and ab_switch then
	p_scroll.show()
else
	p_scroll.hide()
end if

end subroutine

public subroutine of_setmenuvisible ();int li_level1,li_Level2,li_level3
int li_count1,li_count2,li_count3

String ls_tag


li_count1 = upperbound(m_mdi.item[])
FOR li_level1 = li_count1 to 1 step -1
	li_count2 = upperbound(m_mdi.item[li_Level1].item[])
	
	FOR li_Level2 =li_count2  to 1 step -1
		li_count3 = upperbound(m_mdi.item[li_Level1].item[li_Level2].item[])
		if li_count3=0 then
			ls_Tag = trim(m_mdi.item[li_Level1].item[li_Level2].tag)
			if ls_tag <>'' then
				if of_findexample(ls_tag) > 0 then
					m_mdi.item[li_Level1].item[li_Level2].visible=true
				else
					m_mdi.item[li_Level1].item[li_Level2].visible=false
				end if
			end if
		else
			FOR li_Level3=li_count3 to 1 step -1
				ls_Tag = trim(m_mdi.item[li_Level1].item[li_Level2].item[li_Level3].tag)
				if ls_tag <>'' then
					if of_findexample(ls_tag) <=0 then
						m_mdi.item[li_Level1].item[li_Level2].item[li_Level3].visible=false
					else
						m_mdi.item[li_Level1].item[li_Level2].item[li_Level3].visible=true
					end if
				end if
			NEXT
		end if
		
	NEXT
next


/*
//Set upper menu item invisible if no detail item visible
int li_visibleCount2,li_visibleCount3
menu  lm_l2,lm_l3

FOR li_level1 = upperbound(m_mdi.item[]) to 1 step -1
	FOR li_Level2 =upperbound(m_mdi.item[li_Level1].item[])  to 1 step -1
		li_visibleCount2=0
		li_count3 = upperbound(m_mdi.item[li_Level1].item[li_Level2].item[])
		if li_count3=0 then
			if m_mdi.item[li_Level1].item[li_Level2].visible then
				li_visibleCount2++
			end if
		else
			li_visibleCount3=0
			FOR li_Level3=li_count3 to 1 step -1
				if m_mdi.item[li_Level1].item[li_Level2].item[li_Level3].visible then
					li_visibleCount3++
				end if
			NEXT
			if li_visibleCount3> 0 then
				li_visibleCount2++
			end if
			m_mdi.item[li_Level1].item[li_Level2].visible= li_visibleCount3> 0
		end if
		
		m_mdi.item[li_Level1].visible=li_visibleCount2 > 0
	NEXT
next
*/
end subroutine

public function integer of_findexample (string as_tag);int  li_find

li_Find = dw_examples.Find("example_id="+as_tag,1,dw_examples.RowCount())

return li_Find
end function

on w_main_frame.create
if this.MenuName = "m_mdi" then this.MenuID = create m_mdi
this.mdi_1=create mdi_1
this.p_scroll=create p_scroll
this.ddplb_state=create ddplb_state
this.dw_group=create dw_group
this.dw_examples=create dw_examples
this.tv_examples=create tv_examples
this.st_vertical=create st_vertical
this.Control[]={this.mdi_1,&
this.p_scroll,&
this.ddplb_state,&
this.dw_group,&
this.dw_examples,&
this.tv_examples,&
this.st_vertical}
end on

on w_main_frame.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.p_scroll)
destroy(this.ddplb_state)
destroy(this.dw_group)
destroy(this.dw_examples)
destroy(this.tv_examples)
destroy(this.st_vertical)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	 zhouchaoqun		Date: 2006/05/09
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
of_showscroll_pic(true)
	
This.Post Event ue_postOpen()
Timer(1)





end event

event resize;//====================================================================
// Event: resize()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		unsignedlong	sizetype 		
//		integer     	newwidth 		
//		integer     	newheight		
//--------------------------------------------------------------------
// Returns: long [pbm_size]
//--------------------------------------------------------------------
// Author: 	 zhouchaoqun		Date: 2006/05/09
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================


If	tv_examples.Visible Then
	//modify by zhoujunwei at 20121227
	//<modification reason> mdi doesn't need to resize in the mobile
	If upper(AppeonGetClientType()) <> 'MOBILE' then
		ddplb_state.y = 110
	End If
	//end modify
	ddplb_state.x = tv_examples.x
	
	mdi_1.Height =  This.WorkSpaceHeight() - 75
	mdi_1.Y = ddplb_state.Y 
	//modify by zhoujunwei at 20121227
	//<modification reason> mdi doesn't need to resize in the mobile
	If upper(AppeonGetClientType()) <> 'MOBILE' then
		tv_examples.Height = mdi_1.Height - 110
	Else
		mdi_1.height = mdi_1.height - 40
		tv_examples.Height = mdi_1.Height - 108
	End If
	//end modify	
	tv_examples.Y = ddplb_state.Y + 108
	
	//---Added by Frank, 2013-02-21-------Begin-------
	st_vertical.x = tv_examples.x+tv_examples.width +4
   st_vertical.height = newheight
	st_vertical.y = ddplb_state.y
	st_vertical.show()
	mdi_1.Width = This.WorkSpaceWidth() - tv_examples.Width - 50
	mdi_1.X = st_vertical.X + st_vertical.Width 
	//---Added by Frank, 2013-02-21-------End-------
Else
	mdi_1.X = ddplb_state.X
	mdi_1.Y = ddplb_state.Y
	mdi_1.Width = This.WorkSpaceWidth() - 10
	mdi_1.Height =  This.WorkSpaceHeight() - 75
End If
p_scroll.y = mdi_1.y + mdi_1.height - p_scroll.height - 4
end event

event timer;//====================================================================
// Event: timer()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_timer]
//--------------------------------------------------------------------
// Author: 	 zhouchaoqun		Date: 2006/05/09
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_now
Time lt_time
Date ld_now

ld_now = Date(Now())
lt_time = Time(Now())

ls_now = "Current Time: "+String(ld_now,"yyyy-mm-dd")+" "+String(lt_time,"hh:mm:ss")
if appeongetappeonusername() <> "" Then
	ls_now = ls_now + "  [ User Name: "+appeongetappeonusername()+"   PassWord: ******  ]"
End If

This.SetMicroHelp(ls_now)

end event

type mdi_1 from mdiclient within w_main_frame
long BackColor=268435456
end type

type p_scroll from picture within w_main_frame
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
boolean visible = false
integer x = 1106
integer y = 1180
integer width = 183
integer height = 160
string pointer = "SizeWE!"
boolean originalsize = true
string picturename = "wbl_qkscrollbar_up.jpg"
boolean focusrectangle = false
end type

event mousemove;If flags<>1 Then//Left mouse button
	Return
End If
//this.drag( begin!)
this.x = parent.pointerx( ) //- this.width/2
st_vertical.x = this.x + this.width +4 //- st_vertical.width

end event

event lbuttonup;
tv_examples.width = st_vertical.x - 5
ddplb_state.width = tv_examples.width

mdi_1.x = st_vertical.x + st_vertical.width+4
mdi_1.Width = parent.WorkSpaceWidth() - tv_examples.Width - 50


SetPointer(Arrow!)

end event

type ddplb_state from dropdownpicturelistbox within w_main_frame
integer x = 5
integer y = 12
integer width = 1289
integer height = 716
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "All"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"All","New since 2.8","New features of 2.8","New features of 3.0","New features of 5.0","New features of 6.6"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2,3,4,5,6}
string picturename[] = {"all.bmp","Custom079!","new2.8.bmp","new3.0.bmp","new5.0.bmp","new6.6.bmp"}
long picturemaskcolor = 12632256
end type

event selectionchanged;String	ls_Filter

Choose Case index
	Case 1
		is_OnlyNew = " And (1 = 1)"
	Case 2
		is_OnlyNew = " And (isnew = '1')"
	Case 3
		is_OnlyNew = " And (version = '2.8')"
	Case 4
		is_OnlyNew = " And (version = '3.0')"
	Case 5
		is_OnlyNew = " And (version = '5.0')"
	Case 6
		is_OnlyNew = " And (version = '6.6')"
End Choose

tv_examples.Post Event ue_reset_categories()
end event

type dw_group from datawindow within w_main_frame
boolean visible = false
integer x = 110
integer y = 220
integer width = 891
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "d_example_categories"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;This.setTransObject(sqlca)
end event

type dw_examples from datawindow within w_main_frame
boolean visible = false
integer x = 233
integer y = 624
integer width = 453
integer height = 440
integer taborder = 30
string title = "none"
string dataobject = "d_t_examples"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;This.setTransObject(sqlca)
end event

type tv_examples from treeview within w_main_frame
event ue_reset_categories ( )
event ue_collapse_all ( )
event ue_expand_all ( )
integer x = 5
integer y = 104
integer width = 1289
integer height = 1148
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
string picturename[] = {"Application!","DataWindow5!","Inherit!","Function!","Menu!","PasteStatement!","move!","UserObject!","Custom002!","Ole1!","PasteSQL5!","Form!","Graph!","UserObject5!","SetDefaultClass!","Run!","Next!","new2.8.bmp","new3.0.bmp","new5.0.bmp","new6.6.bmp"}
long picturemaskcolor = 12632256
string statepicturename[] = {"AddWatch!"}
long statepicturemaskcolor = 536870912
end type

event ue_reset_categories();//====================================================================
// Event: ue_reset_categories()
//--------------------------------------------------------------------
// Description: ret categories
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string	ls_Sub, ls_Super, ls_Category,ls_PrvSuper
string   ls_SubPic, ls_SuperPic, ls_Picture
integer	li_Categories, li_Sub, li_Cnt,li_picture
long		ll_Super, ll_Root
TreeViewItem	ltvi_Item

SetPointer(HourGlass!)

ll_Root = this.FindItem(roottreeitem!,0)
if ll_Root>0 then this.DeleteItem(ll_Root)

// Insert root item
ltvi_Item.Data = ""
ltvi_Item.Children = True
ltvi_Item.PictureIndex = 1
ltvi_Item.Label = "Appeon Code Examples"
ltvi_Item.SelectedPictureIndex = ltvi_Item.PictureIndex
il_root = This.InsertItemLast (0, ltvi_Item)

li_Categories = dw_group.RowCount()
li_picture = 1
for li_Cnt = 1 to li_Categories
	// Continue loop, if no run window
	ls_Category = dw_group.GetItemString(li_Cnt,"group_id")	
	if not of_GetWindowCount(ls_Category) then Continue	
	ls_Picture = dw_group.GetItemString(li_Cnt,"group_pic")
	of_SeparateStr(ls_Picture, ls_SuperPic, ls_SubPic)
	
	if of_SeparateStr(ls_Category, ls_Super, ls_Sub) then
		//	Category have sub category		
		if ls_PrvSuper<>ls_Super then
			ltvi_Item.Label = ls_Super
			ltvi_Item.Data = ls_Super
			ltvi_Item.Children = true
			ltvi_Item.PictureIndex = Integer(ls_SuperPic)
			ltvi_Item.SelectedPictureIndex = Integer(ls_SuperPic)
			// Insert item of level 2, if category have sub category
			ll_Super = this.InsertItemLast(il_Root, ltvi_Item)
			ls_PrvSuper = ls_Super
		end if
		
		// Insert item of level 3
		ltvi_Item.Label = ls_Sub
		ltvi_Item.Data = ls_Category
		ltvi_Item.PictureIndex = Integer(ls_SubPic)
		ltvi_Item.SelectedPictureIndex = Integer(ls_SubPic)		
		this.InsertItemLast(ll_Super, ltvi_Item)
	else
		//	Category No sub category
		ltvi_Item.Label = ls_Category
		ltvi_Item.Data = ls_Category
		ltvi_Item.Children = true
		ltvi_Item.PictureIndex = Integer(ls_Picture)
		ltvi_Item.SelectedPictureIndex = Integer(ls_Picture)			
		this.InsertItemLast(il_Root, ltvi_Item)
	end if	
next

this.ExpandItem(il_Root)
if IsValid(w_splash) then Close(w_splash)
dw_examples.SetFilter("")
dw_examples.Filter()

SetPointer(Arrow!)
end event

event ue_collapse_all();//====================================================================
// Event: ue_collapse_all()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
SetPointer(HourGlass!)

This.CollapseItem(il_root)

end event

event ue_expand_all();//====================================================================
// Event: ue_expand_all()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
SetPointer(HourGlass!)

This.ExpandAll ( il_root )


end event

event itempopulate;//====================================================================
// Event: itempopulate()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnitempopulate]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer				li_Cnt, li_Examples
String				ls_Category
String				ls_version
TreeViewItem	ltvi_New, ltvi_Parent

If Handle = il_Root Then Return

This.GetItem(Handle, ltvi_Parent)
ls_Category = ltvi_Parent.Data
is_Filter = "group_id='"+ls_Category+"'" + is_OnlyNew
dw_examples.SetFilter(is_Filter)
dw_examples.Filter()
dw_examples.SetSort("group_id A , title A ")
dw_examples.Sort()

li_Examples = dw_examples.RowCount()

For li_Cnt = 1 To li_Examples
	ltvi_New.Label = dw_examples.Object.Title[li_Cnt]
	ltvi_New.Data = dw_examples.Object.Example_ID[li_Cnt]
	ls_version = dw_examples.Object.version[li_Cnt]
	ltvi_New.Children = False
	
	Choose case	ls_version
		case	"2.8"
			ltvi_New.PictureIndex = 18
		case	"3.0"
			ltvi_New.PictureIndex = 19
		case	"5.0"
			ltvi_New.PictureIndex = 20
		case	"6.6"
			ltvi_New.PictureIndex = 21
		case	else
			ltvi_New.PictureIndex = 16
	End Choose
	
	ltvi_New.SelectedPictureIndex = 17
	This.InsertItemLast(Handle, ltvi_New)
Next


end event

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	handle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvndoubleclicked]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long  ll_ID
TreeviewItem  ltvi

If This.GetItem(Handle,ltvi) < 0 Then Return
If ltvi.Children Then Return

ll_ID = Long(ltvi.Data)

Parent.Event ue_run(ll_ID)



end event

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long	oldhandle		
//		long	newhandle		
//--------------------------------------------------------------------
// Returns: long [pbm_tvnselchanged]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
treeviewitem ltvi_Current
String  ls_Data
Long  li_Row
String				ls_Tmp
Integer				li_CurrRow

If newhandle < 0 Then Return

This.GetItem(newhandle, ltvi_Current)
ls_Data = String(ltvi_Current.Data)

If Not IsNumber(ls_Data) Then
	//gb_current.Text = "Current Example"
	Return
End If
ls_Tmp = ltvi_Current.Label
//gb_current.Text = ls_Tmp

If il_LastID = Long(ls_Data) Then Return
il_LastID = Long(ls_Data)

If is_Filter <> '' Then
	is_Filter = ''
	dw_examples.SetFilter(is_Filter)
	dw_examples.Filter()
End If
li_CurrRow = dw_examples.Find("Example_ID = " + ls_Data, 1, dw_examples.RowCount())
If li_CurrRow < 1 Then Return



end event

event getfocus;//of_showscroll_pic(true)
end event

event losefocus;//of_showscroll_pic(false)
end event

type st_vertical from statictext within w_main_frame
event ue_mousemove pbm_mousemove
event ue_lbuttonup pbm_lbuttonup
integer x = 1294
integer y = 12
integer width = 18
integer height = 1364
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "SizeWE!"
long textcolor = 33554432
long backcolor = 15780518
long bordercolor = 8421376
boolean focusrectangle = false
end type

event ue_mousemove;If flags<>1 Then//Left mouse button
	Return
End If
//this.drag( begin!)
this.x = parent.pointerx( ) //- this.width/2
p_scroll.x = this.x - p_scroll.width
end event

event ue_lbuttonup;
tv_examples.width = this.x - 5
ddplb_state.width = tv_examples.width

mdi_1.x = this.x + this.width
mdi_1.Width = parent.WorkSpaceWidth() - tv_examples.Width - 50

SetPointer(Arrow!)
end event

event dragwithin;//this.x = parent.pointerx( ) - this.width/2
end event

event dragdrop;//tv_examples.width = this.x +10
//
//mdi_1.x = this.x + 20
//mdi_1.width = parent.workspacewidth( ) - tv_examples.width - 20
//
//SetPointer(Arrow!)
end event

