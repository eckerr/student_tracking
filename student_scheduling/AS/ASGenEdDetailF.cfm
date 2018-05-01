<!--- ASGenEdDetailF.cfm 
Author: Ed Kerr
Date: 10/5/11 - updated 3/6/13
Description: Data drill down details page for GenEd
called from ASEdFrames.cfm pre-loaded by ASStudentResultsF.cfm
--->		

<!--- point to list page, in case we need to go there--->
<CFSET list_page="Blank.cfm">
<CFSET NRF_page="BlankNRF.cfm">

<!--- check if url was passed--->
<cfif NOT IsDefined("URL.Sid")>
	<!---not defined, sent to list page--->
    <CFLOCATION URL=#list_page#>
    </cfif>
    
<!--- get one student record from database ---> 
<CFSET StuIdIn=#URL.Sid#>
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
<CFSET  TMID = #Trim(MajorID)#>
<cfswitch expression="#TMID#"> 
    <cfcase value= 'BAP'> 
       <CFSET IquSet = 'BAPIQU'>
       <CFSET GrpSet = 'BAPGrp'> 
    </cfcase> 
    <cfcase value= 'GAD'> 
       <CFSET IquSet = 'GADIQU'> 
        <CFSET GrpSet = 'GADGrp'> 
    </cfcase> 
    <cfcase value= 'MAA'> 
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
     <cfcase value= 'IC'> 
       <CFSET IquSet = 'ICIQU'> 
       <CFSET GrpSet = 'ICGrp'>
    </cfcase> 
     <cfcase value= 'GD'> 
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
<!--- set some variables for completed GenEd electives --->
<CFOUTPUT QUERY="stuStuff">
       <!--- Save the major of this student for later use--->
       <CFSET SavMajID= #MajorID#> 
		
 <CFSET GenNeedF= (#GenNeed# + #eGenNeed# + #TransF# - #CompTransCount#)>
 <CFIF #M2L# EQ 0>
 	<CFSET M2LND = 1>
    <CFELSE>
      <CFSET M2LND = 0>
 </CFIF>
 <CFIF #H2L# EQ 0>
 	<CFSET H2LND = 1>
    <CFELSE>
      <CFSET H2LND = 0>
 </CFIF>
 <CFIF #F2L# EQ 0>
 	<CFSET F2LND = 1>
    <CFELSE>
      <CFSET F2LND = 0>
 </CFIF>
  <CFIF #SavMajID# EQ 'FD  ' OR #SavMajID# EQ 'FMM '>
 	 <CFIF #F2FL# EQ 0>
 		<CFSET F2FLND = 1>
    	<CFELSE>
     	 <CFSET F2FLND = 0>
     </CFIF>    
 </CFIF>
 <CFIF #S2L# EQ 0>
 	<CFSET S2LND = 2>
    <CFELSEIF #S2L# EQ 1>
      <CFSET S2LND = 1>
      <CFELSE>
        <CFSET S2LND = 0>
        </CFIF>

 <CFIF #L3L# EQ 0>
 	<CFSET L3LND = 1>
    <CFELSE>
      <CFSET L3LND = 0>
 </CFIF>
 <CFIF #F3L# EQ 0>
 	<CFSET F3LND = 1>
    <CFELSE>
      <CFSET F3LND = 0>
 </CFIF>
 <CFIF #S3L# EQ 0>
 	<CFSET S3LND = 1>
    <CFELSE>
      <CFSET S3LND = 0>
 </CFIF>
 <CFSET M2LDone = #M2L#>
 <CFSET H2LDone = #H2L#>
 <CFSET F2LDone = #F2L#>
 <CFSET F2FLDone = #F2FL#>
 <CFSET S2LDone = #S2L#>
 <CFSET L3LDone = #L3L#>
 <CFSET F3LDone = #F3L#>
 <CFSET S3LDone = #S3L#>
 <CFSET GenSavDone = #GenSav#>
</CFOUTPUT>

<!---get the classes--->
<CFQUERY NAME = "GEclasses" datasource="AllSchoolAudit">
SELECT a.courseCode, c.courseName, c.coursePre, c.#IQuSet# AS IqOut, a.StuId, a.FlagDone, c.NPR1, c.NPR2, c.NPR3, c.GEGrp  
 FROM AuditRecs a, ClassInfoRecs c
WHERE a.StuId = '#StuIdIn#' AND c.coursePre = 'GEN' AND a.FlagDone = 0 AND c.#GrpSet# = 0 AND a.courseCode = c.courseCode 
ORDER BY c.#IQuSet#, a.courseCode
</CFQUERY>

<!--- check to see if remaining gen ed count matches records in file --->
<CFSET GenElectiveCount = (#H2LND#+#F2LND#+#S2LND#+#L3LND#+#F3LND#+#S3LND#)>
<CFIF #savMajID# NEQ 'BAP '>
		<CFSET GenElectiveCount = (GenElectiveCount + #M2LND#)>
</CFIF>
<CFIF (#savMajID# EQ 'FD  ' OR #savMajID# EQ 'FMM ')>
	<CFSET GenElectiveCount = (GenElectiveCount + #F2FLND#)>
</CFIF>    
<CFSET GECountMatch = ((#GenNeedF#)- (GEclasses.RecordCount+GenElectiveCount))>
<!---	debug dislplay of gen ed levels being met
	<CFDUMP VAR= "#GenNeedF#">
	<CFDUMP VAR= "#GEclasses.RecordCount#">
	<CFDUMP VAR= "#M2LND#">
	<CFDUMP VAR= "#H2LND#">
	<CFDUMP VAR= "#F2LND#">
	<CFDUMP VAR= "#F2FLND#">
	<CFDUMP VAR= "#S2LND#">
	<CFDUMP VAR= "#L3LND#">
	<CFDUMP VAR= "#F3LND#">
	<CFDUMP VAR= "#S3LND#">

	<CFDUMP VAR= "#GECountMatch#"> --->



<BODY>

<cfoutput query="stuStuff" >
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
      <BR>
 
  <CFIF #GECountMatch# NEQ 0>
       <B><FONT color=Red> Gen Ed class mismatch -- see original audit</FONT></B>
       </CFIF>
   </cfoutput>   
       
<!--- output the required GenEd classes to take --->
<!---make sure something was found--->
<CFIF GEclasses.RecordCount IS NOT 0>	   
     <TABLE BORDER="5" CELLPADDING = "5">
     <TR>
        <TH COLSPAN = "3">List of Required Gen Ed Classes left</TH>
     </TR>
     <!--- Display mandatory gen ed classes to be taken --->
     <cfoutput query="GEclasses">
     <TR>
        <TD>Q#IqOut#</TD>
        <TD>#courseCode#</TD>
        <TD>#courseName#</TD>
      </TR>
     </cfoutput>
     </TABLE>
 </CFIF>
<BR>

<!--- Start outputing elective gen ed Level tables --->
<CFIF #SavMajID# NEQ 'FD  ' AND #SavMajID# NEQ 'FMM ' AND #SavMajID# NEQ 'MAA ' AND #SavMajID# NEQ 'MAAE' AND #SavMajID# NEQ 'BGD '>
 <CFIF #F2LDone# IS 0>
 
<TABLE BORDER="1" CELLPADDING="2">
 <TR>
	<TH COLSPAN = "3">Fine Arts 200 Level (1 of 3)</TH>
 </TR>
 <TR>
    <TD ALIGN = "CENTER" >Q4</TD>
    <TD ALIGN = "CENTER" >GEN205</TD>
    <TD ALIGN = "CENTER" >Music Appreciation</TD>
   
  </TR>
   <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN211</TD>
    <TD ALIGN = "CENTER" >History of Western Art I</TD>
   
  </TR>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN212</TD>
    <TD ALIGN = "CENTER" >History of Western Art II</TD>
  </TR>
</TABLE>

     <BR>
     </CFIF>
</CFIF>
<!---  Fine Arts Fashion 200 Level only applies to FD and FMM, MAA and GD --->
<CFIF #SavMajID# EQ 'FD  ' OR #SavMajID# EQ 'FMM ' OR #SavMajID# EQ 'MAA ' OR #SavMajID# EQ 'MAAE' OR #SavMajID# EQ 'BGD '>
     <CFIF #F2FLDone# IS 0 > 
     <TABLE BORDER="1" CELLPADDING="2">
      <TR>
        	<TH COLSPAN = "3">Fine Arts Fashion 200 Level (1 of 2)</TH>
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

        <BR>
   </CFIF>
</CFIF>
<!--- Mathematics 200 Level --->
 <CFIF #M2LDone# IS 0 AND #SavMajID# NEQ 'BAP ' >  
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
     <BR>
</CFIF>
<!--- Social Science 200 Level --->
 <CFIF #S2LDone# LT 2>
   
<TABLE BORDER="1" CELLPADDING="2">
 <TR>
	<TH COLSPAN = "3">Social Science 200 Level ( 2 of 4 )</TH>
 </TR>
    <CFIF NOT(#GenSavDone# IS "GEN241")>
 <TR>
    <TD ALIGN = "CENTER" >Q6  </TD>
    <TD ALIGN = "CENTER" >GEN241</TD>
    <TD ALIGN = "CENTER" >Economics</TD>
   
  </TR>
  </CFIF>
     <CFIF NOT(#GenSavDone# IS "GEN244")>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN244</TD>
    <TD ALIGN = "CENTER" >Psychology</TD>
  </TR>
    </CFIF>
     <CFIF NOT(#GenSavDone# IS "GEN247")>
  <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN247</TD>
    <TD ALIGN = "CENTER" >Sociology</TD>
  </TR>
    </CFIF>
     <CFIF NOT(#GenSavDone# IS "GEN248")>
   <TR>
    <TD ALIGN = "CENTER" >      </TD>
    <TD ALIGN = "CENTER" >GEN248</TD>
    <TD ALIGN = "CENTER" >Anthropology</TD>
  </TR>
    </CFIF> 
</TABLE>
     <BR>
</CFIF>

<!--- Humanities 200 Level --->
 <CFIF #H2LDone# IS 0>
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
     <BR>
</CFIF>
<!--- Fine Arts & Humanities 300 Level --->
 <CFIF #F3LDone# IS 0>
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
     <BR>
     </CFIF>
     <!--- Life & Physical Science 300 Level --->
  <CFIF #L3LDone# IS 0>    
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
     <BR>
 </CFIF>
 <!--- Social Sciences 300 Level --->
  <CFIF #S3LDone# IS 0>
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
     <BR>
</CFIF>

</BODY>
</HTML>