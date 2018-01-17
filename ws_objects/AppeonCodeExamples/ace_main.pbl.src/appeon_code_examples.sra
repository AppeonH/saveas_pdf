$PBExportHeader$appeon_code_examples.sra
$PBExportComments$Generated Application Object
forward
global type appeon_code_examples from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
//====================================================================
// Declare: Global Variables()
//--------------------------------------------------------------------
// Description: define string
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 			Date: 2004/01/03
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
/*
constant integer GI_PBVERSION = 1   //PB8
constant integer GI_PBVERSION = 2   //PB9
constant integer GI_PBVERSION = 3   //PB10
constant integer GI_PBVERSION = 4   //PB105
constant integer GI_PBVERSION = 5   //PB11
constant integer GI_PBVERSION = 6   //PB115
constant integer GI_PBVERSION = 7   //PB120
constant integer GI_PBVERSION = 8   //PB125
*/

constant integer GI_PBVERSION = 8
String appeon_user_name,appeon_user_pin
String gs_ServerPackage = "AppeonCodeExamples110"


String  gs_IniFileName="appeon_code_examples.ini"
end variables

global type appeon_code_examples from application
string appname = "appeon_code_examples"
end type
global appeon_code_examples appeon_code_examples

on appeon_code_examples.create
appname="appeon_code_examples"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on appeon_code_examples.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//====================================================================
// Event: open()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		string	commandline		
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	Administrator		Date: 2004/01/06
//--------------------------------------------------------------------
// Modify History: 
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.DisplayName = "Appeon Code Examples"
OPEN(w_splash)
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=AppeonSample;UID=dba;PWD=sql'" 

CONNECT USING SQLCA;

IF SQLCA.SQLCODE <> 0 THEN
	messagebox("Warning","Connect database failed!")
	HALT CLOSE
END IF

OPEN(w_main_frame)
end event

event close;//DISCONNECT USING SQLCA;

//SQLCA.DBMS = "JDBC"
//SQLCA.LogPass = "sql"
//SQLCA.LogId = "dba"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "Driver='com.sybase.jdbc3.jdbc.SybDriver',URL='jdbc:sybase:Tds:192.0.3.202:2690/appeon_ykg'"

//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=AppeonSample;UID=dba;PWD=sql'" 

// Profile PB Demo DB V2017
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PB Demo DB V2017;UID=dba;PWD=sql'"


CONNECT USING SQLCA;

IF SQLCA.SQLCODE <> 0 THEN
	messagebox("Warning","Connect database failed!")
	HALT CLOSE
END IF

end event

