$PBExportHeader$w_test_controller.srw
forward
global type w_test_controller from window
end type
type cb_exit from commandbutton within w_test_controller
end type
type cbx_central from checkbox within w_test_controller
end type
type st_application from statictext within w_test_controller
end type
type cb_results from commandbutton within w_test_controller
end type
type mle_message from multilineedit within w_test_controller
end type
type cb_version from commandbutton within w_test_controller
end type
type cb_updatecycle from commandbutton within w_test_controller
end type
type st_progress from statictext within w_test_controller
end type
type cb_newcycle from commandbutton within w_test_controller
end type
type cb_getcycle from commandbutton within w_test_controller
end type
type cbx_addtests from checkbox within w_test_controller
end type
type ddlb_category from dropdownlistbox within w_test_controller
end type
type cb_run from commandbutton within w_test_controller
end type
type cb_delete from commandbutton within w_test_controller
end type
type cb_populate from commandbutton within w_test_controller
end type
type dw_testtransaction from datawindow within w_test_controller
end type
type dw_testcycle from datawindow within w_test_controller
end type
type gb_category from groupbox within w_test_controller
end type
end forward

global type w_test_controller from window
integer x = 750
integer y = 752
integer width = 3346
integer height = 2080
boolean titlebar = true
string title = "Test Controller"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
event ue_setfocus ( )
cb_exit cb_exit
cbx_central cbx_central
st_application st_application
cb_results cb_results
mle_message mle_message
cb_version cb_version
cb_updatecycle cb_updatecycle
st_progress st_progress
cb_newcycle cb_newcycle
cb_getcycle cb_getcycle
cbx_addtests cbx_addtests
ddlb_category ddlb_category
cb_run cb_run
cb_delete cb_delete
cb_populate cb_populate
dw_testtransaction dw_testtransaction
dw_testcycle dw_testcycle
gb_category gb_category
end type
global w_test_controller w_test_controller

type prototypes
FUNCTION Integer pbdv_getbuildinfo(REF string appame, REF string buildversion, REF string builddate) system LIBRARY "pbdev60.dll"
end prototypes

type variables
Public PrivateWrite nvo_DataStore ids_testMaster	/* Holds the tests from table TestsMaster */
Public PrivateWrite nvo_DataStore ids_controlValues	/* Holds the control values from Control Table */
Public PrivateWrite nvo_DataStore ids_resultSet	/* Holds the test results - to be updated to the table results */

Private Long il_selectedRow=1		/* Used by dw_testTransaction to hold the current row */
Private Boolean ib_rowSelected		/* Used to hold the info about row Selection in dw_testTransaction */

Public PrivateWrite String is_logFile				// Used for writing logs
Public PrivateWrite Boolean ib_unAttended		// Auto Mode

Public PrivateWrite Boolean ibAutomation, ib_Profile
Public PrivateWrite String is_profile

Public nvo_control_SQLCA nvo_SQLCA

Boolean ib_centralDB

// Holds the current Test being executed. (primarily set by Do all selected)
Private Long 	il_currentTestRow		// Stores the current test running
Private Long 	il_currentResultNo	// keeps the result set no counter
Private Long	il_previousTestRow	// To track the test change

// Set the ib_debug flag to TRUE to view the debugging text on window - for developers only
Public PrivateWrite Boolean ib_debug

// Keeps the window position (check wf_reposition)
String is_windowPosition

//Memory related functions
uo_memory io_envFunctions

//User ID
PRIVATE STRING is_userID

// PB VERsion info
long         il_verMajor
long         il_verMinor
long	il_verMaint
long	il_verBuild

// Keep track of db errors - update tries 3 times
PRIVATE INTEGER ii_cycleErrorCount
end variables

forward prototypes
public function integer wf_testexecute (string as_testname)
public function boolean logtest (string as_log)
public function boolean wf_result (boolean ab_result, string as_resultSet)
public function boolean wf_checktestdependence (long al_currentrow, string as_selected)
public function integer wf_logtest (string as_logtext)
public function boolean wf_debug (string as_debugtext)
public function boolean wf_reposition (string as_position)
public function boolean wf_populatecategory ()
public function string wf_getlibrarylist (boolean ab_plainlist)
public function integer ready ()
public function boolean wf_populatetests ()
public function string wf_getnewcycleno ()
public function boolean addtest (string as_test, string as_description, boolean ab_result)
public function integer wf_setdefault (boolean ab_writelog)
public function boolean wf_setenvinfo ()
public function str_memorystatus wf_getmemorystatus (boolean ab_writelog)
public function long wf_getprocessmemory ()
public function long wf_getprocessid ()
public function boolean wf_auditupdate (datawindow adw_dwupd)
public function boolean wf_setuserid (string as_userid)
public function boolean wf_dbconnect ()
public function integer of_messagebox (string as_title, string as_message, icon ai_icon, button abt_button)
public function boolean wf_result (boolean ab_result, string as_resultset, string as_others)
public function integer wf_setrun (readonly long l_from, readonly long l_to)
public function integer wf_ready ()
end prototypes

event ue_setfocus;This.SetFocus()
end event

public function integer wf_testexecute (string as_testname);
//Show test in progress on window
st_progress.textcolor = 255 //Red
st_progress.text = "Tests in progress..."


//User must supply his own global function f_testexecute(string) that does this processing
f_testexecute(as_testname)

//*********************************************************************
//NOTE: To new users of CONTROl.PBL, your test application must have 
//      a global function called f_testexecute()
//      Below is a sample of the code that migt exist in you
//		  f_testexecute()  remember to accept a string "testname" as a
//	     the only parameter.
//
//--------- cut here
//choose case testname
//	case "Attribute1"
//		w_testwin1.event trigger test1()
//
// case "your test name here"
//    <event or function in your app that will execute testcase and log>
//	case "yet another test case.."
//    <event, window open, function call, whatever does test and logs here>
//end choose
//-------- end cut
//
/*
if ib_autoLoop then
	post testend()
end if
*/
return 1


end function

public function boolean logtest (string as_log);/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  logtest()

Author      :  Ramalingam S                     Date      :  11 May, 2000

Purpose     :  Dummy function supports backward compatibility

*****************************************************************************************************/
wf_logtest(as_log)
Return True
end function

public function boolean wf_result (boolean ab_result, string as_resultSet);/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_result()

Author      :  Ramalingam S                     Date      :  11 May, 2000

Purpose     :  Writes the result back to DB

Arguments	:  ab_result - Boolean - The result values (TRUE - Pass; FALSE - Fail)
               as_resultSet - String - The entire result set. Some applications return the log for this.

*****************************************************************************************************/

Return wf_result(ab_result, as_resultSet, '')
end function

public function boolean wf_checktestdependence (long al_currentrow, string as_selected);/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_checkTestDependence

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  This checks the tests for dependence.
					1. Whenever a child test is checked this function checks for its parent test to be run
						before that
					2. Whenever a parent test is unchecked (removed from run list) this function warns
						for the child dependencies and unchecks them.
					Note : Always check for dependents in the master source. ids_testmaster.

