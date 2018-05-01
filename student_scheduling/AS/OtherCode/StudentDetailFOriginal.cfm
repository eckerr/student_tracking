<!--- StudentDetailF.cfm 
Author: Ed Kerr
Date: 10/2/11
Description: Data drill down details page
--->

<!--- point to list page--->
<CFSET list_page="BlankPageF.cfm">

<!--- check if url was passed--->
<cfif NOT IsDefined("URL.Sid")>
	<!---not defined, sent to list page--->
    <CFLOCATION URL=#list_page#>
    </cfif>
    
<!--- get records from database ---> 
<CFSET StuIdIn=#URL.Sid#>
<!--- If the student ID is only 5 characters long, need to add a blank space at front--->
<CFIF Len(StuIdIn) EQ 5>
       <CFSET StuIdIn = ' ' & StuIdIn>
</CFIF>


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


<BODY>

<cfoutput query="stuStuff" >
<CFSET ProgramTime = 'Day'>
<CFIF #DayEv# IS 1>
 <CFSET ProgramTime = 'Evening'> 
 </CFIF>
<TABLE BORDER="0" CELLPADDING = "5">
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
      <BR>
Major Classes Needed: <B>#MajNeed#</B>  --------  Gen Ed Classes Needed: <B>#GenNeed#</B><BR /><BR />
</cfoutput>


<!---<CFDUMP VAR="classes" >--->
 
<TABLE BORDER="5" CELLPADDING = "5">
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
</BODY>
</HTML>