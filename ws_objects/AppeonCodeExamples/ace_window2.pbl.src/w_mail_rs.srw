$PBExportHeader$w_mail_rs.srw
forward
global type w_mail_rs from window
end type
type cb_delete from commandbutton within w_mail_rs
end type
type cb_7 from commandbutton within w_mail_rs
end type
type cb_6 from commandbutton within w_mail_rs
end type
type st_3 from statictext within w_mail_rs
end type
type st_2 from statictext within w_mail_rs
end type
type cb_5 from commandbutton within w_mail_rs
end type
type cb_4 from commandbutton within w_mail_rs
end type
type cb_3 from commandbutton within w_mail_rs
end type
type plb_attachment from picturelistbox within w_mail_rs
end type
type tv_1 from treeview within w_mail_rs
end type
type gb_1 from groupbox within w_mail_rs
end type
type plb_send from picturelistbox within w_mail_rs
end type
type cbx_2 from checkbox within w_mail_rs
end type
type cbx_1 from checkbox within w_mail_rs
end type
type st_5 from statictext within w_mail_rs
end type
type tab_1 from tab within w_mail_rs
end type
type tabpage_1 from userobject within tab_1
end type
type st_to from statictext within tabpage_1
end type
type st_8 from statictext within tabpage_1
end type
type st_7 from statictext within tabpage_1
end type
type st_6 from statictext within tabpage_1
end type
type lv_inbox from listview within tabpage_1
end type
type mle_message from multilineedit within tabpage_1
end type
type st_cc from statictext within tabpage_1
end type
type st_from from statictext within tabpage_1
end type
type st_name from statictext within tabpage_1
end type
type st_subject from statictext within tabpage_1
end type
type gb_2 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_to st_to
st_8 st_8
st_7 st_7
st_6 st_6
lv_inbox lv_inbox
mle_message mle_message
st_cc st_cc
st_from st_from
st_name st_name
st_subject st_subject
gb_2 gb_2
end type
type tabpage_2 from userobject within tab_1
end type
type sle_subject from singlelineedit within tabpage_2
end type
type sle_cc from singlelineedit within tabpage_2
end type
type sle_to from singlelineedit within tabpage_2
end type
type st_1 from statictext within tabpage_2
end type
type cb_2 from commandbutton within tabpage_2
end type
type cb_1 from commandbutton within tabpage_2
end type
type mle_msg from multilineedit within tabpage_2
end type
type tabpage_2 from userobject within tab_1
sle_subject sle_subject
sle_cc sle_cc
sle_to sle_to
st_1 st_1
cb_2 cb_2
cb_1 cb_1
mle_msg mle_msg
end type
type tab_1 from tab within w_mail_rs
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_mail_rs from window
integer width = 3557
integer height = 2348
boolean titlebar = true
string title = "Mail"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "CONTACTL.ICO"
boolean center = true
cb_delete cb_delete
cb_7 cb_7
cb_6 cb_6
st_3 st_3
st_2 st_2
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
plb_attachment plb_attachment
tv_1 tv_1
gb_1 gb_1
plb_send plb_send
cbx_2 cbx_2
cbx_1 cbx_1
st_5 st_5
tab_1 tab_1
end type
global w_mail_rs w_mail_rs

type prototypes
FUNCTION ulong FreeLibrary(ulong hLibModule) LIBRARY "kernel32.dll"
FUNCTION ulong LoadLibraryA(string lpLibFileName) LIBRARY "kernel32.dll" alias for "LoadLibraryA;Ansi"
FUNCTION ulong ShellExecuteA(ulong hwnd,ref string lpOperation,ref string lpFile,ref string lpParameters,ref string lpDirectory,ulong nShowCmd) LIBRARY "shell32.dll" alias for "ShellExecuteA;Ansi"
FUNCTION ulong DeleteFileA(ref string lpFileName) LIBRARY "kernel32.dll" alias for "DeleteFileA;Ansi" 
end prototypes

type variables
MailSession ims_mail

string is_pathname[],is_path[],is_attch[],is_addres[],is_tcname[]

string is_flag

end variables

forward prototypes
public function string wf_mailerror_str (mailreturncode a_mailreturncode, string a_message, boolean a_display)
public function integer wf_check_inbox ()
public function integer wf_read_mail (integer index)
public function integer wf_mail_delete ()
public function integer wf_file_open ()
public function integer wf_mail_send ()
public function integer wf_file_insert (picturelistbox ao_plb)
public function integer wf_file_delete (picturelistbox ao_plb)
public function string wf_clear_empty (string as_str)
public function integer wf_attch_delete ()
public function integer wf_name (string as_str)
public function integer wf_address (string as_str)
end prototypes

public function string wf_mailerror_str (mailreturncode a_mailreturncode, string a_message, boolean a_display);// Function  wf_mailerror_str ( a_MailReturnCode, a_Display)
// where:	a_MailReturnCode	MailReturnCode value
//			a_Message			Error message to prepend to return string
//			a_Display			Boolean (TRUE=display error messagebox)

string	s