*****************************************************************************************************/
String 	ls_previousTestName, ls_parentName, ls_dependentTestName
Long 		ll_rowFoundSource, ll_dependentRow
Integer	li_answer

	// Find out the dependent parent :::::
	// Find the test source row number
	If al_currentRow < 1 Then Return True //Recurssion
	
	ll_rowFoundSource = ids_testMaster.Find("testName = '" + &
						dw_testTransaction.GetItemString(al_currentRow, 'testsMaster_testname') + "'", &
						1, ids_testMaster.RowCount())
						
	ls_previousTestName = ids_testmaster.GetItemString(ll_rowFoundSource, 'previousNeed')	// Get previous test name
	
	ll_dependentRow = dw_testTransaction.Find("testsMaster_testName = '" + ls_previousTestName + "'", &
						1, ids_testMaster.RowCount()) // Get previous test row
						
	IF TRIM(ls_previousTestName) <> '' Then
		If ll_dependentRow > 0 Then // Found a dependent row
			IF Upper(as_selected) = 'Y' Then
				of_MessageBox('Dependency Check', 'This test depends up on test : ' + ls_previousTestname + &
						'. ~r~n The parent is automatically selected for you', Information!, OK!)
				If wf_checkTestDependence(ll_dependentRow, 'Y')	Then // For Cyclic Relations
					dw_testTransaction.SetItem(ll_dependentRow, 'runTest', 'Y') // Check to run this
				End IF
			End IF // Selected
		Else	// Dependent Not Found
			If NOT IsNull(TRIM(ls_previousTestName)) Then
				of_MessageBox("Dependency Check", "Couldn't find the dependent test : " + ls_previousTestName, StopSign!, Ok!)
				Return False
			End IF
		End IF // Dependent found
	End IF
	
	// Find out the dependent childs :::::
	IF Upper(as_selected) = 'N' Then
		Long ll_rowInTransaction
		ls_parentName = dw_testTransaction.GetItemString(al_currentRow, 'testsMaster_testname')
		
		ll_dependentRow = ids_testMaster.Find("previousNeed = '" + ls_parentName + "'", &
							1, ids_testMaster.RowCount())
							
		IF ll_dependentRow < 1 Then // No dependents
			Return TRUE
		End IF
		
		li_answer = of_MessageBox('Dependency Check', 'This test has dependents : ' + &
					ids_testMaster.GetItemString(ll_dependentRow, 'testName') + '~r~n' + &
					'Would you like to uncheck them ?',	Question!, YesNo!)
					
		If li_answer = 2 Then // No uncheck
			Return False
		End IF

		ll_rowInTransaction = 1
		ll_dependentRow = 1
		Do While ll_dependentRow > 0 AND ll_dependentRow <= ids_testMaster.RowCount()
			ll_dependentRow = ids_testMaster.Find("previousNeed = '" + ls_parentName + "'", &
							ll_dependentRow+1, ids_testMaster.RowCount())
			If ll_dependentRow > 0 Then
				ll_rowInTransaction = dw_testTransaction.Find("testsMaster_testname = '" + &
							ids_testMaster.GetItemString(ll_dependentRow, 'testname') + "'", &
							1, dw_testTransaction.RowCount())
				If wf_checkTestDependence(ll_rowInTransaction, 'N') Then	// For Cyclic Relations
					dw_testTransaction.SetItem(ll_rowInTransaction, 'runTest', 'N')
				End IF
			End IF
		LOOP
	End IF // Run test unchecked
	
	Return TRUE	
end function

public function integer wf_logtest (string as_logtext);/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_logtest()

Author      :  Ramalingam S                     Date      :  01 May, 2000

Purpose     :  Writes log to the log file

*****************************************************************************************************/
// Write to Log FILE
int liFileNum, liRC

//	liFileNum = FileOpen(is_LogFile , LineMode!, Write!, LockReadWrite! )
	liFileNum = FileOpen(is_LogFile , LineMode!, Write!, LockReadWrite!,Append!,EncodingUTF8!  )
	
	IF liFileNum = - 1 THEN liRC = - 1
	
	IF FileWrite( liFileNum, as_logText ) = - 1 THEN liRC = - 1
	
	IF FileClose( liFileNum ) = - 1 THEN liRC = - 1
	
// Database Record - The log string is split for results (nbifunctions)
/*
IF Upper(Mid(as_logText, 1, 4)) = 'PASS' OR Upper(Mid(as_logText, 1, 4)) = 'FAIL' Then

	String ls_result, ls_testName, ls_mode, ls_status, ls_errorText
	Integer li_startPos, li_endPos, li_dataNumber, li_numberOfItems
	Long ll_currentTest

	IF Upper(Mid(as_logText, 1, 4)) = 'FAIL' Then
		li_numberOfItems = 5
	Else
		li_numberOfItems = 3
	End IF // Number of items
	
	li_startPos = 1
	li_dataNumber = 1
	
	Do While li_dataNumber <= li_numberOfItems
		
		li_endPos = Pos(as_logText, '|', li_startPos) // Find the end of item
		If li_endPos = 0 Then li_endPos = Len(as_logText)+1	// Last part
		
		Choose Case li_dataNumber
			Case 1
				ls_result = Mid(as_logText, li_startPos, li_endPos - li_startPos)
			Case 2
				ls_testName = Mid(as_logText, li_startPos, li_endPos - li_startPos)
			Case 3
				ls_mode = Mid(as_logText, li_startPos, li_endPos - li_startPos)
			Case 4
				ls_status = Mid(as_logText, li_startPos, li_endPos - li_startPos)
			Case 5
				ls_errorText = Mid(as_logText, li_startPos, li_endPos - li_startPos)
		End CHOOSE
		
		li_startPos = li_endPos + 1
		li_dataNumber ++
		
	LOOP // Till the end of available string
	
	ll_currentTest = dw_testTransaction.Find("Upper(testsmaster_testname) = '" &
							+ Upper(ls_TestName) + "'", 1, dw_testTransaction.RowCount())
	If Upper(ls_result) = 'PASS' Then
		dw_testTransaction.SetItem(ll_currentTest, 'testtrans_result', '00')
	Else
		dw_testTransaction.SetItem(ll_currentTest, 'testtrans_result', '-1')
		dw_testTransaction.SetItem(ll_currentTest, 'testtrans_remarks', &
				'Mode : ' + ls_mode + '; Error : ' + ls_errorText)
	End IF // Pass
	
End If	// Only for result strings
*/



RETURN liRC
end function

public function boolean wf_debug (string as_debugtext);/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_debug()

Author      :  Ramalingam S                     Date      :  15 May, 2000

Purpose     :  Debug on/off

*****************************************************************************************************/

Long ll_waitingPeriod

If ib_debug Then
//	ll_waitingPeriod = CPU() + 500
	mle_message.Show()
	mle_message.Enabled = TRUE
	mle_message.Text += '~r~n--------*******-------~r~n' + as_debugtext
	Do While CPU() < ll_waitingPeriod
		// Do Nothing
	Loop
	Return TRUE
Else
	mle_message.Hide()
	mle_message.Enabled = FALSE
	mle_message.Text = ''
	Return TRUE
End IF
end function

public function boolean wf_reposition (string as_position);/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_reposition()

Author      :  Ramalingam S                     Date      :  26 May, 2000

Purpose     :  Reposition Window

*****************************************************************************************************/

Environment le_env
GetEnvironment(le_env)
Long ll_screenHeight, ll_screenWidth

ll_screenHeight = PixelsToUnits ( le_env.ScreenHeight, YPixelsToUnits! )
ll_screenWidth = PixelsToUnits ( le_env.ScreenWidth, XPixelsToUnits! )

Choose Case TRIM(UPPER(as_position))
	CASE 'CENTRE'
		This.y = ( ll_screenHeight - This.Height) / 2
		This.x = ( ll_screenWidth - This.Width) / 2

	CASE 'TOPLEFT'
		This.y = 1
		This.x = 1
		
	CASE 'TOPRIGHT'
		This.y = 1
		This.x = (ll_screenWidth - This.Width)
		
	CASE 'BOTTOMLEFT'
		This.y = (ll_screenHeight - This.Height)
		This.x = 1
		
	CASE 'BOTTOMRIGHT'
		This.y = (ll_screenHeight - This.Height)
		This.x = (ll_screenWidth - This.Width)

	CASE ELSE
		Return FALSE
END CHOOSE

is_windowPosition = as_position
Return TRUE
end function

public function boolean wf_populatecategory ();/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_populateTests

Author      :  Ramalingam S                     Date      :  03 May, 2000

Purpose     :  Populates datastore ids_testMaster with data from DB

*****************************************************************************************************/

Long ll_currentRow=1
ddlb_category.Reset()
IF ids_controlValues.RowCount() < 1 Then
	Return FALSE
End IF
Do While ll_currentRow <= ids_controlValues.RowCount()
	ddlb_category.AddItem(ids_controlValues.GetItemString(ll_currentRow, 'description'))
	ll_currentRow ++
LOOP

Return TRUE
end function

public function string wf_getlibrarylist (boolean ab_plainlist);//Set where clause for library filter
String ls_appName, ls_libraryList
nvo_string lnvo_libraryList
ls_appName = GetApplication().AppName
lnvo_libraryList = f_getLibraryList(ls_appName, nvo_sqlca)

Integer li_counter=1
If ab_plainList Then // Plain list of library
	Do WHILE li_counter <= UpperBound(lnvo_libraryList.is_stringArray)
		IF li_counter = UpperBound(lnvo_libraryList.is_stringArray) Then
			ls_libraryList += Upper(lnvo_libraryList.is_stringArray[li_counter])
		Else
			ls_libraryList += Upper(lnvo_libraryList.is_stringArray[li_counter]) + ','
		End IF
		li_counter ++
	LOOP
