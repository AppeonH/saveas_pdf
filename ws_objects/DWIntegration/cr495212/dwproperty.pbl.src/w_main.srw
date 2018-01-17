$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_silktest from commandbutton within w_main
end type
type cb_test_verify from commandbutton within w_main
end type
type cb_testall from commandbutton within w_main
end type
type cb_other from commandbutton within w_main
end type
type cb_ole from commandbutton within w_main
end type
type cb_groupbox from commandbutton within w_main
end type
type cb_blob from commandbutton within w_main
end type
type cb_bitmap from commandbutton within w_main
end type
type cb_report from commandbutton within w_main
end type
type cb_graph from commandbutton within w_main
end type
type mle_1 from multilineedit within w_main
end type
type st_2 from statictext within w_main
end type
type st_1 from statictext within w_main
end type
type cb_button from commandbutton within w_main
end type
type cb_computedfield from commandbutton within w_main
end type
type cb_text from commandbutton within w_main
end type
type cb_datawindow from commandbutton within w_main
end type
type cb_column from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 3502
integer height = 3312
boolean titlebar = true
string title = "DataWindow properties testing"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_silktest cb_silktest
cb_test_verify cb_test_verify
cb_testall cb_testall
cb_other cb_other
cb_ole cb_ole
cb_groupbox cb_groupbox
cb_blob cb_blob
cb_bitmap cb_bitmap
cb_report cb_report
cb_graph cb_graph
mle_1 mle_1
st_2 st_2
st_1 st_1
cb_button cb_button
cb_computedfield cb_computedfield
cb_text cb_text
cb_datawindow cb_datawindow
cb_column cb_column
end type
global w_main w_main

type variables
string is_property_modify
string is_property_name
string is_property_value
string is_property_expected
string is_control_name
datastore dw_1 , dw_2
end variables

forward prototypes
public subroutine wf_datawindow_table ()
public subroutine wf_datawindow_crosstab ()
public subroutine wf_datawindow_grid ()
public subroutine wf_datawindow_group ()
public subroutine wf_datawindow_label ()
public subroutine wf_datawindow_nup ()
public subroutine wf_datawindow_ole ()
public subroutine wf_datawindow_richtext ()
public subroutine wf_datawindow_gen3 ()
public subroutine wf_datawindow_gen1 ()
public subroutine wf_datawindow_gen2 ()
public subroutine wf_column_dddw ()
public subroutine wf_column_ddlb ()
public subroutine wf_column_rb ()
public subroutine wf_column_editmask ()
public subroutine wf_column_edit ()
public subroutine wf_column_checkbox ()
public subroutine wf_graph_pie_dispattr ()
public subroutine wf_graph_legend_dispattr ()
public subroutine wf_graph_title_dispattr ()
public subroutine wf_graph_series_dispattr ()
public subroutine wf_graph_values_dispattr ()
public subroutine wf_graph_category_dispattr ()
public subroutine wf_graph_category ()
public subroutine wf_graph_series ()
public subroutine wf_graph_values ()
public subroutine wf_graph_gen ()
public subroutine wf_oval ()
public subroutine wf_rectangle ()
public subroutine wf_line ()
public subroutine wf_roundrectangle ()
public subroutine wf_create ()
public subroutine wf_destroy ()
public subroutine wf_table_old ()
public subroutine wf_table ()
public subroutine wf_other ()
end prototypes

public subroutine wf_datawindow_table ();string ls_rtv ,tmp

//table.arguments 
if dw_1.Describe("datawindow.table.arguments") = dw_1.object.datawindow.table.arguments then 
	mle_1.text += "Succeed ! DataWindow Control table.arguments ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.arguments ~r~n"
end if 

//table.columns 
if dw_1.Describe("datawindow.table.columns") = dw_1.object.datawindow.table.columns then 
	mle_1.text += "Succeed ! DataWindow Control table.columns ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.columns ~r~n"
end if 

//table.crosstabdata , for crosstab dw

//table.data.storage 
dw_1.object.datawindow.table.data.storage = "Disk"
ls_rtv = dw_1.Modify("datawindow.table.data.storage='Memory'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control table.data.storage  ~r~n"
elseif dw_1.describe("datawindow.table.data.storage") = dw_1.object.datawindow.table.data.storage  then 
	mle_1.text += "Succeed ! DataWindow Control table.data.storage  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.data.storage ~r~n"
end if 


//table.filter 
dw_1.object.datawindow.table.filter = "salary>50000"
ls_rtv = dw_1.Modify("datawindow.table.filter='salary>50000'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control table.filter  ~r~n"
elseif dw_1.describe("datawindow.table.filter") = dw_1.object.datawindow.table.filter  then 
	mle_1.text += "Succeed ! DataWindow Control table.filter  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.filter ~r~n"
end if 

//table.gridcolumns 

//table.select 
dw_1.object.datawindow.table.select = "select * from employee where dept_id = 100"
ls_rtv = dw_1.Modify("datawindow.table.select='select * from employee where emp_id < 1000'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control table.select  ~r~n"
elseif dw_1.describe("datawindow.table.select") = dw_1.object.datawindow.table.select  then 
	mle_1.text += "Succeed ! DataWindow Control table.select  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.select ~r~n"
end if 

//table.select.attribute 
if dw_1.Describe("datawindow.table.select.attribute") = dw_1.object.datawindow.table.select.attribute then 
	mle_1.text += "Succeed ! DataWindow Control table.select.attribute ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.select.attribute ~r~n"
end if 

//table.sort 
dw_1.object.datawindow.table.sort = "dept_id A"
ls_rtv = dw_1.Modify("datawindow.table.sort='dept_id D'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control table.sort  ~r~n"
elseif dw_1.describe("datawindow.table.sort") = dw_1.object.datawindow.table.sort  then 
	mle_1.text += "Succeed ! DataWindow Control table.sort  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.sort ~r~n"
end if 

//table.sqlselect 
if dw_1.Describe("datawindow.table.sqlselect") = dw_1.object.datawindow.table.sqlselect then 
	mle_1.text += "Succeed ! DataWindow Control table.sqlselect ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.sqlselect ~r~n"
end if 

//table.updatekeyinplace 
dw_1.object.datawindow.table.updatekeyinplace = "Yes"
ls_rtv = dw_1.Modify("datawindow.table.updatekeyinplace='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control table.updatekeyinplace  ~r~n"
elseif dw_1.describe("datawindow.table.updatekeyinplace") = dw_1.object.datawindow.table.updatekeyinplace  then 
	mle_1.text += "Succeed ! DataWindow Control table.updatekeyinplace  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.updatekeyinplace ~r~n"
end if 

//table.updatetable 
dw_1.object.datawindow.table.updatetable = "employee"
ls_rtv = dw_1.Modify("datawindow.table.updatetable='employee'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control table.updatetable  ~r~n"
elseif dw_1.describe("datawindow.table.updatetable") = dw_1.object.datawindow.table.updatetable  then 
	mle_1.text += "Succeed ! DataWindow Control table.updatetable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.updatetable ~r~n"
end if 

//table.updatewhere 
dw_1.object.datawindow.table.updatewhere = "0"
dw_1.object.datawindow.table.updatewhere = "1"
ls_rtv = dw_1.Modify("datawindow.table.updatewhere='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control table.updatewhere  ~r~n"
elseif dw_1.describe("datawindow.table.updatewhere") = dw_1.object.datawindow.table.updatewhere  then 
	mle_1.text += "Succeed ! DataWindow Control table.updatewhere  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.updatewhere ~r~n"
end if 


dw_1.dataobject = 'd_tabular_sp'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve(100)

//table.procedure 

dw_1.object.datawindow.table.procedure = "1 Execute dw_property_test;1 @id=100"
ls_rtv = dw_1.Modify("datawindow.table.procedure='1 Execute dw_property_test;1 @id=100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control table.procedure" + ls_rtv +  "~r~n"
elseif dw_1.describe("datawindow.table.procedure") = dw_1.object.datawindow.table.procedure  then 
	mle_1.text += "Succeed ! DataWindow Control table.procedure  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.procedure ~r~n"
end if 

//table.delete.arguments 
//dw_1.object.datawindow.table.delete.arguments = "((~"id~",column=(~"id~",orig,in)))"
//ls_rtv = dw_1.Modify("DataWindow.Table.Delete.Arguments=((~"id~",column=(~"id~",new,in)))")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Table.Delete.Arguments  ~r~n"
elseif dw_1.describe("DataWindow.Table.Delete.Arguments") = dw_1.object.DataWindow.Table.Delete.Arguments  then 
	mle_1.text += "Succeed ! DataWindow Control Table.Delete.Arguments  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Table.Delete.Arguments ~r~n"
end if 
//
//table.delete.method 
dw_1.object.datawindow.table.delete.method = "dw_property_test"
ls_rtv = dw_1.Modify("DataWindow.Table.Delete.method=~"dw_property_test~"")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Table.Delete.method  ~r~n"
elseif dw_1.describe("DataWindow.Table.Delete.method") = dw_1.object.DataWindow.Table.Delete.method  then 
	mle_1.text += "Succeed ! DataWindow Control Table.Delete.method  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Table.Delete.method ~r~n"
end if 
//
//table.delete.type 
//dw_1.object.datawindow.table.delete.type = "SP"
//ls_rtv = dw_1.Modify("DataWindow.Table.Delete.type=sp")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Table.Delete.type  ~r~n"
elseif dw_1.describe("DataWindow.Table.Delete.type") = dw_1.object.DataWindow.Table.Delete.type  then 
	mle_1.text += "Succeed ! DataWindow Control Table.Delete.type  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Table.Delete.type ~r~n"
end if 

//table.insert.arguments 
//dw_1.object.datawindow.table.insert.arguments = "((~"id~",column=(~"id~",new,in)))"
//ls_rtv = dw_1.Modify("DataWindow.Table.insert.Arguments=((~"id~",column=(~"id~",orig,out)))")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Table.insert.Arguments  ~r~n"
elseif dw_1.describe("DataWindow.Table.insert.Arguments") = dw_1.object.DataWindow.Table.insert.Arguments  then 
	mle_1.text += "Succeed ! DataWindow Control Table.insert.Arguments  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Table.insert.Arguments ~r~n"
end if 
//
//table.insert.method 
dw_1.object.datawindow.table.insert.method = "dw_property_test"
ls_rtv = dw_1.Modify("DataWindow.Table.insert.method=~"dw_property_test~"")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Table.insert.method  ~r~n"
elseif dw_1.describe("DataWindow.Table.insert.method") = dw_1.object.DataWindow.Table.insert.method  then 
	mle_1.text += "Succeed ! DataWindow Control Table.insert.method  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Table.insert.method ~r~n"
end if 
//
//table.insert.type 
//dw_1.object.datawindow.table.insert.type = "SP"
//ls_rtv = dw_1.Modify("DataWindow.Table.insert.type=sp")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Table.insert.type  ~r~n"
elseif dw_1.describe("DataWindow.Table.insert.type") = dw_1.object.DataWindow.Table.insert.type  then 
	mle_1.text += "Succeed ! DataWindow Control Table.insert.type  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Table.insert.type ~r~n"
end if 

//table.update.arguments 
//dw_1.object.datawindow.table.update.arguments = "((~"id~",column=(~"id~",new,in)))"
//ls_rtv = dw_1.Modify("DataWindow.Table.update.Arguments=((~"id~",column=(~"id~",new,inout)))")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Table.update.Arguments  ~r~n"
elseif dw_1.describe("DataWindow.Table.update.Arguments") = dw_1.object.DataWindow.Table.update.Arguments  then 
	mle_1.text += "Succeed ! DataWindow Control Table.update.Arguments  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Table.update.Arguments ~r~n"
end if 
//
//table.update.method 
dw_1.object.datawindow.table.update.method = "dw_property_test"
ls_rtv = dw_1.Modify("DataWindow.Table.update.method=~"dw_property_test~"")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Table.update.method  ~r~n"
elseif dw_1.describe("DataWindow.Table.update.method") = dw_1.object.DataWindow.Table.update.method  then 
	mle_1.text += "Succeed ! DataWindow Control Table.update.method  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Table.update.method ~r~n"
end if 

//table.update.type 
//dw_1.object.datawindow.table.update.type = "SP"
//ls_rtv = dw_1.Modify("DataWindow.Table.update.type=sp")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Table.update.type  ~r~n"
elseif dw_1.describe("DataWindow.Table.update.type") = dw_1.object.DataWindow.Table.update.type  then 
	mle_1.text += "Succeed ! DataWindow Control Table.update.type  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Table.update.type ~r~n"
end if 

dw_1.dataobject = 'd_tabular_emp'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve(200)
end subroutine

public subroutine wf_datawindow_crosstab ();string ls_rtv

dw_1.dataobject = 'd_crosstab'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//crosstab.columns 
dw_1.object.datawindow.crosstab.columns = "sex"
ls_rtv = dw_1.Modify("datawindow.crosstab.columns='sex'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control crosstab.columns  ~r~n"
elseif dw_1.describe("datawindow.crosstab.columns") = dw_1.object.datawindow.crosstab.columns  then 
	mle_1.text += "Succeed ! DataWindow Control crosstab.columns  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control crosstab.columns ~r~n"
end if 

//crosstab.rows 
dw_1.object.datawindow.crosstab.rows = "state"
ls_rtv = dw_1.Modify("datawindow.crosstab.rows='state'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control crosstab.rows  ~r~n"
elseif dw_1.describe("datawindow.crosstab.rows") = dw_1.object.datawindow.crosstab.rows  then 
	mle_1.text += "Succeed ! DataWindow Control crosstab.rows  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control crosstab.rows ~r~n"
end if 

//crosstab.sourcenames 
dw_1.object.datawindow.crosstab.sourcenames = "dept_id , state, sex , salary , city "
ls_rtv = dw_1.Modify("datawindow.crosstab.sourcenames='dept_id , state, sex , salary , city'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control crosstab.sourcenames  ~r~n"
elseif dw_1.describe("datawindow.crosstab.sourcenames") = dw_1.object.datawindow.crosstab.sourcenames  then 
	mle_1.text += "Succeed ! DataWindow Control crosstab.sourcenames  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control crosstab.sourcenames ~r~n"
end if 

//crosstab.staticmode 
dw_1.object.datawindow.crosstab.staticmode = "No"
ls_rtv = dw_1.Modify("datawindow.crosstab.staticmode='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control crosstab.staticmode  ~r~n"
elseif dw_1.describe("datawindow.crosstab.staticmode") = dw_1.object.datawindow.crosstab.staticmode  then 
	mle_1.text += "Succeed ! DataWindow Control crosstab.staticmode  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control crosstab.staticmode ~r~n"
end if 

//crosstab.values 
dw_1.object.datawindow.crosstab.values = "sum(salary for crosstab)"
ls_rtv = dw_1.Modify("datawindow.crosstab.values='sum(salary for crosstab)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control crosstab.values  ~r~n"
elseif dw_1.describe("datawindow.crosstab.values") = dw_1.object.datawindow.crosstab.values  then 
	mle_1.text += "Succeed ! DataWindow Control crosstab.values  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control crosstab.values ~r~n"
end if 

//help.typeid.setcrosstab 
dw_1.object.datawindow.help.typeid.setcrosstab = "CrosstabDialog method (DataWindows)"
ls_rtv = dw_1.Modify("datawindow.help.typeid.setcrosstab='CrosstabDialog method (DataWindows)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.typeid.setcrosstab  ~r~n"
elseif dw_1.describe("datawindow.help.typeid.setcrosstab") = dw_1.object.datawindow.help.typeid.setcrosstab  then 
	mle_1.text += "Succeed ! DataWindow Control help.typeid.setcrosstab  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.typeid.setcrosstab ~r~n"
end if 

//row.resize 
dw_1.object.datawindow.row.resize = "0"
ls_rtv = dw_1.Modify("datawindow.row.resize=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control row.resize  ~r~n"
elseif dw_1.describe("datawindow.row.resize") = dw_1.object.datawindow.row.resize  then 
	mle_1.text += "Succeed ! DataWindow Control row.resize  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control row.resize ~r~n"
end if 

//selected.mouse , it's for grid or crosstab
dw_1.object.datawindow.selected.mouse = "Yes"
ls_rtv = dw_1.Modify("datawindow.selected.mouse='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control selected.mouse  ~r~n"
elseif dw_1.describe("datawindow.selected.mouse") = dw_1.object.datawindow.selected.mouse  then 
	mle_1.text += "Succeed ! DataWindow Control selected.mouse  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control selected.mouse ~r~n"
end if 

//table.crosstabdata 
dw_1.object.datawindow.table.crosstabdata = "F	M"
ls_rtv = dw_1.Modify("datawindow.table.crosstabdata='F	M'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control table.crosstabdata  ~r~n"
elseif dw_1.describe("datawindow.table.crosstabdata") = dw_1.object.datawindow.table.crosstabdata  then 
	mle_1.text += "Succeed ! DataWindow Control table.crosstabdata  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.crosstabdata ~r~n"
end if 

end subroutine

public subroutine wf_datawindow_grid ();string ls_rtv 

dw_1.dataobject = 'd_grid'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//for grid dw
//grid.columnmove 
dw_1.object.datawindow.grid.columnmove = "No"
ls_rtv = dw_1.Modify("datawindow.grid.columnmove='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control grid.columnmove  ~r~n"
elseif dw_1.describe("datawindow.grid.columnmove") = dw_1.object.datawindow.grid.columnmove  then 
	mle_1.text += "Succeed ! DataWindow Control grid.columnmove  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control grid.columnmove ~r~n"
end if 

//grid.lines 
dw_1.object.datawindow.grid.lines = "0"
dw_1.object.datawindow.grid.lines = "1"
dw_1.object.datawindow.grid.lines = "2"
ls_rtv = dw_1.Modify("datawindow.grid.lines='3'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control grid.lines  ~r~n"
elseif dw_1.describe("datawindow.grid.lines") = dw_1.object.datawindow.grid.lines  then 
	mle_1.text += "Succeed ! DataWindow Control grid.lines  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control grid.lines ~r~n"
end if 

//row.resize 
dw_1.object.datawindow.row.resize = "0"
ls_rtv = dw_1.Modify("datawindow.row.resize='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control row.resize  ~r~n"
elseif dw_1.describe("datawindow.row.resize") = dw_1.object.datawindow.row.resize  then 
	mle_1.text += "Succeed ! DataWindow Control row.resize  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control row.resize ~r~n"
end if 

//selected.mouse , it's for grid or crosstab
dw_1.object.datawindow.selected.mouse = "Yes"
ls_rtv = dw_1.Modify("datawindow.selected.mouse='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control selected.mouse  ~r~n"
elseif dw_1.describe("datawindow.selected.mouse") = dw_1.object.datawindow.selected.mouse  then 
	mle_1.text += "Succeed ! DataWindow Control selected.mouse  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control selected.mouse ~r~n"
end if 

//table.gridcolumns 

if dw_1.Describe("datawindow.table.gridcolumns") = dw_1.object.datawindow.table.gridcolumns then 
	mle_1.text += "Succeed ! DataWindow Control table.gridcolumns ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control table.gridcolumns ~r~n"
end if 

end subroutine

public subroutine wf_datawindow_group ();string ls_rtv 

dw_1.dataobject = 'd_group_emp'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//for group dw
//header , for group , header.#1.*
//header.color
ls_rtv = dw_1.Modify( "datawindow.header.1.Color='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control header.1.Color ~r~n"
elseif dw_1.describe("datawindow.header.1.Color") = '255' then 
	mle_1.text += "Succeed ! DataWindow Control header.1.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control header.1.Color ~r~n"
end if 

//header.height 
ls_rtv = dw_1.Modify( "datawindow.header.1.height=140")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control header.1.height ~r~n"
elseif dw_1.describe("datawindow.header.1.height") = '140' then 
	mle_1.text += "Succeed ! DataWindow Control header.1.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control header.1.height ~r~n"
end if 

//header.pointer 
ls_rtv = dw_1.Modify( "datawindow.header.1.Pointer='hand.cur'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control header.1.pointer ~r~n"
elseif dw_1.describe("datawindow.header.1.pointer") = 'hand.cur' then 
	mle_1.text += "Succeed ! DataWindow Control header.1.pointer ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control header.1.pointer ~r~n"
end if 

//trailer 
//trailer.color
ls_rtv = dw_1.Modify( "datawindow.trailer.1.Color='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control trailer.1.Color ~r~n"
elseif dw_1.describe("datawindow.trailer.1.Color") = '255' then 
	mle_1.text += "Succeed ! DataWindow Control trailer.1.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control trailer.1.Color ~r~n"
end if 

//trailer.height 
ls_rtv = dw_1.Modify( "datawindow.trailer.1.height=140")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control trailer.1.height ~r~n"
elseif dw_1.describe("datawindow.trailer.1.height") = '140' then 
	mle_1.text += "Succeed ! DataWindow Control trailer.1.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control trailer.1.height ~r~n"
end if 

//trailer.pointer 
ls_rtv = dw_1.Modify( "datawindow.trailer.1.Pointer='hand.cur'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control trailer.1.pointer ~r~n"
elseif dw_1.describe("datawindow.trailer.1.pointer") = 'hand.cur' then 
	mle_1.text += "Succeed ! DataWindow Control trailer.1.pointer ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control trailer.1.pointer ~r~n"
end if 


//hidegrayline 
dw_1.object.datawindow.hidegrayline = "No"
ls_rtv = dw_1.Modify("datawindow.hidegrayline='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control hidegrayline  ~r~n"
elseif dw_1.describe("datawindow.hidegrayline") = dw_1.object.datawindow.hidegrayline  then 
	mle_1.text += "Succeed ! DataWindow Control hidegrayline  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control hidegrayline ~r~n"
end if 

end subroutine

public subroutine wf_datawindow_label ();string ls_rtv 

dw_1.dataobject = 'd_label'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//for label dw
//label.columns 
dw_1.object.datawindow.label.columns = "2"
ls_rtv = dw_1.Modify("datawindow.label.columns='3'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.columns  ~r~n"
elseif dw_1.describe("datawindow.label.columns") = dw_1.object.datawindow.label.columns  then 
	mle_1.text += "Succeed ! DataWindow Control label.columns  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.columns ~r~n"
end if 

//label.columns.spacing 
dw_1.object.datawindow.label.columns.spacing = "100"
ls_rtv = dw_1.Modify("datawindow.label.columns.spacing='150'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.columns.spacing  ~r~n"
elseif dw_1.describe("datawindow.label.columns.spacing") = dw_1.object.datawindow.label.columns.spacing  then 
	mle_1.text += "Succeed ! DataWindow Control label.columns.spacing  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.columns.spacing ~r~n"
end if 

//label.ellipse_height 
dw_1.object.datawindow.label.ellipse_height = "200"
ls_rtv = dw_1.Modify("datawindow.label.ellipse_height='300'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.ellipse_height  ~r~n"
elseif dw_1.describe("datawindow.label.ellipse_height") = dw_1.object.datawindow.label.ellipse_height  then 
	mle_1.text += "Succeed ! DataWindow Control label.ellipse_height  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.ellipse_height ~r~n"
end if 

//label.ellipse_width 
dw_1.object.datawindow.label.ellipse_width = "300"
ls_rtv = dw_1.Modify("datawindow.label.ellipse_width='200'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.ellipse_width  ~r~n"
elseif dw_1.describe("datawindow.label.ellipse_width") = dw_1.object.datawindow.label.ellipse_width  then 
	mle_1.text += "Succeed ! DataWindow Control label.ellipse_width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.ellipse_width ~r~n"
end if 

//label.height 
dw_1.object.datawindow.label.height = "1500"
ls_rtv = dw_1.Modify("datawindow.label.height='1500'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.height  ~r~n"
elseif dw_1.describe("datawindow.label.height") = dw_1.object.datawindow.label.height  then 
	mle_1.text += "Succeed ! DataWindow Control label.height  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.height ~r~n"
end if 

//label.name Laser Address 1.00 x 2.63 5160,5260
dw_1.object.datawindow.label.name = "Laser Address 0.50 x 2.63 5160,5260"
ls_rtv = dw_1.Modify("datawindow.label.name='Laser Address 1.00 x 2.63 5160,5260'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.name  ~r~n"
elseif dw_1.describe("datawindow.label.name") = dw_1.object.datawindow.label.name  then 
	mle_1.text += "Succeed ! DataWindow Control label.name  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.name ~r~n"
end if 

//label.rows 
dw_1.object.datawindow.label.rows = "2"
ls_rtv = dw_1.Modify("datawindow.label.rows='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.rows  ~r~n"
elseif dw_1.describe("datawindow.label.rows") = dw_1.object.datawindow.label.rows  then 
	mle_1.text += "Succeed ! DataWindow Control label.rows  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.rows ~r~n"
end if 

//label.rows.spacing 
dw_1.object.datawindow.label.rows.spacing = "100"
ls_rtv = dw_1.Modify("datawindow.label.rows.spacing='150'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.rows.spacing  ~r~n"
elseif dw_1.describe("datawindow.label.rows.spacing") = dw_1.object.datawindow.label.rows.spacing  then 
	mle_1.text += "Succeed ! DataWindow Control label.rows.spacing  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.rows.spacing ~r~n"
end if 

//label.shape , Rectangle RoundRectangle Oval
//dw_1.object.datawindow.label.shape = "RoundRectangle"
//dw_1.object.datawindow.label.shape = 'Rectangle'
ls_rtv = dw_1.Modify("datawindow.label.shape=Rectangle")
ls_rtv = dw_1.Modify("datawindow.label.shape=RoundRectangle")
ls_rtv = dw_1.Modify("datawindow.label.shape=Oval")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.shape  ~r~n"
elseif dw_1.describe("datawindow.label.shape") = dw_1.object.datawindow.label.shape  then 
	mle_1.text += "Succeed ! DataWindow Control label.shape  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.shape ~r~n"
end if 

//label.sheet 
dw_1.object.datawindow.label.sheet = "No"
ls_rtv = dw_1.Modify("datawindow.label.sheet=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.sheet  ~r~n"
elseif dw_1.describe("datawindow.label.sheet") = dw_1.object.datawindow.label.sheet  then 
	mle_1.text += "Succeed ! DataWindow Control label.sheet  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.sheet ~r~n"
end if 

//label.topdown 
dw_1.object.datawindow.label.topdown = "No"
ls_rtv = dw_1.Modify("datawindow.label.topdown=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.topdown  ~r~n"
elseif dw_1.describe("datawindow.label.topdown") = dw_1.object.datawindow.label.topdown  then 
	mle_1.text += "Succeed ! DataWindow Control label.topdown  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.topdown ~r~n"
end if 

//label.width 
dw_1.object.datawindow.label.width = "1500"
ls_rtv = dw_1.Modify("datawindow.label.width='1500'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control label.width  ~r~n"
elseif dw_1.describe("datawindow.label.width") = dw_1.object.datawindow.label.width  then 
	mle_1.text += "Succeed ! DataWindow Control label.width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control label.width ~r~n"
end if 

end subroutine

public subroutine wf_datawindow_nup ();string ls_rtv

dw_1.dataobject = 'd_nup'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()
//for N-UP
//rows_per_detail 
if dw_1.Describe("datawindow.rows_per_detail") = dw_1.object.datawindow.rows_per_detail then 
	mle_1.text += "Succeed ! DataWindow Control rows_per_detail ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control rows_per_detail ~r~n"
end if
end subroutine

public subroutine wf_datawindow_ole ();string ls_rtv

dw_1.dataobject = 'd_ole'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()
ls_rtv = dw_1.object.datawindow.ole.client.class
//messagebox("",ls_rtv)
ls_rtv = dw_1.object.datawindow.ole.client.name
//messagebox("",ls_rtv)
//for ole dw
//ole.client.class 
dw_1.object.datawindow.ole.client.class = "pb"
ls_rtv = dw_1.Modify("datawindow.ole.client.class='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control ole.client.class  ~r~n"
elseif dw_1.describe("datawindow.ole.client.class") = dw_1.object.datawindow.ole.client.class  then 
	mle_1.text += "Succeed ! DataWindow Control ole.client.class  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control ole.client.class ~r~n"
end if 

//ole.client.name 
dw_1.object.datawindow.ole.client.name = "test_ole"
ls_rtv = dw_1.Modify("datawindow.ole.client.name='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control ole.client.name  ~r~n"
elseif dw_1.describe("datawindow.ole.client.name") = dw_1.object.datawindow.ole.client.name  then 
	mle_1.text += "Succeed ! DataWindow Control ole.client.name  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control ole.client.name ~r~n"
end if 



end subroutine

public subroutine wf_datawindow_richtext ();string ls_rtv

dw_1.dataobject = 'd_richtext'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//for richtext dw
//lineremove , rich text only
dw_1.object.dept_id.lineremove = "no"
ls_rtv = dw_1.Modify("dept_id.lineremove='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control lineremove  ~r~n"
elseif dw_1.describe("dept_id.lineremove") = dw_1.object.dept_id.lineremove then 
	mle_1.text += "Succeed ! DataWindow Column Control lineremove  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control lineremove ~r~n"
end if 

//multiline , rich text only
dw_1.object.dept_id.multiline = 'Yes'
ls_rtv = dw_1.Modify( "dept_id.multiline=No")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control multiline ~r~n"
elseif dw_1.describe("dept_id.multiline") = dw_1.object.dept_id.multiline then 
	mle_1.text += "Succeed ! DataWindow Column Control multiline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control multiline ~r~n"
end if 

//width.autosize , richtext only
//dw_1.object.dept_id.width.autosize = "no"
//ls_rtv = dw_1.Modify("dept_id.width.autosize='yes'")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow Column Control width.autosize  ~r~n"
//elseif dw_1.describe("dept_id.width.autosize") = dw_1.object.dept_id.width.autosize  then 
//	mle_1.text += "Succeed ! DataWindow Column Control width.autosize  ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Column Control width.autosize ~r~n"
//end if 


//richtext.backcolor 
dw_1.object.datawindow.richtext.backcolor = "255"
ls_rtv = dw_1.Modify("datawindow.richtext.backcolor='65535'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.backcolor  ~r~n"
elseif dw_1.describe("datawindow.richtext.backcolor") = dw_1.object.datawindow.richtext.backcolor then 
	mle_1.text += "Succeed ! DataWindow Control richtext.backcolor  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.backcolor ~r~n"
end if 

//richtext.displayonly 
dw_1.object.datawindow.richtext.displayonly = "no"
ls_rtv = dw_1.Modify("datawindow.richtext.displayonly='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.displayonly  ~r~n"
elseif dw_1.describe("datawindow.richtext.displayonly") = dw_1.object.datawindow.richtext.displayonly then 
	mle_1.text += "Succeed ! DataWindow Control richtext.displayonly  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.displayonly ~r~n"
end if 

//richtext.headerfooter 
if dw_1.Describe("datawindow.richtext.headerfooter") = dw_1.object.datawindow.richtext.headerfooter then 
	mle_1.text += "Succeed ! DataWindow Control richtext.headerfooter ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.headerfooter ~r~n"
end if 

////richtext.initialfile 
//dw_1.object.datawindow.richtext.initialfile = gs_curdir + "\other\test.rtf'"
//ls_rtv = dw_1.Modify("datawindow.richtext.initialfile=" + gs_curdir + "\other\test.rtf'")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow Control richtext.initialfile  ~r~n"
//elseif dw_1.describe("datawindow.richtext.initialfile") = dw_1.object.datawindow.richtext.initialfile then 
//	mle_1.text += "Succeed ! DataWindow Control richtext.initialfile  ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Control richtext.initialfile ~r~n"
//end if 

//richtext.inputfieldbackcolor 
dw_1.object.datawindow.richtext.inputfieldbackcolor = "255"
ls_rtv = dw_1.Modify("datawindow.richtext.inputfieldbackcolor='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.inputfieldbackcolor  ~r~n"
elseif dw_1.describe("datawindow.richtext.inputfieldbackcolor") = dw_1.object.datawindow.richtext.inputfieldbackcolor then 
	mle_1.text += "Succeed ! DataWindow Control richtext.inputfieldbackcolor  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.inputfieldbackcolor ~r~n"
end if 

//richtext.inputfieldnamesvisible 
dw_1.object.datawindow.richtext.inputfieldnamesvisible = "Yes"
ls_rtv = dw_1.Modify("datawindow.richtext.inputfieldnamesvisible='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.inputfieldnamesvisible  ~r~n"
elseif dw_1.describe("datawindow.richtext.inputfieldnamesvisible") = dw_1.object.datawindow.richtext.inputfieldnamesvisible then 
	mle_1.text += "Succeed ! DataWindow Control richtext.inputfieldnamesvisible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.inputfieldnamesvisible ~r~n"
end if 

//richtext.inputfieldsvisible , not for external use
dw_1.object.datawindow.richtext.inputfieldsvisible = "Yes"
ls_rtv = dw_1.Modify("datawindow.richtext.inputfieldsvisible='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.inputfieldsvisible  ~r~n"
elseif dw_1.describe("datawindow.richtext.inputfieldsvisible") = dw_1.object.datawindow.richtext.inputfieldsvisible then 
	mle_1.text += "Succeed ! DataWindow Control richtext.inputfieldsvisible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.inputfieldsvisible ~r~n"
end if 

//richtext.pictureframe 
dw_1.object.datawindow.richtext.pictureframe = "Yes"
ls_rtv = dw_1.Modify("datawindow.richtext.pictureframe='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.pictureframe  ~r~n"
elseif dw_1.describe("datawindow.richtext.pictureframe") = dw_1.object.datawindow.richtext.pictureframe then 
	mle_1.text += "Succeed ! DataWindow Control richtext.pictureframe  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.pictureframe ~r~n"
end if 

//richtext.popmenu 
dw_1.object.datawindow.richtext.popmenu = "Yes"
ls_rtv = dw_1.Modify("datawindow.richtext.popmenu='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.popmenu  ~r~n"
elseif dw_1.describe("datawindow.richtext.popmenu") = dw_1.object.datawindow.richtext.popmenu then 
	mle_1.text += "Succeed ! DataWindow Control richtext.popmenu  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.popmenu ~r~n"
end if 

//richtext.readonly 
dw_1.object.datawindow.richtext.readonly = "Yes"
ls_rtv = dw_1.Modify("datawindow.richtext.readonly='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.readonly  ~r~n"
elseif dw_1.describe("datawindow.richtext.readonly") = dw_1.object.datawindow.richtext.readonly then 
	mle_1.text += "Succeed ! DataWindow Control richtext.readonly  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.readonly ~r~n"
end if 

//richtext.returnsvisible 
dw_1.object.datawindow.richtext.returnsvisible = "Yes"
ls_rtv = dw_1.Modify("datawindow.richtext.returnsvisible='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.returnsvisible  ~r~n"
elseif dw_1.describe("datawindow.richtext.returnsvisible") = dw_1.object.datawindow.richtext.returnsvisible then 
	mle_1.text += "Succeed ! DataWindow Control richtext.returnsvisible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.returnsvisible ~r~n"
end if 

//richtext.rulerbar 
dw_1.object.datawindow.richtext.rulerbar = "No"
ls_rtv = dw_1.Modify("datawindow.richtext.rulerbar='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.rulerbar  ~r~n"
elseif dw_1.describe("datawindow.richtext.rulerbar") = dw_1.object.datawindow.richtext.rulerbar then 
	mle_1.text += "Succeed ! DataWindow Control richtext.rulerbar  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.rulerbar ~r~n"
end if 

//richtext.spacesvisible 
dw_1.object.datawindow.richtext.spacesvisible = "No"
ls_rtv = dw_1.Modify("datawindow.richtext.spacesvisible='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.spacesvisible  ~r~n"
elseif dw_1.describe("datawindow.richtext.spacesvisible") = dw_1.object.datawindow.richtext.spacesvisible then 
	mle_1.text += "Succeed ! DataWindow Control richtext.spacesvisible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.spacesvisible ~r~n"
end if 

//richtext.tabbar 
dw_1.object.datawindow.richtext.tabbar = "No"
ls_rtv = dw_1.Modify("datawindow.richtext.tabbar='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.tabbar  ~r~n"
elseif dw_1.describe("datawindow.richtext.tabbar") = dw_1.object.datawindow.richtext.tabbar then 
	mle_1.text += "Succeed ! DataWindow Control richtext.tabbar  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.tabbar ~r~n"
end if 

//richtext.tabsvisible 
dw_1.object.datawindow.richtext.tabsvisible = "No"
ls_rtv = dw_1.Modify("datawindow.richtext.tabsvisible='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.tabsvisible  ~r~n"
elseif dw_1.describe("datawindow.richtext.tabsvisible") = dw_1.object.datawindow.richtext.tabsvisible then 
	mle_1.text += "Succeed ! DataWindow Control richtext.tabsvisible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.tabsvisible ~r~n"
end if 

//richtext.toolbar 
dw_1.object.datawindow.richtext.toolbar = "No"
ls_rtv = dw_1.Modify("datawindow.richtext.toolbar='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.toolbar  ~r~n"
elseif dw_1.describe("datawindow.richtext.toolbar") = dw_1.object.datawindow.richtext.toolbar then 
	mle_1.text += "Succeed ! DataWindow Control richtext.toolbar  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.toolbar ~r~n"
end if 
//richtext.wordwrap 
dw_1.object.datawindow.richtext.wordwrap = "No"
ls_rtv = dw_1.Modify("datawindow.richtext.wordwrap='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control richtext.wordwrap  ~r~n"
elseif dw_1.describe("datawindow.richtext.wordwrap") = dw_1.object.datawindow.richtext.wordwrap then 
	mle_1.text += "Succeed ! DataWindow Control richtext.wordwrap  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control richtext.wordwrap ~r~n"
end if 

//detail.text , richtext only
dw_1.object.datawindow.detail.text = "{~\rtf1~\ansi~\deff0{~\fonttbl{~\f0~\froman Tms Rmn;}{~\f1~\froman Times New Roman;}}{~\colortbl~\red0~\green0~\blue0;~\red0~\green0~\blue255;~\red0~\green255~\blue255;~\red0~\green255~\blue0;~\red255~\green0~\blue255;~\red255~\green0~\blue0;~\red255~\green255~\blue0;~\red255~\green255~\blue255;~\red0~\green0~\blue127;~\red0~\green127~\blue127;~\red0~\green127~\blue0;~\red127~\green0~\blue127;~\red127~\green0~\blue0;~\red127~\green127~\blue0;~\red127~\green127~\blue127;~\red192~\green192~\blue192;}{~\info{~\creatim~\yr2004~\mo12~\dy20~\hr4~\min44~\sec42}{~\version1}{~\vern262367}}~\paperw12240~\paperh15840~\margl360~\margr2430~\margt360~\margb0~\deftab720~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 100}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department Name: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_NAME}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 111111115555}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Manager ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_HEAD_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 501}}}{~\par}~\pard~\ql}"
ls_rtv = dw_1.Modify("datawindow.detail.text='{~\rtf1~\ansi~\deff0{~\fonttbl{~\f0~\froman Tms Rmn;}{~\f1~\froman Times New Roman;}}{~\colortbl~\red0~\green0~\blue0;~\red0~\green0~\blue255;~\red0~\green255~\blue255;~\red0~\green255~\blue0;~\red255~\green0~\blue255;~\red255~\green0~\blue0;~\red255~\green255~\blue0;~\red255~\green255~\blue255;~\red0~\green0~\blue127;~\red0~\green127~\blue127;~\red0~\green127~\blue0;~\red127~\green0~\blue127;~\red127~\green0~\blue0;~\red127~\green127~\blue0;~\red127~\green127~\blue127;~\red192~\green192~\blue192;}{~\info{~\creatim~\yr2004~\mo12~\dy20~\hr4~\min44~\sec42}{~\version1}{~\vern262367}}~\paperw12240~\paperh15840~\margl360~\margr2430~\margt360~\margb0~\deftab720~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 100}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department Name: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_NAME}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 111111115555}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Manager ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_HEAD_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 501}}}{~\par}~\pard~\ql}'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control detail.text  ~r~n"
elseif dw_1.describe("datawindow.detail.text") = dw_1.object.datawindow.detail.text then 
	mle_1.text += "Succeed ! DataWindow Control detail.text  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control detail.text ~r~n"
end if 

//footer.text 
dw_1.object.datawindow.footer.text = "{~\rtf1~\ansi~\deff0{~\fonttbl{~\f0~\froman Tms Rmn;}{~\f1~\froman Times New Roman;}}{~\colortbl~\red0~\green0~\blue0;~\red0~\green0~\blue255;~\red0~\green255~\blue255;~\red0~\green255~\blue0;~\red255~\green0~\blue255;~\red255~\green0~\blue0;~\red255~\green255~\blue0;~\red255~\green255~\blue255;~\red0~\green0~\blue127;~\red0~\green127~\blue127;~\red0~\green127~\blue0;~\red127~\green0~\blue127;~\red127~\green0~\blue0;~\red127~\green127~\blue0;~\red127~\green127~\blue127;~\red192~\green192~\blue192;}{~\info{~\creatim~\yr2004~\mo12~\dy20~\hr4~\min44~\sec42}{~\version1}{~\vern262367}}~\paperw12240~\paperh15840~\margl360~\margr2430~\margt360~\margb0~\deftab720~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 100}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department Name: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_NAME}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 111111115555}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Manager ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_HEAD_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 501}}}{~\par}~\pard~\ql}"
ls_rtv = dw_1.Modify("datawindow.footer.text='{~\rtf1~\ansi~\deff0{~\fonttbl{~\f0~\froman Tms Rmn;}{~\f1~\froman Times New Roman;}}{~\colortbl~\red0~\green0~\blue0;~\red0~\green0~\blue255;~\red0~\green255~\blue255;~\red0~\green255~\blue0;~\red255~\green0~\blue255;~\red255~\green0~\blue0;~\red255~\green255~\blue0;~\red255~\green255~\blue255;~\red0~\green0~\blue127;~\red0~\green127~\blue127;~\red0~\green127~\blue0;~\red127~\green0~\blue127;~\red127~\green0~\blue0;~\red127~\green127~\blue0;~\red127~\green127~\blue127;~\red192~\green192~\blue192;}{~\info{~\creatim~\yr2004~\mo12~\dy20~\hr4~\min44~\sec42}{~\version1}{~\vern262367}}~\paperw12240~\paperh15840~\margl360~\margr2430~\margt360~\margb0~\deftab720~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 100}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department Name: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_NAME}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 111111115555}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Manager ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_HEAD_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 501}}}{~\par}~\pard~\ql}'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control footer.text  ~r~n"
elseif dw_1.describe("datawindow.footer.text") = dw_1.object.datawindow.footer.text then 
	mle_1.text += "Succeed ! DataWindow Control footer.text  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control footer.text ~r~n"
end if 
//header.text 
dw_1.object.datawindow.header.text = "{~\rtf1~\ansi~\deff0{~\fonttbl{~\f0~\froman Tms Rmn;}{~\f1~\froman Times New Roman;}}{~\colortbl~\red0~\green0~\blue0;~\red0~\green0~\blue255;~\red0~\green255~\blue255;~\red0~\green255~\blue0;~\red255~\green0~\blue255;~\red255~\green0~\blue0;~\red255~\green255~\blue0;~\red255~\green255~\blue255;~\red0~\green0~\blue127;~\red0~\green127~\blue127;~\red0~\green127~\blue0;~\red127~\green0~\blue127;~\red127~\green0~\blue0;~\red127~\green127~\blue0;~\red127~\green127~\blue127;~\red192~\green192~\blue192;}{~\info{~\creatim~\yr2004~\mo12~\dy20~\hr4~\min44~\sec42}{~\version1}{~\vern262367}}~\paperw12240~\paperh15840~\margl360~\margr2430~\margt360~\margb0~\deftab720~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 100}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department Name: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_NAME}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 111111115555}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Manager ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_HEAD_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 501}}}{~\par}~\pard~\ql}"
ls_rtv = dw_1.Modify("datawindow.header.text='{~\rtf1~\ansi~\deff0{~\fonttbl{~\f0~\froman Tms Rmn;}{~\f1~\froman Times New Roman;}}{~\colortbl~\red0~\green0~\blue0;~\red0~\green0~\blue255;~\red0~\green255~\blue255;~\red0~\green255~\blue0;~\red255~\green0~\blue255;~\red255~\green0~\blue0;~\red255~\green255~\blue0;~\red255~\green255~\blue255;~\red0~\green0~\blue127;~\red0~\green127~\blue127;~\red0~\green127~\blue0;~\red127~\green0~\blue127;~\red127~\green0~\blue0;~\red127~\green127~\blue0;~\red127~\green127~\blue127;~\red192~\green192~\blue192;}{~\info{~\creatim~\yr2004~\mo12~\dy20~\hr4~\min44~\sec42}{~\version1}{~\vern262367}}~\paperw12240~\paperh15840~\margl360~\margr2430~\margt360~\margb0~\deftab720~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 100}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Department Name: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_NAME}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 111111115555}}}{~\par}~\pard~\ql{~\f0~\fs20~\cf0~\up0~\dn0 ~\loch~\af0 Manager ID: }{~\field{~\*~\fldinst{~\f0~\fs20~\cf0~\up0~\dn0 DEPT_HEAD_ID}}{~\fldrslt{~\f0~\fs20~\cf0~\up0~\dn0 501}}}{~\par}~\pard~\ql}'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control header.text  ~r~n"
elseif dw_1.describe("datawindow.header.text") = dw_1.object.datawindow.header.text then 
	mle_1.text += "Succeed ! DataWindow Control header.text  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control header.text ~r~n"
end if 

end subroutine

public subroutine wf_datawindow_gen3 ();integer ln_rtv , i
string ls_rtv , ls_syntaxfromsql , ls_Errors , ls_presentation , ls_tmp
string ls_array[]

//processing 
ls_array [1] = 'd_grid'
ls_array [2] = 'd_label'
ls_array [3] = 'd_graph_emp'
ls_array [4] = 'd_crosstab'
ls_array [5] = 'd_composite'
ls_array [6] = 'd_ole'
ls_array [7] = 'd_richtext'
ls_array [8] = 'd_freeform'
ls_array [9] = 'd_nup'
ls_array [10] = 'd_group_emp'
ls_array [11] = 'd_tabular_emp'

for i = 1 to 11 
	dw_1.dataobject = ls_array [ i ]
	dw_1.SetTransObject(sqlca)
	dw_1.Retrieve(250)
	
	if i <= 7 then
		ls_tmp = string(i)
	else
		ls_tmp = '0'
	end if
		
	if dw_1.Describe("datawindow.processing") = ls_tmp and dw_1.object.datawindow.processing = ls_tmp then 
		mle_1.text += "Succeed ! DataWindow Control processing ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Control processing ~r~n"
	end if 
next

//querysort 
dw_1.object.datawindow.querysort = 'Yes'
ls_rtv = dw_1.Modify("datawindow.querysort=Yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control querysort  ~r~n"
elseif dw_1.describe("datawindow.querysort") = dw_1.object.datawindow.querysort  then 
	mle_1.text += "Succeed ! DataWindow Control querysort  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control querysort ~r~n"
end if 

ls_rtv = dw_1.Modify("datawindow.querysort=NO")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control querysort  ~r~n"
elseif dw_1.describe("datawindow.querysort") = dw_1.object.datawindow.querysort  then 
	mle_1.text += "Succeed ! DataWindow Control querysort  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control querysort ~r~n"
end if 
dw_1.retrieve(250)

//querymode 
dw_1.object.datawindow.querymode = 'Yes'
ls_rtv = dw_1.Modify("datawindow.querymode=Yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control querymode  ~r~n"
elseif dw_1.describe("datawindow.querymode") = dw_1.object.datawindow.querymode  then 
	mle_1.text += "Succeed ! DataWindow Control querymode  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control querymode ~r~n"
end if 

ls_rtv = dw_1.Modify("datawindow.querymode=nO")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control querymode  ~r~n"
elseif dw_1.describe("datawindow.querymode") = dw_1.object.datawindow.querymode  then 
	mle_1.text += "Succeed ! DataWindow Control querymode  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control querymode ~r~n"
end if 

//readonly 
dw_1.object.datawindow.readonly  = 'Yes'
ls_rtv = dw_1.Modify("datawindow.readonly='YeS'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control readonly  ~r~n"
elseif dw_1.describe("datawindow.readonly") = dw_1.object.datawindow.readonly  then 
	mle_1.text += "Succeed ! DataWindow Control readonly  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control readonly ~r~n"
end if 

ls_rtv = dw_1.Modify("datawindow.readonly=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control readonly  ~r~n"
elseif dw_1.describe("datawindow.readonly") = dw_1.object.datawindow.readonly  then 
	mle_1.text += "Succeed ! DataWindow Control readonly  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control readonly ~r~n"
end if 

//replacetabwithspace 
dw_1.Modify("emp_fname.HEIGHT.AUTOSIZE=Yes")
dw_1.object.datawindow.replacetabwithspace = 'Yes'
ls_rtv = dw_1.Modify("datawindow.replacetabwithspace=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control replacetabwithspace  ~r~n"
elseif dw_1.describe("datawindow.replacetabwithspace") = dw_1.object.datawindow.replacetabwithspace  then 
	mle_1.text += "Succeed ! DataWindow Control replacetabwithspace  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control replacetabwithspace ~r~n"
end if 

ls_rtv = dw_1.Modify("datawindow.replacetabwithspace=NO")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control replacetabwithspace  ~r~n"
elseif dw_1.describe("datawindow.replacetabwithspace") = dw_1.object.datawindow.replacetabwithspace  then 
	mle_1.text += "Succeed ! DataWindow Control replacetabwithspace  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control replacetabwithspace ~r~n"
end if 

//retrieve.asneeded 
dw_1.object.datawindow.replacetabwithspace = 'Yes'
ls_rtv = dw_1.Modify("datawindow.replacetabwithspace=yEs")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control replacetabwithspace  ~r~n"
elseif dw_1.describe("datawindow.replacetabwithspace") = dw_1.object.datawindow.replacetabwithspace  then 
	mle_1.text += "Succeed ! DataWindow Control replacetabwithspace  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control replacetabwithspace ~r~n"
end if 

ls_rtv = dw_1.Modify("datawindow.replacetabwithspace='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control replacetabwithspace  ~r~n"
elseif dw_1.describe("datawindow.replacetabwithspace") = dw_1.object.datawindow.replacetabwithspace  then 
	mle_1.text += "Succeed ! DataWindow Control replacetabwithspace  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control replacetabwithspace ~r~n"
end if 


//row.resize , it's for grid or crosstab

//rows_per_detail , it's for n-up

////selected 
//dw_1.object.datawindow.selected = "1/10/emp_fname/emp_id;3/7/sex/salary"
//ls_rtv = dw_1.Modify("datawindow.selected='1/10/emp_fname/emp_id;3/7/sex/salary'")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow Control selected  ~r~n"
//elseif dw_1.describe("datawindow.selected") = dw_1.object.datawindow.selected  then 
//	mle_1.text += "Succeed ! DataWindow Control selected  ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Control selected ~r~n"
//end if 
//
////selected.data 
//if dw_1.Describe("datawindow.selected.data") = dw_1.object.datawindow.selected.data then 
//	mle_1.text += "Succeed ! DataWindow Control selected.data ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Control selected.data ~r~n"
//end if 

//selected.mouse , it's for grid or crosstab

//showdefinition 
dw_1.object.datawindow.showdefinition = "yes"
ls_rtv = dw_1.Modify("datawindow.showdefinition='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control showdefinition  ~r~n"
elseif dw_1.describe("datawindow.showdefinition") = dw_1.object.datawindow.showdefinition  then 
	mle_1.text += "Succeed ! DataWindow Control showdefinition  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control showdefinition ~r~n"
end if 

dw_1.object.datawindow.showdefinition = "no"
ls_rtv = dw_1.Modify("datawindow.showdefinition='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control showdefinition  ~r~n"
elseif dw_1.describe("datawindow.showdefinition") = dw_1.object.datawindow.showdefinition  then 
	mle_1.text += "Succeed ! DataWindow Control showdefinition  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control showdefinition ~r~n"
end if 

//sparse 
dw_1.object.datawindow.sparse = "dept_id~tsex"
ls_rtv = dw_1.Modify("datawindow.sparse='dept_id~tsex'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control sparse  ~r~n"
elseif dw_1.describe("datawindow.sparse") = dw_1.object.datawindow.sparse  then 
	mle_1.text += "Succeed ! DataWindow Control sparse  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control sparse ~r~n"
end if 

//storage 
ls_rtv = dw_1.object.datawindow.storage
ls_rtv = dw_1.Describe("datawindow.storage")
mle_1.text += "Succeed ! DataWindow Control storage  ~r~n"

//storagefull , not in document


//storagepagesize 
dw_1.object.datawindow.storagepagesize = "Medium"
dw_1.object.datawindow.storagepagesize = "default"
ls_rtv = dw_1.Modify("datawindow.storagepagesize='LARGE'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control storagepagesize  ~r~n"
elseif dw_1.describe("datawindow.storagepagesize") = dw_1.object.datawindow.storagepagesize  then 
	mle_1.text += "Succeed ! DataWindow Control storagepagesize  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control storagepagesize ~r~n"
end if 

//summary.color
ls_rtv = dw_1.Modify( "datawindow.summary.Color='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control summary.Color ~r~n"
elseif dw_1.describe("datawindow.summary.Color") = dw_1.object.datawindow.summary.Color then 
	mle_1.text += "Succeed ! DataWindow Control summary.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control summary.Color ~r~n"
end if 

//summary.height 
ls_rtv = dw_1.Modify( "datawindow.summary.height=140")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control summary. ~r~n"
elseif dw_1.describe("datawindow.summary.height") = dw_1.object.datawindow.summary.height then 
	mle_1.text += "Succeed ! DataWindow Control summary.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control summary.height ~r~n"
end if 

//summary.pointer 
ls_rtv = dw_1.Modify( "datawindow.summary.Pointer='hand.cur'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control summary.pointer ~r~n"
elseif dw_1.describe("datawindow.summary.pointer") = dw_1.object.datawindow.summary.pointer then 
	mle_1.text += "Succeed ! DataWindow Control summary.pointer ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control summary.pointer ~r~n"
end if 

//syntax 
if dw_1.Describe("datawindow.syntax") = dw_1.object.datawindow.syntax then 
	mle_1.text += "Succeed ! DataWindow Control syntax ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control syntax ~r~n"
end if 

//syntax.data 
if dw_1.Describe("datawindow.syntax.data") = dw_1.object.datawindow.syntax.data then 
	mle_1.text += "Succeed ! DataWindow Control syntax.data ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control syntax.data ~r~n"
end if 

//syntax.modified 
dw_1.object.datawindow.syntax.modified = "Yes"
ls_rtv = dw_1.Modify("datawindow.syntax.modified='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control syntax.modified  ~r~n"
elseif dw_1.describe("datawindow.syntax.modified") = dw_1.object.datawindow.syntax.modified  then 
	mle_1.text += "Succeed ! DataWindow Control syntax.modified  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control syntax.modified ~r~n"
end if 

dw_1.object.datawindow.syntax.modified = "NO"
ls_rtv = dw_1.Modify("datawindow.syntax.modified='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control syntax.modified  ~r~n"
elseif dw_1.describe("datawindow.syntax.modified") = dw_1.object.datawindow.syntax.modified  then 
	mle_1.text += "Succeed ! DataWindow Control syntax.modified  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control syntax.modified ~r~n"
end if 

//timer_interval 
dw_1.object.datawindow.timer_interval = "1000"
ls_rtv = dw_1.Modify("datawindow.timer_interval='100000'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control timer_interval  ~r~n"
elseif dw_1.describe("datawindow.timer_interval") = dw_1.object.datawindow.timer_interval  then 
	mle_1.text += "Succeed ! DataWindow Control timer_interval  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control timer_interval ~r~n"
end if 

//type 
if dw_1.Describe("datawindow.type") = dw_1.object.datawindow.type then 
	mle_1.text += "Succeed ! DataWindow Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control type ~r~n"
end if 

//units 
if dw_1.Describe("datawindow.units") = dw_1.object.datawindow.units then 
	mle_1.text += "Succeed ! DataWindow Control units ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control units ~r~n"
end if 

//verticalscrollmaximum 
if dw_1.Describe("datawindow.verticalscrollmaximum") = dw_1.object.datawindow.verticalscrollmaximum then 
	mle_1.text += "Succeed ! DataWindow Control verticalscrollmaximum ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control verticalscrollmaximum ~r~n"
end if 

//verticalscrollposition 
dw_1.object.datawindow.verticalscrollposition = "500"
ls_rtv = dw_1.Modify("datawindow.verticalscrollposition='600'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control verticalscrollposition  ~r~n"
elseif dw_1.describe("datawindow.verticalscrollposition") = dw_1.object.datawindow.verticalscrollposition  then 
	mle_1.text += "Succeed ! DataWindow Control verticalscrollposition  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control verticalscrollposition ~r~n"
end if 

//visualobjects 
if dw_1.Describe("datawindow.visualobjects") = dw_1.object.datawindow.visualobjects then 
	mle_1.text += "Succeed ! DataWindow Control visualobjects ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control visualobjects ~r~n"
end if 

//xhtmlgen.browser 
dw_1.object.datawindow.xhtmlgen.browser = 'Mozilla/4.0 (compatible; MSIE 5.x;) : Microsoft Internet Explorer 5.0'
ls_rtv = dw_1.Modify( "datawindow.xhtmlgen.browser='Mozilla/4.0 (compatible; MSIE 5.x;) : Microsoft Internet Explorer 5.0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control xhtmlgen.browser ~r~n"
elseif dw_1.describe("datawindow.xhtmlgen.browser") = dw_1.object.datawindow.xhtmlgen.browser then 
	mle_1.text += "Succeed ! DataWindow Control xhtmlgen.browser ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control xhtmlgen.browser ~r~n"
end if 

////xhtmlgen.publishpath , dont' support xhtmlgen.publishpath and xhtmlgen.resourcebase
////dw_1.object.datawindow.xhtmlgen.publishpath = 'C:\work\outputfiles\xmlsource'
//ls_rtv = dw_1.Modify( "datawindow.xhtmlgen.publishpath='C:\work\outputfiles\xmlsource'")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow Control xhtmlgen.publishpath ~r~n"
//elseif dw_1.describe("datawindow.xhtmlgen.publishpath") = dw_1.object.datawindow.xhtmlgen.publishpath then 
//	mle_1.text += "Succeed ! DataWindow Control xhtmlgen.publishpath ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Control xhtmlgen.publishpath ~r~n"
//end if 
//
////xhtmlgen.resourcebase 
////dw_1.object.datawindow.xhtmlgen.resourcebase = 'http://www.myserver.com/xmlsource'
//ls_rtv = dw_1.Modify( "datawindow.xhtmlgen.resourcebase='http://www.myserver.com/xmlsource'")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow Control xhtmlgen.resourcebase ~r~n"
//elseif dw_1.describe("datawindow.xhtmlgen.resourcebase") = dw_1.object.datawindow.xhtmlgen.resourcebase then 
//	mle_1.text += "Succeed ! DataWindow Control xhtmlgen.resourcebase ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Control xhtmlgen.resourcebase ~r~n"
//end if 

//xsltgen.publishpath 
dw_1.object.datawindow.xsltgen.publishpath = 'C:\work\outputfiles\xmlsource'
ls_rtv = dw_1.Modify( "datawindow.xsltgen.publishpath='C:\work\outputfiles\xmlsource'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control xsltgen.publishpath ~r~n"
elseif dw_1.describe("datawindow.xsltgen.publishpath") = dw_1.object.datawindow.xsltgen.publishpath then 
	mle_1.text += "Succeed ! DataWindow Control xsltgen.publishpath ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control xsltgen.publishpath ~r~n"
end if 

//xsltgen.resourcebase 
dw_1.object.datawindow.xsltgen.resourcebase = 'http://www.myserver.com/xmlsource'
ls_rtv = dw_1.Modify( "datawindow.xsltgen.resourcebase='http://www.myserver.com/xmlsource'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control xsltgen.resourcebase ~r~n"
elseif dw_1.describe("datawindow.xsltgen.resourcebase") = dw_1.object.datawindow.xsltgen.resourcebase then 
	mle_1.text += "Succeed ! DataWindow Control xsltgen.resourcebase ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control xsltgen.resourcebase ~r~n"
end if 

//zoom 
dw_1.object.datawindow.zoom = "50"
ls_rtv = dw_1.Modify("datawindow.zoom='60'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control zoom  ~r~n"
elseif dw_1.describe("datawindow.zoom") = dw_1.object.datawindow.zoom  then 
	mle_1.text += "Succeed ! DataWindow Control zoom  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control zoom ~r~n"
end if 

dw_1.object.datawindow.zoom = "150"
ls_rtv = dw_1.Modify("datawindow.zoom='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control zoom  ~r~n"
elseif dw_1.describe("datawindow.zoom") = dw_1.object.datawindow.zoom  then 
	mle_1.text += "Succeed ! DataWindow Control zoom  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control zoom ~r~n"
end if 

//print.buttons 
dw_1.object.datawindow.print.buttons = "yes"
ls_rtv = dw_1.Modify("datawindow.print.buttons='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.buttons  ~r~n"
elseif dw_1.describe("datawindow.print.buttons") = dw_1.object.datawindow.print.buttons  then 
	mle_1.text += "Succeed ! DataWindow Control print.buttons  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.buttons ~r~n"
end if 

dw_1.object.datawindow.print.buttons = "NO"
ls_rtv = dw_1.Modify("datawindow.print.buttons='yeS'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.buttons  ~r~n"
elseif dw_1.describe("datawindow.print.buttons") = dw_1.object.datawindow.print.buttons  then 
	mle_1.text += "Succeed ! DataWindow Control print.buttons  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.buttons ~r~n"
end if 
//print.printername 
dw_1.object.datawindow.print.printername = "\\ops-beijing\pr-bei-008"
ls_rtv = dw_1.Modify("datawindow.print.printername='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.printername  ~r~n"
elseif dw_1.describe("datawindow.print.printername") = dw_1.object.datawindow.print.printername  then 
	mle_1.text += "Succeed ! DataWindow Control print.printername  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.printername ~r~n"
end if 

//print.canusedefaultprinter 
dw_1.object.datawindow.print.canusedefaultprinter = "Yes"
ls_rtv = dw_1.Modify("datawindow.print.canusedefaultprinter='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.canusedefaultprinter  ~r~n"
elseif dw_1.describe("datawindow.print.canusedefaultprinter") = dw_1.object.datawindow.print.canusedefaultprinter  then 
	mle_1.text += "Succeed ! DataWindow Control print.canusedefaultprinter  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.canusedefaultprinter ~r~n"
end if 

//print.printername 
dw_1.object.datawindow.print.printername = "\\ops-beijing\pr-bei-09"
ls_rtv = dw_1.Modify("datawindow.print.printername='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.printername  ~r~n"
elseif dw_1.describe("datawindow.print.printername") = dw_1.object.datawindow.print.printername  then 
	mle_1.text += "Succeed ! DataWindow Control print.printername  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.printername ~r~n"
end if 

//print.canusedefaultprinter 
dw_1.object.datawindow.print.canusedefaultprinter = "NO"
ls_rtv = dw_1.Modify("datawindow.print.canusedefaultprinter='yEs'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.canusedefaultprinter  ~r~n"
elseif dw_1.describe("datawindow.print.canusedefaultprinter") = dw_1.object.datawindow.print.canusedefaultprinter  then 
	mle_1.text += "Succeed ! DataWindow Control print.canusedefaultprinter  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.canusedefaultprinter ~r~n"
end if 

//print.cliptext 
dw_1.object.datawindow.print.cliptext = "NO"
ls_rtv = dw_1.Modify("datawindow.print.cliptext='yEs'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.cliptext  ~r~n"
elseif dw_1.describe("datawindow.print.cliptext") = dw_1.object.datawindow.print.cliptext  then 
	mle_1.text += "Succeed ! DataWindow Control print.cliptext  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.cliptext ~r~n"
end if 

//print.collate 
dw_1.object.datawindow.print.collate = "NO"
ls_rtv = dw_1.Modify("datawindow.print.collate='yEs'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.collate  ~r~n"
elseif dw_1.describe("datawindow.print.collate") = dw_1.object.datawindow.print.collate  then 
	mle_1.text += "Succeed ! DataWindow Control print.collate  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.collate ~r~n"
end if 

//print.color 
dw_1.object.datawindow.print.color = "1"
ls_rtv = dw_1.Modify("datawindow.print.color=2")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.color  ~r~n"
elseif dw_1.describe("datawindow.print.color") = dw_1.object.datawindow.print.color  then 
	mle_1.text += "Succeed ! DataWindow Control print.color  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.color ~r~n"
end if 

//print.columns 
dw_1.object.datawindow.print.columns = "3"
ls_rtv = dw_1.Modify("datawindow.print.columns=2")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.columns  ~r~n"
elseif dw_1.describe("datawindow.print.columns") = dw_1.object.datawindow.print.columns  then 
	mle_1.text += "Succeed ! DataWindow Control print.columns  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.columns ~r~n"
end if 

//print.columns.width 
dw_1.object.datawindow.print.columns.width = "2000"
ls_rtv = dw_1.Modify("datawindow.print.columns.width=2200")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.columns.width  ~r~n"
elseif dw_1.describe("datawindow.print.columns.width") = dw_1.object.datawindow.print.columns.width  then 
	mle_1.text += "Succeed ! DataWindow Control print.columns.width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.columns.width ~r~n"
end if 

//print.copies 
dw_1.object.datawindow.print.copies = "3"
ls_rtv = dw_1.Modify("datawindow.print.copies=2")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.copies  ~r~n"
elseif dw_1.describe("datawindow.print.copies") = dw_1.object.datawindow.print.copies  then 
	mle_1.text += "Succeed ! DataWindow Control print.copies  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.copies ~r~n"
end if 

//print.documentname 
dw_1.object.datawindow.print.documentname = "this is named by me"
ls_rtv = dw_1.Modify("datawindow.print.documentname='my document name'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.documentname  ~r~n"
elseif dw_1.describe("datawindow.print.documentname") = dw_1.object.datawindow.print.documentname  then 
	mle_1.text += "Succeed ! DataWindow Control print.documentname  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.documentname ~r~n"
end if 

//print.duplex 
dw_1.object.datawindow.print.duplex = "1"
ls_rtv = dw_1.Modify("datawindow.print.duplex='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.duplex  ~r~n"
elseif dw_1.describe("datawindow.print.duplex") = dw_1.object.datawindow.print.duplex  then 
	mle_1.text += "Succeed ! DataWindow Control print.duplex  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.duplex ~r~n"
end if 

dw_1.object.datawindow.print.duplex = "3"
ls_rtv = dw_1.Modify("datawindow.print.duplex='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.duplex  ~r~n"
elseif dw_1.describe("datawindow.print.duplex") = dw_1.object.datawindow.print.duplex  then 
	mle_1.text += "Succeed ! DataWindow Control print.duplex  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.duplex ~r~n"
end if 

//print.filename 
dw_1.object.datawindow.print.filename = ""
ls_rtv = dw_1.Modify("datawindow.print.filename='new filename'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.filename  ~r~n"
elseif dw_1.describe("datawindow.print.filename") = dw_1.object.datawindow.print.filename  then 
	mle_1.text += "Succeed ! DataWindow Control print.filename  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.filename ~r~n"
end if 

//print.margin.bottom 
dw_1.object.datawindow.print.margin.bottom = "100"
ls_rtv = dw_1.Modify("datawindow.print.margin.bottom=100")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.margin.bottom  ~r~n"
elseif dw_1.describe("datawindow.print.margin.bottom") = dw_1.object.datawindow.print.margin.bottom  then 
	mle_1.text += "Succeed ! DataWindow Control print.margin.bottom  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.margin.bottom ~r~n"
end if 

//print.margin.left 
dw_1.object.datawindow.print.margin.left = "100"
ls_rtv = dw_1.Modify("datawindow.print.margin.left=100")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.margin.left  ~r~n"
elseif dw_1.describe("datawindow.print.margin.left") = dw_1.object.datawindow.print.margin.left  then 
	mle_1.text += "Succeed ! DataWindow Control print.margin.left  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.margin.left ~r~n"
end if 

//print.margin.right 
dw_1.object.datawindow.print.margin.right = "100"
ls_rtv = dw_1.Modify("datawindow.print.margin.right=100")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.margin.right  ~r~n"
elseif dw_1.describe("datawindow.print.margin.right") = dw_1.object.datawindow.print.margin.right  then 
	mle_1.text += "Succeed ! DataWindow Control print.margin.right  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.margin.right ~r~n"
end if 

//print.margin.top 
dw_1.object.datawindow.print.margin.top = "100"
ls_rtv = dw_1.Modify("datawindow.print.margin.top=100")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.margin.top  ~r~n"
elseif dw_1.describe("datawindow.print.margin.top") = dw_1.object.datawindow.print.margin.top  then 
	mle_1.text += "Succeed ! DataWindow Control print.margin.top  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.margin.top ~r~n"
end if 

//print.orientation 
dw_1.object.datawindow.print.orientation = "1"
ls_rtv = dw_1.Modify("datawindow.print.orientation='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.orientation  ~r~n"
elseif dw_1.describe("datawindow.print.orientation") = dw_1.object.datawindow.print.orientation  then 
	mle_1.text += "Succeed ! DataWindow Control print.orientation  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.orientation ~r~n"
end if 
dw_1.object.datawindow.print.orientation = "0"

//print.overrideprintjob 
dw_1.object.datawindow.print.overrideprintjob = "Yes"
ls_rtv = dw_1.Modify("datawindow.print.overrideprintjob=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.overrideprintjob  ~r~n"
elseif dw_1.describe("datawindow.print.overrideprintjob") = dw_1.object.datawindow.print.overrideprintjob  then 
	mle_1.text += "Succeed ! DataWindow Control print.overrideprintjob  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.overrideprintjob ~r~n"
end if 

//print.page.range 
dw_1.object.datawindow.print.page.range = ""
ls_rtv = dw_1.Modify("datawindow.print.page.range='1,2-4,6'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.page.range  ~r~n"
elseif dw_1.describe("datawindow.print.page.range") = dw_1.object.datawindow.print.page.range  then 
	mle_1.text += "Succeed ! DataWindow Control print.page.range  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.page.range ~r~n"
end if 

//print.page.rangeinclude 
dw_1.object.datawindow.print.page.rangeinclude = "1"
ls_rtv = dw_1.Modify("datawindow.print.page.rangeinclude='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.page.rangeinclude  ~r~n"
elseif dw_1.describe("datawindow.print.page.rangeinclude") = dw_1.object.datawindow.print.page.rangeinclude  then 
	mle_1.text += "Succeed ! DataWindow Control print.page.rangeinclude  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.page.rangeinclude ~r~n"
end if 
dw_1.object.datawindow.print.page.rangeinclude = "0"

//print.paper.size 
i = 0 
for i = 0 to 41

	ls_rtv = dw_1.Modify("datawindow.print.paper.size='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Control print.paper.size ~r~n"
	elseif dw_1.describe("datawindow.print.paper.size") = dw_1.object.datawindow.print.paper.size then 
		mle_1.text += "Succeed ! DataWindow Control print.paper.size ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Control print.paper.size ~r~n"
	end if 
	
next

dw_1.object.datawindow.print.paper.size="256"
//print.custompage.length 
dw_1.object.datawindow.print.custompage.length = "100"
ls_rtv = dw_1.Modify("datawindow.print.custompage.length=150")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.custompage.length  ~r~n"
elseif dw_1.describe("datawindow.print.custompage.length") = dw_1.object.datawindow.print.custompage.length  then 
	mle_1.text += "Succeed ! DataWindow Control print.custompage.length  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.custompage.length ~r~n"
end if 

//print.custompage.width 
dw_1.object.datawindow.print.custompage.width = "100"
ls_rtv = dw_1.Modify("datawindow.print.custompage.width=150")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.custompage.width  ~r~n"
elseif dw_1.describe("datawindow.print.custompage.width") = dw_1.object.datawindow.print.custompage.width  then 
	mle_1.text += "Succeed ! DataWindow Control print.custompage.width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.custompage.width ~r~n"
end if 

//print.paper.source 
i = 0 
for i = 0 to 11
	ls_rtv = dw_1.Modify("datawindow.print.paper.source='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Control print.paper.source ~r~n"
	elseif dw_1.describe("datawindow.print.paper.source") = dw_1.object.datawindow.print.paper.source then 
		mle_1.text += "Succeed ! DataWindow Control print.paper.source ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Control print.paper.source ~r~n"
	end if 
next
dw_1.object.datawindow.print.paper.source="14"


//print.preview 
dw_1.object.datawindow.print.preview = "yes"
ls_rtv = dw_1.Modify("datawindow.print.preview='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.preview  ~r~n"
elseif dw_1.describe("datawindow.print.preview") = dw_1.object.datawindow.print.preview  then 
	mle_1.text += "Succeed ! DataWindow Control print.preview  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.preview ~r~n"
end if 

//print.preview.buttons 
dw_1.object.datawindow.print.preview.buttons = "no"
ls_rtv = dw_1.Modify("datawindow.print.preview.buttons='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.preview.buttons  ~r~n"
elseif dw_1.describe("datawindow.print.preview.buttons") = dw_1.object.datawindow.print.preview.buttons  then 
	mle_1.text += "Succeed ! DataWindow Control print.preview.buttons  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.preview.buttons ~r~n"
end if 

//print.preview.rulers 
dw_1.object.datawindow.print.preview.rulers = "Yes"
ls_rtv = dw_1.Modify("datawindow.print.preview.rulers='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.preview.rulers  ~r~n"
elseif dw_1.describe("datawindow.print.preview.rulers") = dw_1.object.datawindow.print.preview.rulers  then 
	mle_1.text += "Succeed ! DataWindow Control print.preview.rulers  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.preview.rulers ~r~n"
end if 

//print.preview.zoom 
dw_1.object.datawindow.print.preview.zoom = "50"
ls_rtv = dw_1.Modify("datawindow.print.preview.zoom='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.preview.zoom  ~r~n"
elseif dw_1.describe("datawindow.print.preview.zoom") = dw_1.object.datawindow.print.preview.zoom  then 
	mle_1.text += "Succeed ! DataWindow Control print.preview.zoom  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.preview.zoom ~r~n"
end if 

ls_rtv = dw_1.Modify("datawindow.print.preview='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.preview  ~r~n"
elseif dw_1.describe("datawindow.print.preview") = dw_1.object.datawindow.print.preview  then 
	mle_1.text += "Succeed ! DataWindow Control print.preview  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.preview ~r~n"
end if 

//print.prompt 
dw_1.object.datawindow.print.prompt = "No"
ls_rtv = dw_1.Modify("datawindow.print.prompt='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.prompt  ~r~n"
elseif dw_1.describe("datawindow.print.prompt") = dw_1.object.datawindow.print.prompt  then 
	mle_1.text += "Succeed ! DataWindow Control print.prompt  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.prompt ~r~n"
end if 

//print.quality 
i = 0 
for i = 0 to 4
	ls_rtv = dw_1.Modify("datawindow.print.quality='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Control print.quality ~r~n"
	elseif dw_1.describe("datawindow.print.quality") = dw_1.object.datawindow.print.quality then 
		mle_1.text += "Succeed ! DataWindow Control print.quality ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Control print.quality ~r~n"
	end if 
next

//print.scale , 
dw_1.object.datawindow.print.scale = "50"
ls_rtv = dw_1.Modify("datawindow.print.scale='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control print.scale  ~r~n"
elseif dw_1.describe("datawindow.print.scale") = dw_1.object.datawindow.print.scale  then 
	mle_1.text += "Succeed ! DataWindow Control print.scale  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control print.scale ~r~n"
end if 

//printer 
dw_1.object.datawindow.printer = "\\ops-beijing\pr-bei-06"
ls_rtv = dw_1.Modify("datawindow.printer='\\ops-beijing\pr-bei-06'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control printer  ~r~n"
elseif dw_1.describe("datawindow.printer") = dw_1.object.datawindow.printer  then 
	mle_1.text += "Succeed ! DataWindow Control printer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control printer ~r~n"
end if 

end subroutine

public subroutine wf_datawindow_gen1 ();integer ln_rtv , i
string ls_rtv , ls_syntaxfromsql , ls_Errors , ls_presentation , ls_tmp

dw_1.dataobject = "d_tabular_emp"
dw_1.SetTransObject(sqlca)
dw_1.Retrieve(200)

//attributes 
//this property couldn't be modified 
//messagebox("",dw_1.Describe("datawindow.Attributes"))
if dw_1.Describe("datawindow.Attributes") = dw_1.object.datawindow.attributes then 
	mle_1.text += "Succeed ! DataWindow Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control attributes ~r~n"
end if 

//bands 
if dw_1.Describe("datawindow.bands") = dw_1.object.datawindow.bands then 
	mle_1.text += "Succeed ! DataWindow Control bands ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control bands ~r~n"
end if

//color 
dw_1.object.datawindow.Color = '300'
ls_rtv = dw_1.Modify( "datawindow.Color='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Color ~r~n"
elseif dw_1.describe("datawindow.Color") = dw_1.object.datawindow.Color then 
	mle_1.text += "Succeed ! DataWindow Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Color ~r~n"
end if 

ls_rtv = Modify( dw_1 , "datawindow.Color='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Color ~r~n"
elseif describe(dw_1,"datawindow.Color") = dw_1.object.datawindow.Color then 
	mle_1.text += "Succeed ! DataWindow Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Color ~r~n"
end if 

//column.count 
//messagebox("",dw_1.Describe("datawindow.column.count"))
if dw_1.Describe("datawindow.column.count") = dw_1.object.datawindow.column.count then 
	mle_1.text += "Succeed ! DataWindow Control column.count ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control column.count ~r~n"
end if

//cssgen.publishpath ,C:\work\outputfiles\xmlsource
dw_1.object.datawindow.cssgen.publishpath = 'C:\work\outputfiles\xmlsource'
ls_rtv = dw_1.Modify( "datawindow.cssgen.publishpath='C:\work\outputfiles\xmlsource'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control cssgen.publishpath ~r~n"
elseif dw_1.describe("datawindow.cssgen.publishpath") = dw_1.object.datawindow.cssgen.publishpath then 
	mle_1.text += "Succeed ! DataWindow Control cssgen.publishpath ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control cssgen.publishpath ~r~n"
end if 

//cssgen.resourcebase  , http://www.myserver.com/xmlsource
dw_1.object.datawindow.cssgen.resourcebase = 'http://www.myserver.com/xmlsource'
ls_rtv = dw_1.Modify( "datawindow.cssgen.resourcebase='http://www.myserver.com/xmlsource'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control cssgen.resourcebase ~r~n"
elseif dw_1.describe("datawindow.cssgen.resourcebase") = dw_1.object.datawindow.cssgen.resourcebase then 
	mle_1.text += "Succeed ! DataWindow Control cssgen.resourcebase ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control cssgen.resourcebase ~r~n"
end if 

//cssgen.sessionspecific  , yes , no
dw_1.object.datawindow.cssgen.sessionspecific = 'no'
ls_rtv = dw_1.Modify( "datawindow.cssgen.sessionspecific='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control cssgen.sessionspecific ~r~n"
elseif dw_1.describe("datawindow.cssgen.sessionspecific") = dw_1.object.datawindow.cssgen.sessionspecific then 
	mle_1.text += "Succeed ! DataWindow Control cssgen.sessionspecific ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control cssgen.sessionspecific ~r~n"
end if 

//data 
//messagebox("",dw_1.Describe("datawindow.data"))
if dw_1.Describe("datawindow.data") = dw_1.object.datawindow.data then 
	mle_1.text += "Succeed ! DataWindow Control data ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control data ~r~n"
end if

//data.html 
if dw_1.Describe("datawindow.data.html") = dw_1.object.datawindow.data.html then 
	mle_1.text += "Succeed ! DataWindow Control data.html ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control data.html ~r~n"
end if

//data.htmltable 
if dw_1.Describe("datawindow.data.htmltable") = dw_1.object.datawindow.data.htmltable then 
	mle_1.text += "Succeed ! DataWindow Control data.htmltable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control data.htmltable ~r~n"
end if

////data.xhtml , couldn't compare them
//if dw_1.Describe("datawindow.data.xhtml") = dw_1.object.datawindow.data.xhtml then 
//	mle_1.text += "Succeed ! DataWindow Control data.xhtml ~r~n"
////else
//	//mle_1.text += "Failure ! DataWindow Control data.xhtml ~r~n"
//end if

//data.xml 
if dw_1.Describe("datawindow.data.xml") = dw_1.object.datawindow.data.xml then 
	mle_1.text += "Succeed ! DataWindow Control data.xml ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control data.xml ~r~n"
end if

//data.xmldtd 
if dw_1.Describe("datawindow.data.xmldtd") = dw_1.object.datawindow.data.xmldtd then 
	mle_1.text += "Succeed ! DataWindow Control data.xmldtd ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control data.xmldtd ~r~n"
end if

//data.xmlschema 
if dw_1.Describe("datawindow.data.xmlschema") = dw_1.object.datawindow.data.xmlschema then 
	mle_1.text += "Succeed ! DataWindow Control data.xmlschema ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control data.xmlschema ~r~n"
end if

////data.xmlweb , couldn't compare them
//if dw_1.Describe("datawindow.data.xmlweb") = dw_1.object.datawindow.data.xmlweb then 
//	mle_1.text += "Succeed ! DataWindow Control data.xmlweb ~r~n"
////else
//	//mle_1.text += "Failure ! DataWindow Control data.xmlweb ~r~n"
//end if

//data.xslfo 
if dw_1.Describe("datawindow.data.xslfo") = dw_1.object.datawindow.data.xslfo then 
	mle_1.text += "Succeed ! DataWindow Control data.xslfo ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control data.xslfo ~r~n"
end if

//detail.color 
dw_1.object.datawindow.Detail.Color = '600'
ls_rtv = dw_1.Modify( "datawindow.Detail.Color='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Detail.Color ~r~n"
elseif dw_1.describe("datawindow.Detail.Color") = dw_1.object.datawindow.Detail.Color then 
	mle_1.text += "Succeed ! DataWindow Control Detail.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Detail.Color ~r~n"
end if 

//detail.height 
dw_1.object.datawindow.Detail.height = '130'
ls_rtv = dw_1.Modify( "datawindow.Detail.height=140")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Detail.height ~r~n"
elseif dw_1.describe("datawindow.Detail.height") = dw_1.object.datawindow.Detail.height then 
	mle_1.text += "Succeed ! DataWindow Control Detail.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Detail.height ~r~n"
end if 
//detail.height.autosize 
dw_1.object.datawindow.Detail.height.autosize = 'Yes'
ls_rtv = dw_1.Modify( "datawindow.Detail.height.autosize='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Detail.height.autosize ~r~n"
elseif dw_1.describe("datawindow.Detail.height.autosize") = dw_1.object.datawindow.Detail.height.autosize then 
	mle_1.text += "Succeed ! DataWindow Control Detail.height.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Detail.height.autosize ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.Detail.height.autosize=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Detail.height.autosize ~r~n"
elseif dw_1.describe("datawindow.Detail.height.autosize") = dw_1.object.datawindow.Detail.height.autosize then 
	mle_1.text += "Succeed ! DataWindow Control Detail.height.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Detail.height.autosize ~r~n"
end if 
//detail.pointer 
dw_1.object.datawindow.Detail.pointer = 'help!'
ls_rtv = dw_1.Modify( "datawindow.Detail.Pointer='hand.cur'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Detail.pointer ~r~n"
elseif dw_1.describe("datawindow.Detail.pointer") = dw_1.object.datawindow.Detail.pointer then 
	mle_1.text += "Succeed ! DataWindow Control Detail.pointer ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Detail.pointer ~r~n"
end if 

//export.pdf.method 
dw_1.object.datawindow.export.pdf.method = Distill!
ls_rtv = dw_1.Modify( "datawindow.export.pdf.method=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control export.pdf.method ~r~n"
elseif dw_1.describe("datawindow.export.pdf.method") = dw_1.object.datawindow.export.pdf.method then 
	mle_1.text += "Succeed ! DataWindow Control export.pdf.method ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.pdf.method ~r~n"
end if 

//export.pdf.distill.custompostscript 
dw_1.object.datawindow.export.pdf.distill.custompostscript = 'no'
ls_rtv = dw_1.Modify( "datawindow.export.pdf.distill.custompostscript=Yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control export.pdf.distill.custompostscript ~r~n"
elseif dw_1.describe("datawindow.export.pdf.distill.custompostscript") = dw_1.object.datawindow.export.pdf.distill.custompostscript then 
	mle_1.text += "Succeed ! DataWindow Control export.pdf.distill.custompostscript ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.pdf.distill.custompostscript ~r~n"
end if 

//export.pdf.method 
dw_1.object.datawindow.export.pdf.method = XSLFOP!
ls_rtv = dw_1.Modify( "datawindow.export.pdf.method=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control export.pdf.method ~r~n"
elseif dw_1.describe("datawindow.export.pdf.method") = dw_1.object.datawindow.export.pdf.method then 
	mle_1.text += "Succeed ! DataWindow Control export.pdf.method ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.pdf.method ~r~n"
end if 

//export.pdf.xslfop.print 
dw_1.object.datawindow.export.pdf.xslfop.print = 'no'
ls_rtv = dw_1.Modify( "datawindow.export.pdf.xslfop.print=Yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control export.pdf.xslfop.print ~r~n"
elseif dw_1.describe("datawindow.export.pdf.xslfop.print") = dw_1.object.datawindow.export.pdf.xslfop.print then 
	mle_1.text += "Succeed ! DataWindow Control export.pdf.xslfop.print ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.pdf.xslfop.print ~r~n"
end if 

//export.xhtml.usetemplate 
dw_1.object.datawindow.export.xhtml.usetemplate = ''
ls_rtv = dw_1.Modify( "datawindow.export.xhtml.usetemplate='t1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control export.xhtml.usetemplate ~r~n"
elseif dw_1.describe("datawindow.export.xhtml.usetemplate") = dw_1.object.datawindow.export.xhtml.usetemplate then 
	mle_1.text += "Succeed ! DataWindow Control export.xhtml.usetemplate ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.xhtml.usetemplate ~r~n"
end if 

//export.xhtml.template[].name
if dw_1.Describe("datawindow.export.xhtml.template[1].name") = dw_1.object.datawindow.export.xhtml.template[1].name then 
	mle_1.text += "Succeed ! DataWindow Control export.xhtml.template[].name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.xhtml.template[].name ~r~n"
end if

//export.xhtml.templatecount 
if dw_1.Describe("datawindow.export.xhtml.templatecount") = dw_1.object.datawindow.export.xhtml.templatecount then 
	mle_1.text += "Succeed ! DataWindow Control export.xhtml.templatecount ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.xhtml.templatecount ~r~n"
end if

//export.xml.headgroups 
dw_1.object.datawindow.export.xml.headgroups = 'no'
ls_rtv = dw_1.Modify( "datawindow.export.xml.headgroups=YES")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control export.xml.headgroups ~r~n"
elseif dw_1.describe("datawindow.export.xml.headgroups") = dw_1.object.datawindow.export.xml.headgroups then 
	mle_1.text += "Succeed ! DataWindow Control export.xml.headgroups ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.xml.headgroups ~r~n"
end if 

//export.xml.includewhitespace 
dw_1.object.datawindow.export.xml.includewhitespace = 'no'
ls_rtv = dw_1.Modify( "datawindow.export.xml.includewhitespace=YES")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control export.xml.includewhitespace ~r~n"
elseif dw_1.describe("datawindow.export.xml.includewhitespace") = dw_1.object.datawindow.export.xml.includewhitespace then 
	mle_1.text += "Succeed ! DataWindow Control export.xml.includewhitespace ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.xml.includewhitespace ~r~n"
end if 

//export.xml.metadatatype 
dw_1.object.datawindow.export.xml.metadatatype = XMLNone!
dw_1.object.datawindow.export.xml.metadatatype = XMLSchema!
ls_rtv = dw_1.Modify( "datawindow.export.xml.metadatatype=2")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control export.xml.metadatatype ~r~n"
elseif dw_1.describe("datawindow.export.xml.metadatatype") = dw_1.object.datawindow.export.xml.metadatatype then 
	mle_1.text += "Succeed ! DataWindow Control export.xml.metadatatype ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.xml.metadatatype ~r~n"
end if 

//export.xml.savemetadata ,MetaDataInternal!	,MetaDataExternal! 	
dw_1.object.datawindow.export.xml.savemetadata = MetaDataExternal!
ls_rtv = dw_1.Modify( "datawindow.export.xml.metadatatype=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control export.xml.savemetadata ~r~n"
elseif dw_1.describe("datawindow.export.xml.savemetadata") = dw_1.object.datawindow.export.xml.savemetadata then 
	mle_1.text += "Succeed ! DataWindow Control export.xml.savemetadata ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.xml.savemetadata ~r~n"
end if 

//export.xml.template 
if dw_1.Describe("datawindow.export.xml.template[1].name") = dw_1.object.datawindow.export.xml.template[1].name then 
	mle_1.text += "Succeed ! DataWindow Control export.xml.template[].name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.xml.template[].name ~r~n"
end if

//export.xml.templatecount 
if dw_1.Describe("datawindow.export.xml.templatecount") = dw_1.object.datawindow.export.xml.templatecount then 
	mle_1.text += "Succeed ! DataWindow Control export.xml.templatecount ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.xml.templatecount ~r~n"
end if

//export.xml.usetemplate 
dw_1.object.datawindow.export.xml.usetemplate = ''
ls_rtv = dw_1.Modify( "datawindow.export.xml.usetemplate='t2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control export.xml.usetemplate ~r~n"
elseif dw_1.describe("datawindow.export.xml.usetemplate") = dw_1.object.datawindow.export.xml.usetemplate then 
	mle_1.text += "Succeed ! DataWindow Control export.xml.usetemplate ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control export.xml.usetemplate ~r~n"
end if 

//firstrowonpage 
if dw_1.Describe("datawindow.firstrowonpage") = dw_1.object.datawindow.firstrowonpage then 
	mle_1.text += "Succeed ! DataWindow Control firstrowonpage ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control firstrowonpage ~r~n"
end if

//font.bias 
dw_1.object.datawindow.font.bias = '0'
ls_rtv = dw_1.Modify( "datawindow.font.bias=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control font.bias ~r~n"
elseif dw_1.describe("datawindow.font.bias") = dw_1.object.datawindow.font.bias then 
	mle_1.text += "Succeed ! DataWindow Control font.bias ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control font.bias ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.font.bias=2")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control font.bias ~r~n"
elseif dw_1.describe("datawindow.font.bias") = dw_1.object.datawindow.font.bias then 
	mle_1.text += "Succeed ! DataWindow Control font.bias ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control font.bias ~r~n"
end if 

//footer.color 
//footer.height 
//footer.pointer 
//footer.color
dw_1.object.datawindow.footer.Color = '255'
ls_rtv = dw_1.Modify( "datawindow.footer.Color='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control footer.Color ~r~n"
elseif dw_1.describe("datawindow.footer.Color") = dw_1.object.datawindow.footer.Color then 
	mle_1.text += "Succeed ! DataWindow Control footer.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control footer.Color ~r~n"
end if 

//footer.height 
dw_1.object.datawindow.footer.height = '140'
ls_rtv = dw_1.Modify( "datawindow.footer.height=140")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control footer.height ~r~n"
elseif dw_1.describe("datawindow.footer.height") = dw_1.object.datawindow.footer.height then 
	mle_1.text += "Succeed ! DataWindow Control footer.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control footer.height ~r~n"
end if 

//footer.pointer 
dw_1.object.datawindow.footer.pointer = 'size!'
ls_rtv = dw_1.Modify( "datawindow.footer.Pointer='hand.cur'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control footer.pointer ~r~n"
elseif dw_1.describe("datawindow.footer.pointer") = dw_1.object.datawindow.footer.pointer then 
	mle_1.text += "Succeed ! DataWindow Control footer.pointer ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control footer.pointer ~r~n"
end if 

//header.color 
//header.height 
//header.pointer 
//header.color
dw_1.object.datawindow.header.Color = '255'
ls_rtv = dw_1.Modify( "datawindow.header.Color='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control header.Color ~r~n"
elseif dw_1.describe("datawindow.header.Color") = dw_1.object.datawindow.header.Color then 
	mle_1.text += "Succeed ! DataWindow Control header.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control header.Color ~r~n"
end if 

//header.height 
dw_1.object.datawindow.header.height = '120'
ls_rtv = dw_1.Modify( "datawindow.header.height=140")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control header.height ~r~n"
elseif dw_1.describe("datawindow.header.height") = dw_1.object.datawindow.header.height then 
	mle_1.text += "Succeed ! DataWindow Control header.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control header.height ~r~n"
end if 

//header.pointer 
dw_1.object.datawindow.header.pointer = 'arrow!'
ls_rtv = dw_1.Modify( "datawindow.header.Pointer='hand.cur'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control header.pointer ~r~n"
elseif dw_1.describe("datawindow.header.pointer") = dw_1.object.datawindow.header.pointer then 
	mle_1.text += "Succeed ! DataWindow Control header.pointer ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control header.pointer ~r~n"
end if 


//help.command 
dw_1.object.datawindow.help.command = '0'
ls_rtv = dw_1.Modify( "datawindow.help.command=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.command ~r~n"
elseif dw_1.describe("datawindow.help.command") = dw_1.object.datawindow.help.command then 
	mle_1.text += "Succeed ! DataWindow Control help.command ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.command ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.help.command=2")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.command ~r~n"
elseif dw_1.describe("datawindow.help.command") = dw_1.object.datawindow.help.command then 
	mle_1.text += "Succeed ! DataWindow Control help.command ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.command ~r~n"
end if 

//help.file 
dw_1.object.datawindow.help.file = gs_curdir + "\help\pbhlp90.hlp"
ls_rtv = dw_1.Modify( "datawindow.help.file='" + gs_curdir + "\help\pbhlp90.hlp'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.file ~r~n"
elseif dw_1.describe("datawindow.help.file") = dw_1.object.datawindow.help.file then 
	mle_1.text += "Succeed ! DataWindow Control help.file ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.file ~r~n"
end if 

//help.typeid 
dw_1.object.datawindow.help.typeid = 'Help.property DataWindow object property'
ls_rtv = dw_1.Modify( "datawindow.help.typeid='Help.property DataWindow object property'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.typeid ~r~n"
elseif dw_1.describe("datawindow.help.typeid") = dw_1.object.datawindow.help.typeid then 
	mle_1.text += "Succeed ! DataWindow Control help.typeid ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.typeid ~r~n"
end if 

//help.typeid.importfile 
dw_1.object.datawindow.help.typeid.importfile = 'ImportFile method (DataWindows)'
ls_rtv = dw_1.Modify( "datawindow.help.typeid.importfile='ImportFile method (DataWindows)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.typeid.importfile ~r~n"
elseif dw_1.describe("datawindow.help.typeid.importfile") = dw_1.object.datawindow.help.typeid.importfile then 
	mle_1.text += "Succeed ! DataWindow Control help.typeid.importfile ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.typeid.importfile ~r~n"
end if 

//help.typeid.retrieve.argument 
dw_1.object.datawindow.help.typeid.retrieve.argument = 'Arguments DataWindow object property'
ls_rtv = dw_1.Modify( "datawindow.help.typeid.retrieve.argument='Arguments DataWindow object property'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.typeid.retrieve.argument ~r~n"
elseif dw_1.describe("datawindow.help.typeid.retrieve.argument") = dw_1.object.datawindow.help.typeid.retrieve.argument then 
	mle_1.text += "Succeed ! DataWindow Control help.typeid.retrieve.argument ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.typeid.retrieve.argument ~r~n"
end if 

//help.typeid.retrieve.criteria 
dw_1.object.datawindow.help.typeid.retrieve.criteria = 'Criteria.property DataWindow object property'
ls_rtv = dw_1.Modify( "datawindow.help.typeid.retrieve.criteria='Criteria.property DataWindow object property'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.typeid.retrieve.criteria ~r~n"
elseif dw_1.describe("datawindow.help.typeid.retrieve.criteria") = dw_1.object.datawindow.help.typeid.retrieve.criteria then 
	mle_1.text += "Succeed ! DataWindow Control help.typeid.retrieve.criteria ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.typeid.retrieve.criteria ~r~n"
end if 

//help.typeid.saveas 
dw_1.object.datawindow.help.typeid.saveas = 'SaveAs method (DataWindows)'
ls_rtv = dw_1.Modify( "datawindow.help.typeid.saveas='SaveAs method (DataWindows)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.typeid.saveas ~r~n"
elseif dw_1.describe("datawindow.help.typeid.saveas") = dw_1.object.datawindow.help.typeid.saveas then 
	mle_1.text += "Succeed ! DataWindow Control help.typeid.saveas ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.typeid.saveas ~r~n"
end if 

//help.typeid.setfilter 
dw_1.object.datawindow.help.typeid.setfilter = 'SetFilter method (DataWindows)'
ls_rtv = dw_1.Modify( "datawindow.help.typeid.setfilter='SetFilter method (DataWindows)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.typeid.setfilter ~r~n"
elseif dw_1.describe("datawindow.help.typeid.setfilter") = dw_1.object.datawindow.help.typeid.setfilter then 
	mle_1.text += "Succeed ! DataWindow Control help.typeid.setfilter ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.typeid.setfilter ~r~n"
end if 

//help.typeid.setsort 
dw_1.object.datawindow.help.typeid.setsort = 'SetSort method (DataWindows)'
ls_rtv = dw_1.Modify( "datawindow.help.typeid.setsort='SetSort method (DataWindows)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.typeid.setsort ~r~n"
elseif dw_1.describe("datawindow.help.typeid.setsort") = dw_1.object.datawindow.help.typeid.setsort then 
	mle_1.text += "Succeed ! DataWindow Control help.typeid.setsort ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.typeid.setsort ~r~n"
end if 

//help.typeid.setsortexpr 
dw_1.object.datawindow.help.typeid.setsortexpr = 'Expression DataWindow object property'
ls_rtv = dw_1.Modify( "datawindow.help.typeid.setsortexpr='Expression DataWindow object property'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control help.typeid.setsortexpr ~r~n"
elseif dw_1.describe("datawindow.help.typeid.setsortexpr") = dw_1.object.datawindow.help.typeid.setsortexpr then 
	mle_1.text += "Succeed ! DataWindow Control help.typeid.setsortexpr ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control help.typeid.setsortexpr ~r~n"
end if 

//horizontalscrollmaximum 
if dw_1.Describe("datawindow.horizontalscrollmaximum") = dw_1.object.datawindow.horizontalscrollmaximum then 
	mle_1.text += "Succeed ! DataWindow Control horizontalscrollmaximum ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control horizontalscrollmaximum ~r~n"
end if

//horizontalscrollmaximum2 
if dw_1.Describe("datawindow.horizontalscrollmaximum2") = dw_1.object.datawindow.horizontalscrollmaximum2 then 
	mle_1.text += "Succeed ! DataWindow Control horizontalscrollmaximum2 ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control horizontalscrollmaximum2 ~r~n"
end if

//horizontalscrollposition 
dw_1.object.datawindow.horizontalscrollposition = '44'
ls_rtv = dw_1.Modify( "datawindow.horizontalscrollposition='400'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control horizontalscrollposition ~r~n"
elseif dw_1.describe("datawindow.horizontalscrollposition") = dw_1.object.datawindow.horizontalscrollposition then 
	mle_1.text += "Succeed ! DataWindow Control horizontalscrollposition ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control horizontalscrollposition ~r~n"
end if 

//horizontalscrollposition2 
dw_1.object.datawindow.horizontalscrollposition2 = '22'
ls_rtv = dw_1.Modify( "datawindow.horizontalscrollposition2='200'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control horizontalscrollposition2 ~r~n"
elseif dw_1.describe("datawindow.horizontalscrollposition2") = dw_1.object.datawindow.horizontalscrollposition2 then 
	mle_1.text += "Succeed ! DataWindow Control horizontalscrollposition2 ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control horizontalscrollposition2 ~r~n"
end if 

//horizontalscrollsplit 
dw_1.object.datawindow.horizontalscrollsplit = '444'
ls_rtv = dw_1.Modify( "datawindow.horizontalscrollsplit='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control horizontalscrollsplit ~r~n"
elseif dw_1.describe("datawindow.horizontalscrollsplit") = dw_1.object.datawindow.horizontalscrollsplit then 
	mle_1.text += "Succeed ! DataWindow Control horizontalscrollsplit ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control horizontalscrollsplit ~r~n"
end if 

end subroutine

public subroutine wf_datawindow_gen2 ();integer ln_rtv , i
string ls_rtv , ls_syntaxfromsql , ls_Errors , ls_presentation , ls_tmp

//htmldw 
dw_1.object.datawindow.htmldw = 'No'
ls_rtv = dw_1.Modify( "datawindow.htmldw='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmldw ~r~n"
elseif dw_1.describe("datawindow.htmldw") = dw_1.object.datawindow.htmldw then 
	mle_1.text += "Succeed ! DataWindow Control htmldw ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmldw ~r~n"
end if 

//htmlgen.browser 
dw_1.object.datawindow.htmlgen.browser = 'Mozilla/4.0 (compatible; MSIE 5.x;) : Microsoft Internet Explorer 5.0'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.browser='Mozilla/4.0 (compatible; MSIE 5.x;) : Microsoft Internet Explorer 5.0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.browser ~r~n"
elseif dw_1.describe("datawindow.htmlgen.browser") = dw_1.object.datawindow.htmlgen.browser then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.browser ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.browser ~r~n"
end if 

//htmlgen.clientcomputedfields 
//dw_1.object.datawindow.htmlgen.clientcomputedfields = 'no'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.clientcomputedfields='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientcomputedfields ~r~n"
elseif dw_1.describe("datawindow.htmlgen.clientcomputedfields") = dw_1.object.datawindow.htmlgen.clientcomputedfields then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.clientcomputedfields ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientcomputedfields ~r~n"
end if 

//htmlgen.clientevents 
//dw_1.object.datawindow.htmlgen.clientevents = 'No'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.clientevents='YES'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientevents ~r~n"
elseif dw_1.describe("datawindow.htmlgen.clientevents") = dw_1.object.datawindow.htmlgen.clientevents then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.clientevents ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientevents ~r~n"
end if 

//htmlgen.clientformatting 
//dw_1.object.datawindow.htmlgen.clientformatting = 'Yes'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.clientformatting='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientformatting ~r~n"
elseif dw_1.describe("datawindow.htmlgen.clientformatting") = dw_1.object.datawindow.htmlgen.clientformatting then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.clientformatting ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientformatting ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.htmlgen.clientformatting='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientformatting ~r~n"
elseif dw_1.describe("datawindow.htmlgen.clientformatting") = dw_1.object.datawindow.htmlgen.clientformatting then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.clientformatting ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientformatting ~r~n"
end if 

//htmlgen.clientscriptable 
//dw_1.object.datawindow.htmlgen.clientscriptable = 'Yes'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.clientscriptable='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientscriptable ~r~n"
elseif dw_1.describe("datawindow.htmlgen.clientscriptable") = dw_1.object.datawindow.htmlgen.clientscriptable then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.clientscriptable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientscriptable ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.htmlgen.clientscriptable='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientscriptable ~r~n"
elseif dw_1.describe("datawindow.htmlgen.clientscriptable") = dw_1.object.datawindow.htmlgen.clientscriptable then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.clientscriptable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientscriptable ~r~n"
end if 

//htmlgen.clientvalidation 
//dw_1.object.datawindow.htmlgen.clientvalidation = '1'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.clientvalidation='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientvalidation ~r~n"
elseif dw_1.describe("datawindow.htmlgen.clientvalidation") = dw_1.object.datawindow.htmlgen.clientvalidation then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.clientvalidation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientvalidation ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.htmlgen.clientvalidation='YES'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientvalidation ~r~n"
elseif dw_1.describe("datawindow.htmlgen.clientvalidation") = dw_1.object.datawindow.htmlgen.clientvalidation then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.clientvalidation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.clientvalidation ~r~n"
end if 

//htmlgen.commonjsfile 
//dw_1.object.datawindow.htmlgen.commonjsfile = 'test.js'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.commonjsfile='test.js'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.commonjsfile ~r~n"
elseif dw_1.describe("datawindow.htmlgen.commonjsfile") = dw_1.object.datawindow.htmlgen.commonjsfile then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.commonjsfile ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.commonjsfile ~r~n"
end if 

//htmlgen.datejsfile 
//dw_1.object.datawindow.htmlgen.datejsfile = 'datejsfile.js'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.datejsfile='datejsfile.js'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.datejsfile ~r~n"
elseif dw_1.describe("datawindow.htmlgen.datejsfile") = dw_1.object.datawindow.htmlgen.datejsfile then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.datejsfile ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.datejsfile ~r~n"
end if 


//htmlgen.encodeselflinkargs 
//dw_1.object.datawindow.htmlgen.encodeselflinkargs = 'Yes'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.encodeselflinkargs='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.encodeselflinkargs ~r~n"
elseif dw_1.describe("datawindow.htmlgen.encodeselflinkargs") = dw_1.object.datawindow.htmlgen.encodeselflinkargs then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.encodeselflinkargs ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.encodeselflinkargs ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.htmlgen.encodeselflinkargs='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.encodeselflinkargs ~r~n"
elseif dw_1.describe("datawindow.htmlgen.encodeselflinkargs") = dw_1.object.datawindow.htmlgen.encodeselflinkargs then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.encodeselflinkargs ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.encodeselflinkargs ~r~n"
end if 

//htmlgen.firstonpage 
dw_1.object.datawindow.htmlgen.firstonpage = '0'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.firstonpage='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.firstonpage ~r~n"
elseif dw_1.describe("datawindow.htmlgen.firstonpage") = dw_1.object.datawindow.htmlgen.firstonpage then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.firstonpage ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.firstonpage ~r~n"
end if 

//htmlgen.fourglweb 
dw_1.object.datawindow.htmlgen.fourglweb = 'No'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.fourglweb='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.fourglweb ~r~n"
elseif dw_1.describe("datawindow.htmlgen.fourglweb") = dw_1.object.datawindow.htmlgen.fourglweb then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.fourglweb ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.fourglweb ~r~n"
end if 


//htmlgen.generatejavascript 
//dw_1.object.datawindow.htmlgen.generatejavascript = 'Yes'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.generatejavascript='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.generatejavascript ~r~n"
elseif dw_1.describe("datawindow.htmlgen.generatejavascript") = dw_1.object.datawindow.htmlgen.generatejavascript then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.generatejavascript ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.generatejavascript ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.htmlgen.generatejavascript='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.generatejavascript ~r~n"
elseif dw_1.describe("datawindow.htmlgen.generatejavascript") = dw_1.object.datawindow.htmlgen.generatejavascript then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.generatejavascript ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.generatejavascript ~r~n"
end if 

//htmlgen.htmlversion 
dw_1.object.datawindow.htmlgen.htmlversion = '4.0'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.htmlversion='4.0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.htmlversion ~r~n"
elseif dw_1.describe("datawindow.htmlgen.htmlversion") = dw_1.object.datawindow.htmlgen.htmlversion then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.htmlversion ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.htmlversion ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.htmlgen.htmlversion='3.2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.htmlversion ~r~n"
elseif dw_1.describe("datawindow.htmlgen.htmlversion") = dw_1.object.datawindow.htmlgen.htmlversion then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.htmlversion ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.htmlversion ~r~n"
end if 

//htmlgen.netscapelayers 
dw_1.object.datawindow.htmlgen.netscapelayers = 'netscapelayers'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.netscapelayers='netscapelayers'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.netscapelayers ~r~n"
elseif dw_1.describe("datawindow.htmlgen.netscapelayers") = dw_1.object.datawindow.htmlgen.netscapelayers then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.netscapelayers ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.netscapelayers ~r~n"
end if 

//htmlgen.numberjsfile 
dw_1.object.datawindow.htmlgen.numberjsfile = 'numberjsfile.js'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.numberjsfile='numberjsfile.js'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.numberjsfile ~r~n"
elseif dw_1.describe("datawindow.htmlgen.numberjsfile") = dw_1.object.datawindow.htmlgen.numberjsfile then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.numberjsfile ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.numberjsfile ~r~n"
end if 

//htmlgen.objectname 
dw_1.object.datawindow.htmlgen.objectname = 'webdw1'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.objectname='webdw1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.objectname ~r~n"
elseif dw_1.describe("datawindow.htmlgen.objectname") = dw_1.object.datawindow.htmlgen.objectname then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.objectname ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.objectname ~r~n"
end if 

//htmlgen.pagesize 
dw_1.object.datawindow.htmlgen.pagesize = '4'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.pagesize='5'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.pagesize ~r~n"
elseif dw_1.describe("datawindow.htmlgen.pagesize") = dw_1.object.datawindow.htmlgen.pagesize then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.pagesize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.pagesize ~r~n"
end if 

//htmlgen.resourcebase 
dw_1.object.datawindow.htmlgen.resourcebase = 'http://www.base.com'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.resourcebase='http://www.base.com'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.resourcebase ~r~n"
elseif dw_1.describe("datawindow.htmlgen.resourcebase") = dw_1.object.datawindow.htmlgen.resourcebase then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.resourcebase ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.resourcebase ~r~n"
end if 

//htmlgen.selflink 
dw_1.object.datawindow.htmlgen.selflink = 'http://www.base.com'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.selflink='http://www.base.com'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.selflink ~r~n"
elseif dw_1.describe("datawindow.htmlgen.selflink") = dw_1.object.datawindow.htmlgen.selflink then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.selflink ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.selflink ~r~n"
end if 

//htmlgen.selflinkargs 
dw_1.object.datawindow.htmlgen.selflinkargs = "arg='string(emp_id)'"
ls_rtv = dw_1.Modify( "datawindow.htmlgen.selflinkargs=~"arg='string(emp_id)'~"")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.selflinkargs ~r~n"
elseif dw_1.describe("datawindow.htmlgen.selflinkargs") = dw_1.object.datawindow.htmlgen.selflinkargs then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.selflinkargs ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.selflinkargs ~r~n"
end if 

//htmlgen.stringjsfile 
dw_1.object.datawindow.htmlgen.stringjsfile = 'string.js'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.stringjsfile='string.js'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.stringjsfile ~r~n"
elseif dw_1.describe("datawindow.htmlgen.stringjsfile") = dw_1.object.datawindow.htmlgen.stringjsfile then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.stringjsfile ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.stringjsfile ~r~n"
end if 

//htmlgen.tabindexbase 
dw_1.object.datawindow.htmlgen.tabindexbase = '32766'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.tabindexbase='32766'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.tabindexbase ~r~n"
elseif dw_1.describe("datawindow.htmlgen.tabindexbase") = dw_1.object.datawindow.htmlgen.tabindexbase then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.tabindexbase ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.tabindexbase ~r~n"
end if 

//htmlgen.userjsfile 
dw_1.object.datawindow.htmlgen.userjsfile = 'user.js'
ls_rtv = dw_1.Modify( "datawindow.htmlgen.userjsfile='user.js'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmlgen.userjsfile ~r~n"
elseif dw_1.describe("datawindow.htmlgen.userjsfile") = dw_1.object.datawindow.htmlgen.userjsfile then 
	mle_1.text += "Succeed ! DataWindow Control htmlgen.userjsfile ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmlgen.userjsfile ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.htmldw='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmldw ~r~n"
elseif dw_1.describe("datawindow.htmldw") = dw_1.object.datawindow.htmldw then 
	mle_1.text += "Succeed ! DataWindow Control htmldw ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmldw ~r~n"
end if 

//htmltable.border 
dw_1.object.datawindow.htmltable.border = '1'
ls_rtv = dw_1.Modify( "datawindow.htmltable.border='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmltable.border ~r~n"
elseif dw_1.describe("datawindow.htmltable.border") = dw_1.object.datawindow.htmltable.border then 
	mle_1.text += "Succeed ! DataWindow Control htmltable.border ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmltable.border ~r~n"
end if 

//htmltable.cellpadding 
dw_1.object.datawindow.htmltable.cellpadding = '2'
ls_rtv = dw_1.Modify( "datawindow.htmltable.cellpadding='3'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmltable.cellpadding ~r~n"
elseif dw_1.describe("datawindow.htmltable.cellpadding") = dw_1.object.datawindow.htmltable.cellpadding then 
	mle_1.text += "Succeed ! DataWindow Control htmltable.cellpadding ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmltable.cellpadding ~r~n"
end if 

//htmltable.cellspacing 
dw_1.object.datawindow.htmltable.cellspacing = '3'
ls_rtv = dw_1.Modify( "datawindow.htmltable.cellspacing='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmltable.cellspacing ~r~n"
elseif dw_1.describe("datawindow.htmltable.cellspacing") = dw_1.object.datawindow.htmltable.cellspacing then 
	mle_1.text += "Succeed ! DataWindow Control htmltable.cellspacing ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmltable.cellspacing ~r~n"
end if 

//htmltable.generatecss 
//dw_1.object.datawindow.htmltable.generatecss = 'no'
ls_rtv = dw_1.Modify( "datawindow.htmltable.generatecss='YeS'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmltable.generatecss ~r~n"
elseif dw_1.describe("datawindow.htmltable.generatecss") = dw_1.object.datawindow.htmltable.generatecss then 
	mle_1.text += "Succeed ! DataWindow Control htmltable.generatecss ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmltable.generatecss ~r~n"
end if 

//htmltable.nowrap 
//dw_1.object.datawindow.htmltable.nowrap = 'no'
ls_rtv = dw_1.Modify( "datawindow.htmltable.nowrap='YeS'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmltable.nowrap ~r~n"
elseif dw_1.describe("datawindow.htmltable.nowrap") = dw_1.object.datawindow.htmltable.nowrap then 
	mle_1.text += "Succeed ! DataWindow Control htmltable.nowrap ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmltable.nowrap ~r~n"
end if 

//htmltable.stylesheet 
//dw_1.object.datawindow.htmltable.stylesheet = 'Yes'
//ls_rtv = dw_1.Modify( "datawindow.htmltable.stylesheet=nO")
//if ls_rtv <> "" then 
	//mle_1.text += "Failure ! DataWindow Control htmltable.stylesheet ~r~n"
//else
if dw_1.describe("datawindow.htmltable.stylesheet") = dw_1.object.datawindow.htmltable.stylesheet then 
	mle_1.text += "Succeed ! DataWindow Control htmltable.stylesheet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmltable.stylesheet ~r~n"
end if 

//htmltable.width 
dw_1.object.datawindow.htmltable.width = '3'
ls_rtv = dw_1.Modify( "datawindow.htmltable.width='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control htmltable.width ~r~n"
elseif dw_1.describe("datawindow.htmltable.width") = dw_1.object.datawindow.htmltable.width then 
	mle_1.text += "Succeed ! DataWindow Control htmltable.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control htmltable.width ~r~n"
end if 

//import.xml.trace 
dw_1.object.datawindow.import.xml.trace = 'no'
ls_rtv = dw_1.Modify( "datawindow.import.xml.trace='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control import.xml.trace ~r~n"
elseif dw_1.describe("datawindow.import.xml.trace") = dw_1.object.datawindow.import.xml.trace then 
	mle_1.text += "Succeed ! DataWindow Control import.xml.trace ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control import.xml.trace ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.import.xml.trace='YES'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control import.xml.trace ~r~n"
elseif dw_1.describe("datawindow.import.xml.trace") = dw_1.object.datawindow.import.xml.trace then 
	mle_1.text += "Succeed ! DataWindow Control import.xml.trace ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control import.xml.trace ~r~n"
end if 

//import.xml.tracefile 
dw_1.object.datawindow.import.xml.tracefile = 'test.log'
ls_rtv = dw_1.Modify( "datawindow.import.xml.tracefile=''")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control import.xml.tracefile ~r~n"
elseif dw_1.describe("datawindow.import.xml.tracefile") = dw_1.object.datawindow.import.xml.tracefile then 
	mle_1.text += "Succeed ! DataWindow Control import.xml.tracefile ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control import.xml.tracefile ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.import.xml.tracefile='" + gs_curdir + "\other\tracefile.log'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control import.xml.tracefile ~r~n"
elseif dw_1.describe("datawindow.import.xml.tracefile") = dw_1.object.datawindow.import.xml.tracefile then 
	mle_1.text += "Succeed ! DataWindow Control import.xml.tracefile ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control import.xml.tracefile ~r~n"
end if 

//import.xml.usetemplate 
dw_1.object.datawindow.import.xml.usetemplate = 't1'
ls_rtv = dw_1.Modify( "datawindow.import.xml.usetemplate='t11'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control import.xml.usetemplate ~r~n"
elseif dw_1.describe("datawindow.import.xml.usetemplate") = dw_1.object.datawindow.import.xml.usetemplate then 
	mle_1.text += "Succeed ! DataWindow Control import.xml.usetemplate ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control import.xml.usetemplate ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.import.xml.usetemplate=~"t1~tif(dept_id=100,'t2','t3')~"")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control import.xml.usetemplate ~r~n"
elseif dw_1.describe("datawindow.import.xml.usetemplate") = dw_1.object.datawindow.import.xml.usetemplate then 
	mle_1.text += "Succeed ! DataWindow Control import.xml.usetemplate ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control import.xml.usetemplate ~r~n"
end if 

//jsgen.publishpath 
dw_1.object.datawindow.jsgen.publishpath = 'C:\work\outputfiles\xmlsource'
ls_rtv = dw_1.Modify( "datawindow.jsgen.publishpath='C:\work\outputfiles\xmlsource'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control jsgen.publishpath ~r~n"
elseif dw_1.describe("datawindow.jsgen.publishpath") = dw_1.object.datawindow.jsgen.publishpath then 
	mle_1.text += "Succeed ! DataWindow Control jsgen.publishpath ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control jsgen.publishpath ~r~n"
end if 

//jsgen.resourcebase 
dw_1.object.datawindow.jsgen.resourcebase = 'http://www.myserver.com/xmlsource'
ls_rtv = dw_1.Modify( "datawindow.jsgen.resourcebase='http://www.myserver.com/xmlsource'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control jsgen.resourcebase ~r~n"
elseif dw_1.describe("datawindow.jsgen.resourcebase") = dw_1.object.datawindow.jsgen.resourcebase then 
	mle_1.text += "Succeed ! DataWindow Control jsgen.resourcebase ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control jsgen.resourcebase ~r~n"
end if 

//lastrowonpage 
if dw_1.Describe("datawindow.lastrowonpage") = dw_1.object.datawindow.lastrowonpage then 
	mle_1.text += "Succeed ! DataWindow Control lastrowonpage ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control lastrowonpage ~r~n"
end if 

//message.title 
dw_1.object.datawindow.message.title = 'test'
ls_rtv = dw_1.Modify( "datawindow.message.title='DW Error Message'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control message.title ~r~n"
elseif dw_1.describe("datawindow.message.title") = dw_1.object.datawindow.message.title then 
	mle_1.text += "Succeed ! DataWindow Control message.title ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control message.title ~r~n"
end if 

//name 
if dw_1.Describe("datawindow.name") = dw_1.object.datawindow.name then 
	mle_1.text += "Succeed ! DataWindow Control name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control name ~r~n"
end if 

//nested 
if dw_1.Describe("datawindow.nested") = dw_1.object.datawindow.nested then 
	mle_1.text += "Succeed ! DataWindow Control nested ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control nested ~r~n"
end if 


//nouserprompt 
//Set the NoUserPrompt property to yes if the DataWindow is to be used in a batch process or in an EAServer environment when there is no possibility for end user intervention. Dialog boxes you can prevent from displaying include the Error, Print, Retrieve, CrossTab, Expression, SaveAs, Import, Query, RichText, Filter, and Sort dialog boxes.
dw_1.object.datawindow.nouserprompt = 'Yes'
ls_rtv = dw_1.Modify( "datawindow.nouserprompt='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control nouserprompt ~r~n"
elseif dw_1.describe("datawindow.nouserprompt") = dw_1.object.datawindow.nouserprompt then 
	mle_1.text += "Succeed ! DataWindow Control nouserprompt ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control nouserprompt ~r~n"
end if 

ls_rtv = dw_1.Modify( "datawindow.nouserprompt='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control nouserprompt ~r~n"
elseif dw_1.describe("datawindow.nouserprompt") = dw_1.object.datawindow.nouserprompt then 
	mle_1.text += "Succeed ! DataWindow Control nouserprompt ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control nouserprompt ~r~n"
end if 

//objects 
if dw_1.Describe("datawindow.objects") = dw_1.object.datawindow.objects then 
	mle_1.text += "Succeed ! DataWindow Control objects ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control objects ~r~n"
end if 

//pointer 
dw_1.object.datawindow.Pointer = 'Yes!'
ls_rtv = dw_1.Modify("datawindow.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Pointer  ~r~n"
elseif dw_1.describe("datawindow.Pointer") = dw_1.object.datawindow.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("datawindow.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Control Pointer  ~r~n"
elseif dw_1.describe("datawindow.Pointer") = dw_1.object.datawindow.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Control Pointer ~r~n"
end if 


end subroutine

public subroutine wf_column_dddw ();string ls_rtv
//use column dept_id

//dddw.allowedit 
dw_1.object.dept_id.dddw.allowedit = "no"
ls_rtv = dw_1.Modify( "dept_id.dddw.allowedit='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.allowedit ~r~n"
elseif dw_1.describe("dept_id.dddw.allowedit") = dw_1.object.dept_id.dddw.allowedit then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.allowedit ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.allowedit ~r~n"
end if 

//dddw.autohscroll 
dw_1.object.dept_id.dddw.autohscroll = "no"
ls_rtv = dw_1.Modify( "dept_id.dddw.autohscroll='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.autohscroll ~r~n"
elseif dw_1.describe("dept_id.dddw.autohscroll") = dw_1.object.dept_id.dddw.autohscroll then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.autohscroll ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.autohscroll ~r~n"
end if 

//dddw.autoretrieve 
dw_1.object.dept_id.dddw.autoretrieve = "no"
ls_rtv = dw_1.Modify( "dept_id.dddw.autoretrieve='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.autoretrieve ~r~n"
elseif dw_1.describe("dept_id.dddw.autoretrieve") = dw_1.object.dept_id.dddw.autoretrieve then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.autoretrieve ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.autoretrieve ~r~n"
end if 

//dddw.case 
dw_1.object.dept_id.dddw.case = "Upper"
dw_1.object.dept_id.dddw.case = "lower"
ls_rtv = dw_1.Modify( "dept_id.dddw.case='any'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.case ~r~n"
elseif dw_1.describe("dept_id.dddw.case") = dw_1.object.dept_id.dddw.case then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.case ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.case ~r~n"
end if 

//dddw.datacolumn 
dw_1.object.dept_id.dddw.datacolumn = "dept_id"
ls_rtv = dw_1.Modify( "dept_id.dddw.datacolumn='dept_id'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.datacolumn ~r~n"
elseif dw_1.describe("dept_id.dddw.datacolumn") = dw_1.object.dept_id.dddw.datacolumn then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.datacolumn ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.datacolumn ~r~n"
end if 

//dddw.displaycolumn 
dw_1.object.dept_id.dddw.displaycolumn = "dept_head_id"
ls_rtv = dw_1.Modify( "dept_id.dddw.displaycolumn='dept_head_id'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.displaycolumn ~r~n"
elseif dw_1.describe("dept_id.dddw.displaycolumn") = dw_1.object.dept_id.dddw.displaycolumn then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.displaycolumn ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.displaycolumn ~r~n"
end if 

//dddw.hscrollbar 
dw_1.object.dept_id.dddw.hscrollbar = "no"
ls_rtv = dw_1.Modify( "dept_id.dddw.hscrollbar='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.hscrollbar ~r~n"
elseif dw_1.describe("dept_id.dddw.hscrollbar") = dw_1.object.dept_id.dddw.hscrollbar then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.hscrollbar ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.hscrollbar ~r~n"
end if 

//dddw.hsplitscroll 
dw_1.object.dept_id.dddw.hsplitscroll = "no"
ls_rtv = dw_1.Modify( "dept_id.dddw.hsplitscroll='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.hsplitscroll ~r~n"
elseif dw_1.describe("dept_id.dddw.hsplitscroll") = dw_1.object.dept_id.dddw.hsplitscroll then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.hsplitscroll ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.hsplitscroll ~r~n"
end if 

//dddw.imemode , for japan

//dddw.limit 
dw_1.object.dept_id.dddw.limit = "10"
ls_rtv = dw_1.Modify( "dept_id.dddw.limit='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.limit ~r~n"
elseif dw_1.describe("dept_id.dddw.limit") = dw_1.object.dept_id.dddw.limit then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.limit ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.limit ~r~n"
end if 

//dddw.lines 
dw_1.object.dept_id.dddw.lines = "1"
ls_rtv = dw_1.Modify( "dept_id.dddw.lines='3'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.lines ~r~n"
elseif dw_1.describe("dept_id.dddw.lines") = dw_1.object.dept_id.dddw.lines then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.lines ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.lines ~r~n"
end if 

//dddw.name d_dddw_dept
dw_1.object.dept_id.dddw.name = "d_dddw_dept"
ls_rtv = dw_1.Modify( "dept_id.dddw.name='d_dddw_dept'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.name ~r~n"
elseif dw_1.describe("dept_id.dddw.name") = dw_1.object.dept_id.dddw.name then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.name ~r~n"
end if 

//dddw.nilisnull 
dw_1.object.dept_id.dddw.nilisnull = "yes"
ls_rtv = dw_1.Modify( "dept_id.dddw.nilisnull='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.nilisnull ~r~n"
elseif dw_1.describe("dept_id.dddw.nilisnull") = dw_1.object.dept_id.dddw.nilisnull then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.nilisnull ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.nilisnull ~r~n"
end if 

//dddw.percentwidth 
dw_1.object.dept_id.dddw.percentwidth = "400"
ls_rtv = dw_1.Modify( "dept_id.dddw.percentwidth='500'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.percentwidth ~r~n"
elseif dw_1.describe("dept_id.dddw.percentwidth") = dw_1.object.dept_id.dddw.percentwidth then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.percentwidth ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.percentwidth ~r~n"
end if 

//dddw.required 
dw_1.object.dept_id.dddw.required = "yes"
ls_rtv = dw_1.Modify( "dept_id.dddw.required='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.required ~r~n"
elseif dw_1.describe("dept_id.dddw.required") = dw_1.object.dept_id.dddw.required then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.required ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.required ~r~n"
end if 

//dddw.showlist 
dw_1.object.dept_id.dddw.showlist = "yes"
ls_rtv = dw_1.Modify( "dept_id.dddw.showlist='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.showlist ~r~n"
elseif dw_1.describe("dept_id.dddw.showlist") = dw_1.object.dept_id.dddw.showlist then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.showlist ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.showlist ~r~n"
end if 

//dddw.useasborder 
dw_1.object.dept_id.dddw.useasborder = "yes"
ls_rtv = dw_1.Modify( "dept_id.dddw.useasborder='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.useasborder ~r~n"
elseif dw_1.describe("dept_id.dddw.useasborder") = dw_1.object.dept_id.dddw.useasborder then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.useasborder ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.useasborder ~r~n"
end if 

//dddw.vscrollbar 
dw_1.object.dept_id.dddw.vscrollbar = "yes"
ls_rtv = dw_1.Modify( "dept_id.dddw.vscrollbar='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dddw.vscrollbar ~r~n"
elseif dw_1.describe("dept_id.dddw.vscrollbar") = dw_1.object.dept_id.dddw.vscrollbar then 
	mle_1.text += "Succeed ! DataWindow Column Control dddw.vscrollbar ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dddw.vscrollbar ~r~n"
end if 

end subroutine

public subroutine wf_column_ddlb ();string ls_rtv
//use column status

//ddlb.allowedit 
dw_1.object.status.ddlb.allowedit = "no"
ls_rtv = dw_1.Modify( "status.ddlb.allowedit='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control ddlb.allowedit ~r~n"
elseif dw_1.describe("status.ddlb.allowedit") = dw_1.object.status.ddlb.allowedit then 
	mle_1.text += "Succeed ! DataWindow Column Control ddlb.allowedit ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control ddlb.allowedit ~r~n"
end if 

//ddlb.autohscroll 
dw_1.object.status.ddlb.autohscroll = "no"
ls_rtv = dw_1.Modify( "status.ddlb.autohscroll='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control ddlb.autohscroll ~r~n"
elseif dw_1.describe("status.ddlb.autohscroll") = dw_1.object.status.ddlb.autohscroll then 
	mle_1.text += "Succeed ! DataWindow Column Control ddlb.autohscroll ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control ddlb.autohscroll ~r~n"
end if 

//ddlb.case 
dw_1.object.status.ddlb.case = "Upper"
dw_1.object.status.ddlb.case = "lower"
ls_rtv = dw_1.Modify( "status.ddlb.case='any'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control ddlb.case ~r~n"
elseif dw_1.describe("status.ddlb.case") = dw_1.object.status.ddlb.case then 
	mle_1.text += "Succeed ! DataWindow Column Control ddlb.case ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control ddlb.case ~r~n"
end if 

//ddlb.imemode , for japan

//ddlb.limit 
dw_1.object.status.ddlb.limit = "20"
ls_rtv = dw_1.Modify( "status.ddlb.limit='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control ddlb.limit ~r~n"
elseif dw_1.describe("status.ddlb.limit") = dw_1.object.status.ddlb.limit then 
	mle_1.text += "Succeed ! DataWindow Column Control ddlb.limit ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control ddlb.limit ~r~n"
end if 

//ddlb.nilisnull 
dw_1.object.status.ddlb.nilisnull = "no"
ls_rtv = dw_1.Modify( "status.ddlb.nilisnull='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control ddlb.nilisnull ~r~n"
elseif dw_1.describe("status.ddlb.nilisnull") = dw_1.object.status.ddlb.nilisnull then 
	mle_1.text += "Succeed ! DataWindow Column Control ddlb.nilisnull ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control ddlb.nilisnull ~r~n"
end if 

//ddlb.required 
dw_1.object.status.ddlb.required = "no"
ls_rtv = dw_1.Modify( "status.ddlb.required='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control ddlb.required ~r~n"
elseif dw_1.describe("status.ddlb.required") = dw_1.object.status.ddlb.required then 
	mle_1.text += "Succeed ! DataWindow Column Control ddlb.required ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control ddlb.required ~r~n"
end if 

//ddlb.sorted 
dw_1.object.status.ddlb.sorted = "no"
ls_rtv = dw_1.Modify( "status.ddlb.sorted='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control ddlb.sorted ~r~n"
elseif dw_1.describe("status.ddlb.sorted") = dw_1.object.status.ddlb.sorted then 
	mle_1.text += "Succeed ! DataWindow Column Control ddlb.sorted ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control ddlb.sorted ~r~n"
end if 

//ddlb.useasborder 
dw_1.object.status.ddlb.useasborder = "no"
ls_rtv = dw_1.Modify( "status.ddlb.useasborder='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control ddlb.useasborder ~r~n"
elseif dw_1.describe("status.ddlb.useasborder") = dw_1.object.status.ddlb.useasborder then 
	mle_1.text += "Succeed ! DataWindow Column Control ddlb.useasborder ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control ddlb.useasborder ~r~n"
end if 

//ddlb.showlist 
dw_1.object.status.ddlb.showlist = "no"
ls_rtv = dw_1.Modify( "status.ddlb.showlist='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control ddlb.showlist ~r~n"
elseif dw_1.describe("status.ddlb.showlist") = dw_1.object.status.ddlb.showlist then 
	mle_1.text += "Succeed ! DataWindow Column Control ddlb.showlist ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control ddlb.showlist ~r~n"
end if 

//ddlb.vscrollbar 
dw_1.object.status.ddlb.vscrollbar = "no"
ls_rtv = dw_1.Modify( "status.ddlb.vscrollbar='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control ddlb.vscrollbar ~r~n"
elseif dw_1.describe("status.ddlb.vscrollbar") = dw_1.object.status.ddlb.vscrollbar then 
	mle_1.text += "Succeed ! DataWindow Column Control ddlb.vscrollbar ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control ddlb.vscrollbar ~r~n"
end if 
end subroutine

public subroutine wf_column_rb ();string ls_rtv
//use column sex

//radiobuttons.3d 
//radiobuttons.threed 
dw_1.object.sex.radiobuttons.threed = "no"
ls_rtv = dw_1.Modify( "sex.radiobuttons.3d='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control radiobuttons.3d ~r~n"
elseif dw_1.describe("sex.radiobuttons.3d") = dw_1.object.sex.radiobuttons.threed then 
	mle_1.text += "Succeed ! DataWindow Column Control radiobuttons.3d ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control radiobuttons.3d ~r~n"
end if 

//radiobuttons.columns 
dw_1.object.sex.radiobuttons.columns = "2"
ls_rtv = dw_1.Modify( "sex.radiobuttons.columns='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control radiobuttons.columns ~r~n"
elseif dw_1.describe("sex.radiobuttons.columns") = dw_1.object.sex.radiobuttons.columns then 
	mle_1.text += "Succeed ! DataWindow Column Control radiobuttons.columns ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control radiobuttons.columns ~r~n"
end if 

//radiobuttons.lefttext 
dw_1.object.sex.radiobuttons.lefttext = "No"
ls_rtv = dw_1.Modify( "sex.radiobuttons.lefttext='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control radiobuttons.lefttext ~r~n"
elseif dw_1.describe("sex.radiobuttons.lefttext") = dw_1.object.sex.radiobuttons.lefttext then 
	mle_1.text += "Succeed ! DataWindow Column Control radiobuttons.lefttext ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control radiobuttons.lefttext ~r~n"
end if 

//radiobuttons.scale 
dw_1.object.sex.radiobuttons.scale = "No"
ls_rtv = dw_1.Modify( "sex.radiobuttons.scale='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control radiobuttons.scale ~r~n"
elseif dw_1.describe("sex.radiobuttons.scale") = dw_1.object.sex.radiobuttons.scale then 
	mle_1.text += "Succeed ! DataWindow Column Control radiobuttons.scale ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control radiobuttons.scale ~r~n"
end if 

end subroutine

public subroutine wf_column_editmask ();string ls_rtv
//use column salary

//editmask.mask 
dw_1.object.salary.editmask.mask = "###,###.00"
ls_rtv = dw_1.Modify( "salary.editmask.mask='###,###,###.00'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control editmask.mask ~r~n"
elseif dw_1.describe("salary.editmask.mask") = dw_1.object.salary.editmask.mask then 
	mle_1.text += "Succeed ! DataWindow Column Control editmask.mask ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control editmask.mask ~r~n"
end if 

//editmask.autoskip 
dw_1.object.salary.editmask.autoskip = "yes"
ls_rtv = dw_1.Modify( "salary.editmask.autoskip='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control editmask.autoskip ~r~n"
elseif dw_1.describe("salary.editmask.autoskip") = dw_1.object.salary.editmask.autoskip then 
	mle_1.text += "Succeed ! DataWindow Column Control editmask.autoskip ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control editmask.autoskip ~r~n"
end if 

//editmask.codetable 
dw_1.object.salary.editmask.codetable = "yes"
ls_rtv = dw_1.Modify( "salary.editmask.codetable='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control editmask.codetable ~r~n"
elseif dw_1.describe("salary.editmask.codetable") = dw_1.object.salary.editmask.codetable then 
	mle_1.text += "Succeed ! DataWindow Column Control editmask.codetable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control editmask.codetable ~r~n"
end if 

//editmask.focusrectangle 
dw_1.object.salary.editmask.focusrectangle = "yes"
ls_rtv = dw_1.Modify( "salary.editmask.focusrectangle='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control editmask.focusrectangle ~r~n"
elseif dw_1.describe("salary.editmask.focusrectangle") = dw_1.object.salary.editmask.focusrectangle then 
	mle_1.text += "Succeed ! DataWindow Column Control editmask.focusrectangle ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control editmask.focusrectangle ~r~n"
end if 

//editmask.imemode , for japan

//editmask.readonly 
dw_1.object.salary.editmask.readonly = "yes"
ls_rtv = dw_1.Modify( "salary.editmask.readonly='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control editmask.readonly ~r~n"
elseif dw_1.describe("salary.editmask.readonly") = dw_1.object.salary.editmask.readonly then 
	mle_1.text += "Succeed ! DataWindow Column Control editmask.readonly ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control editmask.readonly ~r~n"
end if 

//editmask.required 
dw_1.object.salary.editmask.required = "yes"
ls_rtv = dw_1.Modify( "salary.editmask.required='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control editmask.required ~r~n"
elseif dw_1.describe("salary.editmask.required") = dw_1.object.salary.editmask.required then 
	mle_1.text += "Succeed ! DataWindow Column Control editmask.required ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control editmask.required ~r~n"
end if 

//editmask.spin 
dw_1.object.salary.editmask.spin = "yes"
ls_rtv = dw_1.Modify( "salary.editmask.spin='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control editmask.spin ~r~n"
elseif dw_1.describe("salary.editmask.spin") = dw_1.object.salary.editmask.spin then 
	mle_1.text += "Succeed ! DataWindow Column Control editmask.spin ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control editmask.spin ~r~n"
end if 

//editmask.spinincr 
dw_1.object.salary.editmask.spinincr = "2"
ls_rtv = dw_1.Modify( "salary.editmask.spinincr='3'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control editmask.spinincr ~r~n"
elseif dw_1.describe("salary.editmask.spinincr") = dw_1.object.salary.editmask.spinincr then 
	mle_1.text += "Succeed ! DataWindow Column Control editmask.spinincr ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control editmask.spinincr ~r~n"
end if 

//editmask.spinrange ,0~~~~5000
dw_1.object.salary.editmask.spinrange = "0~~~~500"
ls_rtv = dw_1.Modify( "salary.editmask.spinrange='0~~~~500'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control editmask.spinrange ~r~n"
elseif dw_1.describe("salary.editmask.spinrange") = dw_1.object.salary.editmask.spinrange then 
	mle_1.text += "Succeed ! DataWindow Column Control editmask.spinrange ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control editmask.spinrange ~r~n"
end if 

//editmask.useformat 
dw_1.object.salary.editmask.useformat = "yes"
ls_rtv = dw_1.Modify( "salary.editmask.useformat='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control editmask.useformat ~r~n"
elseif dw_1.describe("salary.editmask.useformat") = dw_1.object.salary.editmask.useformat then 
	mle_1.text += "Succeed ! DataWindow Column Control editmask.useformat ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control editmask.useformat ~r~n"
end if 

end subroutine

public subroutine wf_column_edit ();string ls_rtv
//use column emp_fname

//edit.autohscroll 
dw_1.object.emp_fname.edit.autohscroll = "no"
ls_rtv = dw_1.Modify( "emp_fname.edit.autohscroll='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.autohscroll ~r~n"
elseif dw_1.describe("emp_fname.edit.autohscroll") = dw_1.object.emp_fname.edit.autohscroll then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.autohscroll ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.autohscroll ~r~n"
end if 

//edit.autoselect 
dw_1.object.emp_fname.edit.autoselect = "no"
ls_rtv = dw_1.Modify( "emp_fname.edit.autoselect='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.autoselect ~r~n"
elseif dw_1.describe("emp_fname.edit.autoselect") = dw_1.object.emp_fname.edit.autoselect then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.autoselect ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.autoselect ~r~n"
end if 

//edit.autovscroll
dw_1.object.emp_fname.edit.autovscroll = "no"
ls_rtv = dw_1.Modify( "emp_fname.edit.autovscroll='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.autovscroll ~r~n"
elseif dw_1.describe("emp_fname.edit.autovscroll") = dw_1.object.emp_fname.edit.autovscroll then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.autovscroll ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.autovscroll ~r~n"
end if 

//edit.case 
dw_1.object.emp_fname.edit.case = "upper"
dw_1.object.emp_fname.edit.case = "lower"
ls_rtv = dw_1.Modify( "emp_fname.edit.case='any'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.case ~r~n"
elseif dw_1.describe("emp_fname.edit.case") = dw_1.object.emp_fname.edit.case then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.case ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.case ~r~n"
end if 

//edit.codetable 
dw_1.object.emp_fname.edit.codetable = "No"
ls_rtv = dw_1.Modify( "emp_fname.edit.codetable='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.codetable ~r~n"
elseif dw_1.describe("emp_fname.edit.codetable") = dw_1.object.emp_fname.edit.codetable then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.codetable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.codetable ~r~n"
end if 

//values , move to edit , codetable value
dw_1.object.emp_fname.values = "red~t1/white~t2"
ls_rtv = dw_1.Modify( "emp_fname.values='Jim~t1/Steven~t2/Harry~t3'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control values ~r~n"
elseif dw_1.describe("emp_fname.values") = dw_1.object.emp_fname.values then 
	mle_1.text += "Succeed ! DataWindow Column Control values ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control values ~r~n"
end if 

//edit.displayonly 
dw_1.object.emp_fname.edit.displayonly = "No"
ls_rtv = dw_1.Modify( "emp_fname.edit.displayonly='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.displayonly ~r~n"
elseif dw_1.describe("emp_fname.edit.displayonly") = dw_1.object.emp_fname.edit.displayonly then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.displayonly ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.displayonly ~r~n"
end if 

//edit.focusrectangle 
dw_1.object.emp_fname.edit.focusrectangle = "No"
ls_rtv = dw_1.Modify( "emp_fname.edit.focusrectangle='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.focusrectangle ~r~n"
elseif dw_1.describe("emp_fname.edit.focusrectangle") = dw_1.object.emp_fname.edit.focusrectangle then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.focusrectangle ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.focusrectangle ~r~n"
end if 

//edit.password 
dw_1.object.emp_fname.edit.password = "no"
ls_rtv = dw_1.Modify( "emp_fname.edit.password='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.password ~r~n"
elseif dw_1.describe("emp_fname.edit.password") = dw_1.object.emp_fname.edit.password then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.password ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.password ~r~n"
end if 
//edit.format 
dw_1.object.emp_fname.edit.format = "*******"
dw_1.object.emp_fname.edit.password = "no"

//edit.format 
dw_1.object.emp_fname.edit.format = "Name:@@@@@@"
ls_rtv = dw_1.Modify( "emp_fname.edit.format='Name-@@@@@@'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.format ~r~n"
elseif dw_1.describe("emp_fname.edit.format") = dw_1.object.emp_fname.edit.format then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.format ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.format ~r~n"
end if 

//edit.hscrollbar 
dw_1.object.emp_fname.edit.hscrollbar = "No"
ls_rtv = dw_1.Modify( "emp_fname.edit.hscrollbar='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.hscrollbar ~r~n"
elseif dw_1.describe("emp_fname.edit.hscrollbar") = dw_1.object.emp_fname.edit.hscrollbar then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.hscrollbar ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.hscrollbar ~r~n"
end if 

//edit.imemode , for japan

//edit.limit 
dw_1.object.emp_fname.edit.limit = "10"
ls_rtv = dw_1.Modify( "emp_fname.edit.limit='8'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.limit ~r~n"
elseif dw_1.describe("emp_fname.edit.limit") = dw_1.object.emp_fname.edit.limit then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.limit ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.limit ~r~n"
end if 

//edit.name 
dw_1.object.emp_fname.edit.name = "employees"
ls_rtv = dw_1.Modify( "emp_fname.edit.name='employees'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.name ~r~n"
elseif dw_1.describe("emp_fname.edit.name") = dw_1.object.emp_fname.edit.name then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.name ~r~n"
end if 

//edit.nilisnull 
dw_1.object.emp_fname.edit.nilisnull = "no"
ls_rtv = dw_1.Modify( "emp_fname.edit.nilisnull='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.nilisnull ~r~n"
elseif dw_1.describe("emp_fname.edit.nilisnull") = dw_1.object.emp_fname.edit.nilisnull then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.nilisnull ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.nilisnull ~r~n"
end if 

//edit.required 
dw_1.object.emp_fname.edit.required = "no"
ls_rtv = dw_1.Modify( "emp_fname.edit.required='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.required ~r~n"
elseif dw_1.describe("emp_fname.edit.required") = dw_1.object.emp_fname.edit.required then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.required ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.required ~r~n"
end if 

//edit.style 
if dw_1.Describe("emp_fname.edit.style") = dw_1.object.emp_fname.edit.style then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.style ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.style ~r~n"
end if 

//edit.validatecode 
dw_1.object.emp_fname.edit.validatecode = "no"
ls_rtv = dw_1.Modify( "emp_fname.edit.validatecode='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.validatecode ~r~n"
elseif dw_1.describe("emp_fname.edit.validatecode") = dw_1.object.emp_fname.edit.validatecode then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.validatecode ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.validatecode ~r~n"
end if 

//edit.vscrollbar
dw_1.object.emp_fname.edit.vscrollbar = "no"
ls_rtv = dw_1.Modify( "emp_fname.edit.vscrollbar='yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control edit.vscrollbar ~r~n"
elseif dw_1.describe("emp_fname.edit.vscrollbar") = dw_1.object.emp_fname.edit.vscrollbar then 
	mle_1.text += "Succeed ! DataWindow Column Control edit.vscrollbar ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control edit.vscrollbar ~r~n"
end if 
end subroutine

public subroutine wf_column_checkbox ();//use column bene_life_ins
string ls_rtv
//checkbox.3d 
//checkbox.threed
dw_1.object.bene_life_ins.checkbox.threed = "no"
ls_rtv = dw_1.Modify( "bene_life_ins.checkbox.3d='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control checkbox.3d ~r~n"
elseif dw_1.describe("bene_life_ins.checkbox.3d") = dw_1.object.bene_life_ins.checkbox.threed then 
	mle_1.text += "Succeed ! DataWindow Column Control checkbox.3d ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control checkbox.3d ~r~n"
end if 

//checkbox.lefttext 
dw_1.object.bene_life_ins.checkbox.lefttext = "no"
ls_rtv = dw_1.Modify( "bene_life_ins.checkbox.lefttext='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control checkbox.lefttext ~r~n"
elseif dw_1.describe("bene_life_ins.checkbox.lefttext") = dw_1.object.bene_life_ins.checkbox.lefttext then 
	mle_1.text += "Succeed ! DataWindow Column Control checkbox.lefttext ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control checkbox.lefttext ~r~n"
end if 

//checkbox.off 
dw_1.object.bene_life_ins.checkbox.off = "N"
ls_rtv = dw_1.Modify( "bene_life_ins.checkbox.off='N'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control checkbox.off ~r~n"
elseif dw_1.describe("bene_life_ins.checkbox.off") = dw_1.object.bene_life_ins.checkbox.off then 
	mle_1.text += "Succeed ! DataWindow Column Control checkbox.off ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control checkbox.off ~r~n"
end if 
//checkbox.on 
dw_1.object.bene_life_ins.checkbox.on = "Y"
ls_rtv = dw_1.Modify( "bene_life_ins.checkbox.on='Y'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control checkbox.on ~r~n"
elseif dw_1.describe("bene_life_ins.checkbox.on") = dw_1.object.bene_life_ins.checkbox.on then 
	mle_1.text += "Succeed ! DataWindow Column Control checkbox.on ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control checkbox.on ~r~n"
end if 

//checkbox.scale 
dw_1.object.bene_life_ins.checkbox.scale = "No"
ls_rtv = dw_1.Modify( "bene_life_ins.checkbox.scale='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control checkbox.scale ~r~n"
elseif dw_1.describe("bene_life_ins.checkbox.scale") = dw_1.object.bene_life_ins.checkbox.scale then 
	mle_1.text += "Succeed ! DataWindow Column Control checkbox.scale ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control checkbox.scale ~r~n"
end if 

//checkbox.other 
dw_1.object.bene_life_ins.checkbox.other = "U"
ls_rtv = dw_1.Modify( "bene_life_ins.checkbox.other='U'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control checkbox.other ~r~n"
elseif dw_1.describe("bene_life_ins.checkbox.other") = dw_1.object.bene_life_ins.checkbox.other then 
	mle_1.text += "Succeed ! DataWindow Column Control checkbox.other ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control checkbox.other ~r~n"
end if 

//checkbox.text 
dw_1.object.bene_life_ins.checkbox.text = "My Checkbox"
ls_rtv = dw_1.Modify( "bene_life_ins.checkbox.text='Hi Checkbox'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control checkbox.text ~r~n"
elseif dw_1.describe("bene_life_ins.checkbox.text") = dw_1.object.bene_life_ins.checkbox.text then 
	mle_1.text += "Succeed ! DataWindow Column Control checkbox.text ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control checkbox.text ~r~n"
end if 

end subroutine

public subroutine wf_graph_pie_dispattr ();//pie.dispattr.alignment 
//pie.dispattr.autosize 
//pie.dispattr.backcolor 
//pie.dispattr.displayexpression 
//pie.dispattr.font.charset 
//pie.dispattr.font.escapement 
//pie.dispattr.font.face 
//pie.dispattr.font.family 
//pie.dispattr.font.height 
//pie.dispattr.font.italic 
//pie.dispattr.font.orientation 
//pie.dispattr.font.pitch 
//pie.dispattr.font.strikethrough 
//pie.dispattr.font.underline 
//pie.dispattr.font.weight 
//pie.dispattr.font.width 
//pie.dispattr.format 
//pie.dispattr.textcolor 

string ls_rtv 
int i

dw_1.object.gr_1.graphtype = '17'

//pie.dispattr.alignment 
dw_1.object.gr_1.pie.dispattr.alignment = '1'
dw_1.object.gr_1.category.dispattr.alignment = '0'
ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.alignment ='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.alignment ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.alignment") = dw_1.object.gr_1.pie.dispattr.alignment then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.alignment ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.alignment ~r~n"
end if 

//pie.dispattr.autosize 
dw_1.object.gr_1.pie.dispattr.autosize = '0'
ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.autosize ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.autosize ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.autosize") = dw_1.object.gr_1.pie.dispattr.autosize then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.autosize ~r~n"
end if 

//pie.dispattr.backcolor 
dw_1.object.gr_1.pie.dispattr.backcolor = '255'
ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.backcolor ='260~trgb(100,100,0)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.backcolor ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.backcolor") = dw_1.object.gr_1.pie.dispattr.backcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.backcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.backcolor ~r~n"
end if 

//pie.dispattr.displayexpression 
dw_1.object.gr_1.pie.dispattr.displayexpression = dw_1.object.gr_1.pie.dispattr.displayexpression + " - new "
ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.displayexpression ='pie' ")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.displayexpression ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.displayexpression") = dw_1.object.gr_1.pie.dispattr.displayexpression then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.displayexpression ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.displayexpression ~r~n"
end if 


//pie.dispattr.font.charset 
//pie.dispattr.font.escapement 
//pie.dispattr.font.face 
//pie.dispattr.font.family 
//pie.dispattr.font.height 
//pie.dispattr.font.italic 
//pie.dispattr.font.orientation 
//pie.dispattr.font.pitch 
//pie.dispattr.font.strikethrough 
//pie.dispattr.font.underline 
//pie.dispattr.font.weight 
//pie.dispattr.font.width 

//font.charset 
dw_1.object.gr_1.pie.dispattr.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.Font.CharSet	='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.Font.CharSet") = dw_1.object.gr_1.pie.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.Font.CharSet") = dw_1.object.gr_1.pie.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.Font.CharSet") = dw_1.object.gr_1.pie.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.Font.CharSet") = dw_1.object.gr_1.pie.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.Font.CharSet") = dw_1.object.gr_1.pie.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.gr_1.pie.dispattr.Font.face = 'Arial'

ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.face ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.Font.face") = dw_1.object.gr_1.pie.dispattr.Font.face then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.gr_1.pie.dispattr.font.orientation = '900'
ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.orientation ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.orientation") = dw_1.object.gr_1.pie.dispattr.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.gr_1.pie.dispattr.Font.escapement = '450'
ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.escapement ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.Font.escapement") = dw_1.object.gr_1.pie.dispattr.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.gr_1.pie.dispattr.font.family = string(i)
	ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.family ~r~n"
	elseif dw_1.describe("gr_1.pie.dispattr.font.family") = dw_1.object.gr_1.pie.dispattr.font.family then 
		mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.gr_1.pie.dispattr.font.height = '-200'
ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.height") = dw_1.object.gr_1.pie.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.height") = dw_1.object.gr_1.pie.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.height ~r~n"
end if 

//font.italic 
dw_1.object.gr_1.pie.dispattr.font.italic = '1'
ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.italic") = dw_1.object.gr_1.pie.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.italic ~r~n"
end if 

dw_1.object.gr_1.pie.dispattr.font.italic = 'Yes'
ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.italic") = dw_1.object.gr_1.pie.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.gr_1.pie.dispattr.font.pitch = string(i)
	ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.pitch ~r~n"
	elseif dw_1.describe("gr_1.pie.dispattr.font.pitch") = dw_1.object.gr_1.pie.dispattr.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.gr_1.pie.dispattr.font.strikethrough = '1'
ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.strikethrough") = dw_1.object.gr_1.pie.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.strikethrough ~r~n"
end if 

dw_1.object.gr_1.pie.dispattr.font.strikethrough = 'yes'
ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.strikethrough") = dw_1.object.gr_1.pie.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.gr_1.pie.dispattr.font.underline = '1'
ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.underline") = dw_1.object.gr_1.pie.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.underline ~r~n"
end if 

dw_1.object.gr_1.pie.dispattr.font.underline = 'Yes'
ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.underline") = dw_1.object.gr_1.pie.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.underline ~r~n"
end if 

//font.weight 
dw_1.object.gr_1.pie.dispattr.font.weight = '400'
ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.weight") = dw_1.object.gr_1.pie.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.weight") = dw_1.object.gr_1.pie.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.weight ~r~n"
end if 

//font.width 
dw_1.object.gr_1.pie.dispattr.font.width = '40'
ls_rtv = dw_1.Modify("gr_1.pie.dispattr.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.width ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.font.width") = dw_1.object.gr_1.pie.dispattr.font.width then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.font.width ~r~n"
end if 


//pie.dispattr.format 
dw_1.object.gr_1.pie.dispattr.format = 'xxxxxxxxxxxxxxxxxxxxx'
ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.format ='[general]'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.format ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.format") = dw_1.object.gr_1.pie.dispattr.format then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.format ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.format ~r~n"
end if 

//pie.dispattr.textcolor 
dw_1.object.gr_1.pie.dispattr.textcolor = '65534'
ls_rtv = dw_1.Modify( "gr_1.pie.dispattr.textcolor ='260~trgb(0,100,100)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.textcolor ~r~n"
elseif dw_1.describe("gr_1.pie.dispattr.textcolor") = dw_1.object.gr_1.pie.dispattr.textcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control pie.dispattr.textcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control pie.dispattr.textcolor ~r~n"
end if 

end subroutine

public subroutine wf_graph_legend_dispattr ();//legend.dispattr.alignment 
//legend.dispattr.autosize 
//legend.dispattr.backcolor 
//legend.dispattr.displayexpression 
//legend.dispattr.font.charset 
//legend.dispattr.font.escapement 
//legend.dispattr.font.face 
//legend.dispattr.font.family 
//legend.dispattr.font.height 
//legend.dispattr.font.italic 
//legend.dispattr.font.orientation 
//legend.dispattr.font.pitch 
//legend.dispattr.font.strikethrough 
//legend.dispattr.font.underline 
//legend.dispattr.font.weight 
//legend.dispattr.font.width 
//legend.dispattr.format 
//legend.dispattr.textcolor 

string ls_rtv 
int i

//legend.dispattr.alignment 
dw_1.object.gr_1.legend.dispattr.alignment = '1'
dw_1.object.gr_1.legend.dispattr.alignment = '0'
ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.alignment ='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.alignment ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.alignment") = dw_1.object.gr_1.legend.dispattr.alignment then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.alignment ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.alignment ~r~n"
end if 

//legend.dispattr.autosize 
dw_1.object.gr_1.legend.dispattr.autosize = '0'
ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.autosize ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.autosize ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.autosize") = dw_1.object.gr_1.legend.dispattr.autosize then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.autosize ~r~n"
end if 

//legend.dispattr.backcolor 
dw_1.object.gr_1.legend.dispattr.backcolor = '255'
ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.backcolor ='260~trgb(255,0,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.backcolor ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.backcolor") = dw_1.object.gr_1.legend.dispattr.backcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.backcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.backcolor ~r~n"
end if 

//legend.dispattr.displayexpression 
dw_1.object.gr_1.legend.dispattr.displayexpression = dw_1.object.gr_1.legend.dispattr.displayexpression + " - new "
ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.displayexpression ='legend' ")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.displayexpression ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.displayexpression") = dw_1.object.gr_1.legend.dispattr.displayexpression then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.displayexpression ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.displayexpression ~r~n"
end if 


//legend.dispattr.font.charset 
//legend.dispattr.font.escapement 
//legend.dispattr.font.face 
//legend.dispattr.font.family 
//legend.dispattr.font.height 
//legend.dispattr.font.italic 
//legend.dispattr.font.orientation 
//legend.dispattr.font.pitch 
//legend.dispattr.font.strikethrough 
//legend.dispattr.font.underline 
//legend.dispattr.font.weight 
//legend.dispattr.font.width 

//font.charset 
dw_1.object.gr_1.legend.dispattr.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.Font.CharSet	='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.Font.CharSet") = dw_1.object.gr_1.legend.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.Font.CharSet") = dw_1.object.gr_1.legend.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.Font.CharSet") = dw_1.object.gr_1.legend.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.Font.CharSet") = dw_1.object.gr_1.legend.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.Font.CharSet") = dw_1.object.gr_1.legend.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.gr_1.legend.dispattr.Font.face = 'Arial'

ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.face ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.Font.face") = dw_1.object.gr_1.legend.dispattr.Font.face then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.gr_1.legend.dispattr.font.orientation = '900'
ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.orientation ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.orientation") = dw_1.object.gr_1.legend.dispattr.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.gr_1.legend.dispattr.Font.escapement = '450'
ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.escapement ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.Font.escapement") = dw_1.object.gr_1.legend.dispattr.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.gr_1.legend.dispattr.font.family = string(i)
	ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.family ~r~n"
	elseif dw_1.describe("gr_1.legend.dispattr.font.family") = dw_1.object.gr_1.legend.dispattr.font.family then 
		mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.gr_1.legend.dispattr.font.height = '-200'
ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.height") = dw_1.object.gr_1.legend.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.height") = dw_1.object.gr_1.legend.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.height ~r~n"
end if 

//font.italic 
dw_1.object.gr_1.legend.dispattr.font.italic = '1'
ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.italic") = dw_1.object.gr_1.legend.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.italic ~r~n"
end if 

dw_1.object.gr_1.legend.dispattr.font.italic = 'Yes'
ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.italic") = dw_1.object.gr_1.legend.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.gr_1.legend.dispattr.font.pitch = string(i)
	ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.pitch ~r~n"
	elseif dw_1.describe("gr_1.legend.dispattr.font.pitch") = dw_1.object.gr_1.legend.dispattr.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.gr_1.legend.dispattr.font.strikethrough = '1'
ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.strikethrough") = dw_1.object.gr_1.legend.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.strikethrough ~r~n"
end if 

dw_1.object.gr_1.legend.dispattr.font.strikethrough = 'yes'
ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.strikethrough") = dw_1.object.gr_1.legend.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.gr_1.legend.dispattr.font.underline = '1'
ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.underline") = dw_1.object.gr_1.legend.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.underline ~r~n"
end if 

dw_1.object.gr_1.legend.dispattr.font.underline = 'Yes'
ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.underline") = dw_1.object.gr_1.legend.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.underline ~r~n"
end if 

//font.weight 
dw_1.object.gr_1.legend.dispattr.font.weight = '400'
ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.weight") = dw_1.object.gr_1.legend.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.weight") = dw_1.object.gr_1.legend.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.weight ~r~n"
end if 

//font.width 
dw_1.object.gr_1.legend.dispattr.font.width = '40'
ls_rtv = dw_1.Modify("gr_1.legend.dispattr.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.width ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.font.width") = dw_1.object.gr_1.legend.dispattr.font.width then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.font.width ~r~n"
end if 


//legend.dispattr.format 
dw_1.object.gr_1.legend.dispattr.format = 'xxxxxxxxxxxxxxxxxxxxx'
ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.format ='[general]'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.format ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.format") = dw_1.object.gr_1.legend.dispattr.format then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.format ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.format ~r~n"
end if 

//legend.dispattr.textcolor 
dw_1.object.gr_1.legend.dispattr.textcolor = '255'
ls_rtv = dw_1.Modify( "gr_1.legend.dispattr.textcolor ='260~trgb(255,128,1)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.textcolor ~r~n"
elseif dw_1.describe("gr_1.legend.dispattr.textcolor") = dw_1.object.gr_1.legend.dispattr.textcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend.dispattr.textcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend.dispattr.textcolor ~r~n"
end if 

end subroutine

public subroutine wf_graph_title_dispattr ();//title.dispattr.alignment 
//title.dispattr.autosize 
//title.dispattr.backcolor 
//title.dispattr.displayexpression 
//title.dispattr.font.charset 
//title.dispattr.font.escapement 
//title.dispattr.font.face 
//title.dispattr.font.family 
//title.dispattr.font.height 
//title.dispattr.font.italic 
//title.dispattr.font.orientation 
//title.dispattr.font.pitch 
//title.dispattr.font.strikethrough 
//title.dispattr.font.underline 
//title.dispattr.font.weight 
//title.dispattr.font.width 
//title.dispattr.format 
//title.dispattr.textcolor 

string ls_rtv 
int i

//title.dispattr.alignment 
dw_1.object.gr_1.title.dispattr.alignment = '1'
dw_1.object.gr_1.title.dispattr.alignment = '0'
ls_rtv = dw_1.Modify( "gr_1.title.dispattr.alignment ='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.alignment ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.alignment") = dw_1.object.gr_1.title.dispattr.alignment then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.alignment ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.alignment ~r~n"
end if 

//title.dispattr.autosize 
dw_1.object.gr_1.title.dispattr.autosize = '0'
ls_rtv = dw_1.Modify( "gr_1.category.dispattr.autosize ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.autosize ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.autosize") = dw_1.object.gr_1.title.dispattr.autosize then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.autosize ~r~n"
end if 

//title.dispattr.backcolor 
dw_1.object.gr_1.title.dispattr.backcolor = '255'
ls_rtv = dw_1.Modify( "gr_1.title.dispattr.backcolor ='260~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.backcolor ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.backcolor") = dw_1.object.gr_1.title.dispattr.backcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.backcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.backcolor ~r~n"
end if 

//title.dispattr.displayexpression 
dw_1.object.gr_1.title.dispattr.displayexpression = dw_1.object.gr_1.title.dispattr.displayexpression + " - new "
ls_rtv = dw_1.Modify( "gr_1.title.dispattr.displayexpression ='title' ")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.displayexpression ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.displayexpression") = dw_1.object.gr_1.title.dispattr.displayexpression then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.displayexpression ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.displayexpression ~r~n"
end if 


//title.dispattr.font.charset 
//title.dispattr.font.escapement 
//title.dispattr.font.face 
//title.dispattr.font.family 
//title.dispattr.font.height 
//title.dispattr.font.italic 
//title.dispattr.font.orientation 
//title.dispattr.font.pitch 
//title.dispattr.font.strikethrough 
//title.dispattr.font.underline 
//title.dispattr.font.weight 
//title.dispattr.font.width 

//font.charset 
dw_1.object.gr_1.title.dispattr.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "gr_1.title.dispattr.Font.CharSet	='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.Font.CharSet") = dw_1.object.gr_1.title.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.title.dispattr.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.Font.CharSet") = dw_1.object.gr_1.title.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.title.dispattr.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.Font.CharSet") = dw_1.object.gr_1.title.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.title.dispattr.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.Font.CharSet") = dw_1.object.gr_1.title.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.title.dispattr.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.Font.CharSet") = dw_1.object.gr_1.title.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.gr_1.title.dispattr.Font.face = 'Arial'

ls_rtv = dw_1.Modify( "gr_1.title.dispattr.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.face ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.Font.face") = dw_1.object.gr_1.title.dispattr.Font.face then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.gr_1.title.dispattr.font.orientation = '900'
ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.orientation ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.orientation") = dw_1.object.gr_1.title.dispattr.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.gr_1.title.dispattr.Font.escapement = '450'
ls_rtv = dw_1.Modify( "gr_1.title.dispattr.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.escapement ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.Font.escapement") = dw_1.object.gr_1.title.dispattr.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.gr_1.title.dispattr.font.family = string(i)
	ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.family ~r~n"
	elseif dw_1.describe("gr_1.title.dispattr.font.family") = dw_1.object.gr_1.title.dispattr.font.family then 
		mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.gr_1.title.dispattr.font.height = '-200'
ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.height") = dw_1.object.gr_1.title.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.height") = dw_1.object.gr_1.title.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.height ~r~n"
end if 

//font.italic 
dw_1.object.gr_1.title.dispattr.font.italic = '1'
ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.italic") = dw_1.object.gr_1.title.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.italic ~r~n"
end if 

dw_1.object.gr_1.title.dispattr.font.italic = 'Yes'
ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.italic") = dw_1.object.gr_1.title.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.gr_1.title.dispattr.font.pitch = string(i)
	ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.pitch ~r~n"
	elseif dw_1.describe("gr_1.title.dispattr.font.pitch") = dw_1.object.gr_1.title.dispattr.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.gr_1.title.dispattr.font.strikethrough = '1'
ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.strikethrough") = dw_1.object.gr_1.title.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.strikethrough ~r~n"
end if 

dw_1.object.gr_1.title.dispattr.font.strikethrough = 'yes'
ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.strikethrough") = dw_1.object.gr_1.title.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.gr_1.title.dispattr.font.underline = '1'
ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.underline") = dw_1.object.gr_1.title.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.underline ~r~n"
end if 

dw_1.object.gr_1.title.dispattr.font.underline = 'Yes'
ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.underline") = dw_1.object.gr_1.title.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.underline ~r~n"
end if 

//font.weight 
dw_1.object.gr_1.title.dispattr.font.weight = '400'
ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.weight") = dw_1.object.gr_1.title.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.weight") = dw_1.object.gr_1.title.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.weight ~r~n"
end if 

//font.width 
dw_1.object.gr_1.title.dispattr.font.width = '40'
ls_rtv = dw_1.Modify("gr_1.title.dispattr.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.width ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.font.width") = dw_1.object.gr_1.title.dispattr.font.width then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.font.width ~r~n"
end if 


//title.dispattr.format 
dw_1.object.gr_1.title.dispattr.format = 'xxxxxxxxxxxxxxxxxxxxx'
ls_rtv = dw_1.Modify( "gr_1.title.dispattr.format ='[general]'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.format ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.format") = dw_1.object.gr_1.title.dispattr.format then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.format ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.format ~r~n"
end if 

//title.dispattr.textcolor 
dw_1.object.gr_1.title.dispattr.textcolor = '65534'
ls_rtv = dw_1.Modify( "gr_1.title.dispattr.textcolor ='260~trgb(200,255,1)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.textcolor ~r~n"
elseif dw_1.describe("gr_1.title.dispattr.textcolor") = dw_1.object.gr_1.title.dispattr.textcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control title.dispattr.textcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title.dispattr.textcolor ~r~n"
end if 

end subroutine

public subroutine wf_graph_series_dispattr ();//series.dispattr.alignment 
//series.dispattr.autosize 
//series.dispattr.backcolor 
//series.dispattr.displayexpression 
//series.dispattr.font.charset 
//series.dispattr.font.escapement 
//series.dispattr.font.face 
//series.dispattr.font.family 
//series.dispattr.font.height 
//series.dispattr.font.italic 
//series.dispattr.font.orientation 
//series.dispattr.font.pitch 
//series.dispattr.font.strikethrough 
//series.dispattr.font.underline 
//series.dispattr.font.weight 
//series.dispattr.font.width 
//series.dispattr.format 
//series.dispattr.textcolor 
//series.labeldispattr.alignment 
//series.labeldispattr.autosize 
//series.labeldispattr.backcolor 
//series.labeldispattr.displayexpression 
//series.labeldispattr.font.charset 
//series.labeldispattr.font.escapement 
//series.labeldispattr.font.face 
//series.labeldispattr.font.family 
//series.labeldispattr.font.height 
//series.labeldispattr.font.italic 
//series.labeldispattr.font.orientation 
//series.labeldispattr.font.pitch 
//series.labeldispattr.font.strikethrough 
//series.labeldispattr.font.underline 
//series.labeldispattr.font.weight 
//series.labeldispattr.font.width 
//series.labeldispattr.format 
//series.labeldispattr.textcolor 

string ls_rtv 
int i

//series.dispattr.alignment 
dw_1.object.gr_1.series.dispattr.alignment = '1'
dw_1.object.gr_1.series.dispattr.alignment = '0'
ls_rtv = dw_1.Modify( "gr_1.series.dispattr.alignment ='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.alignment ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.alignment") = dw_1.object.gr_1.series.dispattr.alignment then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.alignment ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.alignment ~r~n"
end if 

//category.dispattr.autosize 
dw_1.object.gr_1.series.dispattr.autosize = '0'
ls_rtv = dw_1.Modify( "gr_1.series.dispattr.autosize ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.autosize ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.autosize") = dw_1.object.gr_1.series.dispattr.autosize then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.autosize ~r~n"
end if 

//series.dispattr.backcolor 
dw_1.object.gr_1.series.dispattr.backcolor = '255'
ls_rtv = dw_1.Modify( "gr_1.series.dispattr.backcolor ='260~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.backcolor ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.backcolor") = dw_1.object.gr_1.series.dispattr.backcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.backcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.backcolor ~r~n"
end if 

//series.dispattr.displayexpression 
dw_1.object.gr_1.series.dispattr.displayexpression = dw_1.object.gr_1.series.dispattr.displayexpression + " - new "
ls_rtv = dw_1.Modify( "gr_1.series.dispattr.displayexpression ='series' ")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.displayexpression ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.displayexpression") = dw_1.object.gr_1.series.dispattr.displayexpression then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.displayexpression ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.displayexpression ~r~n"
end if 


//series.dispattr.font.charset 
//series.dispattr.font.escapement 
//series.dispattr.font.face 
//series.dispattr.font.family 
//series.dispattr.font.height 
//series.dispattr.font.italic 
//series.dispattr.font.orientation 
//series.dispattr.font.pitch 
//series.dispattr.font.strikethrough 
//series.dispattr.font.underline 
//series.dispattr.font.weight 
//series.dispattr.font.width 

//font.charset 
dw_1.object.gr_1.series.dispattr.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "gr_1.series.dispattr.Font.CharSet	='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.Font.CharSet") = dw_1.object.gr_1.series.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.series.dispattr.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.Font.CharSet") = dw_1.object.gr_1.series.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.series.dispattr.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.Font.CharSet") = dw_1.object.gr_1.series.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.series.dispattr.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.Font.CharSet") = dw_1.object.gr_1.series.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.series.dispattr.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.Font.CharSet") = dw_1.object.gr_1.series.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.gr_1.series.dispattr.Font.face = 'Arial'

ls_rtv = dw_1.Modify( "gr_1.series.dispattr.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.face ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.Font.face") = dw_1.object.gr_1.series.dispattr.Font.face then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.gr_1.series.dispattr.font.orientation = '900'
ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.orientation ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.orientation") = dw_1.object.gr_1.series.dispattr.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.gr_1.series.dispattr.Font.escapement = '450'
ls_rtv = dw_1.Modify( "gr_1.series.dispattr.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.escapement ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.Font.escapement") = dw_1.object.gr_1.series.dispattr.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.gr_1.series.dispattr.font.family = string(i)
	ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.family ~r~n"
	elseif dw_1.describe("gr_1.series.dispattr.font.family") = dw_1.object.gr_1.series.dispattr.font.family then 
		mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.gr_1.series.dispattr.font.height = '-200'
ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.height") = dw_1.object.gr_1.series.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.height") = dw_1.object.gr_1.series.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.height ~r~n"
end if 

//font.italic 
dw_1.object.gr_1.series.dispattr.font.italic = '1'
ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.italic") = dw_1.object.gr_1.series.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.italic ~r~n"
end if 

dw_1.object.gr_1.series.dispattr.font.italic = 'Yes'
ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.italic") = dw_1.object.gr_1.series.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.gr_1.series.dispattr.font.pitch = string(i)
	ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.pitch ~r~n"
	elseif dw_1.describe("gr_1.series.dispattr.font.pitch") = dw_1.object.gr_1.series.dispattr.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.gr_1.series.dispattr.font.strikethrough = '1'
ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.strikethrough") = dw_1.object.gr_1.series.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.strikethrough ~r~n"
end if 

dw_1.object.gr_1.series.dispattr.font.strikethrough = 'yes'
ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.strikethrough") = dw_1.object.gr_1.series.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.gr_1.series.dispattr.font.underline = '1'
ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.underline") = dw_1.object.gr_1.series.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.underline ~r~n"
end if 

dw_1.object.gr_1.series.dispattr.font.underline = 'Yes'
ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.underline") = dw_1.object.gr_1.series.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.underline ~r~n"
end if 

//font.weight 
dw_1.object.gr_1.series.dispattr.font.weight = '400'
ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.weight") = dw_1.object.gr_1.series.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.weight") = dw_1.object.gr_1.series.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.weight ~r~n"
end if 

//font.width 
dw_1.object.gr_1.series.dispattr.font.width = '40'
ls_rtv = dw_1.Modify("gr_1.series.dispattr.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.width ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.font.width") = dw_1.object.gr_1.series.dispattr.font.width then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.font.width ~r~n"
end if 


//series.dispattr.format 
dw_1.object.gr_1.series.dispattr.format = 'xxxxxxxxxxxxxxxxxxxxx'
ls_rtv = dw_1.Modify( "gr_1.series.dispattr.format ='[general]'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.format ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.format") = dw_1.object.gr_1.series.dispattr.format then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.format ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.format ~r~n"
end if 

//series.dispattr.textcolor 
dw_1.object.gr_1.series.dispattr.textcolor = '65534'
ls_rtv = dw_1.Modify( "gr_1.series.dispattr.textcolor ='260~trgb(200,255,1)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.textcolor ~r~n"
elseif dw_1.describe("gr_1.series.dispattr.textcolor") = dw_1.object.gr_1.series.dispattr.textcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.dispattr.textcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.dispattr.textcolor ~r~n"
end if 

//series.labeldispattr.alignment 
//series.labeldispattr.autosize 
//series.labeldispattr.backcolor 
//series.labeldispattr.displayexpression 

//series.labeldispattr.alignment 
dw_1.object.gr_1.series.labeldispattr.alignment = '1'
dw_1.object.gr_1.series.labeldispattr.alignment = '0'
ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.alignment ='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.alignment ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.alignment") = dw_1.object.gr_1.series.labeldispattr.alignment then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.alignment ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.alignment ~r~n"
end if 

//series.labeldispattr.autosize 
dw_1.object.gr_1.series.labeldispattr.autosize = '0'
ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.autosize ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.autosize ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.autosize") = dw_1.object.gr_1.series.labeldispattr.autosize then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.autosize ~r~n"
end if 

//series.labeldispattr.backcolor 
dw_1.object.gr_1.series.labeldispattr.backcolor = '255'
ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.backcolor ='260~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.backcolor ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.backcolor") = dw_1.object.gr_1.series.labeldispattr.backcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.backcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.backcolor ~r~n"
end if 

//series.labeldispattr.displayexpression 
dw_1.object.gr_1.series.labeldispattr.displayexpression = dw_1.object.gr_1.series.labeldispattr.displayexpression + " - new "
ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.displayexpression ='seriesaxislabel' ")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.displayexpression ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.displayexpression") = dw_1.object.gr_1.series.labeldispattr.displayexpression then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.displayexpression ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.displayexpression ~r~n"
end if

//series.labeldispattr.font.charset 
//series.labeldispattr.font.escapement 
//series.labeldispattr.font.face 
//series.labeldispattr.font.family 
//series.labeldispattr.font.height 
//series.labeldispattr.font.italic 
//series.labeldispattr.font.orientation 
//series.labeldispattr.font.pitch 
//series.labeldispattr.font.strikethrough 
//series.labeldispattr.font.underline 
//series.labeldispattr.font.weight 
//series.labeldispattr.font.width 

//font.charset 
dw_1.object.gr_1.series.labeldispattr.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.Font.CharSet	='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.Font.CharSet") = dw_1.object.gr_1.series.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.Font.CharSet") = dw_1.object.gr_1.series.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.Font.CharSet") = dw_1.object.gr_1.series.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.Font.CharSet") = dw_1.object.gr_1.series.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.Font.CharSet") = dw_1.object.gr_1.series.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.gr_1.series.labeldispattr.Font.face = 'Arial'

ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.face ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.Font.face") = dw_1.object.gr_1.series.labeldispattr.Font.face then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.gr_1.series.labeldispattr.font.orientation = '900'
ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.orientation ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.orientation") = dw_1.object.gr_1.series.labeldispattr.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.gr_1.series.labeldispattr.Font.escapement = '450'
ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.escapement ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.Font.escapement") = dw_1.object.gr_1.series.labeldispattr.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.gr_1.series.labeldispattr.font.family = string(i)
	ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.family ~r~n"
	elseif dw_1.describe("gr_1.series.labeldispattr.font.family") = dw_1.object.gr_1.series.labeldispattr.font.family then 
		mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.gr_1.series.labeldispattr.font.height = '-200'
ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.height") = dw_1.object.gr_1.series.labeldispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.height") = dw_1.object.gr_1.series.labeldispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.height ~r~n"
end if 

//font.italic 
dw_1.object.gr_1.series.labeldispattr.font.italic = '1'
ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.italic") = dw_1.object.gr_1.series.labeldispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.italic ~r~n"
end if 

dw_1.object.gr_1.series.labeldispattr.font.italic = 'Yes'
ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.italic") = dw_1.object.gr_1.series.labeldispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.gr_1.series.labeldispattr.font.pitch = string(i)
	ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.pitch ~r~n"
	elseif dw_1.describe("gr_1.series.labeldispattr.font.pitch") = dw_1.object.gr_1.series.labeldispattr.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.gr_1.series.labeldispattr.font.strikethrough = '1'
ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.strikethrough") = dw_1.object.gr_1.series.labeldispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.strikethrough ~r~n"
end if 

dw_1.object.gr_1.series.labeldispattr.font.strikethrough = 'yes'
ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.strikethrough") = dw_1.object.gr_1.series.labeldispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.gr_1.series.labeldispattr.font.underline = '1'
ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.underline") = dw_1.object.gr_1.series.labeldispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.underline ~r~n"
end if 

dw_1.object.gr_1.series.labeldispattr.font.underline = 'Yes'
ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.underline") = dw_1.object.gr_1.series.labeldispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.underline ~r~n"
end if 

//font.weight 
dw_1.object.gr_1.series.labeldispattr.font.weight = '400'
ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.weight") = dw_1.object.gr_1.series.labeldispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.weight") = dw_1.object.gr_1.series.labeldispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.weight ~r~n"
end if 

//font.width 
dw_1.object.gr_1.series.labeldispattr.font.width = '40'
ls_rtv = dw_1.Modify("gr_1.series.labeldispattr.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.width ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.font.width") = dw_1.object.gr_1.series.labeldispattr.font.width then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.font.width ~r~n"
end if 

//series.labeldispattr.format 
//series.labeldispattr.textcolor 
//series.labeldispattr.format 
dw_1.object.gr_1.series.labeldispattr.format = 'xxxxxxxxxxxxxxxxxxxxx'
ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.format ='[general]'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.format ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.format") = dw_1.object.gr_1.series.labeldispattr.format then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.format ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.format ~r~n"
end if 

//series.dispattr.textcolor 
dw_1.object.gr_1.series.labeldispattr.textcolor = '65534'
ls_rtv = dw_1.Modify( "gr_1.series.labeldispattr.textcolor ='260~trgb(200,255,1)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.textcolor ~r~n"
elseif dw_1.describe("gr_1.series.labeldispattr.textcolor") = dw_1.object.gr_1.series.labeldispattr.textcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.labeldispattr.textcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.labeldispattr.textcolor ~r~n"
end if 




end subroutine

public subroutine wf_graph_values_dispattr ();//values.dispattr.alignment 
//values.dispattr.autosize 
//values.dispattr.backcolor 
//values.dispattr.displayexpression 
//values.dispattr.font.charset 
//values.dispattr.font.escapement 
//values.dispattr.font.face 
//values.dispattr.font.family 
//values.dispattr.font.height 
//values.dispattr.font.italic 
//values.dispattr.font.orientation 
//values.dispattr.font.pitch 
//values.dispattr.font.strikethrough 
//values.dispattr.font.underline 
//values.dispattr.font.weight 
//values.dispattr.font.width 
//values.dispattr.format 
//values.dispattr.textcolor 
//values.labeldispattr.alignment 
//values.labeldispattr.autosize 
//values.labeldispattr.backcolor 
//values.labeldispattr.displayexpression 
//values.labeldispattr.font.charset 
//values.labeldispattr.font.escapement 
//values.labeldispattr.font.face 
//values.labeldispattr.font.family 
//values.labeldispattr.font.height 
//values.labeldispattr.font.italic 
//values.labeldispattr.font.orientation 
//values.labeldispattr.font.pitch 
//values.labeldispattr.font.strikethrough 
//values.labeldispattr.font.underline 
//values.labeldispattr.font.weight 
//values.labeldispattr.font.width 
//values.labeldispattr.format 
//values.labeldispattr.textcolor 


string ls_rtv 
int i

//values.dispattr.alignment 
dw_1.object.gr_1.values.dispattr.alignment = '1'
dw_1.object.gr_1.values.dispattr.alignment = '0'
ls_rtv = dw_1.Modify( "gr_1.values.dispattr.alignment ='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.alignment ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.alignment") = dw_1.object.gr_1.values.dispattr.alignment then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.alignment ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.alignment ~r~n"
end if 

//category.dispattr.autosize 
dw_1.object.gr_1.values.dispattr.autosize = '0'
ls_rtv = dw_1.Modify( "gr_1.values.dispattr.autosize ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.autosize ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.autosize") = dw_1.object.gr_1.values.dispattr.autosize then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.autosize ~r~n"
end if 

//values.dispattr.backcolor 
dw_1.object.gr_1.values.dispattr.backcolor = '255'
ls_rtv = dw_1.Modify( "gr_1.values.dispattr.backcolor ='260~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.backcolor ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.backcolor") = dw_1.object.gr_1.values.dispattr.backcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.backcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.backcolor ~r~n"
end if 

//values.dispattr.displayexpression 
dw_1.object.gr_1.values.dispattr.displayexpression = dw_1.object.gr_1.values.dispattr.displayexpression + " - new "
ls_rtv = dw_1.Modify( "gr_1.values.dispattr.displayexpression ='value' ")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.displayexpression ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.displayexpression") = dw_1.object.gr_1.values.dispattr.displayexpression then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.displayexpression ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.displayexpression ~r~n"
end if 


//values.dispattr.font.charset 
//values.dispattr.font.escapement 
//values.dispattr.font.face 
//values.dispattr.font.family 
//values.dispattr.font.height 
//values.dispattr.font.italic 
//values.dispattr.font.orientation 
//values.dispattr.font.pitch 
//values.dispattr.font.strikethrough 
//values.dispattr.font.underline 
//values.dispattr.font.weight 
//values.dispattr.font.width 

//font.charset 
dw_1.object.gr_1.values.dispattr.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "gr_1.values.dispattr.Font.CharSet	='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.Font.CharSet") = dw_1.object.gr_1.values.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.values.dispattr.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.Font.CharSet") = dw_1.object.gr_1.values.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.values.dispattr.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.Font.CharSet") = dw_1.object.gr_1.values.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.values.dispattr.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.Font.CharSet") = dw_1.object.gr_1.values.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.values.dispattr.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.Font.CharSet") = dw_1.object.gr_1.values.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.gr_1.values.dispattr.Font.face = 'Arial'

ls_rtv = dw_1.Modify( "gr_1.values.dispattr.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.face ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.Font.face") = dw_1.object.gr_1.values.dispattr.Font.face then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.gr_1.values.dispattr.font.orientation = '900'
ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.orientation ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.orientation") = dw_1.object.gr_1.values.dispattr.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.gr_1.values.dispattr.Font.escapement = '450'
ls_rtv = dw_1.Modify( "gr_1.values.dispattr.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.escapement ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.Font.escapement") = dw_1.object.gr_1.values.dispattr.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.gr_1.values.dispattr.font.family = string(i)
	ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.family ~r~n"
	elseif dw_1.describe("gr_1.values.dispattr.font.family") = dw_1.object.gr_1.values.dispattr.font.family then 
		mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.gr_1.values.dispattr.font.height = '-200'
ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.height") = dw_1.object.gr_1.values.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.height") = dw_1.object.gr_1.values.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.height ~r~n"
end if 

//font.italic 
dw_1.object.gr_1.values.dispattr.font.italic = '1'
ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.italic") = dw_1.object.gr_1.values.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.italic ~r~n"
end if 

dw_1.object.gr_1.values.dispattr.font.italic = 'Yes'
ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.italic") = dw_1.object.gr_1.values.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.gr_1.values.dispattr.font.pitch = string(i)
	ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.pitch ~r~n"
	elseif dw_1.describe("gr_1.values.dispattr.font.pitch") = dw_1.object.gr_1.values.dispattr.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.gr_1.values.dispattr.font.strikethrough = '1'
ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.strikethrough") = dw_1.object.gr_1.values.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.strikethrough ~r~n"
end if 

dw_1.object.gr_1.values.dispattr.font.strikethrough = 'yes'
ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.strikethrough") = dw_1.object.gr_1.values.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.gr_1.values.dispattr.font.underline = '1'
ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.underline") = dw_1.object.gr_1.values.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.underline ~r~n"
end if 

dw_1.object.gr_1.values.dispattr.font.underline = 'Yes'
ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.underline") = dw_1.object.gr_1.values.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.underline ~r~n"
end if 

//font.weight 
dw_1.object.gr_1.values.dispattr.font.weight = '400'
ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.weight") = dw_1.object.gr_1.values.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.weight") = dw_1.object.gr_1.values.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.weight ~r~n"
end if 

//font.width 
dw_1.object.gr_1.values.dispattr.font.width = '40'
ls_rtv = dw_1.Modify("gr_1.values.dispattr.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.width ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.font.width") = dw_1.object.gr_1.values.dispattr.font.width then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.font.width ~r~n"
end if 


//values.dispattr.format 
dw_1.object.gr_1.values.dispattr.format = 'xxxxxxxxxxxxxxxxxxxxx'
ls_rtv = dw_1.Modify( "gr_1.values.dispattr.format ='[general]'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.format ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.format") = dw_1.object.gr_1.values.dispattr.format then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.format ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.format ~r~n"
end if 

//values.dispattr.textcolor 
dw_1.object.gr_1.values.dispattr.textcolor = '65534'
ls_rtv = dw_1.Modify( "gr_1.values.dispattr.textcolor ='260~trgb(200,255,1)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.textcolor ~r~n"
elseif dw_1.describe("gr_1.values.dispattr.textcolor") = dw_1.object.gr_1.values.dispattr.textcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.dispattr.textcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.dispattr.textcolor ~r~n"
end if 

//values.labeldispattr.alignment 
//values.labeldispattr.autosize 
//values.labeldispattr.backcolor 
//values.labeldispattr.displayexpression 

//values.labeldispattr.alignment 
dw_1.object.gr_1.values.labeldispattr.alignment = '1'
dw_1.object.gr_1.values.labeldispattr.alignment = '0'
ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.alignment ='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.alignment ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.alignment") = dw_1.object.gr_1.values.labeldispattr.alignment then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.alignment ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.alignment ~r~n"
end if 

//values.labeldispattr.autosize 
dw_1.object.gr_1.values.labeldispattr.autosize = '0'
ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.autosize ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.autosize ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.autosize") = dw_1.object.gr_1.values.labeldispattr.autosize then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.autosize ~r~n"
end if 

//values.labeldispattr.backcolor 
dw_1.object.gr_1.values.labeldispattr.backcolor = '255'
ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.backcolor ='260~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.backcolor ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.backcolor") = dw_1.object.gr_1.values.labeldispattr.backcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.backcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.backcolor ~r~n"
end if 

//values.labeldispattr.displayexpression 
dw_1.object.gr_1.values.labeldispattr.displayexpression = dw_1.object.gr_1.values.labeldispattr.displayexpression + " - new "
ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.displayexpression ='valuesaxislabel' ")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.displayexpression ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.displayexpression") = dw_1.object.gr_1.values.labeldispattr.displayexpression then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.displayexpression ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.displayexpression ~r~n"
end if

//values.labeldispattr.font.charset 
//values.labeldispattr.font.escapement 
//values.labeldispattr.font.face 
//values.labeldispattr.font.family 
//values.labeldispattr.font.height 
//values.labeldispattr.font.italic 
//values.labeldispattr.font.orientation 
//values.labeldispattr.font.pitch 
//values.labeldispattr.font.strikethrough 
//values.labeldispattr.font.underline 
//values.labeldispattr.font.weight 
//values.labeldispattr.font.width 

//font.charset 
dw_1.object.gr_1.values.labeldispattr.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.Font.CharSet	='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.Font.CharSet") = dw_1.object.gr_1.values.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.Font.CharSet") = dw_1.object.gr_1.values.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.Font.CharSet") = dw_1.object.gr_1.values.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.Font.CharSet") = dw_1.object.gr_1.values.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.Font.CharSet") = dw_1.object.gr_1.values.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.gr_1.values.labeldispattr.Font.face = 'Arial'

ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.face ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.Font.face") = dw_1.object.gr_1.values.labeldispattr.Font.face then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.gr_1.values.labeldispattr.font.orientation = '900'
ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.orientation ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.orientation") = dw_1.object.gr_1.values.labeldispattr.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.gr_1.values.labeldispattr.Font.escapement = '450'
ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.escapement ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.Font.escapement") = dw_1.object.gr_1.values.labeldispattr.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.gr_1.values.labeldispattr.font.family = string(i)
	ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.family ~r~n"
	elseif dw_1.describe("gr_1.values.labeldispattr.font.family") = dw_1.object.gr_1.values.labeldispattr.font.family then 
		mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.gr_1.values.labeldispattr.font.height = '-200'
ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.height") = dw_1.object.gr_1.values.labeldispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.height") = dw_1.object.gr_1.values.labeldispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.height ~r~n"
end if 

//font.italic 
dw_1.object.gr_1.values.labeldispattr.font.italic = '1'
ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.italic") = dw_1.object.gr_1.values.labeldispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.italic ~r~n"
end if 

dw_1.object.gr_1.values.labeldispattr.font.italic = 'Yes'
ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.italic") = dw_1.object.gr_1.values.labeldispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.gr_1.values.labeldispattr.font.pitch = string(i)
	ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.pitch ~r~n"
	elseif dw_1.describe("gr_1.values.labeldispattr.font.pitch") = dw_1.object.gr_1.values.labeldispattr.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.gr_1.values.labeldispattr.font.strikethrough = '1'
ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.strikethrough") = dw_1.object.gr_1.values.labeldispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.strikethrough ~r~n"
end if 

dw_1.object.gr_1.values.labeldispattr.font.strikethrough = 'yes'
ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.strikethrough") = dw_1.object.gr_1.values.labeldispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.gr_1.values.labeldispattr.font.underline = '1'
ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.underline") = dw_1.object.gr_1.values.labeldispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.underline ~r~n"
end if 

dw_1.object.gr_1.values.labeldispattr.font.underline = 'Yes'
ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.underline") = dw_1.object.gr_1.values.labeldispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.underline ~r~n"
end if 

//font.weight 
dw_1.object.gr_1.values.labeldispattr.font.weight = '400'
ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.weight") = dw_1.object.gr_1.values.labeldispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.weight") = dw_1.object.gr_1.values.labeldispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.weight ~r~n"
end if 

//font.width 
dw_1.object.gr_1.values.labeldispattr.font.width = '40'
ls_rtv = dw_1.Modify("gr_1.values.labeldispattr.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.width ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.font.width") = dw_1.object.gr_1.values.labeldispattr.font.width then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.font.width ~r~n"
end if 

//values.labeldispattr.format 
//values.labeldispattr.textcolor 
//values.labeldispattr.format 
dw_1.object.gr_1.values.labeldispattr.format = 'xxxxxxxxxxxxxxxxxxxxx'
ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.format ='[general]'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.format ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.format") = dw_1.object.gr_1.values.labeldispattr.format then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.format ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.format ~r~n"
end if 

//values.dispattr.textcolor 
dw_1.object.gr_1.values.labeldispattr.textcolor = '65534'
ls_rtv = dw_1.Modify( "gr_1.values.labeldispattr.textcolor ='260~trgb(200,255,1)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.textcolor ~r~n"
elseif dw_1.describe("gr_1.values.labeldispattr.textcolor") = dw_1.object.gr_1.values.labeldispattr.textcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.labeldispattr.textcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.labeldispattr.textcolor ~r~n"
end if 



end subroutine

public subroutine wf_graph_category_dispattr ();string ls_rtv 
int i

//category.dispattr.alignment 
dw_1.object.gr_1.category.dispattr.alignment = '1'
dw_1.object.gr_1.category.dispattr.alignment = '0'
ls_rtv = dw_1.Modify( "gr_1.category.dispattr.alignment ='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.alignment ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.alignment") = dw_1.object.gr_1.category.dispattr.alignment then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.alignment ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.alignment ~r~n"
end if 

//category.dispattr.autosize 
dw_1.object.gr_1.category.dispattr.autosize = '0'
ls_rtv = dw_1.Modify( "gr_1.category.dispattr.autosize ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.autosize ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.autosize") = dw_1.object.gr_1.category.dispattr.autosize then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.autosize ~r~n"
end if 

//category.dispattr.backcolor 
dw_1.object.gr_1.category.dispattr.backcolor = '255'
ls_rtv = dw_1.Modify( "gr_1.category.dispattr.backcolor ='260~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.backcolor ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.backcolor") = dw_1.object.gr_1.category.dispattr.backcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.backcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.backcolor ~r~n"
end if 

//category.dispattr.displayexpression 
dw_1.object.gr_1.category.dispattr.displayexpression = dw_1.object.gr_1.category.dispattr.displayexpression + " - new "
ls_rtv = dw_1.Modify( "gr_1.category.dispattr.displayexpression ='category' ")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.displayexpression ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.displayexpression") = dw_1.object.gr_1.category.dispattr.displayexpression then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.displayexpression ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.displayexpression ~r~n"
end if 


//category.dispattr.font.charset 
//category.dispattr.font.escapement 
//category.dispattr.font.face 
//category.dispattr.font.family 
//category.dispattr.font.height 
//category.dispattr.font.italic 
//category.dispattr.font.orientation 
//category.dispattr.font.pitch 
//category.dispattr.font.strikethrough 
//category.dispattr.font.underline 
//category.dispattr.font.weight 
//category.dispattr.font.width 

//font.charset 
dw_1.object.gr_1.category.dispattr.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "gr_1.category.dispattr.Font.CharSet	='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.Font.CharSet") = dw_1.object.gr_1.category.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.category.dispattr.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.Font.CharSet") = dw_1.object.gr_1.category.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.category.dispattr.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.Font.CharSet") = dw_1.object.gr_1.category.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.category.dispattr.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.Font.CharSet") = dw_1.object.gr_1.category.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.category.dispattr.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.Font.CharSet") = dw_1.object.gr_1.category.dispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.gr_1.category.dispattr.Font.face = 'Arial'

ls_rtv = dw_1.Modify( "gr_1.category.dispattr.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.face ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.Font.face") = dw_1.object.gr_1.category.dispattr.Font.face then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.gr_1.category.dispattr.font.orientation = '900'
ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.orientation ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.orientation") = dw_1.object.gr_1.category.dispattr.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.gr_1.category.dispattr.Font.escapement = '450'
ls_rtv = dw_1.Modify( "gr_1.category.dispattr.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.escapement ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.Font.escapement") = dw_1.object.gr_1.category.dispattr.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.gr_1.category.dispattr.font.family = string(i)
	ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.family ~r~n"
	elseif dw_1.describe("gr_1.category.dispattr.font.family") = dw_1.object.gr_1.category.dispattr.font.family then 
		mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.gr_1.category.dispattr.font.height = '-200'
ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.height") = dw_1.object.gr_1.category.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.height") = dw_1.object.gr_1.category.dispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.height ~r~n"
end if 

//font.italic 
dw_1.object.gr_1.category.dispattr.font.italic = '1'
ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.italic") = dw_1.object.gr_1.category.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.italic ~r~n"
end if 

dw_1.object.gr_1.category.dispattr.font.italic = 'Yes'
ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.italic") = dw_1.object.gr_1.category.dispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.gr_1.category.dispattr.font.pitch = string(i)
	ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.pitch ~r~n"
	elseif dw_1.describe("gr_1.category.dispattr.font.pitch") = dw_1.object.gr_1.category.dispattr.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.gr_1.category.dispattr.font.strikethrough = '1'
ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.strikethrough") = dw_1.object.gr_1.category.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.strikethrough ~r~n"
end if 

dw_1.object.gr_1.category.dispattr.font.strikethrough = 'yes'
ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.strikethrough") = dw_1.object.gr_1.category.dispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.gr_1.category.dispattr.font.underline = '1'
ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.underline") = dw_1.object.gr_1.category.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.underline ~r~n"
end if 

dw_1.object.gr_1.category.dispattr.font.underline = 'Yes'
ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.underline") = dw_1.object.gr_1.category.dispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.underline ~r~n"
end if 

//font.weight 
dw_1.object.gr_1.category.dispattr.font.weight = '400'
ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.weight") = dw_1.object.gr_1.category.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.weight") = dw_1.object.gr_1.category.dispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.weight ~r~n"
end if 

//font.width 
dw_1.object.gr_1.category.dispattr.font.width = '40'
ls_rtv = dw_1.Modify("gr_1.category.dispattr.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.width ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.font.width") = dw_1.object.gr_1.category.dispattr.font.width then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.font.width ~r~n"
end if 


//category.dispattr.format 
dw_1.object.gr_1.category.dispattr.format = 'xxxxxxxxxxxxxxxxxxxxx'
ls_rtv = dw_1.Modify( "gr_1.category.dispattr.format ='[general]'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.format ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.format") = dw_1.object.gr_1.category.dispattr.format then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.format ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.format ~r~n"
end if 

//category.dispattr.textcolor 
dw_1.object.gr_1.category.dispattr.textcolor = '65534'
ls_rtv = dw_1.Modify( "gr_1.category.dispattr.textcolor ='260~trgb(200,255,1)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.textcolor ~r~n"
elseif dw_1.describe("gr_1.category.dispattr.textcolor") = dw_1.object.gr_1.category.dispattr.textcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.dispattr.textcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.dispattr.textcolor ~r~n"
end if 

//category.labeldispattr.alignment 
//category.labeldispattr.autosize 
//category.labeldispattr.backcolor 
//category.labeldispattr.displayexpression 

//category.labeldispattr.alignment 
dw_1.object.gr_1.category.labeldispattr.alignment = '1'
dw_1.object.gr_1.category.labeldispattr.alignment = '0'
ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.alignment ='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.alignment ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.alignment") = dw_1.object.gr_1.category.labeldispattr.alignment then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.alignment ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.alignment ~r~n"
end if 

//category.labeldispattr.autosize 
dw_1.object.gr_1.category.labeldispattr.autosize = '0'
ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.autosize ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.autosize ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.autosize") = dw_1.object.gr_1.category.labeldispattr.autosize then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.autosize ~r~n"
end if 

//category.labeldispattr.backcolor 
dw_1.object.gr_1.category.labeldispattr.backcolor = '255'
ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.backcolor ='260~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.backcolor ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.backcolor") = dw_1.object.gr_1.category.labeldispattr.backcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.backcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.backcolor ~r~n"
end if 

//category.labeldispattr.displayexpression 
dw_1.object.gr_1.category.labeldispattr.displayexpression = dw_1.object.gr_1.category.labeldispattr.displayexpression + " - new "
ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.displayexpression ='categoryaxislabel' ")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.displayexpression ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.displayexpression") = dw_1.object.gr_1.category.labeldispattr.displayexpression then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.displayexpression ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.displayexpression ~r~n"
end if

//category.labeldispattr.font.charset 
//category.labeldispattr.font.escapement 
//category.labeldispattr.font.face 
//category.labeldispattr.font.family 
//category.labeldispattr.font.height 
//category.labeldispattr.font.italic 
//category.labeldispattr.font.orientation 
//category.labeldispattr.font.pitch 
//category.labeldispattr.font.strikethrough 
//category.labeldispattr.font.underline 
//category.labeldispattr.font.weight 
//category.labeldispattr.font.width 

//font.charset 
dw_1.object.gr_1.category.labeldispattr.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.Font.CharSet	='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.Font.CharSet") = dw_1.object.gr_1.category.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.Font.CharSet") = dw_1.object.gr_1.category.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.Font.CharSet") = dw_1.object.gr_1.category.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.Font.CharSet") = dw_1.object.gr_1.category.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.Font.CharSet") = dw_1.object.gr_1.category.labeldispattr.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.gr_1.category.labeldispattr.Font.face = 'Arial'

ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.face ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.Font.face") = dw_1.object.gr_1.category.labeldispattr.Font.face then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.gr_1.category.labeldispattr.font.orientation = '900'
ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.orientation ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.orientation") = dw_1.object.gr_1.category.labeldispattr.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.gr_1.category.labeldispattr.Font.escapement = '450'
ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.escapement ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.Font.escapement") = dw_1.object.gr_1.category.labeldispattr.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.gr_1.category.labeldispattr.font.family = string(i)
	ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.family ~r~n"
	elseif dw_1.describe("gr_1.category.labeldispattr.font.family") = dw_1.object.gr_1.category.labeldispattr.font.family then 
		mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.gr_1.category.labeldispattr.font.height = '-200'
ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.height") = dw_1.object.gr_1.category.labeldispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.height ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.height") = dw_1.object.gr_1.category.labeldispattr.font.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.height ~r~n"
end if 

//font.italic 
dw_1.object.gr_1.category.labeldispattr.font.italic = '1'
ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.italic") = dw_1.object.gr_1.category.labeldispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.italic ~r~n"
end if 

dw_1.object.gr_1.category.labeldispattr.font.italic = 'Yes'
ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.italic ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.italic") = dw_1.object.gr_1.category.labeldispattr.font.italic then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.gr_1.category.labeldispattr.font.pitch = string(i)
	ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.pitch ~r~n"
	elseif dw_1.describe("gr_1.category.labeldispattr.font.pitch") = dw_1.object.gr_1.category.labeldispattr.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.gr_1.category.labeldispattr.font.strikethrough = '1'
ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.strikethrough") = dw_1.object.gr_1.category.labeldispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.strikethrough ~r~n"
end if 

dw_1.object.gr_1.category.labeldispattr.font.strikethrough = 'yes'
ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.strikethrough ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.strikethrough") = dw_1.object.gr_1.category.labeldispattr.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.gr_1.category.labeldispattr.font.underline = '1'
ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.underline") = dw_1.object.gr_1.category.labeldispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.underline ~r~n"
end if 

dw_1.object.gr_1.category.labeldispattr.font.underline = 'Yes'
ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.underline ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.underline") = dw_1.object.gr_1.category.labeldispattr.font.underline then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.underline ~r~n"
end if 

//font.weight 
dw_1.object.gr_1.category.labeldispattr.font.weight = '400'
ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.weight") = dw_1.object.gr_1.category.labeldispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.weight ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.weight") = dw_1.object.gr_1.category.labeldispattr.font.weight then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.weight ~r~n"
end if 

//font.width 
dw_1.object.gr_1.category.labeldispattr.font.width = '40'
ls_rtv = dw_1.Modify("gr_1.category.labeldispattr.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.width ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.font.width") = dw_1.object.gr_1.category.labeldispattr.font.width then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.font.width ~r~n"
end if 

//category.labeldispattr.format 
//category.labeldispattr.textcolor 
//category.labeldispattr.format 
dw_1.object.gr_1.category.labeldispattr.format = 'xxxxxxxxxxxxxxxxxxxxx'
ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.format ='[general]'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.format ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.format") = dw_1.object.gr_1.category.labeldispattr.format then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.format ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.format ~r~n"
end if 

//category.dispattr.textcolor 
dw_1.object.gr_1.category.labeldispattr.textcolor = '65534'
ls_rtv = dw_1.Modify( "gr_1.category.labeldispattr.textcolor ='260~trgb(200,255,1)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.textcolor ~r~n"
elseif dw_1.describe("gr_1.category.labeldispattr.textcolor") = dw_1.object.gr_1.category.labeldispattr.textcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.labeldispattr.textcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.labeldispattr.textcolor ~r~n"
end if 



end subroutine

public subroutine wf_graph_category ();string ls_rtv
dw_1.dataobject = 'd_graph_emp'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//category 
dw_1.object.gr_1.category = "city"
ls_rtv = dw_1.Modify("gr_1.category='dept_id'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category ~r~n"
elseif dw_1.describe("gr_1.category") = dw_1.object.gr_1.category then 
	mle_1.text += "Succeed ! DataWindow Graph Control category ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category ~r~n"
end if 

//category.autoscale 
dw_1.object.gr_1.category.autoscale = "0"
ls_rtv = dw_1.Modify("gr_1.category.autoscale='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.autoscale ~r~n"
elseif dw_1.describe("gr_1.category.autoscale") = dw_1.object.gr_1.category.autoscale then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.autoscale ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.autoscale ~r~n"
end if 

//category.displayeverynlabels 
dw_1.object.gr_1.category.displayeverynlabels = "2"
ls_rtv = dw_1.Modify("gr_1.category.displayeverynlabels='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.displayeverynlabels ~r~n"
elseif dw_1.describe("gr_1.category.displayeverynlabels") = dw_1.object.gr_1.category.displayeverynlabels then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.displayeverynlabels ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.displayeverynlabels ~r~n"
end if 

//category.droplines 
dw_1.object.gr_1.category.droplines = "0"
dw_1.object.gr_1.category.droplines = "2"
dw_1.object.gr_1.category.droplines = "3"
dw_1.object.gr_1.category.droplines = "4"
dw_1.object.gr_1.category.droplines = "5"
ls_rtv = dw_1.Modify("gr_1.category.droplines='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.droplines ~r~n"
elseif dw_1.describe("gr_1.category.droplines") = dw_1.object.gr_1.category.droplines then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.droplines ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.droplines ~r~n"
end if 

//category.label 
dw_1.object.gr_1.category.label = "Category简体繁體닷컴れがあןנΏΐΑΒΓΔЅІЇЈЉЊ"
ls_rtv = dw_1.Modify("gr_1.category.label='- Category - 简体繁體닷컴れがあןנΏΐΑΒΓΔЅІЇЈЉЊ'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.label ~r~n"
elseif dw_1.describe("gr_1.category.label") = dw_1.object.gr_1.category.label then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.label ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.label ~r~n"
end if 

//category.majordivisions 
dw_1.object.gr_1.category.majordivisions = "1"
ls_rtv = dw_1.Modify("gr_1.category.majordivisions='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.majordivisions ~r~n"
elseif dw_1.describe("gr_1.category.majordivisions") = dw_1.object.gr_1.category.majordivisions then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.majordivisions ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.majordivisions ~r~n"
end if 

//category.majorgridline 
dw_1.object.gr_1.category.majorgridline = "1"
ls_rtv = dw_1.Modify("gr_1.category.majorgridline='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.majorgridline ~r~n"
elseif dw_1.describe("gr_1.category.majorgridline") = dw_1.object.gr_1.category.majorgridline then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.majorgridline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.majorgridline ~r~n"
end if 

//category.majortic 
dw_1.object.gr_1.category.majortic = "1"
dw_1.object.gr_1.category.majortic = "2"
dw_1.object.gr_1.category.majortic = "3"
ls_rtv = dw_1.Modify("gr_1.category.majortic='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.majortic ~r~n"
elseif dw_1.describe("gr_1.category.majortic") = dw_1.object.gr_1.category.majortic then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.majortic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.majortic ~r~n"
end if 

//category.maximumvalue 
dw_1.object.gr_1.category.maximumvalue = "300"
ls_rtv = dw_1.Modify("gr_1.category.maximumvalue='600'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.maximumvalue ~r~n"
elseif dw_1.describe("gr_1.category.maximumvalue") = dw_1.object.gr_1.category.maximumvalue then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.maximumvalue ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.maximumvalue ~r~n"
end if 

//category.maxvaldatetime , not document

//category.minimumvalue 
dw_1.object.gr_1.category.minimumvalue = "200"
ls_rtv = dw_1.Modify("gr_1.category.minimumvalue='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.minimumvalue ~r~n"
elseif dw_1.describe("gr_1.category.minimumvalue") = dw_1.object.gr_1.category.minimumvalue then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.minimumvalue ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.minimumvalue ~r~n"
end if 

//category.minordivisions 
dw_1.object.gr_1.category.minordivisions = "1"
ls_rtv = dw_1.Modify("gr_1.category.minordivisions='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.minordivisions ~r~n"
elseif dw_1.describe("gr_1.category.minordivisions") = dw_1.object.gr_1.category.minordivisions then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.minordivisions ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.minordivisions ~r~n"
end if 

//category.minorgridline 
dw_1.object.gr_1.category.minorgridline = "1"
ls_rtv = dw_1.Modify("gr_1.category.minorgridline='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.minorgridline ~r~n"
elseif dw_1.describe("gr_1.category.minorgridline") = dw_1.object.gr_1.category.minorgridline then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.minorgridline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.minorgridline ~r~n"
end if 

//category.minortic 
dw_1.object.gr_1.category.minortic = "1"
dw_1.object.gr_1.category.minortic = "2"
dw_1.object.gr_1.category.minortic = "3"
ls_rtv = dw_1.Modify("gr_1.category.minortic='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.minortic ~r~n"
elseif dw_1.describe("gr_1.category.minortic") = dw_1.object.gr_1.category.minortic then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.minortic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.minortic ~r~n"
end if 

//category.minvaldatetime , not document

//category.originline 
dw_1.object.gr_1.category.originline = "3"
ls_rtv = dw_1.Modify("gr_1.category.originline='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.originline ~r~n"
elseif dw_1.describe("gr_1.category.originline") = dw_1.object.gr_1.category.originline then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.originline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.originline ~r~n"
end if 

//category.primaryline 
dw_1.object.gr_1.category.primaryline = "3"
ls_rtv = dw_1.Modify("gr_1.category.primaryline='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.primaryline ~r~n"
elseif dw_1.describe("gr_1.category.primaryline") = dw_1.object.gr_1.category.primaryline then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.primaryline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.primaryline ~r~n"
end if 

//category.roundto 
dw_1.object.gr_1.category.roundto = "3"
ls_rtv = dw_1.Modify("gr_1.category.roundto='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.roundto ~r~n"
elseif dw_1.describe("gr_1.category.roundto") = dw_1.object.gr_1.category.roundto then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.roundto ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.roundto ~r~n"
end if 

//category.roundtounit 
dw_1.object.gr_1.category.roundtounit = "1"
ls_rtv = dw_1.Modify("gr_1.category.roundtounit='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.roundtounit ~r~n"
elseif dw_1.describe("gr_1.category.roundtounit") = dw_1.object.gr_1.category.roundtounit then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.roundtounit ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.roundtounit ~r~n"
end if 

//category.scaletype 
dw_1.object.gr_1.category.scaletype = "2"
dw_1.object.gr_1.category.scaletype = "3"
ls_rtv = dw_1.Modify("gr_1.category.scaletype='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.scaletype ~r~n"
elseif dw_1.describe("gr_1.category.scaletype") = dw_1.object.gr_1.category.scaletype then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.scaletype ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.scaletype ~r~n"
end if 

//category.scalevalue 
dw_1.object.gr_1.category.scalevalue = "4"
dw_1.object.gr_1.category.scalevalue = "2"
dw_1.object.gr_1.category.scalevalue = "3"
ls_rtv = dw_1.Modify("gr_1.category.scaletype='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.scalevalue ~r~n"
elseif dw_1.describe("gr_1.category.scalevalue") = dw_1.object.gr_1.category.scalevalue then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.scalevalue ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.scalevalue ~r~n"
end if 

dw_1.object.gr_1.graphtype = "15"

//category.secondaryline 
dw_1.object.gr_1.category.secondaryline = "3"
ls_rtv = dw_1.Modify("gr_1.category.secondaryline='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.secondaryline ~r~n"
elseif dw_1.describe("gr_1.category.secondaryline") = dw_1.object.gr_1.category.secondaryline then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.secondaryline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.secondaryline ~r~n"
end if 

//category.shadebackedge 
dw_1.object.gr_1.category.shadebackedge = "0"
ls_rtv = dw_1.Modify("gr_1.category.shadebackedge='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.shadebackedge ~r~n"
elseif dw_1.describe("gr_1.category.shadebackedge") = dw_1.object.gr_1.category.shadebackedge then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.shadebackedge ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.shadebackedge ~r~n"
end if 

//category.sort 
dw_1.object.gr_1.category.sort = "0"
dw_1.object.gr_1.category.sort = "2"
ls_rtv = dw_1.Modify("gr_1.category.sort='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.sort ~r~n"
elseif dw_1.describe("gr_1.category.sort") = dw_1.object.gr_1.category.sort then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.sort ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.sort ~r~n"
end if 


//3d graph
//category.frame 
dw_1.object.gr_1.category.frame = "0"
dw_1.object.gr_1.category.frame = "2"
ls_rtv = dw_1.Modify("gr_1.category.frame='5'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control category.frame ~r~n"
elseif dw_1.describe("gr_1.category.frame") = dw_1.object.gr_1.category.frame then 
	mle_1.text += "Succeed ! DataWindow Graph Control category.frame ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control category.frame ~r~n"
end if 


end subroutine

public subroutine wf_graph_series ();
//series 
//series.autoscale 
//series.displayeverynlabels 
//series.droplines 
//series.frame 
//series.label 
//series.majordivisions 
//series.majorgridline 
//series.majortic 
//series.maximumvalue 
//series.maxvaldatetime 
//series.minimumvalue 
//series.minordivisions 
//series.minorgridline 
//series.minortic 
//series.minvaldatetime 
//series.originline 
//series.primaryline 
//series.roundto 
//series.roundtounit 
//series.scaletype 
//series.scalevalue 
//series.secondaryline 
//series.shadebackedge 
//series.sort 

string ls_rtv
dw_1.dataobject = 'd_graph_emp'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//series 
dw_1.object.gr_1.series = "state"
ls_rtv = dw_1.Modify("gr_1.series='sex'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series ~r~n"
elseif dw_1.describe("gr_1.series") = dw_1.object.gr_1.series then 
	mle_1.text += "Succeed ! DataWindow Graph Control series ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series ~r~n"
end if 

//series.autoscale 
dw_1.object.gr_1.series.autoscale = "0"
ls_rtv = dw_1.Modify("gr_1.series.autoscale='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.autoscale ~r~n"
elseif dw_1.describe("gr_1.series.autoscale") = dw_1.object.gr_1.series.autoscale then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.autoscale ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.autoscale ~r~n"
end if 

//series.displayeverynlabels 
dw_1.object.gr_1.series.displayeverynlabels = "2"
ls_rtv = dw_1.Modify("gr_1.series.displayeverynlabels='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.displayeverynlabels ~r~n"
elseif dw_1.describe("gr_1.series.displayeverynlabels") = dw_1.object.gr_1.series.displayeverynlabels then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.displayeverynlabels ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.displayeverynlabels ~r~n"
end if 

//series.droplines 
dw_1.object.gr_1.series.droplines = "0"
dw_1.object.gr_1.series.droplines = "2"
dw_1.object.gr_1.series.droplines = "3"
dw_1.object.gr_1.series.droplines = "4"
dw_1.object.gr_1.series.droplines = "5"
ls_rtv = dw_1.Modify("gr_1.series.droplines='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.droplines ~r~n"
elseif dw_1.describe("gr_1.series.droplines") = dw_1.object.gr_1.series.droplines then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.droplines ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.droplines ~r~n"
end if 

//series.label 
dw_1.object.gr_1.series.label = "series简体繁體닷컴れがあןנΏΐΑΒΓΔЅІЇЈЉЊ"
ls_rtv = dw_1.Modify("gr_1.series.label='- series - 简体繁體닷컴れがあןנΏΐΑΒΓΔЅІЇЈЉЊ'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.label ~r~n"
elseif dw_1.describe("gr_1.series.label") = dw_1.object.gr_1.series.label then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.label ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.label ~r~n"
end if 

//series.majordivisions 
dw_1.object.gr_1.series.majordivisions = "1"
ls_rtv = dw_1.Modify("gr_1.series.majordivisions='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.majordivisions ~r~n"
elseif dw_1.describe("gr_1.series.majordivisions") = dw_1.object.gr_1.series.majordivisions then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.majordivisions ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.majordivisions ~r~n"
end if 

//series.majorgridline 
dw_1.object.gr_1.series.majorgridline = "1"
ls_rtv = dw_1.Modify("gr_1.series.majorgridline='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.majorgridline ~r~n"
elseif dw_1.describe("gr_1.series.majorgridline") = dw_1.object.gr_1.series.majorgridline then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.majorgridline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.majorgridline ~r~n"
end if 

//series.majortic 
dw_1.object.gr_1.series.majortic = "1"
dw_1.object.gr_1.series.majortic = "2"
dw_1.object.gr_1.series.majortic = "3"
ls_rtv = dw_1.Modify("gr_1.series.majortic='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.majortic ~r~n"
elseif dw_1.describe("gr_1.series.majortic") = dw_1.object.gr_1.series.majortic then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.majortic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.majortic ~r~n"
end if 

//series.maximumvalue 
dw_1.object.gr_1.series.maximumvalue = "300"
ls_rtv = dw_1.Modify("gr_1.series.maximumvalue='600'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.maximumvalue ~r~n"
elseif dw_1.describe("gr_1.series.maximumvalue") = dw_1.object.gr_1.series.maximumvalue then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.maximumvalue ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.maximumvalue ~r~n"
end if 

//series.maxvaldatetime , not document

//series.minimumvalue 
dw_1.object.gr_1.series.minimumvalue = "200"
ls_rtv = dw_1.Modify("gr_1.series.minimumvalue='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.minimumvalue ~r~n"
elseif dw_1.describe("gr_1.series.minimumvalue") = dw_1.object.gr_1.series.minimumvalue then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.minimumvalue ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.minimumvalue ~r~n"
end if 

//series.minordivisions 
dw_1.object.gr_1.series.minordivisions = "1"
ls_rtv = dw_1.Modify("gr_1.series.minordivisions='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.minordivisions ~r~n"
elseif dw_1.describe("gr_1.series.minordivisions") = dw_1.object.gr_1.series.minordivisions then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.minordivisions ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.minordivisions ~r~n"
end if 

//series.minorgridline 
dw_1.object.gr_1.series.minorgridline = "1"
ls_rtv = dw_1.Modify("gr_1.series.minorgridline='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.minorgridline ~r~n"
elseif dw_1.describe("gr_1.series.minorgridline") = dw_1.object.gr_1.series.minorgridline then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.minorgridline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.minorgridline ~r~n"
end if 

//series.minortic 
dw_1.object.gr_1.series.minortic = "1"
dw_1.object.gr_1.series.minortic = "2"
dw_1.object.gr_1.series.minortic = "3"
ls_rtv = dw_1.Modify("gr_1.series.minortic='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.minortic ~r~n"
elseif dw_1.describe("gr_1.series.minortic") = dw_1.object.gr_1.series.minortic then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.minortic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.minortic ~r~n"
end if 

//series.minvaldatetime , not document

//series.originline 
dw_1.object.gr_1.series.originline = "3"
ls_rtv = dw_1.Modify("gr_1.series.originline='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.originline ~r~n"
elseif dw_1.describe("gr_1.series.originline") = dw_1.object.gr_1.series.originline then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.originline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.originline ~r~n"
end if 

//series.primaryline 
dw_1.object.gr_1.series.primaryline = "3"
ls_rtv = dw_1.Modify("gr_1.series.primaryline='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.primaryline ~r~n"
elseif dw_1.describe("gr_1.series.primaryline") = dw_1.object.gr_1.series.primaryline then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.primaryline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.primaryline ~r~n"
end if 

//series.roundto 
dw_1.object.gr_1.series.roundto = "3"
ls_rtv = dw_1.Modify("gr_1.series.roundto='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.roundto ~r~n"
elseif dw_1.describe("gr_1.series.roundto") = dw_1.object.gr_1.series.roundto then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.roundto ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.roundto ~r~n"
end if 

//series.roundtounit 
dw_1.object.gr_1.series.roundtounit = "1"
ls_rtv = dw_1.Modify("gr_1.series.roundtounit='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.roundtounit ~r~n"
elseif dw_1.describe("gr_1.series.roundtounit") = dw_1.object.gr_1.series.roundtounit then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.roundtounit ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.roundtounit ~r~n"
end if 

//series.scaletype 
dw_1.object.gr_1.series.scaletype = "2"
dw_1.object.gr_1.series.scaletype = "3"
ls_rtv = dw_1.Modify("gr_1.series.scaletype='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.scaletype ~r~n"
elseif dw_1.describe("gr_1.series.scaletype") = dw_1.object.gr_1.series.scaletype then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.scaletype ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.scaletype ~r~n"
end if 

//series.scalevalue 
dw_1.object.gr_1.series.scalevalue = "4"
dw_1.object.gr_1.series.scalevalue = "2"
dw_1.object.gr_1.series.scalevalue = "3"
ls_rtv = dw_1.Modify("gr_1.series.scaletype='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.scalevalue ~r~n"
elseif dw_1.describe("gr_1.series.scalevalue") = dw_1.object.gr_1.series.scalevalue then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.scalevalue ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.scalevalue ~r~n"
end if 

dw_1.object.gr_1.graphtype = "15"

//series.secondaryline 
dw_1.object.gr_1.series.secondaryline = "3"
ls_rtv = dw_1.Modify("gr_1.series.secondaryline='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.secondaryline ~r~n"
elseif dw_1.describe("gr_1.series.secondaryline") = dw_1.object.gr_1.series.secondaryline then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.secondaryline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.secondaryline ~r~n"
end if 

//series.shadebackedge 
dw_1.object.gr_1.series.shadebackedge = "0"
ls_rtv = dw_1.Modify("gr_1.series.shadebackedge='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.shadebackedge ~r~n"
elseif dw_1.describe("gr_1.series.shadebackedge") = dw_1.object.gr_1.series.shadebackedge then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.shadebackedge ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.shadebackedge ~r~n"
end if 

//series.sort 
dw_1.object.gr_1.series.sort = "0"
dw_1.object.gr_1.series.sort = "2"
ls_rtv = dw_1.Modify("gr_1.series.sort='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.sort ~r~n"
elseif dw_1.describe("gr_1.series.sort") = dw_1.object.gr_1.series.sort then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.sort ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.sort ~r~n"
end if 


//3d graph
//series.frame 
dw_1.object.gr_1.series.frame = "0"
dw_1.object.gr_1.series.frame = "2"
ls_rtv = dw_1.Modify("gr_1.series.frame='5'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control series.frame ~r~n"
elseif dw_1.describe("gr_1.series.frame") = dw_1.object.gr_1.series.frame then 
	mle_1.text += "Succeed ! DataWindow Graph Control series.frame ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control series.frame ~r~n"
end if 


end subroutine

public subroutine wf_graph_values ();//values 
//values.autoscale 
//values.displayeverynlabels 
//values.droplines 
//values.frame 
//values.label 
//values.majordivisions 
//values.majorgridline 
//values.majortic 
//values.maximumvalue 
//values.maxvaldatetime 
//values.minimumvalue 
//values.minordivisions 
//values.minorgridline 
//values.minortic 
//values.minvaldatetime 
//values.originline 
//values.primaryline 
//values.roundto 
//values.roundtounit 
//values.scaletype 
//values.scalevalue 
//values.secondaryline 
//values.shadebackedge 

string ls_rtv
dw_1.dataobject = 'd_graph_emp'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//values 
dw_1.object.gr_1.values = "count(salary for graph)"
ls_rtv = dw_1.Modify("gr_1.values='sum(salary for graph)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values ~r~n"
elseif dw_1.describe("gr_1.values") = dw_1.object.gr_1.values then 
	mle_1.text += "Succeed ! DataWindow Graph Control values ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values ~r~n"
end if 

//values.autoscale 
dw_1.object.gr_1.values.autoscale = "0"
ls_rtv = dw_1.Modify("gr_1.values.autoscale='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.autoscale ~r~n"
elseif dw_1.describe("gr_1.values.autoscale") = dw_1.object.gr_1.values.autoscale then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.autoscale ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.autoscale ~r~n"
end if 

//values.displayeverynlabels 
dw_1.object.gr_1.values.displayeverynlabels = "2"
ls_rtv = dw_1.Modify("gr_1.values.displayeverynlabels='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.displayeverynlabels ~r~n"
elseif dw_1.describe("gr_1.values.displayeverynlabels") = dw_1.object.gr_1.values.displayeverynlabels then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.displayeverynlabels ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.displayeverynlabels ~r~n"
end if 

//values.droplines 
dw_1.object.gr_1.values.droplines = "0"
dw_1.object.gr_1.values.droplines = "2"
dw_1.object.gr_1.values.droplines = "3"
dw_1.object.gr_1.values.droplines = "4"
dw_1.object.gr_1.values.droplines = "5"
ls_rtv = dw_1.Modify("gr_1.values.droplines='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.droplines ~r~n"
elseif dw_1.describe("gr_1.values.droplines") = dw_1.object.gr_1.values.droplines then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.droplines ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.droplines ~r~n"
end if 

//values.label 
dw_1.object.gr_1.values.label = "values简体繁體닷컴れがあןנΏΐΑΒΓΔЅІЇЈЉЊ"
ls_rtv = dw_1.Modify("gr_1.values.label='- values - 简体繁體닷컴れがあןנΏΐΑΒΓΔЅІЇЈЉЊ'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.label ~r~n"
elseif dw_1.describe("gr_1.values.label") = dw_1.object.gr_1.values.label then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.label ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.label ~r~n"
end if 

//values.majordivisions 
dw_1.object.gr_1.values.majordivisions = "1"
ls_rtv = dw_1.Modify("gr_1.values.majordivisions='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.majordivisions ~r~n"
elseif dw_1.describe("gr_1.values.majordivisions") = dw_1.object.gr_1.values.majordivisions then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.majordivisions ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.majordivisions ~r~n"
end if 

//values.majorgridline 
dw_1.object.gr_1.values.majorgridline = "1"
ls_rtv = dw_1.Modify("gr_1.values.majorgridline='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.majorgridline ~r~n"
elseif dw_1.describe("gr_1.values.majorgridline") = dw_1.object.gr_1.values.majorgridline then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.majorgridline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.majorgridline ~r~n"
end if 

//values.majortic 
dw_1.object.gr_1.values.majortic = "1"
dw_1.object.gr_1.values.majortic = "2"
dw_1.object.gr_1.values.majortic = "3"
ls_rtv = dw_1.Modify("gr_1.values.majortic='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.majortic ~r~n"
elseif dw_1.describe("gr_1.values.majortic") = dw_1.object.gr_1.values.majortic then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.majortic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.majortic ~r~n"
end if 

//values.maximumvalue 
dw_1.object.gr_1.values.maximumvalue = "300"
ls_rtv = dw_1.Modify("gr_1.values.maximumvalue='600'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.maximumvalue ~r~n"
elseif dw_1.describe("gr_1.values.maximumvalue") = dw_1.object.gr_1.values.maximumvalue then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.maximumvalue ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.maximumvalue ~r~n"
end if 

//values.maxvaldatetime , not document

//values.minimumvalue 
dw_1.object.gr_1.values.minimumvalue = "200"
ls_rtv = dw_1.Modify("gr_1.values.minimumvalue='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.minimumvalue ~r~n"
elseif dw_1.describe("gr_1.values.minimumvalue") = dw_1.object.gr_1.values.minimumvalue then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.minimumvalue ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.minimumvalue ~r~n"
end if 

//values.minordivisions 
dw_1.object.gr_1.values.minordivisions = "1"
ls_rtv = dw_1.Modify("gr_1.values.minordivisions='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.minordivisions ~r~n"
elseif dw_1.describe("gr_1.values.minordivisions") = dw_1.object.gr_1.values.minordivisions then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.minordivisions ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.minordivisions ~r~n"
end if 

//values.minorgridline 
dw_1.object.gr_1.values.minorgridline = "1"
ls_rtv = dw_1.Modify("gr_1.values.minorgridline='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.minorgridline ~r~n"
elseif dw_1.describe("gr_1.values.minorgridline") = dw_1.object.gr_1.values.minorgridline then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.minorgridline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.minorgridline ~r~n"
end if 

//values.minortic 
dw_1.object.gr_1.values.minortic = "1"
dw_1.object.gr_1.values.minortic = "2"
dw_1.object.gr_1.values.minortic = "3"
ls_rtv = dw_1.Modify("gr_1.values.minortic='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.minortic ~r~n"
elseif dw_1.describe("gr_1.values.minortic") = dw_1.object.gr_1.values.minortic then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.minortic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.minortic ~r~n"
end if 

//values.minvaldatetime , not document

//values.originline 
dw_1.object.gr_1.values.originline = "3"
ls_rtv = dw_1.Modify("gr_1.values.originline='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.originline ~r~n"
elseif dw_1.describe("gr_1.values.originline") = dw_1.object.gr_1.values.originline then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.originline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.originline ~r~n"
end if 

//values.primaryline 
dw_1.object.gr_1.values.primaryline = "3"
ls_rtv = dw_1.Modify("gr_1.values.primaryline='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.primaryline ~r~n"
elseif dw_1.describe("gr_1.values.primaryline") = dw_1.object.gr_1.values.primaryline then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.primaryline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.primaryline ~r~n"
end if 

//values.roundto 
dw_1.object.gr_1.values.roundto = "3"
ls_rtv = dw_1.Modify("gr_1.values.roundto='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.roundto ~r~n"
elseif dw_1.describe("gr_1.values.roundto") = dw_1.object.gr_1.values.roundto then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.roundto ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.roundto ~r~n"
end if 

//values.roundtounit 
dw_1.object.gr_1.values.roundtounit = "1"
ls_rtv = dw_1.Modify("gr_1.values.roundtounit='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.roundtounit ~r~n"
elseif dw_1.describe("gr_1.values.roundtounit") = dw_1.object.gr_1.values.roundtounit then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.roundtounit ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.roundtounit ~r~n"
end if 

//values.scaletype 
dw_1.object.gr_1.values.scaletype = "2"
dw_1.object.gr_1.values.scaletype = "3"
ls_rtv = dw_1.Modify("gr_1.values.scaletype='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.scaletype ~r~n"
elseif dw_1.describe("gr_1.values.scaletype") = dw_1.object.gr_1.values.scaletype then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.scaletype ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.scaletype ~r~n"
end if 

//values.scalevalue 
dw_1.object.gr_1.values.scalevalue = "4"
dw_1.object.gr_1.values.scalevalue = "2"
dw_1.object.gr_1.values.scalevalue = "3"
ls_rtv = dw_1.Modify("gr_1.values.scaletype='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.scalevalue ~r~n"
elseif dw_1.describe("gr_1.values.scalevalue") = dw_1.object.gr_1.values.scalevalue then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.scalevalue ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.scalevalue ~r~n"
end if 

dw_1.object.gr_1.graphtype = "15"

//values.secondaryline 
dw_1.object.gr_1.values.secondaryline = "3"
ls_rtv = dw_1.Modify("gr_1.values.secondaryline='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.secondaryline ~r~n"
elseif dw_1.describe("gr_1.values.secondaryline") = dw_1.object.gr_1.values.secondaryline then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.secondaryline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.secondaryline ~r~n"
end if 

//values.shadebackedge 
dw_1.object.gr_1.values.shadebackedge = "0"
ls_rtv = dw_1.Modify("gr_1.values.shadebackedge='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.shadebackedge ~r~n"
elseif dw_1.describe("gr_1.values.shadebackedge") = dw_1.object.gr_1.values.shadebackedge then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.shadebackedge ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.shadebackedge ~r~n"
end if 


//3d graph
//values.frame 
dw_1.object.gr_1.values.frame = "0"
dw_1.object.gr_1.values.frame = "2"
ls_rtv = dw_1.Modify("gr_1.values.frame='5'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control values.frame ~r~n"
elseif dw_1.describe("gr_1.values.frame") = dw_1.object.gr_1.values.frame then 
	mle_1.text += "Succeed ! DataWindow Graph Control values.frame ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control values.frame ~r~n"
end if 


end subroutine

public subroutine wf_graph_gen ();string ls_rtv 
integer i

dw_1.dataobject = "d_graph_emp"
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

////accessibledescription 
//dw_1.object.gr_1.accessibledescription = "Datawindow Graph control"
//ls_rtv = dw_1.Modify("gr_1.accessibledescription='Datawindow Graph control/图表'")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow Graph Control accessibledescription ~r~n"
//elseif dw_1.describe("gr_1.accessibledescription") = dw_1.object.gr_1.accessibledescription then 
//	mle_1.text += "Succeed ! DataWindow Graph Control accessibledescription ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Graph Control accessibledescription ~r~n"
//end if 

////accessiblename 
//dw_1.object.gr_1.accessiblename = "DWGraph 图表"
//ls_rtv = dw_1.Modify("gr_1.accessiblename='DW Graph - 图表'")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow Graph Control accessiblename ~r~n"
//elseif dw_1.describe("gr_1.accessiblename") = dw_1.object.gr_1.accessiblename then 
//	mle_1.text += "Succeed ! DataWindow Graph Control accessiblename ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Graph Control accessiblename ~r~n"
//end if 
//
////accessiblerole 
//dw_1.object.gr_1.accessiblerole = "53"
//ls_rtv = dw_1.Modify("gr_1.accessiblerole='53'")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow Graph Control accessiblerole ~r~n"
//elseif dw_1.describe("gr_1.accessiblerole") = dw_1.object.gr_1.accessiblerole then 
//	mle_1.text += "Succeed ! DataWindow Graph Control accessiblerole ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Graph Control accessiblerole ~r~n"
//end if 


//attributes 
if dw_1.Describe("gr_1.Attributes") = dw_1.object.gr_1.attributes then 
	mle_1.text += "Succeed ! DataWindow Graph Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control attributes ~r~n"
end if

//backcolor 
dw_1.object.gr_1.backcolor = "8388700"
ls_rtv = dw_1.Modify("gr_1.backcolor='8388736~trgb(255,127,0)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control backcolor ~r~n"
elseif dw_1.describe("gr_1.backcolor") = dw_1.object.gr_1.backcolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control backcolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control backcolor ~r~n"
end if 

//band 
if dw_1.Describe("gr_1.band") = dw_1.object.gr_1.band then 
	mle_1.text += "Succeed ! DataWindow Graph Control band ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control band ~r~n"
end if

//border 
i = 0 
for i = 0 to 6
	dw_1.object.gr_1.border = string(i)
	ls_rtv = dw_1.Modify("gr_1.border='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control Border ~r~n"
	elseif dw_1.describe("gr_1.border") = dw_1.object.gr_1.border then 
		mle_1.text += "Succeed ! DataWindow Graph Control Border ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control Border ~r~n"
	end if 
	
next

//color
dw_1.object.gr_1.color = "255"
ls_rtv = dw_1.Modify("gr_1.color='8388736~trgb(127,255,0)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control color ~r~n"
elseif dw_1.describe("gr_1.color") = dw_1.object.gr_1.color then 
	mle_1.text += "Succeed ! DataWindow Graph Control color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control color ~r~n"
end if 

ls_rtv = Modify(dw_1,"gr_1.color='8388736~trgb(127,255,0)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control color ~r~n"
elseif describe(dw_1,"gr_1.color") = dw_1.object.gr_1.color then 
	mle_1.text += "Succeed ! DataWindow Graph Control color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control color ~r~n"
end if 

//graphtype 
i = 1
for i = 1 to 17
	dw_1.object.gr_1.graphtype = string(i)
	ls_rtv = dw_1.Modify("gr_1.graphtype='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Graph Control graphtype ~r~n"
	elseif dw_1.describe("gr_1.graphtype") = dw_1.object.gr_1.graphtype then 
		mle_1.text += "Succeed ! DataWindow Graph Control graphtype ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Graph Control graphtype ~r~n"
	end if 
next

//depth 
dw_1.object.gr_1.graphtype = '15'
dw_1.object.gr_1.depth = "50"
ls_rtv = dw_1.Modify("gr_1.depth='50~t80'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control depth ~r~n"
elseif dw_1.describe("gr_1.depth") = dw_1.object.gr_1.depth then 
	mle_1.text += "Succeed ! DataWindow Graph Control depth ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control depth ~r~n"
end if 

//elevation 
dw_1.object.gr_1.elevation = "50"
ls_rtv = dw_1.Modify("gr_1.elevation='50~t10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control elevation ~r~n"
elseif dw_1.describe("gr_1.elevation") = dw_1.object.gr_1.elevation then 
	mle_1.text += "Succeed ! DataWindow Graph Control elevation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control elevation ~r~n"
end if 

//height 
dw_1.object.gr_1.height = "50"
ls_rtv = dw_1.Modify("gr_1.height='50~t10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control height ~r~n"
elseif dw_1.describe("gr_1.height") = dw_1.object.gr_1.height then 
	mle_1.text += "Succeed ! DataWindow Graph Control height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control height ~r~n"
end if 

//hidesnaked 
dw_1.object.gr_1.hidesnaked = "1"
ls_rtv = dw_1.Modify("gr_1.hidesnaked='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control hidesnaked ~r~n"
elseif dw_1.describe("gr_1.hidesnaked") = dw_1.object.gr_1.hidesnaked then 
	mle_1.text += "Succeed ! DataWindow Graph Control hidesnaked ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control hidesnaked ~r~n"
end if 

//legend 
dw_1.object.gr_1.legend = "0"
dw_1.object.gr_1.legend = "1"
dw_1.object.gr_1.legend = "2"
dw_1.object.gr_1.legend = "3"
ls_rtv = dw_1.Modify("gr_1.legend='4'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control legend ~r~n"
elseif dw_1.describe("gr_1.legend") = dw_1.object.gr_1.legend then 
	mle_1.text += "Succeed ! DataWindow Graph Control legend ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control legend ~r~n"
end if 

//moveable 
dw_1.object.gr_1.moveable = "1"
ls_rtv = dw_1.Modify("gr_1.moveable='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control moveable ~r~n"
elseif dw_1.describe("gr_1.moveable") = dw_1.object.gr_1.moveable then 
	mle_1.text += "Succeed ! DataWindow Graph Control moveable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control moveable ~r~n"
end if 

//name 
if dw_1.Describe("gr_1.name") = dw_1.object.gr_1.name then 
	mle_1.text += "Succeed ! DataWindow Graph Control name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control name ~r~n"
end if

//overlappercent 
dw_1.object.gr_1.overlappercent = "25"
ls_rtv = dw_1.Modify("gr_1.overlappercent='50'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control overlappercent ~r~n"
elseif dw_1.describe("gr_1.overlappercent") = dw_1.object.gr_1.overlappercent then 
	mle_1.text += "Succeed ! DataWindow Graph Control overlappercent ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control overlappercent ~r~n"
end if 

//perspective 
dw_1.object.gr_1.perspective = "25"
ls_rtv = dw_1.Modify("gr_1.perspective='50'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control perspective ~r~n"
elseif dw_1.describe("gr_1.perspective") = dw_1.object.gr_1.perspective then 
	mle_1.text += "Succeed ! DataWindow Graph Control perspective ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control perspective ~r~n"
end if 

//plotnulldata , undocument property

//pointer 
dw_1.object.gr_1.pointer = 'HyperLink!'
ls_rtv = dw_1.Modify("gr_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control Pointer  ~r~n"
elseif dw_1.describe("gr_1.Pointer") = dw_1.object.gr_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Graph Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control Pointer ~r~n"
end if 

//range 
if dw_1.Describe("gr_1.range") = dw_1.object.gr_1.range then 
	mle_1.text += "Succeed ! DataWindow Graph Control range ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control range ~r~n"
end if

//resizeable 
dw_1.object.gr_1.resizeable = "1"
ls_rtv = dw_1.Modify("gr_1.resizeable='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control resizeable ~r~n"
elseif dw_1.describe("gr_1.resizeable") = dw_1.object.gr_1.resizeable then 
	mle_1.text += "Succeed ! DataWindow Graph Control resizeable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control resizeable ~r~n"
end if 

//rotation ,'1~tHour(Now())'
dw_1.object.gr_1.rotation = "70"
ls_rtv = dw_1.Modify("gr_1.rotation='1~tsecond(Now())'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control rotation ~r~n"
elseif dw_1.describe("gr_1.rotation") = dw_1.object.gr_1.rotation then 
	mle_1.text += "Succeed ! DataWindow Graph Control rotation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control rotation ~r~n"
end if 

//shadecolor 
dw_1.object.gr_1.shadecolor = "65535"
ls_rtv = dw_1.Modify("gr_1.shadecolor='255~trgb(128,128,128)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control shadecolor ~r~n"
elseif dw_1.describe("gr_1.shadecolor") = dw_1.object.gr_1.shadecolor then 
	mle_1.text += "Succeed ! DataWindow Graph Control shadecolor ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control shadecolor ~r~n"
end if 

//sizetodisplay 
dw_1.object.gr_1.sizetodisplay = "0"
ls_rtv = dw_1.Modify("gr_1.sizetodisplay='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control sizetodisplay ~r~n"
elseif dw_1.describe("gr_1.sizetodisplay") = dw_1.object.gr_1.sizetodisplay then 
	mle_1.text += "Succeed ! DataWindow Graph Control sizetodisplay ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control sizetodisplay ~r~n"
end if 

//slideleft 
dw_1.object.gr_1.slideleft = "yes"
ls_rtv = dw_1.Modify("gr_1.slideleft='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control slideleft ~r~n"
elseif dw_1.describe("gr_1.slideleft") = dw_1.object.gr_1.slideleft then 
	mle_1.text += "Succeed ! DataWindow Graph Control slideleft ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control slideleft ~r~n"
end if 

//slideup 
dw_1.object.gr_1.slideup = "AllAbove"
dw_1.object.gr_1.slideup = "DirectlyAbove"
ls_rtv = dw_1.Modify("gr_1.slideup='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control slideup ~r~n"
elseif dw_1.describe("gr_1.slideup") = dw_1.object.gr_1.slideup then 
	mle_1.text += "Succeed ! DataWindow Graph Control slideup ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control slideup ~r~n"
end if 

//spacing 
dw_1.object.gr_1.spacing = "120"
ls_rtv = dw_1.Modify("gr_1.spacing='200'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control spacing ~r~n"
elseif dw_1.describe("gr_1.spacing") = dw_1.object.gr_1.spacing then 
	mle_1.text += "Succeed ! DataWindow Graph Control spacing ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control spacing ~r~n"
end if 

//tag 
dw_1.object.gr_1.tag = "Graph Control"
ls_rtv = dw_1.Modify("gr_1.tag='Graph'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control tag ~r~n"
elseif dw_1.describe("gr_1.tag") = dw_1.object.gr_1.tag then 
	mle_1.text += "Succeed ! DataWindow Graph Control tag ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control tag ~r~n"
end if 

//title 
dw_1.object.gr_1.title = "Employee"
ls_rtv = dw_1.Modify("gr_1.title='Employee Chart简体繁體닷컴れがあןנΏΐΑΒΓΔЅІЇЈЉЊ'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control title ~r~n"
elseif dw_1.describe("gr_1.title") = dw_1.object.gr_1.title then 
	mle_1.text += "Succeed ! DataWindow Graph Control title ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control title ~r~n"
end if 

//type 
if dw_1.Describe("gr_1.type") = dw_1.object.gr_1.type then 
	mle_1.text += "Succeed ! DataWindow Graph Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control type ~r~n"
end if

//visible 
dw_1.object.gr_1.visible = "no"
ls_rtv = dw_1.Modify("gr_1.visible='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control visible ~r~n"
elseif dw_1.describe("gr_1.visible") = dw_1.object.gr_1.visible then 
	mle_1.text += "Succeed ! DataWindow Graph Control visible ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control visible ~r~n"
end if 

//width 
dw_1.object.gr_1.width = "300"
ls_rtv = dw_1.Modify("gr_1.width='600'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control width ~r~n"
elseif dw_1.describe("gr_1.width") = dw_1.object.gr_1.width then 
	mle_1.text += "Succeed ! DataWindow Graph Control width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control width ~r~n"
end if 

//x 
dw_1.object.gr_1.x = "300"
ls_rtv = dw_1.Modify("gr_1.x='600'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control x ~r~n"
elseif dw_1.describe("gr_1.x") = dw_1.object.gr_1.x then 
	mle_1.text += "Succeed ! DataWindow Graph Control x ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control x ~r~n"
end if 

//y 
dw_1.object.gr_1.y = "300"
ls_rtv = dw_1.Modify("gr_1.y='600'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Graph Control y ~r~n"
elseif dw_1.describe("gr_1.y") = dw_1.object.gr_1.y then 
	mle_1.text += "Succeed ! DataWindow Graph Control y ~r~n"
else
	mle_1.text += "Failure ! DataWindow Graph Control y ~r~n"
end if 

end subroutine

public subroutine wf_oval ();// **********   Oval o_1        ******************************

//attributes 
//band 
//height 
//moveable 
//name 
//pointer 
//resizeable 
//slideleft 
//slideup 
//tag 
//type 
//visible 
//width 
//x 
//y 
//background.color 
//background.mode 
//brush.color 
//brush.hatch 
//pen.color 
//pen.style 
//pen.width 
//
string ls_rtv
//attributes 
if dw_1.Describe("o_1.Attributes") = dw_1.object.o_1.attributes then 
	mle_1.text += "Succeed ! DataWindow Oval Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control attributes ~r~n"
end if

//band 
ls_rtv = dw_1.Describe("o_1.Band")
if dw_1.Describe("o_1.Band") = dw_1.Object.o_1.Band then 
	mle_1.text += "Succeed ! DataWindow Oval Control Band ~r~n"
else
	mle_1.text += "Succeed ! DataWindow Oval Control Band ~r~n"
end if 

//height 
dw_1.object.o_1.height = '1'
ls_rtv = dw_1.Modify("o_1.height=150")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control height  ~r~n"
elseif dw_1.describe("o_1.height") = dw_1.object.o_1.height  then 
	mle_1.text += "Succeed ! DataWindow Oval Control height  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control height ~r~n"
end if 

//moveable 
dw_1.object.o_1.Moveable = '1'
ls_rtv = dw_1.Modify("o_1.Moveable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control Moveable  ~r~n"
elseif dw_1.describe("o_1.Moveable") = dw_1.object.o_1.Moveable  then 
	mle_1.text += "Succeed ! DataWindow Oval Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control Moveable ~r~n"
end if 

//name 
if dw_1.Describe("o_1.Name") = dw_1.object.o_1.Name then 
	mle_1.text += "Succeed ! DataWindow Oval Control Name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control Name ~r~n"
end if

//pointer 
ls_rtv = dw_1.Modify("o_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control Pointer  ~r~n"
elseif dw_1.describe("o_1.Pointer") = dw_1.object.o_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Oval Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("o_1.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control Pointer  ~r~n"
elseif dw_1.describe("o_1.Pointer") = dw_1.object.o_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Oval Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control Pointer ~r~n"
end if 

//resizeable 
ls_rtv = dw_1.Modify("o_1.resizeable=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control resizeable  ~r~n"
elseif dw_1.describe("o_1.resizeable") = dw_1.object.o_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Oval Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control resizeable ~r~n"
end if 

ls_rtv = dw_1.Modify("o_1.resizeable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control resizeable  ~r~n"
elseif dw_1.describe("o_1.resizeable") = dw_1.object.o_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Oval Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control resizeable ~r~n"
end if 

//slideleft 
ls_rtv = dw_1.Modify("o_1.slideleft=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control slideleft  ~r~n"
elseif dw_1.describe("o_1.slideleft") = dw_1.object.o_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Oval Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control slideleft ~r~n"
end if 

ls_rtv = dw_1.Modify("o_1.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control slideleft  ~r~n"
elseif dw_1.describe("o_1.slideleft") = dw_1.object.o_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Oval Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control slideleft ~r~n"
end if 

//slideup 
ls_rtv = dw_1.Modify("o_1.slideup=AllAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control slideup  ~r~n"
elseif dw_1.describe("o_1.slideup") = dw_1.object.o_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Oval Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("o_1.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control slideup  ~r~n"
elseif dw_1.describe("o_1.slideup") = dw_1.object.o_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Oval Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("o_1.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control slideup  ~r~n"
elseif dw_1.describe("o_1.slideup") = dw_1.object.o_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Oval Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control slideup ~r~n"
end if 

//tag 
ls_rtv = dw_1.Modify("o_1.tag='rectangle'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control tag  ~r~n"
elseif dw_1.describe("o_1.tag") = dw_1.object.o_1.tag  then 
	mle_1.text += "Succeed ! DataWindow Oval Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control tag ~r~n"
end if 

//type 
if (dw_1.Describe("o_1.type") = 'ellipse') and  (dw_1.object.o_1.type = 'ellipse') then 
	mle_1.text += "Succeed ! DataWindow Oval Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control type ~r~n"
end if

//visible 
ls_rtv = dw_1.Modify("o_1.visible=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control visible  ~r~n"
elseif dw_1.describe("o_1.visible") = dw_1.object.o_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Oval Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("o_1.visible=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control visible  ~r~n"
elseif dw_1.describe("o_1.visible") = dw_1.object.o_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Oval Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("o_1.visible=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control visible  ~r~n"
elseif dw_1.describe("o_1.visible") = dw_1.object.o_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Oval Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("o_1.visible=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control visible  ~r~n"
elseif dw_1.describe("o_1.visible") = dw_1.object.o_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Oval Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control visible ~r~n"
end if 

//width
dw_1.object.o_1.width = '100'
ls_rtv = dw_1.Modify("o_1.width=250")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control width ~r~n"
elseif dw_1.describe("o_1.width") = dw_1.object.o_1.width then 
	mle_1.text += "Succeed ! DataWindow Oval Control width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control width ~r~n"
end if 

//x
dw_1.object.o_1.x = '900'
ls_rtv = dw_1.Modify("o_1.x=550")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control x ~r~n"
elseif dw_1.describe("o_1.x") = dw_1.object.o_1.x then 
	mle_1.text += "Succeed ! DataWindow Oval Control x ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control x ~r~n"
end if 

//y
dw_1.object.o_1.y = '500'
ls_rtv = dw_1.Modify("o_1.y=550")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control y ~r~n"
elseif dw_1.describe("o_1.y") = dw_1.object.o_1.y  then 
	mle_1.text += "Succeed ! DataWindow Oval Control y ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control y ~r~n"
end if 

//background.color 
dw_1.object.o_1.Background.Color = '255'
ls_rtv = dw_1.Modify("o_1.Background.Color='8388736'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control Background.Color ~r~n"
elseif dw_1.describe("o_1.Background.Color") = dw_1.object.o_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow Oval Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control Background.Color ~r~n"
end if 

ls_rtv = dw_1.Modify("o_1.Background.Color='8388736~trgb(0,0,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control Background.Color ~r~n"
elseif dw_1.describe("o_1.Background.Color") = dw_1.object.o_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow Oval Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control Background.Color ~r~n"
end if 

//background.mode 
dw_1.object.o_1.Background.Mode = '1'
ls_rtv = dw_1.Modify("o_1.Background.Mode='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control Background.Mode ~r~n"
elseif dw_1.describe("o_1.Background.Mode") = dw_1.object.o_1.Background.Mode then 
	mle_1.text += "Succeed ! DataWindow Oval Control Background.Mode ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control Background.Mode ~r~n"
end if 

//pen.color 
dw_1.object.o_1.pen.color = '255'
ls_rtv = dw_1.Modify("o_1.pen.color='1~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control pen.color ~r~n"
elseif dw_1.describe("o_1.pen.color") = dw_1.object.o_1.pen.color then 
	mle_1.text += "Succeed ! DataWindow Oval Control pen.color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control pen.color ~r~n"
end if 

//pen.style 
dw_1.object.o_1.pen.style = '5'
dw_1.object.o_1.pen.style = '4'
dw_1.object.o_1.pen.style = '3'
dw_1.object.o_1.pen.style = '2'
dw_1.object.o_1.pen.style = '1'
ls_rtv = dw_1.Modify("o_1.pen.style='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control pen.style ~r~n"
elseif dw_1.describe("o_1.pen.style") = dw_1.object.o_1.pen.style then 
	mle_1.text += "Succeed ! DataWindow Oval Control pen.style ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control pen.style ~r~n"
end if 

//pen.width 
dw_1.object.o_1.pen.width = '2'
ls_rtv = dw_1.Modify("o_1.pen.width='5'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control pen.width ~r~n"
elseif dw_1.describe("o_1.pen.width") = dw_1.object.o_1.pen.width then 
	mle_1.text += "Succeed ! DataWindow Oval Control pen.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control pen.width ~r~n"
end if 

//brush.color 
dw_1.object.o_1.brush.color = '255'
ls_rtv = dw_1.Modify("o_1.brush.color='1~trgb(255,0,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control brush.color ~r~n"
elseif dw_1.describe("o_1.brush.color") = dw_1.object.o_1.brush.color then 
	mle_1.text += "Succeed ! DataWindow Oval Control brush.color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control brush.color ~r~n"
end if 

//brush.hatch 
dw_1.object.o_1.brush.hatch = '7'
dw_1.object.o_1.brush.hatch = '0'
dw_1.object.o_1.brush.hatch = '5'
dw_1.object.o_1.brush.hatch = '4'
dw_1.object.o_1.brush.hatch = '3'
dw_1.object.o_1.brush.hatch = '2'
dw_1.object.o_1.brush.hatch = '1'
ls_rtv = dw_1.Modify("o_1.brush.hatch ='6'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Oval Control brush.hatch ~r~n"
elseif dw_1.describe("o_1.brush.hatch") = dw_1.object.o_1.brush.hatch then 
	mle_1.text += "Succeed ! DataWindow Oval Control brush.hatch ~r~n"
else
	mle_1.text += "Failure ! DataWindow Oval Control brush.hatch ~r~n"
end if 

end subroutine

public subroutine wf_rectangle ();string ls_rtv

//attributes 
if dw_1.Describe("r_1.Attributes") = dw_1.object.r_1.attributes then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control attributes ~r~n"
end if

//band 
ls_rtv = dw_1.Describe("r_1.Band")
if dw_1.Describe("r_1.Band") = dw_1.Object.r_1.Band then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control Band ~r~n"
else
	mle_1.text += "Succeed ! DataWindow Rectangle Control Band ~r~n"
end if 

//height 
dw_1.object.r_1.height = '1'
ls_rtv = dw_1.Modify("r_1.height=150")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control height  ~r~n"
elseif dw_1.describe("r_1.height") = dw_1.object.r_1.height  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control height  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control height ~r~n"
end if 

//moveable 
dw_1.object.r_1.Moveable = '1'
ls_rtv = dw_1.Modify("r_1.Moveable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control Moveable  ~r~n"
elseif dw_1.describe("r_1.Moveable") = dw_1.object.r_1.Moveable  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control Moveable ~r~n"
end if 

//name 
if dw_1.Describe("r_1.Name") = dw_1.object.r_1.Name then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control Name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control Name ~r~n"
end if

//pointer 
ls_rtv = dw_1.Modify("r_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control Pointer  ~r~n"
elseif dw_1.describe("r_1.Pointer") = dw_1.object.r_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("r_1.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control Pointer  ~r~n"
elseif dw_1.describe("r_1.Pointer") = dw_1.object.r_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control Pointer ~r~n"
end if 

//resizeable 
ls_rtv = dw_1.Modify("r_1.resizeable=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control resizeable  ~r~n"
elseif dw_1.describe("r_1.resizeable") = dw_1.object.r_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control resizeable ~r~n"
end if 

ls_rtv = dw_1.Modify("r_1.resizeable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control resizeable  ~r~n"
elseif dw_1.describe("r_1.resizeable") = dw_1.object.r_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control resizeable ~r~n"
end if 

//slideleft 
ls_rtv = dw_1.Modify("r_1.slideleft=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control slideleft  ~r~n"
elseif dw_1.describe("r_1.slideleft") = dw_1.object.r_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control slideleft ~r~n"
end if 

ls_rtv = dw_1.Modify("r_1.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control slideleft  ~r~n"
elseif dw_1.describe("r_1.slideleft") = dw_1.object.r_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control slideleft ~r~n"
end if 

//slideup 
ls_rtv = dw_1.Modify("r_1.slideup=AllAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control slideup  ~r~n"
elseif dw_1.describe("r_1.slideup") = dw_1.object.r_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("r_1.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control slideup  ~r~n"
elseif dw_1.describe("r_1.slideup") = dw_1.object.r_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("r_1.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control slideup  ~r~n"
elseif dw_1.describe("r_1.slideup") = dw_1.object.r_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control slideup ~r~n"
end if 

//tag 
ls_rtv = dw_1.Modify("r_1.tag='rectangle'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control tag  ~r~n"
elseif dw_1.describe("r_1.tag") = dw_1.object.r_1.tag  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control tag ~r~n"
end if 

//type 
if (dw_1.Describe("r_1.type") = 'rectangle') and  (dw_1.object.r_1.type = 'rectangle') then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control type ~r~n"
end if

//visible 
ls_rtv = dw_1.Modify("r_1.visible=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control visible  ~r~n"
elseif dw_1.describe("r_1.visible") = dw_1.object.r_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("r_1.visible=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control visible  ~r~n"
elseif dw_1.describe("r_1.visible") = dw_1.object.r_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("r_1.visible=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control visible  ~r~n"
elseif dw_1.describe("r_1.visible") = dw_1.object.r_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("r_1.visible=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control visible  ~r~n"
elseif dw_1.describe("r_1.visible") = dw_1.object.r_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control visible ~r~n"
end if 

//width
dw_1.object.r_1.width = '100'
ls_rtv = dw_1.Modify("r_1.width=250")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control width ~r~n"
elseif dw_1.describe("r_1.width") = dw_1.object.r_1.width then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control width ~r~n"
end if 

//x
dw_1.object.r_1.x = '900'
ls_rtv = dw_1.Modify("r_1.x=850")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control x ~r~n"
elseif dw_1.describe("r_1.x") = dw_1.object.r_1.x then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control x ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control x ~r~n"
end if 

//y
dw_1.object.r_1.y = '500'
ls_rtv = dw_1.Modify("r_1.y=600")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control y ~r~n"
elseif dw_1.describe("r_1.y") = dw_1.object.r_1.y  then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control y ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control y ~r~n"
end if 

//background.color 
dw_1.object.r_1.Background.Color = '255'
ls_rtv = dw_1.Modify("r_1.Background.Color='8388736'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control Background.Color ~r~n"
elseif dw_1.describe("r_1.Background.Color") = dw_1.object.r_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control Background.Color ~r~n"
end if 

ls_rtv = dw_1.Modify("r_1.Background.Color='8388736~trgb(0,0,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control Background.Color ~r~n"
elseif dw_1.describe("r_1.Background.Color") = dw_1.object.r_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control Background.Color ~r~n"
end if 

//background.mode 
dw_1.object.r_1.Background.Mode = '1'
ls_rtv = dw_1.Modify("r_1.Background.Mode='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control Background.Mode ~r~n"
elseif dw_1.describe("r_1.Background.Mode") = dw_1.object.r_1.Background.Mode then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control Background.Mode ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control Background.Mode ~r~n"
end if 

//pen.color 
dw_1.object.r_1.pen.color = '255'
ls_rtv = dw_1.Modify("r_1.pen.color='1~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control pen.color ~r~n"
elseif dw_1.describe("r_1.pen.color") = dw_1.object.r_1.pen.color then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control pen.color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control pen.color ~r~n"
end if 

//pen.style 
dw_1.object.r_1.pen.style = '5'
dw_1.object.r_1.pen.style = '4'
dw_1.object.r_1.pen.style = '3'
dw_1.object.r_1.pen.style = '2'
dw_1.object.r_1.pen.style = '1'
ls_rtv = dw_1.Modify("r_1.pen.style='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control pen.style ~r~n"
elseif dw_1.describe("r_1.pen.style") = dw_1.object.r_1.pen.style then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control pen.style ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control pen.style ~r~n"
end if 

//pen.width 
dw_1.object.r_1.pen.width = '2'
ls_rtv = dw_1.Modify("r_1.pen.width='5'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control pen.width ~r~n"
elseif dw_1.describe("r_1.pen.width") = dw_1.object.r_1.pen.width then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control pen.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control pen.width ~r~n"
end if 

//brush.color 
dw_1.object.r_1.brush.color = '255'
ls_rtv = dw_1.Modify("r_1.brush.color='1~trgb(255,0,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control brush.color ~r~n"
elseif dw_1.describe("r_1.brush.color") = dw_1.object.r_1.brush.color then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control brush.color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control brush.color ~r~n"
end if 

//brush.hatch 
dw_1.object.r_1.brush.hatch = '7'
dw_1.object.r_1.brush.hatch = '0'
dw_1.object.r_1.brush.hatch = '5'
dw_1.object.r_1.brush.hatch = '4'
dw_1.object.r_1.brush.hatch = '3'
dw_1.object.r_1.brush.hatch = '2'
dw_1.object.r_1.brush.hatch = '1'
ls_rtv = dw_1.Modify("r_1.brush.hatch ='6'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Rectangle Control brush.hatch ~r~n"
elseif dw_1.describe("r_1.brush.hatch") = dw_1.object.r_1.brush.hatch then 
	mle_1.text += "Succeed ! DataWindow Rectangle Control brush.hatch ~r~n"
else
	mle_1.text += "Failure ! DataWindow Rectangle Control brush.hatch ~r~n"
end if 

end subroutine

public subroutine wf_line ();string ls_rtv 
int i
//Line property testing

//attributes 
if dw_1.Describe("l_1.Attributes") = dw_1.object.l_1.attributes then 
	mle_1.text += "Succeed ! DataWindow Line Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control attributes ~r~n"
end if

//band 
ls_rtv = dw_1.Describe("l_1.Band")
if dw_1.Describe("l_1.Band") = dw_1.Object.l_1.Band then 
	mle_1.text += "Succeed ! DataWindow Line Control Band ~r~n"
else
	mle_1.text += "Succeed ! DataWindow Line Control Band ~r~n"
end if 

//moveable 
dw_1.object.l_1.Moveable = '1'
ls_rtv = dw_1.Modify("l_1.Moveable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control Moveable  ~r~n"
elseif dw_1.describe("l_1.Moveable") = dw_1.object.l_1.Moveable  then 
	mle_1.text += "Succeed ! DataWindow Line Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control Moveable ~r~n"
end if 

//name 
if dw_1.Describe("l_1.Name") = dw_1.object.l_1.Name then 
	mle_1.text += "Succeed ! DataWindow Line Control Name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control Name ~r~n"
end if

//pointer 
dw_1.object.l_1.Pointer  = gs_curdir + "\cursor\H_NE.CUR"
ls_rtv = dw_1.Modify("l_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control Pointer  ~r~n"
elseif dw_1.describe("l_1.Pointer") = dw_1.object.l_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Line Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("l_1.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control Pointer  ~r~n"
elseif dw_1.describe("l_1.Pointer") = dw_1.object.l_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Line Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control Pointer ~r~n"
end if 

//resizeable 
 dw_1.object.l_1.resizeable = "1"
ls_rtv = dw_1.Modify("l_1.resizeable=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control resizeable  ~r~n"
elseif dw_1.describe("l_1.resizeable") = dw_1.object.l_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Line Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control resizeable ~r~n"
end if 

ls_rtv = dw_1.Modify("l_1.resizeable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control resizeable  ~r~n"
elseif dw_1.describe("l_1.resizeable") = dw_1.object.l_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Line Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control resizeable ~r~n"
end if 

//slideleft 
dw_1.object.l_1.slideleft  = "yes"
ls_rtv = dw_1.Modify("l_1.slideleft=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control slideleft  ~r~n"
elseif dw_1.describe("l_1.slideleft") = dw_1.object.l_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Line Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control slideleft ~r~n"
end if 

ls_rtv = dw_1.Modify("l_1.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control slideleft  ~r~n"
elseif dw_1.describe("l_1.slideleft") = dw_1.object.l_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Line Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control slideleft ~r~n"
end if 

//slideup 
dw_1.object.l_1.slideup = "Allabove"
ls_rtv = dw_1.Modify("l_1.slideup=AllAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control slideup  ~r~n"
elseif dw_1.describe("l_1.slideup") = dw_1.object.l_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Line Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("l_1.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control slideup  ~r~n"
elseif dw_1.describe("l_1.slideup") = dw_1.object.l_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Line Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("l_1.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control slideup  ~r~n"
elseif dw_1.describe("l_1.slideup") = dw_1.object.l_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Line Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control slideup ~r~n"
end if 

//tag 
dw_1.object.l_1.tag = "test"
ls_rtv = dw_1.Modify("l_1.tag='Header of Employee ID'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control tag  ~r~n"
elseif dw_1.describe("l_1.tag") = dw_1.object.l_1.tag  then 
	mle_1.text += "Succeed ! DataWindow Line Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control tag ~r~n"
end if 

//type 
if (dw_1.Describe("l_1.type") = 'line') and  (dw_1.object.l_1.type = 'line') then 
	mle_1.text += "Succeed ! DataWindow Line Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control type ~r~n"
end if

//visible 
dw_1.object.l_1.visible = 'no'
ls_rtv = dw_1.Modify("l_1.visible=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control visible  ~r~n"
elseif dw_1.describe("l_1.visible") = dw_1.object.l_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Line Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("l_1.visible=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control visible  ~r~n"
elseif dw_1.describe("l_1.visible") = dw_1.object.l_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Line Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("l_1.visible=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control visible  ~r~n"
elseif dw_1.describe("l_1.visible") = dw_1.object.l_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Line Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("l_1.visible=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control visible  ~r~n"
elseif dw_1.describe("l_1.visible") = dw_1.object.l_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Line Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control visible ~r~n"
end if 

//x1 
dw_1.object.l_1.x1 = '100'
ls_rtv = dw_1.Modify("l_1.x1=150")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control x1  ~r~n"
elseif dw_1.describe("l_1.x1") = dw_1.object.l_1.x1  then 
	mle_1.text += "Succeed ! DataWindow Line Control x1  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control x1 ~r~n"
end if 

//x2 
dw_1.object.l_1.x2 = '300'
ls_rtv = dw_1.Modify("l_1.x2=400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control x2  ~r~n"
elseif dw_1.describe("l_1.x2") = dw_1.object.l_1.x2  then 
	mle_1.text += "Succeed ! DataWindow Line Control x2  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control x2 ~r~n"
end if 

//y1 
dw_1.object.l_1.y1 = '500'
ls_rtv = dw_1.Modify("l_1.y1=600")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control y1  ~r~n"
elseif dw_1.describe("l_1.y1") = dw_1.object.l_1.y1  then 
	mle_1.text += "Succeed ! DataWindow Line Control y1  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control y1 ~r~n"
end if 

//y2 
dw_1.object.l_1.y2 = '650'
ls_rtv = dw_1.Modify("l_1.y2=700")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control y2  ~r~n"
elseif dw_1.describe("l_1.y2") = dw_1.object.l_1.y2  then 
	mle_1.text += "Succeed ! DataWindow Line Control y2  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control y2 ~r~n"
end if 

//background.color 
dw_1.object.l_1.Background.Color = '255'
ls_rtv = dw_1.Modify("l_1.Background.Color='8388736'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control Background.Color ~r~n"
elseif dw_1.describe("l_1.Background.Color") = dw_1.object.l_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow Line Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control Background.Color ~r~n"
end if 

ls_rtv = dw_1.Modify("l_1.Background.Color='8388736~trgb(255,0,0)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control Background.Color ~r~n"
elseif dw_1.describe("l_1.Background.Color") = dw_1.object.l_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow Line Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control Background.Color ~r~n"
end if 

//background.mode 
dw_1.object.l_1.Background.Mode = '0'
ls_rtv = dw_1.Modify("l_1.Background.Mode='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control Background.Mode ~r~n"
elseif dw_1.describe("l_1.Background.Mode") = dw_1.object.l_1.Background.Mode then 
	mle_1.text += "Succeed ! DataWindow Line Control Background.Mode ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control Background.Mode ~r~n"
end if 

//pen.color 
dw_1.object.l_1.pen.color = '255'
ls_rtv = dw_1.Modify("l_1.pen.color='1~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control pen.color ~r~n"
elseif dw_1.describe("l_1.pen.color") = dw_1.object.l_1.pen.color then 
	mle_1.text += "Succeed ! DataWindow Line Control pen.color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control pen.color ~r~n"
end if 

//pen.style 
dw_1.object.l_1.pen.style = '5'
dw_1.object.l_1.pen.style = '4'
dw_1.object.l_1.pen.style = '3'
dw_1.object.l_1.pen.style = '2'
dw_1.object.l_1.pen.style = '1'
ls_rtv = dw_1.Modify("l_1.pen.style='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control pen.style ~r~n"
elseif dw_1.describe("l_1.pen.style") = dw_1.object.l_1.pen.style then 
	mle_1.text += "Succeed ! DataWindow Line Control pen.style ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control pen.style ~r~n"
end if 

//pen.width 
dw_1.object.l_1.pen.width = '2'
ls_rtv = dw_1.Modify("l_1.pen.width='5'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Line Control pen.width ~r~n"
elseif dw_1.describe("l_1.pen.width") = dw_1.object.l_1.pen.width then 
	mle_1.text += "Succeed ! DataWindow Line Control pen.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Line Control pen.width ~r~n"
end if 

end subroutine

public subroutine wf_roundrectangle ();string ls_rtv
//attributes 
//band 
//ellipseheight 
//ellipsewidth 
//height 
//moveable 
//name 
//pointer 
//resizeable 
//slideleft 
//slideup 
//tag 
//type 
//visible 
//width 
//x 
//y 
//background.color 
//background.mode 
//brush.color 
//brush.hatch 
//pen.color 
//pen.style 
//pen.width 


//attributes 
if dw_1.Describe("rr_1.Attributes") = dw_1.object.rr_1.attributes then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control attributes ~r~n"
end if

//band 
ls_rtv = dw_1.Describe("rr_1.Band")
if dw_1.Describe("rr_1.Band") = dw_1.Object.rr_1.Band then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control Band ~r~n"
else
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control Band ~r~n"
end if 

//ellipseheight 
dw_1.object.rr_1.ellipseheight = '1'
ls_rtv = dw_1.Modify("rr_1.ellipseheight=6")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control ellipseheight  ~r~n"
elseif dw_1.describe("rr_1.ellipseheight") = dw_1.object.rr_1.ellipseheight  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control ellipseheight  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control ellipseheight ~r~n"
end if 

//ellipsewidth 
dw_1.object.rr_1.ellipsewidth = '1'
ls_rtv = dw_1.Modify("rr_1.ellipsewidth=4")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control ellipsewidth  ~r~n"
elseif dw_1.describe("rr_1.ellipsewidth") = dw_1.object.rr_1.ellipsewidth  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control ellipsewidth  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control ellipsewidth ~r~n"
end if 

//height 
dw_1.object.rr_1.height = '1'
ls_rtv = dw_1.Modify("rr_1.height=150")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control height  ~r~n"
elseif dw_1.describe("rr_1.height") = dw_1.object.rr_1.height  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control height  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control height ~r~n"
end if 

//moveable 
dw_1.object.rr_1.Moveable = '1'
ls_rtv = dw_1.Modify("rr_1.Moveable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Moveable  ~r~n"
elseif dw_1.describe("rr_1.Moveable") = dw_1.object.rr_1.Moveable  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Moveable ~r~n"
end if 

//name 
if dw_1.Describe("rr_1.Name") = dw_1.object.rr_1.Name then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control Name ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Name ~r~n"
end if

//pointer 
ls_rtv = dw_1.Modify("rr_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Pointer  ~r~n"
elseif dw_1.describe("rr_1.Pointer") = dw_1.object.rr_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("rr_1.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Pointer  ~r~n"
elseif dw_1.describe("rr_1.Pointer") = dw_1.object.rr_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Pointer ~r~n"
end if 

//resizeable 
ls_rtv = dw_1.Modify("rr_1.resizeable=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control resizeable  ~r~n"
elseif dw_1.describe("rr_1.resizeable") = dw_1.object.rr_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control resizeable ~r~n"
end if 

ls_rtv = dw_1.Modify("rr_1.resizeable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control resizeable  ~r~n"
elseif dw_1.describe("rr_1.resizeable") = dw_1.object.rr_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control resizeable ~r~n"
end if 

//slideleft 
ls_rtv = dw_1.Modify("rr_1.slideleft=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control slideleft  ~r~n"
elseif dw_1.describe("rr_1.slideleft") = dw_1.object.rr_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control slideleft ~r~n"
end if 

ls_rtv = dw_1.Modify("rr_1.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control slideleft  ~r~n"
elseif dw_1.describe("rr_1.slideleft") = dw_1.object.rr_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control slideleft ~r~n"
end if 

//slideup 
ls_rtv = dw_1.Modify("rr_1.slideup=AllAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control slideup  ~r~n"
elseif dw_1.describe("rr_1.slideup") = dw_1.object.rr_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("rr_1.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control slideup  ~r~n"
elseif dw_1.describe("rr_1.slideup") = dw_1.object.rr_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("rr_1.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control slideup  ~r~n"
elseif dw_1.describe("rr_1.slideup") = dw_1.object.rr_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control slideup ~r~n"
end if 

//tag 
ls_rtv = dw_1.Modify("rr_1.tag='rectangle'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control tag  ~r~n"
elseif dw_1.describe("rr_1.tag") = dw_1.object.rr_1.tag  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control tag ~r~n"
end if 

//type 
if (dw_1.Describe("rr_1.type") = 'roundrectangle') and  (dw_1.object.rr_1.type = 'roundrectangle') then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control type ~r~n"
end if

//visible 
ls_rtv = dw_1.Modify("rr_1.visible=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control visible  ~r~n"
elseif dw_1.describe("rr_1.visible") = dw_1.object.rr_1.visible  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("rr_1.visible=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control visible  ~r~n"
elseif dw_1.describe("rr_1.visible") = dw_1.object.rr_1.visible  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("rr_1.visible=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control visible  ~r~n"
elseif dw_1.describe("rr_1.visible") = dw_1.object.rr_1.visible  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("rr_1.visible=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control visible  ~r~n"
elseif dw_1.describe("rr_1.visible") = dw_1.object.rr_1.visible  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control visible ~r~n"
end if 

//width
dw_1.object.rr_1.width = '100'
ls_rtv = dw_1.Modify("rr_1.width=250")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control width ~r~n"
elseif dw_1.describe("rr_1.width") = dw_1.object.rr_1.width then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control width ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control width ~r~n"
end if 

//x
dw_1.object.rr_1.x = '1400'
ls_rtv = dw_1.Modify("rr_1.x=1450")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control x ~r~n"
elseif dw_1.describe("rr_1.x") = dw_1.object.rr_1.x then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control x ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control x ~r~n"
end if 

//y
dw_1.object.rr_1.y = '500'
ls_rtv = dw_1.Modify("rr_1.y=550")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control y ~r~n"
elseif dw_1.describe("rr_1.y") = dw_1.object.rr_1.y  then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control y ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control y ~r~n"
end if 

//background.color 
dw_1.object.rr_1.Background.Color = '255'
ls_rtv = dw_1.Modify("rr_1.Background.Color='8388736'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Background.Color ~r~n"
elseif dw_1.describe("rr_1.Background.Color") = dw_1.object.rr_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Background.Color ~r~n"
end if 

ls_rtv = dw_1.Modify("rr_1.Background.Color='8388736~trgb(127,0,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Background.Color ~r~n"
elseif dw_1.describe("rr_1.Background.Color") = dw_1.object.rr_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Background.Color ~r~n"
end if 

//background.mode 
dw_1.object.rr_1.Background.Mode = '1'
ls_rtv = dw_1.Modify("rr_1.Background.Mode='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Background.Mode ~r~n"
elseif dw_1.describe("rr_1.Background.Mode") = dw_1.object.rr_1.Background.Mode then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control Background.Mode ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control Background.Mode ~r~n"
end if 

//pen.color 
dw_1.object.rr_1.pen.color = '255'
ls_rtv = dw_1.Modify("rr_1.pen.color='1~trgb(0,128,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control pen.color ~r~n"
elseif dw_1.describe("rr_1.pen.color") = dw_1.object.rr_1.pen.color then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control pen.color ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control pen.color ~r~n"
end if 

//pen.style 
dw_1.object.rr_1.pen.style = '5'
dw_1.object.rr_1.pen.style = '4'
dw_1.object.rr_1.pen.style = '3'
dw_1.object.rr_1.pen.style = '2'
dw_1.object.rr_1.pen.style = '1'
ls_rtv = dw_1.Modify("rr_1.pen.style='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control pen.style ~r~n"
elseif dw_1.describe("rr_1.pen.style") = dw_1.object.rr_1.pen.style then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control pen.style ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control pen.style ~r~n"
end if 

//pen.width 
dw_1.object.rr_1.pen.width = '2'
ls_rtv = dw_1.Modify("rr_1.pen.width='5'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control pen.width ~r~n"
elseif dw_1.describe("rr_1.pen.width") = dw_1.object.rr_1.pen.width then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control pen.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control pen.width ~r~n"
end if 

//brush.color 
dw_1.object.rr_1.brush.color = '255'
ls_rtv = dw_1.Modify("rr_1.brush.color='1~trgb(255,0,128)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control brush.color ~r~n"
elseif dw_1.describe("rr_1.brush.color") = dw_1.object.rr_1.brush.color then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control brush.color ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control brush.color ~r~n"
end if 

//brush.hatch 
dw_1.object.rr_1.brush.hatch = '7'
dw_1.object.rr_1.brush.hatch = '0'
dw_1.object.rr_1.brush.hatch = '5'
dw_1.object.rr_1.brush.hatch = '4'
dw_1.object.rr_1.brush.hatch = '3'
dw_1.object.rr_1.brush.hatch = '2'
dw_1.object.rr_1.brush.hatch = '1'
ls_rtv = dw_1.Modify("rr_1.brush.hatch ='6'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow RoundRectangle Control brush.hatch ~r~n"
elseif dw_1.describe("rr_1.brush.hatch") = dw_1.object.rr_1.brush.hatch then 
	mle_1.text += "Succeed ! DataWindow RoundRectangle Control brush.hatch ~r~n"
else
	mle_1.text += "Failure ! DataWindow RoundRectangle Control brush.hatch ~r~n"
end if 

end subroutine

public subroutine wf_create ();string mod_string , ls_rtv
/**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Modify Create Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"

dw_1.dataobject = 'd_tabular_complex_create'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//create column 
mod_string = 'create column(band=detail id=1 alignment="0" tabsequence=0 border="0" color="33554432" x="32" y="12" height="76" width="640" html.valueishtml="0"  name=id visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no edit.imemode=0  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="1073741824" )'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create column ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create column ~r~n"
end if 

//oval
mod_string = 'create ellipse(band=detail x="1367" y="120" height="120" width="137"  name=oval_1 visible="1" brush.hatch="6" brush.color="33554432" pen.style="0" pen.width="5" pen.color="1073741824"  background.mode="2" background.color="33554432" )'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create oval ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create oval ~r~n"
end if 

//text
mod_string = 'create text(band=header alignment="2" text="New Text" border="0" color="33554432" x="5" y="4" height="104" width="343" html.valueishtml="0"  name=id_t visible="1"  font.face="MS Sans Serif" font.height="-8" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create text ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create text ~r~n"
end if 

//button
mod_string = 'create button(band=detail text="none" enabled=yes action="0" border="1" color="33554432" x="242" y="100" height="120" width="320" vtextalign="0" htextalign="0"  name=b_1 visible="1"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" )'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create button ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create button ~r~n"
end if 

//computed field
mod_string = 'create compute(band=detail alignment="0" expression=" id "border="0" color="33554432" x="50" y="300" height="76" width="256" format="[General]" html.valueishtml="0"  name=compute_1 visible="1"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="1073741824" )'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create computedfield ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create computedfield ~r~n"
end if 

//groupbox
mod_string = 'create groupbox(band=detail text="Create"border="2" color="33554432" x="617" y="100" height="140" width="439"  name=gb_1 visible="1"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="1073741824" )'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create groupbox ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create groupbox ~r~n"
end if 

//line
mod_string = 'create line(band=detail x1="1129" y1="124" x2="1266" y2="124"  name=l_1 visible="1" pen.style="1" pen.width="5" pen.color="255"  background.mode="2" background.color="1073741824" )'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create line ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create line ~r~n"
end if 

//rectangle
mod_string = 'create rectangle(band=detail x="1545" y="116" height="120" width="137"  name=r_1 visible="1" brush.hatch="6" brush.color="33554432" pen.style="0" pen.width="5" pen.color="1073741824"  background.mode="2" background.color="33554432" )'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create rectangle ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create rectangle ~r~n"
end if 

//roundrectangle
mod_string = 'create roundrectangle(band=detail ellipseheight="36" ellipsewidth="41"x="1774" y="136" height="120" width="137"  name=rr_1 visible="1" brush.hatch="6" brush.color="400" pen.style="0" pen.width="5" pen.color="1073741824"  background.mode="2" background.color="33554432" )'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create roundrectangle ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create roundrectangle ~r~n"
end if 

//tableblob
mod_string = " table(column=(type=char(20) update=yes updatewhereclause=yes key=yes name=id dbname=~"ole.id~" )"+&
" column=(type=blob name=blob_1 dbname=~"object~" ) retrieve=~"PBSELECT(TABLE(NAME='ole') COLUMN(NAME='ole.id'))~" update=~"ole~" updatewhere=1 updatekeyinplace=no )"

ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Modify table ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Modify table ~r~n"
end if 

mod_string = 'create tableblob (band=detail table="ole" keyclause="id=:id" template="" id=2 x="905" y="584" height="120" width="137" border="0"  oleclass="Excel.Sheet.5" clientname="aa" name=blob_1 visible="1")'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create tableblob ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create tableblob ~r~n"
end if 

//report
mod_string = 'create report(band=detail dataobject="d_dddw_dept" x="901" y="292" height="136" width="8393" border="0"  height.autosize=yes criteria="" trail_footer = yes  name=dw_1 visible="1"  slideleft=yes  slideup=directlyabove )'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create report ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create report ~r~n"
end if 

//bitmap
mod_string = 'create bitmap(band=detail filename=".\picture\check.bmp" x="46" y="96" height="120" width="137" border="0"  name=p_1 visible="1" )'
ls_rtv = dw_1.Modify(mod_string)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create bitmap ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create bitmap ~r~n"
end if 
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

mle_1.scroll(1000)
end subroutine

public subroutine wf_destroy ();string ls_rtv  , mod_string

dw_1.dataobject = 'd_tabular_complex'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()
mle_1.text = ''

/**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Modify Destroy Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"

//destroy text
ls_rtv = dw_1.Modify("destroy id_t")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy text ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy text ~r~n"
end if 

//destroy button
ls_rtv = dw_1.Modify("destroy b_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy button ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy button ~r~n"
end if 

//destroy computedfield
ls_rtv = dw_1.Modify("destroy  compute_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy computedfield ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy computedfield ~r~n"
end if 

//destroy groupbox
ls_rtv = dw_1.Modify("destroy  gb_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy groupbox ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy groupbox ~r~n"
end if 

//destroy line
ls_rtv = dw_1.Modify("destroy  l_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy line ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy line ~r~n"
end if 

//destroy oval
ls_rtv = dw_1.Modify("destroy  oval_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy oval ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy oval ~r~n"
end if 

//destroy rectangle
ls_rtv = dw_1.Modify("destroy  r_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy rectangle ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy rectangle ~r~n"
end if 

//destroy roundrectangle
ls_rtv = dw_1.Modify("destroy  rr_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy roundrectangle ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy roundrectangle ~r~n"
end if 

//destroy ole
ls_rtv = dw_1.Modify("destroy  ole_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy ole ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy ole ~r~n"
end if 

//destroy dbole
ls_rtv = dw_1.Modify("destroy  blob_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy dbole ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy dbole ~r~n"
end if 

//destroy report
ls_rtv = dw_1.Modify("destroy  dw_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy report ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy report ~r~n"
end if 

//destroy bitmap
ls_rtv = dw_1.Modify("destroy  p_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy bitmap ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy bitmap ~r~n"
end if 

//destroy graph
ls_rtv = dw_1.Modify("destroy  gr_1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy graph ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy graph ~r~n"
end if 

//destroy column
ls_rtv = dw_1.Modify("destroy column id")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Destroy column ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Destroy column ~r~n"
end if 
//

mle_1.scroll(1000)
end subroutine

public subroutine wf_table_old ();string ls_mod , ls_rtv

/**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Modify Create Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"

dw_1.dataobject = 'ddd'
dw_1.SetTransObject(sqlca)

ls_mod = 'table(column=(type=long update=yes updatewhereclause=yes key=yes name=emp_id dbname="employee.emp_id" ) ' + &
' column=(type=long update=yes updatewhereclause=yes name=manager_id dbname="employee.manager_id" )' + &
' column=(type=char(20) update=yes updatewhereclause=yes name=emp_fname dbname="employee.emp_fname" ) ' + &
' column=(type=char(20) update=yes updatewhereclause=yes name=emp_lname dbname="employee.emp_lname" ) ' + &
' column=(type=long update=yes updatewhereclause=yes name=dept_id dbname="employee.dept_id" ) ' + &
' column=(type=char(40) update=yes updatewhereclause=yes name=street dbname="employee.street" ) ' + &
' column=(type=char(20) update=yes updatewhereclause=yes name=city dbname="employee.city" ) ' + &
' column=(type=char(4) update=yes updatewhereclause=yes name=state dbname="employee.state" ) ' + &
' column=(type=char(9) update=yes updatewhereclause=yes name=zip_code dbname="employee.zip_code" ) ' + &
' column=(type=char(10) update=yes updatewhereclause=yes name=phone dbname="employee.phone" ) ' + &
' column=(type=char(1) update=yes updatewhereclause=yes name=status dbname="employee.status" initial="A" values="Active	A/Terminated	T/On Leave	L/" validation="match( gettext() , ~"^[ALT]$~")" ) ' + &
' column=(type=char(11) update=yes updatewhereclause=yes name=ss_number dbname="employee.ss_number" ) ' + &
' column=(type=decimal(3) update=yes updatewhereclause=yes name=salary dbname="employee.salary" validation=" real(gettext())  > 0" validationmsg="Sorry! The value must be greater than zero." ) ' + &
' column=(type=date update=yes updatewhereclause=yes name=start_date dbname="employee.start_date" ) ' + &
' column=(type=date update=yes updatewhereclause=yes name=termination_date dbname="employee.termination_date" ) ' + &
' column=(type=date update=yes updatewhereclause=yes name=birth_date dbname="employee.birth_date" ) ' + &
' column=(type=char(1) update=yes updatewhereclause=yes name=bene_health_ins dbname="employee.bene_health_ins" values="Health Insurance	Y/Health Insurance	N" validation="match( gettext() , ~"^[YNyn]$~")" ) ' + &
' column=(type=char(1) update=yes updatewhereclause=yes name=bene_life_ins dbname="employee.bene_life_ins" values="Life Insurance	Y/Life Insurance	N" validation="match( gettext() , ~"^[YNyn]$~")" ) ' + &
' column=(type=char(1) update=yes updatewhereclause=yes name=bene_day_care dbname="employee.bene_day_care" values="Day Care	Y/Day Care	N" validation="match( gettext() , ~"^[YNyn]$~")" ) ' + &
' column=(type=char(1) update=yes updatewhereclause=yes name=sex dbname="employee.sex" values="Male	M/Female	F/" ) ' + &
' retrieve="PBSELECT(TABLE(NAME=~"employee~") COLUMN(NAME=~"employee.emp_id~")COLUMN(NAME=~"employee.manager_id~")COLUMN(NAME=~"employee.emp_fname~")COLUMN(NAME=~"employee.emp_lname~")COLUMN(NAME=~"employee.dept_id~")COLUMN(NAME=~"employee.street~")COLUMN(NAME=~"employee.city~")COLUMN(NAME=~"employee.state~")COLUMN(NAME=~"employee.zip_code~")COLUMN(NAME=~"employee.phone~")COLUMN(NAME=~"employee.status~")COLUMN(NAME=~"employee.ss_number~")COLUMN(NAME=~"employee.salary~")COLUMN(NAME=~"employee.start_date~")COLUMN(NAME=~"employee.termination_date~")COLUMN(NAME=~"employee.birth_date~")COLUMN(NAME=~"employee.bene_health_ins~")COLUMN(NAME=~"employee.bene_life_ins~")COLUMN(NAME=~"employee.bene_day_care~")COLUMN(NAME=~"employee.sex~"))"  ' + &
' update="employee" updatewhere=1 updatekeyinplace=no )'

ls_rtv = dw_1.Modify(ls_mod)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create Table ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create Table ~r~n"
end if 

//create column 
ls_mod = 'create column(band=detail id=1 alignment="1" tabsequence=10 border="0" color="33554432" x="5" y="4" height="60" width="206" format="[general]" html.valueishtml="0"  name=emp_id  tag="Identification Number of the employee" visible="1" edit.limit=0 edit.case=any edit.autoselect=yes edit.autohscroll=yes  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'
ls_rtv = dw_1.Modify(ls_mod)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Create column ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Create column ~r~n"
end if 

dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

end subroutine

public subroutine wf_table ();string ls_mod, ret , ls_rtv
/**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Modify Table Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"

dw_1.dataobject = 'd_test_table'
dw_1.SetTransObject(sqlca)

ls_mod = " table(column=(type=long update=yes updatewhereclause=yes name=fmt1_format_id dbname=~"break_even_analysis.fmt1_format_id~" )  column=(type=long update=yes updatewhereclause=yes name=fmt2_format_id dbname=~"break_even_analysis.fmt2_format_id~" )  column=(type=long update=yes updatewhereclause=yes name=fmt3_format_id dbname=~"break_even_analysis.fmt3_format_id~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt1_price dbname=~"break_even_analysis.fmt1_price~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt1_mix_percentage dbname=~"break_even_analysis.fmt1_mix_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt1_discount_percen dbname=~"break_even_analysis.fmt1_discount_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt1_manufactured_co dbname=~"break_even_analysis.fmt1_manufactured_cost~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt1_royalty_percent dbname=~"break_even_analysis.fmt1_royalty_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt1_distribution_co dbname=~"break_even_analysis.fmt1_distribution_cost~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt1_copyright_perce dbname=~"break_even_analysis.fmt1_copyright_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt2_price dbname=~"break_even_analysis.fmt2_price~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt2_mix_percentage dbname=~"break_even_analysis.fmt2_mix_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt2_discount_percen dbname=~"break_even_analysis.fmt2_discount_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt2_manufactured_co dbname=~"break_even_analysis.fmt2_manufactured_cost~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt2_royalty_percent dbname=~"break_even_analysis.fmt2_royalty_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt2_distribution_co dbname=~"break_even_analysis.fmt2_distribution_cost~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt2_copyright_perce dbname=~"break_even_analysis.fmt2_copyright_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt3_price dbname=~"break_even_analysis.fmt3_price~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt3_mix_percentage dbname=~"break_even_analysis.fmt3_mix_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt3_discount_percen dbname=~"break_even_analysis.fmt3_discount_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt3_manufactured_co dbname=~"break_even_analysis.fmt3_manufactured_cost~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt3_royalty_percent dbname=~"break_even_analysis.fmt3_royalty_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt3_distribution_co dbname=~"break_even_analysis.fmt3_distribution_cost~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_fmt3_copyright_perce dbname=~"break_even_analysis.fmt3_copyright_percentage~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_project dbname=~"break_even_analysis.project~" )  column=(type=decimal(2) update=yes updatewhereclause=yes name=break_even_analysis_forecast dbname=~"break_even_analysis.forecast~" ) " +&
" column=(type=decimal(2) updatewhereclause=yes name=project_1 dbname=~"compute_0027~" )" +&
" column=(type=decimal(2) updatewhereclause=yes name=forecast_1 dbname=~"compute_0028~" )" +&
" column=(type=decimal(2) updatewhereclause=yes name=project_2 dbname=~"compute_0029~" )" +&
" column=(type=decimal(2) updatewhereclause=yes name=forecast_2 dbname=~"compute_0030~" )" +&
" column=(type=decimal(2) updatewhereclause=yes name=project_3 dbname=~"compute_0031~" )" +&
" column=(type=decimal(2) updatewhereclause=yes name=forecast_3 dbname=~"compute_0032~" )" +&
" column=(type=decimal(2) updatewhereclause=yes name=project_4 dbname=~"compute_0033~" )" +&
" column=(type=decimal(2) updatewhereclause=yes name=forecast_4 dbname=~"compute_0034~" )" +&
" column=(type=decimal(2) updatewhereclause=yes name=project_5 dbname=~"compute_0035~" )" +&
" column=(type=decimal(2) updatewhereclause=yes name=forecast_5 dbname=~"compute_0036~" )" +&
" column=(type=long update=yes updatewhereclause=yes key=yes name=break_even_analysis_plan_phase_id dbname=~"break_even_analysis.plan_phase_id~" )  retrieve=~"PBSELECT( VERSION(400)  TABLE(NAME=~'break_even_analysis~' )  COLUMN(NAME=~'break_even_analysis.fmt1_format_id~') COLUMN(NAME=~'break_even_analysis.fmt2_format_id~')  COLUMN(NAME=~'break_even_analysis.fmt3_format_id~') COLUMN(NAME=~'break_even_analysis.fmt1_price~')  COLUMN(NAME=~'break_even_analysis.fmt1_mix_percentage~') COLUMN(NAME=~'break_even_analysis.fmt1_discount_percentage~')  COLUMN(NAME=~'break_even_analysis.fmt1_manufactured_cost~') COLUMN(NAME=~'break_even_analysis.fmt1_royalty_percentage~') COLUMN(NAME=~'break_even_analysis.fmt1_distribution_cost~') COLUMN(NAME=~'break_even_analysis.fmt1_copyright_percentage~')  COLUMN(NAME=~'break_even_analysis.fmt2_price~') COLUMN(NAME=~'break_even_analysis.fmt2_mix_percentage~')  COLUMN(NAME=~'break_even_analysis.fmt2_discount_percentage~') COLUMN(NAME=~'break_even_analysis.fmt2_manufactured_cost~')  COLUMN(NAME=~'break_even_analysis.fmt2_royalty_percentage~') COLUMN(NAME=~'break_even_analysis.fmt2_distribution_cost~')  COLUMN(NAME=~'break_even_analysis.fmt2_copyright_percentage~') COLUMN(NAME=~'break_even_analysis.fmt3_price~')  COLUMN(NAME=~'break_even_analysis.fmt3_mix_percentage~') COLUMN(NAME=~'break_even_analysis.fmt3_discount_percentage~')  COLUMN(NAME=~'break_even_analysis.fmt3_manufactured_cost~') COLUMN(NAME=~'break_even_analysis.fmt3_royalty_percentage~')  COLUMN(NAME=~'break_even_analysis.fmt3_distribution_cost~') COLUMN(NAME=~'break_even_analysis.fmt3_copyright_percentage~')  COLUMN(NAME=~'break_even_analysis.project~') COLUMN(NAME=~'break_even_analysis.forecast~')  " +&
" COMPUTE(NAME=~'0.00~')" + " COMPUTE(NAME=~'0.00~')" +" COMPUTE(NAME=~'0.00~')" +" COMPUTE(NAME=~'0.00~')" +&
" COMPUTE(NAME=~'0.00~')" + " COMPUTE(NAME=~'0.00~')" +" COMPUTE(NAME=~'0.00~')" +" COMPUTE(NAME=~'0.00~')" +&
" COMPUTE(NAME=~'0.00~')" + " COMPUTE(NAME=~'0.00~')" +"COLUMN(NAME=~~'break_even_analysis.plan_phase_id~~')" + "WHERE(    EXP1 =~~~"~~~~~~~"break_even_analysis~~~~~~~".~~~~~~~"plan_phase_id~~~~~~~"~~~"   OP =~~~"=~~~"    EXP2 =~~~":plan_phase_id~~~" ) ) " + "ARG(NAME = ~~~"plan_phase_id~~~" TYPE = number) ~" " + &
"update=~"break_even_analysis~" updatewhere=1 updatekeyinplace=no arguments=((~"plan_phase_id~", number)) )  "

ls_rtv = dw_1.Modify(ls_mod)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Modify Table ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Modify Table ~r~n"
end if 

ls_mod = "create text( band=detail alignment='0' text='Marketing' border='0' color='0' x='33' y='972' height='53' width='800'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('2Mod to Table Section Failed: Text',ret)

ls_mod = "create column( band=detail id=27 alignment='1' tabsequence=32766 border='0' color='0' x='883' y='972' height='61' width='320'  format='0.00;(0.00)'  name=project_1 edit.limit=0 edit.case=any edit.autoselect=yes  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('3Mod to Table Section Failed: column',ret)

ls_mod = "create column( band=detail id=28 alignment='1' tabsequence=32766 border='0' color='0' x='1249' y='972' height='61' width='320'  format='0.00;(0.00)'  name=forecast_1 edit.limit=0 edit.case=any edit.autoselect=yes  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('4Mod to Table Section Failed: Text',ret)

ls_mod = "create text( band=detail alignment='0' text='Press'border='0' color='0' x='33' y='1048' height='53' width='800'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color=' 12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('5Mod to Table Section Failed: Text',ret)

ls_mod = "create column( band=detail id=29 alignment='1' tabsequence=32766 border='0' color='0' x='883' y='1048' height='61' width='320'  format='0.00;(0.00)'  name=project_2 edit.limit=0 edit.case=any edit.autoselect=yes  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('6Mod to Table Section Failed: Text',ret)

ls_mod = "create column( band=detail id=30 alignment='1' tabsequence=32766 border='0' color='0' x='1249' y='1048' height='61' width='320'  format='0.00;(0.00)'  name=forecast_2 edit.limit=0 edit.case=any edit.autoselect=yes  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('7Mod to Table Section Failed: Text',ret)

ls_mod = "create text( band=detail alignment='0' text='Promotion'border='0' color='0' x='33' y='1124' height='53' width='800'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color=' 12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('8Mod to Table Section Failed: Text',ret)

ls_mod = "create column( band=detail id=31 alignment='1' tabsequence=32766 border='0' color='0' x='883' y='1124' height='61' width='320'  format='0.00;(0.00)'  name=project_3 edit.limit=0 edit.case=any edit.autoselect=yes  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' )"
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('9Mod to Table Section Failed: Text',ret)

ls_mod = "create column( band=detail id=32 alignment='1' tabsequence=32766 border='0' color='0' x='1249' y='1124' height='61' width='320'  format='0.00;(0.00)'  name=forecast_3 edit.limit=0 edit.case=any edit.autoselect=yes  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('10Mod to Table Section Failed: Text',ret)

ls_mod = "create text( band=detail alignment='0' text='Artwork && Repro'border='0' color='0' x='33' y='1200' height='53' width='800'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color=' 12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('11Mod to Table Section Failed: Text',ret)

ls_mod = "create column( band=detail id=33 alignment='1' tabsequence=32766 border='0' color='0' x='883' y='1200' height='61' width='320'  format='0.00;(0.00)'  name=project_4 edit.limit=0 edit.case=any edit.autoselect=yes  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('12Mod to Table Section Failed: Text',ret)

ls_mod = "create column( band=detail id=34 alignment='1' tabsequence=32766 border='0' color='0' x='1249' y='1200' height='61' width='320'  format='0.00;(0.00)'  name=forecast_4 edit.limit=0 edit.case=any edit.autoselect=yes  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' )"
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('13Mod to Table Section Failed: Text',ret)

ls_mod = "create text( band=detail alignment='0' text='Video Production'border='0' color='0' x='33' y='1276' height='53' width='800'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color=' 12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('14Mod to Table Section Failed: Text',ret)

ls_mod = "create column( band=detail id=35 alignment='1' tabsequence=32766 border='0' color='0' x='883' y='1276' height='61' width='320'  format='0.00;(0.00)'  name=project_5 edit.limit=0 edit.case=any edit.autoselect=yes  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' )"
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('15Mod to Table Section Failed: Text',ret)

ls_mod = "create column( band=detail id=36 alignment='1' tabsequence=32766 border='0' color='0' x='1249' y='1276' height='61' width='320'  format='0.00;(0.00)'  name=forecast_5 edit.limit=0 edit.case=any edit.autoselect=yes  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('16Mod to Table Section Failed: Text',ret)

ls_mod = "create line( band=detail x1=' 32' y1='1362' x2='1573' y2='1362' name=line_sp1 pen.style='0' pen.width='5' pen.color='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('17Mod to Table Section Failed: Text',ret)

ls_mod = "create text( band=detail alignment='0' text='Margin'border='0' color='0' x='32' y='1367' height='53' width='800'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('18Mod to Table Section Failed: Text',ret)

ls_mod = "create compute(band=detail alignment='1' expression=' pu_prime_cont 'border='0' color='0' x='539' y='1372' height='61' width='279' format='0.00;(0.00)'  name=pu_margin  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('19Mod to Table Section Failed: Text',ret)

ls_mod = "create compute(band=detail alignment='1' expression='proj_prime_cont + project_1 + project_2 + project_3 + project_4 + project_5'border='0' color='0' x='883' y='1372' height='61' width='320' format='0.00;(0.00)'  name=proj_margin  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('20Mod to Table Section Failed: Text',ret)

ls_mod = "create compute(band=detail alignment='1' expression='fore_prime_cont + forecast_1 + forecast_2 + forecast_3 + forecast_4 + forecast_5'border='0' color='0' x='1249' y='1372' height='61' width='320' format='0.00;(0.00)'  name=fore_margin  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('21Mod to Table Section Failed: Text',ret)

ls_mod = "create line( band=detail x1=' 32' y1='1453' x2='1573' y2='1453' name=line_sp2 pen.style='0' pen.width='5' pen.color='0' background.mode='2' background.color='12632256' ) "
ret = dw_1.Modify(ls_mod)
//IF ret <> '' THEN	MessageBox('22Mod to Table Section Failed: Text',ret)

ret = dw_1.Modify( 'DataWindow.Detail.Height = 1524')
//IF ret <> '' THEN	MessageBox('2Mod to Table Section Failed: Text',ret)


dw_1.retrieve(474)

ls_mod = 'table(column=(type=long update=yes updatewhereclause=yes key=yes name=emp_id dbname="employee.emp_id" ) ' + &
' column=(type=long update=yes updatewhereclause=yes name=manager_id dbname="employee.manager_id" )' + &
' column=(type=char(20) update=yes updatewhereclause=yes name=emp_fname dbname="employee.emp_fname" ) ' + &
' column=(type=char(20) update=yes updatewhereclause=yes name=emp_lname dbname="employee.emp_lname" ) ' + &
' column=(type=long update=yes updatewhereclause=yes name=dept_id dbname="employee.dept_id" ) ' + &
' column=(type=char(40) update=yes updatewhereclause=yes name=street dbname="employee.street" ) ' + &
' column=(type=char(20) update=yes updatewhereclause=yes name=city dbname="employee.city" ) ' + &
' column=(type=char(4) update=yes updatewhereclause=yes name=state dbname="employee.state" ) ' + &
' column=(type=char(9) update=yes updatewhereclause=yes name=zip_code dbname="employee.zip_code" ) ' + &
' column=(type=char(10) update=yes updatewhereclause=yes name=phone dbname="employee.phone" ) ' + &
' column=(type=char(1) update=yes updatewhereclause=yes name=status dbname="employee.status" initial="A" values="Active	A/Terminated	T/On Leave	L/" validation="match( gettext() , ~'^[ALT]$~')" ) ' + &
' column=(type=char(11) update=yes updatewhereclause=yes name=ss_number dbname="employee.ss_number" ) ' + &
' column=(type=decimal(3) update=yes updatewhereclause=yes name=salary dbname="employee.salary" validation=" real(gettext())  > 0" validationmsg="Sorry! The value must be greater than zero." ) ' + &
' column=(type=date update=yes updatewhereclause=yes name=start_date dbname="employee.start_date" ) ' + &
' column=(type=date update=yes updatewhereclause=yes name=termination_date dbname="employee.termination_date" ) ' + &
' column=(type=date update=yes updatewhereclause=yes name=birth_date dbname="employee.birth_date" ) ' + &
' column=(type=char(1) update=yes updatewhereclause=yes name=bene_health_ins dbname="employee.bene_health_ins" values="Health Insurance	Y/Health Insurance	N" validation="match( gettext() , ~'^[YNyn]$~')" ) ' + &
' column=(type=char(1) update=yes updatewhereclause=yes name=bene_life_ins dbname="employee.bene_life_ins" values="Life Insurance	Y/Life Insurance	N" validation="match( gettext() , ~'^[YNyn]$~')" ) ' + &
' column=(type=char(1) update=yes updatewhereclause=yes name=bene_day_care dbname="employee.bene_day_care" values="Day Care	Y/Day Care	N" validation="match( gettext() , ~'^[YNyn]$~')" ) ' + &
' column=(type=char(1) update=yes updatewhereclause=yes name=sex dbname="employee.sex" values="Male	M/Female	F/" ) ' + &
' retrieve="PBSELECT(TABLE(NAME=~'employee~') COLUMN(NAME=~'employee.emp_id~')COLUMN(NAME=~'employee.manager_id~')COLUMN(NAME=~'employee.emp_fname~')COLUMN(NAME=~'employee.emp_lname~')COLUMN(NAME=~'employee.dept_id~')COLUMN(NAME=~'employee.street~')COLUMN(NAME=~'employee.city~')COLUMN(NAME=~'employee.state~')COLUMN(NAME=~'employee.zip_code~')COLUMN(NAME=~'employee.phone~')COLUMN(NAME=~'employee.status~')COLUMN(NAME=~'employee.ss_number~')COLUMN(NAME=~'employee.salary~')COLUMN(NAME=~'employee.start_date~')COLUMN(NAME=~'employee.termination_date~')COLUMN(NAME=~'employee.birth_date~')COLUMN(NAME=~'employee.bene_health_ins~')COLUMN(NAME=~'employee.bene_life_ins~')COLUMN(NAME=~'employee.bene_day_care~')COLUMN(NAME=~'employee.sex~'))"  ' + &
' update="employee" updatewhere=1 updatekeyinplace=no )'

//------------------------------------
dw_1.dataobject = 'd_tabular_column'
dw_1.SetTransObject(sqlca)

ls_rtv = dw_1.Modify(ls_mod)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Modify Table , tabular , all kind of column ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Modify Table ~r~n"
end if 

dw_1.dataobject = 'd_grid'
dw_1.SetTransObject(sqlca)

ls_rtv = dw_1.Modify(ls_mod)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Modify Table , Grid ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Modify Table ~r~n"
end if 

dw_1.dataobject = 'd_crosstab'
dw_1.SetTransObject(sqlca)

ls_rtv = dw_1.Modify(ls_mod)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Modify Table , Crosstab~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Modify Table ~r~n"
end if 

dw_1.dataobject = 'd_grid'
dw_1.SetTransObject(sqlca)

dw_1.object.datawindow.querymode = 'Yes'
ls_rtv = dw_1.Modify(ls_mod)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Modify Table , Grid , Query Mode ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Modify Table ~r~n"
end if 

dw_1.dataobject = 'd_tabular_complex'
dw_1.SetTransObject(sqlca)

ls_rtv = dw_1.Modify(ls_mod)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Modify Table ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Modify Table ~r~n"
end if 


//-------------------------------------------------
dw_1.dataobject = 'd_table_graph'
dw_1.SetTransObject(sqlca)

//ls_mod = "table(column=(type=long updatewhereclause=yes name=dept_id dbname=~"employee.dept_id~" )" + &
//" column=(type=char(4) updatewhereclause=yes name=state dbname=~"employee.state~" )" + &
//" column=(type=char(1) updatewhereclause=yes name=sex dbname=~"employee.sex~" values=~"Male	M/Female	F/~" )" + &
//" column=(type=decimal(3) updatewhereclause=yes name=compute_0004 dbname=~"compute_0004~" )" + &
//" retrieve=~"PBSELECT( VERSION(400) TABLE(NAME=~"employee~" ) COLUMN(NAME=~"employee.dept_id~") COLUMN(NAME=~"employee.state~") COLUMN(NAME=~"employee.sex~") COMPUTE(NAME=~"sum(salary)~") GROUP(NAME=~"employee.dept_id~") GROUP(NAME=~"employee.state~") GROUP(NAME=~"employee.sex~")) ORDER(NAME=~"employee.dept_id~" ASC=yes )  ORDER(NAME=~"employee.state~" ASC=yes )  ORDER(NAME=~"employee.sex~" ASC=yes ) ~" )"

ls_mod ='table(column=(type=long updatewhereclause=yes name=dept_id dbname="employee.dept_id" )' + &
' column=(type=char(4) updatewhereclause=yes name=state dbname="employee.state" )' + &
' column=(type=char(1) updatewhereclause=yes name=sex dbname="employee.sex" values="Male	M/Female	F/" )' + &
' column=(type=decimal(3) updatewhereclause=yes name=compute_0004 dbname="compute_0004" )' + &
' retrieve="PBSELECT( VERSION(400) TABLE(NAME=~'employee~' ) COLUMN(NAME=~'employee.dept_id~') COLUMN(NAME=~'employee.state~') COLUMN(NAME=~'employee.sex~') COMPUTE(NAME=~'sum(salary)~') GROUP(NAME=~'employee.dept_id~') GROUP(NAME=~'employee.state~') GROUP(NAME=~'employee.sex~') ORDER(NAME=~'employee.dept_id~' ASC=yes )  ORDER(NAME=~'employee.state~' ASC=yes )  ORDER(NAME=~'employee.sex~' ASC=yes )) " )'

ls_rtv = dw_1.Modify(ls_mod)
if ls_rtv <> "" then 
	mle_1.text += "Failure ! Modify Table , Graph ~r~n"
	mle_1.text += "	" + ls_rtv + "~r~n"
else
	mle_1.text += "Succeed ! Modify Table ~r~n"
end if 

end subroutine

public subroutine wf_other ();// describe 

// modify
end subroutine

on w_main.create
this.cb_silktest=create cb_silktest
this.cb_test_verify=create cb_test_verify
this.cb_testall=create cb_testall
this.cb_other=create cb_other
this.cb_ole=create cb_ole
this.cb_groupbox=create cb_groupbox
this.cb_blob=create cb_blob
this.cb_bitmap=create cb_bitmap
this.cb_report=create cb_report
this.cb_graph=create cb_graph
this.mle_1=create mle_1
this.st_2=create st_2
this.st_1=create st_1
this.cb_button=create cb_button
this.cb_computedfield=create cb_computedfield
this.cb_text=create cb_text
this.cb_datawindow=create cb_datawindow
this.cb_column=create cb_column
this.Control[]={this.cb_silktest,&
this.cb_test_verify,&
this.cb_testall,&
this.cb_other,&
this.cb_ole,&
this.cb_groupbox,&
this.cb_blob,&
this.cb_bitmap,&
this.cb_report,&
this.cb_graph,&
this.mle_1,&
this.st_2,&
this.st_1,&
this.cb_button,&
this.cb_computedfield,&
this.cb_text,&
this.cb_datawindow,&
this.cb_column}
end on

on w_main.destroy
destroy(this.cb_silktest)
destroy(this.cb_test_verify)
destroy(this.cb_testall)
destroy(this.cb_other)
destroy(this.cb_ole)
destroy(this.cb_groupbox)
destroy(this.cb_blob)
destroy(this.cb_bitmap)
destroy(this.cb_report)
destroy(this.cb_graph)
destroy(this.mle_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_button)
destroy(this.cb_computedfield)
destroy(this.cb_text)
destroy(this.cb_datawindow)
destroy(this.cb_column)
end on

event open;// Profile EAS Demo DB V9
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=dsproperty;UID=dba;PWD=sql'"
connect;

dw_1 = create datastore
dw_1.dataobject = "d_tabular_emp"
dw_1.SetTransObject(sqlca)
dw_1.Retrieve(1000)

dw_2 = create datastore

gs_curdir = GetCurrentDirectory ( )


end event

event close;disconnect;
end event

type cb_silktest from commandbutton within w_main
integer x = 1920
integer y = 1408
integer width = 343
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "SilkTest"
end type

event clicked;string ls_rtv , ls_property

ls_property = trim(is_control_name) + "." + trim(is_property_name)
 
if is_property_modify = '1' then 
	ls_rtv = dw_1.Modify( ls_property  + "=" + trim(is_property_value))
	if ls_rtv <> "" then 
		mle_1.text += "Modify Failure ! " + ls_property + " : " + is_property_value + "---" + ls_rtv + "~r~n"
	elseif dw_1.describe(ls_property) = is_property_expected then 
		mle_1.text += "Succeed ! " + ls_property + "~r~n"
	else
		mle_1.text += "Describe Failure ! " + ls_property + ":" + is_property_value + " actural value: " + dw_1.describe(ls_property) + "~r~n"
	end if 
else
	if dw_1.describe(ls_property) = trim(is_property_expected) then 
		mle_1.text += "Succeed ! " + ls_property + "~r~n"
	else
		mle_1.text += "Describe Failure ! " + ls_property + ":" + is_property_value + " actural value: " + dw_1.describe(ls_property) + "~r~n"
	end if 
end if

end event

type cb_test_verify from commandbutton within w_main
integer x = 1202
integer y = 1404
integer width = 704
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Test && Verify"
end type

event clicked;//this part testing is only testing Modify() / Describe() and verify by silktest . 
// all testing data is stored in database 
// do not include dot notation .

datastore lds 
long i , j , k , rct

lds = create datastore 

lds.dataobject = 'd_testdata'
lds.SetTransObject(sqlca)

rct = lds.Retrieve()

for i=1 to rct
	is_property_modify	= lds.GetItemString( i , "modify" )
	is_property_name		= lds.GetItemString( i , "propertyname" )
	is_property_value 	= lds.GetItemString( i , "propertyvalue" )
	is_property_expected	= lds.GetItemString( i , "expected" )
	is_control_name		= lds.GetItemString( i , "objecttype" )
	
	cb_silktest.triggerevent(clicked!)
	mle_1.Scroll (10000)
	sleep(1)
next

destroy lds

end event

type cb_testall from commandbutton within w_main
integer x = 2290
integer y = 1408
integer width = 704
integer height = 108
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Test All"
end type

event clicked;cb_text.triggerevent(clicked!)
cb_button.triggerevent(clicked!)
cb_computedfield.triggerevent(clicked!)
cb_datawindow.triggerevent(clicked!)
cb_column.triggerevent(clicked!)
cb_graph.triggerevent(clicked!)
cb_bitmap.triggerevent(clicked!)
cb_groupbox.triggerevent(clicked!)
cb_blob.triggerevent(clicked!)
cb_report.triggerevent(clicked!)
cb_ole.triggerevent(clicked!)
cb_other.triggerevent(clicked!)

parent.wf_create()

parent.wf_destroy()

parent.wf_table()
end event

type cb_other from commandbutton within w_main
integer x = 2281
integer y = 1272
integer width = 709
integer height = 112
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "line/rect/rrect/oval"
end type

event clicked;//Line , l_1
dw_1.dataobject = 'd_tabular_bitmap'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//attributes 
//band 
//moveable 
//name 
//pointer 
//resizeable 
//slideleft 
//slideup 
//tag 
//type 
//visible 
//x1 
//x2 
//y1 
//y2 
//background.color 
//background.mode 
//pen.color 
//pen.style 
//pen.width 

/**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Line property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"

parent.wf_line()

//rectangle r_1

//attributes 
//band 
//height 
//moveable 
//name 
//pointer 
//resizeable 
//slideleft 
//slideup 
//tag 
//type 
//visible 
//width
//x
//y
//background.color 
//background.mode 
//pen.color 
//pen.style 
//pen.width 
//brush.color 
//brush.hatch 

/**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Rectangle property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"

parent.wf_rectangle()

// **********   Oval o_1        ******************************

//attributes 
//band 
//height 
//moveable 
//name 
//pointer 
//resizeable 
//slideleft 
//slideup 
//tag 
//type 
//visible 
//width 
//x 
//y 
//background.color 
//background.mode 
//brush.color 
//brush.hatch 
//pen.color 
//pen.style 
//pen.width 

/**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Oval property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"

parent.wf_oval()

// *********************    roundranctangle , rr_1 **********************

//attributes 
//band 
//ellipseheight 
//ellipsewidth 
//height 
//moveable 
//name 
//pointer 
//resizeable 
//slideleft 
//slideup 
//tag 
//type 
//visible 
//width 
//x 
//y 
//background.color 
//background.mode 
//brush.color 
//brush.hatch 
//pen.color 
//pen.style 
//pen.width 

/**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    RoundRectangle property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"

parent.wf_roundrectangle()
end event

type cb_ole from commandbutton within w_main
integer x = 1920
integer y = 1272
integer width = 343
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OLE"
end type

event clicked;//accessibledescription 
//accessiblename 
//accessiblerole 
//attributes 
//band 
//binaryindex 
//border 
//clientname 
//contentsallowed 
//displaytype 
//groupby 
//height 
//linkupdateoptions 
//moveable 
//name 
//pointer 
//range 
//resizeable 
//sizetodisplay 
//slideleft 
//slideup 
//tag 
//target 
//type 
//visible 
//width 
//x 
//y 
//

string ls_rtv ,tmp
int i

/*************************************

OLE property testing
**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    OLE property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"


dw_1.dataobject = 'd_tabular_bitmap'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//accessibledescription 
dw_1.object.ole_1.accessibledescription = 'OLE 描述'
ls_rtv = dw_1.Modify("ole_1.accessibledescription='OLE描述'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control accessibledescription ~r~n"
elseif dw_1.describe("ole_1.accessibledescription") = dw_1.object.ole_1.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow OLE Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control accessibledescription ~r~n"
end if 

//accessiblename 
dw_1.object.ole_1.accessiblename = 'OLE不知道'
ls_rtv = dw_1.Modify("ole_1.accessiblename='OLE中文名？'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control accessiblename ~r~n"
elseif dw_1.describe("ole_1.accessiblename") = dw_1.object.ole_1.accessiblename then 
	mle_1.text += "Succeed ! DataWindow OLE Control accessiblename ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control accessiblename ~r~n"
end if 

//accessiblerole 
dw_1.object.ole_1.accessiblerole = '0'
ls_rtv = dw_1.Modify("ole_1.accessiblerole='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control accessiblerole ~r~n"
elseif dw_1.describe("ole_1.accessiblerole") = dw_1.object.ole_1.accessiblerole then 
	mle_1.text += "Succeed ! DataWindow OLE Control accessiblerole ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control accessiblerole ~r~n"
end if 

//attributes 
if dw_1.Describe("ole_1.Attributes") = dw_1.object.ole_1.attributes then 
	mle_1.text += "Succeed ! DataWindow OLE Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control attributes ~r~n"
end if

//band 
// this property couldn't be modified
ls_rtv = dw_1.Describe("ole_1.Band")
if dw_1.Describe("ole_1.Band") = dw_1.Object.ole_1.Band then 
	mle_1.text += "Succeed ! DataWindow OLE Control Band ~r~n"
else
	mle_1.text += "Succeed ! DataWindow OLE Control Band ~r~n"
end if 

//binaryindex 

//border , couldn't get border by dot donation
i = 0 
for i = 0 to 6
	dw_1.object.ole_1.Border = string(i)
	ls_rtv = dw_1.Modify("ole_1.Border='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow OLE Control Border " + ls_rtv + " ~r~n"
	elseif dw_1.describe("ole_1.Border") = dw_1.object.ole_1.border then 
		mle_1.text += "Succeed ! DataWindow OLE Control Border ~r~n"
	else
		mle_1.text += "Failure ! DataWindow OLE Control Border ~r~n"
	end if 
next

//clientname 
dw_1.object.ole_1.clientname = 'OLE'
ls_rtv = dw_1.Modify("ole_1.clientname='OLE test'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control clientname ~r~n"
elseif dw_1.describe("ole_1.clientname") = dw_1.object.ole_1.clientname then 
	mle_1.text += "Succeed ! DataWindow OLE Control clientname ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control clientname ~r~n"
end if 

//contentsallowed 
dw_1.object.ole_1.contentsallowed = '0'
dw_1.object.ole_1.contentsallowed = '1'
ls_rtv = dw_1.Modify("ole_1.contentsallowed='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control contentsallowed ~r~n"
elseif dw_1.describe("ole_1.contentsallowed") = dw_1.object.ole_1.contentsallowed then 
	mle_1.text += "Succeed ! DataWindow OLE Control contentsallowed ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control contentsallowed ~r~n"
end if 

//displaytype 
dw_1.object.ole_1.displaytype = '1'
ls_rtv = dw_1.Modify("ole_1.displaytype='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control displaytype ~r~n"
elseif dw_1.describe("ole_1.displaytype") = dw_1.object.ole_1.displaytype then 
	mle_1.text += "Succeed ! DataWindow OLE Control displaytype ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control displaytype ~r~n"
end if 

//groupby 
dw_1.object.ole_1.groupby = 'dept_id'
ls_rtv = dw_1.Modify("ole_1.groupby='dept_id'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control groupby ~r~n"
elseif dw_1.describe("ole_1.groupby") = dw_1.object.ole_1.groupby then 
	mle_1.text += "Succeed ! DataWindow OLE Control groupby ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control groupby ~r~n"
end if 

//height 
dw_1.object.ole_1.Height = '80'
ls_rtv = dw_1.Modify("ole_1.Height=150")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control Height ~r~n"
elseif dw_1.describe("ole_1.Height") = dw_1.object.ole_1.Height then 
	mle_1.text += "Succeed ! DataWindow OLE Control Height ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control Height ~r~n"
end if 

//linkupdateoptions 
dw_1.object.ole_1.linkupdateoptions = '0'
ls_rtv = dw_1.Modify("ole_1.linkupdateoptions=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control linkupdateoptions ~r~n"
elseif dw_1.describe("ole_1.linkupdateoptions") = dw_1.object.ole_1.linkupdateoptions then 
	mle_1.text += "Succeed ! DataWindow OLE Control linkupdateoptions ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control linkupdateoptions ~r~n"
end if 

//moveable 
dw_1.object.ole_1.Moveable = '1'
ls_rtv = dw_1.Modify("ole_1.Moveable=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control Moveable  ~r~n"
elseif dw_1.describe("ole_1.Moveable") = dw_1.object.ole_1.Moveable  then 
	mle_1.text += "Succeed ! DataWindow OLE Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control Moveable ~r~n"
end if 

ls_rtv = dw_1.Modify("ole_1.Moveable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control Moveable  ~r~n"
elseif dw_1.describe("ole_1.Moveable") = dw_1.object.ole_1.Moveable  then 
	mle_1.text += "Succeed ! DataWindow OLE Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control Moveable ~r~n"
end if 

//name 
if dw_1.Describe("ole_1.Name") = dw_1.object.ole_1.Name then 
	mle_1.text += "Succeed ! DataWindow OLE Control Name ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control Name ~r~n"
end if

//pointer 
dw_1.object.ole_1.Pointer = 'cross!'
ls_rtv = dw_1.Modify("ole_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control Pointer  ~r~n"
elseif dw_1.describe("ole_1.Pointer") = dw_1.object.ole_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow OLE Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("ole_1.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control Pointer  ~r~n"
elseif dw_1.describe("ole_1.Pointer") = dw_1.object.ole_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow OLE Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control Pointer ~r~n"
end if 

//range
if dw_1.Describe("ole_1.range") = dw_1.object.ole_1.range then 
	mle_1.text += "Succeed ! DataWindow OLE Control range ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control range ~r~n"
end if

//resizeable 
dw_1.object.ole_1.resizeable = '1'
ls_rtv = dw_1.Modify("ole_1.resizeable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control resizeable  ~r~n"
elseif dw_1.describe("ole_1.resizeable") = dw_1.object.ole_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow OLE Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control resizeable ~r~n"
end if 

//sizetodisplay
//dw_1.object.ole_1.sizetodisplay = '1'
ls_rtv = dw_1.Modify("ole_1.sizetodisplay='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control sizetodisplay  ~r~n"
elseif dw_1.describe("ole_1.sizetodisplay") = dw_1.object.ole_1.sizetodisplay  then 
	mle_1.text += "Succeed ! DataWindow OLE Control sizetodisplay  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control sizetodisplay ~r~n"
end if 

//slideleft 
dw_1.object.ole_1.slideleft = 'yes'
ls_rtv = dw_1.Modify("ole_1.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control slideleft  ~r~n"
elseif dw_1.describe("ole_1.slideleft") = dw_1.object.ole_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow OLE Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control slideleft ~r~n"
end if 

//slideup 
dw_1.object.ole_1.slideup = 'allabove'
ls_rtv = dw_1.Modify("ole_1.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control slideup  ~r~n"
elseif dw_1.describe("ole_1.slideup") = dw_1.object.ole_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow OLE Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("ole_1.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control slideup  ~r~n"
elseif dw_1.describe("ole_1.slideup") = dw_1.object.ole_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow OLE Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control slideup ~r~n"
end if 

//tag 
dw_1.object.ole_1.tag = 'test tag'
ls_rtv = dw_1.Modify("ole_1.tag='Header of Employee ID'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control tag  ~r~n"
elseif dw_1.describe("ole_1.tag") = dw_1.object.ole_1.tag  then 
	mle_1.text += "Succeed ! DataWindow OLE Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control tag ~r~n"
end if 

//target 


//type 
if (dw_1.Describe("ole_1.type") = 'ole') and  (dw_1.object.ole_1.type = 'ole') then 
	mle_1.text += "Succeed ! DataWindow OLE Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control type ~r~n"
end if

//visible 
dw_1.object.ole_1.visible = 'No'
ls_rtv = dw_1.Modify("ole_1.visible=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control visible  ~r~n"
elseif dw_1.describe("ole_1.visible") = dw_1.object.ole_1.visible  then 
	mle_1.text += "Succeed ! DataWindow OLE Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("ole_1.visible=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control visible  ~r~n"
elseif dw_1.describe("ole_1.visible") = dw_1.object.ole_1.visible  then 
	mle_1.text += "Succeed ! DataWindow OLE Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("ole_1.visible=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control visible  ~r~n"
elseif dw_1.describe("ole_1.visible") = dw_1.object.ole_1.visible  then 
	mle_1.text += "Succeed ! DataWindow OLE Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control visible ~r~n"
end if 

//width 
dw_1.object.ole_1.width = '500'
ls_rtv = dw_1.Modify("ole_1.width=400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control width  ~r~n"
elseif dw_1.describe("ole_1.width") = dw_1.object.ole_1.width  then 
	mle_1.text += "Succeed ! DataWindow OLE Control width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control width ~r~n"
end if 

//x 
dw_1.object.ole_1.x = '40'
ls_rtv = dw_1.Modify("ole_1.x=30")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control x  ~r~n"
elseif dw_1.describe("ole_1.x") = dw_1.object.ole_1.x  then 
	mle_1.text += "Succeed ! DataWindow OLE Control x  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control x ~r~n"
end if 

//y 
 dw_1.object.ole_1.y = '100'
ls_rtv = dw_1.Modify("ole_1.y=570")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow OLE Control y  ~r~n"
elseif dw_1.describe("ole_1.y") = dw_1.object.ole_1.y  then 
	mle_1.text += "Succeed ! DataWindow OLE Control y  ~r~n"
else
	mle_1.text += "Failure ! DataWindow OLE Control y ~r~n"
end if 

end event

type cb_groupbox from commandbutton within w_main
integer x = 1559
integer y = 1272
integer width = 343
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "groupbox"
end type

event clicked;string ls_rtv 
int i

/*************************************

GroupBox property testing
**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    GroupBox property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"


dw_1.dataobject = 'd_tabular_bitmap'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//accessibledescription 
//accessiblename 
//accessiblerole , 20

//attributes 
//band 
//border 
//color 
//height 
//moveable 
//name 
//pointer 
//resizeable 
//righttoleft 
//slideleft 
//slideup 
//tag 
//text 
//type 
//visible 
//width 
//x 
//y 
//background.color 
//background.mode 
//font.charset 
//font.escapement 
//font.face 
//font.family 
//font.height 
//font.italic 
//font.orientation 
//font.pitch 
//font.strikethrough 
//font.underline 
//font.weight 
//font.width

//accessibledescription 
dw_1.object.gb_1.accessibledescription = 'groupbox'
ls_rtv = dw_1.Modify( "gb_1.accessibledescription='groupbox 组合 描述'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control accessibledescription ~r~n"
elseif dw_1.describe("gb_1.accessibledescription") = dw_1.object.gb_1.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control accessibledescription ~r~n"
end if 

//accessiblename 
dw_1.object.gb_1.accessiblename = 'groupbox 组合'
ls_rtv = dw_1.Modify( "gb_1.accessiblename='GroupBox 组何筐'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control accessiblename ~r~n"
elseif dw_1.describe("gb_1.accessiblename") = dw_1.object.gb_1.accessiblename then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control accessiblename ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control accessiblename ~r~n"
end if 

//accessiblerole 
dw_1.object.gb_1.accessiblerole = '20'
ls_rtv = dw_1.Modify( "gb_1.accessiblerole='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control accessiblerole ~r~n"
elseif dw_1.describe("gb_1.accessiblerole") = dw_1.object.gb_1.accessiblerole then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control accessiblerole ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control accessiblerole ~r~n"
end if 

//attributes 
if dw_1.Describe("gb_1.Attributes") = dw_1.object.gb_1.attributes then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control attributes ~r~n"
end if

//background.color 
dw_1.object.gb_1.Background.Color = '255'
ls_rtv = dw_1.Modify("gb_1.Background.Color='536870912'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Background.Color ~r~n"
elseif dw_1.describe("gb_1.Background.Color") = dw_1.object.gb_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Background.Color ~r~n"
end if 

ls_rtv = dw_1.Modify("gb_1.Background.Color='8388736~trgb(255,0,0)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Background.Color ~r~n"
elseif dw_1.describe("gb_1.Background.Color") = dw_1.object.gb_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Background.Color ~r~n"
end if 

//background.mode 
dw_1.object.gb_1.Background.Mode = '1'
ls_rtv = dw_1.Modify("gb_1.Background.Mode='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Background.Mode ~r~n"
elseif dw_1.describe("gb_1.Background.Mode") = dw_1.object.gb_1.Background.Mode then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Background.Mode ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Background.Mode ~r~n"
end if 


//band 
// this property couldn't be modified
ls_rtv = dw_1.Describe("gb_1.Band")
if dw_1.Describe("gb_1.Band") = dw_1.Object.gb_1.Band then 
	mle_1.text += "Succeed ! DataWindow Text Control Band ~r~n"
else
	mle_1.text += "Succeed ! DataWindow GroupBox Control Band ~r~n"
end if 

//border 
i = 0 
for i = 0 to 6
	dw_1.object.gb_1.Border = string(i)
	ls_rtv = dw_1.Modify("gb_1.Border='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow GroupBox Control Border ~r~n"
	elseif dw_1.describe("gb_1.Border") = dw_1.object.gb_1.Border then 
		mle_1.text += "Succeed ! DataWindow GroupBox Control Border ~r~n"
	else
		mle_1.text += "Failure ! DataWindow GroupBox Control Border ~r~n"
	end if 
	
next

//color 
dw_1.object.gb_1.Color = '255'
ls_rtv = dw_1.Modify( "gb_1.Color='236~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Color ~r~n"
elseif dw_1.describe("gb_1.Color") = dw_1.object.gb_1.Color then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Color ~r~n"
end if 

dw_1.object.gb_1.Color = '300'
ls_rtv = dw_1.Modify( "gb_1.Color='255~trgb(0,255,255)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Color ~r~n"
elseif dw_1.describe("gb_1.Color") = dw_1.object.gb_1.Color then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Color ~r~n"
end if 

//font.charset 
dw_1.object.gb_1.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "gb_1.Font.CharSet	='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.CharSet ~r~n"
elseif dw_1.describe("gb_1.Font.CharSet") = dw_1.object.gb_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gb_1.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.CharSet ~r~n"
elseif dw_1.describe("gb_1.Font.CharSet") = dw_1.object.gb_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gb_1.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.CharSet ~r~n"
elseif dw_1.describe("gb_1.Font.CharSet") = dw_1.object.gb_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gb_1.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.CharSet ~r~n"
elseif dw_1.describe("gb_1.Font.CharSet") = dw_1.object.gb_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "gb_1.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.CharSet ~r~n"
elseif dw_1.describe("gb_1.Font.CharSet") = dw_1.object.gb_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.gb_1.Font.face = 'Arial'
ls_rtv = dw_1.Modify( "gb_1.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.face ~r~n"
elseif dw_1.describe("gb_1.Font.face") = dw_1.object.gb_1.Font.face then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.gb_1.font.orientation = '900'
ls_rtv = dw_1.Modify("gb_1.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.orientation ~r~n"
elseif dw_1.describe("gb_1.font.orientation") = dw_1.object.gb_1.font.orientation then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.gb_1.Font.escapement = '450'
ls_rtv = dw_1.Modify( "gb_1.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.escapement ~r~n"
elseif dw_1.describe("gb_1.Font.escapement") = dw_1.object.gb_1.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.gb_1.font.family = string(i)
	ls_rtv = dw_1.Modify("gb_1.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow GroupBox Control font.family ~r~n"
	elseif dw_1.describe("gb_1.font.family") = dw_1.object.gb_1.font.family then 
		mle_1.text += "Succeed ! DataWindow GroupBox Control font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow GroupBox Control font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.gb_1.font.height = '-200'
ls_rtv = dw_1.Modify("gb_1.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.height ~r~n"
elseif dw_1.describe("gb_1.font.height") = dw_1.object.gb_1.font.height then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("gb_1.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.height ~r~n"
elseif dw_1.describe("gb_1.font.height") = dw_1.object.gb_1.font.height then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.height ~r~n"
end if 

//font.italic 
dw_1.object.gb_1.font.italic = '1'
ls_rtv = dw_1.Modify("gb_1.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.italic ~r~n"
elseif dw_1.describe("gb_1.font.italic") = dw_1.object.gb_1.font.italic then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.italic ~r~n"
end if 

dw_1.object.gb_1.font.italic = 'Yes'
ls_rtv = dw_1.Modify("gb_1.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.italic ~r~n"
elseif dw_1.describe("gb_1.font.italic") = dw_1.object.gb_1.font.italic then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.gb_1.font.pitch = string(i)
	ls_rtv = dw_1.Modify("gb_1.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow GroupBox Control font.pitch ~r~n"
	elseif dw_1.describe("gb_1.font.pitch") = dw_1.object.gb_1.font.pitch then 
		mle_1.text += "Succeed ! DataWindow GroupBox Control font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow GroupBox Control font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.gb_1.font.strikethrough = '1'
ls_rtv = dw_1.Modify("gb_1.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.strikethrough ~r~n"
elseif dw_1.describe("gb_1.font.strikethrough") = dw_1.object.gb_1.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.strikethrough ~r~n"
end if 

dw_1.object.gb_1.font.strikethrough = 'yes'
ls_rtv = dw_1.Modify("gb_1.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.strikethrough ~r~n"
elseif dw_1.describe("gb_1.font.strikethrough") = dw_1.object.gb_1.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.gb_1.font.underline = '1'
ls_rtv = dw_1.Modify("gb_1.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.underline ~r~n"
elseif dw_1.describe("gb_1.font.underline") = dw_1.object.gb_1.font.underline then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.underline ~r~n"
end if 

dw_1.object.gb_1.font.underline = 'Yes'
ls_rtv = dw_1.Modify("gb_1.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.underline ~r~n"
elseif dw_1.describe("gb_1.font.underline") = dw_1.object.gb_1.font.underline then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.underline ~r~n"
end if 

//font.weight 
dw_1.object.gb_1.font.weight = '400'
ls_rtv = dw_1.Modify("gb_1.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.weight ~r~n"
elseif dw_1.describe("gb_1.font.weight") = dw_1.object.gb_1.font.weight then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("gb_1.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.weight ~r~n"
elseif dw_1.describe("gb_1.font.weight") = dw_1.object.gb_1.font.weight then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.weight ~r~n"
end if 

//font.width 
dw_1.object.gb_1.font.width = '40'
ls_rtv = dw_1.Modify("gb_1.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control font.width ~r~n"
elseif dw_1.describe("gb_1.font.width") = dw_1.object.gb_1.font.width then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control font.width ~r~n"
end if 

//height 
dw_1.object.gb_1.Height = '80'
ls_rtv = dw_1.Modify("gb_1.Height=200")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Height ~r~n"
elseif dw_1.describe("gb_1.Height") = dw_1.object.gb_1.Height then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Height ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Height ~r~n"
end if 

//moveable 
dw_1.object.gb_1.Moveable = '1'
ls_rtv = dw_1.Modify("gb_1.Moveable=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Moveable  ~r~n"
elseif dw_1.describe("gb_1.Moveable") = dw_1.object.gb_1.Moveable  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Moveable ~r~n"
end if 

ls_rtv = dw_1.Modify("gb_1.Moveable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Moveable  ~r~n"
elseif dw_1.describe("gb_1.Moveable") = dw_1.object.gb_1.Moveable  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Moveable ~r~n"
end if 

//name 
if dw_1.Describe("gb_1.Name") = dw_1.object.gb_1.Name then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Name ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Name ~r~n"
end if

//pointer 
dw_1.object.gb_1.Pointer = 'cross!'
ls_rtv = dw_1.Modify("gb_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Pointer  ~r~n"
elseif dw_1.describe("gb_1.Pointer") = dw_1.object.gb_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("gb_1.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control Pointer  ~r~n"
elseif dw_1.describe("gb_1.Pointer") = dw_1.object.gb_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control Pointer ~r~n"
end if 

//resizeable 
dw_1.object.gb_1.resizeable = '1'
ls_rtv = dw_1.Modify("gb_1.resizeable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control resizeable  ~r~n"
elseif dw_1.describe("gb_1.resizeable") = dw_1.object.gb_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control resizeable ~r~n"
end if 

//righttoleft , not document

//slideleft 
dw_1.object.gb_1.slideleft = 'yes'
ls_rtv = dw_1.Modify("gb_1.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control slideleft  ~r~n"
elseif dw_1.describe("gb_1.slideleft") = dw_1.object.gb_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control slideleft ~r~n"
end if 

//slideup 
dw_1.object.gb_1.slideup = 'allabove'
ls_rtv = dw_1.Modify("gb_1.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control slideup  ~r~n"
elseif dw_1.describe("gb_1.slideup") = dw_1.object.gb_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("gb_1.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control slideup  ~r~n"
elseif dw_1.describe("gb_1.slideup") = dw_1.object.gb_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control slideup ~r~n"
end if 

//tag 
dw_1.object.gb_1.tag = 'test tag'
ls_rtv = dw_1.Modify("gb_1.tag='Header of Employee ID'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control tag  ~r~n"
elseif dw_1.describe("gb_1.tag") = dw_1.object.gb_1.tag  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control tag ~r~n"
end if 

//text 
dw_1.object.gb_1.text = 'text'
ls_rtv = dw_1.Modify("gb_1.text='Employee Name'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control text  ~r~n"
elseif dw_1.describe("gb_1.text") = dw_1.object.gb_1.text  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control text  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control text ~r~n"
end if 


//type 
if (dw_1.Describe("gb_1.type") = 'groupbox') and  (dw_1.object.gb_1.type = 'groupbox') then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control type ~r~n"
end if

//visible 
dw_1.object.gb_1.visible = 'No'
ls_rtv = dw_1.Modify("gb_1.visible=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control visible  ~r~n"
elseif dw_1.describe("gb_1.visible") = dw_1.object.gb_1.visible  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("gb_1.visible=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control visible  ~r~n"
elseif dw_1.describe("gb_1.visible") = dw_1.object.gb_1.visible  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("gb_1.visible=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control visible  ~r~n"
elseif dw_1.describe("gb_1.visible") = dw_1.object.gb_1.visible  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control visible ~r~n"
end if 

//width 
dw_1.object.gb_1.width = '500'
ls_rtv = dw_1.Modify("gb_1.width=400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control width  ~r~n"
elseif dw_1.describe("gb_1.width") = dw_1.object.gb_1.width  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control width ~r~n"
end if 

//x 
dw_1.object.gb_1.x = '450'
ls_rtv = dw_1.Modify("gb_1.x=800")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control x  ~r~n"
elseif dw_1.describe("gb_1.x") = dw_1.object.gb_1.x  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control x  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control x ~r~n"
end if 

//y 
 dw_1.object.gb_1.y = '100'
ls_rtv = dw_1.Modify("gb_1.y=25")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow GroupBox Control y  ~r~n"
elseif dw_1.describe("gb_1.y") = dw_1.object.gb_1.y  then 
	mle_1.text += "Succeed ! DataWindow GroupBox Control y  ~r~n"
else
	mle_1.text += "Failure ! DataWindow GroupBox Control y ~r~n"
end if 

end event

type cb_blob from commandbutton within w_main
integer x = 1198
integer y = 1272
integer width = 343
integer height = 112
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "db blob"
end type

event clicked;string ls_rtv 
int i

/*************************************

TableBlob property testing
**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    TableBlob property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"


dw_1.dataobject = 'd_tabular_blob'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//accessibledescription 
dw_1.object.blob_1.accessibledescription = 'TableBlob大文本 描述'
ls_rtv = dw_1.Modify("blob_1.accessibledescription='TableBlob/大文本 描述'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control accessibledescription ~r~n"
elseif dw_1.describe("blob_1.accessibledescription") = dw_1.object.blob_1.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control accessibledescription ~r~n"
end if 

//accessiblename 
dw_1.object.blob_1.accessiblename = 'TableBlob大文本'
ls_rtv = dw_1.Modify("blob_1.accessiblename='TableBlob 大文本'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control accessiblename ~r~n"
elseif dw_1.describe("blob_1.accessiblename") = dw_1.object.blob_1.accessiblename then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control accessiblename ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control accessiblename ~r~n"
end if 

//accessiblerole 
dw_1.object.blob_1.accessiblerole = '0'
ls_rtv = dw_1.Modify("blob_1.accessiblerole='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control accessiblerole ~r~n"
elseif dw_1.describe("blob_1.accessiblerole") = dw_1.object.blob_1.accessiblerole then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control accessiblerole ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control accessiblerole ~r~n"
end if 

//attributes 
if dw_1.Describe("blob_1.Attributes") = dw_1.object.blob_1.attributes then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control attributes ~r~n"
end if

//band 
// this property couldn't be modified
ls_rtv = dw_1.Describe("blob_1.Band")
if dw_1.Describe("blob_1.Band") = dw_1.Object.blob_1.Band then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control Band ~r~n"
else
	mle_1.text += "Succeed ! DataWindow TableBlob Control Band ~r~n"
end if 

//border 
i = 0 
for i = 0 to 6
	dw_1.object.blob_1.Border = string(i)
	ls_rtv = dw_1.Modify("blob_1.Border='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow TableBlob Control Border ~r~n"
	elseif dw_1.describe("blob_1.Border") = dw_1.object.blob_1.Border then 
		mle_1.text += "Succeed ! DataWindow TableBlob Control Border ~r~n"
	else
		mle_1.text += "Failure ! DataWindow TableBlob Control Border ~r~n"
	end if 
	
next

//clientname 
dw_1.object.blob_1.clientname = 'DB OLE Object'
ls_rtv = dw_1.Modify("blob_1.clientname='TableBlob'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control clientname ~r~n"
elseif dw_1.describe("blob_1.clientname") = dw_1.object.blob_1.clientname then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control clientname ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control clientname ~r~n"
end if 

//height 
dw_1.object.blob_1.Height = '80'
ls_rtv = dw_1.Modify("blob_1.Height=170")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control Height ~r~n"
elseif dw_1.describe("blob_1.Height") = dw_1.object.blob_1.Height then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control Height ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control Height ~r~n"
end if 

//id 
if dw_1.Describe("blob_1.id") = dw_1.object.blob_1.id then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control id ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control id ~r~n"
end if

//keyclause 
dw_1.object.blob_1.keyclause = 'id=:id'
ls_rtv = dw_1.Modify("blob_1.keyclause='id = :id'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control keyclause ~r~n"
elseif dw_1.describe("blob_1.keyclause") = dw_1.object.blob_1.keyclause then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control keyclause ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control keyclause ~r~n"
end if 

//moveable 
dw_1.object.blob_1.Moveable = '1'
ls_rtv = dw_1.Modify("blob_1.Moveable=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control Moveable  ~r~n"
elseif dw_1.describe("blob_1.Moveable") = dw_1.object.blob_1.Moveable  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control Moveable ~r~n"
end if 

ls_rtv = dw_1.Modify("blob_1.Moveable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control Moveable  ~r~n"
elseif dw_1.describe("blob_1.Moveable") = dw_1.object.blob_1.Moveable  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control Moveable ~r~n"
end if 

//name 
if dw_1.Describe("blob_1.Name") = dw_1.object.blob_1.Name then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control Name ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control Name ~r~n"
end if

//oleclass ,Word.Document
dw_1.object.blob_1.oleclass = 'Word.Document'
ls_rtv = dw_1.Modify("blob_1.oleclass='Word.Document'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control oleclass ~r~n"
elseif dw_1.describe("blob_1.oleclass") = dw_1.object.blob_1.oleclass then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control oleclass ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control oleclass ~r~n"
end if 


//pointer 
dw_1.object.blob_1.Pointer = 'cross!'
ls_rtv = dw_1.Modify("blob_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control Pointer  ~r~n"
elseif dw_1.describe("blob_1.Pointer") = dw_1.object.blob_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("blob_1.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control Pointer  ~r~n"
elseif dw_1.describe("blob_1.Pointer") = dw_1.object.blob_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control Pointer ~r~n"
end if 

//resizeable 
dw_1.object.blob_1.resizeable = '1'
ls_rtv = dw_1.Modify("blob_1.resizeable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control resizeable  ~r~n"
elseif dw_1.describe("blob_1.resizeable") = dw_1.object.blob_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control resizeable ~r~n"
end if 

//slideleft 
dw_1.object.blob_1.slideleft = 'yes'
ls_rtv = dw_1.Modify("blob_1.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control slideleft  ~r~n"
elseif dw_1.describe("blob_1.slideleft") = dw_1.object.blob_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control slideleft ~r~n"
end if 

//slideup 
dw_1.object.blob_1.slideup = 'allabove'
ls_rtv = dw_1.Modify("blob_1.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control slideup  ~r~n"
elseif dw_1.describe("blob_1.slideup") = dw_1.object.blob_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("blob_1.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control slideup  ~r~n"
elseif dw_1.describe("blob_1.slideup") = dw_1.object.blob_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control slideup ~r~n"
end if 

//table 
dw_1.object.blob_1.table = 'ole'
ls_rtv = dw_1.Modify("blob_1.table='ole'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control table  ~r~n"
elseif dw_1.describe("blob_1.table") = dw_1.object.blob_1.table  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control table  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control table ~r~n"
end if 

//tag 
dw_1.object.blob_1.tag = 'test tag'
ls_rtv = dw_1.Modify("blob_1.tag='Header of Employee ID'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control tag  ~r~n"
elseif dw_1.describe("blob_1.tag") = dw_1.object.blob_1.tag  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control tag ~r~n"
end if 

//template , Excel.xls
dw_1.object.blob_1.template = gs_curdir + '\other\test.xls'
ls_rtv = dw_1.Modify("blob_1.template=''")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control template  ~r~n"
elseif dw_1.describe("blob_1.template") = dw_1.object.blob_1.template  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control template  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control template ~r~n"
end if 

//type 
if (dw_1.Describe("blob_1.type") = 'tableblob') and  (dw_1.object.blob_1.type = 'tableblob') then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control type ~r~n"
end if

//visible 
dw_1.object.blob_1.visible = 'No'
ls_rtv = dw_1.Modify("blob_1.visible=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control visible  ~r~n"
elseif dw_1.describe("blob_1.visible") = dw_1.object.blob_1.visible  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("blob_1.visible=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control visible  ~r~n"
elseif dw_1.describe("blob_1.visible") = dw_1.object.blob_1.visible  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("blob_1.visible=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control visible  ~r~n"
elseif dw_1.describe("blob_1.visible") = dw_1.object.blob_1.visible  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control visible ~r~n"
end if 

//width 
dw_1.object.blob_1.width = '500'
ls_rtv = dw_1.Modify("blob_1.width=200")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control width  ~r~n"
elseif dw_1.describe("blob_1.width") = dw_1.object.blob_1.width  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control width ~r~n"
end if 

//x 
dw_1.object.blob_1.x = '450'
ls_rtv = dw_1.Modify("blob_1.x=1200")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control x  ~r~n"
elseif dw_1.describe("blob_1.x") = dw_1.object.blob_1.x  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control x  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control x ~r~n"
end if 

//y 
 dw_1.object.blob_1.y = '100'
ls_rtv = dw_1.Modify("blob_1.y=25")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow TableBlob Control y  ~r~n"
elseif dw_1.describe("blob_1.y") = dw_1.object.blob_1.y  then 
	mle_1.text += "Succeed ! DataWindow TableBlob Control y  ~r~n"
else
	mle_1.text += "Failure ! DataWindow TableBlob Control y ~r~n"
end if 


end event

type cb_bitmap from commandbutton within w_main
integer x = 2642
integer y = 1136
integer width = 343
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "bitmap"
end type

event clicked;string ls_rtv 
int i

/*************************************

Bitmap property testing
**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Picture property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"


dw_1.dataobject = 'd_tabular_bitmap'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//accessibledescription 
dw_1.object.p_1.accessibledescription = 'dw bitmap | 图形'
ls_rtv = dw_1.Modify( "p_1.accessibledescription='dw bitmap | 图形'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control accessibledescription ~r~n"
elseif dw_1.describe("p_1.accessibledescription") = dw_1.object.p_1.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow Picture Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control accessibledescription ~r~n"
end if 

//accessiblename 
dw_1.object.p_1.accessiblename = 'DWbitmap'
ls_rtv = dw_1.Modify( "p_1.accessiblename='DWbitmap/图形'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control accessiblename ~r~n"
elseif dw_1.describe("p_1.accessiblename") = dw_1.object.p_1.accessiblename then 
	mle_1.text += "Succeed ! DataWindow Picture Control accessiblename ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control accessiblename ~r~n"
end if 

//accessiblerole 
dw_1.object.p_1.accessiblerole = '40'
ls_rtv = dw_1.Modify( "p_1.accessiblerole=40")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control accessiblerole ~r~n"
elseif dw_1.describe("p_1.accessiblerole") = dw_1.object.p_1.accessiblerole then 
	mle_1.text += "Succeed ! DataWindow Picture Control accessiblerole ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control accessiblerole ~r~n"
end if 

//attributes 
if dw_1.Describe("p_1.Attributes") = dw_1.object.p_1.attributes then 
	mle_1.text += "Succeed ! DataWindow Picture Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control attributes ~r~n"
end if

//band 
// this property couldn't be modified
ls_rtv = dw_1.Describe("p_1.Band")
if dw_1.Describe("p_1.Band") = dw_1.Object.p_1.Band then 
	mle_1.text += "Succeed ! DataWindow Picture Control Band ~r~n"
else
	mle_1.text += "Succeed ! DataWindow Picture Control Band ~r~n"
end if 

//border 
i = 0 
for i = 0 to 6

	ls_rtv = dw_1.Modify("p_1.Border='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Picture Control Border ~r~n"
	elseif dw_1.describe("p_1.Border") = dw_1.object.p_1.Border then 
		mle_1.text += "Succeed ! DataWindow Picture Control Border ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Picture Control Border ~r~n"
	end if 
	
next

//filename 
dw_1.object.p_1.filename = gs_curdir + "\picture\flower.jpg"
ls_rtv = dw_1.Modify("p_1.filename='" + gs_curdir + "\picture\uarrow.gif'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control filename ~r~n"
elseif dw_1.describe("p_1.filename") = dw_1.object.p_1.filename then 
	mle_1.text += "Succeed ! DataWindow Picture Control filename ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control filename ~r~n"
end if 

//height 
ls_rtv = dw_1.Modify("p_1.Height=70")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Height ~r~n"
elseif dw_1.describe("p_1.Height") = dw_1.object.p_1.Height then 
	mle_1.text += "Succeed ! DataWindow Picture Control Height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control Height ~r~n"
end if 

//html.appendedhtml 
ls_rtv = dw_1.Modify("p_1.html.appendedhtml ='appendtext'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control html.appendedhtml  ~r~n"
elseif dw_1.describe("p_1.html.appendedhtml ") = dw_1.object.p_1.html.appendedhtml  then 
	mle_1.text += "Succeed ! DataWindow Picture Control html.appendedhtml  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control html.appendedhtml  ~r~n"
end if 

//html.link 
ls_rtv = dw_1.Modify("p_1.html.Link ='empform.html'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control html.Link  ~r~n"
elseif dw_1.describe("p_1.html.Link ") = dw_1.object.p_1.html.Link  then 
	mle_1.text += "Succeed ! DataWindow Picture Control html.Link  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control html.Link  ~r~n"
end if 


//html.linkargs 
dw_1.object.p_1.html.LinkArgs = "EMP_ID = 'string(dept_id)'"
ls_rtv = dw_1.Modify("p_1.html.LinkArgs =~"EMP_ID = 'string(dept_id)'~"")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control html.LinkArgs  ~r~n"
elseif dw_1.describe("p_1.html.LinkArgs ") = dw_1.object.p_1.html.LinkArgs  then 
	mle_1.text += "Succeed ! DataWindow Picture Control html.LinkArgs  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control html.LinkArgs  ~r~n"
end if 

//html.linktarget 
ls_rtv = dw_1.Modify("p_1.html.LinkTarget ='detail_win'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control html.LinkTarget  ~r~n"
elseif dw_1.describe("p_1.html.LinkTarget") = dw_1.object.p_1.html.LinkTarget  then 
	mle_1.text += "Succeed ! DataWindow Picture Control html.LinkTarget  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control html.LinkTarget  ~r~n"
end if 

//invert 
dw_1.object.p_1.invert = '0'
ls_rtv = dw_1.Modify("p_1.invert=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control invert  ~r~n"
elseif dw_1.describe("p_1.invert") = dw_1.object.p_1.invert  then 
	mle_1.text += "Succeed ! DataWindow Picture Control invert  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control invert ~r~n"
end if 

//moveable 
dw_1.object.p_1.Moveable = '1'
ls_rtv = dw_1.Modify("p_1.Moveable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control Moveable  ~r~n"
elseif dw_1.describe("p_1.Moveable") = dw_1.object.p_1.Moveable  then 
	mle_1.text += "Succeed ! DataWindow Picture Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control Moveable ~r~n"
end if 

//name 
if dw_1.Describe("p_1.Name") = dw_1.object.p_1.Name then 
	mle_1.text += "Succeed ! DataWindow Picture Control Name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control Name ~r~n"
end if

//page , not document

//pointer 
ls_rtv = dw_1.Modify("p_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control Pointer  ~r~n"
elseif dw_1.describe("p_1.Pointer") = dw_1.object.p_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Picture Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("p_1.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control Pointer  ~r~n"
elseif dw_1.describe("p_1.Pointer") = dw_1.object.p_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Picture Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control Pointer ~r~n"
end if 


//resizeable 
ls_rtv = dw_1.Modify("p_1.resizeable=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control resizeable  ~r~n"
elseif dw_1.describe("p_1.resizeable") = dw_1.object.p_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Picture Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control resizeable ~r~n"
end if 

ls_rtv = dw_1.Modify("p_1.resizeable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control resizeable  ~r~n"
elseif dw_1.describe("p_1.resizeable") = dw_1.object.p_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Picture Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control resizeable ~r~n"
end if 

//rotation , not document


//slideleft 
ls_rtv = dw_1.Modify("p_1.slideleft=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control slideleft  ~r~n"
elseif dw_1.describe("p_1.slideleft") = dw_1.object.p_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Picture Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control slideleft ~r~n"
end if 

ls_rtv = dw_1.Modify("p_1.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control slideleft  ~r~n"
elseif dw_1.describe("p_1.slideleft") = dw_1.object.p_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Picture Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control slideleft ~r~n"
end if 

//slideup 
ls_rtv = dw_1.Modify("p_1.slideup=AllAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control slideup  ~r~n"
elseif dw_1.describe("p_1.slideup") = dw_1.object.p_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Picture Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("p_1.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control slideup  ~r~n"
elseif dw_1.describe("p_1.slideup") = dw_1.object.p_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Picture Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("p_1.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control slideup  ~r~n"
elseif dw_1.describe("p_1.slideup") = dw_1.object.p_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Picture Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control slideup ~r~n"
end if 

//tag 
ls_rtv = dw_1.Modify("p_1.tag='Header of Employee ID'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control tag  ~r~n"
elseif dw_1.describe("p_1.tag") = dw_1.object.p_1.tag  then 
	mle_1.text += "Succeed ! DataWindow Picture Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control tag ~r~n"
end if 

//transparentcolor , not document

//type 
if (dw_1.Describe("p_1.type") = 'bitmap') and  (dw_1.object.p_1.type = 'bitmap') then 
	mle_1.text += "Succeed ! DataWindow Picture Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control type ~r~n"
end if

//visible 
ls_rtv = dw_1.Modify("p_1.visible=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control visible  ~r~n"
elseif dw_1.describe("p_1.visible") = dw_1.object.p_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Picture Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("p_1.visible=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control visible  ~r~n"
elseif dw_1.describe("p_1.visible") = dw_1.object.p_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Picture Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("p_1.visible=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control visible  ~r~n"
elseif dw_1.describe("p_1.visible") = dw_1.object.p_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Picture Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("p_1.visible=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control visible  ~r~n"
elseif dw_1.describe("p_1.visible") = dw_1.object.p_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Picture Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control visible ~r~n"
end if 

//width 
ls_rtv = dw_1.Modify("p_1.width=400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control width  ~r~n"
elseif dw_1.describe("p_1.width") = dw_1.object.p_1.width  then 
	mle_1.text += "Succeed ! DataWindow Picture Control width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control width ~r~n"
end if 

//x 
ls_rtv = dw_1.Modify("p_1.x=400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control x  ~r~n"
elseif dw_1.describe("p_1.x") = dw_1.object.p_1.x  then 
	mle_1.text += "Succeed ! DataWindow Picture Control x  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control x ~r~n"
end if 

//y 
ls_rtv = dw_1.Modify("p_1.y=25")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Picture Control y  ~r~n"
elseif dw_1.describe("p_1.y") = dw_1.object.p_1.y  then 
	mle_1.text += "Succeed ! DataWindow Picture Control y  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Picture Control y ~r~n"
end if 


end event

type cb_report from commandbutton within w_main
integer x = 2281
integer y = 1136
integer width = 343
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "report"
end type

event clicked;//attributes 
//band 
//border 
//criteria 
//dataobject 
//height 
//height.autosize 
//moveable 
//name 
//nest_arguments 
//newpage 
//pointer 
//resizeable 
//slideleft 
//slideup 
//tag 
//trail_footer 
//type 
//visible 
//width 
//x 
//y 
//

string ls_rtv 
int i

/*************************************

Report property testing
**************************************/
mle_1.text = "~r~n"
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Report property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"


dw_1.dataobject = 'd_composite'
dw_1.SetTransObject(sqlca)
dw_1.Retrieve(200)

//accessibledescription 
dw_1.object.report_1.accessibledescription = 'DW report报告 description'
ls_rtv = dw_1.Modify( "report_1.accessibledescription='DW report 报告accessibledescription'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control accessibledescription ~r~n"
elseif dw_1.describe("report_1.accessibledescription") = dw_1.object.report_1.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow Report Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control accessibledescription ~r~n"
end if 

//accessiblename 
dw_1.object.report_1.accessibledescription = 'Report 报告'
ls_rtv = dw_1.Modify( "report_1.accessibledescription='report报告'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control accessibledescription ~r~n"
elseif dw_1.describe("report_1.accessibledescription") = dw_1.object.report_1.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow Report Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control accessibledescription ~r~n"
end if 

//accessiblerole 
dw_1.object.report_1.accessibledescription = '0'
ls_rtv = dw_1.Modify( "report_1.accessibledescription='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control accessibledescription ~r~n"
elseif dw_1.describe("report_1.accessibledescription") = dw_1.object.report_1.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow Report Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control accessibledescription ~r~n"
end if 

//attributes 
if dw_1.Describe("report_1.Attributes") = dw_1.object.report_1.attributes then 
	mle_1.text += "Succeed ! DataWindow Report Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control attributes ~r~n"
end if

//band 
// this property couldn't be modified
ls_rtv = dw_1.Describe("report_1.Band")
if dw_1.Describe("report_1.Band") = dw_1.Object.report_1.Band then 
	mle_1.text += "Succeed ! DataWindow Report Control Band ~r~n"
else
	mle_1.text += "Succeed ! DataWindow Report Control Band ~r~n"
end if 

//border 
i = 0 
for i = 0 to 6
	dw_1.object.report_1.Border = string(i)
	ls_rtv = dw_1.Modify("report_1.Border='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Report Control Border ~r~n"
	elseif dw_1.describe("report_1.Border") = dw_1.object.report_1.Border then 
		mle_1.text += "Succeed ! DataWindow Report Control Border ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Report Control Border ~r~n"
	end if 
	
next

//criteria ,emp_id=:emp_id
dw_1.object.report_1.criteria = '			100	>5000'
ls_rtv = dw_1.Modify("report_1.criteria='			100	>15000'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control criteria ~r~n"
elseif dw_1.describe("report_1.criteria") = dw_1.object.report_1.criteria then 
	mle_1.text += "Succeed ! DataWindow Report Control criteria ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control criteria ~r~n"
end if 

//height 
dw_1.object.report_1.Height = '800'
ls_rtv = dw_1.Modify("report_1.Height=700")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control Height ~r~n"
elseif dw_1.describe("report_1.Height") = dw_1.object.report_1.Height then 
	mle_1.text += "Succeed ! DataWindow Report Control Height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control Height ~r~n"
end if 

//height.autosize 
dw_1.object.report_1.height.autosize = 'yes'
ls_rtv = dw_1.Modify("report_1.height.autosize='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control height.autosize ~r~n"
elseif dw_1.describe("report_1.height.autosize") = dw_1.object.report_1.height.autosize then 
	mle_1.text += "Succeed ! DataWindow Report Control height.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control height.autosize ~r~n"
end if 

//moveable 
if dw_1.Describe("report_1.moveable") = dw_1.object.report_1.moveable then 
	mle_1.text += "Succeed ! DataWindow Report Control moveable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control moveable ~r~n"
end if
//dw_1.object.report_1.Moveable = '1'
//ls_rtv = dw_1.Modify("report_1.Moveable=0")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow Report Control Moveable  ~r~n"
//elseif dw_1.describe("report_1.Moveable") = dw_1.object.report_1.Moveable  then 
//	mle_1.text += "Succeed ! DataWindow Report Control Moveable  ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Report Control Moveable ~r~n"
//end if 

//name 
if dw_1.Describe("report_1.Name") = dw_1.object.report_1.Name then 
	mle_1.text += "Succeed ! DataWindow Report Control Name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control Name ~r~n"
end if

//nest_arguments 
if dw_1.Describe("report_1.nest_arguments") = dw_1.object.report_1.nest_arguments then 
	mle_1.text += "Succeed ! DataWindow Report Control nest_arguments ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control nest_arguments ~r~n"
end if

//dw_1.object.report_1.nest_arguments = "((~"emp_id~"))"
//ls_rtv = dw_1.Modify("report_1.nest_arguments=((~"emp_id~"))")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow Report Control nest_arguments  ~r~n"
//elseif dw_1.describe("report_1.nest_arguments") = dw_1.object.report_1.nest_arguments  then 
//	mle_1.text += "Succeed ! DataWindow Report Control nest_arguments  ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Report Control nest_arguments ~r~n"
//end if 


//newpage 
dw_1.object.report_1.newpage = 'Yes'
ls_rtv = dw_1.Modify("report_1.newpage='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control newpage  ~r~n"
elseif dw_1.describe("report_1.newpage") = dw_1.object.report_1.newpage  then 
	mle_1.text += "Succeed ! DataWindow Report Control newpage  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control newpage ~r~n"
end if 

//pointer 
dw_1.object.report_1.Pointer = 'cross!'
ls_rtv = dw_1.Modify("report_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control Pointer  ~r~n"
elseif dw_1.describe("report_1.Pointer") = dw_1.object.report_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Report Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("report_1.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control Pointer  ~r~n"
elseif dw_1.describe("report_1.Pointer") = dw_1.object.report_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Report Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control Pointer ~r~n"
end if 

//resizeable 
if dw_1.Describe("report_1.resizeable") = dw_1.object.report_1.resizeable then 
	mle_1.text += "Succeed ! DataWindow Report Control resizeable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control resizeable ~r~n"
end if

//dw_1.object.report_1.resizeable = '1'
//ls_rtv = dw_1.Modify("report_1.resizeable=0")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow Report Control resizeable  ~r~n"
//elseif dw_1.describe("report_1.resizeable") = dw_1.object.report_1.resizeable  then 
//	mle_1.text += "Succeed ! DataWindow Report Control resizeable  ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Report Control resizeable ~r~n"
//end if 

//slideleft 
dw_1.object.report_1.slideleft = 'yes'
ls_rtv = dw_1.Modify("report_1.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control slideleft  ~r~n"
elseif dw_1.describe("report_1.slideleft") = dw_1.object.report_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Report Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control slideleft ~r~n"
end if 

//slideup 
dw_1.object.report_1.slideup = 'allabove'
ls_rtv = dw_1.Modify("report_1.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control slideup  ~r~n"
elseif dw_1.describe("report_1.slideup") = dw_1.object.report_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Report Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("report_1.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control slideup  ~r~n"
elseif dw_1.describe("report_1.slideup") = dw_1.object.report_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Report Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control slideup ~r~n"
end if 

//tag 
dw_1.object.report_1.tag = 'test tag'
ls_rtv = dw_1.Modify("report_1.tag='Header of Employee ID'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control tag  ~r~n"
elseif dw_1.describe("report_1.tag") = dw_1.object.report_1.tag  then 
	mle_1.text += "Succeed ! DataWindow Report Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control tag ~r~n"
end if 

//trail_footer 
dw_1.object.report_1.trail_footer = 'Yes'
ls_rtv = dw_1.Modify("report_1.trail_footer='No'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control trail_footer  ~r~n"
elseif dw_1.describe("report_1.trail_footer") = dw_1.object.report_1.trail_footer  then 
	mle_1.text += "Succeed ! DataWindow Report Control trail_footer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control trail_footer ~r~n"
end if 

//type 
if (dw_1.Describe("report_1.type") = 'report') and  (dw_1.object.report_1.type = 'report') then 
	mle_1.text += "Succeed ! DataWindow Report Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control type ~r~n"
end if

//visible 
dw_1.object.report_1.visible = 'No'
ls_rtv = dw_1.Modify("report_1.visible=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control visible  ~r~n"
elseif dw_1.describe("report_1.visible") = dw_1.object.report_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Report Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control visible ~r~n"
end if 

dw_1.object.report_1.visible = '0'
ls_rtv = dw_1.Modify("report_1.visible=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control visible  ~r~n"
elseif dw_1.describe("report_1.visible") = dw_1.object.report_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Report Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control visible ~r~n"
end if 

//width 
dw_1.object.report_1.width = '500'
ls_rtv = dw_1.Modify("report_1.width=800")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control width  ~r~n"
elseif dw_1.describe("report_1.width") = dw_1.object.report_1.width  then 
	mle_1.text += "Succeed ! DataWindow Report Control width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control width ~r~n"
end if 

//x 
dw_1.object.report_1.x = '50'
ls_rtv = dw_1.Modify("report_1.x=40")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control x  ~r~n"
elseif dw_1.describe("report_1.x") = dw_1.object.report_1.x  then 
	mle_1.text += "Succeed ! DataWindow Report Control x  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control x ~r~n"
end if 

//y 
 dw_1.object.report_1.y = '20'
ls_rtv = dw_1.Modify("report_1.y=25")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control y  ~r~n"
elseif dw_1.describe("report_1.y") = dw_1.object.report_1.y  then 
	mle_1.text += "Succeed ! DataWindow Report Control y  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control y ~r~n"
end if 

//dataobject 
dw_1.object.report_1.dataobject = 'd_freeform'
ls_rtv = dw_1.Modify("report_1.dataobject='d_report1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Report Control dataobject ~r~n"
elseif dw_1.describe("report_1.dataobject") = dw_1.object.report_1.dataobject then 
	mle_1.text += "Succeed ! DataWindow Report Control dataobject ~r~n"
else
	mle_1.text += "Failure ! DataWindow Report Control dataobject ~r~n"
end if 

datawindowchild dwc
dw_1.getchild("report_1" , dwc)
dwc.settransobject(sqlca)
dwc.Retrieve(200)

end event

type cb_graph from commandbutton within w_main
integer x = 1920
integer y = 1136
integer width = 343
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Graph"
end type

event clicked;integer ln_rtv , i
string ls_rtv , ls_tmp

/*************************************

Datawindow Graph property testing
**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Datawindow Graph property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"


//accessibledescription 
//accessiblename 
//accessiblerole 
//attributes 
//backcolor 
//band 
//border 
//color 
//depth 
//elevation 
//graphtype 
//height 
//hidesnaked 
//legend 
//moveable 
//name 
//overlappercent 
//perspective 
//plotnulldata 
//pointer 
//range 
//resizeable 
//rotation 
//shadecolor 
//sizetodisplay 
//slideleft 
//slideup 
//spacing 
//tag 
//title 
//type 
//visible 
//width 
//x 
//y 

parent.wf_graph_gen()

//category 
//category.autoscale 
//category.displayeverynlabels 
//category.droplines 
//category.frame 
//category.label 
//category.majordivisions 
//category.majorgridline 
//category.majortic 
//category.maximumvalue 
//category.maxvaldatetime 
//category.minimumvalue 
//category.minordivisions 
//category.minorgridline 
//category.minortic 
//category.minvaldatetime 
//category.originline 
//category.primaryline 
//category.roundto 
//category.roundtounit 
//category.scaletype 
//category.scalevalue 
//category.secondaryline 
//category.shadebackedge 
//category.sort 

parent.wf_graph_category()

//series 
//series.autoscale 
//series.displayeverynlabels 
//series.droplines 
//series.frame 
//series.label 
//series.majordivisions 
//series.majorgridline 
//series.majortic 
//series.maximumvalue 
//series.maxvaldatetime 
//series.minimumvalue 
//series.minordivisions 
//series.minorgridline 
//series.minortic 
//series.minvaldatetime 
//series.originline 
//series.primaryline 
//series.roundto 
//series.roundtounit 
//series.scaletype 
//series.scalevalue 
//series.secondaryline 
//series.shadebackedge 
//series.sort 

parent.wf_graph_series()

//values 
//values.autoscale 
//values.displayeverynlabels 
//values.droplines 
//values.frame 
//values.label 
//values.majordivisions 
//values.majorgridline 
//values.majortic 
//values.maximumvalue 
//values.maxvaldatetime 
//values.minimumvalue 
//values.minordivisions 
//values.minorgridline 
//values.minortic 
//values.minvaldatetime 
//values.originline 
//values.primaryline 
//values.roundto 
//values.roundtounit 
//values.scaletype 
//values.scalevalue 
//values.secondaryline 
//values.shadebackedge 

parent.wf_graph_values()

//category.dispattr.alignment 
//category.dispattr.autosize 
//category.dispattr.backcolor 
//category.dispattr.displayexpression 
//category.dispattr.font.charset 
//category.dispattr.font.escapement 
//category.dispattr.font.face 
//category.dispattr.font.family 
//category.dispattr.font.height 
//category.dispattr.font.italic 
//category.dispattr.font.orientation 
//category.dispattr.font.pitch 
//category.dispattr.font.strikethrough 
//category.dispattr.font.underline 
//category.dispattr.font.weight 
//category.dispattr.font.width 
//category.dispattr.format 
//category.dispattr.textcolor 
//category.labeldispattr.alignment 
//category.labeldispattr.autosize 
//category.labeldispattr.backcolor 
//category.labeldispattr.displayexpression 
//category.labeldispattr.font.charset 
//category.labeldispattr.font.escapement 
//category.labeldispattr.font.face 
//category.labeldispattr.font.family 
//category.labeldispattr.font.height 
//category.labeldispattr.font.italic 
//category.labeldispattr.font.orientation 
//category.labeldispattr.font.pitch 
//category.labeldispattr.font.strikethrough 
//category.labeldispattr.font.underline 
//category.labeldispattr.font.weight 
//category.labeldispattr.font.width 
//category.labeldispattr.format 
//category.labeldispattr.textcolor 

parent.wf_graph_category_dispattr()

//values.dispattr.alignment 
//values.dispattr.autosize 
//values.dispattr.backcolor 
//values.dispattr.displayexpression 
//values.dispattr.font.charset 
//values.dispattr.font.escapement 
//values.dispattr.font.face 
//values.dispattr.font.family 
//values.dispattr.font.height 
//values.dispattr.font.italic 
//values.dispattr.font.orientation 
//values.dispattr.font.pitch 
//values.dispattr.font.strikethrough 
//values.dispattr.font.underline 
//values.dispattr.font.weight 
//values.dispattr.font.width 
//values.dispattr.format 
//values.dispattr.textcolor 
//values.labeldispattr.alignment 
//values.labeldispattr.autosize 
//values.labeldispattr.backcolor 
//values.labeldispattr.displayexpression 
//values.labeldispattr.font.charset 
//values.labeldispattr.font.escapement 
//values.labeldispattr.font.face 
//values.labeldispattr.font.family 
//values.labeldispattr.font.height 
//values.labeldispattr.font.italic 
//values.labeldispattr.font.orientation 
//values.labeldispattr.font.pitch 
//values.labeldispattr.font.strikethrough 
//values.labeldispattr.font.underline 
//values.labeldispattr.font.weight 
//values.labeldispattr.font.width 
//values.labeldispattr.format 
//values.labeldispattr.textcolor 

parent.wf_graph_values_dispattr()

//series.dispattr.alignment 
//series.dispattr.autosize 
//series.dispattr.backcolor 
//series.dispattr.displayexpression 
//series.dispattr.font.charset 
//series.dispattr.font.escapement 
//series.dispattr.font.face 
//series.dispattr.font.family 
//series.dispattr.font.height 
//series.dispattr.font.italic 
//series.dispattr.font.orientation 
//series.dispattr.font.pitch 
//series.dispattr.font.strikethrough 
//series.dispattr.font.underline 
//series.dispattr.font.weight 
//series.dispattr.font.width 
//series.dispattr.format 
//series.dispattr.textcolor 
//series.labeldispattr.alignment 
//series.labeldispattr.autosize 
//series.labeldispattr.backcolor 
//series.labeldispattr.displayexpression 
//series.labeldispattr.font.charset 
//series.labeldispattr.font.escapement 
//series.labeldispattr.font.face 
//series.labeldispattr.font.family 
//series.labeldispattr.font.height 
//series.labeldispattr.font.italic 
//series.labeldispattr.font.orientation 
//series.labeldispattr.font.pitch 
//series.labeldispattr.font.strikethrough 
//series.labeldispattr.font.underline 
//series.labeldispattr.font.weight 
//series.labeldispattr.font.width 
//series.labeldispattr.format 
//series.labeldispattr.textcolor 

parent.wf_graph_series_dispattr()


//title.dispattr.alignment 
//title.dispattr.autosize 
//title.dispattr.backcolor 
//title.dispattr.displayexpression 
//title.dispattr.font.charset 
//title.dispattr.font.escapement 
//title.dispattr.font.face 
//title.dispattr.font.family 
//title.dispattr.font.height 
//title.dispattr.font.italic 
//title.dispattr.font.orientation 
//title.dispattr.font.pitch 
//title.dispattr.font.strikethrough 
//title.dispattr.font.underline 
//title.dispattr.font.weight 
//title.dispattr.font.width 
//title.dispattr.format 
//title.dispattr.textcolor 

parent.wf_graph_title_dispattr()

//legend.dispattr.alignment 
//legend.dispattr.autosize 
//legend.dispattr.backcolor 
//legend.dispattr.displayexpression 
//legend.dispattr.font.charset 
//legend.dispattr.font.escapement 
//legend.dispattr.font.face 
//legend.dispattr.font.family 
//legend.dispattr.font.height 
//legend.dispattr.font.italic 
//legend.dispattr.font.orientation 
//legend.dispattr.font.pitch 
//legend.dispattr.font.strikethrough 
//legend.dispattr.font.underline 
//legend.dispattr.font.weight 
//legend.dispattr.font.width 
//legend.dispattr.format 
//legend.dispattr.textcolor 

parent.wf_graph_legend_dispattr()

//pie.dispattr.alignment 
//pie.dispattr.autosize 
//pie.dispattr.backcolor 
//pie.dispattr.displayexpression 
//pie.dispattr.font.charset 
//pie.dispattr.font.escapement 
//pie.dispattr.font.face 
//pie.dispattr.font.family 
//pie.dispattr.font.height 
//pie.dispattr.font.italic 
//pie.dispattr.font.orientation 
//pie.dispattr.font.pitch 
//pie.dispattr.font.strikethrough 
//pie.dispattr.font.underline 
//pie.dispattr.font.weight 
//pie.dispattr.font.width 
//pie.dispattr.format 
//pie.dispattr.textcolor 

parent.wf_graph_pie_dispattr()

mle_1.scroll(1000)
end event

type mle_1 from multilineedit within w_main
integer x = 1257
integer y = 1748
integer width = 1742
integer height = 736
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_main
integer x = 151
integer y = 1436
integer width = 974
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "2. add some new properties in PB10"
boolean focusrectangle = false
end type

type st_1 from statictext within w_main
integer x = 142
integer y = 1324
integer width = 928
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1. add unicode in PB10 "
boolean focusrectangle = false
end type

type cb_button from commandbutton within w_main
integer x = 1559
integer y = 1136
integer width = 343
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "DW button"
end type

event clicked;/*************************************

Using b_1 as tesed button control
**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Datawindow Button Testing        ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"
integer ln_rtv , i
string ls_rtv , ls_syntaxfromsql , ls_Errors , ls_presentation , ls_tmp

//accessibledescription 
dw_1.object.b_1.accessibledescription = 'DW button description'
ls_rtv = dw_1.Modify( "b_1.accessibledescription='DW button (按钮)accessibledescription'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control accessibledescription ~r~n"
elseif dw_1.describe("b_1.accessibledescription") = dw_1.object.b_1.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow Button Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control accessibledescription ~r~n"
end if 

//accessiblename 
dw_1.object.b_1.accessibledescription = 'DWButton'
ls_rtv = dw_1.Modify( "b_1.accessibledescription='DWButton（按钮 ）'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control accessibledescription ~r~n"
elseif dw_1.describe("b_1.accessibledescription") = dw_1.object.b_1.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow Button Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control accessibledescription ~r~n"
end if 

//accessiblerole 
dw_1.object.b_1.accessibledescription = '43'
ls_rtv = dw_1.Modify( "b_1.accessibledescription='43'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control accessibledescription ~r~n"
elseif dw_1.describe("b_1.accessibledescription") = dw_1.object.b_1.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow Button Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control accessibledescription ~r~n"
end if 

//defaultpicture 
dw_1.object.b_1.DefaultPicture = 'no'
ls_rtv = dw_1.Modify("b_1.DefaultPicture ='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control DefaultPicture ~r~n"
elseif dw_1.describe("b_1.DefaultPicture") = dw_1.object.b_1.DefaultPicture then 
	mle_1.text += "Succeed ! DataWindow Button Control DefaultPicture ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control DefaultPicture ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.DefaultPicture ='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control DefaultPicture ~r~n"
elseif dw_1.describe("b_1.DefaultPicture") = dw_1.object.b_1.DefaultPicture then 
	mle_1.text += "Succeed ! DataWindow Button Control DefaultPicture ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control DefaultPicture ~r~n"
end if 

//action 
/*
0	UserDefined	
1	Retrieve (Yield)	
2	Retrieve	
3	Cancel	
4	PageNext	
5	PagePrior	
6	PageFirst	
7	PageLast	
8	Sort	
9	Filter	
10	DeleteRow	
11	AppendRow	
12	InsertRow	
13	Update	
14	SaveRowsAs	
15	Print	
16	Preview	
17	PreviewWithRulers	
18	QueryMode	
19	QuerySort	
20	QueryClear
*/
i = 0 
for i = 0 to 20
	dw_1.object.b_1.action = string(i)
	ls_rtv = dw_1.Modify("b_1.action='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Button - action - " + dw_1.Describe("b_1.action") + "~r~n"
	elseif dw_1.describe("b_1.action") = dw_1.object.b_1.action then 
		mle_1.text += "Succeed ! DataWindow Button - action - " + dw_1.Describe("b_1.action") + "~r~n"
	else
		mle_1.text += "Failure ! DataWindow Button - action - " + dw_1.Describe("b_1.action") + "~r~n"
	end if 
	
next

//attributes 
//this property couldn't be modified 
ls_tmp = dw_1.Describe("b_1.Attributes")
if dw_1.Describe("b_1.Attributes") = dw_1.object.b_1.attributes then 
	mle_1.text += "Succeed ! DataWindow Button - attributes - " + dw_1.Describe("b_1.band") + "~r~n"
else
	mle_1.text += "Failure ! DataWindow Button - attributes - " + dw_1.Describe("b_1.band") + "~r~n"
end if


//band 
//this property couldn't be modified 
if dw_1.Describe("b_1.band") = dw_1.object.b_1.band then 
	mle_1.text += "Succeed ! DataWindow Button - band - " + dw_1.Describe("b_1.band") + "~r~n"
else
	mle_1.text += "Failure ! DataWindow Button - band - " + dw_1.Describe("b_1.band") + "~r~n"
end if

//color 
dw_1.object.b_1.Color = '256'
ls_rtv = dw_1.Modify( "b_1.Color='16711935'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Color ~r~n"
elseif dw_1.describe("b_1.Color") = dw_1.object.b_1.Color then 
	mle_1.text += "Succeed ! DataWindow Button Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Color ~r~n"
end if 

ls_rtv = Modify( dw_1,"b_1.Color='16711935'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Color ~r~n"
elseif describe(dw_1,"b_1.Color") = dw_1.object.b_1.Color then 
	mle_1.text += "Succeed ! DataWindow Button Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Color ~r~n"
end if 

ls_rtv = dw_1.Modify( "b_1.Color='0~tIf(salary>90000,255,65280)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Color ~r~n"
elseif dw_1.describe("b_1.Color") = dw_1.object.b_1.Color then 
	mle_1.text += "Succeed ! DataWindow Button Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Color ~r~n"
end if 

//enabled 
dw_1.object.b_1.Enabled = 'No'
ls_rtv = dw_1.Modify( "b_1.Enabled='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Enabled ~r~n"
elseif dw_1.describe("b_1.Enabled") = dw_1.object.b_1.Enabled then 
	mle_1.text += "Succeed ! DataWindow Button Control Enabled ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Enabled ~r~n"
end if 

ls_rtv = dw_1.Modify( "b_1.Enabled='YES'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control - Enabled ~r~n"
elseif dw_1.describe("b_1.Enabled") = dw_1.object.b_1.Enabled then 
	mle_1.text += "Succeed ! DataWindow Button Control - Enabled ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control - Enabled ~r~n"
end if 

//filename
dw_1.object.b_1.DefaultPicture = 'No'
ls_rtv = dw_1.Modify("b_1.DefaultPicture ='no'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control DefaultPicture ~r~n"
elseif dw_1.describe("b_1.DefaultPicture") = dw_1.object.b_1.DefaultPicture then 
	mle_1.text += "Succeed ! DataWindow Button Control DefaultPicture ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control DefaultPicture ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.Filename ='" + gs_curdir + "\picture\check.bmp'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Filename ~r~n"
elseif dw_1.describe("b_1.Filename") = dw_1.object.b_1.Filename then 
	mle_1.text += "Succeed ! DataWindow Button Control Filename ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Filename ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.Filename ='" + gs_curdir + "\picture\uarrow.gif'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Filename ~r~n"
elseif dw_1.describe("b_1.Filename") = dw_1.object.b_1.Filename then 
	mle_1.text += "Succeed ! DataWindow Button Control Filename ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Filename ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.Filename ='" + gs_curdir + "\picture\flower.jpg'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Filename ~r~n"
elseif dw_1.describe("b_1.Filename") = dw_1.object.b_1.Filename then 
	mle_1.text += "Succeed ! DataWindow Button Control Filename ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Filename ~r~n"
end if 

//height 
dw_1.object.b_1.height = '150'
ls_rtv = dw_1.Modify("b_1.height ='160'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control height ~r~n"
elseif dw_1.describe("b_1.height") = dw_1.object.b_1.height then 
	mle_1.text += "Succeed ! DataWindow Button Control height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control height ~r~n"
end if 

//hidesnake
dw_1.object.b_1.hidesnaked = '1'
ls_tmp = dw_1.describe("b_1.hidesnaked")
ls_rtv = dw_1.Modify("b_1.hidesnaked ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control hidesnaked ~r~n"
elseif dw_1.describe("b_1.hidesnaked") = dw_1.object.b_1.hidesnaked then 
	mle_1.text += "Succeed ! DataWindow Button Control hidesnaked ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control hidesnaked ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.hidesnaked =0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control hidesnaked ~r~n"
elseif dw_1.describe("b_1.hidesnaked") = dw_1.object.b_1.hidesnaked then 
	mle_1.text += "Succeed ! DataWindow Button Control hidesnaked ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control hidesnaked ~r~n"
end if 


//htextalign 
/*0 Center 1 Left 2 Right*/
i = 0 
for i = 0 to 2
	dw_1.object.b_1.htextalign = string(i)
	ls_rtv = dw_1.Modify("b_1.htextalign='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Button - htextalign - ~r~n"
	elseif dw_1.describe("b_1.htextalign") = dw_1.object.b_1.htextalign then 
		mle_1.text += "Succeed ! DataWindow Button - htextalign - ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Button - htextalign - ~r~n"
	end if 
next

//moveable 
dw_1.object.b_1.moveable = '1'
ls_rtv = dw_1.Modify("b_1.moveable ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control moveable ~r~n"
elseif dw_1.describe("b_1.moveable") = dw_1.object.b_1.moveable then 
	mle_1.text += "Succeed ! DataWindow Button Control moveable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control moveable ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.moveable =0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control moveable ~r~n"
elseif dw_1.describe("b_1.moveable") = dw_1.object.b_1.moveable then 
	mle_1.text += "Succeed ! DataWindow Button Control moveable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control moveable ~r~n"
end if 

//name 
//this property couldn't be modified 
if dw_1.Describe("b_1.name") = dw_1.object.b_1.name then 
	mle_1.text += "Succeed ! DataWindow Button - name - " + dw_1.Describe("b_1.name") + "~r~n"
else
	mle_1.text += "Failure ! DataWindow Button - name - " + dw_1.Describe("b_1.name") + "~r~n"
end if


//page ,seems obsolete

if dw_1.Describe("b_1.page") = dw_1.object.b_1.page then 
	mle_1.text += "Succeed ! DataWindow Button - page - " + dw_1.Describe("b_1.page") + "~r~n"
else
	mle_1.text += "Failure ! DataWindow Button - page - " + dw_1.Describe("b_1.page") + "~r~n"
end if

//pointer 
dw_1.object.b_1.Pointer = 'cross!'
ls_rtv = dw_1.Modify("b_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Pointer  ~r~n"
elseif dw_1.describe("b_1.Pointer") = dw_1.object.b_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Button Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Pointer  ~r~n"
elseif dw_1.describe("b_1.Pointer") = dw_1.object.b_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Button Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Pointer ~r~n"
end if 

//resizeable 
dw_1.object.b_1.resizeable = '1'
ls_rtv = dw_1.Modify("b_1.resizeable=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control resizeable  ~r~n"
elseif dw_1.describe("b_1.resizeable") = dw_1.object.b_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Button Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control resizeable ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.resizeable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control resizeable  ~r~n"
elseif dw_1.describe("b_1.resizeable") = dw_1.object.b_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Button Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control resizeable ~r~n"
end if 

//rotation ,seems obsolete
dw_1.object.b_1.rotation = '400'
ls_rtv = dw_1.Modify("b_1.rotation=450")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control rotation  ~r~n"
elseif dw_1.describe("b_1.rotation") = dw_1.object.b_1.rotation  then 
	mle_1.text += "Succeed ! DataWindow Button Control rotation  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control rotation ~r~n"
end if 

//slideleft 
dw_1.object.b_1.slideleft = 'Yes'
ls_rtv = dw_1.Modify("b_1.slideleft=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control slideleft  ~r~n"
elseif dw_1.describe("b_1.slideleft") = dw_1.object.b_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Button Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control slideleft ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control slideleft  ~r~n"
elseif dw_1.describe("b_1.slideleft") = dw_1.object.b_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Button Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control slideleft ~r~n"
end if 

//slideup 
dw_1.object.b_1.slideup = 'allabove'
ls_rtv = dw_1.Modify("b_1.slideup=AllAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control slideup  ~r~n"
elseif dw_1.describe("b_1.slideup") = dw_1.object.b_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Button Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control slideup  ~r~n"
elseif dw_1.describe("b_1.slideup") = dw_1.object.b_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Button Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control slideup  ~r~n"
elseif dw_1.describe("b_1.slideup") = dw_1.object.b_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow Button Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control slideup ~r~n"
end if 

//suppresseventprocessing 
dw_1.object.b_1.SuppressEventProcessing = 'NO'
ls_rtv = dw_1.Modify("b_1.SuppressEventProcessing=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control SuppressEventProcessing  ~r~n"
elseif dw_1.describe("b_1.SuppressEventProcessing") = dw_1.object.b_1.SuppressEventProcessing  then 
	mle_1.text += "Succeed ! DataWindow Button Control SuppressEventProcessing  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control SuppressEventProcessing ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.SuppressEventProcessing=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control SuppressEventProcessing  ~r~n"
elseif dw_1.describe("b_1.SuppressEventProcessing") = dw_1.object.b_1.SuppressEventProcessing  then 
	mle_1.text += "Succeed ! DataWindow Button Control SuppressEventProcessing  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control SuppressEventProcessing ~r~n"
end if 

//tag 
dw_1.object.b_1.tag = 'test简体繁體닷컴れがあןנΏΐΑΒΓΔЅІЇЈЉЊ'
ls_rtv = dw_1.Modify("b_1.tag='this is button'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control tag  ~r~n"
elseif dw_1.describe("b_1.tag") = dw_1.object.b_1.tag  then 
	mle_1.text += "Succeed ! DataWindow Button Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control tag ~r~n"
end if 


//text 
dw_1.object.b_1.text = '&button'
ls_rtv = dw_1.Modify("b_1.text='ne&w简体繁體닷컴れがあןנΏΐΑΒΓΔЅІЇЈЉЊ'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control text  ~r~n"
elseif dw_1.describe("b_1.text") = dw_1.object.b_1.text  then 
	mle_1.text += "Succeed ! DataWindow Button Control text  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control text ~r~n"
end if 

//transparentcolor , seems obsolete
dw_1.object.b_1.transparentcolor = '255'
ls_rtv = dw_1.Modify("b_1.transparentcolor='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control transparentcolor  ~r~n"
elseif dw_1.describe("b_1.transparentcolor") = dw_1.object.b_1.transparentcolor  then 
	mle_1.text += "Succeed ! DataWindow Button Control transparentcolor  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control transparentcolor ~r~n"
end if 

//type 
if (dw_1.Describe("b_1.type") = 'button') and  (dw_1.object.b_1.type = 'button') then 
	mle_1.text += "Succeed ! DataWindow Button Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control type ~r~n"
end if

//visible 
dw_1.object.b_1.visible = 'No'
ls_rtv = dw_1.Modify("b_1.visible=Yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control visible  ~r~n"
elseif dw_1.describe("b_1.visible") = dw_1.object.b_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Button Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.visible=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control visible  ~r~n"
elseif dw_1.describe("b_1.visible") = dw_1.object.b_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Button Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.visible='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control visible  ~r~n"
elseif dw_1.describe("b_1.visible") = dw_1.object.b_1.visible  then 
	mle_1.text += "Succeed ! DataWindow Button Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control visible ~r~n"
end if 

//vtextalign 
//0  Center 1 Top 2 Bottom 3 Multiline
i = 0 
for i = 0 to 3
	dw_1.object.b_1.vtextalign = string(i)
	ls_rtv = dw_1.Modify("b_1.vtextalign='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Button - vtextalign - " + dw_1.Describe("b_1.vtextalign") + "~r~n"
	elseif dw_1.describe("b_1.vtextalign") = dw_1.object.b_1.vtextalign then 
		mle_1.text += "Succeed ! DataWindow Button - vtextalign - " + dw_1.Describe("b_1.vtextalign") + "~r~n"
	else
		mle_1.text += "Failure ! DataWindow Button - vtextalign - " + dw_1.Describe("b_1.vtextalign") + "~r~n"
	end if 
	
next

//width 
dw_1.object.b_1.width = '300'
ls_rtv = dw_1.Modify("b_1.width='400'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control width  ~r~n"
elseif dw_1.describe("b_1.width") = dw_1.object.b_1.width  then 
	mle_1.text += "Succeed ! DataWindow Button Control width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control width ~r~n"
end if 

//x 
dw_1.object.b_1.x = '70'
ls_rtv = dw_1.Modify("b_1.x='80'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control x  ~r~n"
elseif dw_1.describe("b_1.x") = dw_1.object.b_1.x  then 
	mle_1.text += "Succeed ! DataWindow Button Control x  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control x ~r~n"
end if 

//y 
dw_1.object.b_1.y = '10'
ls_rtv = dw_1.Modify("b_1.y='10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control y  ~r~n"
elseif dw_1.describe("b_1.y") = dw_1.object.b_1.y  then 
	mle_1.text += "Succeed ! DataWindow Button Control y  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control y ~r~n"
end if 

//background.color 
dw_1.object.b_1.Background.Color = '260'
ls_rtv = dw_1.Modify("b_1.Background.Color='8388736'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Background.Color ~r~n"
elseif dw_1.describe("b_1.Background.Color") = dw_1.object.b_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow Button Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Background.Color ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.Background.Color='8388736~trgb(255,0,0)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Background.Color ~r~n"
elseif dw_1.describe("b_1.Background.Color") = dw_1.object.b_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow Button Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Background.Color ~r~n"
end if 

//background.mode 
dw_1.object.b_1.Background.Mode = '0'
ls_rtv = dw_1.Modify("b_1.Background.Mode='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Background.Mode ~r~n"
elseif dw_1.describe("b_1.Background.Mode") = dw_1.object.b_1.Background.Mode then 
	mle_1.text += "Succeed ! DataWindow Button Control Background.Mode ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Background.Mode ~r~n"
end if 

//font.charset 
dw_1.object.b_1.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "b_1.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Font.CharSet ~r~n"
elseif dw_1.describe("b_1.Font.CharSet") = dw_1.object.b_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Button Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "b_1.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Font.CharSet ~r~n"
elseif dw_1.describe("b_1.Font.CharSet") = dw_1.object.b_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Button Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "b_1.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Font.CharSet ~r~n"
elseif dw_1.describe("b_1.Font.CharSet") = dw_1.object.b_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Button Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "b_1.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Font.CharSet ~r~n"
elseif dw_1.describe("b_1.Font.CharSet") = dw_1.object.b_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Button Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.b_1.Font.face = 'Arial'
ls_rtv = dw_1.Modify( "b_1.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Font.face ~r~n"
elseif dw_1.describe("b_1.Font.face") = dw_1.object.b_1.Font.face then 
	mle_1.text += "Succeed ! DataWindow Button Control Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.b_1.font.orientation = '300'
ls_rtv = dw_1.Modify("b_1.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.orientation ~r~n"
elseif dw_1.describe("b_1.font.orientation") = dw_1.object.b_1.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Button Control font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.b_1.Font.escapement = '200'
ls_rtv = dw_1.Modify( "b_1.Font.escapement	='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Font.escapement ~r~n"
elseif dw_1.describe("b_1.Font.escapement") = dw_1.object.b_1.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Button Control Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Font.escapement ~r~n"
end if 

ls_rtv = dw_1.Modify( "b_1.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control Font.escapement ~r~n"
elseif dw_1.describe("b_1.Font.escapement") = dw_1.object.b_1.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Button Control Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.b_1.font.family = string(i)
	ls_rtv = dw_1.Modify("b_1.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Button Control font.family ~r~n"
	elseif dw_1.describe("b_1.font.family") = dw_1.object.b_1.font.family then 
		mle_1.text += "Succeed ! DataWindow Button Control font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Button Control font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.b_1.font.height = '90'
ls_rtv = dw_1.Modify("b_1.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.height ~r~n"
elseif dw_1.describe("b_1.font.height") = dw_1.object.b_1.font.height then 
	mle_1.text += "Succeed ! DataWindow Button Control font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.height ~r~n"
elseif dw_1.describe("b_1.font.height") = dw_1.object.b_1.font.height then 
	mle_1.text += "Succeed ! DataWindow Button Control font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.height ~r~n"
end if 

//font.italic 
dw_1.object.b_1.font.italic = '1'
ls_rtv = dw_1.Modify("b_1.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.italic ~r~n"
elseif dw_1.describe("b_1.font.italic") = dw_1.object.b_1.font.italic then 
	mle_1.text += "Succeed ! DataWindow Button Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.italic ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.font.italic =yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.italic ~r~n"
elseif dw_1.describe("b_1.font.italic") = dw_1.object.b_1.font.italic then 
	mle_1.text += "Succeed ! DataWindow Button Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.italic ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.italic ~r~n"
elseif dw_1.describe("b_1.font.italic") = dw_1.object.b_1.font.italic then 
	mle_1.text += "Succeed ! DataWindow Button Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.b_1.font.pitch = string(i)
	ls_rtv = dw_1.Modify("b_1.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Button Control font.pitch ~r~n"
	elseif dw_1.describe("b_1.font.pitch") = dw_1.object.b_1.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Button Control font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Button Control font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.b_1.font.strikethrough = '1'
ls_rtv = dw_1.Modify("b_1.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.strikethrough ~r~n"
elseif dw_1.describe("b_1.font.strikethrough") = dw_1.object.b_1.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Button Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.strikethrough ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.font.strikethrough =yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.strikethrough ~r~n"
elseif dw_1.describe("b_1.font.strikethrough") = dw_1.object.b_1.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Button Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.strikethrough ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.strikethrough ~r~n"
elseif dw_1.describe("b_1.font.strikethrough") = dw_1.object.b_1.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Button Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.b_1.font.underline = '1'
ls_rtv = dw_1.Modify("b_1.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.underline ~r~n"
elseif dw_1.describe("b_1.font.underline") = dw_1.object.b_1.font.underline then 
	mle_1.text += "Succeed ! DataWindow Button Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.underline ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.font.underline =yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.underline ~r~n"
elseif dw_1.describe("b_1.font.underline") = dw_1.object.b_1.font.underline then 
	mle_1.text += "Succeed ! DataWindow Button Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.underline ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.underline ~r~n"
elseif dw_1.describe("b_1.font.underline") = dw_1.object.b_1.font.underline then 
	mle_1.text += "Succeed ! DataWindow Button Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.underline ~r~n"
end if 

//font.weight 
dw_1.object.b_1.font.weight = '400'
ls_rtv = dw_1.Modify("b_1.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.weight ~r~n"
elseif dw_1.describe("b_1.font.weight") = dw_1.object.b_1.font.weight then 
	mle_1.text += "Succeed ! DataWindow Button Control font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("b_1.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.weight ~r~n"
elseif dw_1.describe("b_1.font.weight") = dw_1.object.b_1.font.weight then 
	mle_1.text += "Succeed ! DataWindow Button Control font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.weight ~r~n"
end if 

//font.width 
dw_1.object.b_1.font.width = '21'
ls_rtv = dw_1.Modify("b_1.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Button Control font.width ~r~n"
elseif dw_1.describe("b_1.font.width") = dw_1.object.b_1.font.width then 
	mle_1.text += "Succeed ! DataWindow Button Control font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Button Control font.width ~r~n"
end if 

mle_1.Scroll (1000)
end event

type cb_computedfield from commandbutton within w_main
integer x = 1198
integer y = 1136
integer width = 343
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Computed"
end type

event clicked;/*************************************

Using compute_1 as tesed ComputedFiled Control
**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Datawindow ComputerField Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"
integer ln_rtv , i
string ls_rtv , ls_syntaxfromsql , ls_Errors , ls_presentation , ls_tmp


//accessibledescription 
dw_1.object.compute_1.accessibledescription = 'Computed Field description-计算列'
ls_rtv = dw_1.Modify("compute_1.accessibledescription='ComputedField Description'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control accessibledescription ~r~n"
elseif dw_1.describe("compute_1.accessibledescription") = dw_1.object.compute_1.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control accessibledescription ~r~n"
end if 

//accessiblename 
dw_1.object.compute_1.accessiblename = 'ComputedField'
ls_rtv = dw_1.Modify("compute_1.accessiblename='ComputedField-计算列'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control accessiblename ~r~n"
elseif dw_1.describe("compute_1.accessiblename") = dw_1.object.compute_1.accessiblename then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control accessiblename ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control accessiblename ~r~n"
end if 

//accessiblerole 
dw_1.object.compute_1.accessiblerole = '41'
ls_rtv = dw_1.Modify("compute_1.accessiblerole='41'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control accessiblerole ~r~n"
elseif dw_1.describe("compute_1.accessiblerole") = dw_1.object.compute_1.accessiblerole then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control accessiblerole ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control accessiblerole ~r~n"
end if 

//alignment 
/*
Left!	0	Text is left-aligned.
Center!	2	Text is centered.
Right!	1	Text is right-aligned.
Justify!	3	
*/
i = 0 
for i = 0 to 3
	dw_1.object.compute_1.alignment = string(i)
	ls_rtv = dw_1.Modify("compute_1.Alignment='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow ComputedFiled Control Alignment ~r~n"
	elseif dw_1.describe("compute_1.Alignment") = dw_1.object.compute_1.alignment then 
		mle_1.text += "Succeed ! DataWindow ComputedFiled Control Alignment ~r~n"
	else
		mle_1.text += "Failure ! DataWindow ComputedFiled Control Alignment ~r~n"
	end if 
next

//attributes 
//this property couldn't be modified 
if dw_1.Describe("compute_1.Attributes") = dw_1.object.compute_1.attributes then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control attributes ~r~n"
end if

//band 
//this property couldn't be modified 
if dw_1.Describe("compute_1.band") = dw_1.object.compute_1.band then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control band ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control band ~r~n"
end if

//border 
i = 0 
for i = 0 to 6
	dw_1.object.compute_1.border = string(i)
	ls_rtv = dw_1.Modify("compute_1.border='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow ComputedFiled Control border ~r~n"
	elseif dw_1.describe("compute_1.border") = dw_1.object.compute_1.border then 
		mle_1.text += "Succeed ! DataWindow ComputedFiled Control border ~r~n"
	else
		mle_1.text += "Failure ! DataWindow ComputedFiled Control border ~r~n"
	end if 
next

//color 
dw_1.object.compute_1.Color = '270'
ls_rtv = dw_1.Modify("compute_1.Color='8388736'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Color ~r~n"
elseif dw_1.describe("compute_1.Color") = dw_1.object.compute_1.Color then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Color ~r~n"
end if 

ls_rtv = Modify(dw_1 , "compute_1.Color='8388736'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Color ~r~n"
elseif describe(dw_1 , "compute_1.Color") = dw_1.object.compute_1.Color then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Color ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.Color='8388739~tif(salary>40000,rgb(0,255,255),rgb(255,255,0))'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Color ~r~n"
elseif dw_1.describe("compute_1.Color") = dw_1.object.compute_1.Color then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Color ~r~n"
end if 

//coltype 
//this property couldn't be modified 
if dw_1.Describe("compute_1.coltype") = dw_1.object.compute_1.coltype  then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control coltype ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control coltype ~r~n"
end if

//expression 
dw_1.object.compute_1.expression = 'emp_fname'
ls_rtv = dw_1.Modify("compute_1.expression='emp_fname'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control expression ~r~n"
elseif dw_1.describe("compute_1.expression") = dw_1.object.compute_1.expression then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control expression ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control expression ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.expression='salary'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control expression ~r~n"
elseif dw_1.describe("compute_1.expression") = dw_1.object.compute_1.expression then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control expression ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control expression ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.expression='case(  emp_id when 102,103 then ~"102~" when 104 to 300   then ~"104-300~" when is < 400 then ~"<400~" when is <= 500  then ~"<=500 ~" when is = 600 then ~"~" when is >= 700 then ~"xx~"  when is >800  then ~"xcxc~" else ~"other~")'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control expression ~r~n"
elseif dw_1.describe("compute_1.expression") = dw_1.object.compute_1.expression then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control expression ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control expression ~r~n"
end if 

//format 
dw_1.object.compute_1.format = '[general]'
ls_rtv = dw_1.Modify("compute_1.format='[red]###,##0.00'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control format ~r~n"
elseif dw_1.describe("compute_1.format") = dw_1.object.compute_1.format then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control format ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control format ~r~n"
end if 

//height 
dw_1.object.compute_1.height = '90'
ls_rtv = dw_1.Modify("compute_1.height='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control height ~r~n"
elseif dw_1.describe("compute_1.height") = dw_1.object.compute_1.height then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control height ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control height ~r~n"
end if 

//height.autosize 
ls_rtv = dw_1.Modify("compute_1.height.autosize='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control height.autosize ~r~n"
elseif dw_1.describe("compute_1.height.autosize") = dw_1.object.compute_1.height.autosize then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control height.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control height.autosize ~r~n"
end if 
dw_1.object.compute_1.height.autosize = 'Yes'
ls_rtv = dw_1.Modify("compute_1.height.autosize='NO'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control height.autosize ~r~n"
elseif dw_1.describe("compute_1.height.autosize") = dw_1.object.compute_1.height.autosize then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control height.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control height.autosize ~r~n"
end if 

//html.appendedhtml 
//html.link 
//html.linkargs 
//html.linktarget 
//html.valueishtml 

//html.appendedhtml 
dw_1.object.compute_1.html.appendedhtml = 'dddd'
ls_rtv = dw_1.Modify("compute_1.html.appendedhtml ='appendtext'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control html.appendedhtml  ~r~n"
elseif dw_1.describe("compute_1.html.appendedhtml ") = dw_1.object.compute_1.html.appendedhtml  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control html.appendedhtml  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control html.appendedhtml  ~r~n"
end if 

//html.link 
dw_1.object.compute_1.html.Link = 'ddd.html'
ls_rtv = dw_1.Modify("compute_1.html.Link ='empform.html'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control html.Link  ~r~n"
elseif dw_1.describe("compute_1.html.Link ") = dw_1.object.compute_1.html.Link  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control html.Link  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control html.Link  ~r~n"
end if 


//html.linkargs 
dw_1.object.compute_1.html.LinkArgs ="EMP_ID = 'string(emp_id)'"
ls_rtv = dw_1.Modify("compute_1.html.LinkArgs =~"EMP_ID = 'string(emp_id)'~"")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control html.LinkArgs  ~r~n"
elseif dw_1.describe("compute_1.html.LinkArgs ") = dw_1.object.compute_1.html.LinkArgs  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control html.LinkArgs  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control html.LinkArgs  ~r~n"
end if 

//html.linktarget 
dw_1.object.compute_1.html.LinkTarget = 'dfdfd'
ls_rtv = dw_1.Modify("compute_1.html.LinkTarget ='detail_win'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control html.LinkTarget  ~r~n"
elseif dw_1.describe("compute_1.html.LinkTarget") = dw_1.object.compute_1.html.LinkTarget  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control html.LinkTarget  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control html.LinkTarget  ~r~n"
end if 

//html.valueishtml 
dw_1.object.compute_1.html.ValueIsHTML = 'false'
ls_rtv = dw_1.Modify("compute_1.html.ValueIsHTML ='true'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control html.ValueIsHTML  ~r~n"
elseif dw_1.describe("compute_1.html.ValueIsHTML") = dw_1.object.compute_1.html.ValueIsHTML  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control html.ValueIsHTML  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control html.ValueIsHTML  ~r~n"
end if 


//lineremove , RichText presentation only

//moveable 
dw_1.object.compute_1.moveable = '1'
ls_rtv = dw_1.Modify("compute_1.moveable ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control moveable  ~r~n"
elseif dw_1.describe("compute_1.moveable") = dw_1.object.compute_1.moveable  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control moveable  ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.moveable =0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control moveable  ~r~n"
elseif dw_1.describe("compute_1.moveable") = dw_1.object.compute_1.moveable  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control moveable  ~r~n"
end if 

//multiline , RichText Only
//ls_rtv = dw_1.Modify("compute_1.multiline =1")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow ComputedField Control multiline " + ls_rtv + " ~r~n"
//elseif dw_1.describe("compute_1.multiline") = dw_1.object.compute_1.multiline  then 
//	mle_1.text += "Succeed ! DataWindow ComputedField Control multiline  ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow ComputedField Control multiline  ~r~n"
//end if 

//name 
//this property couldn't be modified 
if dw_1.Describe("compute_1.name") = dw_1.object.compute_1.name then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control name ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control name ~r~n"
end if

//pointer 
dw_1.object.compute_1.Pointer = 'cross!'
ls_rtv = dw_1.Modify("compute_1.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Pointer  ~r~n"
elseif dw_1.describe("compute_1.Pointer") = dw_1.object.compute_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Pointer ~r~n"
end if 

dw_1.object.compute_1.Pointer='HyperLink!'
if dw_1.describe("compute_1.Pointer") = dw_1.object.compute_1.Pointer  then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Pointer ~r~n"
end if 

//resizeable 
dw_1.object.compute_1.resizeable = '1'
ls_rtv = dw_1.Modify("compute_1.resizeable=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control resizeable  ~r~n"
elseif dw_1.describe("compute_1.resizeable") = dw_1.object.compute_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control resizeable ~r~n"
end if 

dw_1.object.compute_1.resizeable=0
if dw_1.describe("compute_1.resizeable") = dw_1.object.compute_1.resizeable  then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control resizeable ~r~n"
end if 

//slideleft 
dw_1.object.compute_1.slideleft = 'yes'
ls_rtv = dw_1.Modify("compute_1.slideleft=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control slideleft  ~r~n"
elseif dw_1.describe("compute_1.slideleft") = dw_1.object.compute_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control slideleft ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control slideleft  ~r~n"
elseif dw_1.describe("compute_1.slideleft") = dw_1.object.compute_1.slideleft  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control slideleft ~r~n"
end if 

//slideup 
dw_1.object.compute_1.slideup = 'allabove'
ls_rtv = dw_1.Modify("compute_1.slideup=AllAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control slideup  ~r~n"
elseif dw_1.describe("compute_1.slideup") = dw_1.object.compute_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control slideup  ~r~n"
elseif dw_1.describe("compute_1.slideup") = dw_1.object.compute_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control slideup  ~r~n"
elseif dw_1.describe("compute_1.slideup") = dw_1.object.compute_1.slideup  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control slideup ~r~n"
end if 

//tag 
dw_1.object.compute_1.tag = 'computedfield'
ls_rtv = dw_1.Modify("compute_1.tag='this is computed field'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control tag  ~r~n"
elseif dw_1.describe("compute_1.tag") = dw_1.object.compute_1.tag  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control tag ~r~n"
end if 

//type 
if (dw_1.Describe("compute_1.type") = 'compute') and  (dw_1.object.compute_1.type = 'compute') then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control type ~r~n"
end if

//visible 
dw_1.object.compute_1.visible = 'NO'
ls_rtv = dw_1.Modify("compute_1.visible=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control visible  ~r~n"
elseif dw_1.describe("compute_1.visible") = dw_1.object.compute_1.visible  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.visible=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control visible  ~r~n"
elseif dw_1.describe("compute_1.visible") = dw_1.object.compute_1.visible  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.visible=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control visible  ~r~n"
elseif dw_1.describe("compute_1.visible") = dw_1.object.compute_1.visible  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control visible ~r~n"
end if 

//width 
dw_1.object.compute_1.width = '300'
ls_rtv = dw_1.Modify("compute_1.width=400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control width  ~r~n"
elseif dw_1.describe("compute_1.width") = dw_1.object.compute_1.width  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control width ~r~n"
end if 

//Width.Autosize , richtext only
//ls_rtv = dw_1.Modify("compute_1.Width.Autosize=yes")
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow ComputedField Control Width.Autosize  ~r~n"
//elseif dw_1.describe("compute_1.Width.Autosize") = dw_1.object.compute_1.Width.Autosize  then 
//	mle_1.text += "Succeed ! DataWindow ComputedField Control Width.Autosize  ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow ComputedField Control Width.Autosize ~r~n"
//end if 
//
//dw_1.object.compute_1.Width.Autosize='no'
//if ls_rtv <> "" then 
//	mle_1.text += "Failure ! DataWindow ComputedField Control Width.Autosize  ~r~n"
//elseif dw_1.describe("compute_1.Width.Autosize") = dw_1.object.compute_1.Width.Autosize  then 
//	mle_1.text += "Succeed ! DataWindow ComputedField Control Width.Autosize  ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow ComputedField Control Width.Autosize ~r~n"
//end if 

//x 
dw_1.object.compute_1.x= '360'
ls_rtv = dw_1.Modify("compute_1.x=400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control x  ~r~n"
elseif dw_1.describe("compute_1.x") = dw_1.object.compute_1.x  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control x  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control x ~r~n"
end if 

//y 
dw_1.object.compute_1.y = '20'
ls_rtv = dw_1.Modify("compute_1.y=25")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedField Control y  ~r~n"
elseif dw_1.describe("compute_1.y") = dw_1.object.compute_1.y  then 
	mle_1.text += "Succeed ! DataWindow ComputedField Control y  ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedField Control y ~r~n"
end if 

//background.color 
dw_1.object.compute_1.Background.Color = '530'
ls_rtv = dw_1.Modify("compute_1.Background.Color='8388736'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Background.Color ~r~n"
elseif dw_1.describe("compute_1.Background.Color") = dw_1.object.compute_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Background.Color ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.Background.Color='8388736~trgb(255,0,0)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Background.Color ~r~n"
elseif dw_1.describe("compute_1.Background.Color") = dw_1.object.compute_1.Background.Color then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Background.Color ~r~n"
end if 

//background.mode 
dw_1.object.compute_1.Background.Mode = '0'
ls_rtv = dw_1.Modify("compute_1.Background.Mode='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Background.Mode ~r~n"
elseif dw_1.describe("compute_1.Background.Mode") = dw_1.object.compute_1.Background.Mode then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Background.Mode ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Background.Mode ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.Background.Mode='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Background.Mode ~r~n"
elseif dw_1.describe("compute_1.Background.Mode") = dw_1.object.compute_1.Background.Mode then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Background.Mode ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Background.Mode ~r~n"
end if 

//font.charset 
dw_1.object.compute_1.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "compute_1.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
elseif dw_1.describe("compute_1.Font.CharSet") = dw_1.object.compute_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "compute_1.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
elseif dw_1.describe("compute_1.Font.CharSet") = dw_1.object.compute_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "compute_1.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
elseif dw_1.describe("compute_1.Font.CharSet") = dw_1.object.compute_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "compute_1.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
elseif dw_1.describe("compute_1.Font.CharSet") = dw_1.object.compute_1.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.compute_1.Font.face = 'arial'
ls_rtv = dw_1.Modify( "compute_1.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.face ~r~n"
elseif dw_1.describe("compute_1.Font.face") = dw_1.object.compute_1.Font.face then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.compute_1.font.orientation = '200'
ls_rtv = dw_1.Modify("compute_1.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.orientation ~r~n"
elseif dw_1.describe("compute_1.font.orientation") = dw_1.object.compute_1.font.orientation then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.compute_1.Font.escapement = '300'
ls_rtv = dw_1.Modify( "compute_1.Font.escapement	='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.escapement ~r~n"
elseif dw_1.describe("compute_1.Font.escapement") = dw_1.object.compute_1.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.escapement ~r~n"
end if 

ls_rtv = dw_1.Modify( "compute_1.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.escapement ~r~n"
elseif dw_1.describe("compute_1.Font.escapement") = dw_1.object.compute_1.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.compute_1.font.family = string(i) 
	ls_rtv = dw_1.Modify("compute_1.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow ComputedFiled Control font.family ~r~n"
	elseif dw_1.describe("compute_1.font.family") = dw_1.object.compute_1.font.family then 
		mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow ComputedFiled Control font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.compute_1.font.height = '90'
ls_rtv = dw_1.Modify("compute_1.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.height ~r~n"
elseif dw_1.describe("compute_1.font.height") = dw_1.object.compute_1.font.height then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.height ~r~n"
elseif dw_1.describe("compute_1.font.height") = dw_1.object.compute_1.font.height then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.height ~r~n"
end if 

//font.italic 
dw_1.object.compute_1.font.italic = '1'
ls_rtv = dw_1.Modify("compute_1.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.italic ~r~n"
elseif dw_1.describe("compute_1.font.italic") = dw_1.object.compute_1.font.italic then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.italic ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.font.italic =yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.italic ~r~n"
elseif dw_1.describe("compute_1.font.italic") = dw_1.object.compute_1.font.italic then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.italic ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.italic ~r~n"
elseif dw_1.describe("compute_1.font.italic") = dw_1.object.compute_1.font.italic then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.compute_1.font.pitch = string(i) 
	ls_rtv = dw_1.Modify("compute_1.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow ComputedFiled Control font.pitch ~r~n"
	elseif dw_1.describe("compute_1.font.pitch") = dw_1.object.compute_1.font.pitch then 
		mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow ComputedFiled Control font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.compute_1.font.strikethrough = '1'
ls_rtv = dw_1.Modify("compute_1.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.strikethrough ~r~n"
elseif dw_1.describe("compute_1.font.strikethrough") = dw_1.object.compute_1.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.strikethrough ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.font.strikethrough =yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.strikethrough ~r~n"
elseif dw_1.describe("compute_1.font.strikethrough") = dw_1.object.compute_1.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.strikethrough ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.strikethrough ~r~n"
elseif dw_1.describe("compute_1.font.strikethrough") = dw_1.object.compute_1.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.compute_1.font.underline = '1'
ls_rtv = dw_1.Modify("compute_1.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.underline ~r~n"
elseif dw_1.describe("compute_1.font.underline") = dw_1.object.compute_1.font.underline then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.underline ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.font.underline =yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.underline ~r~n"
elseif dw_1.describe("compute_1.font.underline") = dw_1.object.compute_1.font.underline then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.underline ~r~n"
end if 

ls_rtv = dw_1.Modify("compute_1.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.underline ~r~n"
elseif dw_1.describe("compute_1.font.underline") = dw_1.object.compute_1.font.underline then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.underline ~r~n"
end if 


//font.weight 
dw_1.object.compute_1.font.weight = '400'
ls_rtv = dw_1.Modify("compute_1.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.weight ~r~n"
elseif dw_1.describe("compute_1.font.weight") = dw_1.object.compute_1.font.weight then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.weight ~r~n"
end if 

//font.width 
dw_1.object.compute_1.font.width = '21'
ls_rtv = dw_1.Modify("compute_1.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.width ~r~n"
elseif dw_1.describe("compute_1.font.width") = dw_1.object.compute_1.font.width then 
	mle_1.text += "Succeed ! DataWindow ComputedFiled Control font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow ComputedFiled Control font.width ~r~n"
end if 

mle_1.Scroll (1000)
end event

type cb_text from commandbutton within w_main
integer x = 837
integer y = 1136
integer width = 343
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Text"
end type

event clicked;/*************************************

Using emp_id_t as tesed text control
**************************************/

mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Datawindow Text Testing        ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"
integer ln_rtv , i
string ls_rtv , ls_syntaxfromsql , ls_Errors , ls_presentation

//accessibledescription 
dw_1.object.emp_id_t.accessibledescription = 'This is DW Text accessibledescription !@#$%^&*()'
ls_rtv = dw_1.Modify( "emp_id_t.accessibledescription='This is DW Text | description文本'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control accessibledescription ~r~n"
elseif dw_1.describe("emp_id_t.accessibledescription") = dw_1.object.emp_id_t.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow Text Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control accessibledescription ~r~n"
end if 

//accessiblename 
dw_1.object.emp_id_t.accessiblename = 'DWText'
ls_rtv = dw_1.Modify( "emp_id_t.accessiblename='DWText/静态文本'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control accessiblename ~r~n"
elseif dw_1.describe("emp_id_t.accessiblename") = dw_1.object.emp_id_t.accessiblename then 
	mle_1.text += "Succeed ! DataWindow Text Control accessiblename ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control accessiblename ~r~n"
end if 

//accessiblerole 
dw_1.object.emp_id_t.accessiblerole = '41'
ls_rtv = dw_1.Modify( "emp_id_t.accessiblerole=41")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control accessiblerole ~r~n"
elseif dw_1.describe("emp_id_t.accessiblerole") = dw_1.object.emp_id_t.accessiblerole then 
	mle_1.text += "Succeed ! DataWindow Text Control accessiblerole ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control accessiblerole ~r~n"
end if 

//alignment 
/*
Left!	0	Text is left-aligned.
Center!	2	Text is centered.
Right!	1	Text is right-aligned.
Justify!	3	
*/
i = 0 
for i = 0 to 3
	dw_1.object.emp_id_t.alignment = string(i)
	ls_rtv = dw_1.Modify("emp_id_t.Alignment='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Text Control Alignment ~r~n"
	elseif dw_1.describe("emp_id_t.Alignment") = dw_1.object.emp_id_t.alignment then 
		mle_1.text += "Succeed ! DataWindow Text Control Alignment ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Text Control Alignment ~r~n"
	end if 
	
next

//attributes 
if dw_1.Describe("emp_id_t.Attributes") = dw_1.object.emp_id_t.attributes then 
	mle_1.text += "Succeed ! DataWindow Text Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control attributes ~r~n"
end if

//background.color 
dw_1.object.emp_id_t.Background.Color = '255'
ls_rtv = dw_1.Modify("emp_id_t.Background.Color='8388736'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Background.Color ~r~n"
elseif dw_1.describe("emp_id_t.Background.Color") = dw_1.object.emp_id_t.Background.Color then 
	mle_1.text += "Succeed ! DataWindow Text Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Background.Color ~r~n"
end if 

ls_rtv = dw_1.Modify("emp_id_t.Background.Color='8388736~trgb(255,0,0)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Background.Color ~r~n"
elseif dw_1.describe("emp_id_t.Background.Color") = dw_1.object.emp_id_t.Background.Color then 
	mle_1.text += "Succeed ! DataWindow Text Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Background.Color ~r~n"
end if 

//background.mode 
dw_1.object.emp_id_t.Background.Mode = '0'
ls_rtv = dw_1.Modify("emp_id_t.Background.Mode='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Background.Mode ~r~n"
elseif dw_1.describe("emp_id_t.Background.Mode") = dw_1.object.emp_id_t.Background.Mode then 
	mle_1.text += "Succeed ! DataWindow Text Control Background.Mode ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Background.Mode ~r~n"
end if 


//band 
// this property couldn't be modified
ls_rtv = dw_1.Describe("emp_id_t.Band")
if dw_1.Describe("emp_id_t.Band") = dw_1.Object.emp_id_t.Band then 
	mle_1.text += "Succeed ! DataWindow Text Control Band ~r~n"
else
	mle_1.text += "Succeed ! DataWindow Text Control Band ~r~n"
end if 

//border 
i = 0 
for i = 0 to 6
	dw_1.object.emp_id_t.Border = string(i)
	ls_rtv = dw_1.Modify("emp_id_t.Border='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Text Control Border ~r~n"
	elseif dw_1.describe("emp_id_t.Border") = dw_1.object.emp_id_t.Border then 
		mle_1.text += "Succeed ! DataWindow Text Control Border ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Text Control Border ~r~n"
	end if 
	
next

//color 
ls_rtv = dw_1.Modify( "emp_id_t.Color='65536'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Color ~r~n"
elseif dw_1.describe("emp_id_t.Color") = dw_1.object.emp_id_t.Color then 
	mle_1.text += "Succeed ! DataWindow Text Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Color ~r~n"
end if 

ls_rtv = Modify( dw_1 , "emp_id_t.Color='65536'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Color ~r~n"
elseif describe( dw_1 , "emp_id_t.Color") = dw_1.object.emp_id_t.Color then 
	mle_1.text += "Succeed ! DataWindow Text Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Color ~r~n"
end if 

dw_1.object.emp_id_t.Color = '300'
ls_rtv = dw_1.Modify( "emp_id_t.Color='0~tIf(salary>90000,255,65280)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Color ~r~n"
elseif dw_1.describe("emp_id_t.Color") = dw_1.object.emp_id_t.Color then 
	mle_1.text += "Succeed ! DataWindow Text Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Color ~r~n"
end if 

//font.charset 
dw_1.object.emp_id_t.Font.CharSet = '1'
ls_rtv = dw_1.Modify( "emp_id_t.Font.CharSet	='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Font.CharSet ~r~n"
elseif dw_1.describe("emp_id_t.Font.CharSet") = dw_1.object.emp_id_t.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Text Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "emp_id_t.Font.CharSet	='2'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Font.CharSet ~r~n"
elseif dw_1.describe("emp_id_t.Font.CharSet") = dw_1.object.emp_id_t.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Text Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "emp_id_t.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Font.CharSet ~r~n"
elseif dw_1.describe("emp_id_t.Font.CharSet") = dw_1.object.emp_id_t.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Text Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "emp_id_t.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Font.CharSet ~r~n"
elseif dw_1.describe("emp_id_t.Font.CharSet") = dw_1.object.emp_id_t.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Text Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "emp_id_t.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Font.CharSet ~r~n"
elseif dw_1.describe("emp_id_t.Font.CharSet") = dw_1.object.emp_id_t.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Text Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.emp_id_t.Font.face = 'Arial'
ls_rtv = dw_1.Modify( "emp_id_t.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Font.face ~r~n"
elseif dw_1.describe("emp_id_t.Font.face") = dw_1.object.emp_id_t.Font.face then 
	mle_1.text += "Succeed ! DataWindow Text Control Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.emp_id_t.font.orientation = '900'
ls_rtv = dw_1.Modify("emp_id_t.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.orientation ~r~n"
elseif dw_1.describe("emp_id_t.font.orientation") = dw_1.object.emp_id_t.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Text Control font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.emp_id_t.Font.escapement = '450'
ls_rtv = dw_1.Modify( "emp_id_t.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Font.escapement ~r~n"
elseif dw_1.describe("emp_id_t.Font.escapement") = dw_1.object.emp_id_t.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Text Control Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.emp_id_t.font.family = string(i)
	ls_rtv = dw_1.Modify("emp_id_t.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Text Control font.family ~r~n"
	elseif dw_1.describe("emp_id_t.font.family") = dw_1.object.emp_id_t.font.family then 
		mle_1.text += "Succeed ! DataWindow Text Control font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Text Control font.family ~r~n"
	end if 
	
next

//font.height 
dw_1.object.emp_id_t.font.height = '-200'
ls_rtv = dw_1.Modify("emp_id_t.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.height ~r~n"
elseif dw_1.describe("emp_id_t.font.height") = dw_1.object.emp_id_t.font.height then 
	mle_1.text += "Succeed ! DataWindow Text Control font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.height ~r~n"
end if 

ls_rtv = dw_1.Modify("emp_id_t.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.height ~r~n"
elseif dw_1.describe("emp_id_t.font.height") = dw_1.object.emp_id_t.font.height then 
	mle_1.text += "Succeed ! DataWindow Text Control font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.height ~r~n"
end if 

//font.italic 
dw_1.object.emp_id_t.font.italic = '1'
ls_rtv = dw_1.Modify("emp_id_t.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.italic ~r~n"
elseif dw_1.describe("emp_id_t.font.italic") = dw_1.object.emp_id_t.font.italic then 
	mle_1.text += "Succeed ! DataWindow Text Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.italic ~r~n"
end if 

dw_1.object.emp_id_t.font.italic = 'Yes'
ls_rtv = dw_1.Modify("emp_id_t.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.italic ~r~n"
elseif dw_1.describe("emp_id_t.font.italic") = dw_1.object.emp_id_t.font.italic then 
	mle_1.text += "Succeed ! DataWindow Text Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.emp_id_t.font.pitch = string(i)
	ls_rtv = dw_1.Modify("emp_id_t.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Text Control font.pitch ~r~n"
	elseif dw_1.describe("emp_id_t.font.pitch") = dw_1.object.emp_id_t.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Text Control font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Text Control font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.emp_id_t.font.strikethrough = '1'
ls_rtv = dw_1.Modify("emp_id_t.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.strikethrough ~r~n"
elseif dw_1.describe("emp_id_t.font.strikethrough") = dw_1.object.emp_id_t.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Text Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.strikethrough ~r~n"
end if 

dw_1.object.emp_id_t.font.strikethrough = 'yes'
ls_rtv = dw_1.Modify("emp_id_t.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.strikethrough ~r~n"
elseif dw_1.describe("emp_id_t.font.strikethrough") = dw_1.object.emp_id_t.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Text Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.strikethrough ~r~n"
end if 


//font.underline 
dw_1.object.emp_id_t.font.underline = '1'
ls_rtv = dw_1.Modify("emp_id_t.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.underline ~r~n"
elseif dw_1.describe("emp_id_t.font.underline") = dw_1.object.emp_id_t.font.underline then 
	mle_1.text += "Succeed ! DataWindow Text Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.underline ~r~n"
end if 

dw_1.object.emp_id_t.font.underline = 'Yes'
ls_rtv = dw_1.Modify("emp_id_t.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.underline ~r~n"
elseif dw_1.describe("emp_id_t.font.underline") = dw_1.object.emp_id_t.font.underline then 
	mle_1.text += "Succeed ! DataWindow Text Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.underline ~r~n"
end if 

//font.weight 
dw_1.object.emp_id_t.font.weight = '400'
ls_rtv = dw_1.Modify("emp_id_t.font.weight =400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.weight ~r~n"
elseif dw_1.describe("emp_id_t.font.weight") = dw_1.object.emp_id_t.font.weight then 
	mle_1.text += "Succeed ! DataWindow Text Control font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.weight ~r~n"
end if 

ls_rtv = dw_1.Modify("emp_id_t.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.weight ~r~n"
elseif dw_1.describe("emp_id_t.font.weight") = dw_1.object.emp_id_t.font.weight then 
	mle_1.text += "Succeed ! DataWindow Text Control font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.weight ~r~n"
end if 

//font.width 
dw_1.object.emp_id_t.font.width = '40'
ls_rtv = dw_1.Modify("emp_id_t.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control font.width ~r~n"
elseif dw_1.describe("emp_id_t.font.width") = dw_1.object.emp_id_t.font.width then 
	mle_1.text += "Succeed ! DataWindow Text Control font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control font.width ~r~n"
end if 

//height 
dw_1.object.emp_id_t.Height = '80'
ls_rtv = dw_1.Modify("emp_id_t.Height=70")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Height ~r~n"
elseif dw_1.describe("emp_id_t.Height") = dw_1.object.emp_id_t.Height then 
	mle_1.text += "Succeed ! DataWindow Text Control Height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Height ~r~n"
end if 

//hidesnaked
dw_1.object.emp_id_t.hidesnaked = '1'
ls_rtv = dw_1.Modify("emp_id_t.hidesnaked =0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control hidesnaked ~r~n"
elseif dw_1.describe("emp_id_t.hidesnaked") = dw_1.object.emp_id_t.hidesnaked then 
	mle_1.text += "Succeed ! DataWindow Text Control hidesnaked ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control hidesnaked ~r~n"
end if 

//height.autosize 
dw_1.object.emp_id_t.height.autosize = 'yes'
ls_rtv = dw_1.Modify("emp_id_t.height.autosize=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control height.autosize ~r~n"
elseif dw_1.describe("emp_id_t.height.autosize") = dw_1.object.emp_id_t.height.autosize then 
	mle_1.text += "Succeed ! DataWindow Text Control height.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control height.autosize ~r~n"
end if 

//html.appendedhtml 
dw_1.object.emp_id_t.html.appendedhtml = 'dddddd'
ls_rtv = dw_1.Modify("emp_id_t.html.appendedhtml ='appendtext'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control html.appendedhtml  ~r~n"
elseif dw_1.describe("emp_id_t.html.appendedhtml ") = dw_1.object.emp_id_t.html.appendedhtml  then 
	mle_1.text += "Succeed ! DataWindow Text Control html.appendedhtml  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control html.appendedhtml  ~r~n"
end if 

//html.link 
dw_1.object.emp_id_t.html.Link = 'dfdf.htm'
ls_rtv = dw_1.Modify("emp_id_t.html.Link ='empform.html'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control html.Link  ~r~n"
elseif dw_1.describe("emp_id_t.html.Link ") = dw_1.object.emp_id_t.html.Link  then 
	mle_1.text += "Succeed ! DataWindow Text Control html.Link  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control html.Link  ~r~n"
end if 

//html.linkargs 
dw_1.object.emp_id_t.html.LinkArgs = "EMP_ID = 'string(emp_id)'"
ls_rtv = dw_1.Modify("emp_id_t.html.LinkArgs =~"EMP_ID = 'string(emp_id)'~"")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control html.LinkArgs  ~r~n"
elseif dw_1.describe("emp_id_t.html.LinkArgs ") = dw_1.object.emp_id_t.html.LinkArgs  then 
	mle_1.text += "Succeed ! DataWindow Text Control html.LinkArgs  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control html.LinkArgs  ~r~n"
end if 

//html.linktarget 
dw_1.object.emp_id_t.html.LinkTarget = 'detail_win'
ls_rtv = dw_1.Modify("emp_id_t.html.LinkTarget ='detail_win'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control html.LinkTarget  ~r~n"
elseif dw_1.describe("emp_id_t.html.LinkTarget") = dw_1.object.emp_id_t.html.LinkTarget  then 
	mle_1.text += "Succeed ! DataWindow Text Control html.LinkTarget  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control html.LinkTarget  ~r~n"
end if 

//html.valueishtml 
dw_1.object.emp_id_t.html.ValueIsHTML = 'false'
ls_rtv = dw_1.Modify("emp_id_t.html.ValueIsHTML ='true'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control html.ValueIsHTML  ~r~n"
elseif dw_1.describe("emp_id_t.html.ValueIsHTML") = dw_1.object.emp_id_t.html.ValueIsHTML  then 
	mle_1.text += "Succeed ! DataWindow Text Control html.ValueIsHTML  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control html.ValueIsHTML  ~r~n"
end if 

//moveable 
dw_1.object.emp_id_t.Moveable = '1'
ls_rtv = dw_1.Modify("emp_id_t.Moveable=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Moveable  ~r~n"
elseif dw_1.describe("emp_id_t.Moveable") = dw_1.object.emp_id_t.Moveable  then 
	mle_1.text += "Succeed ! DataWindow Text Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Moveable ~r~n"
end if 

ls_rtv = dw_1.Modify("emp_id_t.Moveable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Moveable  ~r~n"
elseif dw_1.describe("emp_id_t.Moveable") = dw_1.object.emp_id_t.Moveable  then 
	mle_1.text += "Succeed ! DataWindow Text Control Moveable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Moveable ~r~n"
end if 

//name 
if dw_1.Describe("emp_id_t.Name") = dw_1.object.emp_id_t.Name then 
	mle_1.text += "Succeed ! DataWindow Text Control Name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Name ~r~n"
end if

//pointer 
dw_1.object.emp_id_t.Pointer = 'cross!'
ls_rtv = dw_1.Modify("emp_id_t.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Pointer  ~r~n"
elseif dw_1.describe("emp_id_t.Pointer") = dw_1.object.emp_id_t.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Text Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Pointer ~r~n"
end if 

ls_rtv = dw_1.Modify("emp_id_t.Pointer='HyperLink!'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control Pointer  ~r~n"
elseif dw_1.describe("emp_id_t.Pointer") = dw_1.object.emp_id_t.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Text Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control Pointer ~r~n"
end if 

//resizeable 
dw_1.object.emp_id_t.resizeable = '1'
ls_rtv = dw_1.Modify("emp_id_t.resizeable=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control resizeable  ~r~n"
elseif dw_1.describe("emp_id_t.resizeable") = dw_1.object.emp_id_t.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Text Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control resizeable ~r~n"
end if 

//slideleft 
dw_1.object.emp_id_t.slideleft = 'yes'
ls_rtv = dw_1.Modify("emp_id_t.slideleft=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control slideleft  ~r~n"
elseif dw_1.describe("emp_id_t.slideleft") = dw_1.object.emp_id_t.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Text Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control slideleft ~r~n"
end if 

//slideup 
dw_1.object.emp_id_t.slideup = 'allabove'
ls_rtv = dw_1.Modify("emp_id_t.slideup=DirectlyAbove")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control slideup  ~r~n"
elseif dw_1.describe("emp_id_t.slideup") = dw_1.object.emp_id_t.slideup  then 
	mle_1.text += "Succeed ! DataWindow Text Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control slideup ~r~n"
end if 

ls_rtv = dw_1.Modify("emp_id_t.slideup=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control slideup  ~r~n"
elseif dw_1.describe("emp_id_t.slideup") = dw_1.object.emp_id_t.slideup  then 
	mle_1.text += "Succeed ! DataWindow Text Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control slideup ~r~n"
end if 

//tag 
dw_1.object.emp_id_t.tag = 'test tag'
ls_rtv = dw_1.Modify("emp_id_t.tag='Header of Employee ID'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control tag  ~r~n"
elseif dw_1.describe("emp_id_t.tag") = dw_1.object.emp_id_t.tag  then 
	mle_1.text += "Succeed ! DataWindow Text Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control tag ~r~n"
end if 

//text 
dw_1.object.emp_id_t.text = '&text'
ls_rtv = dw_1.Modify("emp_id_t.text='简体繁體닷컴れがあןנΏΐΑΒΓΔЅІЇЈЉЊ'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control text  ~r~n"
elseif dw_1.describe("emp_id_t.text") = dw_1.object.emp_id_t.text  then 
	mle_1.text += "Succeed ! DataWindow Text Control text  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control text ~r~n"
end if 


//type 
if (dw_1.Describe("emp_id_t.type") = 'text') and  (dw_1.object.emp_id_t.type = 'text') then 
	mle_1.text += "Succeed ! DataWindow Text Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control type ~r~n"
end if

//visible 
dw_1.object.emp_id_t.visible = 'No'
ls_rtv = dw_1.Modify("emp_id_t.visible=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control visible  ~r~n"
elseif dw_1.describe("emp_id_t.visible") = dw_1.object.emp_id_t.visible  then 
	mle_1.text += "Succeed ! DataWindow Text Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("emp_id_t.visible=0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control visible  ~r~n"
elseif dw_1.describe("emp_id_t.visible") = dw_1.object.emp_id_t.visible  then 
	mle_1.text += "Succeed ! DataWindow Text Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control visible ~r~n"
end if 

ls_rtv = dw_1.Modify("emp_id_t.visible=1")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control visible  ~r~n"
elseif dw_1.describe("emp_id_t.visible") = dw_1.object.emp_id_t.visible  then 
	mle_1.text += "Succeed ! DataWindow Text Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control visible ~r~n"
end if 

//width 
dw_1.object.emp_id_t.width = '500'
ls_rtv = dw_1.Modify("emp_id_t.width=400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control width  ~r~n"
elseif dw_1.describe("emp_id_t.width") = dw_1.object.emp_id_t.width  then 
	mle_1.text += "Succeed ! DataWindow Text Control width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control width ~r~n"
end if 

//x 
dw_1.object.emp_id_t.x = '450'
ls_rtv = dw_1.Modify("emp_id_t.x=400")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control x  ~r~n"
elseif dw_1.describe("emp_id_t.x") = dw_1.object.emp_id_t.x  then 
	mle_1.text += "Succeed ! DataWindow Text Control x  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control x ~r~n"
end if 

//y 
 dw_1.object.emp_id_t.y = '100'
ls_rtv = dw_1.Modify("emp_id_t.y=25")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Text Control y  ~r~n"
elseif dw_1.describe("emp_id_t.y") = dw_1.object.emp_id_t.y  then 
	mle_1.text += "Succeed ! DataWindow Text Control y  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Text Control y ~r~n"
end if 


//following properties can be used in SyntaxFromSQL()
/*
Alignment
Background.property	
Border : OK
Color	: OK
Font.property	*/

ls_presentation = "text(color=255 alignment=2 background.color=255 border=2 font.underline=1)"
ls_syntaxfromsql = SQLCA.SyntaxFromSQL("select * from department", ls_presentation	, ls_Errors)

IF Len(ls_Errors) > 0 THEN
   MessageBox("Caution", "SyntaxFromSQL caused these errors: " + ls_Errors)
   RETURN
END IF


dw_2.Create( ls_syntaxfromsql, ls_Errors)

IF Len(ls_Errors) > 0 THEN
   MessageBox("Caution", "Create cause these errors: " + ls_Errors)
   RETURN
END IF
dw_2.SetTransObject(sqlca)
dw_2.Retrieve()
mle_1.Scroll (1000)
end event

type cb_datawindow from commandbutton within w_main
integer x = 475
integer y = 1136
integer width = 343
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "DataWindow "
end type

event clicked;/*************************************

Datawindow property testing
**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Datawindow property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"

//attributes 
//bands 
//color 
//column.count 
//crosstab.columns 
//crosstab.rows 
//crosstab.sourcenames 
//crosstab.staticmode 
//crosstab.values 
//cssgen.publishpath 
//cssgen.resourcebase 
//cssgen.sessionspecific 
//data 
//data.html 
//data.htmltable 
//data.xhtml 
//data.xml 
//data.xmldtd 
//data.xmlschema 
//data.xmlweb 
//data.xslfo 
//detail.color 
//detail.height 
//detail.height.autosize 
//detail.pointer 
//detail.text 
//export.pdf.distill.custompostscript 
//export.pdf.method 
//export.pdf.xslfop.print 
//export.xhtml.template 
//export.xhtml.templatecount 
//export.xhtml.usetemplate 
//export.xml.headgroups 
//export.xml.includewhitespace 
//export.xml.metadatatype 
//export.xml.savemetadata 
//export.xml.template 
//export.xml.templatecount 
//export.xml.usetemplate 
//firstrowonpage 
//font.bias 
//footer.color 
//footer.height 
//footer.pointer 
//footer.text 
//grid.columnmove 
//grid.lines 
//header 
//header.color 
//header.height 
//header.pointer 
//header.text 
//help.command 
//help.file 
//help.typeid 
//help.typeid.importfile 
//help.typeid.retrieve.argument 
//help.typeid.retrieve.criteria 
//help.typeid.saveas 
//help.typeid.setcrosstab 
//help.typeid.setfilter 
//help.typeid.setsort 
//help.typeid.setsortexpr 
//hidegrayline 
//horizontalscrollmaximum 
//horizontalscrollmaximum2 
//horizontalscrollposition 
//horizontalscrollposition2 
//horizontalscrollsplit 

parent.wf_datawindow_gen1()

//htmldw 
//htmlgen.browser 
//htmlgen.clientcomputedfields 
//htmlgen.clientevents 
//htmlgen.clientformatting 
//htmlgen.clientscriptable 
//htmlgen.clientvalidation 
//htmlgen.commonjsfile 
//htmlgen.datejsfile 
//htmlgen.encodeselflinkargs 
//htmlgen.firstonpage 
//htmlgen.fourglweb 
//htmlgen.generatejavascript 
//htmlgen.htmlversion 
//htmlgen.netscapelayers 
//htmlgen.numberjsfile 
//htmlgen.objectname 
//htmlgen.pagesize 
//htmlgen.resourcebase 
//htmlgen.selflink 
//htmlgen.selflinkargs 
//htmlgen.stringjsfile 
//htmlgen.tabindexbase 
//htmlgen.userjsfile 
//htmltable.border 
//htmltable.cellpadding 
//htmltable.cellspacing 
//htmltable.generatecss 
//htmltable.nowrap 
//htmltable.stylesheet 
//htmltable.width 
//import.xml.trace 
//import.xml.tracefile 
//import.xml.usetemplate 
//jsgen.publishpath 
//jsgen.resourcebase 
//

parent.wf_datawindow_gen2()

/************************

Following was moved to button datawindow2

*************************/
//lastrowonpage 
//message.title 
//name 
//nested 
//nouserprompt 
//Set the NoUserPrompt property to yes if the DataWindow is to be used in a batch process or in an EAServer environment when there is no possibility for end user intervention. Dialog boxes you can prevent from displaying include the Error, Print, Retrieve, CrossTab, Expression, SaveAs, Import, Query, RichText, Filter, and Sort dialog boxes.
//objects 
//pointer 
//processing 
//querysort 
//querymode 
//readonly 
//replacetabwithspace 
//retrieve.asneeded 

//row.resize , it's for grid or crosstab

//rows_per_detail , it's for n-up

//selected 
//selected.data 

//selected.mouse , it's for grid or crosstab

//showdefinition 
//sparse 
//storage 

//storagefull , not in document


//storagepagesize 

//summary.color
//summary.height 
//summary.pointer 

//syntax 

//syntax.data 
//syntax.modified 
//timer_interval 
//type 
//units 

//verticalscrollmaximum 
//verticalscrollposition 
//visualobjects 

//xhtmlgen.browser 

//xmlgen.publishpath 
//xmlgen.resourcebase 
//xsltgen.publishpath 
//xsltgen.resourcebase 


//zoom 
//print.buttons 
//print.printername 

//print.canusedefaultprinter 
//print.printername 

//print.canusedefaultprinter 

//print.cliptext 

//print.collate 


//print.color 

//print.columns 

//print.columns.width 

//print.copies 
//print.documentname 

//print.duplex 
//print.filename 
//print.margin.bottom 
//print.margin.left 

//print.margin.right 
//print.margin.top 

//print.orientation 

//print.overrideprintjob 

//print.page.range 

//print.page.rangeinclude 

//print.paper.size 
//print.custompage.length 

//print.custompage.width 

//print.paper.source 

//print.preview 
//print.preview.buttons 
//print.preview.rulers 
//print.preview.zoom 
//print.prompt 

//print.quality 
//print.scale , 
//printer 

parent.wf_datawindow_gen3()

//table.arguments 
//table.columns 
//table.crosstabdata 
//table.data.storage 
//table.delete.arguments 
//table.delete.method 
//table.delete.type 
//table.filter 
//table.gridcolumns 
//table.insert.arguments 
//table.insert.method 
//table.insert.type 
//table.procedure 
//table.select 
//table.select.attribute 
//table.sort 
//table.sqlselect 
//table.update.arguments 
//table.update.method 
//table.update.type 
//table.updatekeyinplace 
//table.updatetable 
//table.updatewhere 

parent.wf_datawindow_table()


//crosstab.columns 
//crosstab.rows 
//crosstab.sourcenames 
//crosstab.staticmode 
//crosstab.values 
//help.typeid.setcrosstab 
//row.resize 
//selected.mouse , it's for grid or crosstab
//table.crosstabdata 

parent.wf_datawindow_crosstab()

//for grid dw
//grid.columnmove 
//grid.lines 
//row.resize 
//selected.mouse , it's for grid or crosstab
//table.gridcolumns 
//if dw_1.Describe("datawindow.table.gridcolumns") = dw_1.object.datawindow.table.gridcolumns then 
//	mle_1.text += "Succeed ! DataWindow Control table.gridcolumns ~r~n"
//else
//	mle_1.text += "Failure ! DataWindow Control table.gridcolumns ~r~n"
//end if 
parent.wf_datawindow_grid()

//for group dw
//header , for group , header.#1.*
//trailer 
//hidegrayline 

parent.wf_datawindow_group()

//for label dw
//label.columns 
//label.columns.spacing 
//label.ellipse_height 
//label.ellipse_width 
//label.height 
//label.name 
//label.rows 
//label.rows.spacing 
//label.shape 
//label.sheet 
//label.topdown 
//label.width 

parent.wf_datawindow_label()

//for N-UP
//rows_per_detail 

parent.wf_datawindow_nup()

//for ole dw
//ole.client.class 
//ole.client.name 

parent.wf_datawindow_ole()

//for richtext dw
//richtext.backcolor 
//richtext.displayonly 
//richtext.headerfooter 
//richtext.initialfile 
//richtext.inputfieldbackcolor 
//richtext.inputfieldnamesvisible 
//richtext.inputfieldsvisible 
//richtext.pictureframe 
//richtext.popmenu 
//richtext.readonly 
//richtext.returnsvisible 
//richtext.rulerbar 
//richtext.spacesvisible 
//richtext.tabbar 
//richtext.tabsvisible 
//richtext.toolbar 
//richtext.wordwrap 
//detail.text , richtext only
//footer.text 
//header.text 

parent.wf_datawindow_richtext()

mle_1.scroll(1000)
end event

type cb_column from commandbutton within w_main
integer x = 114
integer y = 1136
integer width = 343
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Column"
end type

event clicked;/*get emp_id column


***************************/


integer ln_rtv , i
string ls_rtv , ls_tmp

/*************************************

Datawindow Column property testing
**************************************/
mle_1.text += "~r~n"
mle_1.text += "##################################### ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "#    Datawindow Column property Testing ~r~n"
mle_1.text += "#                                     ~r~n"
mle_1.text += "##################################### ~r~n"

dw_1.dataobject = "d_tabular_column"
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

//accelerator 
dw_1.object.emp_id.accelerator = "b"
ls_rtv = dw_1.Modify( "emp_id.accelerator='a'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control accelerator ~r~n"
elseif dw_1.describe("emp_id.accelerator") = dw_1.object.emp_id.accelerator then 
	mle_1.text += "Succeed ! DataWindow Column Control accelerator ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control accelerator ~r~n"
end if 

//accessibledescription 
dw_1.object.emp_id.accessibledescription = "DWColumn description"
ls_rtv = dw_1.Modify( "emp_id.accessibledescription='DW Column/数据列'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control accessibledescription ~r~n"
elseif dw_1.describe("emp_id.accessibledescription") = dw_1.object.emp_id.accessibledescription then 
	mle_1.text += "Succeed ! DataWindow Column Control accessibledescription ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control accessibledescription ~r~n"
end if 

//accessiblename 
dw_1.object.emp_id.accessiblename = "DW Column"
ls_rtv = dw_1.Modify( "emp_id.accessiblename='DWColumn/数据列'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control accessiblename ~r~n"
elseif dw_1.describe("emp_id.accessiblename") = dw_1.object.emp_id.accessiblename then 
	mle_1.text += "Succeed ! DataWindow Column Control accessiblename ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control accessiblename ~r~n"
end if 

//accessiblerole 
dw_1.object.emp_id.accessiblerole = "42"
ls_rtv = dw_1.Modify( "emp_id.accessiblerole='42'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control accessiblerole ~r~n"
elseif dw_1.describe("emp_id.accessiblerole") = dw_1.object.emp_id.accessiblerole then 
	mle_1.text += "Succeed ! DataWindow Column Control accessiblerole ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control accessiblerole ~r~n"
end if 

//alignment 
/*
Left!	0	Text is left-aligned.
Center!	2	Text is centered.
Right!	1	Text is right-aligned.
Justify!	3	
*/
i = 0 
for i = 0 to 3
	ls_rtv = dw_1.Modify("emp_id.Alignment='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Column Control Alignment ~r~n"
	elseif dw_1.describe("emp_id.Alignment") = dw_1.object.emp_id.alignment then 
		mle_1.text += "Succeed ! DataWindow Column Control Alignment ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Column Control Alignment ~r~n"
	end if 
next

//attributes 
if dw_1.Describe("emp_id.Attributes") = dw_1.object.emp_id.attributes then 
	mle_1.text += "Succeed ! DataWindow Column Control attributes ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control attributes ~r~n"
end if

//band 
if dw_1.Describe("emp_id.band") = dw_1.object.emp_id.band then 
	mle_1.text += "Succeed ! DataWindow Column Control band ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control band ~r~n"
end if

//bitmapname 
if dw_1.Describe("emp_id.bitmapname") = dw_1.object.emp_id.bitmapname then 
	mle_1.text += "Succeed ! DataWindow Column Control bitmapname ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control bitmapname ~r~n"
end if

//border 
i = 0 
for i = 0 to 6
	dw_1.object.emp_id.Border = string(i) 
	ls_rtv = dw_1.Modify("emp_id.Border='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Column Control Border ~r~n"
	elseif dw_1.describe("emp_id.Border") = dw_1.object.emp_id.Border then 
		mle_1.text += "Succeed ! DataWindow Column Control Border ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Column Control Border ~r~n"
	end if 
next

//color 
dw_1.object.emp_id.Color = "65536"
ls_rtv = dw_1.Modify( "emp_id.Color='0~tIf(salary>90000,255,65280)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control Color ~r~n"
elseif dw_1.describe("emp_id.Color") = dw_1.object.emp_id.Color then 
	mle_1.text += "Succeed ! DataWindow Column Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control Color ~r~n"
end if 

ls_rtv = Modify( dw_1, "emp_id.Color='0~tIf(salary>90000,255,65280)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control Color ~r~n"
elseif describe(dw_1,"emp_id.Color") = dw_1.object.emp_id.Color then 
	mle_1.text += "Succeed ! DataWindow Column Control Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control Color ~r~n"
end if 

//coltype 
if dw_1.Describe("emp_id.coltype") = dw_1.object.emp_id.coltype then 
	mle_1.text += "Succeed ! DataWindow Column Control coltype ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control coltype ~r~n"
end if

//compute , not doc
if dw_1.Describe("emp_id.compute") = dw_1.object.emp_id.compute then 
	mle_1.text += "Succeed ! DataWindow Column Control compute ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control compute ~r~n"
end if

//criteria.dialog 
dw_1.object.emp_id.criteria.dialog = 'No'
ls_rtv = dw_1.Modify( "emp_id.criteria.dialog=Yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control criteria.dialog ~r~n"
elseif dw_1.describe("emp_id.criteria.dialog") = dw_1.object.emp_id.criteria.dialog then 
	mle_1.text += "Succeed ! DataWindow Column Control criteria.dialog ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control criteria.dialog ~r~n"
end if 

//criteria.override_edit 
dw_1.object.emp_id.criteria.override_edit = 'No'
ls_rtv = dw_1.Modify( "emp_id.criteria.override_edit=Yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control criteria.override_edit ~r~n"
elseif dw_1.describe("emp_id.criteria.override_edit") = dw_1.object.emp_id.criteria.override_edit then 
	mle_1.text += "Succeed ! DataWindow Column Control criteria.override_edit ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control criteria.override_edit ~r~n"
end if 
//criteria.required 
dw_1.object.emp_id.criteria.required = 'No'
ls_rtv = dw_1.Modify( "emp_id.criteria.required=Yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control criteria.required ~r~n"
elseif dw_1.describe("emp_id.criteria.required") = dw_1.object.emp_id.criteria.required then 
	mle_1.text += "Succeed ! DataWindow Column Control criteria.required ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control criteria.required ~r~n"
end if 

//dbname 
dw_1.object.emp_id.dbname = 'employee.emp_fname'
ls_rtv = dw_1.Modify( "emp_id.dbname='employee.emp_id'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control dbname ~r~n"
elseif dw_1.describe("emp_id.dbname") = dw_1.object.emp_id.dbname then 
	mle_1.text += "Succeed ! DataWindow Column Control dbname ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control dbname ~r~n"
end if 

//format 
dw_1.object.emp_id.format = 'id:###'
ls_rtv = dw_1.Modify( "emp_id.format='ID:###'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control format ~r~n"
elseif dw_1.describe("emp_id.format") = dw_1.object.emp_id.format then 
	mle_1.text += "Succeed ! DataWindow Column Control format ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control format ~r~n"
end if 

//height 
//height.autosize 
//html.appendedhtml 
//html.link 
//html.linkargs 
//html.linktarget 
//html.valueishtml 
//height 
ls_rtv = dw_1.Modify("emp_id.Height=70")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control Height ~r~n"
elseif dw_1.describe("emp_id.Height") = dw_1.object.emp_id.Height then 
	mle_1.text += "Succeed ! DataWindow Column Control Height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control Height ~r~n"
end if 

//hidesnaked
ls_rtv = dw_1.Modify("emp_id.hidesnaked ='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control hidesnaked ~r~n"
elseif dw_1.describe("emp_id.hidesnaked") = dw_1.object.emp_id.hidesnaked then 
	mle_1.text += "Succeed ! DataWindow Column Control hidesnaked ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control hidesnaked ~r~n"
end if 

ls_rtv = dw_1.Modify("emp_id.hidesnaked =0")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control hidesnaked ~r~n"
elseif dw_1.describe("emp_id.hidesnaked") = dw_1.object.emp_id.hidesnaked then 
	mle_1.text += "Succeed ! DataWindow Column Control hidesnaked ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control hidesnaked ~r~n"
end if 

//height.autosize 
ls_rtv = dw_1.Modify("emp_id.height.autosize=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control height.autosize ~r~n"
elseif dw_1.describe("emp_id.height.autosize") = dw_1.object.emp_id.height.autosize then 
	mle_1.text += "Succeed ! DataWindow Column Control height.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control height.autosize ~r~n"
end if 

ls_rtv = dw_1.Modify("emp_id.height.autosize=no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control height.autosize ~r~n"
elseif dw_1.describe("emp_id.height.autosize") = dw_1.object.emp_id.height.autosize then 
	mle_1.text += "Succeed ! DataWindow Column Control height.autosize ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control height.autosize ~r~n"
end if 

//html.appendedhtml 
ls_rtv = dw_1.Modify("emp_id.html.appendedhtml ='appendtext'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control html.appendedhtml  ~r~n"
elseif dw_1.describe("emp_id.html.appendedhtml ") = dw_1.object.emp_id.html.appendedhtml  then 
	mle_1.text += "Succeed ! DataWindow Column Control html.appendedhtml  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control html.appendedhtml  ~r~n"
end if 

//html.link 
ls_rtv = dw_1.Modify("emp_id.html.Link ='empform.html'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control html.Link  ~r~n"
elseif dw_1.describe("emp_id.html.Link ") = dw_1.object.emp_id.html.Link  then 
	mle_1.text += "Succeed ! DataWindow Column Control html.Link  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control html.Link  ~r~n"
end if 


//html.linkargs 
ls_rtv = dw_1.Modify("emp_id.html.LinkArgs =~"EMP_ID = 'string(emp_id)'~"")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control html.LinkArgs  ~r~n"
elseif dw_1.describe("emp_id.html.LinkArgs ") = dw_1.object.emp_id.html.LinkArgs  then 
	mle_1.text += "Succeed ! DataWindow Column Control html.LinkArgs  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control html.LinkArgs  ~r~n"
end if 

//html.linktarget 
ls_rtv = dw_1.Modify("emp_id.html.LinkTarget ='detail_win'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control html.LinkTarget  ~r~n"
elseif dw_1.describe("emp_id.html.LinkTarget") = dw_1.object.emp_id.html.LinkTarget  then 
	mle_1.text += "Succeed ! DataWindow Column Control html.LinkTarget  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control html.LinkTarget  ~r~n"
end if 

//html.valueishtml 
ls_rtv = dw_1.Modify("emp_id.html.ValueIsHTML ='true'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control html.ValueIsHTML  ~r~n"
elseif dw_1.describe("emp_id.html.ValueIsHTML") = dw_1.object.emp_id.html.ValueIsHTML  then 
	mle_1.text += "Succeed ! DataWindow Column Control html.ValueIsHTML  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control html.ValueIsHTML  ~r~n"
end if 

//id 
if dw_1.Describe("emp_id.id") = dw_1.object.emp_id.id then 
	mle_1.text += "Succeed ! DataWindow Column Control id ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control id ~r~n"
end if

//identity 
dw_1.object.emp_id.identity = 'No'
ls_rtv = dw_1.Modify( "emp_id.identity=Yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control identity ~r~n"
elseif dw_1.describe("emp_id.identity") = dw_1.object.emp_id.identity then 
	mle_1.text += "Succeed ! DataWindow Column Control identity ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control identity ~r~n"
end if 

//initial 
dw_1.object.emp_id.initial = '500'
ls_rtv = dw_1.Modify( "emp_id.initial='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control initial ~r~n"
elseif dw_1.describe("emp_id.initial") = dw_1.object.emp_id.initial then 
	mle_1.text += "Succeed ! DataWindow Column Control initial ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control initial ~r~n"
end if 

//key 
dw_1.object.emp_id.key = 'No'
ls_rtv = dw_1.Modify( "emp_id.key=Yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control key ~r~n"
elseif dw_1.describe("emp_id.key") = dw_1.object.emp_id.key then 
	mle_1.text += "Succeed ! DataWindow Column Control key ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control key ~r~n"
end if 

//lineremove , rich text only

//moveable 
dw_1.object.emp_id.moveable = '0'
ls_rtv = dw_1.Modify( "emp_id.moveable='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control moveable ~r~n"
elseif dw_1.describe("emp_id.moveable") = dw_1.object.emp_id.moveable then 
	mle_1.text += "Succeed ! DataWindow Column Control moveable ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control moveable ~r~n"
end if 

//multiline , rich text only

//name 
if dw_1.Describe("emp_id.name") = dw_1.object.#1.name then 
	mle_1.text += "Succeed ! DataWindow Column Control name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control name ~r~n"
end if

if dw_1.Describe("#1.name") = dw_1.object.emp_id.name then 
	mle_1.text += "Succeed ! DataWindow Column Control name ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control name ~r~n"
end if

//pointer 
dw_1.object.emp_id.Pointer = 'HyperLink!'
ls_rtv = dw_1.Modify("emp_id.Pointer='" + gs_curdir + "\cursor\H_NE.CUR'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control Pointer  ~r~n"
elseif dw_1.describe("emp_id.Pointer") = dw_1.object.emp_id.Pointer  then 
	mle_1.text += "Succeed ! DataWindow Column Control Pointer  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control Pointer ~r~n"
end if 

//protect 
dw_1.object.emp_id.protect = '1'
ls_rtv = dw_1.Modify("emp_id.protect='0~tif(mod(getrow(),2) = 1 , 1 , 0)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control protect  ~r~n"
elseif dw_1.describe("emp_id.protect") = dw_1.object.emp_id.protect  then 
	mle_1.text += "Succeed ! DataWindow Column Control protect  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control protect ~r~n"
end if 

//resizeable 
dw_1.object.emp_id.resizeable = '0'
ls_rtv = dw_1.Modify("emp_id.resizeable='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control resizeable  ~r~n"
elseif dw_1.describe("emp_id.resizeable") = dw_1.object.emp_id.resizeable  then 
	mle_1.text += "Succeed ! DataWindow Column Control resizeable  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control resizeable ~r~n"
end if 

//righttoleft 

//row_in_detail 

//slideleft 
dw_1.object.emp_id.slideleft = 'NO'
ls_rtv = dw_1.Modify("emp_id.slideleft='Yes'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control slideleft  ~r~n"
elseif dw_1.describe("emp_id.slideleft") = dw_1.object.emp_id.slideleft  then 
	mle_1.text += "Succeed ! DataWindow Column Control slideleft  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control slideleft ~r~n"
end if 

//slideup ,AllAbove /DirectlyAbove/No 
dw_1.object.emp_id.slideup = 'NO'
dw_1.object.emp_id.slideup = 'DirectlyAbove'
ls_rtv = dw_1.Modify("emp_id.slideup='AllAbove'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control slideup  ~r~n"
elseif dw_1.describe("emp_id.slideup") = dw_1.object.emp_id.slideup  then 
	mle_1.text += "Succeed ! DataWindow Column Control slideup  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control slideup ~r~n"
end if 

//tabsequence 
dw_1.object.emp_id.tabsequence = '0'
ls_rtv = dw_1.Modify("emp_id.tabsequence='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control tabsequence  ~r~n"
elseif dw_1.describe("emp_id.tabsequence") = dw_1.object.emp_id.tabsequence  then 
	mle_1.text += "Succeed ! DataWindow Column Control tabsequence  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control tabsequence ~r~n"
end if 

//tag 
dw_1.object.emp_id.tag = '0'
ls_rtv = dw_1.Modify("emp_id.tag='1'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control tag  ~r~n"
elseif dw_1.describe("emp_id.tag") = dw_1.object.emp_id.tag  then 
	mle_1.text += "Succeed ! DataWindow Column Control tag  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control tag ~r~n"
end if 

//type 
if dw_1.Describe("emp_id.type") = dw_1.object.emp_id.type then 
	mle_1.text += "Succeed ! DataWindow Column Control type ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control type ~r~n"
end if

//update 
dw_1.object.emp_id.update = 'no'
ls_rtv = dw_1.Modify("emp_id.update=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control update  ~r~n"
elseif dw_1.describe("emp_id.update") = dw_1.object.emp_id.update  then 
	mle_1.text += "Succeed ! DataWindow Column Control update  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control update ~r~n"
end if 

//updatewhereclause 
dw_1.object.emp_id.updatewhereclause = 'no'
ls_rtv = dw_1.Modify("emp_id.updatewhereclause=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control updatewhereclause  ~r~n"
elseif dw_1.describe("emp_id.updatewhereclause") = dw_1.object.emp_id.updatewhereclause  then 
	mle_1.text += "Succeed ! DataWindow Column Control updatewhereclause  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control updatewhereclause ~r~n"
end if 

//useinternalleading 
dw_1.object.emp_id.useinternalleading = 'no'
ls_rtv = dw_1.Modify("emp_id.useinternalleading=yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control useinternalleading  ~r~n"
elseif dw_1.describe("emp_id.useinternalleading") = dw_1.object.emp_id.useinternalleading  then 
	mle_1.text += "Succeed ! DataWindow Column Control useinternalleading  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control useinternalleading ~r~n"
end if 

//validation , real(gettext())  > 0
dw_1.object.emp_id.validation = 'real(gettext())  > 0'
ls_rtv = dw_1.Modify("emp_id.validation='integer(gettext())>0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control validation  ~r~n"
elseif dw_1.describe("emp_id.validation") = dw_1.object.emp_id.validation  then 
	mle_1.text += "Succeed ! DataWindow Column Control validation  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control validation ~r~n"
end if 

//validationmsg 
dw_1.object.emp_id.validationmsg = 'value should be greater than 0'
ls_rtv = dw_1.Modify("emp_id.validationmsg='Value should be greater than 0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control validationmsg  ~r~n"
elseif dw_1.describe("emp_id.validationmsg") = dw_1.object.emp_id.validationmsg  then 
	mle_1.text += "Succeed ! DataWindow Column Control validationmsg  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control validationmsg ~r~n"
end if 

//values , move to edit

//visible 
dw_1.object.emp_id.visible = 'No'
ls_rtv = dw_1.Modify("emp_id.visible=Yes")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control visible  ~r~n"
elseif dw_1.describe("emp_id.visible") = dw_1.object.emp_id.visible  then 
	mle_1.text += "Succeed ! DataWindow Column Control visible  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control visible ~r~n"
end if 

//width 
dw_1.object.emp_id.width = '300'
ls_rtv = dw_1.Modify("emp_id.width=270")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control width  ~r~n"
elseif dw_1.describe("emp_id.width") = dw_1.object.emp_id.width  then 
	mle_1.text += "Succeed ! DataWindow Column Control width  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control width ~r~n"
end if 

//width.autosize , richtext only

//x 
dw_1.object.emp_id.x = '20'
ls_rtv = dw_1.Modify("emp_id.x=30")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control x  ~r~n"
elseif dw_1.describe("emp_id.x") = dw_1.object.emp_id.x  then 
	mle_1.text += "Succeed ! DataWindow Column Control x  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control x ~r~n"
end if 
//y 
dw_1.object.emp_id.y = '20'
ls_rtv = dw_1.Modify("emp_id.y=30")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control y  ~r~n"
elseif dw_1.describe("emp_id.y") = dw_1.object.emp_id.y  then 
	mle_1.text += "Succeed ! DataWindow Column Control y  ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control y ~r~n"
end if 

//background.color 
//background.mode 
//background.color 
dw_1.object.emp_id.Background.Color = "8388736"
ls_rtv = dw_1.Modify("emp_id.Background.Color='8388736~trgb(255,0,0)'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control Background.Color ~r~n"
elseif dw_1.describe("emp_id.Background.Color") = dw_1.object.emp_id.Background.Color then 
	mle_1.text += "Succeed ! DataWindow Column Control Background.Color ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control Background.Color ~r~n"
end if 

//background.mode 
dw_1.object.emp_id.Background.Mode = "1"
ls_rtv = dw_1.Modify("emp_id.Background.Mode='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control Background.Mode ~r~n"
elseif dw_1.describe("emp_id.Background.Mode") = dw_1.object.emp_id.Background.Mode then 
	mle_1.text += "Succeed ! DataWindow Column Control Background.Mode ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control Background.Mode ~r~n"
end if 

//font.charset 
//font.escapement 
//font.face 
//font.family 
//font.height 
//font.italic 
//font.orientation 
//font.pitch 
//font.strikethrough 
//font.underline 
//font.weight 
//font.width 
//font.charset 
dw_1.object.emp_id.Font.CharSet = "1"
dw_1.object.emp_id.Font.CharSet = "2"

ls_rtv = dw_1.Modify( "emp_id.Font.CharSet	='128'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control Font.CharSet ~r~n"
elseif dw_1.describe("emp_id.Font.CharSet") = dw_1.object.emp_id.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Column Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "emp_id.Font.CharSet	='255'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control Font.CharSet ~r~n"
elseif dw_1.describe("emp_id.Font.CharSet") = dw_1.object.emp_id.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Column Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control Font.CharSet ~r~n"
end if 

ls_rtv = dw_1.Modify( "emp_id.Font.CharSet	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control Font.CharSet ~r~n"
elseif dw_1.describe("emp_id.Font.CharSet") = dw_1.object.emp_id.Font.CharSet then 
	mle_1.text += "Succeed ! DataWindow Column Control Font.CharSet ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control Font.CharSet ~r~n"
end if   

//font.face 
dw_1.object.emp_id.Font.face = "Arial"
ls_rtv = dw_1.Modify( "emp_id.Font.face	='Tahoma'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control Font.face ~r~n"
elseif dw_1.describe("emp_id.Font.face") = dw_1.object.emp_id.Font.face then 
	mle_1.text += "Succeed ! DataWindow Column Control Font.face ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control Font.face ~r~n"
end if 

//font.orientation , Font.Orientation	Same as Escapement.
dw_1.object.emp_id.font.orientation = "900"
ls_rtv = dw_1.Modify("emp_id.font.orientation ='450'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control font.orientation ~r~n"
elseif dw_1.describe("emp_id.font.orientation") = dw_1.object.emp_id.font.orientation then 
	mle_1.text += "Succeed ! DataWindow Column Control font.orientation ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control font.orientation ~r~n"
end if 

//font.escapement 
dw_1.object.emp_id.Font.escapement = "450"
ls_rtv = dw_1.Modify( "emp_id.Font.escapement	='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control Font.escapement ~r~n"
elseif dw_1.describe("emp_id.Font.escapement") = dw_1.object.emp_id.Font.escapement then 
	mle_1.text += "Succeed ! DataWindow Column Control Font.escapement ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control Font.escapement ~r~n"
end if 

//font.family 
i = 0 
for i = 0 to 5
	dw_1.object.emp_id.font.family = string(i)
	ls_rtv = dw_1.Modify("emp_id.font.family='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Column Control font.family ~r~n"
	elseif dw_1.describe("emp_id.font.family") = dw_1.object.emp_id.font.family then 
		mle_1.text += "Succeed ! DataWindow Column Control font.family ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Column Control font.family ~r~n"
	end if 
next

//font.height 
dw_1.object.emp_id.font.height = '100'
ls_rtv = dw_1.Modify("emp_id.font.height ='100'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control font.height ~r~n"
elseif dw_1.describe("emp_id.font.height") = dw_1.object.emp_id.font.height then 
	mle_1.text += "Succeed ! DataWindow Column Control font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control font.height ~r~n"
end if 

dw_1.object.emp_id.font.height = "-10"
ls_rtv = dw_1.Modify("emp_id.font.height ='-10'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control font.height ~r~n"
elseif dw_1.describe("emp_id.font.height") = dw_1.object.emp_id.font.height then 
	mle_1.text += "Succeed ! DataWindow Column Control font.height ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control font.height ~r~n"
end if 

//font.italic 
dw_1.object.emp_id.font.italic = "1"
ls_rtv = dw_1.Modify("emp_id.font.italic =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control font.italic ~r~n"
elseif dw_1.describe("emp_id.font.italic") = dw_1.object.emp_id.font.italic then 
	mle_1.text += "Succeed ! DataWindow Column Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control font.italic ~r~n"
end if 

dw_1.object.emp_id.font.italic = "YEs"
ls_rtv = dw_1.Modify("emp_id.font.italic ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control font.italic ~r~n"
elseif dw_1.describe("emp_id.font.italic") = dw_1.object.emp_id.font.italic then 
	mle_1.text += "Succeed ! DataWindow Column Control font.italic ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control font.italic ~r~n"
end if 

//font.pitch
i = 0 
for i = 0 to 2
	dw_1.object.emp_id.font.pitch = string(i)
	ls_rtv = dw_1.Modify("emp_id.font.pitch='" + string(i) + "'")
	if ls_rtv <> "" then 
		mle_1.text += "Failure ! DataWindow Column Control font.pitch ~r~n"
	elseif dw_1.describe("emp_id.font.pitch") = dw_1.object.emp_id.font.pitch then 
		mle_1.text += "Succeed ! DataWindow Column Control font.pitch ~r~n"
	else
		mle_1.text += "Failure ! DataWindow Column Control font.pitch ~r~n"
	end if 
	
next

//font.strikethrough 
dw_1.object.emp_id.font.strikethrough = "1"
ls_rtv = dw_1.Modify("emp_id.font.strikethrough =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control font.strikethrough ~r~n"
elseif dw_1.describe("emp_id.font.strikethrough") = dw_1.object.emp_id.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Column Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control font.strikethrough ~r~n"
end if 

dw_1.object.emp_id.font.strikethrough = "Yes"
ls_rtv = dw_1.Modify("emp_id.font.strikethrough ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control font.strikethrough ~r~n"
elseif dw_1.describe("emp_id.font.strikethrough") = dw_1.object.emp_id.font.strikethrough then 
	mle_1.text += "Succeed ! DataWindow Column Control font.strikethrough ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control font.strikethrough ~r~n"
end if 

//font.underline 
dw_1.object.emp_id.font.underline = "1"
ls_rtv = dw_1.Modify("emp_id.font.underline =no")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control font.underline ~r~n"
elseif dw_1.describe("emp_id.font.underline") = dw_1.object.emp_id.font.underline then 
	mle_1.text += "Succeed ! DataWindow Column Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control font.underline ~r~n"
end if 

dw_1.object.emp_id.font.underline = "Yes"
ls_rtv = dw_1.Modify("emp_id.font.underline ='0'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control font.underline ~r~n"
elseif dw_1.describe("emp_id.font.underline") = dw_1.object.emp_id.font.underline then 
	mle_1.text += "Succeed ! DataWindow Column Control font.underline ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control font.underline ~r~n"
end if 

//font.weight 
dw_1.object.emp_id.font.weight = "400"
ls_rtv = dw_1.Modify("emp_id.font.weight ='700'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control font.weight ~r~n"
elseif dw_1.describe("emp_id.font.weight") = dw_1.object.emp_id.font.weight then 
	mle_1.text += "Succeed ! DataWindow Column Control font.weight ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control font.weight ~r~n"
end if 

//font.width 
dw_1.object.emp_id.font.width = "30"
ls_rtv = dw_1.Modify("emp_id.font.width ='20'")
if ls_rtv <> "" then 
	mle_1.text += "Failure ! DataWindow Column Control font.width ~r~n"
elseif dw_1.describe("emp_id.font.width") = dw_1.object.emp_id.font.width then 
	mle_1.text += "Succeed ! DataWindow Column Control font.width ~r~n"
else
	mle_1.text += "Failure ! DataWindow Column Control font.width ~r~n"
end if 


//checkbox.3d 
//checkbox.lefttext 
//checkbox.off 
//checkbox.on 
//checkbox.other 
//checkbox.scale 
//checkbox.text 
//checkbox.threed 

Parent.wf_column_checkbox()

//dddw.allowedit 
//dddw.autohscroll 
//dddw.autoretrieve 
//dddw.case 
//dddw.datacolumn 
//dddw.displaycolumn 
//dddw.hscrollbar 
//dddw.hsplitscroll 
//dddw.imemode 
//dddw.limit 
//dddw.lines 
//dddw.name 
//dddw.nilisnull 
//dddw.percentwidth 
//dddw.required 
//dddw.showlist 
//dddw.useasborder 
//dddw.vscrollbar 

Parent.wf_column_dddw()

//ddlb.allowedit 
//ddlb.autohscroll 
//ddlb.case 
//ddlb.imemode 
//ddlb.limit 
//ddlb.nilisnull 
//ddlb.required 
//ddlb.showlist 
//ddlb.sorted 
//ddlb.useasborder 
//ddlb.vscrollbar 

Parent.wf_column_ddlb()

//edit.autohscroll 
//edit.autoselect 
//edit.autovscroll 
//edit.case 
//edit.codetable 
//edit.displayonly 
//edit.focusrectangle 
//edit.format 
//edit.hscrollbar 
//edit.imemode 
//edit.limit 
//edit.name 
//edit.nilisnull 
//edit.password 
//edit.required 
//edit.style 
//edit.validatecode 
//edit.vscrollbar 

parent.wf_column_edit()

//editmask.autoskip 
//editmask.codetable 
//editmask.focusrectangle 
//editmask.imemode 
//editmask.mask 
//editmask.readonly 
//editmask.required 
//editmask.spin 
//editmask.spinincr 
//editmask.spinrange 
//editmask.useformat 

parent.wf_column_editmask()

//radiobuttons.3d 
//radiobuttons.columns 
//radiobuttons.lefttext 
//radiobuttons.scale 
//radiobuttons.threed 

parent.wf_column_rb()

mle_1.Scroll (1000)
end event

