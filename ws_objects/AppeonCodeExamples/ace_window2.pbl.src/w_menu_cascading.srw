$PBExportHeader$w_menu_cascading.srw
$PBExportComments$MenuItem Attributes example
forward
global type w_menu_cascading from window
end type
type tv_1 from treeview within w_menu_cascading
end type
type dw_2 from datawindow within w_menu_cascading
end type
type dw_1 from datawindow within w_menu_cascading
end type
type mle_output from multilineedit within w_menu_cascading
end type
type dw_menuitem from datawindow within w_menu_cascading
end type
type gb_2 from groupbox within w_menu_cascading
end type
type gb_1 from groupbox within w_menu_cascading
end type
type gb_toolbaritem from groupbox within w_menu_cascading
end type
type gb_function from groupbox within w_menu_cascading
end type
type gb_3 from groupbox within w_menu_cascading
end type
end forward

global type w_menu_cascading from window
integer x = 114
integer y = 208
integer width = 2638
integer height = 2068
boolean titlebar = true
string title = "Cascading menu"
string menuname = "m_menu_functions_menucascade"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 74481808
event ue_exit pbm_custom01
event ue_tile pbm_custom02
event ue_layer pbm_custom03
event ue_cascade pbm_custom04
event ue_arrange pbm_custom05
event ue_open pbm_custom06
event ue_htile pbm_custom07
tv_1 tv_1
dw_2 dw_2
dw_1 dw_1
mle_output mle_output
dw_menuitem dw_menuitem
gb_2 gb_2
gb_1 gb_1
gb_toolbaritem gb_toolbaritem
gb_function gb_function
gb_3 gb_3
end type
global w_menu_cascading w_menu_cascading

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

// determines current datawindow selections
Integer    ii_cur_dw ,ii_index,ii_handle

// frame window

// Do not show menuitem attributes until entire entire
// menu has been "built" into the DataWindows
Boolean   ib_menu_built = true ,ib_menucascade

// Save window background color
Long   il_ButtonFace

string is_colname,is_menulevel

end variables

forward prototypes
protected function integer wf_change_menuitem (datawindow adw_current, string as_colname)
public subroutine wf_execute_script ()
public subroutine wf_output (string as_text, boolean ab_opt)
public function integer wf_display_menu (string as_item)
public subroutine wf_setitem (string as_item)
public subroutine wf_mdi_resize (boolean ab_flag)
end prototypes

event ue_exit;//////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_exit script for w_menu_functions
//////////////////////////////////////////////////////////////////////////////////////////////////////////


// exit this example by closing the frame window
end event

event ue_open;//====================================================================
// Event: ue_open()
//--------------------------------------------------------------------
// Description: ue_open script for w_menu_functions
//--------------------------------------------------------------------
// Arguments: 
//		unsignedlong	wparam		
//		long        	lparam		
//--------------------------------------------------------------------
// Returns: long [pbm_custom06]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//////////////////////////////////////////////////////////////////////
//	call the wf_show_menu function which will display the
//	current menu items in the three datawindows
//////////////////////////////////////////////////////////////////////


this.ChangeMenu (m_menu_functions_menucascade)

dw_menuitem.InsertRow (0)
dw_1.InsertRow(0)
dw_2.InsertRow(0)
dw_menuitem.setfocus()



end event

protected function integer wf_change_menuitem (datawindow adw_current, string as_colname);//====================================================================
// Function: wf_change_menuitem()
//--------------------------------------------------------------------
// Description: (N/A)
//--------------------------------------------------------------------
//	Arguments: 	DataWindow  adw_current
//					String      as_colname
//--------------------------------------------------------------------
//	Returns:  integer
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/03/07
//--------------------------------------------------------------------
// Modify History: 
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Int			li_first_row, li_second_row, li_third_row, 	li_val,li_size
long        ll_pos
String		ls_val,ls_temp
Boolean		lb_val
menu			lm_curr_menu
n_util      lnv_util


lm_curr_menu = This.MenuID
lnv_util = Create n_util
//////////////////////////////////////////////////////////////////////
// Determine what the current menuitem is
//////////////////////////////////////////////////////////////////////

ls_temp = is_menulevel
choose case integer(left(is_menulevel,1))
	case 1
		li_first_row = integer(mid(ls_temp,3))
	case 2
		ls_temp = mid(ls_temp,3)
		ll_pos = pos(ls_temp,'-')
		li_first_row = integer(left(ls_temp,ll_pos - 1))
		li_second_row = integer(mid(ls_temp,ll_pos + 1))
	case 3
		ls_temp = mid(ls_temp,3)
		ll_pos = pos(ls_temp,'-')
		li_first_row = integer(left(ls_temp,ll_pos - 1))
		ls_temp = mid(ls_temp,ll_pos + 1)
		ll_pos = pos(ls_temp,'-')
		li_second_row = integer(left(ls_temp,ll_pos - 1))
		li_third_row = integer(mid(ls_temp,ll_pos + 1))
	case else
		Return -1 
end choose

//////////////////////////////////////////////////////////////////////
// Change the value of the current menu item attribute
//////////////////////////////////////////////////////////////////////