Else // used in where clause - add with ' etc.
	Do WHILE li_counter <= UpperBound(lnvo_libraryList.is_stringArray)
		IF li_counter = UpperBound(lnvo_libraryList.is_stringArray) Then
			ls_libraryList += "'" + Upper(lnvo_libraryList.is_stringArray[li_counter]) + "'"
		Else
			ls_libraryList += "'" + Upper(lnvo_libraryList.is_stringArray[li_counter]) + "', "
		End IF
		li_counter ++
	LOOP
End IF
Return ls_libraryList
end function

public function integer ready ();// Backward Compatibility

Return wf_ready()
end function

public function boolean wf_populatetests ();/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_populateTests

Author      :  Ramalingam S                     Date      :  03 May, 2000

Purpose     :  Populates datastore ids_testMaster with data from DB

*****************************************************************************************************/
String ls_testCategory
String ls_libraryList

// The following fixes the test category. The text is selected from user choice ddlb and the code
// is searched from datastore 'control Values'.
ls_testCategory = ids_controlValues.GetItemString &
						(ids_controlValues.Find &
						("description = '" + ddlb_category.Text + "'", 1, ids_controlValues.RowCount()), 'value')

ids_testMaster.Reset()
If ib_centralDB Then
	ids_testMaster.dataObject = 'd_testResource'
Else
	ids_testMaster.dataObject = 'd_testResource_ASA'
End IF
ids_testMaster.SetTransObject(nvo_SQLCA)

//Set where clause for library filter
String ls_appName

ls_appName = GetApplication().AppName
ls_libraryList = wf_getLibraryList(FALSE)

wf_debug(ls_libraryList)

// Set up library list for tests to retrieve
If ib_centralDB Then
	ids_testMaster.Object.DataWindow.Table.Select = ids_testMaster.GetSQLSelect() + &
				' AND UPPER(testpbl) in (' + ls_libraryList + ")"
	
	// Set up the category of tests
	If TRIM(Upper(ls_testCategory)) = 'ALL' Then
		ids_testMaster.Object.DataWindow.Table.Select = ids_testMaster.GetSQLSelect() + &
		 ' AND (testcategory like ' + "'%' )"
	Else
		ids_testMaster.Object.DataWindow.Table.Select = ids_testMaster.GetSQLSelect() + &
		 'AND (testcategory =  ' + "'" + ls_testCategory + "' )"
	End IF
Else // Local database ASA - has some problem in this build 5031
	
	ids_testMaster.SetSQLSelect( ids_testMaster.GetSQLSelect() + &
				' WHERE UPPER(testpbl) in (' + ls_libraryList + ")" )
	
	// Set up the category of tests
	If TRIM(Upper(ls_testCategory)) = 'ALL' Then
		ids_testMaster.SetSQLSelect( ids_testMaster.GetSQLSelect() + &
		 ' AND (testcategory like ' + "'%' )")
	Else
		ids_testMaster.SetSQLSelect( ids_testMaster.GetSQLSelect() + &
		 'AND (testcategory =  ' + "'" + ls_testCategory + "' )" )
	End IF
	/*
	ids_testMaster.Object.DataWindow.Table.Select = ids_testMaster.GetSQLSelect() + &
				' AND UPPER("testsmaster"."testpbl") in (' + ls_libraryList + ")"
	
	// Set up the category of tests
	If TRIM(Upper(ls_testCategory)) = 'ALL' Then
		ids_testMaster.Object.DataWindow.Table.Select = ids_testMaster.GetSQLSelect() + &
		 ' AND ("testsmaster"."testcategory" like ' + "'%' )"
	Else
		ids_testMaster.Object.DataWindow.Table.Select = ids_testMaster.GetSQLSelect() + &
		 'AND ("testsmaster"."testcategory" =  ' + "'" + ls_testCategory + "' )"
	End IF
	*/
End IF

If ids_testMaster.Retrieve() < 1 Then // Retrieve test details
	Return FALSE
End IF

If ibautomation Then
	ids_testMaster.SetFilter("runtest = 'Y' AND autorun_include = 'Y'")
Else
	ids_testMaster.SetFilter("runtest = 'Y'")
End IF
ids_testMaster.Filter()

wf_debug(ids_testMaster.GetSQLSelect())
// Check for no. of tests available
If ids_testMaster.RowCount() = 0 Then
	of_MessageBox('Test Master', 'There are no Tests recorded in Master' + '~r~n' &
		+ 'for the Category "' + ddlb_category.Text + '"', Information!, Ok!)
		Return FALSE
End IF

st_progress.Text = 'Tests Ready to start'

Return True
end function

public function string wf_getnewcycleno ();/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_getNewCycleNo()

Author      :  Ramalingam S                     Date      :  03 May, 2000

Purpose     :  New cycle number generation

*****************************************************************************************************/
Double ldb_autoCycleNo

//Select max(cycleno)+1 Into :ldb_autoCycleNo FROM testcycle Using nvo_SQLCA;
Select new_cycleno Into :ldb_autoCycleNo FROM sequence holdlock Using nvo_SQLCA;

If ldb_autoCycleNo = 0 Then
	ldb_autoCycleNo = 1
	dw_testCycle.SetItem(1, 'cycleNo', 1)
End IF

If nvo_SQLCA.SQLCode = 0 Then
	dw_testCycle.SetItem(1, 'cycleNo', ldb_autoCycleNo)
	ldb_autoCycleNo ++
	Update sequence SET new_cycleno = :ldb_autoCycleNo USING nvo_SQLCA;
	If nvo_SQLCA.SQLCode < 0 Then
		MessageBox('Cycle generation Error', 'Could not generate cycle no.' + nvo_SQLCA.SQLErrText)
		RollBack;
		Return '-1'
	End IF
	Commit USING nvo_SQLCA;
Else
	of_MessageBox("Cycle number generation Error", nvo_SQLCA.SQLErrText, StopSign!, OK!)
	RollBack;
End IF

Return String(ldb_autoCycleNo)
end function

public function boolean addtest (string as_test, string as_description, boolean ab_result);Return TRUE
end function

public function integer wf_setdefault (boolean ab_writelog);/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_setDefault()

Author      :  Ramalingam S                     Date      :  27 April, 2000

Purpose     :  Sets up the environment, defaults etc

*****************************************************************************************************/
//******************************************
// Following appends a header in the log file, sets environment etc

string		ls_logstring, ls_datetime, ls_os,  ls_pb, ls_application_name, ls_os_version
environment	le_logenv
integer		li_rc


// Set default values & prepare cycle dw
String ls_buildNo

dw_testCycle.Trigger Event ue_prepareNew()	//Prepare datawindows

If Not wf_setEnvInfo() Then Return 0// Set Environment Info in DW

li_rc = GetEnvironment(le_logenv)	//Populate the Environment structure
IF li_rc <> 1 THEN RETURN 0			//GetEnvironment Failed

wf_getNewCycleNo() // New Number Generation
// End dwcycle default

ls_application_name = "~r~nAPPLICATION:	" + GetApplication().appname +'~r~n'

if NOT ibAutomation then
	ls_datetime = 'RUN DATE:  ' + string(today()) + '~t' + string(now())+'~r~n' // Removed ~r~n from start of line - 4/10/98 - NF
end if



ls_os_version = string(le_logenv.OSMajorRevision) + '.' + string(le_logenv.OSMinorRevision) + '.' + string(le_logenv.OSFixesRevision)
			

CHOOSE CASE le_logenv.OSType			//OSType.MajorRevision.MinorRevision
CASE Macintosh!
	ls_os = "OS:  Macintosh"+'~t' + ls_os_version + '~r~n'
CASE Windows!
	ls_os = "OS:  Windows"+'~t' + ls_os_version + '~r~n'
CASE aix!
	ls_os = "OS:  AIX"+'~t' + ls_os_version + '~r~n'
CASE hpux!
	ls_os = "OS:  HPUX"+'~t' + ls_os_version + '~r~n'
CASE osf1!
	ls_os = "OS:  OSF1"+'~t' + ls_os_version + '~r~n'
CASE sol2!
	ls_os = "OS:  Solaris"+'~t' + ls_os_version + '~r~n'
CASE WindowsNT!
	ls_os = "OS:  WindowsNT"+'~t' + ls_os_version + '~r~n'
CASE ELSE
	RETURN 1
END CHOOSE

ls_buildNo = dw_testCycle.GetItemString(1, 'buildno')

