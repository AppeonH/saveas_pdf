$PBExportHeader$u_object.sru
forward
global type u_object from nonvisualobject
end type
end forward

global type u_object from nonvisualobject
end type
global u_object u_object

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: define string.
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

String is_test
end variables

forward prototypes
public function integer of_set (string as_data)
public function string of_get ()
end prototypes

public function integer of_set (string as_data);//====================================================================
// Function: of_set()
//--------------------------------------------------------------------
// Description: set data.
//--------------------------------------------------------------------
// Arguments: 
//		value	string	as_data		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

This.is_test = as_data
Return 1

end function

public function string of_get ();//====================================================================
// Function: of_get()
//--------------------------------------------------------------------
// Description: return data.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Return is_test

end function

on u_object.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_object.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

