$PBExportHeader$uo_saveas.sru
forward
global type uo_saveas from commandbutton
end type
end forward

global type uo_saveas from commandbutton
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "saveas"
end type
global uo_saveas uo_saveas

forward prototypes
public function integer of_saveas (datawindow adw, boolean ab_pb)
end prototypes

public function integer of_saveas (datawindow adw, boolean ab_pb);if ab_pb then
	adw.object.datawindow.export.pdf.method = distill!
	adw.object.datawindow.printer = "Ghostscript PDF"
	adw.object.datawindow.export.pdf.distill.custompostscript = 'Yes'
	adw.saveas("",PDF!, true)
else	
	adw.object.datawindow.export.pdf.method = NativePDF!
	adw.saveas("",PDF!, true)
end if

return 1
end function

on uo_saveas.create
end on

on uo_saveas.destroy
end on