Choose Case as_colname
	Case 'visible'
		lb_val = lnv_util.of_char_to_boolean (adw_current.GetText())
		
		If ii_cur_dw = 1 Then
			lm_curr_menu.Item[li_first_row].Visible = lb_val
			wf_output('Visible :'+string(lm_curr_menu.Item[li_first_row].Visible),True)
		Else
			If ii_cur_dw = 2 Then
				lm_curr_menu.Item[li_first_row].Item[li_second_row].Visible = lb_val
				wf_output('Visible :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Visible),True)
			Else
				lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Visible = lb_val
				wf_output('Visible :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Visible),True)
			End If
		End If
		
	Case 'enabled'
		lb_val = lnv_util.of_char_to_boolean (adw_current.GetText())
		
		If ii_cur_dw = 1 Then
			lm_curr_menu.Item[li_first_row].Enabled = lb_val
			wf_output('Enabled :'+string(lm_curr_menu.Item[li_first_row].Enabled),True)
		Else
			If ii_cur_dw = 2 Then
				lm_curr_menu.Item[li_first_row].Item[li_second_row].Enabled = lb_val
				wf_output('Enabled :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Enabled),True)
			Else
				lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Enabled = lb_val
				wf_output('Enabled :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Enabled),True)
			End If
		End If
		
	Case 'checked'
		lb_val = lnv_util.of_char_to_boolean (adw_current.GetText())
		
		If ii_cur_dw = 1 Then
			lm_curr_menu.Item[li_first_row].Checked = lb_val
			wf_output('Checked :'+string(lm_curr_menu.Item[li_first_row].Checked),True)
		Else
			If ii_cur_dw = 2 Then
				lm_curr_menu.Item[li_first_row].Item[li_second_row].Checked = lb_val
				wf_output('Checked :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Checked),True)
			Else
				lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Checked = lb_val
				wf_output('Checked :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Checked),True)
			End If
		End If
		
	Case 'dropdown'
		if ib_menucascade and this.menuid = m_menu_functions_menucascade then
			lb_val = lnv_util.of_char_to_boolean (adw_current.GetText())
			m_menu_functions_menucascade.m_settings.m_windowbackgroundcolor.DropDown = lb_val
			wf_output('DropDown :'+string(m_menu_functions_menucascade.m_settings.m_windowbackgroundcolor.DropDown),True)				
		end if
	Case 'fcolumn'	
			if ib_menucascade and this.menuid = m_menu_functions_menucascade then
				li_val = integer(adw_current.GetText())			
				m_menu_functions_menucascade.m_settings.m_windowbackgroundcolor.columns = li_val
				wf_output('Columns :'+string(m_menu_functions_menucascade.m_settings.m_windowbackgroundcolor.columns),True)
			end if
	Case 'item'	
		   wf_output('Item[] :'+String(UpperBound(lm_curr_menu.Item[])),True)			
	Case 'parentwindow'
		   wf_output('ParentWindow :'+lm_curr_menu.parentwindow.ClassName(),True)			
	Case 'shifttoright'
		   lb_val = lnv_util.of_char_to_boolean (adw_current.GetText())			
			lm_curr_menu.ShiftToRight = lb_val
			wf_output('ShiftToRight :'+string(lm_curr_menu.ShiftToRight),True)		
	Case 'shortcut'		  
			If ii_cur_dw = 1 Then				
				wf_output('ShortCut :'+string(lm_curr_menu.Item[li_first_row].ShortCut),True)
			Else
				If ii_cur_dw = 2 Then
					wf_output('ShortCut :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].ShortCut),True)
				Else
					wf_output('ShortCut :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ShortCut),True)
				End If
		   END IF			
	Case 'tag'
			ls_val = adw_current.GetText()
			If ii_cur_dw = 1 Then
				lm_curr_menu.Item[li_first_row].tag = ls_val
				wf_output('Tag :'+string(lm_curr_menu.Item[li_first_row].tag),True)
			Else
				If ii_cur_dw = 2 Then
					lm_curr_menu.Item[li_first_row].Item[li_second_row].tag = ls_val
					wf_output('Tag :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].tag),True)
				Else
					lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].tag = ls_val
					wf_output('Tag :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].tag),True)
				End If
		   END IF
	Case 'text'
			ls_val = adw_current.GetText()
			wf_setitem(ls_val) //modify
			If ii_cur_dw = 1 Then
				lm_curr_menu.Item[li_first_row].text = ls_val
				wf_output('Text :'+string(lm_curr_menu.Item[li_first_row].text),True)
			Else
				If ii_cur_dw = 2 Then
					lm_curr_menu.Item[li_first_row].Item[li_second_row].text = ls_val
					wf_output('Text :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].text),True)
				Else
					lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].text = ls_val
					wf_output('Text :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].text),True)
				End If
		   END IF
	Case 'tbivisible'
			lb_val = lnv_util.of_char_to_boolean (adw_current.GetText())
		
			If ii_cur_dw = 1 Then
				lm_curr_menu.Item[li_first_row].ToolbarItemVisible = lb_val
				wf_output('ToolbarItemVisible :'+string(lm_curr_menu.Item[li_first_row].ToolbarItemVisible),True)
			Else
				If ii_cur_dw = 2 Then
					lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemVisible = lb_val
					wf_output('ToolbarItemVisible :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemVisible),True)
				Else
					lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemVisible = lb_val
					wf_output('ToolbarItemVisible :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemVisible),True)
				End If
			End If
	Case 'down'
			lb_val = lnv_util.of_char_to_boolean (adw_current.GetText())
		
			If ii_cur_dw = 1 Then
				lm_curr_menu.Item[li_first_row].ToolbarItemDown = lb_val
				wf_output('ToolbarItemDown :'+string(lm_curr_menu.Item[li_first_row].ToolbarItemDown),True)
			Else
				If ii_cur_dw = 2 Then
					lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemDown = lb_val
					wf_output('ToolbarItemDown :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemDown),True)
				Else
					lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemDown = lb_val
					wf_output('ToolbarItemDown :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemDown),True)
				End If
			End If
	Case 'downname'
		   ls_val = adw_current.GetText()
		
			If ii_cur_dw = 1 Then
				lm_curr_menu.Item[li_first_row].ToolbarItemDownName = ls_val
				wf_output('ToolbarItemDownName :'+string(lm_curr_menu.Item[li_first_row].ToolbarItemDownName),True)
			Else
				If ii_cur_dw = 2 Then
					lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemDownName = ls_val
					wf_output('ToolbarItemDownName :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemDownName),True)
				Else
					lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemDownName = ls_val
					wf_output('ToolbarItemDownName :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemDownName),True)
				End If
			End If
	Case 'barindex'
			li_val = integer(adw_current.GetText())
		
			If ii_cur_dw = 1 Then
				lm_curr_menu.Item[li_first_row].ToolbarItemBarIndex = li_val
				wf_output('ToolbarItemBarIndex :'+string(lm_curr_menu.Item[li_first_row].ToolbarItemBarIndex),True)
			Else
				If ii_cur_dw = 2 Then
					lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemBarIndex = li_val
					wf_output('ToolbarItemBarIndex :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemBarIndex),True)
				Else
					lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemBarIndex = li_val
					wf_output('ToolbarItemBarIndex :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemBarIndex),True)
				End If
			End If
	Case 'name'	
			ls_val = adw_current.GetText()

			SetPointer (hourglass!)	
	
			if ii_cur_dw = 2 then
				// (Check for cascading menu)
				li_size = UpperBound (lm_curr_menu.item[li_first_row].item[li_second_row].item)
				if li_size = 0 then
					lb_val = lm_curr_menu.item[li_first_row].item[li_second_row].visible
					lm_curr_menu.item[li_first_row].item[li_second_row].visible = not lb_val
					lm_curr_menu.item[li_first_row].item[li_second_row].ToolbarItemName = ls_val
					lm_curr_menu.item[li_first_row].item[li_second_row].visible = lb_val
					wf_output('ToolbarItemName :'+string(lm_curr_menu.item[li_first_row].item[li_second_row].ToolbarItemName),True)
				end if
			else
				if ii_cur_dw = 3 then	
					lb_val = lm_curr_menu.item[li_first_row].item[li_second_row].item[li_third_row].visible
					lm_curr_menu.item[li_first_row].item[li_second_row].item[li_third_row].visible = not lb_val
					lm_curr_menu.item[li_first_row].item[li_second_row].item[li_third_row].ToolbarItemName = ls_val
					lm_curr_menu.item[li_first_row].item[li_second_row].item[li_third_row].visible = lb_val
					wf_output('ToolbarItemName :'+string(lm_curr_menu.item[li_first_row].item[li_second_row].item[li_third_row].ToolbarItemName),True)
				end if
			end if
	Case 'order'
		  li_val = integer(adw_current.GetText())
		
			If ii_cur_dw = 1 Then
				lm_curr_menu.Item[li_first_row].ToolbarItemOrder = li_val
				wf_output('ToolbarItemOrder :'+string(lm_curr_menu.Item[li_first_row].ToolbarItemOrder),True)
			Else
				If ii_cur_dw = 2 Then
					lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemOrder = li_val
					wf_output('ToolbarItemOrder :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemOrder),True)
				Else
					lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemOrder = li_val
					wf_output('ToolbarItemOrder :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemOrder),True)
				End If
			End If
	Case 'space'
			li_val = integer(adw_current.GetText())
		
			If ii_cur_dw = 1 Then
				lm_curr_menu.Item[li_first_row].ToolbarItemSpace = li_val
				wf_output('ToolbarItemSpace :'+string(lm_curr_menu.Item[li_first_row].ToolbarItemSpace),True)
			Else
				If ii_cur_dw = 2 Then
					lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemSpace = li_val
					wf_output('ToolbarItemSpace :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemSpace),True)
				Else
					lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemSpace = li_val
					wf_output('ToolbarItemSpace :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemSpace),True)
				End If
			End If
	Case 'tbitext'
			ls_val = adw_current.GetText()
		
			If ii_cur_dw = 1 Then
				lm_curr_menu.Item[li_first_row].ToolbarItemText = ls_val
				wf_output('ToolbarItemText :'+string(lm_curr_menu.Item[li_first_row].ToolbarItemText),True)
			Else
				If ii_cur_dw = 2 Then
					lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemText = ls_val
					wf_output('ToolbarItemText :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].ToolbarItemText),True)
				Else
					lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemText = ls_val
					wf_output('ToolbarItemText :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].ToolbarItemText),True)
				End If
			End If
 //Case 'Function'
   Case 'check'
			ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return  1
			If ii_cur_dw = 1 Then
				li_val = lm_curr_menu.Item[li_first_row].Check()				
			Else
				If ii_cur_dw = 2 Then
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Check()					
				Else
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Check()					
				End If
			End If
			dw_menuitem.setitem(1,'checked','Y')
			wf_output('Menu Function Check() Return :'+string(li_val),True)
	Case 'classname'
		   ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return  1
			ls_val = lm_curr_menu.classname()
			wf_output('Menu Function ClassName() Return :'+ls_val,True)
	Case 'disable'
			ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return  1
			If ii_cur_dw = 1 Then
				li_val = lm_curr_menu.Item[li_first_row].Disable()				
			Else
				If ii_cur_dw = 2 Then
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Disable()				
				Else
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Disable()
				End If
			End If
			dw_menuitem.setitem(1,'enabled','N')
			wf_output('Menu Function Disable() Return :'+string(li_val),True)
	Case 'enable'
			ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return  1
			If ii_cur_dw = 1 Then
				li_val = lm_curr_menu.Item[li_first_row].Enable()			
			Else
				If ii_cur_dw = 2 Then
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Enable()				
				Else
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Enable()				
				End If
			End If
			dw_menuitem.setitem(1,'enabled','Y')
			wf_output('Menu Function Enable() Return :'+string(li_val),True)
	Case 'getparent'
			ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return  1
			If ii_cur_dw = 1 Then
				ls_val = lm_curr_menu.Item[li_first_row].GetParent().ClassName()			
			Else
				If ii_cur_dw = 2 Then
					ls_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].GetParent().ClassName()						
				Else
					ls_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].GetParent().ClassName()						
				End If
			End If			
			wf_output('Menu Function Getparent() Return :'+ls_val,True)
	Case 'hide'
			ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return  1
			If ii_cur_dw = 1 Then
				li_val = lm_curr_menu.Item[li_first_row].Hide()				
			Else
				If ii_cur_dw = 2 Then
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Hide()						
				Else
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Hide()						
				End If
			End If
			wf_output('Menu Function Hide() Return :'+string(li_val),True)
	Case 'popmenu'
		  	ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return  1
			If ii_cur_dw = 1 Then
				IF UpperBound(lm_curr_menu.Item[li_first_row].item[]) > 0 then
					li_val = lm_curr_menu.Item[li_first_row].PopMenu (this.PointerX(), this.PointerY())	
			   End IF
			Else
				If ii_cur_dw = 2 Then
					IF UpperBound(lm_curr_menu.Item[li_first_row].Item[li_second_row].item[]) > 0 THEN
						li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].PopMenu (this.PointerX(), this.PointerY())
					END IF				
				End If
			End If
			if not isvalid(this) then return -1
			wf_output('Menu Function PopMenu() Return :'+string(li_val),True)
	Case 'postevent'
			ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return  1			
			lb_val = lm_curr_menu.postevent('ue_peout')
			wf_output('Menu Function PostEvent() Return :'+string(lb_val),True)
	Case 'show'
			ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return  1
			If ii_cur_dw = 1 Then
				li_val = lm_curr_menu.Item[li_first_row].Show()				
			Else
				If ii_cur_dw = 2 Then
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Show()					
				Else
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Show()					
				End If
			End If
			wf_output('Menu Function Show() Return :'+string(li_val),True)
	Case 'triggerevent'
		   ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return  1			
			li_val = lm_curr_menu.triggerevent('ue_teout')	
			wf_output('Menu Function triggerevent() Return :'+string(li_val),False)
	Case 'typeof'
			ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return 1
			object type_obj
			type_obj = lm_curr_menu.item[1].item[1].TypeOf()
			choose case type_obj
				case menu!
					ls_val = 'Menu'
				Case menucascade!
					ls_val = 'Menucascade'
			end choose
			wf_output('Menu Function TypeOf() Return :'+ls_val,True)
	Case 'uncheck'
			ls_val = adw_current.GetText()
		   if upper(ls_val) ='N' then return  1
			If ii_cur_dw = 1 Then
				li_val = lm_curr_menu.Item[li_first_row].UnCheck()				
			Else
				If ii_cur_dw = 2 Then
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].UnCheck()			
				Else
					li_val = lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].UnCheck()				
				End If
			End If
			dw_menuitem.setitem(1,'checked','N')
			wf_output('Menu Function UnCheck() Return :'+string(li_val),True)
	Case 'default'
		lb_val = lnv_util.of_char_to_boolean (adw_current.GetText())
		
		If ii_cur_dw = 1 Then
			lm_curr_menu.Item[li_first_row].default = lb_val
			wf_output('Default :'+string(lm_curr_menu.Item[li_first_row].Default),True)
		Else
			If ii_cur_dw = 2 Then
				lm_curr_menu.Item[li_first_row].Item[li_second_row].Default = lb_val
				wf_output('Default :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Default),True)
			Else
				lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Default = lb_val
				wf_output('Default :'+string(lm_curr_menu.Item[li_first_row].Item[li_second_row].Item[li_third_row].Default),True)
			End If
		End If
		
			
End Choose


Return 1

end function

public subroutine wf_execute_script ();menu lm

lm = this.menuid
string ls_col
choose case ls_col
	case 'visible'
	case 'enabled'	
	case 'checked'	
	case 'dropdown'
	case 'fcolumn'
	case 'item'
	case 'parentwindow'
	case 'shifttoright'
	case 'shortcut'
	case 'tag'
	case 'text'
	case 'tivisible'
	case 'down'
	case 'downname'
	case 'barindex'
	case 'name'
	case 'order'
	case 'space'
	case 'text'
	case 'tbivisible'
	case 'check'	
   case 'classname'
	case 'disable'
	case 'enable'
	case 'getparent'
	case 'hide'
	case 'popmenu'
	case 'postevent'
	case 'show'
	case 'triggerevent'
	case 'typeof'
	case 'uncheck'
end choose

end subroutine

public subroutine wf_output (string as_text, boolean ab_opt);if ab_opt then
	mle_output.text =''
	ii_index = 0
end if
ii_index ++
mle_output.text += string(ii_index) + '. '+ as_text + '~r~n'
end subroutine

public function integer wf_display_menu (string as_item);//====================================================================
// Function: wf_display_menu()
//--------------------------------------------------------------------
// Description: (N/A)
//--------------------------------------------------------------------
//	Arguments: 	string  as_item
//--------------------------------------------------------------------
//	Returns:  integer
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/03/07
//--------------------------------------------------------------------
// Modify History: 
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

String ls_col_count,ls_name
Int	li_col_count, i,li_col_num
Long	ll_color,ll_level,ll_level1,ll_level2,ll_level3,ll_pos

ll_level = integer(left(as_item,1))
choose case ll_level
	case 1
		ll_level1 = integer(mid(as_item,3))
	case 2
		as_item = mid(as_item,3)
		ll_pos = pos(as_item,'-')
		ll_level1 = integer(left(as_item,ll_pos - 1))
		ll_level2 = integer(mid(as_item,ll_pos + 1))
	case 3
		as_item = mid(as_item,3)
		ll_pos = pos(as_item,'-')
		ll_level1 = integer(left(as_item,ll_pos - 1))
		as_item = mid(as_item,ll_pos + 1)
		ll_pos = pos(as_item,'-')
		ll_level2 = integer(left(as_item,ll_pos - 1))
		ll_level3 = integer(mid(as_item,ll_pos + 1))
	case else
		Return -1 
end choose
//Clear dw_menuitem set value
	dw_menuitem.setredraw(false)
	dw_menuitem.reset()
	dw_menuitem.insertrow(0)
	dw_menuitem.setredraw(true)
//Clear dw_1 set value
	dw_1.setredraw(false)
	dw_1.reset()
	dw_1.insertrow(0)
	dw_1.setredraw(true)	
//Clear dw_2 set value
	dw_2.setredraw(false)
	dw_2.reset()
	dw_2.insertrow(0)
	dw_2.setredraw(true)
///////////////////////////////////////////////
Choose Case ll_level
	Case 1 //Level 1
			li_col_count = integer(dw_menuitem.Object.DataWindow.Column.Count)
			for li_col_num = 1 to li_col_count step 1
			     ls_name = dw_menuitem.Describe('#'+string(li_col_num)+'.name')		 
				 choose case lower(ls_name)
						  case 'visible'
						   	 ls_col_count = string(this.MenuID.item[ll_level1].visible)							
							    if upper(ls_col_count)='TRUE' then
									    dw_menuitem.setitem(1,'visible','Y')
								 else
									  dw_menuitem.setitem(1,'visible','N')
								 end if
							case 'enabled'	
								  ls_col_count = string(this.MenuID.item[ll_level1].Enabled)							
								  if upper(ls_col_count)='TRUE' then
								       dw_menuitem.setitem(1,'enabled','Y')
							     else
								     dw_menuitem.setitem(1,'enabled','N')
							     end if
					      case 'checked'
						 	     ls_col_count = string(this.MenuID.item[ll_level1].Checked)							
							     if upper(ls_col_count)='TRUE' then
								       dw_menuitem.setitem(1,'checked','Y')
							     else
								     dw_menuitem.setitem(1,'checked','N')
							     end if
							case 'dropdown'
									if ib_menucascade and this.menuid = m_menu_functions_menucascade then
										ls_col_count = string(m_menu_functions_menucascade.m_settings.m_windowbackgroundcolor.DropDown)							
										if upper(ls_col_count)='TRUE' then
											 dw_menuitem.setitem(1,'dropdown','Y')
										else
											 dw_menuitem.setitem(1,'dropdown','N')
										end if
									end if
							case 'fcolumn'
									 if ib_menucascade and this.menuid = m_menu_functions_menucascade then
										 ls_col_count = string(m_menu_functions_menucascade.m_settings.m_windowbackgroundcolor.Columns)
										 dw_menuitem.setitem(1,'dropdown',ls_col_count)
									 end if
					      case 'item'						
					      case 'parentwindow'						
					      case 'shifttoright'
							      ls_col_count = string(this.MenuID.item[ll_level1].ShiftToRight)							
							      if upper(ls_col_count)='TRUE' then
								        dw_menuitem.setitem(1,'shifttoright','Y')
							      else
								     dw_menuitem.setitem(1,'shifttoright','N')
							      end if
					      case 'shortcut'
							      ls_col_count = string(this.MenuID.item[ll_level1].ShortCut)
							        dw_menuitem.setitem(1,'shortcut',ls_col_count)
					      case 'tag'
						         ls_col_count = string(this.MenuID.item[ll_level1].Tag)
							        dw_menuitem.setitem(1,'tag',ls_col_count)
					      case 'text'
						         ls_col_count = string(this.MenuID.item[ll_level1].Text)
							        dw_menuitem.setitem(1,'text',ls_col_count)
							case 'default'
						   	 ls_col_count = string(this.MenuID.item[ll_level1].visible)							
							    if upper(ls_col_count)='TRUE' then
									    dw_menuitem.setitem(1,'default','Y')
								 else
									  dw_menuitem.setitem(1,'default','N')
								 end if
									  
		             end choose
        next	

        li_col_count = integer(dw_1.Object.DataWindow.Column.Count)

        for li_col_num = 1 to li_col_count step 1
	          ls_name = dw_1.Describe('#'+string(li_col_num)+'.name')		 
		      choose case lower(ls_name)
					    case 'down'
						       ls_col_count = string(this.MenuID.item[ll_level1].ToolbarItemDown)							
							    if upper(ls_col_count)='TRUE' then
								      dw_1.setitem(1,'down','Y')
							    else
								    dw_1.setitem(1,'down','N')
							    end if
					     case 'downname'
							    ls_col_count = string(this.MenuID.item[ll_level1].ToolbarItemDownName)							
							    dw_1.setitem(1,'downname',ls_col_count)
					     case 'barindex'
						 	    ls_col_count = string(this.MenuID.item[ll_level1].ToolbarItemBarIndex)							
							    dw_1.setitem(1,'barindex',ls_col_count)
					     case 'name'
						       ls_col_count = string(this.MenuID.item[ll_level1].ToolbarItemName)						
							    dw_1.setitem(1,'name',ls_col_count)							
					     case 'order'
						       ls_col_count = string(this.MenuID.item[ll_level1].ToolbarItemOrder)
							      dw_1.setitem(1,'order',ls_col_count)							
					     case 'space'						
						       ls_col_count = string(this.MenuID.item[ll_level1].ToolbarItemSpace)
							      dw_1.setitem(1,'space',ls_col_count)
					     case 'tbitext'
							    ls_col_count = string(this.MenuID.item[ll_level1].ToolbarItemText)
							      dw_1.setitem(1,'tbitext',ls_col_count)						
					     case 'tbivisible'
							    ls_col_count = string(this.MenuID.item[ll_level1].ToolbarItemVisible)							
							    if upper(ls_col_count)='TRUE' then
								      dw_1.setitem(1,'tbivisible','Y')
							    else
								    dw_1.setitem(1,'tbivisible','N')
							   end if
					     end choose
         next
	Case 2		//Level 2
		If ll_level1 > 0 Then
			li_col_count = integer(dw_menuitem.Object.DataWindow.Column.Count)
			for li_col_num = 1 to li_col_count step 1
    			 ls_name = dw_menuitem.Describe('#'+string(li_col_num)+'.name')		 
				 choose case lower(ls_name)
						  case 'visible'
						   	 ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].visible)							
							    if upper(ls_col_count)='TRUE' then
  								 	 dw_menuitem.setitem(1,'visible','Y')
								 else
								 	 dw_menuitem.setitem(1,'visible','N')
								 end if
							case 'enabled'	
								  ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].Enabled)							
								  if upper(ls_col_count)='TRUE' then
  								     dw_menuitem.setitem(1,'enabled','Y')
							     else
								     dw_menuitem.setitem(1,'enabled','N')
							     end if
					      case 'checked'
						 	     ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].Checked)							
							     if upper(ls_col_count)='TRUE' then
  								     dw_menuitem.setitem(1,'checked','Y')
							     else
								     dw_menuitem.setitem(1,'checked','N')
										  end if
							case 'dropdown'
									if ib_menucascade and this.Menuid = m_menu_functions_menucascade then
										ls_col_count = string(m_menu_functions_menucascade.m_settings.m_windowbackgroundcolor.DropDown)							
										if upper(ls_col_count)='TRUE' then
											 dw_menuitem.setitem(1,'dropdown','Y')
										else
											 dw_menuitem.setitem(1,'dropdown','N')
										end if
									end if
							case 'fcolumn'
									if ib_menucascade and this.Menuid = m_menu_functions_menucascade then
										ls_col_count = string(m_menu_functions_menucascade.m_settings.m_windowbackgroundcolor.Columns)
										dw_menuitem.setitem(1,'fcolumn',ls_col_count)
									end if	
					      case 'item'						
					      case 'parentwindow'						
					      case 'shifttoright'
							      ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].ShiftToRight)							
							      if upper(ls_col_count)='TRUE' then
  								      dw_menuitem.setitem(1,'shifttoright','Y')
							      else
								     dw_menuitem.setitem(1,'shifttoright','N')
							      end if
					      case 'shortcut'
							      ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].ShortCut)
  							      dw_menuitem.setitem(1,'shortcut',ls_col_count)
					      case 'tag'
						         ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].Tag)
  							      dw_menuitem.setitem(1,'tag',ls_col_count)
					      case 'text'
						         ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].Text)
  							      dw_menuitem.setitem(1,'text',ls_col_count)
							case 'default'
						   	 ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].default)							
							    if upper(ls_col_count)='TRUE' then
  								 	 dw_menuitem.setitem(1,'default','Y')
								 else
								 	 dw_menuitem.setitem(1,'default','N')
								 end if
									  
		               end choose
        next	

        li_col_count = integer(dw_1.Object.DataWindow.Column.Count)

        for li_col_num = 1 to li_col_count step 1
    	      ls_name = dw_1.Describe('#'+string(li_col_num)+'.name')		 
		      choose case lower(ls_name)
					    case 'down'
						       ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].ToolbarItemDown)							
							    if upper(ls_col_count)='TRUE' then
  								    dw_1.setitem(1,'down','Y')
							    else
								    dw_1.setitem(1,'down','N')
							    end if
					     case 'downname'
							    ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].ToolbarItemDownName)							
							    dw_1.setitem(1,'downname',ls_col_count)
					     case 'barindex'
						 	    ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].ToolbarItemBarIndex)							
							    dw_1.setitem(1,'barindex',ls_col_count)
					     case 'name'
						       ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].ToolbarItemName)						
							    dw_1.setitem(1,'name',ls_col_count)							
					     case 'order'
						       ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].ToolbarItemOrder)
  							    dw_1.setitem(1,'order',ls_col_count)							
					     case 'space'						
						       ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].ToolbarItemSpace)
  							    dw_1.setitem(1,'space',ls_col_count)
					     case 'tbitext'
							    ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].ToolbarItemText)
  							    dw_1.setitem(1,'tbitext',ls_col_count)						
					     case 'tbivisible'
							    ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].ToolbarItemVisible)							
							    if upper(ls_col_count)='TRUE' then
  								    dw_1.setitem(1,'tbivisible','Y')
							    else
								    dw_1.setitem(1,'tbivisible','N')
							   end if
					     end choose
         next
		End If		
	Case 3  //Level 3		
		If ll_level1 > 0 And ll_level2 > 0 Then
			li_col_count = integer(dw_menuitem.Object.DataWindow.Column.Count)
			for li_col_num = 1 to li_col_count step 1
    			 ls_name = dw_menuitem.Describe('#'+string(li_col_num)+'.name')		 
				 choose case lower(ls_name)
						  case 'visible'
						   	 ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].visible)							
							    if upper(ls_col_count)='TRUE' then
  								 	 dw_menuitem.setitem(1,'visible','Y')
								 else
								 	 dw_menuitem.setitem(1,'visible','N')
								 end if
							case 'enabled'	
								  ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].Enabled)							
								  if upper(ls_col_count)='TRUE' then
  								     dw_menuitem.setitem(1,'enabled','Y')
							     else
								     dw_menuitem.setitem(1,'enabled','N')
							     end if
					      case 'checked'
						 	     ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].Checked)							
							     if upper(ls_col_count)='TRUE' then
  								     dw_menuitem.setitem(1,'checked','Y')
							     else
								     dw_menuitem.setitem(1,'checked','N')
										  end if
							case 'dropdown'
									if ib_menucascade and this.Menuid = m_menu_functions_menucascade then
										ls_col_count = string(m_menu_functions_menucascade.m_settings.m_windowbackgroundcolor.DropDown)							
										if upper(ls_col_count)='TRUE' then
											 dw_menuitem.setitem(1,'dropdown','Y')
										else
											 dw_menuitem.setitem(1,'dropdown','N')
										end if
									end if
							case 'fcolumn'
									if ib_menucascade and this.Menuid = m_menu_functions_menucascade then
										ls_col_count = string(m_menu_functions_menucascade.m_settings.m_windowbackgroundcolor.Columns)
										dw_menuitem.setitem(1,'dropdown',ls_col_count)
									end if							
					      case 'item'						
					      case 'parentwindow'						
					      case 'shifttoright'
							      ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].ShiftToRight)							
							      if upper(ls_col_count)='TRUE' then
  								      dw_menuitem.setitem(1,'shifttoright','Y')
							      else
								     dw_menuitem.setitem(1,'shifttoright','N')
							      end if
					      case 'shortcut'
							      ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].ShortCut)
  							      dw_menuitem.setitem(1,'shortcut',ls_col_count)
					      case 'tag'
						         ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].Tag)
  							      dw_menuitem.setitem(1,'tag',ls_col_count)
					      case 'text'
						         ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].Text)
  							      dw_menuitem.setitem(1,'text',ls_col_count)
							case 'default'
						   	 ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].default)							
							    if upper(ls_col_count)='TRUE' then
  								 	 dw_menuitem.setitem(1,'default','Y')
								 else
								 	 dw_menuitem.setitem(1,'default','N')
								 end if
									  
		               end choose
        next	

        li_col_count = integer(dw_1.Object.DataWindow.Column.Count)

        for li_col_num = 1 to li_col_count step 1
    	      ls_name = dw_1.Describe('#'+string(li_col_num)+'.name')		 
		      choose case lower(ls_name)
					    case 'down'
						       ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].ToolbarItemDown)							
							    if upper(ls_col_count)='TRUE' then
  								    dw_1.setitem(1,'down','Y')
							    else
								    dw_1.setitem(1,'down','N')
							    end if
					     case 'downname'
							    ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].ToolbarItemDownName)							
							    dw_1.setitem(1,'downname',ls_col_count)
					     case 'barindex'
						 	    ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].ToolbarItemBarIndex)							
							    dw_1.setitem(1,'barindex',ls_col_count)
					     case 'name'
						       ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].ToolbarItemName)						
							    dw_1.setitem(1,'name',ls_col_count)							
					     case 'order'
						       ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].ToolbarItemOrder)
  							    dw_1.setitem(1,'order',ls_col_count)							
					     case 'space'						
						       ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].ToolbarItemSpace)
  							    dw_1.setitem(1,'space',ls_col_count)
					     case 'tbitext'
							    ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].ToolbarItemText)
  							    dw_1.setitem(1,'tbitext',ls_col_count)						
					     case 'tbivisible'
							    ls_col_count = string(this.MenuID.item[ll_level1].item[ll_level2].item[ll_level3].ToolbarItemVisible)							
							    if upper(ls_col_count)='TRUE' then
  								    dw_1.setitem(1,'tbivisible','Y')
							    else
								    dw_1.setitem(1,'tbivisible','N')
							   end if
					     end choose
         next
		End If
		
