$PBExportHeader$w_scale.srw
$PBExportComments$Shows how to scan the control array of a window and then resize all of the controls on the window when the window is resized
forward
global type w_scale from window
end type
type cb_1 from commandbutton within w_scale
end type
type st_1 from statictext within w_scale
end type
type em_1 from editmask within w_scale
end type
type p_1 from picture within w_scale
end type
type cb_exit from commandbutton within w_scale
end type
type dw_freeform from datawindow within w_scale
end type
type gb_1 from groupbox within w_scale
end type
end forward

global type w_scale from window
integer x = 9
integer y = 132
integer width = 2501
integer height = 1820
boolean titlebar = true
string title = "Resizing Controls on a Window"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
st_1 st_1
em_1 em_1
p_1 p_1
cb_exit cb_exit
dw_freeform dw_freeform
gb_1 gb_1
end type
global w_scale w_scale

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

int ii_win_width, ii_win_height, ii_win_frame_w, ii_win_frame_h,&
    ii_dw_width,ii_dw_height,ii_dw_x,ii_dw_y,&
	 ii_cb_width,ii_cb_height,ii_cb_x,ii_cb_y,ii_cb_textsize,&
	 ii_gb_width,ii_gb_height,ii_gb_x,ii_gb_y,ii_gb_textsize,&
	 ii_p_width,ii_p_height,ii_p_x,ii_p_y,&
	 ii_em_width,ii_em_height,ii_em_x,ii_em_y,ii_em_textsize,&
	 ii_st_width,ii_st_height,ii_st_x,ii_st_y,ii_st_textsize

boolean ib_exec = false


end variables

forward prototypes
public function integer wf_size_it ()
public function integer wf_resize_it (double size_factor_x, double size_factor_y, double size_factor)
public function integer wf_resize_v (double size_factor)
public function integer wf_resize_h (double size_factor)
end prototypes

public function integer wf_size_it ();//====================================================================
// Function: wf_size_it()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

//save window size
ii_win_width  = this.width
ii_win_height = this.height
ii_win_frame_w = this.width - this.WorkSpaceWidth()
ii_win_frame_h = this.height - this.WorkSpaceHeight()
//save datawindow size
ii_dw_width = dw_freeform.width
ii_dw_height = dw_freeform.height
ii_dw_x = dw_freeform.x
ii_dw_y = dw_freeform.y
//save button size
ii_cb_width = cb_exit.width
ii_cb_height = cb_exit.height
ii_cb_x = cb_exit.x
ii_cb_y = cb_exit.y
ii_cb_textsize = cb_exit.textsize
//save groupbox size
ii_gb_width = gb_1.width
ii_gb_height = gb_1.height
ii_gb_x = gb_1.x
ii_gb_y = gb_1.y
ii_gb_textsize = gb_1.textsize
//save picture size
ii_p_width = p_1.width
ii_p_height = p_1.height
ii_p_x = p_1.x
ii_p_y = p_1.y

//save editmask size
ii_em_width = em_1.width
ii_em_height = em_1.height
ii_em_x = em_1.x
ii_em_y = em_1.y
ii_em_textsize = em_1.textsize

//save staticttext size
ii_st_width = st_1.width
ii_st_height = st_1.height
ii_st_x = st_1.x
ii_st_y = st_1.y
ii_st_textsize = st_1.textsize

return 1
end function

public function integer wf_resize_it (double size_factor_x, double size_factor_y, double size_factor);//====================================================================
// Function: wf_resize_it()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	double	size_factor_x		
//		value	double	size_factor_y		
//		value	double	size_factor  		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

int cnt,i,base

ib_exec = false // keep the function from being called recursively
this.hide()

// resize the window
this.width = ((  ii_win_width - ii_win_frame_w) * size_factor_x) + ii_win_frame_w

this.height = ((  ii_win_height - ii_win_frame_h) * size_factor_y) + ii_win_frame_h

