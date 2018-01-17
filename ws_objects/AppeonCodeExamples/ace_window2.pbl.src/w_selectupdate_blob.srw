$PBExportHeader$w_selectupdate_blob.srw
forward
global type w_selectupdate_blob from window
end type
type ole_1 from olecontrol within w_selectupdate_blob
end type
type em_1 from editmask within w_selectupdate_blob
end type
type mle_output from multilineedit within w_selectupdate_blob
end type
type p_1 from picture within w_selectupdate_blob
end type
type lb_2 from listbox within w_selectupdate_blob
end type
type lb_1 from listbox within w_selectupdate_blob
end type
type cb_3 from commandbutton within w_selectupdate_blob
end type
type cb_2 from commandbutton within w_selectupdate_blob
end type
type cb_1 from commandbutton within w_selectupdate_blob
end type
type gb_1 from groupbox within w_selectupdate_blob
end type
type gb_2 from groupbox within w_selectupdate_blob
end type
type gb_3 from groupbox within w_selectupdate_blob
end type
type gb_4 from groupbox within w_selectupdate_blob
end type
end forward

global type w_selectupdate_blob from window
integer width = 1947
integer height = 1720
boolean titlebar = true
string title = "SelectBlob and UpdateBlob"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_scriptexe ( integer ai_fun,  integer ai_pam )
ole_1 ole_1
em_1 em_1
mle_output mle_output
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
global w_selectupdate_blob w_selectupdate_blob

type variables
int ii_index
end variables

forward prototypes
public subroutine wf_output (string as_mess, boolean ab_clear)
public function blob wf_read_pic (string as_picname)
protected subroutine wf_db_updateblob (string as_arg)
protected subroutine wf_db_selectblob ()
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

string ls_item,ls_parm


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
	CASE 'SelectBlob'
		   wf_db_SelectBlob()
	CASE 'UpdateBlob'
		   wf_db_UpdateBlob(ls_parm)
		
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

protected subroutine wf_db_updateblob (string as_arg);string ls_id,ls_desc
blob{1000} lblb_temp
blob lblb_value
long ll_count,ll_rtn,ll_len
boolean lb_true = True
n_resfile  lnv_file

ls_id = 'PB Blob datatype'
ls_desc = as_arg

SELECT count(*) INTO :ll_count  FROM ole  WHERE id =:ls_id;  
IF isnull(ll_count) THEN ll_count = 0 

CHOOSE CASE ls_desc
	CASE 'cake.jpg','donews_88.gif','tshirto.bmp'
			if lnv_file.of_writefile(ls_desc) = -1 then return
			
		 	lblb_value = wf_read_pic(lnv_file.IS_FilePath + as_arg)
			ll_len = LenA(lblb_value)
			if ll_len <= 0 or isnull(ll_len) then 
				messagebox("Infomation","File is not exist.")
				return
			end if
	CASE 'expense.ole'		   
		   ole_1.Open("blob.ole")
			lblb_value = ole_1.ObjectData	
			ole_1.clear()
	CASE 'Date: 2005-01-20'
		  	ll_rtn = BlobEdit(lblb_temp ,1,date('2005-01-20'))
			lblb_value = BlobMid(lblb_temp,1,ll_rtn - 1)
	CASE 'DateTime: 2005-01-20 10:15:10'
		  	ll_rtn = BlobEdit(lblb_temp,1,DateTime(date('2005-01-20'), time('10:23:9')))
			lblb_value = BlobMid(lblb_temp,1,ll_rtn - 1)
	CASE 'Time: 10:23:9'
		   ll_rtn = BlobEdit(lblb_temp,1,time('10:23:9'))
			lblb_value = BlobMid(lblb_temp,1,ll_rtn - 1)
	CASE 'Boolean: True'
		   ll_rtn = BlobEdit(lblb_temp,1,lb_true)			
			lblb_value = BlobMid(lblb_temp,1,ll_rtn - 1)
	CASE 'String: ABCDEFGHIJK'
		   lblb_value = Blob('ABCDEFGHIJK')
	CASE 'Number: 5460'
		   ll_rtn = BlobEdit(lblb_temp,1,5460)
			lblb_value = BlobMid(lblb_temp,1,ll_rtn - 1)
	CASE 'Number: -5460'
		   ll_rtn = BlobEdit(lblb_temp,1,-5460)
			lblb_value = BlobMid(lblb_temp,1,ll_rtn - 1)
	CASE 'Double: 6749.459'
		   ll_rtn = BlobEdit(lblb_temp,1,6749.459)
			lblb_value = BlobMid(lblb_temp,1,ll_rtn - 1)
	CASE 'Double: -6749.459'	
		   ll_rtn = BlobEdit(lblb_temp,1,-6749.459)
			lblb_value = BlobMid(lblb_temp,1,ll_rtn - 1)
