forward
global type w_2 from window
end type
type uo_1 from vo_custom within w_2
end type
type cb_1 from commandbutton within w_2
end type
end forward


global type w_2 from window 

uo_1 uo_1 
cb_1 cb_1 
end type


global w_2 w_2

on w_2.create
this.uo_1=create uo_1
this.cb_1=create cb_1
this.Control[]={this.uo_1,&
this.cb_1}
end on

on w_2.destroy
destroy(this.uo_1)
destroy(this.cb_1)
end on

type uo_1 from vo_custom within w_2 

end type



on uo_1.destroy
call vo_custom::destroy
end on

type cb_1 from commandbutton within w_2 

end type


event clicked;close(w_2)
end event
