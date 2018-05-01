<!--- ASStudentDetailF.cfm 
Author: Ed Kerr
Date: 10/2/11
Description: Data drill down details page
called from EdFrames.cfm pre-loaded by StudentResultsF.cfm
--->

<!--- point to list page--->
<CFSET list_page="ASBlankPageF.cfm">

<!--- check if url was passed--->
<cfif NOT IsDefined("URL.Sid")>
	<!---not defined, sent to list page--->
    <CFLOCATION URL=#list_page#>
    </cfif>
<CFPARAM NAME="IQuSet" DEFAULT="">
<CFPARAM NAME="GrpSet" DEFAULT="">   
    
<!--- get records from database ---> 
<CFSET StuIdIn=#URL.Sid#>
<!---<CFOUTPUT>
URL.Sid = #URL.Sid#
</CFOUTPUT>--->
<!--- If the student ID is only 5 characters long, need to add a blank space at front--->
<CFIF Len(StuIdIn) EQ 5>
       <CFSET StuIdIn = ' ' & StuIdIn>
</CFIF>


<!--- Students stuff--->
<CFQUERY NAME = "stuStuff" datasource="AllSchoolAudit">
SELECT * FROM StudentRecs
WHERE StuId = '#StuIdIn#'
</CFQUERY>
<CFOUTPUT QUERY="stuStuff"> 
	<CFSET Ma2Get = #Trim(MajorID)#>
<cfswitch expression="#Ma2Get#">   <!---  this same switch exists in ASStudentDetailF.cfm --->
    <cfcase value= 'BAP'> 
       <CFSET IquSet = 'BAPIQU'>
       <CFSET GrpSet = 'BAPGrp'> 
    </cfcase> 
    <cfcase value= 'GAD'> 
       <CFSET IquSet = 'GADIQU'> 
        <CFSET GrpSet = 'GADGrp'> 
    </cfcase> 
     <cfcase value= 'GADE'> 
       <CFSET IquSet = 'GADIQU'> 
        <CFSET GrpSet = 'GADGrp'> 
    </cfcase> 
    <cfcase value= 'MAA'> 
       <CFSET IquSet = 'MAAIQU'>
        <CFSET GrpSet = 'MAAGrp'> 
    </cfcase>
    <cfcase value= 'MAAE'> 
       <CFSET IquSet = 'MAAIQU'>
        <CFSET GrpSet = 'MAAGrp'> 
    </cfcase>  
    <cfcase value= 'BDPH'> 
       <CFSET IquSet = 'BDPHIQU'>
       <CFSET GrpSet = 'BDPHGrp'> 
    </cfcase> 
    <cfcase value= 'VFX'> 
       <CFSET IquSet = 'VFXIQU'>
       <CFSET GrpSet = 'VFXGrp'> 
    </cfcase> 
     <cfcase value= 'FMM'> 
       <CFSET IquSet = 'FMMIQU'>
       <CFSET GrpSet = 'FMMGrp'> 
    </cfcase> 
    <cfcase value= 'FD'> 
       <CFSET IquSet = 'FDIQU'> 
       <CFSET GrpSet = 'FDGrp'>
    </cfcase> 
     <cfcase value= 'WDIM'> 
       <CFSET IquSet = 'WDIMIQU'>
       <CFSET GrpSet = 'WDIMGrp'> 
    </cfcase>
    <cfcase value= 'BWDE'> 
       <CFSET IquSet = 'WDIMIQU'>
       <CFSET GrpSet = 'WDIMGrp'> 
    </cfcase> 
     <cfcase value= 'ADV'> 
       <CFSET IquSet = 'ADVIQU'>
       <CFSET GrpSet = 'ADVGrp'> 
    </cfcase> 
     <cfcase value= 'BILD'> 
       <CFSET IquSet = 'BILDIQU'>
       <CFSET GrpSet = 'BILDGrp'> 
    </cfcase> 
     <cfcase value= 'HM'> 
       <CFSET IquSet = 'HMIQU'> 
       <CFSET GrpSet = 'HMGrp'> 
    </cfcase> 
     <cfcase value= 'ID'> 
       <CFSET IquSet = 'IDIQU'> 
       <CFSET GrpSet = 'IDGrp'>
    </cfcase>
    <cfcase value= 'BIDE'> 
       <CFSET IquSet = 'IDIQU'> 
       <CFSET GrpSet = 'IDGrp'>
    </cfcase> 
     <cfcase value= 'GD'> 
       <CFSET IquSet = 'GDIQU'>
       <CFSET GrpSet = 'GDGrp'> 
    </cfcase>
     <cfcase value= 'BGDE'> 
       <CFSET IquSet = 'GDIQU'>
       <CFSET GrpSet = 'GDGrp'> 
    </cfcase>
     <cfcase value= 'DFVP'> 
       <CFSET IquSet = 'DFVPIQU'>
       <CFSET GrpSet = 'DFVPGrp'> 
    </cfcase>   

    <cfdefaultcase> 
         <CFSET IquSet = 'IQU'>
         <CFSET GrpSet  = 'GEGrp'> 
    </cfdefaultcase>
