$PBExportHeader$n_ir_msg.sru
forward
global type n_ir_msg from internetresult
end type
end forward

global type n_ir_msg from internetresult
end type
global n_ir_msg n_ir_msg

type variables
blob ib_Data
end variables

forward prototypes
public function integer internetdata (blob data)
public function blob uf_gethtml ()
end prototypes

public function integer internetdata (blob data);ib_Data = data

Return 1

end function

public function blob uf_gethtml ();Return ib_Data
end function

on n_ir_msg.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_ir_msg.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

