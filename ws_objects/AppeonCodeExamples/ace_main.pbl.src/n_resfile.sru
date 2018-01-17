$PBExportHeader$n_resfile.sru
$PBExportComments$获取资源文件信息
forward
global type n_resfile from nonvisualobject
end type
end forward

global type n_resfile from nonvisualobject autoinstantiate
end type

type variables
Constant  String IS_FILEPATH = 'C:\ACETemp\'
end variables

forward prototypes
public function blob of_readfile (string as_path)
public subroutine of_updatefile ()
public function integer of_writefile (string as_filename)
end prototypes

public function blob of_readfile (string as_path);//====================================================================
// Function: of_readfile()
//--------------------------------------------------------------------
// Description: Read File
//--------------------------------------------------------------------
// Arguments:  String   as_path
//--------------------------------------------------------------------
// Returns:    blob
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/04/01
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

integer li_FileNum, loops, i
long flen, bytes_read, new_pos
blob b, tot_b

// Set a wait cursor
SetPointer(HourGlass!)
// Get the file length, and open the file
flen = FileLength(as_path)
li_FileNum = FileOpen(as_path,StreamMode!, Read!, LockRead!)
// Determine how many times to call FileRead
IF flen > 32765 THEN
        IF Mod(flen, 32765) = 0 THEN
            loops = flen/32765
        ELSE
            loops = (flen/32765) + 1
        END IF
ELSE
        loops = 1
END IF

// Read the file
new_pos = 1
FOR i = 1 to loops
        bytes_read = FileRead(li_FileNum, b)
        tot_b = tot_b + b
NEXT

FileClose(li_FileNum)
SetPointer(Arrow!)

return tot_b
end function

public subroutine of_updatefile ();//====================================================================
// Function: of_updatefile()
//--------------------------------------------------------------------
// Description: (N/A) 
//--------------------------------------------------------------------
// Arguments:   (N/A)
//--------------------------------------------------------------------
// Returns:     (N/A)
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/04/01
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

string  ls_array[],ls_id
long    ll_num 
blob    lb_blob

ls_array = {'appeon.jpg','CAKE.JPG','donews_88.gif','expense.ole','expense.xls','file.txt','ImportFile.txt','mystuff.ole','new.gif','tshirto.bmp'}

For ll_num = 1 to upperbound(ls_array[])
	lb_blob = of_readfile('E:\res\' + ls_array[ll_num])
	ls_id   = string(ll_num,'000')
	Delete From res_file where res_id = :ls_id; Commit;
	INSERT INTO res_file (res_id,res_filename,res_remark)	VALUES (:ls_id,:ls_array[ll_num],'');COMMIT;
	UPDATEBLOB res_file set res_image = :lb_blob where res_id = :ls_id;
	
	if sqlca.sqlcode = 0 then
		COMMIT using sqlca;
//		messagebox("","Executed successed")
	else
		Rollback using sqlca;
		Messagebox("","Executed Failed!")
	end if
NEXT





end subroutine

public function integer of_writefile (string as_filename);//====================================================================
// Function: of_writefile()
//--------------------------------------------------------------------
// Description: Write File
//--------------------------------------------------------------------
// Arguments:  String   as_filename
//--------------------------------------------------------------------
// Returns:    integer
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/04/01
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
integer li_FileNo, li_Writes, li_Cnt
long ll_BlobLen, ll_CurrentPos
blob lblb_Data,lb_file
string   ls_path

IF not DirectoryExists(is_filepath) THEN CreateDirectory(is_filepath)

ls_path = is_filepath + as_filename
IF FileExists(ls_path) then return 1

SelectBlob res_image into :lb_file From Res_file Where res_filename = :as_filename;
if sqlca.sqlcode < 0 then return -1

li_FileNo = FileOpen(ls_path,StreamMode!,Write!,LockReadWrite!, Append!)
If li_FileNo < 0 Then Return -1
ll_BlobLen = LenA(lb_file) 

// Determine the number of writes required to write the entire blob
If ll_BlobLen > 32765 Then
 If Mod(ll_BlobLen, 32765) = 0 Then
	 li_Writes = ll_BlobLen / 32765
 Else
	 li_Writes = (ll_BlobLen / 32765) + 1
 End if
Else
 li_Writes = 1
End if 

ll_CurrentPos = 1 

For li_Cnt = 1 To li_Writes
 lblb_Data = BlobMid(lb_file, ll_CurrentPos, 32765)
 ll_CurrentPos += 32765
 If FileWrite(li_FileNo, lblb_Data) = -1 Then
	 Return -1
 End if
Next

FileClose(li_FileNo)
Return 1
end function

on n_resfile.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_resfile.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

