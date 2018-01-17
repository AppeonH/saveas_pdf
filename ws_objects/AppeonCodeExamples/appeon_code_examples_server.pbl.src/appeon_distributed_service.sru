$PBExportHeader$appeon_distributed_service.sru
forward
global type appeon_distributed_service from nonvisualobject
end type
end forward

global type appeon_distributed_service from nonvisualobject
event activate pbm_component_activate
event deactivate pbm_component_deactivate
end type
global appeon_distributed_service appeon_distributed_service

type variables
string is_forbidip
string is_return="appeon_distributed_service's variable"
end variables

forward prototypes
public subroutine of_log (string as_logcontext)
public function string of_dynsqlformat4 (string as_empid)
public function string of_getforbidip ()
public function integer of_ipisforbid (string as_ip)
public function string of_parseip (string as_ip)
public function integer of_setforbidip (string as_ip)
public function blob of_retrieve (string as_dataobject)
public function integer of_update (string as_dataobject, blob ab_syntax)
end prototypes

event activate;/*------------------------------------^_^----------------------------------------

Event Name    : activate()

Description   : Connectin DataBase

Parameter     : None
				  
Author        : HuangYiFei

Date          : 2003-09-18

Return Value  : none

CopyRight 2003----???? Appeon Inc.
--------------------------------------^_^----------------------------------------*/

//Connect Database
sqlca.DBMS = "JDBC"
sqlca.AutoCommit = false
sqlca.DBParm = "CacheName='appeonsample'"
Connect Using sqlca;

//write log file for connection database
if sqlca.sqlcode<>0 then
	of_log("Connection 'appeonsample' Failed for Appeon Code Examples!")
else
	of_log("Connection 'appeonsample' Success for Appeon Code Examples!")
end if
end event

event deactivate;/*------------------------------------^_^----------------------------------------

Event Name    : deactivate()

Description   : disconnect database to release resource

Parameter     : None
				  
Author        : HuangYiFei

Date          : 2003-09-18

Return Value  : none

CopyRight 2003----???? Appeon Inc.
--------------------------------------^_^----------------------------------------*/

disconnect using sqlca;
end event

public subroutine of_log (string as_logcontext);/*------------------------------------^_^----------------------------------------

Function Name : of_log(string as_logcontext)

Description   : write log file (easerver\bin\jaguar.log)

Parameter     : as_logcontext ---- log context
				  
Author        : HuangYiFei

Date          : 2003-09-18

Return Value  : none

CopyRight 2003----???? Appeon Inc.
--------------------------------------^_^----------------------------------------*/
ErrorLogging Err_Service

this.GetContextService("ErrorLogging",Err_Service)
Err_Service.log(as_logcontext)
end subroutine

public function string of_dynsqlformat4 (string as_empid);string ls_employeeid,ls_fname,ls_lname,sqlstatement
Long ll_employeeid
ll_employeeid=Long(as_empid)

sqlstatement = "SELECT emp_fname,emp_lname FROM employee WHERE emp_id = ?"
PREPARE SQLSA FROM :sqlstatement;
DESCRIBE SQLSA INTO SQLDA; 
DECLARE DynamicCur4 DYNAMIC CURSOR FOR SQLSA;
SetDynamicParm(SQLDA, 1, ll_employeeid)
OPEN DYNAMIC DynamicCur4 USING DESCRIPTOR SQLDA ;
FETCH  DynamicCur4  USING DESCRIPTOR SQLDA;
ls_fname = SQLDA.GetDynamicString(1)
ls_lname = SQLDA.GetDynamicString(2)
close DynamicCur4;

return ls_fname + " " + ls_lname
end function

public function string of_getforbidip ();////////////////////////////////////////////////////////////////////////////////
//	Function :  of_getForbidIp
//
//	Access:  public
//
//	Returns:  string
//
//	Description:  
// Get the forbid IP Address
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//	
////////////////////////////////////////////////////////////////////////////////
//
//	Copyright ? 2001-2003 Appeon, Inc. and its subsidiaries.  All rights reserved.
//////////////////////////////////////////////////////////////////
return is_forbidip
end function