//PowerBuilder version information
if NOT ibAutomation then 
	ls_pb = 'PB VERSION:  '+string(le_logenv.PBMajorRevision)+'.'+string(le_logenv.PBMinorRevision)+'.'+string(le_logenv.PBFixesRevision)+ &
				'    Build No : ' + ls_buildNo + '~r~n'
	// Added Application name to the start of the header - 4/9/98 - Neil Fitzgerald
	ls_logstring = ls_application_name + ls_datetime + ls_os + ls_pb	//concatenate the 3 strings
End If

		
If ibAutomation Then // Automation
	cb_populate.Trigger Event Clicked()	// To populate all tests
End if

If ab_writeLog Then // Requires first Time open
	wf_LogTest(ls_logstring)								//Send this all to the LogTest function
End IF

if ib_Unattended then // Unattended tests
	cb_run.Trigger Event Clicked()
end if

Return 1
end function

public function boolean wf_setenvinfo ();OLEObject	lole_pbObjEnv
Integer 		li_return
String		ls_app
ContextInformation	lc_Context

integer		iret
long			verMajor
long			verMinor
long			verMaint
long			verBuild
long			flags

lole_pbObjEnv = CREATE OLEObject
li_return = lole_pbObjEnv.ConnectToNewObject( "PowerBuilder.Application" )
If li_return < 0 Then
	of_MessageBox('Error', "Cannot connect to PowerBuilder.Application", Information!, OK!)
	Return FALSE
End IF

//lole_pbObjEnv.VersionDetails( ref verMajor, ref verMinor, ref verMaint, ref verBuild, ref flags )

// Store in Instance Variables for other application references
il_verMajor = verMajor
il_verMinor = verMinor
il_verMaint = verMaint
il_verBuild = verBuild

li_return = GetContextService( "ContextInformation", lc_Context )
//lc_Context.GetCompanyName( ls_app )
lc_Context.GetName( ls_app )


//dw_testCycle.Trigger Event ue_prepareNew()	//Prepare datawindows
dw_testCycle.SetItem(1, 'product', ls_app)
dw_testCycle.SetItem(1, 'version', String(verMajor) + '.' + String(verMinor) + '.' + String(verMaint))
dw_testCycle.SetItem(1, 'buildno', String(verBuild))
dw_testCycle.SetItem(1, 'description', '')
dw_testCycle.SetItem(1, 'host_application', Upper(GetApplication().appname))


lole_pbObjEnv.DisconnectObject()
DESTROY lole_pbObjEnv

Return TRUE
end function

public function str_memorystatus wf_getmemorystatus (boolean ab_writelog);/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_getMemoryStatus()

Author      :  Ramalingam S                     Date      :  19 Sep, 2000

Purpose     :  Returns the system memory info like physical, virtual & available memory

*****************************************************************************************************/

str_memoryStatus lstr_memory

lstr_memory = io_envFunctions.of_getMemoryStatus()

IF ab_writeLog Then
	wf_logTest("Length              ~t" + String ( lstr_memory.sul_dwlength ))
	wf_logTest("Memory Load         ~t" + String ( lstr_memory.sul_dwmemoryload ))
	wf_logTest("Total Physical      ~t" + String ( lstr_memory.sul_dwtotalphys ))
	wf_logTest("Available Physical  ~t" + String ( lstr_memory.sul_dwavailphys ))
	wf_logTest("Total Pagefile      ~t" + String ( lstr_memory.sul_dwtotalpagefile ))
	wf_logTest("Available Pagefile  ~t" + String ( lstr_memory.sul_dwavailpagefile ))
	wf_logTest("Total Virtual       ~t" + String ( lstr_memory.sul_dwtotalvirtual ))
	wf_logTest("Available Virtual   ~t" + String ( lstr_memory.sul_dwavailvirtual ))
End IF

Return lstr_memory
end function

public function long wf_getprocessmemory ();/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_getProcessMemory()

Author      :  Ramalingam S                     Date      :  19 Sep, 2000

Purpose     :  Returns the Memory allocated for the Process

*****************************************************************************************************/

Return io_envFunctions.of_getProcessMemory()
end function

public function long wf_getprocessid ();/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_getProcessID()

Author      :  Ramalingam S                     Date      :  19 Sep, 2000

Purpose     :  Returns the current Process ID

*****************************************************************************************************/

Return io_envFunctions.of_getProcessID()
end function

public function boolean wf_auditupdate (datawindow adw_dwupd);/****************************************************************************************************
Object      :  w_test_controller                Function  :  wf_auditUpdate

Author      :  Ramalingam S                     Date      :  29 Oct, 2000

Purpose     :  Updates Audit

*****************************************************************************************************/

/* Updates the Audit Information on datawindow */

Integer li_count
Boolean lb_columnFound
String ls_temp
DateTime ldt_now

For li_count = 1 TO Integer(adw_dwUpd.Object.DataWindow.Column.Count)
	ls_temp = adw_dwUpd.Describe('#' + String(li_count) + ".Name")
	IF adw_dwUpd.Describe('#' + String(li_count) + ".Name") = 'modified_by' Then
		lb_columnFound = TRUE
		EXIT
	End IF
Next

If NOT lb_columnFound Then
	Return FALSE
End IF

ldt_now = DateTime(Today(), Now())
For li_count = 1 TO adw_dwUpd.RowCount()
	If adw_dwUpd.GetItemStatus(li_count, 0, Primary!) <> NotModified! Then
		adw_dwUpd.SetItem(li_count, "modified_by", is_userId)
		adw_dwUpd.SetItem(li_count, "modified_dt", ldt_now)
	End IF
Next

Return TRUE
end function

public function boolean wf_setuserid (string as_userid);/****************************************************************************************************
Object      :  w_test_controller                Function  :  wf_setUserId

Author      :  Ramalingam S                     Date      :  29 Oct, 2000

Purpose     :  Sets userid

*****************************************************************************************************/

If NOT ibAutomation Then
	is_userId = as_userId
Else
	Return FALSE
End IF

Return TRUE
end function

public function boolean wf_dbconnect ();
//
String ls_INIfile = 'controller.ini'
String ls_centralDbSection, ls_localDbSection
ls_centralDbSection = 'CENTRALdb'
ls_localDbSection = 'LOCALdb'

// Fixes db profiles
If ib_centralDB Then
	nvo_SQLCA.AutoCommit = False
	nvo_SQLCA.DBMS = ProfileString(ls_INIfile, ls_centralDbSection, 'DBMS', "SYC Adaptive Server Enterprise")
	nvo_SQLCA.Database = ProfileString(ls_INIfile, ls_centralDbSection, 'Database', "qasybase")
	nvo_SQLCA.ServerName = ProfileString(ls_INIfile, ls_centralDbSection, 'ServerName', "QAASE115")
	nvo_SQLCA.LogId = ProfileString(ls_INIfile, ls_centralDbSection, 'LogId', "sa")
	nvo_SQLCA.LogPass = ProfileString(ls_INIfile, ls_centralDbSection, 'LogPass', "sapass")
	nvo_SQLCA.DBParm = ProfileString(ls_INIfile, ls_centralDbSection, 'DBParm', "Release='11.5'")
	// Check the central db checkbox
	cbx_central.Checked = TRUE
Else
	nvo_SQLCA.AutoCommit = False
	nvo_SQLCA.DBMS = ProfileString(ls_INIfile, ls_localDbSection, 'DBMS', "ODBC")
	nvo_SQLCA.Database = ProfileString(ls_INIfile, ls_localDbSection, 'Database', "QASybase")
	nvo_SQLCA.ServerName = ProfileString(ls_INIfile, ls_localDbSection, 'ServerName', '')
	nvo_SQLCA.UserId = ProfileString(ls_INIfile, ls_localDbSection, 'UserId', 'dba')
	nvo_SQLCA.DBPass = ProfileString(ls_INIfile, ls_localDbSection, 'DBPass', 'sql')
	nvo_SQLCA.DBParm = ProfileString(ls_INIfile, ls_localDbSection, 'DBParm', "Connectstring='DSN=QASybase;UID=dba;PWD=sql'")
	cbx_central.Checked = FALSE
End IF

Connect using nvo_SQLCA;

If nvo_SQLCA.SQLCode <> 0 Then
		of_MessageBox('Connection', 'DB connection failed !!', StopSign!, Ok!)
		Return FALSE
End IF

Return TRUE
end function