End Choose

Return 1

end function

public subroutine wf_setitem (string as_item);treeviewitem l_tvi
long ll_tvi

tv_1.GetItem(ii_handle , l_tvi)
l_tvi.label = as_item
tv_1.SetItem( ii_handle, l_tvi )
end subroutine

public subroutine wf_mdi_resize (boolean ab_flag);//====================================================================
// Function: wf_mdi_resize()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
//	Arguments:   boolean  ab_flag
//--------------------------------------------------------------------
//	Returns:  (None)
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2004/10/14
//--------------------------------------------------------------------
// Modify History: 
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

if not isvalid(w_main_frame) then  return

if ab_flag then
	If	w_main_frame.tv_examples.Visible	Then
		w_main_frame.mdi_1.X = w_main_frame.tv_examples.X + w_main_frame.tv_examples.Width + 10
			
		w_main_frame.mdi_1.Y = 220
		w_main_frame.mdi_1.Width = w_main_frame.WorkSpaceWidth() - w_main_frame.tv_examples.Width - 20
		w_main_frame.mdi_1.Height =  w_main_frame.WorkSpaceHeight() - 80
		
		w_main_frame.ddplb_state.Y = w_main_frame.mdi_1.Y
		w_main_frame.tv_examples.Y = w_main_frame.ddplb_state.Y + 108
		w_main_frame.tv_examples.Height = w_main_frame.mdi_1.Height - 110
	else
		w_main_frame.mdi_1.X = w_main_frame.tv_examples.X
		w_main_frame.mdi_1.Y = 220
		w_main_frame.mdi_1.Width  = w_main_frame.WorkSpaceWidth() - 10
		w_main_frame.mdi_1.Height =  w_main_frame.WorkSpaceHeight() - 90
	end if