public function integer of_ipisforbid (string as_ip);//////////////////////////////////////////////////////////////////////////////
//	Function : of_ipIsForbid
//
//	Access:  public
//
//	Returns:  int 
//               -1   ip is not forbid
//                1   ip is forbid
//	Description:  
// check Whether  IP Address is forbid
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//	
////////////////////////////////////////////////////////////////////////////////
//
//	Copyright ? 2001-2003 Appeon, Inc. and its subsidiaries.  All rights reserved.
//////////////////////////////////////////////////////////////////
integer li_rv
li_rv=-1
if of_getforbidip()=of_parseIp(as_ip) then
	li_rv=1
end if	

return li_rv



end function

public function string of_parseip (string as_ip);//////////////////////////////////////////////////////////////////////////////
//	Function :  of_parseIp
//
//	Access:  public
//
//	Returns:  string  ip address
//             
//	Description:  
// parse  ip      192.0.1.24 return 129000001024         192.212.123.123 retrun 192212123123
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//	
////////////////////////////////////////////////////////////////////////////////
//
//	Copyright ? 2001-2003 Appeon, Inc. and its subsidiaries.  All rights reserved.
//////////////////////////////////////////////////////////////////

string ls_ip,ls_sub
int li_pos,li_i

li_pos=PosA(as_ip,".")
if li_pos>0 then
	do while li_pos>0
		ls_sub=string(integer(LeftA(as_ip,li_pos -1)),"000")
//	 	for li_i=1 to 3 - (li_pos -1)
//	  		ls_sub ="0"+ls_sub
//    	next
	 	ls_ip+=ls_sub
	 	as_ip=MidA(as_ip,li_pos +1,LenA(as_ip))
	 	li_pos=PosA(as_ip,".")
	loop	
	ls_sub=string(integer(LeftA(as_ip,3)),"000")
//	for li_i=1 to 3 - len(as_ip)
//	  	ls_sub ="0"+ls_sub
//   next
	ls_ip+=ls_sub
else
	ls_ip=as_ip
end if	

return ls_ip



end function

public function integer of_setforbidip (string as_ip);////////////////////////////////////////////////////////////////////////////////
//	Function :  of_setForbidIp
//
//	Access:  public
//
//	Arguments:		
//	 string	as_iP:
//
//	Returns:  integer
//
//	Description:  
// Set the forbid IP Address
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//	
////////////////////////////////////////////////////////////////////////////////
//
//	Copyright ? 2001-2003 Appeon, Inc. and its subsidiaries.  All rights reserved.
//////////////////////////////////////////////////////////////////
is_forbidip=of_parseIp(as_ip)
return 1
end function

public function blob of_retrieve (string as_dataobject);/*------------------------------------^_^----------------------------------------

Function Name : of_retrieve(string as_dataobject)

Description   : retrieve data for special dataobject

Parameter     : as_dataobject ---- special dataobject
				  
Author        : HuangYiFei

Date          : 2003-09-18

Return Value  : datawindow data

CopyRight 2003----???? Appeon Inc.
--------------------------------------^_^----------------------------------------*/
blob lb_syntax
appeondatastore ads

ads=create appeondatastore

ads.dataobject=as_dataobject
ads.settransobject(sqlca)
ads.retrieve()
if sqlca.sqlcode<>0 then
	of_log(sqlca.sqlerrtext)
end if
ads.getfullstate(lb_syntax)

destroy ads
return lb_syntax
end function

public function integer of_update (string as_dataobject, blob ab_syntax);/*------------------------------------^_^----------------------------------------

Function Name : of_update(string as_dataobject,String as_syntax)

Description   : update data for special dataobject and syntax

Parameter     : as_dataobject ---- special dataobject
                as_syntax     ---- special syntax data
					 ai_type       ---- type for set data
				  
Author        : HuangYiFei

Date          : 2003-09-18

Return Value  : Returns 1 if it succeeds and -1 if an error occurs

CopyRight 2003----???? Appeon Inc.
--------------------------------------^_^----------------------------------------*/
appeondatastore ads
long ll_rtn

ads=create appeondatastore

ads.dataobject=as_dataobject
ads.settransobject(sqlca)

ads.setchanges(ab_syntax)
ll_rtn=ads.update()

if ll_rtn<>1 then
	of_log(sqlca.sqlerrtext)
	rollback using sqlca;
else
	of_log("Update Sucess!")
	commit using sqlca;
end if

destroy ads
return ll_rtn
	
end function

on appeon_distributed_service.create
call super::create
TriggerEvent( this, "constructor" )
end on

on appeon_distributed_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

