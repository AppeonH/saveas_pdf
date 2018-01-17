forward
global type xslfo_to_pdf_conversion from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward


global type xslfo_to_pdf_conversion from application 
string appname = "xslfo_to_pdf_conversion"
string displayname = "Converter from XSL-FO to PDF"
string appicon = "E:\Program Files\Sybase\PowerBuilder 9.0\Code Examples\Example App\emp.ico"

end type

global xslfo_to_pdf_conversion xslfo_to_pdf_conversion

type variables

end variables

on xslfo_to_pdf_conversion.create
appname="xslfo_to_pdf_conversion"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on xslfo_to_pdf_conversion.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_convert_xslfo_pdf)
//open(w_1)

end event