public function integer of_messagebox (string as_title, string as_message, icon ai_icon, button abt_button);// Suppress messages for automation
// Returns the answer in manual mode

Integer li_answer

If ibAutomation Then
	st_progress.Text = as_message
Else
	li_answer = MessageBox(as_title, as_message, ai_icon, abt_button)
End IF

Return li_answer
end function

public function boolean wf_result (boolean ab_result, string as_resultset, string as_others);/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_result()

Author      :  Ramalingam S                     Date      :  11 May, 2000

Purpose     :  Writes the result back to DB

Arguments	:  ab_result - Boolean - The result values (TRUE - Pass; FALSE - Fail)
               as_resultSet - String - The entire result set. Some applications return the log for this.
					as_others - String - Any other info. For future needs. Currently not used.

*****************************************************************************************************/

Long ll_currentResultRow
String ls_result

If ab_result Then 	// Store result
	ls_result = '00'
Else
	ls_result = '-1'
End IF

If il_currentTestRow <> il_previousTestRow Then // Test changed reset the result number
	il_currentResultNo = 1
	il_previousTestRow = il_currentTestRow
Else
	il_currentResultNo ++
End IF

/*
ll_currentResultRow = ids_resultSet.InsertRow(ids_resultSet.RowCount()+1) // Insert row
// Setvalues
ids_resultSet.SetItem(ll_currentResultRow, 'resultno', il_currentResultNo)
ids_resultSet.SetItem(ll_currentResultRow, 'cycleno', &
	dw_testcycle.GetItemNumber(1, 'cycleno'))
ids_resultSet.SetItem(ll_currentResultRow, 'testno', &
	dw_testTransaction.GetItemNumber(il_currentTestRow, 'testtrans_testno'))
ids_resultSet.SetItem(ll_currentResultRow, 'testname', &
	dw_testTransaction.GetItemString(il_currentTestRow, 'testsmaster_testname'))
ids_resultSet.SetItem(ll_currentResultRow, 'result', ls_result)
ids_resultSet.SetItem(ll_currentResultRow, 'result_text', as_resultSet)
*/
// Set-up the result for tests that produce a single result set.
IF il_currentResultNo > 1 Then
	dw_testTransaction.SetItem(il_currentTestRow, 'testtrans_result', '66') // Multiple tests
	dw_testTransaction.SetItem(il_currentTestRow, 'testtrans_remarks', 'Multiple results returned') // Passed
ElseIF ab_result Then
	dw_testTransaction.SetItem(il_currentTestRow, 'testtrans_result', '00') // Passed
	dw_testTransaction.SetItem(il_currentTestRow, 'testtrans_remarks', Left(as_resultSet, 50)) // Passed. ADC sheng.xiong@sybase.com Jul 2, 2001
Else
	dw_testTransaction.SetItem(il_currentTestRow, 'testtrans_result', '-1') // Failed
	dw_testTransaction.SetItem(il_currentTestRow, 'testtrans_remarks', Left(as_resultSet, 50)) // Failed. ADC sheng.xiong@sybase.com Jul 2, 2001
End IF
	
Return TRUE
end function

public function integer wf_setrun (readonly long l_from, readonly long l_to);Long rowCounts
Long i

rowCounts = dw_testtransaction.RowCount()
for i = 1 to rowCounts
	dw_testtransaction.setItem(i, "runtest", "N")
next

if(l_from > 0) and (l_to <= rowCounts) and (l_from <= l_to) then
	for i = l_from to l_to
		dw_testtransaction.setItem(i, "runtest", "Y")
	next
else
	return -1
end if

return 1

end function

public function integer wf_ready ();/****************************************************************************************************
Object      :  w_testOrganizer                  Function  :  wf_ready()

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  Sets up the environment

*****************************************************************************************************/

// Get db connection
If NOT wf_dbConnect() Then
	Return -1
End IF


//*******************************************
Long ll_currentRow = 1
Double ldb_autoCycleNo

// Populate the DataStore with Test Cases
If IsValid(ids_testMaster) Then
	ids_testMaster.Reset()
Else
	ids_testMaster = Create nvo_DataStore
End IF
ids_testMaster.dataObject = 'd_testResource'
ids_testMaster.SetTransObject(nvo_SQLCA)
//ids_testMaster.Retrieve('PRI')

// Populate control datastore with control info
If IsValid(ids_controlValues) Then
	ids_controlValues.Reset()
Else
	ids_controlValues = Create nvo_DataStore
End IF

// Retrieve control values for ddlb
ids_controlValues.dataObject = 'd_control'
ids_controlValues.SetTransObject(nvo_SQLCA)

String ls_libraryList, ls_sqlWhereClause
ls_libraryList = wf_getLibraryList(FALSE)
IF ib_centralDB Then
	ls_sqlWhereClause = "WHERE  ( Upper(c_table) = 'TESTSMASTER' ) " +&
								"AND   ( Upper(c_column) = 'TESTCATEGORY' ) " +&
								"AND   (value in ( SELECT distinct testsmaster.testcategory " + &
										"FROM   testsmaster " +&
										"WHERE  LTRIM(UPPER(testsmaster.testpbl)) in ( " + ls_libraryList + ") ))"	
	ids_controlValues.Object.DataWindow.Table.Select = ids_controlValues.GetSQLSelect() + ls_sqlWhereClause
Else // Local database
	ls_sqlWhereClause = "WHERE  ( Upper(control.c_table) = 'TESTSMASTER' ) " +&
								"AND   ( Upper(control.c_column) = 'TESTCATEGORY' ) " +&
								"AND   (control.value in ( SELECT distinct testsmaster.testcategory " + &
										"FROM   testsmaster " +&
										"WHERE  LTRIM(UPPER(testsmaster.testpbl)) in ( " + ls_libraryList + ") ))"	
	ids_controlValues.SetSQLSelect(ids_controlValues.GetSQLSelect() + ls_sqlWhereClause)
End IF


IF ids_controlValues.Retrieve() < 1 Then
	of_Messagebox('Control Values', 'Check control table - No records', StopSign!, OK!)
	Return -1
End IF

Long ll_insertedRow
ll_insertedRow = ids_controlValues.InsertRow(0)
ids_controlValues.SetItem(ll_insertedRow, 'value', 'ALL')
ids_controlValues.SetItem(ll_insertedRow, 'Description', 'All Tests')
ids_controlValues.SetItem(ll_insertedRow, 'controlno', 'TC0001')

// End TESTING

// Prepare results datastore
If IsValid(ids_resultSet) Then
	ids_resultSet.Reset()
Else
	ids_resultSet = Create nvo_DataStore
End IF
ids_resultSet.dataObject = 'd_results'
ids_resultSet.SetTransObject(nvo_SQLCA)

// Populate the Category List
If NOT wf_populateCategory() Then
	Return -1
End IF
//ddlb_category.Reset()
//Do While ll_currentRow <= ids_controlValues.RowCount()
//	ddlb_category.AddItem(ids_controlValues.GetItemString(ll_currentRow, 'description'))
//	ll_currentRow ++
//LOOP

ddlb_category.SelectItem(1) // Get the first item on focus

dw_testTransaction.Trigger Event ue_prepareNew()

wf_setDefault(TRUE)	// Sets header of log file, default values etc

If NOT wf_populateTests() Then // Populate the datastore with Tests
	Return -1
End IF

//wf_setrun(1,74)
//wf_setrun(76,dw_testtransaction.rowCount())
//wf_setrun(75,75)

Return 1
end function

on w_test_controller.create
this.cb_exit=create cb_exit
this.cbx_central=create cbx_central
this.st_application=create st_application
this.cb_results=create cb_results
this.mle_message=create mle_message
this.cb_version=create cb_version
this.cb_updatecycle=create cb_updatecycle
this.st_progress=create st_progress
this.cb_newcycle=create cb_newcycle
this.cb_getcycle=create cb_getcycle
this.cbx_addtests=create cbx_addtests
this.ddlb_category=create ddlb_category
this.cb_run=create cb_run
this.cb_delete=create cb_delete
this.cb_populate=create cb_populate
this.dw_testtransaction=create dw_testtransaction
this.dw_testcycle=create dw_testcycle
this.gb_category=create gb_category
this.Control[]={this.cb_exit,&
this.cbx_central,&
this.st_application,&
this.cb_results,&
this.mle_message,&
this.cb_version,&
this.cb_updatecycle,&
this.st_progress,&
this.cb_newcycle,&
this.cb_getcycle,&
this.cbx_addtests,&
this.ddlb_category,&
this.cb_run,&
this.cb_delete,&
this.cb_populate,&
this.dw_testtransaction,&
this.dw_testcycle,&
this.gb_category}
end on

