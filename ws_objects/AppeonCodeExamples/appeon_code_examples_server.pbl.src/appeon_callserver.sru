$PBExportHeader$appeon_callserver.sru
forward
global type appeon_callserver from nonvisualobject
end type
end forward

global type appeon_callserver from nonvisualobject
end type
global appeon_callserver appeon_callserver

type prototypes
Function uint GetWindowsDirectory(ref string lpBuffer,uint uSize) alias for "GetWindowDirectoryA;Ansi" Library "kernel32.dll"
Function uint GetSystemDirectory(ref string lpBuffer,uint uSize) alias for "GetSystemDirectoryA;Ansi" Library "kernel32.dll"
Function ulong GetCurrentDirectory(ulong nBufferLength,ref string lpBuffer) alias for "GetCurrentDirectoryA;Ansi" Library "kernel32.dll"
Function boolean GetUserName(ref string lpBuffer, ref ulong nSize) alias for "GetUserNameA;Ansi" library "advapi32.dll"
end prototypes

type variables

end variables

forward prototypes
public function string of_callothernvovar ()
public function string of_callothernvofun ()
public function string of_calldll (string as_arg)
public subroutine of_log (string as_logcontext)
public function string of_systemfunction (string as_function)
public function string of_callcorba ()
public function string of_ejb ()
end prototypes

public function string of_callothernvovar ();appeon_distributed_service luo_nvo
luo_nvo = create appeon_distributed_service
return luo_nvo.is_return
destroy luo_nvo

end function

public function string of_callothernvofun ();return of_systemfunction('GetCurrentDirectory')
end function

public function string of_calldll (string as_arg);string ls_rv
ulong lul_length = 255
ls_rv=space(255)
choose case as_arg	
	case 'GetUserName'
      GetUserName(ls_rv,lul_length)
	case 'GetSystemDirectory'
		GetSystemDirectory(ls_rv,lul_length)
	case 'GetCurrentDirectory'
		GetCurrentDirectory(lul_length,ls_rv)
end choose
return ls_rv

end function

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

public function string of_systemfunction (string as_function);string ls
environment env
integer rtn
choose case as_function	
	case 'Randomize'
		   ls = string(Randomize(0))
	case 'GetCurrentDirectory'
		   ls = GetCurrentDirectory()
	case 'GetEnvironment'	      
			rtn = GetEnvironment(env)
         IF rtn <> 1 THEN ls='GetEnvironment is wrong'
         CHOOSE CASE env.OSType
             CASE Windows!, WindowsNT!
                 ls = "Your OSType is Windows"
				case else
					  ls = "Your OSType is not Windows"
       END CHOOSE
end choose
return ls

end function

public function string of_callcorba ();long    ll_rc
string  ls_rtnval 
corbatest luo_corba
TransactionServer ts

ll_rc = GetContextService("TransactionServer", ts)
IF ll_rc <> 1 THEN
 return "Create TransactionServer object failed!"
END IF

ll_rc = ts.CreateInstance(luo_corba, "CorbaTest/CorbaTest")  
IF ll_rc <> 0 THEN
   destroy ts   
   return "Create instance failed!"
END IF 

ls_rtnval =luo_corba.Echo("Test corba component success!")

destroy ts
destroy luo_corba
RETURN ls_rtnval
end function

public function string of_ejb ();long ll_result
helloworld iu_helloworld
helloworldhome iu_helloworldhome
TransactionServer ts
string ls

ll_result = GetContextService("TransactionServer", ts)
IF ll_result <> 1 THEN
 return "ConnectToServer Failed"
END IF

ll_result = ts.lookup(iu_helloworldhome, "ejbtest/HelloWorld", "com.appeon.ejbtest.HelloWorldHome")
IF ll_result <> 0 THEN
   ls = "EJB Component Lookup failed" 
ELSE
  TRY
      iu_helloworld = iu_helloworldhome.create() 	
		ls = iu_helloworld.gethello()
   CATCH (ctscomponents_createexception ce)
      ls = "Create exception: " + ce.getmessage()
  END TRY
END IF

destroy iu_helloworld
destroy iu_helloworldhome
destroy ts

return ls
end function

on appeon_callserver.create
call super::create
TriggerEvent( this, "constructor" )
end on

on appeon_callserver.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

