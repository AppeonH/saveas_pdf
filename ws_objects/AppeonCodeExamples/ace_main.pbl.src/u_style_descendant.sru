$PBExportHeader$u_style_descendant.sru
$PBExportComments$Descendant of u_style_ancestor, which shows extending, overiding and dynamically calling ancestor script for the various pictures.
forward
global type u_style_descendant from u_style_ancestor
end type
end forward

global type u_style_descendant from u_style_ancestor
end type
global u_style_descendant u_style_descendant

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
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String    is_prev_text

end variables

on u_style_descendant.create
call super::create
end on

on u_style_descendant.destroy
call super::destroy
end on

type p_underline from u_style_ancestor`p_underline within u_style_descendant
end type

event p_underline::clicked;call super::clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Example of extending an ancestor script.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

long	ll_color

ll_color = sle_text.backcolor

sle_text.backcolor = sle_text.textcolor
sle_text.textcolor = ll_color


end event

type p_italic from u_style_ancestor`p_italic within u_style_descendant
end type

event p_italic::clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Example of CALLING an ancestor script.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if Upper (sle_text.text) <> 'PLEASE' then
	MessageBox ('Alert', 'Change the text to "please" first.')
	sle_text.SetFocus()
	sle_text.SelectText (1, LenA (sle_text.text))
else
	call super::clicked
end if


end event

type p_bold from u_style_ancestor`p_bold within u_style_descendant
end type

event p_bold::clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: Example of overriding an ancestor script.
// (This script will be executed instead of the ancestor script)
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_bnclicked]
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if this.picturename = "pb_b_up.jpg" then
	is_prev_text = sle_text.text
	this.picturename = "pb_b_dn.jpg"
	sle_text.text = 'Bold not allowed'
else
	this.picturename = "pb_b_up.jpg"
	sle_text.text = is_prev_text
end if



end event

type sle_text from u_style_ancestor`sle_text within u_style_descendant
string text = "u_style_descendant"
end type

