$PBExportHeader$nvo_datastore.sru
forward
global type nvo_datastore from datastore
end type
end forward

global type nvo_datastore from datastore
end type
global nvo_datastore nvo_datastore

type variables

PrivateRead PrivateWrite Boolean ib_previewSQL=FALSE
end variables

forward prototypes
public function boolean of_showsqlpreview (boolean ab_preview)
end prototypes

public function boolean of_showsqlpreview (boolean ab_preview);
Return ib_previewSql = ab_preview
end function

event dberror;

MessageBox('Error in DataStore : ' + This.dataObject , sqlerrtext)
Return 1
end event

event sqlpreview;

IF ib_previewSQL Then
	MessageBox('SQL - Datawindow' , sqlsyntax)
End IF
end event

on nvo_datastore.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_datastore.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

