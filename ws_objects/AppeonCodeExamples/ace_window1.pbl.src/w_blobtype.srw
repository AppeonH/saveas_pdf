$PBExportHeader$w_blobtype.srw
forward
global type w_blobtype from window
end type
type em_1 from editmask within w_blobtype
end type
type mle_output from multilineedit within w_blobtype
end type
type cb_4 from commandbutton within w_blobtype
end type
type p_1 from picture within w_blobtype
end type
type lb_2 from listbox within w_blobtype
end type
type lb_1 from listbox within w_blobtype
end type
type cb_3 from commandbutton within w_blobtype
end type
type cb_2 from commandbutton within w_blobtype
end type
type cb_1 from commandbutton within w_blobtype
end type
type gb_1 from groupbox within w_blobtype
end type
type gb_2 from groupbox within w_blobtype
end type
type gb_3 from groupbox within w_blobtype
end type
type gb_4 from groupbox within w_blobtype
end type
end forward

global type w_blobtype from window
integer width = 2181
integer height = 1696
boolean titlebar = true
string title = "Blob Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_scriptexe ( integer ai_fun,  integer ai_pam )
em_1 em_1
mle_output mle_output
cb_4 cb_4
p_1 p_1
lb_2 lb_2
lb_1 lb_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_blobtype w_blobtype

type variables
int ii_index
end variables

forward prototypes
public subroutine wf_output (string as_mess, boolean ab_clear)
public function blob wf_read_pic (string as_picname)
end prototypes

event ue_scriptexe(integer ai_fun, integer ai_pam);//====================================================================
// Event: ue_scriptexe()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value		integer		ai_fun	
//		value		integer		ai_pam
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/10/15
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

string ls_item,ls_parm,ls_p1,ls_p2,ls_p3,ls_rtn,ls_temp
Blob	lblb_bb,lblb_temp
Blob{100} lblb_data
ulong lul_edit,lul_end
long ll_pos,ll_rtn,ll_lpos,ll_temp
//any la_temp
DateTime ldt_dtp,ldt_time
int n,l,li_p
date ld_dp,ldt_temp
double ldb_p,ld_temp
time lt_p,lt_time

IF ai_fun <1  THEN 
	Messagebox('Warning','Please select testing function')
	lb_1.SetFocus()
	RETURN
END IF	

IF ai_pam <1 and lb_2.totalitems() > 0 THEN
	Messagebox('Warning','Please select testing parameter')
	lb_2.SetFocus()
	Return
END IF

ls_item = lb_1.text(ai_fun)
ls_parm = lb_2.text(ai_pam)


