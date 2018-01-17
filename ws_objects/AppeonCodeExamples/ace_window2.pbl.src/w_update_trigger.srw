$PBExportHeader$w_update_trigger.srw
forward
global type w_update_trigger from window
end type
type st_2 from statictext within w_update_trigger
end type
type st_1 from statictext within w_update_trigger
end type
type st_trig1 from statictext within w_update_trigger
end type
type st_trig2 from statictext within w_update_trigger
end type
type cb_update from commandbutton within w_update_trigger
end type
type cb_close from commandbutton within w_update_trigger
end type
type dw_emp from datawindow within w_update_trigger
end type
type dw_dept from datawindow within w_update_trigger
end type
type ln_1a from line within w_update_trigger
end type
type ln_1b from line within w_update_trigger
end type
type ln_1c from line within w_update_trigger
end type
type ln_2a from line within w_update_trigger
end type
type ln_2b from line within w_update_trigger
end type
type ln_2c from line within w_update_trigger
end type
end forward

global type w_update_trigger from window
integer width = 2075
integer height = 1572
boolean titlebar = true
string title = "Update Trigger"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
st_1 st_1
st_trig1 st_trig1
st_trig2 st_trig2
cb_update cb_update
cb_close cb_close
dw_emp dw_emp
dw_dept dw_dept
ln_1a ln_1a
ln_1b ln_1b
ln_1c ln_1c
ln_2a ln_2a
ln_2b ln_2b
ln_2c ln_2c
end type
global w_update_trigger w_update_trigger

on w_update_trigger.create
this.st_2=create st_2
this.st_1=create st_1
this.st_trig1=create st_trig1
this.st_trig2=create st_trig2
this.cb_update=create cb_update
this.cb_close=create cb_close
this.dw_emp=create dw_emp
this.dw_dept=create dw_dept
this.ln_1a=create ln_1a
this.ln_1b=create ln_1b
this.ln_1c=create ln_1c
this.ln_2a=create ln_2a
this.ln_2b=create ln_2b
this.ln_2c=create ln_2c
this.Control[]={this.st_2,&
this.st_1,&
this.st_trig1,&
this.st_trig2,&
this.cb_update,&
this.cb_close,&
this.dw_emp,&
this.dw_dept,&
this.ln_1a,&
this.ln_1b,&
this.ln_1c,&
this.ln_2a,&
this.ln_2b,&
this.ln_2c}
end on

on w_update_trigger.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_trig1)
destroy(this.st_trig2)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.dw_emp)
destroy(this.dw_dept)
destroy(this.ln_1a)
destroy(this.ln_1b)
destroy(this.ln_1c)
destroy(this.ln_2a)
destroy(this.ln_2b)
destroy(this.ln_2c)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: open script for w_update_trigger
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_open]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

// To allow window to open faster, postevent to perform open operations
this.x = 0
this.y = 0
dw_dept.SetTransObject (SQLCA)
dw_emp.SetTransObject (SQLCA)

//Retrive the department datawindow
dw_dept.Retrieve()


end event

type st_2 from statictext within w_update_trigger
integer x = 41
integer y = 736
integer width = 343
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Employees:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_update_trigger
integer x = 41
integer y = 12
integer width = 471
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Departments:"
boolean focusrectangle = false
end type

type st_trig1 from statictext within w_update_trigger
integer x = 251
integer y = 580
integer width = 1070
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8421504
long backcolor = 74481808
string text = "Trigger will automatically update"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_trig2 from statictext within w_update_trigger
integer x = 306
integer y = 636
integer width = 905
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8421504
long backcolor = 74481808
string text = "the employee table."
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_update from commandbutton within w_update_trigger
integer x = 1673
integer y = 1200
integer width = 311
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Update"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: clicked script for cb_update
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update the departments DataWindow.  A trigger will fire that will automatically update the
// employees DataWindow.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Long	ll_cur_row, ll_dep_id

