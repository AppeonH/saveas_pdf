$PBExportHeader$uo_memory.sru
forward
global type uo_memory from nonvisualobject
end type
end forward

global type uo_memory from nonvisualobject
end type
global uo_memory uo_memory

type prototypes
//getfreememory
Subroutine GlobalMemoryStatus (ref str_memorystatus memorystatus ) Library "KERNEL32.DLL"

Function ulong GetProcessMemory() Library "MemTest.DLL"

Function ulong GetProcessID() Library "MemTest.DLL"

// Following are NOT used in APPS
Function long GetCurrentProcess () Library "KERNEL32.DLL"

Function long GetModuleHandleA(string modname) Library "KERNEL32.DLL"

Function long GetCurrentProcessId() Library "KERNEL32.DLL"

end prototypes

type variables

end variables

forward prototypes
public function long of_getprocessmemory ()
public function long of_getprocessid ()
public function str_memorystatus of_getmemorystatus ()
end prototypes

public function long of_getprocessmemory ();// Used to get memory used by the current process

Return GetProcessMemory()
end function

public function long of_getprocessid ();
// Returns the current Process ID

Return GetProcessID()
end function

public function str_memorystatus of_getmemorystatus ();
//Gives the memory statistics.. Physical, Virtual etc.

str_memoryStatus lstr_memoryStatus

GlobalMemoryStatus(lstr_memoryStatus)

Return lstr_memoryStatus
end function

on uo_memory.create
TriggerEvent( this, "constructor" )
end on

on uo_memory.destroy
TriggerEvent( this, "destructor" )
end on