choose case a_MailReturnCode
	case mailReturnAccessDenied!
		s = 'Access Denied'
	case mailReturnAttachmentNotFound!
		s = 'Attachment Not Found'
	case mailReturnAttachmentOpenFailure!
		s = 'Attachment Open Failure'
	case mailReturnAttachmentWriteFailure!
		s = 'Attachment Write Failure'
	case mailReturnDiskFull!
		s = 'Disk Full'
	case mailReturnFailure!
		s = 'Failure'
	case mailReturnInsufficientMemory!
		s = 'Insufficient Memory'
	case mailReturnInvalidMessage!
		s = 'Invalid Message'
	case mailReturnLoginFailure!
		s = 'Login Failure'
	case mailReturnMessageInUse!
		s = 'Message In Use'
	case mailReturnNoMessages!
		s = 'No Messages'
	case mailReturnSuccess!
		s = 'Success'
	case mailReturnTextTooLarge!
		s = 'Text Too Large'
	case mailReturnTooManyFiles!
		s = 'Too Many Files'
	case mailReturnTooManyRecipients!
		s = 'Too Many Recipients'
	case mailReturnTooManySessions!
		s = 'Too Many Sessions'
	case mailReturnUnknownRecipient!
		s = 'Unknown Recipient'
	case mailReturnUserAbort!
		s = 'User Abort'

	case else
		s = 'Other'
end choose

if a_Display then MessageBox ( 'Mail Return Code', a_Message + ' ' + s, Exclamation!)

return s




end function

public function integer wf_check_inbox ();/*******************************************************************
	The following e-mail variables are declared as Instance variables:
		mailSession				mSes
 *******************************************************************/
mailReturnCode			mRet
mailMessage				mMsg[]
MailSession				lms_msr
string					ls_filename, ls_ret
int						li_msgs, li_attachments
int						li_index , li_attachindex
Boolean					lb_unreadonly
listviewitem l_lvi

tab_1.tabpage_1.lv_inbox.DeleteItems()
lms_msr = ims_mail
/****************************************************************
	Obtain the list of mail Message IDs in the user's mail Inbox
 ****************************************************************/
if cbx_2.checked then
	lb_unreadonly = True
else
	lb_unreadonly = False	
end if
mRet = lms_msr.mailGetMessages (lb_unreadonly)
ls_Ret = wf_mailerror_str( mRet, 'Get Messages:', FALSE )
st_5.text = ' Inbox: ' + ls_ret

/****************************************************************
For each message in the user's Inbox:
	1. Read the message envelope (recipients, subject, list
			of attachments).  Note that this does not read the
			message contents or the attachments themselves.
	2. For each attachment, see if its file extension is .dwx
	3. Add a row to the Inbox DataWindow
 ****************************************************************/

li_msgs = UpperBound(lms_msr.MessageID)

For li_index = li_msgs to 1 step -1
	mRet = lms_msr.mailReadMessage ( lms_msr.MessageID[li_index], mMsg[li_index], &
								  mailEnvelopeOnly!, FALSE )
	ls_ret = wf_mailerror_str( mRet, 'Read Message Envelope:' ,FALSE )
	st_5.text = ' Inbox: Msg ' + string (li_index, '##0') + ': ' + ls_Ret
	
	li_attachments = UpperBound ( mMsg[li_index].AttachmentFile )

    //Add mail  to the Inbox lv_inbox.
		l_lvi.data = lms_msr.MessageID[li_index]
//		TRY
			l_lvi.label= string(mMsg[li_index].Recipient[1].Name) +'~t'+string(mMsg[li_index].Subject)+'~t' + string(mMsg[li_index].DateReceived)
//		CATCH	(RuntimeError err)
//			Messagebox('Warnning',err.GetMessage ())
//		END TRY	
				
		if mMsg[li_index].unread then
			l_lvi.pictureindex = 1
		else
			l_lvi.pictureindex = 2
		end if
		if li_attachments >0 then
			l_lvi.statepictureindex = 1
		else
			l_lvi.statepictureindex = 0
		end if
		tab_1.tabpage_1.lv_inbox.additem(l_lvi)
//      Yield ()
Next
// Loop on messages in user's Inbox
//Sorts the items in a ListView control
//tab_1.tabpage_1.lv_inbox.SetRedraw(false)

//tab_1.tabpage_1.lv_inbox.Sort(Descending! , 3)

//tab_1.tabpage_1.lv_inbox.SetRedraw(true)
SetPointer ( Arrow! )
//ims_mail  =  lms_msr
st_5.text = "Ready"

return li_msgs
end function

public function integer wf_read_mail (integer index);// Read mail from inbox

mailReturnCode			mRet
mailMessage			mMsg[]
mailFileDescription		mAttach
listviewitem llvi_current

int		li_attachment, li_file, li_ret, li_recips, li_index
string	ls_messageid,ls_temp[]
string	ls_ret, ls_syntax, ls_name, ls_open_pathname, ls_filename

IF index = -1 THEN 
	cb_delete.enabled = false
	RETURN 0
END IF	
cb_delete.enabled = true

li_ret = tab_1.tabpage_1.lv_inbox.GetItem(index, llvi_current)
if li_ret = -1 then return 0

//llvi_current.Label = Upper(llvi_current.Label)

//This.SetItem(index, llvi_current)	
setpointer(HourGlass!)
/****************************************************************
	Obtain mail Message ID and which attachment is the lv_inbox
	to receive and display
 ****************************************************************/

	ls_messageid = llvi_current.data
//	li_attachment = this.object.Attachment_number[row]

