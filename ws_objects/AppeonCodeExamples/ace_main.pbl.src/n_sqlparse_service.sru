$PBExportHeader$n_sqlparse_service.sru
$PBExportComments$SQL Parse service(UFC)
forward
global type n_sqlparse_service from nonvisualobject
end type
end forward

global type n_sqlparse_service from nonvisualobject
end type
global n_sqlparse_service n_sqlparse_service

type variables
//====================================================================
// Declare: Instance Variables()
//--------------------------------------------------------------------
// Description: define string.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: (none)
//--------------------------------------------------------------------
// Author: 	 		Date: 2004/01/05
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Public ProtectedWrite String ServiceName
Public ProtectedWrite String ShortName
Public ProtectedWrite String Description
Public ProtectedWrite Decimal Version
Public ProtectedWrite String authors


end variables

forward prototypes
private function boolean of_sqlcheckquote (integer ai_i, integer ai_dq[], integer ai_dq_count, integer ai_q[], integer ai_q_count)
public function string of_addcondition (string as_old_sql, string as_insert, string as_type)
public function string of_addcondition (string as_sql, string as_insert)
public function string of_assemble (n_sqlparse_sqlattrib astr_sql[])
public function long of_parsetoarray (string as_source, string as_delimiter, ref string as_array[])
public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase)
public function integer of_parse (string as_sql, ref n_sqlparse_sqlattrib astr_sql)
end prototypes

private function boolean of_sqlcheckquote (integer ai_i, integer ai_dq[], integer ai_dq_count, integer ai_q[], integer ai_q_count);//====================================================================
// Function: of_sqlcheckquote()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments: 
//		integer	ai_i       		
//		integer	ai_dq[]    		
//		integer	ai_dq_count		
//		integer	ai_q[]     		
//		integer	ai_q_count 		
//--------------------------------------------------------------------
// Returns: boolean
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Boolean lb_return
Int i

lb_return = False
For i = 1 To ai_dq_count Step 2
	If ai_i > ai_dq[i] And ai_i < ai_dq[i+1] Then
		lb_return = True
		Exit
	End If
Next

If Not lb_return Then
	For i = 1 To ai_q_count Step 2
		If ai_i > ai_q[i] And ai_i < ai_q[i+1] Then
			lb_return = True
			Exit
		End If
	Next
End If
Return lb_return

end function

public function string of_addcondition (string as_old_sql, string as_insert, string as_type);//====================================================================
// Function: of_addcondition()
//--------------------------------------------------------------------
// Description: add a term on the former SQL's sentence base 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_old_sql		
//		string	as_insert 		
//		string	as_type   		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
String ls_main,ls_where,ls_groupby,ls_orderby,ls_new,ls_lowersql

Int li_dq[],li_q[]
Int li_where = 0,li_groupby = 0,li_orderby = 0
Int i,j,li_dq_count,li_q_count