else
	If	w_main_frame.tv_examples.Visible	Then
		w_main_frame.mdi_1.X = w_main_frame.tv_examples.X + w_main_frame.tv_examples.Width + 10
			
		w_main_frame.mdi_1.Y = 110
		w_main_frame.mdi_1.Width = w_main_frame.WorkSpaceWidth() - w_main_frame.tv_examples.Width - 20
		w_main_frame.mdi_1.Height =  w_main_frame.WorkSpaceHeight() + 28

		w_main_frame.ddplb_state.Y = w_main_frame.mdi_1.Y
		w_main_frame.tv_examples.Y = w_main_frame.ddplb_state.Y + 108
		w_main_frame.tv_examples.Height = w_main_frame.mdi_1.Height - 110
	else
		w_main_frame.mdi_1.X = w_main_frame.tv_examples.X
		w_main_frame.mdi_1.Y = 110
		w_main_frame.mdi_1.Width  = w_main_frame.WorkSpaceWidth() - 10
		w_main_frame.mdi_1.Height =  w_main_frame.WorkSpaceHeight() + 20
	end if
end if
end subroutine

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: open script for w_menu_functions
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.x = 0
this.y = 0

// Save the window background color
il_ButtonFace = This.BackColor

/////////////////////////////////////////////////////////////////////
//	Create instances of the two menus used for this example
/////////////////////////////////////////////////////////////////////