</cfswitch>
</CFOUTPUT> 
<!---get the classes--->
<CFQUERY NAME = "classes" datasource="AllSchoolAudit">
SELECT a.courseCode, c.courseName, c.coursePre, c.#IQuSet# AS IqOut, a.StuId, a.FlagDone, c.NPR1, c.NPR2, c.NPR3, c.GEGrp
 FROM AuditRecs a, ClassInfoRecs c
WHERE a.StuId = '#StuIdIn#'  AND a.FlagDone = 0  AND a.courseCode = c.courseCode AND c.#GrpSet# = 0 AND NOT c.coursePre = 'GEN' 
ORDER BY c.#IQuSet#, a.courseCode
</CFQUERY>

<!---<!---make sure something was found--->
<CFIF classes.RecordCount IS 0>
	<!---nothing found, go back to student list--->
    <CFLOCATION URL=#list_page#>
    </cfif>  --->


<BODY>
<!--- set some variables for completed major electives --->

<cfoutput query="stuStuff" >
       <!--- Save the major of this student for later use--->
       <CFSET SavMajIDa= #MajorID#> 
 <!---<CFSET EMajNeedF= (#eMajNeed# - #ME1F# - #ME2F# - #ME3F#)>--->
 <CFSET TGenNeed = #TransF# - #compTransCount#>	
 <CFSET EMajNeedF = #eMajNeed#>	
 <CFSET MajNeedF= (#MajNeed#)>
 
	 <CFIF #eMajNeed# GT 0>
 		<CFIF #ME1F# EQ 0>
 			<CFSET ME1LND = 1>
    	<CFELSE>
      		<CFSET ME1LND = 0>
 		</CFIF>
        <CFIF #ME2F# EQ 0>
 			<CFSET ME2LND = 1>
    	<CFELSE>
      		<CFSET ME2LND = 0>
 		</CFIF>
        <CFIF #ME3F# EQ 0>
 			<CFSET ME3LND = 1>
    	<CFELSE>
      		<CFSET ME3LND = 0>
 		</CFIF>
     </CFIF>
	    <CFSET ME1Done = #ME1F#>
 	    <CFSET ME2Done = #ME2F#>
 	    <CFSET ME3Done = #ME3F#>
<CFSET ProgramTime = 'Day'>
<CFIF #DayEv# IS 1>
 <CFSET ProgramTime = 'Evening'> 
 </CFIF>
<TABLE BORDER="0" CELLPADDING = "5">
   <TR>
      <TH><A HREF="ShowAudittext.cfm?Sid=#URLEncodedFormat(Trim(StuIdIn))#">#StuId#</A></TH>
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
      <BR />
Need Major: <B>#MajNeed#</B> 
<CFIF emajNeed GT 0>
-- Electives: <B>#EMajNeedF#</B> -- 
</CFIF>
<CFIF TGenNeed GT 0 && (GEN101T + GEN150T) LT 2>  
     Transitionals: <B>#TGenNeed#</B>
</CFIF>
 -- GenEd: <B>#GenNeed#</B> 
<CFIF egenNeed GT 0>  
    -- GE Electives: <B>#eGenNeed#</B>
</CFIF>

 <BR /><BR />
</cfoutput>
<!---------------------------
 Debug Dump Information 
 <CFDUMP VAR="#stuStuff#">
<CFDUMP VAR="#classes#" >--->
<!------------------------------>
<!------------------------------> 
<TABLE BORDER="5" CELLPADDING = "5">
<TR>
   <TH COLSPAN = "3">List of Classes left to Take in Major</TH>
   <TH COLSPAN = "2">Prerequisites</TH>
</TR>
<!--- Display classes to be taken --->
<cfoutput query="classes">
<TR>
   <TD>Q#IQOut#</TD>
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
   <BR>
 
 <!--- Start outputing elective major Level tables --->
 
 <!--- Audio Production electives --->
 <CFIF #savMajIDa# EQ 'BAP '>
 <CFIF #ME1Done# IS 0>
 
   <TABLE BORDER="1" CELLPADDING="2">
    <TR>
     	<TH COLSPAN = "3">Audio Production Elective I (1 of 2)</TH>
    </TR>
    <TR>
       <TD ALIGN = "CENTER" >Q10</TD>
       <TD ALIGN = "CENTER" >AUD420</TD>
       <TD ALIGN = "CENTER" >Intership I</TD>
   
     </TR>
     <TR>
       <TD ALIGN = "CENTER" >      </TD>
       <TD ALIGN = "CENTER" >AUD412</TD>
       <TD ALIGN = "CENTER" >Senior Project I</TD>
     </TR>
   </TABLE>

       <BR>
   </CFIF>
   <CFIF #ME2Done# IS 0>
 
  <TABLE BORDER="1" CELLPADDING="2">
   <TR>
	  <TH COLSPAN = "3">Audio Production Elective II (1 of 2)</TH>
   </TR>
   <TR>
      <TD ALIGN = "CENTER" >Q11</TD>
      <TD ALIGN = "CENTER" >AUD430</TD>
      <TD ALIGN = "CENTER" >Intership II</TD>
   
    </TR>
    <TR>
      <TD ALIGN = "CENTER" >      </TD>
      <TD ALIGN = "CENTER" >AUD422</TD>
      <TD ALIGN = "CENTER" >Senior Project II</TD>
    </TR>
    </TABLE>

       <BR>
  </CFIF>
</CFIF>


 <!--- Digital Filmmaking & Video Production electives --->
  <CFIF #savMajIDa# EQ 'DFVP'>
    <CFIF #ME1Done# IS 0>
 
    <TABLE BORDER="1" CELLPADDING="2">
    <TR>
     	<TH COLSPAN = "3">DFVP Elective I (1 of 2)</TH>
    </TR>
    <TR>
       <TD ALIGN = "CENTER" >Q12</TD>
       <TD ALIGN = "CENTER" >DFV451</TD>
       <TD ALIGN = "CENTER" >Senior Project II</TD>
   
     </TR>
     <TR>
       <TD ALIGN = "CENTER" >      </TD>
       <TD ALIGN = "CENTER" >DVF407</TD>
       <TD ALIGN = "CENTER" >Internship</TD>
     </TR>
   </TABLE>

        <BR>
   </CFIF>
</CFIF>   
 
<!--- Interior Design Elective --->
 <CFIF #savMajIDa# EQ 'BILD'>
    <CFIF #ME1Done# IS 0>
    <TABLE BORDER="1" CELLPADDING="2">
     <TR>
    	<TH COLSPAN = "3">Mathematics 200 Level ( 1 of 3 )</TH>
     </TR>
     <TR>
        <TD ALIGN = "CENTER" >Q10</TD>
        <TD ALIGN = "CENTER" >ID376</TD>
        <TD ALIGN = "CENTER" >Adv Residential Design</TD>
   
     </TR>
     <TR>
        <TD ALIGN = "CENTER" >      </TD>
        <TD ALIGN = "CENTER" >ID383</TD>
        <TD ALIGN = "CENTER" >Adv Specialty Design</TD>
     </TR>
     <TR>
        <TD ALIGN = "CENTER" >      </TD>
        <TD ALIGN = "CENTER" >ID395</TD>
        <TD ALIGN = "CENTER" >Advanced 3D Digital Design</TD>
     </TR>
    </TABLE>
        <BR>
    </CFIF>
</CFIF>

</BODY>
</HTML>