/****************************************************************
	Re-read this message to obtain entire contents, including
	the attached file (because the Open script read only the
	"envelope" and not the contents of the message)
 ****************************************************************/

	mRet = ims_mail.mailReadMessage ( ls_messageid, mMsg[1],mailEntireMessage!, True )
	//mailEntireMessage! Obtain header, text, and attachments and ark the message as read
	ls_ret = wf_mailerror_str( mRet, 'Read Message:', FALSE )
	st_5.text = ' Read Message: ' + ls_ret

	tab_1.tabpage_1.st_to.text = "" 	
	//add  recipient of a mail message.
	li_recips = Upperbound(mMsg[1].Recipient)	
	for li_index = 1 to li_recips

		//get the from name
		If mMsg[1].Recipient[li_index].RecipientType = mailOriginator! Then 
			tab_1.tabpage_1.st_name.text = mMsg[1].Recipient[li_index].name	
		End If
		
		//get the to and cc names .. put ; between each one
		IF mMsg[1].Recipient[li_index].RecipientType = mailTo! then
			tab_1.tabpage_1.st_to.text = MMsg[1].Recipient[li_index].name
		End IF	
		IF	mMsg[1].Recipient[li_index].RecipientType = mailCC! Then 				
			tab_1.tabpage_1.st_cc.text = MMsg[1].Recipient[li_index].name				
		End If
	next

	//set subject
	tab_1.tabpage_1.st_subject.text = mMsg[1].subject
	
	//set message text
	tab_1.tabpage_1.mle_message.text = mMsg[1].NoteText


/****************************************************************
	Extract the name of the temporary file in which the mail
	system has stored the attachment file, and open that file
 ****************************************************************/
   plb_attachment.reset()
	li_attachment = UpperBound ( mMsg[1].AttachmentFile)
	//Delete thereinbefore mail attachment
   wf_attch_delete()
	//Loop on add attachments in current message in plb_attachment
	is_attch[] = ls_temp
	is_path[] = ls_temp
	for li_file = 1 to li_attachment
		ls_filename = mMsg[1].AttachmentFile[li_file].FileName
		is_attch[li_file] = ls_filename
		is_path[li_file] = mMsg[1].AttachmentFile[li_file].PathName
		plb_attachment.additem( ls_filename, 1)
	next	
	
	//Mark the message has been read. 
   if not mMsg[1].Unread	then		
	   llvi_current.pictureindex = 2
		li_ret = tab_1.tabpage_1.lv_inbox.setitem(index, llvi_current)
	end if	
   setpointer(Arrow!)

return 0
end function

public function integer wf_mail_delete ();// Clicked script for cb_delete
			
int					li_index,li_rtn
mailReturnCode 	mret
string				ls_messgeid, ls_ret
ListViewItem		l_lvi
/****************************************************************
	Delete the currently-highlighted message from the
	logged-in user's Inbox at the Post Office
 ****************************************************************/

/****************************************************************
	Get the selected message's ID from the Inbox 
 ****************************************************************/
li_index = tab_1.tabpage_1.lv_inbox.selectedindex( ) 
li_rtn = tab_1.tabpage_1.lv_inbox.getitem(li_index,l_lvi)
if li_rtn = -1 then return -1
ls_messgeid = l_lvi.data

/****************************************************************
	Now, delete that message from the Post Office
 ****************************************************************/

mRet = ims_mail.mailDeleteMessage ( ls_messgeid )
ls_ret = wf_mailerror_str ( mRet, 'Read Message:', FALSE )
st_5.text = ' Delete Message: ' + ls_ret

/****************************************************************
	Finally, remove the entry from the on-screen list of messages,
	and disable this button until user has retrieved another
	message.
 ****************************************************************/

if mRet = mailReturnSuccess! then	
	tab_1.tabpage_1.lv_inbox.DeleteItem(li_index)
	tab_1.tabpage_1.mle_message.text =''
	tab_1.tabpage_1.st_name.text = ''
	tab_1.tabpage_1.st_to.text = ''
	tab_1.tabpage_1.st_subject.text =''
	tab_1.tabpage_1.st_cc.text =''
	plb_attachment.reset()
end if



return 1







end function

public function integer wf_file_open ();// Read attchment from inbox


int		li_attachment, li_index
string	ls_name, ls_pathname,ls_filename,ls_open,ls_parm
ulong 	lu_instance

/****************************************************************
	Extract the name of the temporary file in which the mail
	system has stored the attachment file, and open that file
 ****************************************************************/
   
	ls_name = plb_attachment.SelectedItem ( )
	li_attachment = UpperBound (is_attch[])
	if li_attachment > 0 then
		for li_index = 1 to li_attachment		
			ls_filename = is_attch[li_index]
			ls_pathname = is_path[li_index]	
			if lower(ls_name) = lower(ls_filename) then exit
		next
		ls_filename = ls_pathname		
		lu_instance =LoadLibraryA('shell32.dll')
		if lu_instance > 0 then
			ls_open = 'open'
			ls_parm = 'Document'
			ShellExecuteA(Handle(this),ls_open,ls_filename,ls_pathname,ls_parm,1)
			FreeLibrary(lu_instance)
		end if	
	end if

return 0
end function

public function integer wf_mail_send ();// Clicked script for cb_send_mail
mailReturnCode			mRet
mailFileDescription	mAttach
MailSession 			ms_send
mailMessage				mMsg

