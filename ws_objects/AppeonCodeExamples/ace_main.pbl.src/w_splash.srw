$PBExportHeader$w_splash.srw
$PBExportComments$Splash screen displayed on startup
forward
global type w_splash from window
end type
type p_splash from picture within w_splash
end type
end forward

global type w_splash from window
integer x = 457
integer y = 580
integer width = 2299
integer height = 1352
boolean border = false
windowtype windowtype = popup!
long backcolor = 16777215
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
p_splash p_splash
end type
global w_splash w_splash

type prototypes
end prototypes

on w_splash.destroy
destroy(this.p_splash)
end on

on w_splash.create
this.p_splash=create p_splash
this.Control[]={this.p_splash}
end on

type p_splash from picture within w_splash
integer width = 2295
integer height = 1348
string picturename = "appeon.jpg"
boolean focusrectangle = false
end type