//search " position in as_old_sql
j = 1
i = 1
ls_lowersql = Lower(as_old_sql)
li_dq_count = 0
i = PosA(ls_lowersql,"~"",1)
Do While i > 0
	If RightA(LeftA(ls_lowersql,i),2) <> "~~~"" then
		li_dq[j] = i
		j ++
		li_dq_count ++
	End If
	i = PosA(ls_lowersql,"~"",i+1)
Loop

//search ' position in as_old_sql
j = 1
i = 1
li_q_count = 0
i = PosA(ls_lowersql,"'",1)
Do While i > 0
	If RightA(LeftA(ls_lowersql,i),2) <> "~~'" Then
		li_q[j] = i
		j ++
		li_q_count ++
	End If
	i = PosA(ls_lowersql,"'",i+1)
Loop

//search where position in as_old_sql
i = PosA(ls_lowersql,"where",1)
Do While i > 0 And of_SqlCheckQuote(i,li_dq,li_dq_count,li_q,li_q_count)
	i = PosA(ls_lowersql,"where",i + 5)
Loop
li_where = i

//search group by position in as_old_sql
i = PosA(ls_lowersql,"group by",1)
Do While i > 0 And of_SqlCheckQuote(i,li_dq,li_dq_count,li_q,li_q_count)
	i = PosA(ls_lowersql,"group by",i + 8)
Loop
li_groupby = i

//search order by position in as_old_sql
i = PosA(ls_lowersql,"order by",1)
Do While i > 0 And of_SqlCheckQuote(i,li_dq,li_dq_count,li_q,li_q_count)
	i = PosA(ls_lowersql,"order by",i + 8)
Loop
li_orderby = i

//set order by string
ls_main = as_old_sql
If li_orderby > 0 Then
	ls_orderby = RightA(ls_main,LenA(ls_main) - li_orderby +1)
	ls_main = LeftA(ls_main,li_orderby -1)
End If

//set group by string
If li_groupby > 0 Then
	ls_groupby = RightA(ls_main,LenA(ls_main) - li_groupby + 1)
	ls_main = LeftA(ls_main,li_groupby - 1)
End If

//set where string
If li_where > 0 Then
	ls_where = RightA(ls_main,LenA(ls_main) - li_where + 1)
	ls_main = LeftA(ls_main,li_where -1)
End If

Choose Case Lower(as_type)
	Case "where"
		If li_where > 0 Then
			ls_new = ls_main + " where (" + RightA(ls_where,LenA(ls_where) - 5) + ") and (" + &
				as_insert + ") " + ls_groupby + ls_orderby
		Else
			ls_new = ls_main + "where " + as_insert + " " + ls_groupby + ls_orderby
		End If
	Case "groupby"
		If li_groupby > 0 Then
			ls_new = ls_main + ls_where + " group by " + RightA(ls_groupby,LenA(ls_groupby) - 8) + &
				"," + as_insert + " " + ls_orderby
		Else
			ls_new = ls_main + ls_where  + "group by " + as_insert + " " + ls_orderby
		End If
	Case "orderby"
		If li_orderby > 0 Then
			ls_new = ls_main + ls_where + ls_groupby + " order by " + &
				RightA(ls_orderby,LenA(ls_orderby) - 8) + "," + as_insert
		Else
			ls_new = ls_main + ls_where + ls_groupby + " order by " + as_insert
		End If
End Choose
Return ls_new


end function

public function string of_addcondition (string as_sql, string as_insert);//====================================================================
// Function: of_addcondition()
//--------------------------------------------------------------------
// Description: add a term on the former SQL's sentence base 
//--------------------------------------------------------------------
// Arguments: 
//		string	as_sql   		
//		string	as_insert		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Return of_AddCondition(as_sql, as_insert, "where")

end function

public function string of_assemble (n_sqlparse_sqlattrib astr_sql[]);//====================================================================
// Function: of_assemble()
//--------------------------------------------------------------------
// Description: Build a SQL statement from its component parts.
//--------------------------------------------------------------------
// Arguments: 
//		n_sqlparse_sqlattrib	astr_sql[]		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer	li_NumStats, li_Cnt
String	ls_SQL

li_NumStats = UpperBound(astr_sql[])

For li_Cnt = 1 To li_NumStats
	
	// Check for valid data
	If Trim(astr_sql[li_Cnt].s_Verb) = "" Or &
		Trim(astr_sql[li_Cnt].s_Tables) = "" Then
		Return ""
	End If
	
	// If there is more than one statement in the array, they are SELECTs that
	// should be joined by a UNION
	If li_Cnt > 1 Then
		ls_SQL = ls_SQL + " UNION "
	End If
	
	ls_SQL = ls_SQL + astr_sql[li_Cnt].s_Verb
	
	If astr_sql[li_Cnt].s_Verb = "SELECT" Then
		If Trim(astr_sql[li_Cnt].s_Columns) = "" Then
			Return ""
		Else
			ls_SQL = ls_SQL + " " + astr_sql[li_Cnt].s_Columns + &
				" FROM " + astr_sql[li_Cnt].s_Tables
		End If
		
	Else
		ls_SQL = ls_SQL + " " + astr_sql[li_Cnt].s_Tables
		
		If astr_sql[li_Cnt].s_Verb = "UPDATE" Then
			ls_SQL = ls_SQL + " SET " + astr_sql[li_Cnt].s_Columns
		ElseIf Trim(astr_sql[li_Cnt].s_Columns) <> "" Then
			ls_SQL = ls_SQL + " " + astr_sql[li_Cnt].s_Columns
		End If
	End If
	
	If Trim(astr_sql[li_Cnt].s_Values) <> "" Then
		ls_SQL = ls_SQL + " VALUES " + astr_sql[li_Cnt].s_Values
	End If
	
	If Trim(astr_sql[li_Cnt].s_Where) <> "" Then
		ls_SQL = ls_SQL + " WHERE " + astr_sql[li_Cnt].s_Where
	End If
	
	If Trim(astr_sql[li_Cnt].s_Group) <> "" Then
		ls_SQL = ls_SQL + " GROUP BY " + astr_sql[li_Cnt].s_Group
	End If
	
	If Trim(astr_sql[li_Cnt].s_Having) <> "" Then
		ls_SQL = ls_SQL + " HAVING " + astr_sql[li_Cnt].s_Having
	End If
	
	If Trim(astr_sql[li_Cnt].s_Order) <> "" Then
		ls_SQL = ls_SQL + " ORDER BY " + astr_sql[li_Cnt].s_Order
	End If
Next

Return ls_SQL


end function

public function long of_parsetoarray (string as_source, string as_delimiter, ref string as_array[]);//===================================================================================
// Function: of_parsetoarray()
//-----------------------------------------------------------------------------------
// Description: separate a string into a character string array by the list separator
//-----------------------------------------------------------------------------------
// Arguments: 
//		      	string	as_source   		
//		      	string	as_delimiter		
//		ref   	string   as_array[]		
//-----------------------------------------------------------------------------------
// Returns: long
//-----------------------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//-----------------------------------------------------------------------------------
// Modify History: 
//	
//-----------------------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//===================================================================================
Long		ll_DelLen, ll_Pos, ll_Count, ll_Start, ll_Length
String 	ls_holder

//Check for NULL
If IsNull(as_source) Or IsNull(as_delimiter) Then
	Long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Check for at leat one entry
If Trim (as_source) = '' Then
	Return 0
End If

//Get the length of the delimeter
ll_DelLen = LenA(as_delimiter)

ll_Pos =  PosA(Upper(as_source), Upper(as_delimiter))

//Only one entry was found
If ll_Pos = 0 Then
	as_Array[1] = as_source
	Return 1
End If

//More than one entry was found - loop to get all of them
ll_Count = 0
ll_Start = 1
Do While ll_Pos > 0
	
	//Set current entry
	ll_Length = ll_Pos - ll_Start
	ls_holder = MidA (as_source, ll_Start, ll_Length)
	
	// Update array and counter
	ll_Count ++
	as_Array[ll_Count] = ls_holder
	
	//Set the new starting position
	ll_Start = ll_Pos + ll_DelLen
	
	ll_Pos =  PosA(Upper(as_source), Upper(as_delimiter), ll_Start)
Loop

//Set last entry
ls_holder = MidA (as_source, ll_Start, LenA (as_source))

// Update array and counter if necessary
If LenA (ls_holder) > 0 Then
	ll_Count++
	as_Array[ll_Count] = ls_holder
End If

//Return the number of entries found
Return ll_Count



end function

public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase);//====================================================================
// Function: of_globalreplace()
//--------------------------------------------------------------------
// Description: substitute global string
//--------------------------------------------------------------------
// Arguments: 
//		string 	as_source    		
//		string 	as_old       		
//		string 	as_new       		
//		boolean	ab_ignorecase		
//--------------------------------------------------------------------
// Returns: string
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Long	ll_Start, ll_OldLen, ll_NewLen
String ls_Source

//Check parameters
If IsNull(as_source) Or IsNull(as_old) Or IsNull(as_new) Or IsNull(ab_ignorecase) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Get the string lenghts
ll_OldLen = LenA(as_old)
ll_NewLen = LenA(as_new)

//Should function respect case.
If ab_ignorecase Then
	as_old = Lower(as_old)
	ls_Source = Lower(as_source)
Else
	ls_Source = as_source
End If

//Search for the first occurrence of as_Old
ll_Start = PosA(ls_Source, as_old)

Do While ll_Start > 0
	// replace as_Old with as_New
	as_source = ReplaceA(as_source, ll_Start, ll_OldLen, as_new)
	
	//Should function respect case.
	If ab_ignorecase Then
		ls_Source = Lower(as_source)
	Else
		ls_Source = as_source
	End If
	
	// find the next occurrence of as_Old
	ll_Start = PosA(ls_Source, as_old, (ll_Start + ll_NewLen))
Loop

Return as_source


end function

public function integer of_parse (string as_sql, ref n_sqlparse_sqlattrib astr_sql);//====================================================================
// Function: of_parse()
//--------------------------------------------------------------------
// Description: Parse a SQL statement into its component parts.
//--------------------------------------------------------------------
// Arguments: 
//		      	string	as_sql              		
//		ref   	n_sqlparse_sqlattrib	astr_sql		
//--------------------------------------------------------------------
// Returns: integer
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Integer	li_Pos, li_KWNum, li_NumStats, li_Cnt
String	ls_UpperSQL, ls_Keyword[7], ls_Clause[7], ls_SQL[]

// Separate the statement into multiple statements separated by UNIONs
li_NumStats = of_ParseToArray(as_SQL, "UNION", ls_SQL)
If li_NumStats > 1 Then li_NumStats = 1
For li_Cnt = 1 To li_NumStats
	// Remove Carriage returns, Newlines, and Tabs
	ls_SQL[li_Cnt] = of_GlobalReplace(ls_SQL[li_Cnt], "~r", " ",True)
	ls_SQL[li_Cnt] = of_GlobalReplace(ls_SQL[li_Cnt], "~n", " ",True)
	ls_SQL[li_Cnt] = of_GlobalReplace(ls_SQL[li_Cnt], "~t", " ",True)
	
	// Remove leading and trailing spaces
	ls_SQL[li_Cnt] = Trim(ls_SQL[li_Cnt])
	
	// Convet to upper case
	ls_UpperSQL = Upper(ls_SQL[li_Cnt])
	
	// Determine what type of SQL this is
	// and assign the appropriate kewords
	// for the corresponding type
	If LeftA(ls_UpperSQL, 7) = "SELECT " Then
		// Parse the SELECT statement
		ls_Keyword[1] = "SELECT "
		ls_Keyword[2] = " FROM "
		ls_Keyword[3] = " WHERE "
		ls_Keyword[4] = " GROUP BY "
		ls_Keyword[5] = " HAVING "
		ls_Keyword[6] = " ORDER BY "
		
	ElseIf LeftA(ls_UpperSQL, 7) = "UPDATE " Then
		// Parse the UPDATE statement
		ls_Keyword[1] = "UPDATE "
		ls_Keyword[2] = " SET "
		ls_Keyword[3] = " WHERE "
		ls_Keyword[6] = " ORDER BY "
		
	ElseIf LeftA(ls_UpperSQL, 12) = "INSERT INTO " Then
		// Parse the INSERT statement (test before 'insert')
		ls_Keyword[1] = "INSERT INTO "
		ls_Keyword[7] = " VALUES "
		
	ElseIf LeftA(ls_UpperSQL, 7) = "INSERT " Then
		// Parse the INSERT statement (test after 'insert to')
		ls_Keyword[1] = "INSERT "
		ls_Keyword[7] = " VALUES "
		
	ElseIf LeftA(ls_UpperSQL, 12) = "DELETE FROM " Then
		// Parse the DELETE statement (test before 'delete')
		ls_Keyword[1] = "DELETE FROM "
		ls_Keyword[3] = " WHERE "
		
	ElseIf LeftA(ls_UpperSQL, 7) = "DELETE " Then
		// Parse the DELETE statement (test after 'delete from')
		ls_Keyword[1] = "DELETE "
		ls_Keyword[3] = " WHERE "
		
	End If
	
	// There is a maximum of 7 keywords
	For li_KWNum = 7 To 1 Step -1
		If ls_Keyword[li_KWNum] <> "" Then
			// Find the position of the Keyword
			li_Pos = PosA(ls_UpperSQL, ls_Keyword[li_KWNum]) - 1
			
			If li_Pos >= 0 Then
				ls_Clause[li_KWNum] = RightA(ls_SQL[li_Cnt], &
					(LenA(ls_SQL[li_Cnt]) - &
					(li_Pos + LenA(ls_Keyword[li_KWNum]))))
				ls_SQL[li_Cnt] = LeftA(ls_SQL[li_Cnt], li_Pos)
			Else
				ls_Clause[li_KWNum] = ""
			End If
		End If
	Next
	
	astr_sql.s_Verb = Trim(ls_Keyword[1])
	
	If PosA(astr_sql.s_Verb, "SELECT") > 0 Then
		astr_sql.s_Columns = Trim(ls_Clause[1])
		astr_sql.s_Tables 	 = Trim(ls_Clause[2])
	Else
		astr_sql.s_Tables = Trim(ls_Clause[1])
		
		If PosA(astr_sql.s_Verb, "INSERT") > 0 Then
			li_Pos = PosA(astr_sql.s_Tables, " ")
			If li_Pos > 0 Then
				astr_sql.s_Columns = Trim(RightA(astr_sql.s_Tables, &
					(LenA(astr_sql.s_Tables) - li_Pos)))
				astr_sql.s_Tables = LeftA(astr_sql.s_Tables, (li_Pos - 1))
			End If
		Else
			astr_sql.s_Columns = Trim(ls_Clause[2])
		End If
	End If
	
	astr_sql.s_Where 	 = Trim(ls_Clause[3])
	astr_sql.s_Group 	 = Trim(ls_Clause[4])
	astr_sql.s_Having 	 = Trim(ls_Clause[5])
	astr_sql.s_Order 	 = Trim(ls_Clause[6])
	astr_sql.s_Values 	 = Trim(ls_Clause[7])
Next

Return li_NumStats

end function

on n_sqlparse_service.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_sqlparse_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//====================================================================
// Event: constructor()
//--------------------------------------------------------------------
// Description: define database.
//--------------------------------------------------------------------
// Arguments: (none)
//--------------------------------------------------------------------
// Returns: long [pbm_constructor]
//--------------------------------------------------------------------
// Author: 	 		Date: 2003/12/30
//--------------------------------------------------------------------
// Modify History: 
//	
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
This.ServiceName	 = 	'SQLParse Service'
This.ShortName	 = 	'SQLParse'
This.Description = 	"Come from PFC,it can parse a SQL statement into its component parts or insert condition smartly or ..."
This.Version	 = 	1.0
This.Authors	 = 	'meteorshine'

end event