string					ls_ret, ls_cc, ls_to,ls_addres[], &
							ls_name,ls_tcname[], ls_pathname, ls_filename
int						li_index, li_tocc,li_nrecipients, li_nfile,li_num



SetPointer(HourGlass!)
st_5.text = 'Sends a mail message ...'

//instance mailsession
ms_send = ims_mail

/*****************************************************************
	Copy user's subject to the mail message.
	Set return receipt flag If needed.
	Build an Attachment structure, and assign it to the mail message.
 *****************************************************************/
If cbx_1.checked Then
	mMsg.ReceiptRequested = true
End If

mMsg.Subject	= tab_1.tabpage_2.sle_subject.text
mMsg.notetext = tab_1.tabpage_2.mle_msg.text +"~n~r "

li_nfile = UpperBound(is_pathname[])
if li_nfile > 0 then
	for li_index = 1 to li_nfile step 1
		 ls_pathname = is_pathname[li_index]
		 ls_filename = RightA(ls_pathname,(LenA(ls_pathname) - LastPos(ls_pathname,'\')))
		 mAttach.FileType = mailAttach!
		 mAttach.PathName = ls_pathname
	    mAttach.FileName = ls_filename
	// Note: In MS Mail version 3.0b, Position=-1 puts attachment at
	//  the beginning of the message.
	// This will place the attachment at the End of the text of the message
		mAttach.Position = LenA(mMsg.notetext) - 1		
		mMsg.AttachmentFile[li_index] = mAttach
	next
end if


//add addresses
ls_to = wf_clear_empty(trim(tab_1.tabpage_2.sle_to.text))
ls_cc = wf_clear_empty(trim(tab_1.tabpage_2.sle_cc.text))
//if ls_to or ls_cc have xx@163.com addresses
is_addres = ls_addres
is_tcname = ls_tcname

wf_address(ls_to)
li_tocc = upperbound(is_addres[])
li_index = 1
if li_tocc > 0 then
	   DO While li_index <= li_tocc
		 li_num ++		 
		 mMsg.recipient[li_index].Address = 'SMTP:'+is_addres[li_index]
		 mMsg.recipient[li_index].Name = is_addres[li_index]
		 mMsg.recipient[li_index].RecipientType = mailTo!	
		 li_index ++
	Loop	 
end if

li_tocc = upperbound(is_tcname[])
li_index = 1
if li_tocc > 0 then
	 DO While li_index <= li_tocc
       li_num ++		 
		 //mMsg.recipient[li_num].Address = ls_addres[li_index]
		 mMsg.recipient[li_num].Name = is_tcname[li_index]
		 mMsg.recipient[li_num].RecipientType = mailTo!
		 li_index ++
	 Loop	
end if
/*****************************************************************
	Resolve recipient addresses, which may be only partially
	supplied, to get the complete address for each one.

	Loop in this until the names are all resovled with no
	errors. The message will not be sent If errors are in
	the user name.

	The user can cancel out of resolving names which
	will cancel the entire send mail process
 *****************************************************************/	
	
	For li_nrecipients = 1 To li_tocc
		mRet = ms_send.mailResolveRecipient(is_tcname[li_nrecipients])
		If mRet <> mailReturnSuccess! Then						
				ls_ret = wf_mailerror_str ( mRet, 'Resolve Recipient:', FALSE )
				st_5.text = ' Send Mail: (' + is_tcname[li_nrecipients] + '): ' + ls_ret
				return -1			
		END IF
	Next		
//********************************************************************//	
is_addres = ls_addres
is_tcname = ls_tcname

wf_address(ls_cc)
li_tocc = upperbound(is_addres[])

li_index = 1
if li_tocc > 0 then
	 DO while li_index <= li_tocc
		 li_num ++		 
		 mMsg.recipient[li_num].Address ='SMTP:'+is_addres[li_index]
		 mMsg.recipient[li_num].Name = is_addres[li_index]
		 mMsg.recipient[li_num].RecipientType = mailCC!
		 li_index ++
	Loop	
end if

li_tocc = upperbound(is_tcname[])
li_index = 1
if li_tocc > 0 then
	DO While li_index <= li_tocc
       li_num ++		 
		 //mMsg.recipient[li_num].Address = ls_addres[li_index]
		 mMsg.recipient[li_num].Name = is_tcname[li_index]
		 mMsg.recipient[li_num].RecipientType = mailCC!
		 li_index ++
	Loop
end if
/*****************************************************************
	Resolve recipient addresses, which may be only partially
	supplied, to get the complete address for each one.

	Loop in this until the names are all resovled with no
	errors. The message will not be sent If errors are in
	the user name.

	The user can cancel out of resolving names which
	will cancel the entire send mail process
 *****************************************************************/	
	
	For li_nrecipients = 1 To li_tocc
		mRet = ms_send.mailResolveRecipient(is_tcname[li_nrecipients])
		If mRet <> mailReturnSuccess! Then						
				ls_ret = wf_mailerror_str ( mRet, 'Resolve Recipient:', FALSE )
				st_5.text = ' Send Mail: (' + is_tcname[li_nrecipients] + '): ' + ls_ret
				return -1			
		END IF
	Next		
//******************************************************************//	

/*****************************************************************
	Now, send the mail message, including the attachment
 *****************************************************************/
If UpperBound ( mMsg.Recipient ) < 1 Then 
	messagebox ("Powerbuilder send","Mail must included at least 1 recipient",Exclamation!)	
	return -1
End If

mRet = ms_send.mailsend ( mMsg )
ls_ret = wf_mailerror_str( mRet, 'send Mail:', FALSE )
st_5.text = ' send Mail: ' + ls_ret


SetPointer(HourGlass!)

return 0
end function

public function integer wf_file_insert (picturelistbox ao_plb);string ls_filename,ls_pathname
int li_ret,li_index

li_ret = GetFileOpenName ( 'Insert Attachment File', ls_pathname, ls_filename)

choose case li_ret 
	case  -1 
		Messagebox('Warning','Selected file an error occurs!')
		Return -1
	case 0
		return 0
	case 1	
		li_index = ao_plb.AddItem ( ls_filename , 1 )
		is_pathname[li_index] = ls_pathname
	case else
		return -1
end choose



Return 1
end function

public function integer wf_file_delete (picturelistbox ao_plb);string ls_temp[],ls_init[]
int li_index,li_num,li_total,li_ret
boolean lb_empty = false

li_index = ao_plb.SelectedIndex()
if li_index = -1 then return -1

is_pathname[li_index] = ''

ls_temp = is_pathname
is_pathname = ls_init[]

li_total = UpperBound(ls_temp[])

if li_total < 1 then return -1
for li_num = 1 to li_total
	if ls_temp[li_num] = '' then
		lb_empty = true
		continue
	end if
	if lb_empty then
		li_ret = li_num - 1
	end if
	 is_pathname[li_ret] = ls_temp[li_num]
next
ao_plb.DeleteItem ( li_index )
Return 0
end function

public function string wf_clear_empty (string as_str);string ls_str1,ls_str2
long ll_pos


ll_pos = PosA(as_str,' ')

do while ll_pos > 0 
	ls_str1 = MidA(as_str,1,ll_pos)
	ls_str2 = MidA(as_str,ll_pos)
	as_str = trim(ls_str1) + trim(ls_str2)
	ll_pos = PosA(as_str,' ')
Loop

return as_str
end function

public function integer wf_attch_delete ();long ll_index,ll_bound

ll_bound = UpperBound(is_path[])

if ll_bound <= 0 then Return -1
For ll_index = 1 to ll_bound	
	 DeleteFileA(is_path[ll_index])
Next	 
Return 1
end function

public function integer wf_name (string as_str);string ls_name,ls_str,ls_tem[]
long ll_pos,ll_num

ls_str = as_str

ll_pos = PosA(ls_str,';')

Do while ll_pos > 0
	ll_num += 1
	ls_name = MidA(ls_str,1,(ll_pos - 1))
	is_tcname[ll_num] = ls_name
	ls_str = MidA(ls_str,(ll_pos + 1))
	ll_pos = PosA(ls_str,';')
Loop
if LenA(ls_str) > 0 then
	ll_num += 1
	is_tcname[ll_num] = ls_str	
end if
return ll_num
end function

public function integer wf_address (string as_str);long ll_pos,ll_p1,ll_p2,ll_num,ll_rtn
string ls_str,ls_part1,ls_part2,ls_adr1,ls_adr2

string ls_addres[]

ls_str = as_str

ll_pos = PosA(ls_str,'@')

Do While ll_pos > 0	
	ll_num += 1
	ls_part1 = LeftA(ls_str,ll_pos)
	ls_part2 = MidA(ls_str,(ll_pos + 1))
	ll_p1 = LastPos(ls_part1,';')
	ll_p2 = PosA(ls_part2,';')
	if ll_p1 > 0 then
		ls_adr1 = RightA(ls_part1,(LenA(ls_part1) - ll_p1))
		if ll_p2 > 0 then
			ls_part1 = MidA(ls_part1,1,ll_p1)
		else
			ls_part1 = MidA(ls_part1,1,(ll_p1 - 1))
		end if
	else
		ls_adr1 = ls_part1
		ls_part1 =''
	end if
   if ll_p2 > 0 then
		ls_adr2 = LeftA(ls_part2,(ll_p2 - 1))
		ls_part2 = MidA(ls_part2,(ll_p2 + 1 ))
		ls_str = ls_part1 + ls_part2
	else
		ls_adr2 = ls_part2
		ls_str = ls_part1
	end if
	ls_addres[ll_num] = ls_adr1+ls_adr2
   ll_pos = PosA(ls_str,'@')
Loop

is_addres = ls_addres

ll_rtn = wf_name(ls_str)

Return ll_num
end function

on w_mail_rs.create
this.cb_delete=create cb_delete
this.cb_7=create cb_7
this.cb_6=create cb_6
this.st_3=create st_3
this.st_2=create st_2
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.plb_attachment=create plb_attachment
this.tv_1=create tv_1
this.gb_1=create gb_1
this.plb_send=create plb_send
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.st_5=create st_5
this.tab_1=create tab_1
this.Control[]={this.cb_delete,&
this.cb_7,&
this.cb_6,&
this.st_3,&
this.st_2,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.plb_attachment,&
this.tv_1,&
this.gb_1,&
this.plb_send,&
this.cbx_2,&
this.cbx_1,&
this.st_5,&
this.tab_1}
end on

on w_mail_rs.destroy
destroy(this.cb_delete)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.plb_attachment)
destroy(this.tv_1)
destroy(this.gb_1)
destroy(this.plb_send)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.st_5)
destroy(this.tab_1)
end on

event open;wstr_parm lwstr
MailReturnCode mRet
string ls_ret,ls_profile,ls_pw

this.x = 0
this.y = 0

////////////////////////////////////////////
open(w_mail_logon)
/////////////////////////////////////////////
lwstr = Message.powerobjectparm

//this.setredraw(false)
is_flag = lwstr.flag

if not isvalid(lwstr) or  is_flag <>'Ok' then	
	post close(this)
	return
end if
 

st_5.text = ' Logging onto mail system...'
/****************************************************************
	Create an instance of a Mail Session object, and log onto
	the mail system
 ****************************************************************/
ims_mail = Create MailSession

ls_profile = lwstr.profile
ls_pw = lwstr.password

mRet = ims_mail.mailLogon (ls_profile,ls_pw,mailNewSessionWithDownLoad! )

ls_ret = wf_mailerror_str(mRet,'Logon:',False)

st_5.text = 'Logon: '+ls_ret

//this.setredraw(true)

if mRet <> mailReturnSuccess! then	
	MessageBox ("Mail Logon", ls_ret )	
	close(this)
	return
end if

cbx_1.visible = false


end event

event close;if is_flag ='Ok' then
   ims_mail.maillogoff()
	destroy ims_mail
	wf_attch_delete()
end if



end event

type cb_delete from commandbutton within w_mail_rs
integer x = 23
integer y = 16
integer width = 247
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Delete"
end type

event clicked;wf_mail_delete()
end event

type cb_7 from commandbutton within w_mail_rs
integer x = 535
integer y = 16
integer width = 247
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Send"
end type

event clicked;wf_mail_send()

tab_1.tabpage_2.sle_to.text =''
tab_1.tabpage_2.sle_cc.text =''
tab_1.tabpage_2.sle_subject.text =''
tab_1.tabpage_2.mle_msg.text =''
//plb_send.reset()
end event

type cb_6 from commandbutton within w_mail_rs
integer x = 279
integer y = 16
integer width = 247
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Receive"
end type

event clicked;wf_check_inbox()
end event

type st_3 from statictext within w_mail_rs
integer x = 800
integer y = 2216
integer width = 2743
integer height = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_2 from statictext within w_mail_rs
integer x = 782
integer y = 16
integer width = 18
integer height = 2220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_mail_rs
integer x = 517
integer y = 2100
integer width = 215
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Open"
end type

event clicked;if tab_1.SelectedTab = 2 then return
wf_file_open()
end event

type cb_4 from commandbutton within w_mail_rs
integer x = 288
integer y = 2100
integer width = 215
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete"
end type

event clicked;if tab_1.SelectedTab = 1 then return
wf_file_delete(plb_send)
end event

type cb_3 from commandbutton within w_mail_rs
integer x = 59
integer y = 2100
integer width = 215
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Insert"
end type

event clicked;if tab_1.SelectedTab = 1 then return
wf_file_insert(plb_send)
end event

type plb_attachment from picturelistbox within w_mail_rs
integer x = 64
integer y = 1136
integer width = 672
integer height = 936
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
string picturename[] = {"CLIP.ICO"}
long picturemaskcolor = 536870912
end type

type tv_1 from treeview within w_mail_rs
integer x = 23
integer y = 128
integer width = 759
integer height = 916
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
boolean hideselection = false
string picturename[] = {"QueryLibraryList5!","Open!","Inherit!","Custom002!","Custom083!","",""}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event constructor;treeviewitem ltvi
long ll_handle,ll_hdl

ltvi.data = '1'
ltvi.label = 'Mailbox'
ltvi.pictureindex = 1
ltvi.selectedpictureindex = 1
ltvi.children = True

ll_handle = this.InsertItemLast(0,ltvi)

ltvi.data = '2'
ltvi.label = 'Inbox'
ltvi.pictureindex = 2
ltvi.selectedpictureindex = 2
ltvi.children = False

ll_hdl = this.InsertItemLast(ll_handle,ltvi)

//ltvi.data = '3'
//ltvi.label = 'Outbox'
//ltvi.pictureindex = 3
//ltvi.selectedpictureindex = 3
//ltvi.children = false
//
//this.InsertItemLast(ll_handle,ltvi)

ltvi.data = '4'
ltvi.label = 'New Mail'
ltvi.pictureindex = 4
ltvi.selectedpictureindex = 4
ltvi.children = false

this.InsertItemLast(ll_handle,ltvi)

ltvi.data = '5'
ltvi.label = 'Contact'
ltvi.pictureindex = 5
ltvi.selectedpictureindex = 5
ltvi.children = false

this.InsertItemLast(ll_handle,ltvi)

this.expanditem( ll_handle)
this.selectitem(ll_hdl)
end event

event selectionchanged;treeviewitem ltvi
mailMessage mMsg
mailSession mSes

integer li_rtn
li_rtn = this.getitem(newhandle, ltvi)
mSes = ims_mail

if li_rtn = -1 then return 
choose case ltvi.data
	case '1' //mailbox
		
	case '2' //inbox
		 	tab_1.selecttab(1)
	case '3' //outbox
//			tab_1.selecttab(2)	
	case '4' //new mail
			tab_1.selecttab(2)
		   tab_1.tabpage_2.sle_to.text =''
			tab_1.tabpage_2.sle_cc.text =''
			tab_1.tabpage_2.sle_subject.text =''
			tab_1.tabpage_2.mle_msg.text =''
			plb_send.reset()
	case '5'	//contact		
		   string ls_name
		   ls_name ='Create a new e-mail addresses'
			mSes.mailResolveRecipient ( ls_name , True )			
end choose
end event

type gb_1 from groupbox within w_mail_rs
integer x = 23
integer y = 1056
integer width = 759
integer height = 1164
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Attachments"
end type

type plb_send from picturelistbox within w_mail_rs
integer x = 64
integer y = 1136
integer width = 672
integer height = 936
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
string picturename[] = {"CLIP.ICO"}
long picturemaskcolor = 536870912
end type

type cbx_2 from checkbox within w_mail_rs
integer x = 832
integer y = 28
integer width = 677
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Get unread messages only"
end type

type cbx_1 from checkbox within w_mail_rs
integer x = 832
integer y = 28
integer width = 677
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Request Receipt"
end type

type st_5 from statictext within w_mail_rs
integer x = 791
integer width = 2738
integer height = 124
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 134217729
long backcolor = 67108864
string text = "Messaging Application Program Interface"
alignment alignment = center!
boolean focusrectangle = false
end type

type tab_1 from tab within w_mail_rs
integer x = 791
integer y = 28
integer width = 2738
integer height = 2204
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event selectionchanged;choose case tab_1.SelectedTab
	case 1
		cb_3.enabled = false
		cb_4.enabled = false
		cb_5.enabled = true		
		cb_6.enabled = true
		cb_7.enabled = false		
		cbx_1.visible = False
		cbx_2.visible = True
		plb_send.visible = false
		plb_attachment.visible = True
	case 2
		cb_3.enabled = true
		cb_4.enabled = true
		cb_5.enabled = false		
		cb_6.enabled = false
		cb_7.enabled = true
		cb_delete.enabled = false 
//		cbx_1.visible = true
		cbx_2.visible = false
		plb_send.visible = true
		plb_attachment.visible = false
end choose
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2702
integer height = 2088
long backcolor = 67108864
string text = "Receive"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_to st_to
st_8 st_8
st_7 st_7
st_6 st_6
lv_inbox lv_inbox
mle_message mle_message
st_cc st_cc
st_from st_from
st_name st_name
st_subject st_subject
gb_2 gb_2
end type

on tabpage_1.create
this.st_to=create st_to
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.lv_inbox=create lv_inbox
this.mle_message=create mle_message
this.st_cc=create st_cc
this.st_from=create st_from
this.st_name=create st_name
this.st_subject=create st_subject
this.gb_2=create gb_2
this.Control[]={this.st_to,&
this.st_8,&
this.st_7,&
this.st_6,&
this.lv_inbox,&
this.mle_message,&
this.st_cc,&
this.st_from,&
this.st_name,&
this.st_subject,&
this.gb_2}
end on

on tabpage_1.destroy
destroy(this.st_to)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.lv_inbox)
destroy(this.mle_message)
destroy(this.st_cc)
destroy(this.st_from)
destroy(this.st_name)
destroy(this.st_subject)
destroy(this.gb_2)
end on