//resize the datawindow
dw_freeform.x =ii_dw_x * size_factor_x 
dw_freeform.y =ii_dw_y * size_factor_y 
dw_freeform.width =ii_dw_width * size_factor_x 
dw_freeform.height = ii_dw_height * size_factor_y
dw_freeform.Object.DataWindow.zoom = string(int(size_factor*100))

//resize the commandbutton
cb_exit.x = ii_cb_x * size_factor_x
cb_exit.y = ii_cb_y * size_factor_y
cb_exit.width = ii_cb_width * size_factor_x
cb_exit.height = ii_cb_height * size_factor_y
cb_exit.textsize = ii_cb_textsize * size_factor
//resize the groupbox
gb_1.x = ii_gb_x * size_factor_x
gb_1.y = ii_gb_y * size_factor_y
gb_1.width = ii_gb_width * size_factor_x
gb_1.height = ii_gb_height * size_factor_y
gb_1.textsize = ii_gb_textsize * size_factor

//resize the picture
p_1.x = ii_p_x * size_factor_x
p_1.y = ii_p_y * size_factor_y
p_1.width = ii_p_width * size_factor_x
p_1.height = ii_p_height * size_factor_y

//resize the editmask
em_1.x = ii_em_x * size_factor_x
em_1.y = ii_em_y * size_factor_y
em_1.width = ii_em_width * size_factor_x
em_1.height = ii_em_height * size_factor_y
em_1.textsize = ii_em_textsize * size_factor

//resize then text
st_1.x = ii_st_x * size_factor_x
st_1.y = ii_st_y * size_factor_y
st_1.width = ii_st_width * size_factor_x
st_1.height = ii_st_height * size_factor_y
st_1.textsize = ii_st_textsize * size_factor

this.Show()
ib_exec = true
return 1
end function

public function integer wf_resize_v (double size_factor);//====================================================================
// Function: wf_resize_v()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	double	size_factor		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

int cnt,i,base

ib_exec = false // keep the function from being called recursively
this.hide()

// resize the window

this.height = ((  ii_win_height - ii_win_frame_h) * size_factor) + ii_win_frame_h

//resize the datawindow
dw_freeform.y =ii_dw_y * size_factor 
dw_freeform.height = ii_dw_height * size_factor
dw_freeform.Object.DataWindow.zoom = string(int(size_factor*100))

//resize the commandbutton
cb_exit.y = ii_cb_y * size_factor
cb_exit.height = ii_cb_height * size_factor
cb_exit.textsize = ii_cb_textsize * size_factor

//resize the groupbox
gb_1.y = ii_gb_y * size_factor
gb_1.height = ii_gb_height * size_factor
gb_1.textsize = ii_gb_textsize * size_factor

//resize the picture
p_1.y = ii_p_y * size_factor
p_1.height = ii_p_height * size_factor

//resize the editmask
em_1.y = ii_em_y * size_factor
em_1.height = ii_em_height * size_factor
em_1.textsize = ii_em_textsize * size_factor

//resize the text
st_1.y = ii_st_y * size_factor
st_1.height = ii_st_height * size_factor
st_1.textsize = ii_st_textsize * size_factor

this.Show()
ib_exec = true
return 1
end function

public function integer wf_resize_h (double size_factor);//====================================================================
// Function: wf_resize_h()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value	double	size_factor		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

int cnt,i,base

ib_exec = false // keep the function from being called recursively
this.hide()

// resize the window
this.width = ((  ii_win_width - ii_win_frame_w) * size_factor) + ii_win_frame_w

//resize the datawindow
dw_freeform.x =ii_dw_x * size_factor 
dw_freeform.width =ii_dw_width * size_factor 
dw_freeform.Object.DataWindow.zoom = string(int(size_factor*100))

//resize the commandbutton
cb_exit.x = ii_cb_x * size_factor
cb_exit.width = ii_cb_width * size_factor
cb_exit.textsize = ii_cb_textsize * size_factor