END CHOOSE

IF ll_count <= 0 THEN	
	INSERT INTO ole(id,description) VALUES (:ls_id,:ls_desc);
ELSE		
	UPDATE ole SET description = :ls_desc  WHERE id =:ls_id;
	 IF SQLCA.SQLcode <> 0 then
		RollBack;
		MessageBox('Warning',SQLCA.SQLErrText)
		RETURN
	END IF
END IF	

UPDATEBLOB ole  SET object = :lblb_value  WHERE id = :ls_id;	  
IF Sqlca.SQLNRows > 0 THEN	  
ELSE
	  RollBack;
	  MessageBox('Warning',SQLCA.SQLErrText)
	  RETURN
END IF

COMMIT;
wf_output('Sqlca Sqlcode: '+string(Sqlca.Sqlcode),True)	  

		
	
end subroutine

protected subroutine wf_db_selectblob ();blob lblb_value
long ll_count,ll_rtn
string ls_desc,ls_id

ls_id = 'PB Blob datatype'

SELECT count(*) INTO :ll_count FROM ole WHERE id =:ls_id;
IF isnull(ll_count) THEN ll_count = 0 

IF ll_count <= 0 THEN 
	Return	
ELSE		
	SELECT description  INTO :ls_desc FROM ole WHERE id =:ls_id;
	 IF SQLCA.SQLcode <> 0 then	
		MessageBox('Warning',SQLCA.SqlErrText)
		RETURN
	 END IF
	 SELECTBLOB Object INTO :lblb_value FROM ole WHERE id =:ls_id;
	 IF SQLCA.SQLNrows <= 0 THEN
		MessageBox('Warning',SQLCA.SqlErrText)
		Return
	 END IF
END IF	
wf_output('Sqlca Sqlcode: '+string(Sqlca.Sqlcode),True)
p_1.hide()
ole_1.hide()

CHOOSE CASE trim(ls_desc)
	CASE 'cake.jpg','donews_88.gif','tshirto.bmp'
			p_1.show()		
	CASE 'expense.ole'		   
			ole_1.show()
			ole_1.ObjectData	= lblb_value
	CASE 'Date: 2005-01-20'
			wf_output('Returns the value of blob as a string : '+string(date(lblb_value),'yyyy-mm-dd'),False)		  	
	CASE 'DateTime: 2005-01-20 10:15:10'
			wf_output('Returns the value of blob as a string : '+string(datetime(lblb_value),'yyyy-mm-dd hh:mm:ss'),False)  
	CASE 'Time: 10:23:9'
			wf_output('Returns the value of blob as a string : '+string(time(lblb_value)),False)  
	CASE 'Boolean: True'
			//wf_output('Returns the value of blob as a string : '+string(date(lblb_value),'yyyy-mm-dd'),False)  
	CASE 'String: ABCDEFGHIJK'
			wf_output('Returns the value of blob as a string : '+string(lblb_value),False)
	CASE 'Number: 5460'
			wf_output('Returns the value of blob as a string : '+string(integer(lblb_value)),False)  
	CASE 'Number: -5460'
			wf_output('Returns the value of blob as a string : '+string(integer(lblb_value)),False)  
	CASE 'Double: 6749.459'
//			wf_output('Returns the value of blob as a string : '+string(double(lblb_value)),False)  
	CASE 'Double: -6749.459'	
//			wf_output('Returns the value of blob as a string : '+string(double(lblb_value)),False)  
END CHOOSE
	
		
	
end subroutine