on w_test_controller.destroy
destroy(this.cb_exit)
destroy(this.cbx_central)
destroy(this.st_application)
destroy(this.cb_results)
destroy(this.mle_message)
destroy(this.cb_version)
destroy(this.cb_updatecycle)
destroy(this.st_progress)
destroy(this.cb_newcycle)
destroy(this.cb_getcycle)
destroy(this.cbx_addtests)
destroy(this.ddlb_category)
destroy(this.cb_run)
destroy(this.cb_delete)
destroy(this.cb_populate)
destroy(this.dw_testtransaction)
destroy(this.dw_testcycle)
destroy(this.gb_category)
end on

event open;/****************************************************************************************************
Object      :  w_testOrganizer                  Event     :  Open

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  Open event of window.

*****************************************************************************************************/

Long ll_currentRow = 1

nvo_SQLCA = Create nvo_control_SQLCA

GetApplication().SetTransPool(5,5,10)

io_envFunctions = Create uo_memory

//****************************
//connect to EAS Demo db V3 at first, if all the db file is ASA7.0's, comment this. ADC xiong sheng July17,2001
nvo_control_SQLCA nvo_SQLCA_1
nvo_SQLCA_1 = Create nvo_control_SQLCA
nvo_SQLCA_1.DBMS = "ODBC"
nvo_SQLCA_1.AutoCommit = False
nvo_SQLCA_1.DBParm = "ConnectString='DSN=EAS Demo DB V3;UID=dba;PWD=sql',DelimitIdentifier='NO'"
connect using nvo_SQLCA_1;
//****************************

//*************************************************
// SCRIPT COPIED FROM w_test_controller (old)

// Event/Function Name: open
// Auguments: 		None
// Returns: 		Long - Not normally set
// Description:	Initial setup of controller window. 
// History: 4/10/98 - Added Comment header during an update - Neil Fitzgerald
//				4/10/98 - Commented out messagebox that appears when unattended - Neil Fitzgerald
//---

// Begin Script



string lsArgs
lsArgs = CommandParm()   //Check to see if any arguments passed
								 //to the .EXE -D or -d is do all!

if (Lower(ProfileString("controller.ini","Automation","QAP","false")) = "true") then
	is_LogFile = ProfileString("controller.ini","LogFileInfo","LogFileName",GetApplication().appname + ".log")
	is_ProFile = ProfileString("controller.ini","LogFileInfo","ProFileName",GetApplication().appname + ".txt")
	ibautomation = TRUE
	ib_centralDB = FALSE // Always run in ASE for automation
else
	is_LogFile = GetApplication().appname + ".log"
	is_ProFile = GetApplication().appname + ".txt"
end if

//Check lsArgs to see whether -d or -D passed
if (Len (lsArgs) > 0) then
 	if (pos (lsargs,"-d") > 0) Or (pos (lsargs,"-D") > 0) then // Is there a -d on the command line?
		//Unattended Do All via the command line
		ib_unAttended = TRUE
		// MessageBox("Test Controller", "ibUnattended is TRUE")
	else
		of_Messagebox ("Test Controller Error", "-D (Do all) only valid command line arg!", Information!, OK!)
 	end if
end if

//Does a profile exist
if fileexists (is_Profile) then
	ib_Profile = TRUE
end if


st_application.Text = 'Application : ' + GetApplication().appname

// Set userid for Automation
If ibautomation Then
	is_userId = 'AUTOMATION'
End IF

This.wf_reposition('CENTRE')
If ibAutomation Then
	Timer(10, This)
End IF


// End Script Copied
end event

event close;

// Clean-up Memory

If IsValid(ids_testMaster) Then
	Destroy ids_testMaster
End IF

If IsValid(ids_controlValues) Then
	Destroy ids_controlValues
End IF

If IsValid(nvo_SQLCA) Then
	Destroy nvo_SQLCA
End IF

If IsValid(ids_resultSet) Then
	Destroy ids_resultSet
End IF

If IsValid(io_envFunctions) Then
	Destroy io_envFunctions
End IF


HALT CLOSE;
end event

event rbuttondown;/****************************************************************************************************
Object      :  w_testOrganizer                  Event     :  rButtonDown

Author      :  Ramalingam S                     Date      :  26 May, 2000

Purpose     :  Debugging for developers

*****************************************************************************************************/

If Flags = 14 Then // Ctrl + Shift
	If This.ib_debug Then
		This.ib_debug = FALSE
	Else
		This.ib_debug = TRUE
	End IF
	Open(w_startTrace)
End IF

If Flags = 10 Then // Control
	CHOOSE CASE Upper(is_windowPosition)
		CASE 'TOPRIGHT'
			wf_reposition('BOTTOMRIGHT')
		CASE 'BOTTOMRIGHT'
			wf_reposition('BOTTOMLEFT')
		CASE 'BOTTOMLEFT'
			wf_reposition('TOPLEFT')
		CASE 'TOPLEFT'
			wf_reposition('CENTRE')
		CASE 'CENTRE'
			wf_reposition('TOPRIGHT')
		Case Else
			wf_reposition('CENTRE')
	END CHOOSE
END IF



end event

event timer;
If ibAutomation Then
	This.SetFocus()
End IF
end event

type cb_exit from commandbutton within w_test_controller
integer x = 2816
integer y = 1568
integer width = 443
integer height = 108
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exit"
end type

event clicked;Close(Parent)

end event

type cbx_central from checkbox within w_test_controller
integer x = 2450
integer y = 368
integer width = 731
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 32768
long backcolor = 67108864
string text = "Test on CENTRAL dB"
end type

event clicked;/****************************************************************************************************
Object      :  cbx_central                      Event     :  Clicked

Author      :  Ramalingam S                     Date      :  17 May, 2000

Purpose     :  Decides the database connection between ASA(Local)/ASE(central)

*****************************************************************************************************/

Disconnect USING nvo_SQLCA;

IF This.Checked Then
	This.TextColor = RGB(255, 0, 0)
	ib_centralDB=TRUE
Else
	This.TextColor = RGB(0, 128, 0)
	ib_centralDB=FALSE
End IF

	wf_ready() // Prepare the environment
end event

type st_application from statictext within w_test_controller
integer x = 73
integer width = 2327
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_results from commandbutton within w_test_controller
integer x = 2821
integer y = 1052
integer width = 443
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "View &Results"
end type

event clicked;nvo_results lnvo_results
lnvo_results = Create nvo_results
lnvo_results.iw_testController = Parent
Openwithparm(w_results, lnvo_results)
Destroy lnvo_results
end event

type mle_message from multilineedit within w_test_controller
boolean visible = false
integer x = 1499
integer y = 1696
integer width = 1760
integer height = 252
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_version from commandbutton within w_test_controller
boolean visible = false
integer x = 2903
integer y = 64
integer width = 265
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Version"
end type

event clicked;/*String ls_app, ls_build, ls_date
Integer li_test
li_test = pbdv_getbuildinfo(ls_app, ls_build, ls_date)
of_MessageBox("Build", ls_app + "  " + ls_build + "   " + ls_date, Information!, OK!)

String ls_version, ls_buildNo
Integer li_versionPosition, li_buildPosition
li_versionPosition = Pos(ls_build, 'Version', 1)
li_buildPosition = Pos(ls_build, 'Build', 1)
ls_version = Mid(ls_build,  li_versionPosition + 8, li_buildPosition - (li_versionPosition + 8))
//MessageBox('', ls_version)
ls_buildNo = Mid(ls_build,  li_buildPosition + 6, Len(ls_build) - li_buildPosition)
//MessageBox('', ls_buildNo)

*/

String ls_name
ContextInformation ici_info
String ls_version
Constant String ls_currver = "6.0.02"
GetContextService("ContextInformation", ici_info)
ici_info.GetVersionName(ls_version)

MessageBox("Version", ls_version)
end event

type cb_updatecycle from commandbutton within w_test_controller
integer x = 2816
integer y = 1452
integer width = 443
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Save Results"
end type