if dw_dept.Update() = 1 then
	commit;
	// Since we want to show the effects that the trigger had on the employee table, re-retrieve the
	// employees DataWindow.

	ll_cur_row = dw_dept.GetRow()
	if ll_cur_row > 0 then
		ll_dep_id = dw_dept.Object.dept_id[ll_cur_row]
		dw_emp.Retrieve (ll_dep_id)
	end if

else
	rollback;
end if

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Disable the update button and grey out the trigger help text
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

// Disable the update button
this.enabled = false

st_trig1.TextColor = 128
st_trig2.TextColor = 128

// Change arrows
ln_1a.LineColor = 128
ln_1b.LineColor = 128
ln_1c.LineColor = 128
ln_2a.LineColor = 128
ln_2b.LineColor = 128
ln_2c.LineColor = 128

end event

type cb_close from commandbutton within w_update_trigger
integer x = 1673
integer y = 1328
integer width = 311
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: clicked script for cb_close
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close (parent)
end event

type dw_emp from datawindow within w_update_trigger
integer x = 37
integer y = 812
integer width = 1586
integer height = 616
integer taborder = 20
string title = "none"
string dataobject = "d_emp_managed_by"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_dept from datawindow within w_update_trigger
integer x = 37
integer y = 80
integer width = 1586
integer height = 464
integer taborder = 10
string title = "none"
string dataobject = "d_departments_trigger"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;//====================================================================
// Event: editchanged()
//--------------------------------------------------------------------
// Description: editchanged script for dw_dept
//--------------------------------------------------------------------
// Arguments: 
//		value	long    	row 		
//		value	dwobject	dwo 		
//		value	string  	data		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnchanging]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// When data changes, enable the update button and change color of trigger help text
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Long		ll_Blue

// Enable update button
cb_update.enabled = true

// Bright blue color
ll_Blue = RGB(0, 0, 255)
st_trig1.TextColor = 255
st_trig2.TextColor = 255
// Blue arrows
ln_1a.LineColor = 255
ln_1b.LineColor = 255
ln_1c.LineColor = 255
ln_2a.LineColor = 255
ln_2b.LineColor = 255
ln_2c.LineColor = 255

end event

event itemchanged;//====================================================================
// Event: itemchanged()
//--------------------------------------------------------------------
// Description: itemchanged script for dw_dept
//--------------------------------------------------------------------
// Arguments: 
//		value	long    	row 		
//		value	dwobject	dwo 		
//		value	string  	data		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnitemchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Long		ll_Blue

// Enable update button
cb_update.enabled = true

// Bright blue color
ll_Blue = RGB(0, 0, 255)
st_trig1.TextColor = 255
st_trig2.TextColor = 255

// Blue arrows
ln_1a.LineColor = 255
ln_1b.LineColor = 255
ln_1c.LineColor = 255
ln_2a.LineColor = 255
ln_2b.LineColor = 255
ln_2c.LineColor = 255

end event

event rowfocuschanged;//====================================================================
// Event: rowfocuschanged()
//--------------------------------------------------------------------
// Description:  Retrieve the employees for the current department
//--------------------------------------------------------------------
// Arguments: 
//		value	long	currentrow		
//--------------------------------------------------------------------
// Returns: long [pbm_dwnrowchange]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long 	ll_dept_id

If currentrow > 0 then
	ll_dept_id = this.Object.dept_id[currentrow]
	dw_emp.Retrieve (ll_dept_id)
End If
end event

type ln_1a from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 13
integer beginx = 219
integer beginy = 564
integer endx = 219
integer endy = 696
end type

type ln_1b from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 10
integer beginx = 192
integer beginy = 640
integer endx = 219
integer endy = 696
end type

type ln_1c from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 10
integer beginx = 247
integer beginy = 640
integer endx = 219
integer endy = 696
end type

type ln_2a from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 13
integer beginx = 1371
integer beginy = 564
integer endx = 1371
integer endy = 696
end type

type ln_2b from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 10
integer beginx = 1339
integer beginy = 640
integer endx = 1367
integer endy = 696
end type

type ln_2c from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 10
integer beginx = 1399
integer beginy = 640
integer endx = 1376
integer endy = 696
end type