CHOOSE CASE ls_item
	CASE	'Blob'
				wf_output('lblb_bb = Blob('+ls_parm+')',True)
				ls_parm = MidA(ls_parm,2,(LenA(ls_parm) - 2))
				lblb_bb = Blob(ls_parm)
				wf_output('String(lblb_bb) = "'+string(lblb_bb)+'"',False)
	CASE	'BlobEdit'
			ll_pos = LastPos(ls_parm,',')			
			ls_temp= trim(MidA(ls_parm,(ll_pos + 2)))
			ls_p3 = ls_temp
		   				
			CHOOSE CASE ai_pam
				CASE	1	
					   ls_temp =MidA(ls_temp,2,(LenA(string(ls_temp)) - 2))						
						lul_edit = BlobEdit(lblb_data,1,ls_temp)
						ls_p1 = '"' + string(BlobMid(lblb_data,1,lul_edit)) + '"'
						ls_p2 ='string'
				CASE	2
					   ll_temp = integer(ls_temp)						
					   lul_edit = BlobEdit(lblb_data,2,ll_temp)
						ls_p1 = string(integer(BlobMid(lblb_data,2,lul_edit)))	
						ls_p2 ='intger'
				CASE  3
					   em_1.text = ls_temp
						em_1.getdata(ldt_dtp)
						ldt_temp = date(ldt_dtp)
					   lul_edit = BlobEdit(lblb_data,3,ldt_temp)	
						ls_p1 = string(date(BlobMid(lblb_data,3,lul_edit)),'yyyy-mm-dd')
						ls_p2 = 'date'
				CASE  4
					   em_1.text = ls_temp
						em_1.getdata(ldt_dtp)
						ldt_time = ldt_dtp
					   lul_edit = BlobEdit(lblb_data,4,ldt_time)	
						ls_p1 = string(datetime(BlobMid(lblb_data,4,lul_edit)),'yyyy-mm-dd hh:mm:ss')
						ls_p2 ='datetime'
				CASE  5
					   ld_temp = double(ls_temp)
						lul_edit = BlobEdit(lblb_data,5,ld_temp)
						ls_p1 = string(double(BlobMid(lblb_data,5,lul_edit)))
						ls_p2 = 'double'
				CASE  6
					   lt_time = time(ls_temp)
					   lul_edit = BlobEdit(lblb_data,6,lt_time)
						ls_p1 = string(time(BlobMid(lblb_data,6,lul_edit)))
						ls_p2 = 'time'
			END CHOOSE
				wf_output('lul_edit = BlobEdit(lblb_data, ' +string(ai_pam)+', '+ls_p3+')',True)				
				wf_output('Return Value is '+string(lul_edit),False)
				wf_output('String('+ls_p2+'(BlobMid(lblb_data,'+string(ai_pam)+','+string(lul_edit)+'))) = '+string(ls_p1),False)
	CASE	'BlobMid'
			ll_pos = PosA(ls_parm,',')
			ll_lpos =LastPos(ls_parm,',')
			ls_p1 = LeftA(ls_parm,(ll_pos - 1))
			
			CHOOSE CASE ai_pam
				CASE 1	
					//		  lb_2.additem( 'Any Text, 1')
					  ls_p2 = RightA(ls_parm,1)	
					  
					  n = integer(ls_p2)
					  lul_edit = BlobEdit(lblb_data,1,ls_p1)
					  lblb_bb = BlobMid(lblb_data,n)  
					  wf_output('String(lblb_data) = ' + ls_p1 + '', True)
					  wf_output('lblb_bb = BlobMid(lblb_data, ' + ls_p2 + ')',False)
					  wf_output('Return Value is ' + String(lblb_bb) + '',False)	
				CASE 2
					//		  lb_2.additem( 'B5, 2, 2')
					  ls_p2 = MidA(ls_parm,(ll_lpos - 1),1)
					  ls_p3 = RightA(ls_parm,1)			 
					  
					  li_p = integer(RightA(ls_p1,1))
					  lblb_temp = Blob(LeftA(ls_p1,1))
					  
					  lul_edit = BlobEdit(lblb_data,1,lblb_temp)	
					  lul_end= BlobEdit(lblb_data,lul_edit,li_p)
					  
					  lblb_bb = BlobMid(lblb_data,lul_edit,lul_end)
					  wf_output('String(lblb_data) = ' + ls_p1, True)
					  wf_output('lblb_bb = BlobMid(lblb_data, ' + ls_p2 +', ' + ls_p3 + ')',False)
					  wf_output('Return Value is ' + String(integer(lblb_bb)),False)	
					  
				CASE 3
					//		  lb_2.additem( 'B 2004-10-15, 3, 10')
					  ls_p2 = MidA(ls_parm,(ll_lpos - 1),1)
					  ls_p3 = RightA(ls_parm,2)					  
					  
					  em_1.text = RightA(ls_p1,10)
					  em_1.getdata(ldt_dtp)
					  ld_dp = date(ldt_dtp)
					  
					  lblb_temp = Blob(LeftA(ls_p1,2))
					  
					  lul_edit = BlobEdit(lblb_data,1,lblb_temp)
					  lul_end = BlobEdit(lblb_data,lul_edit,ld_dp)
					  
					  lblb_bb = BlobMid(lblb_data,lul_edit,lul_end)
					  
					  wf_output('String(lblb_data) = ' + ls_p1, True)
					  wf_output('lblb_bb = BlobMid(lblb_data, ' + ls_p2 +', ' + ls_p3 + ')',False)
					  wf_output('Return Value is ' + String(Date(lblb_bb),'yyyy-mm-dd'),False)
					  
				CASE 4
					//		  lb_2.additem( 'B*2004-10-15 10:20:09, 8, 11')
					  ls_p2 = MidA(ls_parm,(ll_lpos - 1),1)
					  ls_p3 = RightA(ls_parm,2)					  
					  
					  em_1.text =RightA(ls_p1,19)
					  em_1.getdata(ldt_dtp)
					  
					  lblb_temp = Blob(LeftA(ls_p1,2))
					  
					  lul_edit = BlobEdit(lblb_data,1,lblb_temp)
					  lul_end = BlobEdit(lblb_data,lul_edit,ldt_dtp)
					  
					  lblb_bb = BlobMid(lblb_data,lul_edit,lul_end)
					  
					  wf_output('String(lblb_data) = ' + ls_p1, True)
					  wf_output('lblb_bb = BlobMid(lblb_data, ' + ls_p2 +', ' + ls_p3 + ')',False)
					  wf_output('Return Value is ' + String(Date(lblb_bb),'yyyy-mm-dd hh:mm:ss'),False)
					  
				CASE 5
					//		  lb_2.additem( 'B%2344.56, 5, 4')
					  ls_p2 = MidA(ls_parm,(ll_lpos - 1),1)
					  ls_p3 = RightA(ls_parm,2)
					  
					  ldb_p = double(RightA(ls_p1,7))
					  
					  lblb_temp = Blob(LeftA(ls_p1,2))
					  
					  lul_edit = BlobEdit(lblb_data,1,lblb_temp)
					  lul_end = BlobEdit(lblb_data,lul_edit,ldb_p)
					  
					  lblb_bb = BlobMid(lblb_data,lul_edit,lul_end)
					  
					  wf_output('String(lblb_data) = ' + ls_p1, True)
					  wf_output('lblb_bb = BlobMid(lblb_data, ' + ls_p2 +', ' + ls_p3 + ')',False)
					  wf_output('Return Value is ' + String(double(lblb_bb)),False)
					  
				CASE 6
					//		  lb_2.additem( 'B&E^@~R~T10:20:09, 6')
					  ls_p2 = RightA(ls_parm,2)					 
					  
					  lt_p = Time(RightA(ls_p1,8))
					  
					  lblb_Temp = Blob(LeftA(ls_p1,9))
					  
					  lul_edit = BlobEdit(lblb_data,1,lblb_temp)
					  lul_end = BlobEdit(lblb_data,lul_edit,lt_p)
					  
					  lblb_bb = BlobMid(lblb_data,lul_edit) //,lul_end
					  
					  wf_output('String(lblb_data) = ' + ls_p1, True)
					  wf_output('lblb_bb = BlobMid(lblb_temp, ' + ls_p2 + ')',False)
					  wf_output('Return Value is ' + String(time(lblb_bb)),False)
					  
			END CHOOSE				
					
	CASE	'Len'

        CHOOSE CASE ai_pam
					CASE 1
						//		  lb_2.additem( 'Any Text')
						lblb_temp = Blob(ls_parm)
						lul_edit = BlobEdit(lblb_data,1,lblb_temp)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
		  				ll_rtn = LenA(lblb_bb)
		  				wf_output('ll_rtn = Len(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(lblb_bb),False)
		  				wf_output('Return Value is '+string(ll_rtn),False)
					CASE 2
						//		  lb_2.additem( '5')
						li_p = integer(ls_parm)
						lul_edit = BlobEdit(lblb_data,1,li_p)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
		  				ll_rtn = LenA(lblb_bb)
		  				wf_output('ll_rtn = Len(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(integer(lblb_bb)),False)
		  				wf_output('Return Value is '+string(ll_rtn),False)
					CASE 3
						//		  lb_2.additem( '2004-10-15')
						em_1.text = ls_parm
						em_1.getdata(ldt_dtp)
						ld_dp = date(ldt_dtp)
						
						lul_edit = BlobEdit(lblb_data,1,ld_dp)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
		  				ll_rtn = LenA(lblb_bb)
		  				wf_output('ll_rtn = Len(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(date(lblb_bb),'yyyy-mm-dd'),False)
		  				wf_output('Return Value is '+string(ll_rtn),False)
					CASE 4
						//		  lb_2.additem( '2004-10-15 10:20:09')
						em_1.text = ls_parm
						em_1.getdata(ldt_dtp)						
						
						lul_edit = BlobEdit(lblb_data,1,ldt_dtp)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
		  				ll_rtn = LenA(lblb_bb)
		  				wf_output('ll_rtn = Len(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(datetime(lblb_bb),'yyyy-mm-dd hh:mm:ss'),False)
		  				wf_output('Return Value is '+string(ll_rtn),False)
					CASE 5
						//		  lb_2.additem( '2344.56')
						ldb_p = double(ls_parm)
						lul_edit = BlobEdit(lblb_data,1,ldb_p)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
						ll_rtn = LenA(lblb_bb)
		  				wf_output('ll_rtn = Len(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(double(lblb_bb)),False)
		  				wf_output('Return Value is '+string(ll_rtn),False)
					CASE 6
						//		  lb_2.additem( '10:20:09')
						lt_p = time(ls_parm)
						lul_edit = BlobEdit(lblb_data,1,lt_p)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
						ll_rtn = LenA(lblb_bb)
		  				wf_output('ll_rtn = Len(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(time(lblb_bb)),False)
		  				wf_output('Return Value is '+string(ll_rtn),False)  
		  END CHOOSE        
		  
	CASE	'String'	
		
		  CHOOSE CASE ai_pam
					CASE 1
						//		  lb_2.additem( 'Any Text')
						lblb_temp = Blob(ls_parm)
						lul_edit = BlobEdit(lblb_data,1,lblb_temp)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
		  				ls_rtn = String(lblb_bb)
		  				wf_output('ls_rtn = String(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(lblb_bb),False)
		  				wf_output('Return Value is '+string(ls_rtn),False)
					CASE 2
						//		  lb_2.additem( '5')
						li_p = integer(ls_parm)
						lul_edit = BlobEdit(lblb_data,1,li_p)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
		  				ls_rtn = string(integer(lblb_bb))
		  				wf_output('ls_rtn = String(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(integer(lblb_bb)),False)
		  				wf_output('Return Value is '+string(ls_rtn),False)
					CASE 3
						//		  lb_2.additem( '2004-10-15')
						em_1.text = ls_parm
						em_1.getdata(ldt_dtp)
						ld_dp = date(ldt_dtp)
						
						lul_edit = BlobEdit(lblb_data,1,ld_dp)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
		  				ls_rtn = string(date(lblb_bb),'yyyy-mm-dd')
		  				wf_output('ls_rtn = String(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(date(lblb_bb),'yyyy-mm-dd'),False)
		  				wf_output('Return Value is '+string(ls_rtn),False)
					CASE 4
						//		  lb_2.additem( '2004-10-15 10:20:09')
						em_1.text = ls_parm
						em_1.getdata(ldt_dtp)						
						
						lul_edit = BlobEdit(lblb_data,1,ldt_dtp)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
		  				ls_rtn = string(datetime(lblb_bb),'yyyy-mm-dd hh:mm:ss')
		  				wf_output('ls_rtn = String(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(datetime(lblb_bb),'yyyy-mm-dd hh:mm:ss'),False)
		  				wf_output('Return Value is '+string(ls_rtn),False)
					CASE 5
						//		  lb_2.additem( '2344.56')
						ldb_p = double(ls_parm)
						lul_edit = BlobEdit(lblb_data,1,ldb_p)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
						ls_rtn = string(double(lblb_bb)) 
						wf_output('ls_rtn = String(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(double(lblb_bb)),False)
		  				wf_output('Return Value is '+string(ls_rtn),False)
					CASE 6
						//		  lb_2.additem( '10:20:09')
						lt_p = time(ls_parm)
						lul_edit = BlobEdit(lblb_data,1,lt_p)
		  				lblb_bb = BlobMid(lblb_data,1,lul_edit)
						ls_rtn = String(time(lblb_bb))  
						wf_output('ls_rtn = String(lblb_bb)',True)
		  				wf_output('String(lblb_bb) = '+string(time(lblb_bb)),False)
		  				wf_output('Return Value is '+string(ls_rtn),False) 
		  END CHOOSE		  
	
END CHOOSE
end event

public subroutine wf_output (string as_mess, boolean ab_clear);////////////////////////////////////////////////////////////////
//Function : Wf_OutPut
//Argument : String   as_mess;   The Message you will output 
//				 Boolean  ab_clear;  Clear Flag
//Output   : None
//Designer : 
//Date     :
////////////////////////////////////////////////////////////////

If ab_clear Then
	mle_output.Text = ""
	ii_index = 0
End IF	

mle_output.Text += String(ii_index) + "." + as_mess + "~r~n"

ii_index ++
end subroutine

public function blob wf_read_pic (string as_picname);//====================================================================
// function: wf_read_pic
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string as_picname	
//--------------------------------------------------------------------
// Returns: blob
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/10/15
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
blob lblb_pic,lblb_temp
long ll_fh,ll_length,ll_loops,i,ll_read

ll_length = FileLength(as_picname)
ll_fh = FileOpen(as_picname, StreamMode!)

if ll_length > 32765 then 
	if mod(ll_length,32765) = 0 then
		ll_loops = ll_length / 32765
	else
		ll_loops = (ll_length / 32765) + 1
	end if
else
	ll_loops = 1
end if

IF ll_fh <> -1 THEN
	for i = 1 to ll_loops
		 ll_read = FileRead(ll_fh, lblb_temp)
		 lblb_pic += lblb_temp
	next	
END IF
fileclose(ll_fh)


return lblb_pic
end function

on w_blobtype.create
this.em_1=create em_1
this.mle_output=create mle_output
this.cb_4=create cb_4
this.p_1=create p_1
this.lb_2=create lb_2
this.lb_1=create lb_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.em_1,&
this.mle_output,&
this.cb_4,&
this.p_1,&
this.lb_2,&
this.lb_1,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4}
end on

on w_blobtype.destroy
destroy(this.em_1)
destroy(this.mle_output)
destroy(this.cb_4)
destroy(this.p_1)
destroy(this.lb_2)
destroy(this.lb_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;This.X = 0
This.Y = 0
end event

type em_1 from editmask within w_blobtype
boolean visible = false
integer x = 59
integer y = 1516
integer width = 590
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy-mm-dd hh:mm:ss"
end type

type mle_output from multilineedit within w_blobtype
integer x = 69
integer y = 1024
integer width = 2002
integer height = 384
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_blobtype
boolean visible = false
integer x = 1815
integer y = 112
integer width = 603
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "SetPicture"
end type

event clicked;string ls_pic
blob lblb_pic
long ll_rtn

ls_pic = 'appeon.jpg'
lblb_pic = wf_read_pic(ls_pic)
ll_rtn = p_1.setpicture(lblb_pic)
wf_output('Return Value: '+string(ll_rtn),true)
end event

type p_1 from picture within w_blobtype
boolean visible = false
integer x = 1797
integer y = 256
integer width = 631
integer height = 696
boolean focusrectangle = false
end type

type lb_2 from listbox within w_blobtype
integer x = 1079
integer y = 64
integer width = 987
integer height = 864
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//====================================================================
// Event: doubleclicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value		integer		index
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/15
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
cb_3.triggerevent( 'clicked')
end event

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value		integer		index
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/15
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
mle_output.Text =''
end event

type lb_1 from listbox within w_blobtype
integer x = 64
integer y = 64
integer width = 914
integer height = 864
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Blob","BlobEdit","BlobMid","Len","String"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		value		integer		index
//--------------------------------------------------------------------
// Returns: long
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/15
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

IF index < 1 THEN RETURN
lb_2.reset()

CHOOSE CASE index
	CASE 1
		  lb_2.additem( '"Any Text"')
	CASE 2
		  lb_2.additem( 'lblb_bb, 1, "Any Text"')		  
		  lb_2.additem( 'lblb_bb, 2, 5')
		  lb_2.additem( 'lblb_bb, 3, 2004-10-15')
		  lb_2.additem( 'lblb_bb, 4, 2004-10-15 10:20:09')
		  lb_2.additem( 'lblb_bb, 5, 2344.56')
		  lb_2.additem( 'lblb_bb, 6, 10:20:09')
	CASE 3
		  lb_2.additem( 'Any Text, 1')
		  lb_2.additem( 'B5, 2, 4')
		  lb_2.additem( 'B 2004-10-15, 3, 15')
		  lb_2.additem( 'B*2004-10-15 10:20:09, 3, 15')
		  lb_2.additem( 'B%2344.56, 3, 11')
		  lb_2.additem( 'B&E^@~R~T10:20:09, 10')
	CASE 4,5
		  lb_2.additem( 'Any Text')
		  lb_2.additem( '5')
		  lb_2.additem( '2004-10-15')
		  lb_2.additem( '2004-10-15 10:20:09')
		  lb_2.additem( '2344.56')
		  lb_2.additem( '10:20:09')
	CASE 6
		
	CASE 7	
	     lb_2.additem( 'cake.jpg')
		  lb_2.additem( 'prodattr.jpg')
		  lb_2.additem( 'tag003.jpg')
		  lb_2.additem( 'tag004.jpg')
		  lb_2.additem( 'about.jpg')
		  lb_2.additem( 'donews_88.gif')
END CHOOSE
mle_output.text =''
end event

type cb_3 from commandbutton within w_blobtype
integer x = 754
integer y = 1460
integer width = 411
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Execute"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/10/15
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
Parent.event ue_ScriptExe(lb_1.SelectedIndex(),lb_2.SelectedIndex())
end event

type cb_2 from commandbutton within w_blobtype
integer x = 1230
integer y = 1460
integer width = 411
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear &All"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author:Xunengli 	 		Date: 2004/10/15
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

mle_output.text =''
end event

type cb_1 from commandbutton within w_blobtype
integer x = 1705
integer y = 1460
integer width = 411
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		None		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author:xunengli 	 		Date: 2004/10/15
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
Close(Parent)
end event

type gb_1 from groupbox within w_blobtype
integer x = 1042
integer width = 1061
integer height = 960
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Function Parameter"
end type

type gb_2 from groupbox within w_blobtype
boolean visible = false
integer x = 1760
integer y = 12
integer width = 709
integer height = 972
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Set Blob to Picture Control"
end type

type gb_3 from groupbox within w_blobtype
integer x = 27
integer width = 987
integer height = 960
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Blob Function"
end type

type gb_4 from groupbox within w_blobtype
integer x = 32
integer y = 960
integer width = 2075
integer height = 480
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Output"
end type