//resize the groupbox
gb_1.x = ii_gb_x * size_factor
gb_1.width = ii_gb_width * size_factor
gb_1.textsize = ii_gb_textsize * size_factor

//resize the picture
p_1.x = ii_p_x * size_factor
p_1.width = ii_p_width * size_factor

//resize the editmask
em_1.x = ii_em_x * size_factor
em_1.width = ii_em_width * size_factor
em_1.textsize = ii_em_textsize * size_factor

//resize the text
st_1.x = ii_st_x * size_factor
st_1.width = ii_st_width * size_factor
st_1.textsize = ii_st_textsize * size_factor

this.Show()
ib_exec = true
return 1
end function

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: open script for w_scale
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

////////////////////////////////////////////////////////////////////////////////////////////////////
// This example is included as more of an oddity than something that you would 
// want to put into a production application
////////////////////////////////////////////////////////////////////////////////////////////////////
int rc

this.x = 0
this.y = 0

dw_freeform.insertrow(0)

// save off the size data
rc = wf_size_it()
ib_exec = true




end event

event resize;//====================================================================
// Event: resize()
//--------------------------------------------------------------------
// Description: resize script for w_scale
//--------------------------------------------------------------------
// Arguments: 
//		value	unsignedlong	sizetype 		
//		value	integer     	newwidth 		
//		value	integer     	newheight		
//--------------------------------------------------------------------
// Returns: long [pbm_size]
//--------------------------------------------------------------------
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

double ratiow, ratio, ratioh
int rc
// recalculate the new ratios and then use the minimum
if ib_exec then  // Check to see if wf_resize_it is already running.
	ratioh = this.height /ii_win_height
	ratiow = this.width / ii_win_width
	
	if ratioh =1 then //resize on h
	   rc = wf_resize_h(ratiow)
	elseif ratiow =1 then //resize on v
		rc = wf_resize_v(ratioh)
	else
		ratio = min (ratioh, ratiow)
		rc = wf_resize_it(ratiow,ratioh,ratio)	
	end if
	
end if



end event

on w_scale.create
this.cb_1=create cb_1
this.st_1=create st_1
this.em_1=create em_1
this.p_1=create p_1
this.cb_exit=create cb_exit
this.dw_freeform=create dw_freeform
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.st_1,&
this.em_1,&
this.p_1,&
this.cb_exit,&
this.dw_freeform,&
this.gb_1}
end on

on w_scale.destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.p_1)
destroy(this.cb_exit)
destroy(this.dw_freeform)
destroy(this.gb_1)
end on

type cb_1 from commandbutton within w_scale
integer x = 1600
integer y = 1576
integer width = 338
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "saveas"
boolean cancel = true
end type

event clicked;dw_freeform.saveas( )
end event

type st_1 from statictext within w_scale
integer x = 27
integer y = 40
integer width = 2318
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "All the controls will automically resize along with change to the window size."
boolean focusrectangle = false
end type

type em_1 from editmask within w_scale
integer x = 658
integer y = 248
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "EditMask"
borderstyle borderstyle = stylelowered!
boolean autoskip = true
boolean spin = true
end type

type p_1 from picture within w_scale
integer x = 114
integer y = 188
integer width = 448
integer height = 256
string picturename = "ArrangeIcons!"
boolean focusrectangle = false
end type

type cb_exit from commandbutton within w_scale
integer x = 2075
integer y = 1572
integer width = 338
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
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
// Author: 	laihaichun		Date: 2004/01/02
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

close(parent)
end event

type dw_freeform from datawindow within w_scale
integer x = 37
integer y = 504
integer width = 2377
integer height = 1032
integer taborder = 100
string dataobject = "d_exteditemp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_scale
integer x = 32
integer y = 128
integer width = 2382
integer height = 340
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 74481808
string text = "Resize window"
end type