on w_selectupdate_blob.create
this.ole_1=create ole_1
this.em_1=create em_1
this.mle_output=create mle_output
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
this.Control[]={this.ole_1,&
this.em_1,&
this.mle_output,&
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

on w_selectupdate_blob.destroy
destroy(this.ole_1)
destroy(this.em_1)
destroy(this.mle_output)
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

event open;//wf_db_blob('','appeon.jpg')
This.X = 0
This.Y = 0
end event

type ole_1 from olecontrol within w_selectupdate_blob
boolean visible = false
integer x = 2565
integer y = 76
integer width = 736
integer height = 864
integer taborder = 40
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_selectupdate_blob.win"
omdisplaytype displaytype = displayascontent!
omcontentsallowed contentsallowed = containsany!
omlinkupdateoptions linkupdateoptions = linkupdatemanual!
end type

type em_1 from editmask within w_selectupdate_blob
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

type mle_output from multilineedit within w_selectupdate_blob
integer x = 64
integer y = 1056
integer width = 1783
integer height = 380
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

type p_1 from picture within w_selectupdate_blob
boolean visible = false
integer x = 2121
integer y = 64
integer width = 736
integer height = 860
boolean focusrectangle = false
end type

type lb_2 from listbox within w_selectupdate_blob
integer x = 992
integer y = 64
integer width = 850
integer height = 912
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

type lb_1 from listbox within w_selectupdate_blob
integer x = 64
integer y = 64
integer width = 814
integer height = 912
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
string item[] = {"UpdateBlob","SelectBlob"}
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
		  lb_2.additem( 'cake.jpg')		  
		  lb_2.additem( 'donews_88.gif')
		  lb_2.additem( 'tshirto.bmp')
		  lb_2.additem( 'expense.ole')
		  lb_2.additem( 'Date: 2005-01-20')
		  lb_2.additem( 'DateTime: 2005-01-20 10:15:10')
		  lb_2.additem( 'Time: 10:23:9')
		  lb_2.additem( 'Boolean: True')
		  lb_2.additem( 'String: ABCDEFGHIJK')
		  lb_2.additem( 'Number: 5460')
		  lb_2.additem( 'Number: -5460')
		  lb_2.additem( 'Double: 6749.459')		  
		  lb_2.additem( 'Double: -6749.459')
		  lb_2.selectitem(1)
	CASE 2	
	     
END CHOOSE
mle_output.text =''

end event

type cb_3 from commandbutton within w_selectupdate_blob
integer x = 718
integer y = 1488
integer width = 389
integer height = 104
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

type cb_2 from commandbutton within w_selectupdate_blob
integer x = 1106
integer y = 1488
integer width = 389
integer height = 104
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

type cb_1 from commandbutton within w_selectupdate_blob
integer x = 1495
integer y = 1488
integer width = 389
integer height = 104
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

type gb_1 from groupbox within w_selectupdate_blob
integer x = 951
integer y = 4
integer width = 933
integer height = 1004
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Data Type"
end type

type gb_2 from groupbox within w_selectupdate_blob
boolean visible = false
integer x = 1646
integer y = 12
integer width = 823
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
string text = "Set Blob To Controls"
end type

type gb_3 from groupbox within w_selectupdate_blob
integer x = 27
integer y = 4
integer width = 891
integer height = 1004
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SQL Statement"
end type

type gb_4 from groupbox within w_selectupdate_blob
integer x = 27
integer y = 1000
integer width = 1856
integer height = 468
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


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Ew_selectupdate_blob.bin 
2100000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000001ad6575c9468cc055160de9b67f82fc6a0000000000000000000000003db6d67001c5421b000000030000008000000000004f00010065006c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000102000affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000001400000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000010000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
24ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff02000001000000080000000000000000000000000029007800280020003400360037003400290034003400200031002f002f003400300032003500300031002000000300000013d8000013d80020003100770000005f00770069006c007400730069007600770065006e005f007700650077002e006e006900280020002900780028002000320031003100350031003700200029002f0034003400310032002f0030003000200035003800310032003a003a00300035003500000020007700770066005f006c0069005f0065007500660063006e00690074006e006f002e0073006900770020006e007800280020002900340028003500310039003000200029002f0034003400310032002f0030003000200035003800310032003a003a00300037003500000020007700770066005f006c0069005f0065007200700066006f006c0069002e0065006900770020006e007800280020002900320028003700330039003600200029002f0034003400310032002f0030003000200035003800310032003a003a00300037003500000020007700770068005f007200700067006f006500720073007300610062005f00720065006e002e0077006900770020006e007800280020002900340028003100390030003500200029002f0034003400310032002f0030003000200035003800310032003a003a00300039003500000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Ew_selectupdate_blob.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
