$PBExportHeader$qrproblem.sra
$PBExportComments$Generated SDI Application Object
forward
global type qrproblem from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

end variables
global type qrproblem from application
string appname = "qrproblem"
end type
global qrproblem qrproblem

type prototypes
// QR codes
subroutine GenerateBMPA( ref  string fileName, ref string text, integer margin, integer size, integer ErrorCorrectionLevel ) library 'quricol32.dll' Alias For "GenerateBMPA;Ansi"
subroutine GeneratePNGA( ref  string fileName, ref string text, integer margin, integer size, integer ErrorCorrectionLevel ) library 'quricol32.dll' Alias For "GeneratePNGA;Ansi"

end prototypes

on qrproblem.create
appname="qrproblem"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on qrproblem.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//*-----------------------------------------------------------------*/
//*    open:  Application Open Script
//*           1) Opens Main window
//*-----------------------------------------------------------------*/
Open ( w_qrproblem_main ) 
end event