type st_to from statictext within tabpage_1
integer x = 1655
integer y = 948
integer width = 946
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_8 from statictext within tabpage_1
integer x = 1417
integer y = 1016
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Cc:"
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_1
integer x = 1417
integer y = 948
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "To:"
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_1
integer x = 23
integer y = 1016
integer width = 265
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Subject:"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type lv_inbox from listview within tabpage_1
integer width = 2683
integer height = 908
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean hideselection = false
boolean fullrowselect = true
listviewview view = listviewreport!
string largepicturename[] = {"AddWatch!"}
long largepicturemaskcolor = 536870912
string smallpicturename[] = {"IPML.ICO","RESENDL.ICO"}
long smallpicturemaskcolor = 536870912
string statepicturename[] = {"CLIP.ICO"}
long statepicturemaskcolor = 536870912
end type

event constructor;//Adds a column with a specified label, alignment, and width.
This.AddColumn("From" , Left! , 600)
This.AddColumn("Subject" , Left! , 1500)
This.AddColumn("Received" , Left! , 550)

This.sort(Descending!,3)

end event

event clicked;tab_1.tabpage_1.st_name.text =''
tab_1.tabpage_1.st_to.text =''
tab_1.tabpage_1.st_cc.text =''
tab_1.tabpage_1.st_subject.text =''

