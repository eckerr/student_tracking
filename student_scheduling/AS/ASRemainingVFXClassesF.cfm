<!--- ASRemainingClassesF.cfm 
Author: Ed Kerr
Date: 10/2/11 - updated 3/6/13
Description: Data drill down listing page
Creates a listing of students by count of remaining classes - least to most -
called from ASMainMenu.cfm
--->

<!---select list of students --->
<CFQUERY NAME ="StuList" DATASOURCE="AllSchoolAudit"
 CACHEDWITHIN="#CreateTimeSpan(0,0,1,0)#" >
SELECT StuId, MajorID, StuLastName, StuFirstName, DayEv, TotNeed, MajNeed, eMajNeed, GenNeed, eGenNeed, StuStat, PerComp FROM StudentRecs
WHERE MajorID = 'VFX'
ORDER BY TotNeed ASC
</CFQUERY>

<!--- set number of rows to display at a time --->
<CFSET RowsPerPage = 8>
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

<CFOUTPUT>
<H3>    List by Remaining Classes in Major 
(#URL.StartRow# thru #EndRow# of #TotalRows# Records)</H3>
<!--- row at Top of list for paging --->
<CFINCLUDE TEMPLATE="ASIncludeBackNext.cfm">
</CFOUTPUT>

<TABLE  cellpadding="20">
<CFLOOP QUERY="StuList" StartRow="#URL.StartRow#" EndRow="#EndRow#">
<CFOUTPUT>

<CFSET TotGen = (#GenNeed# + #eGenNeed#)>
<CFSET TotMaj = (#MajNeed# + #eMajNeed#)>
<TR>
  <TD><B>T:#TotNeed#</B></TD>
  <TD>#MajorID#</TD>
  <TD>M: #TotMaj#</TD>
  <TD>G: #TotGen#</TD>
<!---  <CFIF #MajNeed# IS NOT 0 >     ---> 
       <TD>#StuStat# #PerComp#</TD>
<!---  </CFIF>--->
  <TD><A HREF="ASEdFrames.cfm?Sid=#URLEncodedFormat(Trim(StuId))#"><b>#StuID#.....#(Trim(StuLastName))#, #(Trim(StuFirstName))#</b></A></TD>
</TR>
</CFOUTPUT>
</CFLOOP>
</TABLE>

<!--- row at bottom of list for paging --->
<CFINCLUDE TEMPLATE="ASIncludeBackNext.cfm">
<BR />
<BR />
<A HREF="ASMainMenu.cfm">Return to Main Menu</A>

</body>
</html>