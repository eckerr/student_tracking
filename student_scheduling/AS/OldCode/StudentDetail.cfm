<!--- StudentDetail.cfm 
Author: Ed Kerr
Date: 10/2/11
Description: Data drill down details page
--->

<!--- point to list page--->
<CFSET list_page="StudentResults.cfm">

<!--- check if url was passed--->
<cfif NOT IsDefined("URL.Sid")>
	<!---not defined, sent to list page--->
    <CFLOCATION URL=#list_page#>
    </cfif>
    
<!--- get records from database ---> 
<CFSET StuIdIn=#URL.Sid#>
<!--- Students stuff--->
<CFQUERY NAME = "stuStuff" datasource="StudentsAudit">
SELECT * FROM StudentTab
WHERE StuId = '#StuIdIn#'
</CFQUERY>
<!---get the classes--->
<CFQUERY NAME = "classes" datasource="StudentsAudit">
SELECT a.courseCode, c.courseName, c.coursePre, c.IQu, a.StuId, a.FlagDone, c.NPR1, c.NPR2, c.NPR3
 FROM AuditRecs a, ClassInfo c
WHERE a.StuId = '#StuIdIn#' AND NOT c.coursePre = 'GEN' AND a.FlagDone = 0 AND a.courseCode = c.courseCode 
ORDER BY c.IQu, a.courseCode
</CFQUERY>

<!---make sure something was found--->
<CFIF classes.RecordCount IS 0>
	<!---nothing found, go back to student list--->
    <CFLOCATION URL=#list_page#>
    </cfif>    

<!---<cfdump var=#classes#>--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Student Classes Data</title>
</head>

<body>

<cfoutput query="stuStuff" >
<CFSET ProgramTime = 'Day'>
<CFIF #DayEv# IS 1>
 <CFSET ProgramTime = 'Evening'> 
 </CFIF>
<TABLE BORDER="1" CELLPADDING = "5">
   <TR>
      <TH>#StuId#</TH>
      <TH>#Trim(stuLastName)#, #Trim(stuFirstName)#</TH>
      <TH>#StuStat#</TH> 
	  <TH>Quarter: #PerComp#</TH>
      <TH>#ProgramTime#</TH>
              
   </TR>
   <TR>    
    <TD ALIGN = "center">Student ID</TD>       
     <TD ALIGN = "center">Student Name</TD>    
     <TD ALIGN = "center">Status</TD>    
     <TD ALIGN = "center">Quarter</TD>
     <TD ALIGN = "center"><B>#MajorID#</B></TD>
     </TR>
</TABLE>    
      <br>
Major Classes Needed: <B>#MajNeed#</B>  --------  Gen Ed Classes Needed: <B>#GenNeed#</B><br /><BR />
</cfoutput>


<!---<CFDUMP VAR="classes" >--->
 
<TABLE BORDER="2" CELLPADDING = "5">
<TR>
   <TH COLSPAN = "3">List of Classes left to Take in Major</TH>
   <TH COLSPAN = "2">Prerequisites</TH>
</TR>
<!--- Display classes to be taken --->
<cfoutput query="classes">
<TR>
   <TD>Q#IQu#</TD>
   <TD>#courseCode#</TD>
   <TD>#courseName#</TD>
   <CFIF Len(#NPR1#) IS NOT 0>
      <TD>#NPR1#</TD>
      </CFIF>
      <CFIF Len(#NPR2#) IS NOT 0>
      <TD>#NPR2#</TD>
      </CFIF>
 </TR>
</cfoutput>
</TABLE>
</body>
</html>