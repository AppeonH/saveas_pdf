$PBExportHeader$n_sqlparse_sqlattrib.sru
$PBExportComments$(UFC)
forward
global type n_sqlparse_sqlattrib from nonvisualobject
end type
end forward

global type n_sqlparse_sqlattrib from nonvisualobject autoinstantiate
end type

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: define string
//--------------------------------------------------------------------
// Arguments: (none)
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
Public:

String s_verb
String s_tables
String s_columns
String s_values
String s_where
String s_order
String s_group
String s_having

end variables

on n_sqlparse_sqlattrib.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_sqlparse_sqlattrib.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