wf_read_mail(index)
end event

type mle_message from multilineedit within tabpage_1
integer y = 1092
integer width = 2683
integer height = 992
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_cc from statictext within tabpage_1
integer x = 1655
integer y = 1016
integer width = 974
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_from from statictext within tabpage_1
integer x = 23
integer y = 948
integer width = 265
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "From:"
boolean focusrectangle = false
end type

type st_name from statictext within tabpage_1
integer x = 288
integer y = 948
integer width = 1047
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_subject from statictext within tabpage_1
integer x = 288
integer y = 1016
integer width = 1047
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean focusrectangle = false
end type

type gb_2 from groupbox within tabpage_1
integer y = 912
integer width = 2683
integer height = 188
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 134217729
long backcolor = 67108864
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2702
integer height = 2088
long backcolor = 67108864
string text = "Send"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
sle_subject sle_subject
sle_cc sle_cc
sle_to sle_to
st_1 st_1
cb_2 cb_2
cb_1 cb_1
mle_msg mle_msg
end type

on tabpage_2.create
this.sle_subject=create sle_subject
this.sle_cc=create sle_cc
this.sle_to=create sle_to
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_msg=create mle_msg
this.Control[]={this.sle_subject,&
this.sle_cc,&
this.sle_to,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.mle_msg}
end on

