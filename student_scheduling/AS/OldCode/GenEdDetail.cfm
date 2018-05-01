<!--- GenEdDetail.cfm 
Author: Ed Kerr
Date: 10/5/11
Description: Data drill down details page for GenEd
--->

<!--- point to list page, in case we need to go there--->
<CFSET list_page="StudentResults.cfm">

<!--- check if url was passed--->
<cfif NOT IsDefined("URL.Sid")>
	<!---not defined, sent to list page--->
    <CFLOCATION URL=#list_page#>
    </cfif>
    
<!--- get one student record from database ---> 
<CFSET StuIdIn=#URL.Sid#>
<!--- Students stuff--->
<CFQUERY NAME = "stuStuff" datasource="StudentsAudit">
SELECT * FROM StudentTab
WHERE StuId = '#StuIdIn#'
</CFQUERY>
<!--- set some variables for completed GenEd electives --->
<CFOUTPUT QUERY="stuStuff">
 <CFSET M2LDone = #M2L#>
 <CFSET H2LDone = #H2L#>
 <CFSET F2LDone = #F2L#>
 <CFSET S2LDone = #S2L#>
 <CFSET L3LDone = #L3L#>
 <CFSET F3LDone = #F3L#>
 <CFSET S3LDone = #S3L#>
 <CFSET GenSavDone = #GenSav#>
</CFOUTPUT>

<!---get the classes--->
<CFQUERY NAME = "GEclasses" datasource="StudentsAudit">
SELECT a.courseCode, c.courseName, c.coursePre, c.IQu, a.StuId, a.FlagDone, c.NPR1, c.NPR2, c.NPR3, c.GEGrp  
 FROM AuditRecs a, ClassInfo c
WHERE a.StuId = '#StuIdIn#' AND c.coursePre = 'GEN' AND a.FlagDone = 0 AND c.GEGrp = 0 AND a.courseCode = c.courseCode 
ORDER BY c.IQu, a.courseCode
</CFQUERY>

<!---make sure something was found--->
<CFIF GEclasses.RecordCount IS 0>
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
</cfoutput>
<!--- output the general GenEd classes to take --->
 
<TABLE BORDER="2" CELLPADDING = "5">
<TR>
   <TH COLSPAN = "3">List of Required Gen Ed Classes left</TH>
</TR>
<!--- Display mandatory gen ed classes to be taken --->
<cfoutput query="GEclasses">
<TR>
   <TD>Q#IQu#</TD>
   <TD>#courseCode#</TD>
   <TD>#courseName#</TD>
 </TR>
</cfoutput>
</TABLE>--->

<!--- Start outputing elective gen ed Level tables --->
 <CFIF #F2LDone# IS NOT 1>
 
<TABLE BORDER="1" CELLPADDING="2">
 <TR>
	<TH COLSPAN = "3">Fine Arts 200 Level (1 of 2)</TH>
 </TR>
 <TR>
    <TD ALIGN = "CENTER" >Q4</TD>
    <TD ALIGN = "CENTER" >GEN211</TD>
    <TD ALIGN = "CENTER" >History of Western Art I</TD>
   
  </TR>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN212</TD>
    <TD ALIGN = "CENTER" >History of Western Art II</TD>
  </TR>
</TABLE>

     <br>
</CFIF>
 <CFIF #M2LDone# IS NOT 1>
<TABLE BORDER="1" CELLPADDING="2">
 <TR>
	<TH COLSPAN = "3">Mathematics 200 Level ( 1 of 3 )</TH>
 </TR>
 <TR>
    <TD ALIGN = "CENTER" >Q5</TD>
    <TD ALIGN = "CENTER" >GEN250</TD>
    <TD ALIGN = "CENTER" >Topics in Mathematics</TD>
   
  </TR>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN253</TD>
    <TD ALIGN = "CENTER" >Mathematical Models- Art & Design</TD>
  </TR>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN257</TD>
    <TD ALIGN = "CENTER" >Applied Statistics</TD>
  </TR>
</TABLE>
     <br>
</CFIF>
 <CFIF #H2LDone# IS NOT 1>
