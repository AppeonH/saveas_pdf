$PBExportHeader$testboldpdf.sra
$PBExportComments$Generated Application Object
forward
global type testboldpdf from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type testboldpdf from application
string appname = "testboldpdf"
end type
global testboldpdf testboldpdf

type prototypes
Function long ShellExecute (&
	long hWnd, &
	string lpOperation, &
	string lpFile, &
	string lpParameters, &
	string lpDirectory, &
	long nShowCmd) Library "shell32.dll" Alias for "ShellExecuteW"
end prototypes

on testboldpdf.create
appname="testboldpdf"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on testboldpdf.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;DataStore ds
String lsNull

ds = CREATE DataStore
ds.DataObject = "dw_test"
ds.InsertRow(0)
ds.Object.stuff[1] = "stuff"

ds.Object.DataWindow.Export.PDF.Method = NativePDF!
ds.SaveAs("test.pdf", PDF!, TRUE)

ds.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = True
ds.SaveAs("testUsePrintSpec.pdf", PDF!, TRUE)
MessageBox("Test", "About to open test.pdf in the Reader.~n~n" + &
				"Please go to File -> Properties and then the Fonts tab to see that only Arial is included, not Arial Bold.")
				 
SetNull(lsNull)
ShellExecute(0, "open", "test.pdf", lsNull, lsNull, 1 /* SW_SHOWNORMAL */)


ds.object.datawindow.export.pdf.method = distill!
ds.object.datawindow.printer = "Ghostscript PDF"
ds.object.datawindow.export.pdf.distill.custompostscript = 'Yes'

ds.SaveAs("testGhostscript.pdf", PDF!, TRUE)
ShellExecute(0, "open", "testGhostscript.pdf", lsNull, lsNull, 1 /* SW_SHOWNORMAL */)
if isvalid(ds) then destroy ds

end event