on tabpage_2.destroy
destroy(this.sle_subject)
destroy(this.sle_cc)
destroy(this.sle_to)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_msg)
end on

type sle_subject from singlelineedit within tabpage_2
integer x = 297
integer y = 240
integer width = 2382
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_cc from singlelineedit within tabpage_2
integer x = 297
integer y = 124
integer width = 2382
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_to from singlelineedit within tabpage_2
integer x = 297
integer y = 4
integer width = 2382
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within tabpage_2
integer y = 240
integer width = 274
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Subject:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within tabpage_2
integer y = 124
integer width = 274
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cc..."
end type

event clicked;	string ls_ret,ls_cc,ls_to
	mailReturnCode			mRet	
	MailSession 			ms_adrs
	mailMessage				mMsg		
   int li_num,li_recipients
	
//Updates the mailRecipient array for a mail message
	ms_adrs = ims_mail
	mRet = ms_adrs.mailAddress (mMsg)
	If mRet = mailReturnUserAbort! Then 
		st_5.text = "User Canceled send Mail"		
		Return
	End If
//	ms_adrs.mailRecipientDetails(mMsg.Recipient[1])
	li_recipients = UpperBound(mMsg.recipient)
	for li_num = 1 to li_recipients step 1
			if mMsg.Recipient[li_num].RecipientType	= mailCC! then
				ls_cc = mMsg.Recipient[li_num].Name
			end if
			if mMsg.Recipient[li_num].RecipientType	= mailTo! then					 
				ls_to = mMsg.Recipient[li_num].Name
			end if
   
		if ls_cc <> '' then
			if sle_cc.text <> ''  then
				if  PosA( sle_cc.text, ls_cc ) = 0  then
					 sle_cc.text += '; '+ls_cc
				end if
			else				
				sle_cc.text = ls_cc				
			end if
	   end if
	
	   if ls_to <> '' then
			if sle_to.text <> '' then
				if  PosA( sle_to.text, ls_to ) = 0  then
					 sle_to.text += '; '+ls_to
				end if	 
			else				
				sle_to.text = ls_to
			end if
	   end if
