﻿$PBExportHeader$w_dde_server.srw
$PBExportComments$Works with w_dde_client to demonstrate how to do a PB DDE server
forward
global type w_dde_server from window
end type
type cb_2 from commandbutton within w_dde_server
end type
type cb_1 from commandbutton within w_dde_server
end type
type ole_excel from olecontrol within w_dde_server
end type
type gb_1 from groupbox within w_dde_server
end type
end forward

global type w_dde_server from window
integer x = 23
integer y = 140
integer width = 2171
integer height = 1156
boolean titlebar = true
string title = "DDE Server for Excel Application"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = popup!
long backcolor = 78748035
toolbaralignment toolbaralignment = alignatleft!
cb_2 cb_2
cb_1 cb_1
ole_excel ole_excel
gb_1 gb_1
end type
global w_dde_server w_dde_server

type variables

end variables

forward prototypes
public subroutine check_hotlink (checkbox status, string data, string item)
end prototypes

public subroutine check_hotlink (checkbox status, string data, string item);
end subroutine

on w_dde_server.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ole_excel=create ole_excel
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.ole_excel,&
this.gb_1}
end on

on w_dde_server.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ole_excel)
destroy(this.gb_1)
end on

event open;this.Move(1317, 0)
this.Resize(2162, 1176)
end event

type cb_2 from commandbutton within w_dde_server
integer x = 1678
integer y = 944
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;Close(Parent)
end event

type cb_1 from commandbutton within w_dde_server
integer x = 1454
integer y = 704
integer width = 567
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Activate Excel Server"
end type

event clicked;//====================================================================
// Event: Clicked()
//--------------------------------------------------------------------
// Description: Open Excel File
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_close]
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2006/04/21
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string ls_path,ls_FilePath
Integer li_return
n_resfile  lnv_file

li_return = RegistryGet("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\excel.exe","Path",RegString!,ls_path)
if li_return = -1 then return

ls_FilePath = lnv_file.IS_FilePath + 'expense.xls'
if Not FileExists(ls_path) then
	if lnv_file.of_writefile('expense.xls') = -1 then return
end if

ls_path = ls_path + 'EXCEL.EXE'
li_return = Run(ls_path + ' ' + ls_FilePath,Normal!)
if li_return = -1 then return

end event

type ole_excel from olecontrol within w_dde_server
integer x = 46
integer y = 156
integer width = 2043
integer height = 472
integer taborder = 10
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_dde_server.win"
string displayname = "excel"
omdisplaytype displaytype = displayascontent!
omcontentsallowed contentsallowed = containsany!
end type