this.PostEvent ('ue_open') 

end event

on w_menu_cascading.create
if this.MenuName = "m_menu_functions_menucascade" then this.MenuID = create m_menu_functions_menucascade
this.tv_1=create tv_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.mle_output=create mle_output
this.dw_menuitem=create dw_menuitem
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_toolbaritem=create gb_toolbaritem
this.gb_function=create gb_function
this.gb_3=create gb_3
this.Control[]={this.tv_1,&
this.dw_2,&
this.dw_1,&
this.mle_output,&
this.dw_menuitem,&
this.gb_2,&
this.gb_1,&
this.gb_toolbaritem,&
this.gb_function,&
this.gb_3}
end on

on w_menu_cascading.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tv_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.mle_output)
destroy(this.dw_menuitem)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_toolbaritem)
destroy(this.gb_function)
destroy(this.gb_3)
end on

event activate;wf_mdi_resize(True)
end event

event deactivate;wf_mdi_resize(False)
end event

type tv_1 from treeview within w_menu_cascading
integer x = 73
integer y = 64
integer width = 987
integer height = 1376
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event constructor;TreeViewItem  tv_item
long     ll_roothandle,ll_level2,ll_level3
integer  i,k,z
string   ls_temp,ls_data

//tv_item.SelectedPictureIndex = 3
tv_item.label = 'Menu'
tv_item.data = '0'
//tv_item.pictureindex = 1
ll_roothandle = tv_1.InsertItemLast(0,tv_item)

