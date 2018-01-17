$PBExportHeader$w_file_functions.srw
forward
global type w_file_functions from window
end type
type mle_2 from multilineedit within w_file_functions
end type
type cb_4 from commandbutton within w_file_functions
end type
type dw_1 from datawindow within w_file_functions
end type
type cb_2 from commandbutton within w_file_functions
end type
type mle_1 from multilineedit within w_file_functions
end type
type cb_1 from commandbutton within w_file_functions
end type
type lb_1 from listbox within w_file_functions
end type
type gb_1 from groupbox within w_file_functions
end type
type gb_2 from groupbox within w_file_functions
end type
type gb_3 from groupbox within w_file_functions
end type
type gb_4 from groupbox within w_file_functions
end type
end forward

global type w_file_functions from window
integer width = 2702
integer height = 1752
boolean titlebar = true
string title = "File Functions"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_2 mle_2
cb_4 cb_4
dw_1 dw_1
cb_2 cb_2
mle_1 mle_1
cb_1 cb_1
lb_1 lb_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_file_functions w_file_functions

type variables
string is_CurrentDirectory
integer ii_index
end variables

forward prototypes
public subroutine wf_arg_list (string as_function)
public subroutine wf_initi_dw (string as_parm, string as_dwo, datawindow ad_dw)
public subroutine wf_output (multilineedit actl_mle, string as_title, string as_text, boolean ab_flag)
public subroutine wf_execute_script ()
public subroutine wf_init_data ()
end prototypes

public subroutine wf_arg_list (string as_function);//====================================================================
// Function: wf_arg_list()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_function
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
integer li_FileNum
string ls_path,ls_fill


mle_1.text =''
mle_2.text =''
Choose case as_function 
	case 'ChangeDirectory'
		  mle_2.text = 'ChangeDirectory ( directoryname )'
	case 'CreateDirectory'
		  mle_2.text ='CreateDirectory ( directoryname )'		  
	case 'DirectoryExists'
		  mle_2.text ='DirectoryExists ( directoryname )'
	case 'FileClose'		 
		  mle_2.text = 'FileClose ( file# )'		  
	case 'FileCopy'
		  mle_2.text = 'FileCopy ( sourcefile, targetfile {, replace } )'
	case 'FileDelete'	
			mle_2.text = 'FileDelete ( filename )'
	case 'FileExists'	
			mle_2.text = 'FileExists ( filename )'
	case 'FileLength'
			mle_2.text = 'FileLength ( filename )'
	case 'FileMove'
			mle_2.text = 'FileMove ( sourcefile, targetfile )'
	case 'FileOpen'
			mle_2.text = 'FileOpen ( filename {, filemode {, fileaccess {, filelock {, writemode	{ creator, filetype }}}}} )'
	case 'FileRead'		      
			mle_2.text = 'FileRead ( file#, variable )'
	case 'FileSeek'					 
			mle_2.text = 'FileSeek ( file#, position, origin )'
	case 'FileWrite'					
			mle_2.text = 'FileWrite ( file#, variable )'
	case 'GetCurrentDirectory'			  
			mle_2.text = 'GetCurrentDirectory ( )'
	case 'GetFileOpenName'
			mle_2.text = 'GetFileOpenName ( title, pathname, filename {, extension {, filter } } )'
	case 'GetFileSaveName'
			mle_2.text = 'GetFileSaveName ( title, pathname, rfilename {, extension {, filter } } )'
	case 'GetFolder'
		   mle_2.text = 'GetFolder ( title, directory )'
	case 'RemoveDirectory'
			mle_2.text = 'RemoveDirectory ( directoryname )'
end choose
	

end subroutine

public subroutine wf_initi_dw (string as_parm, string as_dwo, datawindow ad_dw);//====================================================================
// Function: wf_initi_dw()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_parm
//		string   as_dwo
//		datawindow ad_dw
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
ad_dw.dataobject = as_dwo
ad_dw.setfilter('col1 = "'+as_parm + '"')
ad_dw.filter()