next	
	ls_ret = wf_mailerror_str( mRet, 'Address Mail:', FALSE )
	st_5.text = ' Address Mail: ' + ls_ret
end event

type cb_1 from commandbutton within tabpage_2
integer y = 4
integer width = 274
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "To.&.."
end type

event clicked;	string ls_ret,ls_cc,ls_to
	mailReturnCode			mRet	
	MailSession 			ms_adrs
	mailMessage				mMsg			
   int li_num,li_recipients
	
//Updates the mailRecipient array for a mail message
	ms_adrs = ims_mail
	mRet = ms_adrs.mailAddress (mMsg)
	If mRet = mailReturnUserAbort! Then 
		st_5.text = "User Canceled send Mail"		
		Return
	End If
//	ms_adrs.mailRecipientDetails(mMsg.Recipient[1])
	li_recipients = UpperBound(mMsg.recipient)
	for li_num = 1 to li_recipients step 1
			if mMsg.Recipient[li_num].RecipientType	= mailCC! then
				ls_cc = mMsg.Recipient[li_num].Name
			end if
			if mMsg.Recipient[li_num].RecipientType	= mailTo! then					 
				ls_to = mMsg.Recipient[li_num].Name
			end if
   
		if ls_cc <> '' then
			if sle_cc.text <> ''  then
				if  PosA( sle_cc.text, ls_cc ) = 0  then
					 sle_cc.text += '; '+ls_cc
				end if
			else				
				sle_cc.text = ls_cc				
			end if
	   end if
	
	   if ls_to <> '' then
			if sle_to.text <> '' then
				if  PosA( sle_to.text, ls_to ) = 0  then
					 sle_to.text += '; '+ls_to
				end if	 
			else				
				sle_to.text = ls_to
			end if
	   end if
next	
	ls_ret = wf_mailerror_str( mRet, 'Address Mail:', FALSE )
	st_5.text = ' Address Mail: ' + ls_ret
	
//mailReturnCode mRet
//
//mailRecipient mRecip
//
//mRecip.Name = sle_to.Text
//
//mRet = mSes.mailResolveRecipient(mRecip)
//
//IF mRet <> mailReturnSuccess! THEN
//
//    MessageBox ("Address", &
//
//      sle_to.Text + "not found.")
//
//ELSE
//
//    mRet = mSes.mailRecipientDetails(mRecipient)
//
//    sle_to.Text = mRecipient.Name
//
//END IF
end event

type mle_msg from multilineedit within tabpage_2
integer y = 360
integer width = 2683
integer height = 1724
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