//tv_item.pictureindex = 2
for i = 1 to UpperBound(parent.menuid.item)
	ls_temp = parent.menuid.item[i].text
//	ls_name = topmenu.item[i].item
	ls_data = '1-' + string(i)
	tv_item.label = ls_temp
	tv_item.data  = ls_data
	tv_item.children = True
	ll_level2 = tv_1.InsertItemLast(ll_roothandle,tv_item)
	FOR k = 1 to UpperBound(Parent.Menuid.Item[i].Item)
		ls_temp = Parent.Menuid.Item[i].Item[k].Text
		tv_item.label = ls_temp
		ls_data = '2-' + string(i) + '-' + string(k)
		tv_item.data  = ls_data
		if i = 2 then 
			tv_item.children = False
		else
			tv_item.children = True
		end if
		ll_level3 = tv_1.InsertItemLast(ll_level2,tv_item)

		FOR z = 1 to UpperBound(Parent.Menuid.Item[i].Item[k].Item)
			ls_temp = Parent.Menuid.Item[i].Item[k].Item[z].Text
			tv_item.label = ls_temp
			ls_data = '3-' + string(i) + '-' + string(k) + '-' + string(z)
			tv_item.data  = ls_data
			tv_item.children = False
			tv_1.InsertItemLast(ll_level3,tv_item)
		
		NEXT
	NEXT