wf_arg_list(as_parm)
end subroutine

public subroutine wf_output (multilineedit actl_mle, string as_title, string as_text, boolean ab_flag);//====================================================================
// Function: wf_output()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		multilineedit 	actl_mle
//		string			as_title
//		string 			as_text
//		boolean			ab_flag
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
if ab_flag then
	actl_mle.text =''
	ii_index = 0 
end if

actl_mle.text += string(ii_index)+'.'+as_title  + as_text +'~r~n'

ii_index ++
end subroutine

public subroutine wf_execute_script ();//====================================================================
// Function: wf_execute_script()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: APPEON	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_fun,ls_p1,ls_p2,ls_p3,ls_p4,ls_p5,ls_upath,ls_fill,ls_tpath,ls_spath,ls_docname, ls_named,ls_title,ls_directory
integer li_FileNum,li_rtn
boolean lb_bool
long ll_length,ll_seek
filemode lfm
fileaccess lfa
filelock lfl
writemode lwm
n_resfile  lnv_file

//initialize data
wf_init_data()
ls_fun = trim(lb_1.selecteditem())
ls_upath = lnv_file.IS_FilePath

if lnv_file.of_writefile('new.gif') = -1 then return
ChangeDirectory (ls_upath)

dw_1.accepttext()
Choose case ls_fun 
	case 'ChangeDirectory'
		  ls_p1 = dw_1.getitemstring(1,'col3')
		  ls_upath += ls_p1
		  CreateDirectory ( ls_upath )
		  li_rtn = ChangeDirectory ( ls_upath )
		  wf_output(mle_1,'Return value : ',string(li_rtn),True)
		  wf_output(mle_1,'Current Directory : ',GetCurrentDirectory(),False)
		  mle_2.text = 'ChangeDirectory ~r~n(~r~n   '+ ls_upath  +'~r~n~r~n)'
		  //create empty My Folder
		  //reset Current Directory
		  li_rtn = ChangeDirectory ( is_CurrentDirectory )
	case 'CreateDirectory'
		  ls_p1 = dw_1.getitemstring(1,'col3')
		  ls_upath += ls_p1
		  IF DirectoryExists(ls_upath) then RemoveDirectory(ls_upath)
			
		  li_rtn =CreateDirectory ( ls_upath )		   
		  wf_output(mle_1,'Return value : ',string(li_rtn),True)
		  wf_output(mle_1,'Create Directory : ',ls_upath,False)
		  mle_2.text = 'CreateDirectory ~r~n(~r~n   '+ ls_upath  +'~r~n~r~n)'	
		  //create empty my folder
	case 'DirectoryExists'
		  ls_p1 = dw_1.getitemstring(1,'col3')
		  ls_upath += ls_p1
		  li_rtn =CreateDirectory ( ls_upath )	
		  lb_bool = DirectoryExists ( ls_upath )
		  wf_output(mle_1,'Return value : ',string(lb_bool),True)
		  wf_output(mle_1,'Directory Exists : ',ls_upath,False)
		  mle_2.text = 'DirectoryExists ~r~n(~r~n   '+ ls_upath  +'~r~n~r~n)'	
		  //create empty my folder
	case 'FileClose'
		  if lnv_file.of_writefile('new.gif') = -1 then return
		
		  ls_upath = lnv_file.IS_FilePath +'new.gif'
		  li_FileNum = FileOpen(ls_upath)
		  li_rtn = FileClose(li_FileNum)		  
		  wf_output(mle_1,'Open File : ' , ls_upath,True)
		  wf_output(mle_1,'Return value : ',string(li_rtn),False)
		  mle_2.text = 'FileClose ~r~n(~r~n   '+ string(li_FileNum) +'~r~n)'
	case 'FileCopy'
		   ls_p1 = dw_1.getitemstring(1,'col2')
			ls_p2 = dw_1.getitemstring(1,'col3')
			ls_p3 = dw_1.getitemstring(1,'col4')
			
			ls_upath += 'My Folder'
		   li_rtn =CreateDirectory ( ls_upath )
			ls_upath += '\'
			ls_spath = ls_upath + ls_p1
			ls_tpath = lnv_file.IS_FilePath + ls_p2
			li_FileNum = FileOpen(ls_spath,LineMode!,Write!)
			FileClose(li_FileNum)
			choose case trim(ls_p3)
				case 'True'
					 li_FileNum = FileOpen(ls_tpath,LineMode!,Write!)
					 FileClose(li_FileNum)
					 li_rtn = FileCopy(ls_spath,ls_tpath,True)
					 mle_2.text = 'FileCopy ~r~n(~r~n   '+ls_spath+',~r~n   ' +ls_tpath+ ',~r~n~r~n   True ~r~n~r~n)'
				case 'False'
					 li_rtn = FileCopy(ls_spath,ls_tpath,False)
					 mle_2.text = 'FileCopy ~r~n(~r~n   '+ls_spath+',~r~n   ' +ls_tpath+ ',~r~n~r~n   False ~r~n~r~n)'
				case else
					 li_rtn = FileCopy(ls_spath,ls_tpath)
					 mle_2.text = 'FileCopy ~r~n(~r~n   '+ls_spath+',~r~n   ' +ls_tpath+ '~r~n~r~n)'
			end choose
			wf_output(mle_1,'Return value : ',string(li_rtn),True)			  
	case 'FileDelete'	
		   ls_p1 = dw_1.getitemstring(1,'col3')
			ls_upath += ls_p1
			li_FileNum = FileOpen(ls_upath,LineMode!,Write!)
			FileClose(li_FileNum)
			lb_bool = FileDelete ( ls_upath )			
			wf_output(mle_1,'Return value : ',string(lb_bool),True)
			lb_bool = FileExists ( ls_upath )
			wf_output(mle_1,'File Exists : ',string(lb_bool),False)
			mle_2.text = 'FileDelete ~r~n(~r~n   '+ ls_upath +'~r~n~r~n)'
			
	case 'FileExists'	
		   ls_p1 = dw_1.getitemstring(1,'col3')
			ls_upath += ls_p1
			li_FileNum = FileOpen(ls_upath,LineMode!,Write!)
			lb_bool = FileExists ( ls_upath )
			wf_output(mle_1,'Create File : ',ls_p1,True)
		   wf_output(mle_1,'Return value : ',string(lb_bool),False)
			mle_2.text = 'FileExists ~r~n(~r~n   '+ ls_upath +'~r~n~r~n)'
			FileClose(li_FileNum)
	case 'FileLength'
		   ls_p1 = dw_1.getitemstring(1,'col3')
			ls_upath += ls_p1
			li_FileNum = fileopen(ls_upath,LineMode!,Write!)
			ls_fill = FillA("-+", 32766)
			FileWrite ( li_FileNum, ls_fill)
			FileClose(li_fileNum)
			ll_length = FileLength(ls_upath)
			wf_output(mle_1,'File Name : ',ls_upath,True)
			wf_output(mle_1,'Return value : ',string(ll_length),False)
			mle_2.text = 'FileLength ~r~n(~r~n   '+ ls_upath +'~r~n~r~n)'
			
	case 'FileMove'
			ls_p1 = dw_1.getitemstring(1,'col2')
			ls_p2 = dw_1.getitemstring(1,'col3')
			ls_upath += 'My Folder'
			IF NOT DirectoryExists(ls_upath) then CreateDirectory(ls_upath)
			ls_upath += '\'
			ls_spath = ls_upath + ls_p1
			ls_tpath = lnv_file.IS_FilePath + ls_p2
			IF FileExists(ls_tpath) then FileDelete(ls_tpath)
			li_FileNum = FileOpen(ls_spath,LineMode!,Write!)
			FileClose(li_FileNum)
			li_rtn = FileMove(ls_spath,ls_tpath)
		   wf_output(mle_1,'Return value : ',string(li_rtn),True)		   
			mle_2.text = 'FileMove ~r~n(~r~n   '+ ls_spath +',~r~n   '+ ls_tpath + '~r~n~r~n)'
			IF lb_bool Then
				wf_output(mle_1,'Warning : ','You cannot write to a target file if a file with the same name already exists in the target directory.',False)
			End IF	
	case 'FileOpen'
		   ls_p1 = dw_1.getitemstring(1,'col2')
			ls_p2 = dw_1.getitemstring(1,'col3')
			ls_p3 = dw_1.getitemstring(1,'col4')
			ls_p4 = dw_1.getitemstring(1,'col5')
			ls_p5 = dw_1.getitemstring(1,'col6')
			
		   choose case trim(ls_p2)
				case 'LineMode!'
					   lfm = LineMode!
				case 'StreamMode!'
					   lfm = StreamMode!
			end choose
			choose case trim(ls_p3)
				case 'Read!'
					   lfa = Read!
				case 'Write!'
					   lfa = Write!
			end choose
			choose case trim(ls_p4)
				case 'LockReadWrite!'
					   lfl = LockReadWrite!
				case 'LockRead!'
					   lfl = LockRead!
				case 'LockWrite!'
					   lfl = LockWrite!
				case 'Shared!'
					   lfl = Shared!
			end choose
			choose case trim(ls_p5)
				case 'Append!'
					   lwm = Append!
				case 'Replace!'
					   lwm = Replace!
			end choose
			ls_upath +=ls_p1 
			if (not FileExists(ls_upath)) and lfa = Read! then
				li_FileNum = FileOpen(ls_upath,lfm,Write!)
				FileClose(li_FileNum)
			end if
			li_FileNum = FileOpen(ls_upath,lfm,lfa,lfl,lwm)
			wf_output(mle_1,'Open File : ',ls_upath,True)
			wf_output(mle_1,'Return value : ',string(li_FileNum),False)
			mle_2.text = 'FileOpen ~r~n(~r~n   '+ls_upath+ ', ~r~n~r~n   ' +ls_p2+ ',~r~n~r~n   '+ ls_p3+ ',~r~n~r~n   ' +ls_p4+ ',~r~n~r~n   '+ ls_p5+ '~r~n~r~n)'
			FileClose(li_FileNum)
	case 'FileRead'		   
			ls_p2 = dw_1.getitemstring(1,'col3')		
			
			if lnv_file.of_writefile('file.txt') = -1 then return
		
		   ls_upath = lnv_file.IS_FilePath +'file.txt'				
			//first write a bit of char
		   li_FileNum = FileOpen(ls_upath,StreamMode!,Write!,Shared!,Append!)					
			ls_fill = 'Who are you?~r~n'
			FileWrite ( li_FileNum, ls_fill)
			FileClose(li_FileNum)
			
			li_FileNum = FileOpen(ls_upath,StreamMode!,Read!,Shared!)			
			ls_p1 = string(li_FileNum)	
			choose case trim(ls_p2)
				case 'String'
					 string ls_data
					 li_rtn = FileRead(li_FileNum,ls_data)
					 wf_output(mle_1,'Open File : ' , ls_upath,True)
					 wf_output(mle_1,'Return value : ',string(li_rtn),False)
					 wf_output(mle_1,'ls_data = ',ls_data,False)
					 mle_2.text = 'FileRead ~r~n(~r~n   '+ls_p1+',~r~n~r~n   '+'ls_data ~r~n~r~n)'
				case 'Blob'
					 Blob lblb_bb
					 li_rtn = FileRead(li_FileNum,lblb_bb)
					 wf_output(mle_1,'Open File : ' , ls_upath,True)
					 wf_output(mle_1,'Return value : ',string(li_rtn),False)
					 wf_output(mle_1,'string(lblb_bb) = ',string(lblb_bb),False)
					 mle_2.text = 'FileRead ~r~n(~r~n   '+ls_p1+',~r~n~r~n  '+' lblb_bb ~r~n~r~n)'
			end choose	
			FileClose(li_FileNum)
	case 'FileSeek'			
			ls_p2 = dw_1.getitemstring(1,'col3')
			ls_p3 = dw_1.getitemstring(1,'col4')
			ll_seek = long(ls_p2)			
			
			if lnv_file.of_writefile('file.txt') = -1 then return
		
		   ls_upath = lnv_file.IS_FilePath +'file.txt'		
			li_FileNum = FileOpen(ls_upath)
			ls_p1 = string(li_FileNum)			
			choose case trim(ls_p3)
				case 'FromBeginning!'
					ll_length = FileSeek(li_FileNum,ll_seek,FromBeginning!)
				case 'FromCurrent!'
					ll_length = FileSeek(li_FileNum,ll_seek,FromCurrent!)
				case 'FromEnd!'
					ll_length = FileSeek(li_FileNum,ll_seek,FromEnd!)
			end choose
			wf_output(mle_1,'Open File : ' , ls_upath,True)
			wf_output(mle_1,'Return value : ',string(ll_length),False)			
			mle_2.text = 'FileSeek ~r~n(~r~n   '+ls_p1+',~r~n~r~n   '+ls_p2+',~r~n~r~n   '+ls_p3+' ~r~n~r~n)'
			FileClose(li_FileNum)
	case 'FileWrite'			
			ls_p2 = dw_1.getitemstring(1,'col3')	 
		   ls_upath = lnv_file.IS_FilePath +'file.txt'				
		   li_FileNum = FileOpen(ls_upath,StreamMode!,Write!,Shared!,Replace!)
			ls_p1 = string(li_FileNum)				
			choose case trim(ls_p2)
				case 'String'
					 string ls_wdata
					 ls_wdata = 'String APPEON~r~n'
					 li_rtn = FileWrite(li_FileNum,ls_wdata)
					 wf_output(mle_1,'Open File : ' , ls_upath,True)
					 wf_output(mle_1,'Return value : ',string(li_rtn),False)
					 wf_output(mle_1,'ls_wdata = ',ls_wdata,False)					 
					 mle_2.text = 'FileWrite ~r~n(~r~n   '+ls_p1+',~r~n~r~n  '+' ls_wdata ~r~n~r~n)'
				case 'Blob'
					 Blob lblb_wbb
					 lblb_wbb = Blob('Blob APPEON~r~n')
					 li_rtn = FileWrite(li_FileNum,lblb_wbb)
					 wf_output(mle_1,'Open File : ' , ls_upath,True)
					 wf_output(mle_1,'Return value : ',string(li_rtn),False)
					 wf_output(mle_1,'string(lblb_wbb) = ',string(lblb_wbb),False)					
					 mle_2.text = 'FileWrite ~r~n(~r~n   '+ls_p1+',~r~n~r~n  '+' lblb_wbb ~r~n~r~n)'
			end choose	
			FileClose(li_FileNum)
	case 'GetCurrentDirectory'	
		   ls_p1 = GetCurrentDirectory()
		   wf_output(mle_1,'CurrentDirtectory : ',ls_p1,True)
			mle_2.text = 'GetCurrentDirectory ( )'
	case 'GetFileOpenName'
		  ls_p1 = dw_1.getitemstring(1,'col2')
		  ls_p2 = dw_1.getitemstring(1,'col3')
		  ls_p3 = dw_1.getitemstring(1,'col4')
		  ls_p4 = dw_1.getitemstring(1,'col5')
		  ls_p5 = dw_1.getitemstring(1,'col6')
		  mle_2.text = 'GetFileOpenName ~r~n(~r~n   '+ls_p1+',~r~n~r~n   '+ ls_p2 +',~r~n~r~n   '+ ls_p3+ ',~r~n~r~n   ' +ls_p4+ ',~r~n~r~n   '+ ls_p5+ '~r~n~r~n)'
		  li_rtn = GetFileOpenName (ls_p1,ls_docname, ls_named,ls_p4,ls_p5)
		  wf_output(mle_1,'Return value : ',string(li_rtn),true)
		  wf_output(mle_1,'ls_docname = ',ls_docname,False)
		  wf_output(mle_1,'ls_named = ',ls_named,False)			
	case 'GetFileSaveName'	
		  ls_p1 = dw_1.getitemstring(1,'col2')
		  ls_p2 = dw_1.getitemstring(1,'col3')
		  ls_p3 = dw_1.getitemstring(1,'col4')
		  ls_p4 = dw_1.getitemstring(1,'col5')
		  ls_p5 = dw_1.getitemstring(1,'col6')
		  mle_2.text = 'GetFileSaveName ~r~n(~r~n   '+ls_p1+',~r~n~r~n   '+ ls_p2 +',~r~n~r~n   '+ ls_p3+ ',~r~n~r~n   ' +ls_p4+ ',~r~n~r~n   '+ ls_p5+ '~r~n~r~n)'
		  li_rtn = GetFileSaveName (ls_p1,ls_docname, ls_named,ls_p4,ls_p5)
		  wf_output(mle_1,'Return value : ',string(li_rtn),true)
		  wf_output(mle_1,'ls_docname = ',ls_docname,False)
		  wf_output(mle_1,'ls_named = ',ls_named,False)		  
	case 'GetFolder'
			ls_title = dw_1.getitemstring(1,'col2')
			ls_directory = dw_1.getitemstring(1,'col3')
			mle_2.text = 'GetFolder ~r~n(~r~n   '+ls_title+',~r~n~r~n   '+ ls_directory +',~r~n~r~n)'
			li_rtn = GetFolder(ls_title,ls_directory)
			wf_output(mle_1,'Return value : ',string(li_rtn),true)
		   wf_output(mle_1,'ls_title = ',ls_title,False)
		   wf_output(mle_1,'ls_directory = ',ls_directory,False)		   
	case 'RemoveDirectory'
			ls_p1 = dw_1.getitemstring(1,'col3')
		  	ls_upath += ls_p1
			li_rtn =CreateDirectory ( ls_upath )	  
		  	li_rtn = RemoveDirectory ( ls_upath )	
			lb_bool = DirectoryExists ( ls_upath) 
			wf_output(mle_1,'Create Directoty : ',ls_upath,True)
		  	wf_output(mle_1,'Return value : ',string(li_rtn),False)
		  	wf_output(mle_1,'Directory Exists : ',string(lb_bool),False)
		  	mle_2.text = 'RemoveDirectory ~r~n(~r~n   '+ ls_upath  +'~r~n~r~n)'	
	case ''		  
	     Messagebox('Warning','Please select testing file function.')
		  return
