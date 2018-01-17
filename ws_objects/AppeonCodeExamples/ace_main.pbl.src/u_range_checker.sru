$PBExportHeader$u_range_checker.sru
$PBExportComments$Single line edit which accepts numeric input within a specific range
forward
global type u_range_checker from singlelineedit
end type
end forward

global type u_range_checker from singlelineedit
integer width = 663
integer height = 88
integer taborder = 1
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type
global u_range_checker u_range_checker

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: init variables.
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

Long    il_lower = 0, il_upper = 100

end variables

forward prototypes
public subroutine uf_set_range (long al_lower, long al_upper)
end prototypes

public subroutine uf_set_range (long al_lower, long al_upper);//====================================================================
// Function: uf_set_range()
//--------------------------------------------------------------------
// Description: sets the lower and upper limits that are valid for input
//
//--------------------------------------------------------------------
// Arguments: 
//		value	long	al_lower		
//		value	long	al_upper		
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


il_lower = al_lower
il_upper = al_upper

end subroutine

event modified;//====================================================================
// Event: modified()
//--------------------------------------------------------------------
// Description: Disallow numbers that are not in the valid range 
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_enmodified]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

If LenA (This.Text) > 0 Then
	If Not IsNumber (This.Text) Then
		This.Text = "Invalid number"
		This.SelectText (1, LenA (This.Text))
	Else
		If Dec (This.Text) < il_lower Or Dec (This.Text) > il_upper Then
			This.Text = "Number out of valid range"
			This.SelectText (1, LenA (This.Text))
		End If
	End If
End If

end event

on u_range_checker.create
end on

on u_range_checker.destroy
end on

