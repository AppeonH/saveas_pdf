forward
global type w_3 from window
end type
type cb_1 from commandbutton within w_3
end type
end forward


global type w_3 from window 

cb_1 cb_1 
end type


global w_3 w_3

on w_3.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_3.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_3 

end type


event clicked;close(w_3)
end event