end choose
end subroutine

public subroutine wf_init_data ();//====================================================================
// Function: wf_init_data()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:  	None
//--------------------------------------------------------------------
// Returns: 		(none)
//--------------------------------------------------------------------
// Author: 		zhouchaoqun	 		Date: 2005/04/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
string ls_path,ls_file
int li
boolean lb

//Set Current Directory
li = ChangeDirectory ( is_CurrentDirectory )
//Delete test file
ls_file = is_CurrentDirectory +'\My Folder\test.txt'
IF FileExists(ls_file) Then
	lb = FileDelete ( ls_file )
End If
//Delete Empty Directory
ls_path = is_CurrentDirectory +'\My Folder'
If DirectoryExists (ls_path) Then
	li = RemoveDirectory ( ls_path )
End If

//Delete test file
ls_file = is_CurrentDirectory +'\test.txt'
IF FileExists(ls_file) Then
	lb = FileDelete ( ls_file )
End If

//Create file
ls_file = is_CurrentDirectory+'\file.txt'
IF not FileExists(ls_file) Then
	li = FileOpen ( ls_file,LineMode!,Write!)
	FileClose(li)
End If











end subroutine

on w_file_functions.create
this.mle_2=create mle_2
this.cb_4=create cb_4
this.dw_1=create dw_1
this.cb_2=create cb_2
this.mle_1=create mle_1
this.cb_1=create cb_1
this.lb_1=create lb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.mle_2,&
this.cb_4,&
this.dw_1,&
this.cb_2,&
this.mle_1,&
this.cb_1,&
this.lb_1,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4}
end on

