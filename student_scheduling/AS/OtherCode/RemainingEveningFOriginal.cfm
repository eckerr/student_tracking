<!--- RemainingEvening.cfm 
Author: Ed Kerr
Date: 10/2/11
Description: Data drill down listing page
--->

<!---select list of students --->
<CFQUERY NAME ="StuEvList" DATASOURCE="StudentsAudit"
 CACHEDWITHIN="#CreateTimeSpan(0,0,1,0)#" >
SELECT StuId, MajorID, StuLastName, StuFirstName, DayEv, MajNeed, GenNeed, StuStat, PerComp FROM StudentTab
Where DayEv = 1
ORDER BY TotNeed ASC
</CFQUERY>

<!--- set number of rows to display at a time --->
<CFSET RowsPerPage = 8>
<!--- initially start at first row --->
<CFPARAM NAME="URL.StartRow" DEFAULT = "1" TYPE="numeric">

<!--- get the total rows in query --->
<CFSET TotalRows = StuEvList.RecordCount>
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

<CFOUTPUT>
<H3>    List by Remaining in Major -- Evening Students--
(#URL.StartRow# thru #EndRow# of #TotalRows# Records)</H3>
<!--- row at Top of list for paging --->
<CFINCLUDE TEMPLATE="IncludeBackNext.cfm">
</CFOUTPUT>

<TABLE  cellpadding="20">
<CFLOOP QUERY="StuEvList" StartRow="#URL.StartRow#" EndRow="#EndRow#">
<!---<CFOUTPUT QUERY="StuList">--->

<CFOUTPUT>
<TR>
 <CFSET TotalLeft = #MajNeed# + #GenNeed#>
  <TD><B>T:#TotalLeft#</B></TD>
  <TD>#MajorID#</TD>
  <TD>M:#MajNeed#</TD>
  <TD>G:#GenNeed#</TD>
  <TD>#StuStat#</TD>
  <TD><A HREF="EdFrames.cfm?Sid=#URLEncodedFormat(Trim(StuId))#"><b>#StuID# #(Trim(StuLastName))#, #(Trim(StuFirstName))#</b></A></TD>
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