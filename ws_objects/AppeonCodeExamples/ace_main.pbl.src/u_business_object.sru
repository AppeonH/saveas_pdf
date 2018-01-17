$PBExportHeader$u_business_object.sru
$PBExportComments$Base ancestor user object for implementing business rules
forward
global type u_business_object from nonvisualobject
end type
end forward

global type u_business_object from nonvisualobject
end type
global u_business_object u_business_object

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: determines if uf_init( ) has been called
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

datawindow   idw_parm

// determines if uf_init( ) has been called
Boolean   ib_initialized


end variables

forward prototypes
public subroutine uf_init (ref datawindow adw_parm)
public function long uf_retrieve ()
public function integer uf_delete_row (long al_row)
public function long uf_insert_row (long al_row)
public function integer uf_update ()
end prototypes

public subroutine uf_init (ref datawindow adw_parm);//====================================================================
// Function: uf_init()
//--------------------------------------------------------------------
// Description: Holds a reference to the DataWindow passed to this function
//--------------------------------------------------------------------
// Arguments: 
//		ref	datawindow	adw_parm		
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
idw_parm = adw_parm
ib_initialized = True


end subroutine

public function long uf_retrieve ();//====================================================================
// Function: uf_retrieve()
//--------------------------------------------------------------------
// Description: Retrieves the DataWindow
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Return idw_parm.Retrieve()


end function

public function integer uf_delete_row (long al_row);//====================================================================
// Function: uf_delete_row()
//--------------------------------------------------------------------
// Description: Deletes the row specified from the DataWindow.  If al_row = 0, the current row
//	will be deleted
//--------------------------------------------------------------------
// Arguments: 
//		long	al_row		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

Int		li_rc

If al_row >= 0 And al_row <= idw_parm.RowCount() Then
	li_rc = idw_parm.DeleteRow (al_row)
	idw_parm.SetFocus()
	Return li_rc
Else
	Return -1
End If




end function

public function long uf_insert_row (long al_row);//====================================================================
// Function: uf_insert_row()
//--------------------------------------------------------------------
// Description: Inserts a new row into the DataWindow.  If al_row = 0, the new row will be inserted
//		     after the last row.  Otherwise, the new row will be inserted prior to the value of al_row.
//--------------------------------------------------------------------
// Arguments: 
//		long	al_row		
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long	ll_rc


ll_rc = idw_parm.InsertRow (al_row)
If ll_rc > 0 Then
	idw_parm.ScrollToRow(ll_rc)
	idw_parm.SetFocus()
End If

Return ll_rc




end function

public function integer uf_update ();//====================================================================
// Function: uf_update()
//--------------------------------------------------------------------
// Description: Updates the DataWindow.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Int	li_rc


li_rc = idw_parm.UPDATE()
If li_rc = 1 Then
	COMMIT;
Else
	ROLLBACK;
End If

Return li_rc




end function

on u_business_object.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_business_object.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