on w_file_functions.destroy
destroy(this.mle_2)
destroy(this.cb_4)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.lb_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;This.X = 0
This.Y = 0
is_CurrentDirectory = GetCurrentDirectory ( )
wf_output(mle_1,'CurrentDirectory',is_CurrentDirectory,True)
end event

type mle_2 from multilineedit within w_file_functions
integer x = 1797
integer y = 80
integer width = 791
integer height = 908
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_file_functions
integer x = 1874
integer y = 1056
integer width = 357
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear &All"
end type

event clicked;//====================================================================
// Event: cllicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Event ID
//		pbm_bnclicked
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
mle_1.text =''
end event

type dw_1 from datawindow within w_file_functions
integer x = 878
integer y = 76
integer width = 795
integer height = 916
integer taborder = 30
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_file_functions
integer x = 1486
integer y = 1056
integer width = 357
integer height = 108
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
// Event: cllicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Event ID
//		pbm_bnclicked
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
wf_execute_script()
end event

type mle_1 from multilineedit within w_file_functions
integer x = 59
integer y = 1228
integer width = 2537
integer height = 356
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_file_functions
integer x = 2263
integer y = 1056
integer width = 357
integer height = 108
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
// Event: cllicked()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Event ID
//		pbm_bnclicked
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================
Close(Parent)
end event