event clicked;/****************************************************************************************************
Object      :  cb_updateCycle                   Event     :  Clicked

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  To save the test cycle with results

*****************************************************************************************************/
Long ll_currentRow
Double ldb_cycleNo
dw_testCycle.SetTransObject(nvo_SQLCA)
// If cycle is retrieved from db, generate new cycle no and update dw_transaction & result set datastore
IF NOT (dw_testcycle.GetItemStatus(1, 0, Primary!) = New! OR dw_testcycle.GetItemStatus(1, 0, Primary!) = NewModified!) Then
	// Update mode - set new cycle number for all
	ldb_cycleNo = Double(wf_getNewCycleNo())
	dw_testCycle.SetItem(1, 'cycleno', ldb_cycleNo)
	dw_testCycle.SetItemStatus(1, 0, Primary!, NewModified!)
	dw_testTransaction.RowsDiscard(1, dw_testTransaction.DeletedCount(), Delete!)
	// Set the new cycle number in transaction
	Do While ll_currentRow <= dw_testTransaction.RowCount()
		dw_testTransaction.SetItem(ll_currentRow, 'testtrans_cycleno', ldb_cycleNo)
		dw_testTransaction.SetItemStatus(ll_currentRow, 0, Primary!, NewModified!)
		ll_currentRow++
	LOOP
	// Set the new cycle number in transaction
	ll_currentRow = 1
	Do While ll_currentRow <= ids_resultSet.RowCount()
		ids_resultSet.SetItem(ll_currentRow, 'cycleno', ldb_cycleNo)
		ll_currentRow++
	LOOP
End IF // Modified cycle

wf_auditUpdate(dw_testCycle)

dw_testCycle.Update()
If nvo_SQLCA.SQLCode = 0 Then
	dw_testTransaction.SetTransObject(nvo_SQLCA)
	dw_testTransaction.Update()
	If nvo_SQLCA.SQLCode = 0 Then
		ids_resultSet.SetTransObject(nvo_SQLCA)
		ids_resultSet.Update()
		IF nvo_SQLCA.SQLCode = 0 Then
			Commit;
			This.Enabled = FALSE
		Else
			Rollback;
		End IF // No errors
	Else
		Rollback;
	End IF // Result update
Else
	Rollback;
End IF // Transaction update
end event

type st_progress from statictext within w_test_controller
integer x = 1499
integer y = 1600
integer width = 1294
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_newcycle from commandbutton within w_test_controller
integer x = 2446
integer y = 164
integer width = 338
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "New Cycle"
end type

event clicked;/****************************************************************************************************
Object      :  cb_newCycle                      Event     :  Clicked

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  To Insert cycles

*****************************************************************************************************/

dw_testTransaction.dataObject = 'd_test_transactions'
wf_setDefault(FALSE) // Sets default, do not write log with env.
dw_testTransaction.Trigger Event ue_prepareNew()
cb_populate.Enabled = True
cb_updateCycle.Enabled = False

end event

type cb_getcycle from commandbutton within w_test_controller
integer x = 2446
integer y = 64
integer width = 338
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Get Cycle"
end type

event clicked;/****************************************************************************************************
Object      :  cb_getCycle                      Event     :  Clicked

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  To Retrieve Existing cycles

*****************************************************************************************************/

Double ld_testCycle
Long ll_currentRow

dw_testCycle.AcceptText()
ld_testCycle = dw_testCycle.GetItemNumber(1, 'cycleno')
dw_testCycle.dataObject = 'd_test_cycle_existing'
dw_testCycle.SetTransObject(nvo_SQLCA)
If dw_testCycle.Retrieve(ld_testCycle) < 1 Then
	dw_testCycle.InsertRow(0)
End IF

dw_testTransaction.dataObject = 'd_test_transactions_existing'
dw_testTransaction.SetTransObject(nvo_SQLCA)
dw_testTransaction.Trigger Event ue_prepareNew()
If dw_testTransaction.Retrieve(ld_testCycle) < 1 Then
	dw_testTransaction.dataObject = 'd_test_transactions'
	dw_testTransaction.SetTransObject(nvo_SQLCA)
Else
	dw_testTransaction.Object.p_select.Tag = 'SELECT'
	dw_testTransaction.Object.p_select.Filename = 'ALL.bmp'
	Do While ll_currentRow <= dw_testTransaction.RowCount() // Reset the result
		dw_testTransaction.SetItem(ll_currentRow, 'testtrans_result', '99')
		ll_currentRow ++
	LOOP
End IF

cb_updateCycle.Enabled = False

end event

type cbx_addtests from checkbox within w_test_controller
integer x = 910
integer y = 1636
integer width = 443
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Add Tests"
end type

type ddlb_category from dropdownlistbox within w_test_controller
integer x = 142
integer y = 1636
integer width = 722
integer height = 292
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean allowedit = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_run from commandbutton within w_test_controller
integer x = 2821
integer y = 924
integer width = 443
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "DoAllSelected"
end type

event clicked;/****************************************************************************************************
Object      :  cb_run                           Event     :  Clicked

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  To run tests

*****************************************************************************************************/
Long ll_currentRow = 1

//dw_testCycle.Update()
//dw_testTransaction.Update()

// Reset result
ids_resultSet.Reset()

Do While ll_currentRow <= dw_testTransaction.RowCount()
	IF dw_testTransaction.GetItemString(ll_currentRow, 'runtest') = 'Y' Then // IF selected Run
		il_currentTestRow = ll_currentRow
		Parent.Post Event ue_setFocus()
		IF ibAutomation Then // Automation - Silk - Mode
			IF dw_testTransaction.GetItemString(ll_currentRow, 'testsmaster_autorun_include') = 'Y' Then // IF Available for autorun
				wf_testExecute( dw_testTransaction.GetItemString(ll_currentRow, 'testsmaster_testname' ))
			End IF
		Else	// Manual Mode
			wf_testExecute( dw_testTransaction.GetItemString(ll_currentRow, 'testsmaster_testname' ))
		End IF
			// Set the current test name - used elsewhere to log resuls
	End IF
	ll_currentRow ++
LOOP

st_progress.TextColor = 0
st_progress.Text = "Tests completed @ " + string (now())
cb_updateCycle.Enabled = True

IF ibAutomation OR ib_unAttended Then
	cb_updateCycle.Trigger Event Clicked()
End IF
end event

type cb_delete from commandbutton within w_test_controller
integer x = 2821
integer y = 796
integer width = 443
integer height = 100
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete Selected"
end type

event clicked;/****************************************************************************************************
Object      :  cb_delete                        Event     :  Clicked

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  To delete the selected tests

*****************************************************************************************************/

Long ll_currentRow=1
dw_testTransaction.SetTransObject(nvo_SQLCA)

DO WHILE ll_currentRow  <= dw_testTransaction.RowCount()
	IF dw_testTransaction.IsSelected(ll_currentRow) Then
		If dw_testTransaction.GetItemString(ll_currentRow, 'runTest') = 'Y' Then
			If wf_checkTestDependence(ll_currentRow, 'N') Then
				dw_testTransaction.DeleteRow(ll_currentRow)
				ll_currentRow -- // Keep the counter after deleting the row
			End IF
		Else
			dw_testTransaction.DeleteRow(ll_currentRow)
			ll_currentRow -- // Keep the counter after deleting the row
		End IF			
	End IF
	ll_currentRow ++
LOOP
end event

type cb_populate from commandbutton within w_test_controller
integer x = 905
integer y = 1836
integer width = 453
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Populate Tests"
end type

event clicked;/****************************************************************************************************
Object      :  cb_populate                      Event     :  Clicked

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  To populate the transaction datawindow with test cases retrieved from
               test master table.

*****************************************************************************************************/
Long ll_currentRow = 1, ll_insertedRow

dw_testTransaction.SetTransObject(nvo_SQLCA)
If NOT wf_populateTests() Then // Populate datastore with data from db
	Return
End IF

// Add to the list if addtests check box checked
If NOT cbx_addtests.Checked Then
	dw_testTransaction.Trigger Event ue_prepareNew()
End IF

