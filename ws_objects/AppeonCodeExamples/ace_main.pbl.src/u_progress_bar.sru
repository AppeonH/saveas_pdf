$PBExportHeader$u_progress_bar.sru
$PBExportComments$Progress meter, similar to the ones found in the Setup programs.
forward
global type u_progress_bar from userobject
end type
type st_1 from statictext within u_progress_bar
end type
type rc_2 from rectangle within u_progress_bar
end type
end forward

global type u_progress_bar from userobject
boolean visible = false
integer width = 1774
integer height = 80
boolean border = true
long backcolor = 16777215
long tabtextcolor = 33554432
st_1 st_1
rc_2 rc_2
end type
global u_progress_bar u_progress_bar

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: Determines if the progress bar has touched the 
// percentage text
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

Boolean    ib_invert

end variables

forward prototypes
public subroutine uf_set_position (decimal ac_pct_complete)
end prototypes

public subroutine uf_set_position (decimal ac_pct_complete);//====================================================================
// Function: uf_set_position()
//--------------------------------------------------------------------
// Description: expands the progress meter and updates the percentage
//				to the percentage argument passed to this function
//--------------------------------------------------------------------
// Arguments: 
//		value	decimal	ac_pct_complete		
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

Long	ll_color


//////////////////////////////////////////////////////////////////////
// Reset instance variable and colors if progress meter has been restarted
//////////////////////////////////////////////////////////////////////
If Int (ac_pct_complete) = 0 Then
	ib_invert = False
	st_1.TextColor = RGB(0,0,255)
	st_1.BackColor = RGB(255,255,255)
End If


//////////////////////////////////////////////////////////////////////
// expand the progess bar
//////////////////////////////////////////////////////////////////////
rc_2.Width = ac_pct_complete / 100.0 * This.Width
rc_2.Visible = True

//////////////////////////////////////////////////////////////////////
// update the percentage text
//////////////////////////////////////////////////////////////////////
st_1.Text = String (ac_pct_complete / 100.0, "##0%")


//////////////////////////////////////////////////////////////////////
// check to see if the progress bar touches the percentage text.  
// If so, invert the percentage text colors.
//////////////////////////////////////////////////////////////////////
If Not ib_invert Then
	If rc_2.Width >= st_1.X Then
		ib_invert = True
		ll_color = st_1.TextColor
		st_1.TextColor = st_1.BackColor
		st_1.BackColor = ll_color
	End If
End If

end subroutine

on u_progress_bar.create
this.st_1=create st_1
this.rc_2=create rc_2
this.Control[]={this.st_1,&
this.rc_2}
end on

on u_progress_bar.destroy
destroy(this.st_1)
destroy(this.rc_2)
end on

event constructor;long ll_Width

ll_Width = long(Message.StringParm)
rc_2.Width = this.Width * (ll_Width / 100)
st_1.Text = (Message.StringParm) + "%"
end event

type st_1 from statictext within u_progress_bar
integer x = 768
integer y = 4
integer width = 146
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 16777215
string text = "0%"
alignment alignment = center!
long bordercolor = 16711680
boolean focusrectangle = false
end type

type rc_2 from rectangle within u_progress_bar
long linecolor = 16711680
integer linethickness = 1
long fillcolor = 16711680
integer width = 37
integer height = 128
end type