NEXT
this.ExpandItem(ll_roothandle)

end event

event clicked;treeviewitem  lv_item
long  ll_handle
string  ls_temp

ll_handle = this.GetItem(handle,lv_item)

ii_handle = handle
//messagebox("",string(lv_item.data))

ls_temp = string(lv_item.data)

is_menulevel = ls_temp
wf_display_menu(ls_temp)
choose case left(ls_temp,1)
	case '1'
		ii_cur_dw = 1
		if ib_menucascade = true then
			dw_menuitem.modify('fcolumn.visible= 0')
			dw_menuitem.modify('dropdown.visible = 0')
			dw_menuitem.modify('t_2.visible =  0')	
		end if		
		ib_menucascade = False
	case '2'
		ii_cur_dw = 2
		if parent.menuid = m_menu_functions_menucascade and ls_temp = '2-1-1' then
			dw_menuitem.modify('fcolumn.visible= 1')
//			dw_menuitem.modify('dropdown.visible =1')
			dw_menuitem.modify('t_2.visible = 1')
			ib_menucascade = true
		end if
	case '3'
		ii_cur_dw = 3
		ib_menucascade = false
	case else		
		return 1
end choose
end event

type dw_2 from datawindow within w_menu_cascading
integer x = 1170
integer y = 1088
integer width = 1390
integer height = 352
integer taborder = 110
string title = "none"
string dataobject = "d_menu_function"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//====================================================================
// Event: itemchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row 		
//		dwobject	dwo 		
//		string  	data		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
if this.GetColumnName() <> is_colname and len(is_colname) > 0 then
	this.setitem(row,is_colname,'N')
