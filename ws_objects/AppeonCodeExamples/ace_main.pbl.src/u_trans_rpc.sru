$PBExportHeader$u_trans_rpc.sru
forward
global type u_trans_rpc from transaction
end type
end forward

global type u_trans_rpc from transaction
end type
global u_trans_rpc u_trans_rpc

type prototypes
subroutine sp_rpc_call(long dept_id,decimal pct) RPCFUNC ALIAS FOR "~"dba~".~"sp_rpc_call~""

end prototypes

on u_trans_rpc.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_trans_rpc.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