<TABLE BORDER="1" CELLPADDING="2">
 <TR>
	<TH COLSPAN = "3">Humanities 200 Level ( 1 of 5)</TH>
 </TR>
 <TR>
    <TD ALIGN = "CENTER" >Q8</TD>
    <TD ALIGN = "CENTER" >GEN223</TD>
    <TD ALIGN = "CENTER" >US History I</TD>
   
  </TR>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN225</TD>
    <TD ALIGN = "CENTER" >US History II</TD>
  </TR>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN228</TD>
    <TD ALIGN = "CENTER" >Philosophy & Ethics</TD>
  </TR>
   <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN230</TD>
    <TD ALIGN = "CENTER" >Western Civil.: Before 1600</TD>
  </TR>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN231</TD>
    <TD ALIGN = "CENTER" >Western Civil. II 1600-Present</TD>
  </TR>
</TABLE>
     <br>
</CFIF>
 <CFIF #S2LDone# LT 2>
   
<TABLE BORDER="1" CELLPADDING="2">
 <TR>
	<TH COLSPAN = "3">Social Science 200 Level ( 2 of 4 )</TH>
 </TR>
    <CFIF NOT(#S2LDone# IS 1 AND #GadSavDone# IS "GEN241")>
 <TR>
    <TD ALIGN = "CENTER" >  </TD>
    <TD ALIGN = "CENTER" >GEN241</TD>
    <TD ALIGN = "CENTER" >Economics</TD>
   
  </TR>
  </CFIF>
     <CFIF NOT(#S2LDone# IS 1 AND #GadSavDone# IS "GEN244")>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN244</TD>
    <TD ALIGN = "CENTER" >Psychology</TD>
  </TR>
    </CFIF>
     <CFIF NOT(#S2LDone# IS 1 AND #GadSavDone# IS "GEN247")>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN247</TD>
    <TD ALIGN = "CENTER" >Sociology</TD>
  </TR>
    </CFIF>
     <CFIF NOT(#S2LDone# IS 1 AND #GadSavDone# IS "GEN248")>
   <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN248</TD>
    <TD ALIGN = "CENTER" >Anthropology</TD>
  </TR>
    </CFIF> 
</TABLE>
     <br>
</CFIF>
 <CFIF #F3LDone# IS NOT 1>
<TABLE BORDER="1" CELLPADDING="2">
 <TR>
	<TH COLSPAN = "3">Fine Arts & Humanities 300 Level ( 1 of 3 )</TH>
 </TR>
 <TR>
    <TD ALIGN = "CENTER" >Q10</TD>
    <TD ALIGN = "CENTER" >GEN310</TD>
    <TD ALIGN = "CENTER" >Seminar in Fine Arts</TD>
   
  </TR>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN325</TD>
    <TD ALIGN = "CENTER" >World Literature</TD>
  </TR>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN329</TD>
    <TD ALIGN = "CENTER" >Seminar in Humanities</TD>
  </TR>
</TABLE>
     <br>
     </CFIF>
  <CFIF #L3LDone# IS NOT 1>    
<TABLE BORDER="1" CELLPADDING="2">
 <TR>
	<TH COLSPAN = "3">Life & Physical Science 300 Level ( 1 of 2 )</TH>
 </TR>
 <TR>
    <TD ALIGN = "CENTER" >Q11</TD>
    <TD ALIGN = "CENTER" >GEN360</TD>
    <TD ALIGN = "CENTER" >Seminar in Life Science</TD>
   
  </TR>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN380</TD>
    <TD ALIGN = "CENTER" >Seminar in Physical Science</TD>
  </TR>
</TABLE>
     <br>
 </CFIF>
  <CFIF #S3LDone# IS NOT 1>
<TABLE BORDER="1" CELLPADDING="2">
 <TR>
	<TH COLSPAN = "3">Social Sciences 300 Level ( 1 of 2 )</TH>
 </TR>
 <TR>
    <TD ALIGN = "CENTER" >Q12</TD>
    <TD ALIGN = "CENTER" >GEN340</TD>
    <TD ALIGN = "CENTER" >Social Psychology</TD>
   
  </TR>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN345</TD>
    <TD ALIGN = "CENTER" >Seminar in Social Sciences</TD>
  </TR>
</TABLE>
     <br>
</CFIF>




</body>
</html>