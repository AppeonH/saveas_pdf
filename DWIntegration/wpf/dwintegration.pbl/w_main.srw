forward
global type w_main from window
end type
type mdi_1 from mdiclient within w_main
end type
end forward


global type w_main from window 
string menuname = "m_1"

mdi_1 mdi_1 
end type


global w_main w_main

on w_main.create
if this.MenuName = "m_1" then this.MenuID = create m_1
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_main 

end type