// Transfer the test details from datastore to visible dw
DO WHILE ll_currentRow  <= ids_testMaster.RowCount()
	ll_insertedRow = dw_testTransaction.InsertRow(dw_testTransaction.RowCount() + 1)
	dw_testTransaction.SetItem(ll_insertedRow, 'testtrans_testno', &
			ids_testMaster.GetItemNumber(ll_currentRow, 'testno'))
	dw_testTransaction.SetItem(ll_insertedRow, 'testtrans_cycleno', &
			dw_testCycle.GetItemNumber(1, 'cycleno'))
	dw_testTransaction.SetItem(ll_insertedRow, 'testsmaster_testname', &
			ids_testMaster.GetItemString(ll_currentRow, 'testname'))
	dw_testTransaction.SetItem(ll_insertedRow, 'testsmaster_description', &
			ids_testMaster.GetItemString(ll_currentRow, 'description'))
	dw_testTransaction.Setitem(ll_insertedRow, 'testsmaster_testCategory', &
			ids_testMaster.GetItemString(ll_currentRow, 'testcategory'))
	dw_testTransaction.Setitem(ll_insertedRow, 'testsmaster_previousNeed', &
			ids_testMaster.GetItemString(ll_currentRow, 'previousNeed'))
	dw_testTransaction.SetItem(ll_insertedRow, 'runTest', &
			ids_testMaster.GetItemString(ll_currentRow, 'runtest'))
	dw_testTransaction.SetItem(ll_insertedRow, 'testsmaster_autorun_include', &
			ids_testMaster.GetItemString(ll_currentRow, 'autorun_include'))
	dw_testTransaction.SetItem(ll_insertedRow, 'testtrans_result', '99')
	ll_currentRow++
LOOP

dw_testTransaction.SetSort("testtrans_testno A")
dw_testTransaction.Sort()

end event

type dw_testtransaction from datawindow within w_test_controller
event ue_preparenew ( )
integer x = 73
integer y = 496
integer width = 2729
integer height = 1060
integer taborder = 40
string dataobject = "d_test_transactions"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_preparenew;/****************************************************************************************************
Object      :  dw_testTransaction               Event     :  ue_prepareNew

Author      :  Ramalingam S                     Date      :  27 April, 2000

Purpose     :  Prepares the dw.

*****************************************************************************************************/
dataWindowChild ldw_category

This.Reset()
This.SetTransObject(nvo_SQLCA)


This.GetChild('testsmaster_testcategory', ldw_category)
ldw_category.SetTransObject(nvo_SQLCA)
ldw_category.Retrieve('TESTSMASTER', 'TESTCATEGORY')


end event

event clicked;/****************************************************************************************************
Object      :  dw_testTransaction               Event     :  Clicked

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  Highlight the selected row.

*****************************************************************************************************/
Long ll_currentRow
Integer li_selectedRowCount

If row > 0 Then
	ll_currentRow = il_selectedRow
	
	If KeyDown(KeyShift!) Then
		Do While ll_currentRow <= row
			This.SelectRow(ll_currentRow, TRUE)
			ll_currentRow ++
		LOOP
	End IF
	
	If KeyDown(KeyControl!) Then
		IF This.IsSelected(row) Then
			This.SelectRow(row, FALSE)
		Else
			This.SelectRow(row, TRUE)
		End IF
	End IF
	
	If NOT (KeyDown(KeyControl!) OR KeyDown(KeyShift!)) Then
		This.SelectRow(0, FALSE) // Unselect all
		This.SelectRow(il_selectedRow, FALSE)
		This.SelectRow(row, TRUE)
	End IF
	
	il_selectedRow = row
End IF

// Code for Picture p_select
If Upper(dwo.Name) = 'P_SELECT' Then
	ll_currentRow = 1
	Do
		If This.IsSelected(ll_currentRow) Then
			li_selectedRowCount ++ 
		End IF
		ll_currentRow ++
	LOOP WHILE li_selectedRowCount < 2 AND ll_currentRow <= This.RowCount()

	ll_currentRow = 1
	
	If dwo.Tag = 'SELECT' Then
		Do While ll_currentRow <= This.RowCount()
			If li_selectedRowCount > 1 Then // Multiple rows selected
				If This.IsSelected(ll_currentRow) Then
					This.SetItem(ll_currentRow, 'runtest', 'Y')
				End IF
			Else
				This.SetItem(ll_currentRow, 'runtest', 'Y')
			This.Object.p_select.Tag = 'UNSELECT'
			This.Object.p_select.Filename = 'NONE.bmp'
			End IF
			ll_currentRow ++
		LOOP
	Else
		Do While ll_currentRow <= This.RowCount()
			IF wf_checkTestDependence(ll_currentRow, 'N') Then
				If li_selectedRowCount > 1 Then //Multiple rows selected
					If This.IsSelected(ll_currentRow) Then
						This.SetItem(ll_currentRow, 'runtest', 'N')
					End IF
				Else
					This.SetItem(ll_currentRow, 'runtest', 'N')
					This.Object.p_select.Tag = 'SELECT'
					This.Object.p_select.Filename = 'ALL.bmp'
				End If
			End IF
				ll_currentRow ++
		LOOP
	End If
End IF
end event

event itemchanged;/****************************************************************************************************
Object      :  dw_testTransaction               Event     :  ItemChanged

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  Check for dependencies

*****************************************************************************************************/
// Check for dependencies
If Upper(dwo.Name) = 'RUNTEST' Then
	If NOT wf_checkTestDependence(row, data) Then
		Return 1
	End IF
End IF

end event

event itemerror;/****************************************************************************************************
Object      :  dw_testTransaction               Event     :  ItemChanged

Author      :  Ramalingam S                     Date      :  01 May, 2000

Purpose     :  Do not generate system errors

*****************************************************************************************************/
Return 1 // Prevent system errors
end event

event sqlpreview;// Debug facility

String ls_test
ls_test = ''
end event

event rbuttondown;wf_debug(This.GetSqlSelect())
end event

type dw_testcycle from datawindow within w_test_controller
event ue_preparenew ( )
integer x = 69
integer y = 60
integer width = 2336
integer height = 404
integer taborder = 10
string dataobject = "d_test_cycle"
borderstyle borderstyle = stylelowered!
end type

event ue_preparenew;/****************************************************************************************************
Object      :  dw_testCycle                     Event     :  ue_prepareNew

Author      :  Ramalingam S                     Date      :  27 April, 2000

Purpose     :  Prepares the dw.

*****************************************************************************************************/
dw_testCycle.Reset()
dw_testCycle.dataObject = 'd_test_cycle'
dw_testCycle.SetTransObject(nvo_SQLCA)
dw_testCycle.InsertRow(0)
dw_testCycle.SetItem(1, 'cycle_date', Today())
dw_testCycle.SetItem(1, 'host_application', Upper(GetApplication().AppName))

end event

event itemchanged;/****************************************************************************************************
Object      :  dw_testCycle                     Event     :  ItemChanged

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  Validity

*****************************************************************************************************/
String ls_dummy

If Upper(dwo.Name) = 'CYCLENO' Then
	If NOT IsNull(data) AND TRIM(data) <> '' Then
		Select '' INTO :ls_dummy FROM TestCycle WHERE cycleNo = :data Using nvo_SQLCA;
		IF nvo_SQLCA.SQLCode <> 100 Then
			cb_getCycle.Trigger Event Clicked()
		End IF
		cb_populate.Enabled = True
	Else
		cb_populate.Enabled = False
	End IF
End IF
end event

event clicked;/****************************************************************************************************
Object      :  dw_testCycle                     Event     :  Clicked

Author      :  Ramalingam S                     Date      :  26 April, 2000

Purpose     :  Open Browser window.

*****************************************************************************************************/

// Code for Picture p_select
If Upper(dwo.Name) = 'T_BROWSE' Then
	OpenWithParm(w_browseCycle, nvo_SQLCA)
	This.dataObject = 'd_test_cycle_existing'
	This.SetTransObject(nvo_SQLCA)
	This.InsertRow(0)
	This.SetItem(1, 'cycleNo', Message.DoubleParm)
	cb_getCycle.Trigger Event Clicked()
End IF
end event

event dberror;/****************************************************************************************************
Object      :  dw_testCycle                     Event     :  dbError

Author      :  Ramalingam S                     Date      :  27 April, 2001

Purpose     :  Check for duplicate number generation & fix.

*****************************************************************************************************/


If sqldbcode <> 0 AND  ii_cycleErrorCount <= 3 Then
	wf_getNewCycleNo()
	This.Update()
	ii_cycleErrorCount ++
End IF
If ii_cycleErrorCount > 3 THEN
	ii_cycleErrorCount = 0
	wf_logTest('Error Updating testCycle Data : ' + sqlerrtext)
End IF
If ibAutomation Then
	Return -1
End IF
end event

type gb_category from groupbox within w_test_controller
integer x = 73
integer y = 1564
integer width = 1349
integer height = 384
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 32768
long backcolor = 67108864
string text = "Test Category"
end type

