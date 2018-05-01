<!--- StudentDetScheduleOut.cfm 
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
<!--- <CFSET ProgramTime = 'Day'>
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
 --->

<!---Set up variables to schedule out the student's classes--->
<CFSET MCCounter = #MajNeed#>
<CFSET GECounter = #GenNeed#>
<CFSET QuOut = 1>
<CFSET MCOut = 0>
<CFSET MID = #MajorID#>
<CFSET PT = #DayEv#>
<CFSET MstuId = #StuId#>
<CFSET MstuLastName=#stuLastName#>
<CFSET MstuFirstName = #stuFirstName#>
<CFSET MstuStat = #StuStat#> 
<CFSET MperComp = #PerComp#>
<CFSET MdayEv = #DayEv#>
<CFSET MmajID = #MajorID#>

</cfoutput>


<!---<CFDUMP VAR="classes" >--->
 
<!---<TABLE BORDER="5" CELLPADDING = "5">
<TR>
   <TH COLSPAN = "3">List of Classes left to Take in Major</TH>
   <TH COLSPAN = "2">Prerequisites</TH>
</TR>
--->
<!--- Display classes to be taken --->
<cfoutput query="classes">
<!---<TR>
   <TD>Q#IQu#</TD>
   <TD>#courseCode#</TD>
   <TD>#courseName#</TD>
   <CFIF Len(#NPR1#) IS NOT 0>
      <TD>#NPR1#</TD>
      </CFIF>
      <CFIF Len(#NPR2#) IS NOT 0>
      <TD>#NPR2#</TD>
      </CFIF>
 </TR>--->
<!---Here is where we write records to the schedule out file--->
	<CFIf MCOut LT 2>
 		<CFQUERY NAME = "schedOutStuff" datasource="StudentsAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, 			CourseName, NPR1, NPR2, NPR3)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #IQu#, '#courseCode#', '#courseName#', '#NPR1#', '#NPR2#', '#NPR3#')
    	</cfquery> 
    <CFSET MCOut = MCOut + 1>
	<CFELSE>
    	<CFIF GECounter GT 1>  <!--- change to next QuOut group if there are at least 2 gen eds left --->
			<CFSET QuOut = QuOut + 1>
            <CFSET GECounter = GECounter - 2>
			<CFSET MCOut = MCOut = 0>
        <CFELSE>
        	<CFIF GECounter GT 0>   <!--- must be one  - write third record only--->
             		<CFQUERY NAME = "schedOutStuff" datasource="StudentsAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, 			CourseName, NPR1, NPR2, NPR3)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #IQu#, '#courseCode#', '#courseName#', '#NPR1#', '#NPR2#', '#NPR3#')     
    	</cfquery>
        <CFSET GECounter = GECounter -1>
       <!--- <CFIF GECounter GT 2> --->
        <CFSET MCOut = 0>
        <CFSET QuOut = QuOut + 1>
            <CFELSE>
            	<!--- must be zero, or less so write one or two last recs and update counts --->
                
                            		<CFQUERY NAME = "schedOutStuff" datasource="StudentsAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, 			CourseName, NPR1, NPR2, NPR3)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #IQu#, '#courseCode#', '#courseName#', '#NPR1#', '#NPR2#', '#NPR3#')     
    	</cfquery>
        <CFSET GECounter = GECounter -1>
            	<CFIF MCOut GT 2> <!--- four records already close it out --->
            		<CFSET QuOut = QuOut + 1>
                	<CFSET MCOut = 0> 
           		 <CFELSE>
        			<CFSET MCOut = MCOut + 1>
                 </CFIF> 
            </CFIF>
        </CFIF>
        	     
    </cfif>
</cfoutput>
</TABLE>
 </BODY>
</HTML>