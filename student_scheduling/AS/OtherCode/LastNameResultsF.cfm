<!--- LastNameResultsF.cfm 
Author: Ed Kerr
Date: 10/2/11
Description: Data drill down listing page
--->

<!---select list of students --->
<CFQUERY NAME ="NamList" DATASOURCE="StudentsAudit">
SELECT StuId, StuLastName, StuFirstName, DayEv, MajNeed, GenNeed, StuStat, PerComp FROM StudentTab
WHERE StuLastName LIKE FORM.StudentID
ORDER BY StuLastName ASC
</CFQUERY>

<!--- set number of rows to display at a time --->
<CFSET RowsPerPage = 6>
<!--- initially start at first row --->
<CFPARAM NAME="URL.StartRow" DEFAULT = "1" TYPE="numeric">

<!--- get the total rows in query --->
<CFSET TotalRows = StuList.RecordCount>
<!--- calculate number for last row --->
<CFSET EndRow = Min(URL.StartRow + RowsPerPage - 1, TotalRows)>
<!--- set the value for the next button --->
<CFSET StartRowNext = EndRow + 1>
<!---  set up back button --->
<CFSET StartRowBack = URL.StartRow - RowsPerPage>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Student Listing</title>
</head>

<body>
<!---<CFDUMP VAR=#StuList#>--->
<!--- row at top of list for paging --->
<CFINCLUDE TEMPLATE="IncludeBackNext.cfm">
<H3>    List by Remaining Classes in Major </H3>
<UL>
<CFLOOP QUERY="StuList" StartRow="#URL.StartRow#" EndRow="#EndRow#">
<!---<CFOUTPUT QUERY="StuList">--->
<CFOUTPUT>
   <LI> <A HREF="EdFrames.cfm?Sid=#URLEncodedFormat(Trim(StuId))#">
	M:#MajNeed#...G:#GenNeed#...#StuStat#...#StuID#...#(Trim(StuLastName))#, #(Trim(StuFirstName))#</A></LI>
</CFOUTPUT>
</CFLOOP>
</UL>
<!--- row at bottom of list for paging --->
<CFINCLUDE TEMPLATE="IncludeBackNext.cfm">
</body>
</html>