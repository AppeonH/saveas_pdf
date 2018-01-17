$PBExportHeader$n_timing.sru
forward
global type n_timing from timing
end type
end forward

global type n_timing from timing
end type
global n_timing n_timing

type variables
singlelineedit isle_text
end variables

forward prototypes
public function integer of_start (double ad_interval, ref singlelineedit asle_text)
end prototypes

public function integer of_start (double ad_interval, ref singlelineedit asle_text);isle_text = asle_text
this.Event Timer()

Return Start(ad_Interval)
end function

on n_timing.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_timing.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;isle_text.Text = String(Now(), "hh:mm:ss")
end event