end if	
wf_change_menuitem (this, this.GetColumnName())
is_colname = this.GetColumnName()

end event

event losefocus;//====================================================================
// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnkillfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.AcceptText()
end event

type dw_1 from datawindow within w_menu_cascading
integer x = 1170
integer y = 576
integer width = 1280
integer height = 416
integer taborder = 30
string title = "none"
string dataobject = "d_menu_toolbaritem"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//====================================================================
// Event: itemchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row 		
//		dwobject	dwo 		
//		string  	data		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

choose case dwo.name
	case 'name'
		if data = '' or isnull(data) then return
		modify("p_1.filename = '" + data + "'")
end choose

wf_change_menuitem (this, this.GetColumnName())
is_colname = ''
end event

event losefocus;//====================================================================
// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnkillfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.AcceptText()
end event

type mle_output from multilineedit within w_menu_cascading
integer x = 73
integer y = 1536
integer width = 2487
integer height = 320
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_menuitem from datawindow within w_menu_cascading
integer x = 1170
integer y = 64
integer width = 1390
integer height = 416
integer taborder = 20
string dataobject = "d_menuitem_attributes"
boolean border = false
end type

event itemchanged;//====================================================================
// Event: itemchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		long    	row 		
//		dwobject	dwo 		
//		string  	data		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

wf_change_menuitem (this, this.GetColumnName())
if dwo.name <>'item' then
	this.post setitem(1,'item','N')
end if
if dwo.name <>'parentwindow' then
	this.post setitem(1,'parentwindow','N')
end if
is_colname = ''
end event

event losefocus;//====================================================================
// Event: losefocus()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_dwnkillfocus]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

this.AcceptText()
end event

type gb_2 from groupbox within w_menu_cascading
integer x = 1134
integer width = 1463
integer height = 512
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Menu Item"
end type

type gb_1 from groupbox within w_menu_cascading
integer x = 37
integer width = 1061
integer height = 1472
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Current Menu"
end type

type gb_toolbaritem from groupbox within w_menu_cascading
integer x = 1134
integer y = 512
integer width = 1463
integer height = 512
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Toolbar Item"
end type

type gb_function from groupbox within w_menu_cascading
integer x = 1134
integer y = 1024
integer width = 1463
integer height = 448
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Menu Function"
end type

type gb_3 from groupbox within w_menu_cascading
integer x = 37
integer y = 1472
integer width = 2560
integer height = 416
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Output"
end type

