forward
global type w_4 from window
end type
type uo_1 from vo_custom within w_4
end type
type cb_1 from commandbutton within w_4
end type
end forward


global type w_4 from window 

uo_1 uo_1 
cb_1 cb_1 
end type


global w_4 w_4

on w_4.create
this.uo_1=create uo_1
this.cb_1=create cb_1
this.Control[]={this.uo_1,&
this.cb_1}
end on

on w_4.destroy
destroy(this.uo_1)
destroy(this.cb_1)
end on

event open;boolean iw_4
end event

type uo_1 from vo_custom within w_4 

end type



on uo_1.destroy
call vo_custom::destroy
end on

type cb_1 from commandbutton within w_4 

end type


event clicked;close(w_4)
end event
