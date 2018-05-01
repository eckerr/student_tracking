<!--- ASEditClasses.cfm 
Author: Ed Kerr
Date: 10/2/11 - updated 3/6/13
Description: Data drill down listing page
Creates a listing of classes to edit based on prefix
called from ASMaitMenu.cfm -- maybe????
--->

<!---select list of students --->
<CFQUERY NAME ="ClaList" DATASOURCE="AllSchoolAudit"
 CACHEDWITHIN="#CreateTimeSpan(0,0,1,0)#" >
SELECT CourseCode, CourseName FROM ClassInfo
WHERE CoursePre = 'GEN'
ORDER BY CourseCode ASC
</CFQUERY>

<!--- set number of rows to display at a time --->
<CFSET RowsPerPage = 8>
<!--- initially start at first row --->
<CFPARAM NAME="URL.StartRow" DEFAULT = "1" TYPE="numeric">

<!--- get the total rows in query --->
<CFSET TotalRows = ClaList.RecordCount>
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
<!---<CFDUMP VAR=#ClaList#>--->

<CFOUTPUT>
<H3>    Choose Class to Edit 
(#URL.StartRow# thru #EndRow# of #TotalRows# Records)</H3>
<!--- row at Top of list for paging --->
<CFINCLUDE TEMPLATE="ASIncludeBackNext.cfm">
</CFOUTPUT>

<TABLE  cellpadding="20">
<CFLOOP QUERY="ClaList" StartRow="#URL.StartRow#" EndRow="#EndRow#">
<CFOUTPUT>
<TR>
  <TD><A HREF="ASEditClassCode_action.cfm?Sid=#URLEncodedFormat(Trim(CourseCode))#"><b>#CourseCode#.....#CourseName#</b></A></TD>
</TR>
</CFOUTPUT>
</CFLOOP>
</TABLE>

<!--- row at bottom of list for paging --->
<CFINCLUDE TEMPLATE="ASIncludeBackNext.cfm">
<BR />
<BR />
<A HREF="ASMaintMenu.cfm">Return to Main Menu</A>

</body>
</html>