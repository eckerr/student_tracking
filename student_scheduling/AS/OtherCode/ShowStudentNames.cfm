<!--- ShowStudentNames.cfm --->

<CFSET Name2Find = #URL.Nam# & '%'>

<CFQUERY NAME="sFindNameList" DATASOURCE="StudentsAudit">
Select StuLastName, StuFirstName, StuID, MajorID FROM StudentTab
WHERE StuLastName LIKE  '#Name2Find#'
ORDER BY StuLastName, StuFirstName
</CFQUERY>

<!--- set number of rows to display at a time --->
<CFSET RowsPerPage = 20>
<!--- initially start at first row --->
<CFPARAM NAME="URL.StartRow" DEFAULT = "1" TYPE="numeric">
<!--- get the total rows in query --->
<CFSET TotalRows = sFindNameList.RecordCount>
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
<title>Find Student Name</title>
</head>

<body>

<CFOUTPUT>
<H3> List by Last Name 
(#URL.StartRow# thru #EndRow# of #TotalRows# Records)</H3>
</CFOUTPUT>
<!--- row at Top of list for paging --->
<CFINCLUDE TEMPLATE="IncludeBackNext.cfm">
<TABLE>
<CFLOOP QUERY="sFindNameList" StartRow="#URL.StartRow#" EndRow="#EndRow#">
<!---<CFOUTPUT QUERY="StuList">--->

<CFOUTPUT>
<TR>
 <TD>#MajorID#</TD>
  <TD><A HREF="EdFrames.cfm?Sid=#URLEncodedFormat(Trim(StuId))#">#StuID#</A></TD>
  <TD>#(Trim(StuLastName))#, #(Trim(StuFirstName))#</TD>
</TR>
</CFOUTPUT>
</CFLOOP>
</TABLE>

<!--- row at bottom of list for paging --->
<CFINCLUDE TEMPLATE="IncludeBackNext.cfm">
<BR />
<BR />
<A HREF="SAMainMenu.cfm">Return to Main Menu</A>

</body>
</html>