type gb_1 from groupbox within w_dde_server
integer x = 18
integer y = 12
integer width = 2103
integer height = 896
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Excel Server"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
00w_dde_server.bin 
2300002200e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000009fffffffe00000004000000050000000600000007000000080000000afffffffe0000000b0000000c0000000d0000000e0000000ffffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000020002082000000000000000c0460000000000000000000000000000006cbd2bc001c6489d000000030000174000000000004f00010065006c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000102000affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000140000000000430001006d006f004f0070006a0062000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010200120000000100000004ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000010000006600000000006f0057006b0072006f0062006b006f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000003000009fe00000000fffffffe00000002fffffffe0000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f000000100000001100000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f000000200000002100000022000000230000002400000025000000260000002700000028000000290000002afffffffe0000002c0000002d0000002e0000002f000000300000003100000032000000330000003400000035000000360000003700000038000000390000003a0000003b0000003c0000003d0000003e0000003f000000400000004100000042000000430000004400000045000000460000004700000048000000490000004a0000004b0000004c0000004d0000004e0000004f0000005000000051000000520000005300000054fffffffe000000560000005700000058fffffffe0000005a0000005b0000005cfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
23ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff02000001000000000000000000000000000000000017c3f80020002c006e0069006500740065006700200072007000780073006f0020002c006e006900650074fffe000100000a03ffffffff0002082000000000000000c0460000000000001a7263694d666f736f78452074206c65636b726f57656568730006007469420000003866660000000e6563784568532e6c2e74656539f40038000071b200000000000000000072000000740065007200750073006e006c0020006e006f00200067001008090005060007cd1cfe000040c100000106000200e100c104b000000002000000e20070005c4400000b20676e65686965772020617520202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202000020042016104b000000002000001c00002013d009c0001000e0002000800de0000000c050000040002001900120000000000020002001301af000000000002000201bc003d000000f0001236240069003817bb000000000258000100020040008d00000000000200020022000e000000010002000201b700da00000000000200140031000000f001907fff00000000010200864f535b8b00140031000000f001907fff00000000010200864f535b8b00140031000000f001907fff00000000010200864f535b8b00140031000000f001907fff00000000010200864f535b8b00140031000000b401907fff00000000010200864f535b8b002b041e00130005e5002201230022ff23002c003000230022003b0022ffe5002d005c002c002300230023001e0030000600350401001800ffe50022002300220023002c00300023005b003b00650052005d0064ffe50022005c00220023002d0023002c003000230037041e00190007e5002201230022ff23002c003000230030002e003b003000e50022005c0022ff23002d0023002c003000230030002e001e0030000800410401001e00ffe50022002300220023002c003000230030002e003b00300052005b006400650022005d0022ffe5002d005c002c002300230023002e0030003000300069041e0032002a20005f01e50022002a0022ff2300200023002c003000230020005f005f003b002200200022ffe50020002a002d005c002c002300230023005f0030003b00200020005f00e50022002a0022ff2200200022002d0020005f005f003b004000200020005f002e041e0029002900205f00002c23202a5f302323205f3b202d5c202a23232c233b205f30202a205f5f222d22205f3b201e205f402c00790401003a000020005fffe50022002a0022002300200023002c003000230030002e005f0030003b00200020005fffe50022002a0022005c00200023002d0023002c003000230030002e005f0030003b00200020005fffe50022002a0022002200200022002d003f003f0020005f005f003b004000200020005f0036041e0031002b2a205f00232c2320302e30233b205f30202a205f2c232d5c2e302323205f30302a205f3b222d2220205f3f3f40205f3b041e205f0017001a5c000015232c2324295f30235c285c3b232c2324295c3023001f041e001a001823245c003023232c5b3b295f5d646552245c285c23232c231e295c301900200400001b002c23245c2e302323295f30305c285c3b232c2324302e30231e295c301a002504000020002c23245c2e302323295f303065525b3b285c5d642c23245c2e302323295c3030001400e0000000000020fff5000000000000000020c00000001400e0000000010020fff50000f4000000000020c00000001400e0000000010020fff50000f4000000000020c00000001400e0000000020020fff50000f4000000000020c00000001400e0000000020020fff50000f4000000000020c00000001400e0000000000020fff50000f4000000000020c00000001400e0000000000020fff50000f4000000000020c00000001400e0000000000020fff50000f4000000000020c00000001400e0000000000020fff50000f4000000000020c00000001400e0000000000020fff50000f4000000000020c00000001400e0000000000020fff50000f4000000000020c00000001400e0000000000020fff50000f4000000000020c00000001400e0000000000020fff50000f4000000000020c00000001400e0000000000020fff50000f4000000000020c00000001400e0000000000020fff50000f4000000000020c00000001400e00000000000200001000000000000000020c00000001400e00000000000200000000080000000000020c0000000040293ff008000000201600085000006f1001000000000724600086f666565008c6d720056000401c1005601c100086960000000fc0001001400a100110000000700006e69460065636e614a0000066164726f0000056e696c754a000002650009414d72614d006974656b0008676e707345007a6f6e6900000761696c654d05617373205200000744202668570000656e7469000004796e6172465300000573656c6143000004066e69686850000070696c69470000020000084170696853676e6970420000087274726509646e61654a0000656e6e61ff65747408001a00
2B0006360000000c0000067f00000055000006c3000000990000000a001008090010060000cd1cfe000040c1070001060002000d000c0001006400020002000f00110001000000020008001000f1a9fc0050624dd202005f3f2a0001000000020002002b008200000001000200080080000000000000000000040225001d000000020081011404c10015000000830000000000020002008400a10000000000220001011d0001000100000004000000000000000000003fe00000000000003fe000020055000000080000000e0205000000000000000000060010020800000000001d000600000000010f01000010020800000001001d000600000000010f01000010020800000002001d000600000000010f01000010020800000003001d000600000000010f01000010020800000004001d000600000000010f0100000a00fd0000000000000010007e00000000000a0210000100628000000a00fd400200000001001000fd00000000000a0010000300000002000a027e000400000000001000fd40e91d00000a0010000500000003000a00fd0000000100040010007e00000001000a0210000100670000000a00fd400200010005001000fd00000001000a0010000300000006000a027e000400010040001000fd40e1d101000a0010000500000003000a00fd0000000200070010007e00000002000a0210000100598000000a00fd400200020008001000fd00000002000a0010000300000009000a027e000400020080001000fd40e65002000a0010000500000003000a00fd00000003000a0010007e00000003000a0210000100602000000a00fd40020003000b001000fd00000003000a001000030000000c000a027e000400030040001000fd40ecc603000a001000050000000d000a00fd00000004000e0010007e00000004000a021000010067e000000a00fd40020004000f001000fd00000004000a0010000300000010000a027e000400040080001000fd40e00104000a0010000500000003000e00d7000002080054005000540054003e005400b6001202000000060000400000000000000000000f001d0000030300000000020003000102020003000600ef00370005000a000000000000ffffffff000000030000000400000001ffffffff000000020000000000002cc0000009ec00000a220009000105110300000600000000001c00050000020900000000000000000005ffff0201000500ff010400000000000d000000050002010200050000020c000001b10060000000030004001e012700000003ffff001e000000000004ffff0127000000050000020b00030000001e000000000005ffff0201000500ff020900000000000000000004ffff0127000000030005001e0201000000ffffff0000000500000209000700000416000001b100600000000000000004ffff0127000000030005001e0201000000ffffff0000000500000209000700000416000001b100600000000000000004ffff0127000000030005001e0201000000ffffff0000000500000209000700000416000001b10060000100010000001c004f00020065006c0072005000730065003000300000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000200180000000300000005ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000002b00000a640000000000530005006d00750061006d00790072006e0049006f0066006d007200740061006f00690000006e00000000000000000000000000000000000000000000000001020028ffffffff00000006ffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000055000000c400000000004400050063006f006d0075006e006500530074006d00750061006d00790072006e0049006f0066006d007200740061006f00690000006e000000000000000000020038ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000059000000f8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff002fb00000000019000008600000000000000e5cccecb77f47d0000000040bd0a084c77f4acbd77f4acc60000000100300000000000040000012d00000005000d01040005000001020000000000010000001200030a320007000369460000636e616e000800650008000800080008000800080000000c00030a32000300763431000000080038000800080000001000030a32000600936f4a00006e6164720008000800080008000800080000000f00030a32000500db754a00000065696c0008000800080008000f00080a320000013e000300000005333431350008003200080008000800080000000a00030a320002016b414d0000000800080000001c001002fb0000000702bc000086000000220202017473795300006d65000a00000004000000000000ffffffff0000000100300000000000040001012d00000004ffff0127000000030004001e012d0000000500000201000000ffffff00000005
25000002090007000004160000004800260001001400000005000d01040005000001020000000000010000001500160a3200090003614d000074656b7200676e690008000800080008000800080008000800040008012d000000040001012700000003ffff001e0000000000040000012d00000005ffff0201000500ff02090000000000000000000700600416000101b100050001010400000000000d0000000500010102000c00000a32000000760016000000033334383100080008001300080a320000009300160000000869707345617a6f6e000800080008000800080008000800080000001200160a32000700db654d00007373696c000861610008000800080008000800080000000f00160a320005013e36330000003039340008000800080008000a00080a320000016b0016000000020008414d000f00080a3200000003002900000005202620520008004400080008000800080000000c00290a32000300763031000000082032000800080000001200290a320007009368570000656e7469000861790008000800080008000800080000000d00290a32000400db7246000000086e6100080008000f00080a320000013e002900000005303735340008003000080008000800080000000a00290a320002016b414d0000000800080000000f003c0a3200050003615300000073656c0008000800080008000c00080a3200000076003c000000036539323100080008000d00080a3200000093003c000000046e696843000800080008000800000010003c0a32000600db6850000070696c690008000800080008000800080000000f003c0a320005013e38350000003033390008000800080008000a00080a320000016b003c0000000200084147001300080a3200000003004f0000000870696853676e6970000800080008000800080008000800080000000c004f0a320003007639310000000833310008000800000013004f0a320008009365420000617274720008646e00080008000800080008000800040008012d000000040001012700000003ffff001e0000000000040000012d00000005ffff0201000500ff020900000000000000000007005f0416004d0120000500d9010400000000000d0000000500010102001500000a32000000db004f000000096e61654a7474656e0008006500080008000800080008000800080008000000040001012d00000004ffff0127000000030004001e012d0000000500000201000000ffffff0000000500000209000700000416000001b100600001000100000005000d01040005000001020000000000010000000f004f0a320005013e32330000003038370008000800080008000a00080a320000016b004f000000020008414d00040008012d000000040001012700000003ffff001e0000000000040000012d00000005ffff0201000500ff02090000000000000000000700600416000001b10007000002fc0000c0c00000000000c0000000040002012d00000005c0c00209000500c00201000000c0c0c000000005000d010400050000010200000000000200000008000002fa0000000000c0c0c0000000040003012d0000000500000214000500000213000001b0000000000008000002fa0000000000000000000000040004012d000000090021061d000100f0000001b000040000012d00000005000302140000000000130000000500130213000401b0012d000000090004061d000000f0002101b0000100000013000000040003012d0000000500260214000500000213000001b00026000000040004012d000000090021061d000100f0002601b000040000012d00000005000302140000000000390000000500390213000401b0012d000000090004061d000000f0002101b0000100000039000000040003012d00000005004c0214000500000213000001b0004c000000040004012d000000090021061d000100f0004c01b000040000012d000000050003021400000000005f00000005005f0213000401b0012d000000090004061d000000f0002101b000010000005f000000040003012d0000000500000214000500000213000000000060000000040004012d000000090021061d006000f00000000100040000012d0000000500030214000000480000000000050060021300040048012d000000090004061d000000f000210001006000480000000000040003012d0000000500000214000500900213000000900060000000040004012d000000090021061d006000f00000000100040090012d0000000500030214000000d800000000000500600213000400d8012d000000090004061d000000f000210001006000d80000000000040003012d0000000500000214000501200213000001200060000000040004012d000000090021061d006000f00000000100040120012d0000000500030214000001680000000000050060021300040168012d000000090004061d000000f000210001006001680000000000040003012d0000000500000214000501b00213000001b00060000000040004012d000000090021061d006000f000000001000701b002fc00000000000000000000000000040005012d000000040001012d00000004ffff0127000000030004001e012d0000000500000201000000c0c0c000000005c0c00209000700c00416000001b100600001000100000004ffff0127000000030000000000000000000000000000000000000000494e414e000000000000000000000000
2200000000000000000000000000000000000000000000fffe000200050000000000000000000000000000000000000001f29f85e010684ff9000891abd9b3272b00000030000000940000000600000001000000380000000400000040000000080000005400000012000000680000000d00000080000000130000008c00000002000003a80000001e0000000c676e654469657720006175680000001e0000000c676e654469657720006175680000001e000000107263694d666f736f78452074006c656300000040b257e30001c632040000000300000000017700ec040200d700001000001b09600017c3f8000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe000200050000000000000000000000000000000000000001d5cdd502101b2e9c00089793aef92c2b00000030000000c80000000900000001000000500000000f0000005800000017000000680000000b000000700000001000000078000000130000008000000016000000880000000d000000900000000c000000a500000002000003a80000001e000000076570706100006e6f0000000300090eed0000000b000000000000000b000000000000000b000000000000000b000000000000101e0000000100000009656572466d726f6600100c000000020000001e0000000b00726f57006568736b0073746500000003000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10w_dde_server.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
