$PBExportHeader$w_basesheet.srw
$PBExportComments$Generated MDI Base Sheet Window
forward
global type w_basesheet from window
end type
end forward

global type w_basesheet from window
integer x = 672
integer y = 264
integer width = 1582
integer height = 988
boolean titlebar = true
string title = "Sheet"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79416533
string icon = "pbex.ico"
integer toolbarwidth = 500
integer toolbarheight = 100
event ue_postopen ( )
event ue_undo ( )
event ue_cut ( )
event ue_copy ( )
event ue_paste ( )
event ue_clear ( )
end type
global w_basesheet w_basesheet

type variables
n_sheetmanager inv_sheetmgt
end variables

event ue_postopen();//*-----------------------------------------------------------------*/
//*    ue_postopen:  Set Sheet title and adjust menu for new sheets
//*-----------------------------------------------------------------*/
long ll_count
m_frame lm_menu

lm_menu = this.MenuId

/*  Obtain the number of instance of this class  */
ll_count = w_frame.of_ClassCount ( this )

this.Title = this.Tag + ":" + String ( ll_count  ) 

w_frame.of_AdjustMenu ( lm_menu )


end event

event open;//*-----------------------------------------------------------------*/
//*    open:  Post event
//*-----------------------------------------------------------------*/
this.Post Event ue_postopen ( )
end event

on w_basesheet.create
end on

on w_basesheet.destroy
end on

event close;//*-----------------------------------------------------------------*/
//*    close:  Remove sheet from the sheet manager array
//*-----------------------------------------------------------------*/
/*  Remove sheet from the array  */
w_frame.of_SheetIsClosing ( this ) 
end event