type lb_1 from listbox within w_file_functions
integer x = 59
integer y = 76
integer width = 699
integer height = 916
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
string item[] = {"ChangeDirectory","CreateDirectory","DirectoryExists","FileClose","FileCopy","FileDelete","FileExists","FileLength","FileMove","FileOpen","FileRead","FileSeek","FileWrite","GetCurrentDirectory","GetFileOpenName","GetFileSaveName","GetFolder","RemoveDirectory"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Event ID
//		pbm_lbnselchange
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: xunengli	 		Date: 2004/10/26
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2004----???? Appeon Inc.
//====================================================================

Choose case this.text(index) 
	case 'ChangeDirectory','CreateDirectory','DirectoryExists','RemoveDirectory','FileDelete','FileExists','FileLength','FileClose'
		  	wf_initi_dw(this.text(index),'d_filefunction_p1',dw_1)
	case 'FileCopy'
			wf_initi_dw(this.text(index),'d_filefunction_p3',dw_1)
	case 'FileMove'
			wf_initi_dw(this.text(index),'d_filefunction_p2',dw_1)
	case 'FileOpen'
		   wf_initi_dw(this.text(index),'d_filefunction_p5',dw_1)
	case 'FileRead','FileWrite'
		   wf_initi_dw(this.text(index),'d_filefunction_p4',dw_1)
	case 'FileSeek'
		   wf_initi_dw(this.text(index),'d_filefunction_p6',dw_1)	
	case 'GetCurrentDirectory'		
			dw_1.reset()
	case 'GetFileOpenName'
			wf_initi_dw(this.text(index),'d_filefunction_p7',dw_1)
	case 'GetFileSaveName'		
			wf_initi_dw(this.text(index),'d_filefunction_p7',dw_1)
			dw_1.Modify("col4_t.Text = 'RfileName :'")
	case 'GetFolder'	
			wf_initi_dw(this.text(index),'d_filefunction_p2',dw_1)
			dw_1.Modify("col2_t.Text = 'title :'")
			dw_1.Modify("col3_t.Text = 'directory :'")
end choose

end event

type gb_1 from groupbox within w_file_functions
integer x = 18
integer y = 8
integer width = 786
integer height = 1024
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "File Functions"
end type

type gb_2 from groupbox within w_file_functions
integer x = 837
integer y = 8
integer width = 882
integer height = 1024
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Argument"
end type

type gb_3 from groupbox within w_file_functions
integer x = 1755
integer y = 8
integer width = 873
integer height = 1024
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Synax"
end type

type gb_4 from groupbox within w_file_functions
integer x = 23
integer y = 1164
integer width = 2610
integer height = 452
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "OutPut"
end type

