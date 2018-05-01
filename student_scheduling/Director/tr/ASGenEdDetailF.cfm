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
    
<CFPARAM NAME="IQuSet" DEFAULT="">
<CFPARAM NAME="GrpSet" DEFAULT="">   
    
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
<!--- set some variables for completed GenEd electives --->
<CFOUTPUT QUERY="stuStuff">
       <!--- Save the major of this student for later use--->
       <CFSET SavMajID = #MajorID#> 
       <CFSET Trans2Do = #GEN101T# + #GEN150T#><!---  flag if transitionals are no longer needed --->
       <CFSET EngTDone = #GEN101T#>
		
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
 <CFIF #F2FL# EQ 0>
 		<CFSET F2FLND = 1>
    <CFELSE>
     	<CFSET F2FLND = 0>
 </CFIF>
  <CFIF #S2FL# EQ 0>
 		<CFSET S2FLND = 1>
    <CFELSE>
     	<CFSET S2FLND = 0>
 </CFIF>
  <CFIF #S2HL# EQ 0>
 		<CFSET S2HLND = 1>
    <CFELSE>
     	<CFSET S2HLND = 0>
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
 <CFSET S2FLDone = #S2FL#>
 <CFSET S2HLDone = #S2HL#>
 <CFSET L3LDone = #L3L#>
 <CFSET F3LDone = #F3L#>
 <CFSET S3LDone = #S3L#>
 
 <!---  Ten possible gen ed elective groups --->
<CFSET MF2FL = #F2FL#>	<!--- Fine Arts 200 level for FMM, BFD, BGD, MAA --->
<CFSET MF2L = #F2L#>	<!--- Fine Arts 200 level --->
<CFSET MF3L = #F3L#>	<!--- Fine Arts & Humanities 300 level --->
<CFSET MH2L = #H2L#>	<!--- Humanities 200 level --->
<CFSET ML3L = #L3L#>	<!--- Life & Physical Science 300 level --->
<CFSET MM2L = #M2L#>	<!--- Mathematics 200 level --->
<CFSET MS2FL = #S2FL#>	<!--- Social Science 200 level for FMM BFD--->
<CFSET MS2HL= #S2HL#>	<!--- Social Science 200 level for HM --->
<CFSET MS2L = #S2L#>	<!--- Social Science 200 level --->
<CFSET MS3L = #S3L#>	<!--- Social Science 300 level --->
 <CFSET GenSavDone = #GenSav#>
</CFOUTPUT>

<!---get the English transitional classes--->
<CFQUERY NAME = "GETransclasses" datasource="AllSchoolAudit">
SELECT a.courseCode, c.courseName, c.coursePre, c.#IQuSet# AS IqOut, a.StuId, a.FlagDone, c.NPR1, c.NPR2, c.NPR3, c.GEGrp  
 FROM AuditRecs a, ClassInfoRecs c
WHERE a.StuId = '#StuIdIn#' AND c.coursePre = 'GEN' AND a.FlagDone = 0 AND c.#GrpSet# = 3 AND a.courseCode = c.courseCode 
ORDER BY c.#IQuSet#, a.courseCode
</CFQUERY>

<!---get the classes--->
<CFQUERY NAME = "GEclasses" datasource="AllSchoolAudit">
SELECT a.courseCode, c.courseName, c.coursePre, c.#IQuSet# AS IqOut, a.StuId, a.FlagDone, c.NPR1, c.NPR2, c.NPR3, c.GEGrp  
 FROM AuditRecs a, ClassInfoRecs c
WHERE a.StuId = '#StuIdIn#' AND c.coursePre = 'GEN' AND a.FlagDone = 0 AND c.#GrpSet# = 0 AND a.courseCode = c.courseCode 
ORDER BY c.#IQuSet#, a.courseCode
</CFQUERY>

<!--- check to see if remaining gen ed count matches records in file --->
<CFSET GenElectiveCount = (#H2LND#+#L3LND#+#F3LND#+#S3LND#)>
<CFIF #savMajID# NEQ 'BAP '>
		<CFSET GenElectiveCount = (GenElectiveCount + #M2LND#)>
</CFIF>
<CFIF (#savMajID# EQ 'BFD ' OR #savMajID# EQ 'FMM ')>
	<CFSET GenElectiveCount = (GenElectiveCount + #F2FLND# + #S2FLND#)>
<CFELSEIF  (#savMajID# EQ 'BHM ')>
    <CFSET GenElectiveCount = (GenElectiveCount + #F2FLND# + #S2HLND#)>
<CFELSEIF (#savMajID# EQ 'MAA ' OR #savMajID# EQ 'BGD ')> 
<CFSET GenElectiveCount = (GenElectiveCount + #F2FLND# + #S2LND#)>
<CFELSE>
 <CFSET GenElectiveCount = (GenElectiveCount + #F2LND# + #S2LND#)>   
</CFIF>  

<CFSET GECountMatch = ((#GenNeedF#)- (GEclasses.RecordCount+GenElectiveCount))>


	<!---debug display of gen ed levels being met
	<CFDUMP VAR= "#GenNeedF#">
	<CFDUMP VAR= "#GEclasses.RecordCount#">
	...
	
    <CFDUMP VAR= "#F2FLND#">
	<CFDUMP VAR= "#F2LND#">
	<CFDUMP VAR= "#F3LND#">
    <CFDUMP VAR= "#H2LND#">
    <CFDUMP VAR= "#L3LND#">
    <CFDUMP VAR= "#M2LND#">
    <CFDUMP VAR= "#S2FLND#">
    <CFDUMP VAR= "#S2HLND#">
	<CFDUMP VAR= "#S2LND#">
	<CFDUMP VAR= "#S3LND#">
	=
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
   
   <CFIF GETransclasses.RecordCount IS NOT 0 && EngTDone LT 1>	   
     <TABLE BORDER="5" CELLPADDING = "5">
     <TR>
        <TH COLSPAN = "3">English Transitional class needed</TH>
     </TR>
     <!--- Display mandatory gen ed classes to be taken --->
     <cfoutput query="GETransclasses">
     <TR>
        <TD>Q#IqOut#</TD>
        <TD>#courseCode#</TD>
        <TD>#courseName#</TD>
      </TR>
     </cfoutput>
     </TABLE>
 </CFIF>
<BR>   
       
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
<!---  =========================================================================--->
<!---  get ideal quarter and needed information for Gen Ed Electives  --->
<!---  =========================================================================--->

<CFQUERY NAME="F2FLA" DATASOURCE="AllSchoolAudit">
  SELECT #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  WHERE CourseCode = 'GEL882'
</CFQUERY>
<!---  Fine Arts 200 level for FMM BFD BGD MAA--->
<CFOUTPUT QUERY="F2FLA">
<CFSET F2FLIQ = #IQOut#>
<CFSET F2FLIPR = #IPR#>
<CFSET F2FLNPR1 = #NPR1#>
<CFSET F2FLNPR2 = #NPR2#>
<CFSET F2FLNPR3 = #NPR3#>
<CFSET F2FLNPR4 = #NPR4#>
<CFSET F2FLNPR5 = #NPR5#>
<!--- Debug --->
<!---F2FLIQ = #F2FLIQ# <BR />--->
</CFOUTPUT>
<!--- Fine Arts 200 Level --->
<CFQUERY NAME="F2LA" DATASOURCE="AllSchoolAudit">
  SELECT #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  WHERE CourseCode = 'GEL833'
</CFQUERY>
<CFOUTPUT QUERY="F2LA">
<CFSET F2LIQ = #IQOut#>
<CFSET F2LIPR = #IPR#>
<CFSET F2LNPR1 = #NPR1#>
<CFSET F2LNPR2 = #NPR2#>
<CFSET F2LNPR3 = #NPR3#>
<CFSET F2LNPR4 = #NPR4#>
<CFSET F2LNPR5 = #NPR5#>
<!--- Debug --->
<!---F2LIQ = #F2LIQ# <BR />--->
</CFOUTPUT>
<!--- Mathematics 200 level --->
<CFQUERY NAME="M2LA" DATASOURCE="AllSchoolAudit">
  SELECT #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  WHERE CourseCode = 'GEL813'
</CFQUERY>
<CFOUTPUT QUERY="M2LA">
<CFSET M2LIQ = #IQOut#>
<CFSET M2LIPR = #IPR#>
<CFSET M2LNPR1 = #NPR1#>
<CFSET M2LNPR2 = #NPR2#>
<CFSET M2LNPR3 = #NPR3#>
<CFSET M2LNPR4 = #NPR4#>
<CFSET M2LNPR5 = #NPR5#>
<!--- Debug --->
<!---M2LIQ = #M2LIQ# <BR />--->
</CFOUTPUT>
<!--- Humanities 200 level --->
<CFQUERY NAME="H2LA" DATASOURCE="AllSchoolAudit">
  SELECT #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  WHERE CourseCode = 'GEL825'
</CFQUERY>
<CFOUTPUT QUERY="H2LA">
<CFSET H2LIQ = #IQOut#>
<CFSET H2LIPR = #IPR#>
<CFSET H2LNPR1 = #NPR1#>
<CFSET H2LNPR2 = #NPR2#>
<CFSET H2LNPR3 = #NPR3#>
<CFSET H2LNPR4 = #NPR4#>
<CFSET H2LNPR5 = #NPR5#>
<!--- Debug --->
<!---H2LIQ = #H2LIQ# <BR />--->
</CFOUTPUT>
<!--- Social Science 200 level --->
<CFQUERY NAME="S2LA" DATASOURCE="AllSchoolAudit">
  SELECT #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  WHERE CourseCode = 'GEL844'
</CFQUERY>
<CFOUTPUT QUERY="S2LA">
<CFSET S2LIQ = #IQOut#>
<CFSET S2LIPR = #IPR#>
<CFSET S2LNPR1 = #NPR1#>
<CFSET S2LNPR2 = #NPR2#>
<CFSET S2LNPR3 = #NPR3#>
<CFSET S2LNPR4 = #NPR4#>
<CFSET S2LNPR5 = #NPR5#>
<!--- Debug --->
<!---S2LIQ = #S2LIQ# <BR />--->
</CFOUTPUT>
<!--- Social Science 200 level BHM --->
<CFQUERY NAME="S2HLA" DATASOURCE="AllSchoolAudit">
  SELECT #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  WHERE CourseCode = 'GEL893'
</CFQUERY>
<CFOUTPUT QUERY="S2HLA">
<CFSET S2HLIQ = #IQOut#>
<CFSET S2HLIPR = #IPR#>
<CFSET S2HLNPR1 = #NPR1#>
<CFSET S2HLNPR2 = #NPR2#>
<CFSET S2HLNPR3 = #NPR3#>
<CFSET S2HLNPR4 = #NPR4#>
<CFSET S2HLNPR5 = #NPR5#>
<!--- Debug --->
<!---S2HLIQ = #S2HLIQ# <BR />--->
</CFOUTPUT>
<!--- Social Science 200 level FMM BFD --->
<CFQUERY NAME="S2FLA" DATASOURCE="AllSchoolAudit">
  SELECT #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  WHERE CourseCode = 'GEL913'
</CFQUERY>
<CFOUTPUT QUERY="S2FLA">
<CFSET S2FLIQ = #IQOut#>
<CFSET S2FLIPR = #IPR#>
<CFSET S2FLNPR1 = #NPR1#>
<CFSET S2FLNPR2 = #NPR2#>
<CFSET S2FLNPR3 = #NPR3#>
<CFSET S2FLNPR4 = #NPR4#>
<CFSET S2FLNPR5 = #NPR5#>
<!--- Debug --->
<!---S2FLIQ = #S2FLIQ# <BR />--->
</CFOUTPUT>
<!--- Life & Physical Science 300 level --->
<CFQUERY NAME="L3LA" DATASOURCE="AllSchoolAudit">
  SELECT #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  WHERE CourseCode = 'GEL852'
</CFQUERY>
<CFOUTPUT QUERY="L3LA">
<CFSET L3LIQ = #IQOut#>
<CFSET L3LIPR = #IPR#>
<CFSET L3LNPR1 = #NPR1#>
<CFSET L3LNPR2 = #NPR2#>
<CFSET L3LNPR3 = #NPR3#>
<CFSET L3LNPR4 = #NPR4#>
<CFSET L3LNPR5 = #NPR5#>
<!--- Debug --->
<!---L3LIQ = #L3LIQ# <BR />--->
</CFOUTPUT>
<!--- Fine Arts & Humanities 300 level --->
<CFQUERY NAME="F3LA" DATASOURCE="AllSchoolAudit">
  SELECT #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  WHERE CourseCode = 'GEL863'
</CFQUERY>
<CFOUTPUT QUERY="F3LA">
<CFSET F3LIQ = #IQOut#>
<CFSET F3LIPR = #IPR#>
<CFSET F3LNPR1 = #NPR1#>
<CFSET F3LNPR2 = #NPR2#>
<CFSET F3LNPR3 = #NPR3#>
<CFSET F3LNPR4 = #NPR4#>
<CFSET F3LNPR5 = #NPR5#>
<!--- Debug --->
<!---F3LIQ = #F3LIQ# <BR />--->
</CFOUTPUT>
<!--- Social Sciences 300 level --->
<CFQUERY NAME="S3LA" DATASOURCE="AllSchoolAudit">
  SELECT #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  WHERE CourseCode = 'GEL872'
</CFQUERY>
<CFOUTPUT QUERY="S3LA">
<CFSET S3LIQ = #IQOut#>
<CFSET S3LIPR = #IPR#>
<CFSET S3LNPR1 = #NPR1#>
<CFSET S3LNPR2 = #NPR2#>
<CFSET S3LNPR3 = #NPR3#>
<CFSET S3LNPR4 = #NPR4#>
<CFSET S3LNPR5 = #NPR5#>
<!--- Debug --->
<!---S3LIQ = #S3LIQ# <BR />--->
</CFOUTPUT>


<!--- ============================================================================================== --->
<!--- Start outputing elective gen ed Level tables --->
<!--- ============================================================================================== --->
<!---<CFIF #SavMajID# NEQ 'FD  ' AND #SavMajID# NEQ 'FMM ' AND #SavMajID# NEQ 'MAA ' AND #SavMajID# NEQ 'MAAE' AND #SavMajID# NEQ 'BGD '>
 <CFIF #F2LDone# IS 0>--->
 
 <!--- ============================================================================================== --->
 <!--- Fine Arts 200 Level ---> 
 <CFIF MF2L EQ 0 AND F2LIQ GT 0>
	 <CFOUTPUT> 
	<TABLE BORDER="1" CELLPADDING="2">
 	<TR>
		<TH COLSPAN = "3">Fine Arts 200 Level (1 of 3)</TH>
 	</TR>
 	<TR>
    	<TD ALIGN = "CENTER" >#F2LIQ#</TD>
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
	</CFOUTPUT>
     <BR>
</CFIF>
<!--- ============================================================================================== --->
<!---  Fine Arts Fashion 200 Level only applies to FD and FMM, MAA and GD --->
<!---<CFIF #SavMajID# EQ 'FD  ' OR #SavMajID# EQ 'FMM ' OR #SavMajID# EQ 'MAA ' OR #SavMajID# EQ 'MAAE' OR #SavMajID# EQ 'BGD '>
     <CFIF #F2FLDone# IS 0 > --->
<CFIF MF2FL EQ 0 AND F2FLIQ GT 0>
	<CFOUTPUT>
     <TABLE BORDER="1" CELLPADDING="2">
      <TR>
        	<TH COLSPAN = "3">Fine Arts Fashion 200 Level (1 of 2)</TH>
     </TR>
     <TR>
        <TD ALIGN = "CENTER" >#F2FLIQ#</TD>
        <TD ALIGN = "CENTER" >GEN211</TD>
        <TD ALIGN = "CENTER" >History of Western Art I</TD>
   
      </TR>
      <TR>
        <TD ALIGN = "CENTER" >      </TD>
        <TD ALIGN = "CENTER" >GEN212</TD>
        <TD ALIGN = "CENTER" >History of Western Art II</TD>
      </TR>
   </TABLE>
   </CFOUTPUT>

        <BR>
</CFIF>
<!--- ============================================================================================== --->
<!--- Mathematics 200 Level --->
 <!---<CFIF #M2LDone# IS 0 AND #SavMajID# NEQ 'BAP ' >---> 
 <CFIF MM2L EQ 0 AND M2LIQ GT 0>
	 <CFOUTPUT> 
	<TABLE BORDER="1" CELLPADDING="2">
 	<TR>
		<TH COLSPAN = "3">Mathematics 200 Level ( 1 of 3 )</TH>
	 </TR>
 	<TR>
    	<TD ALIGN = "CENTER" >#M2LIQ#</TD>
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
</CFOUTPUT>
     <BR>
</CFIF>
<!--- ============================================================================================== --->
<!--- Social Sciences 200 Level for FMM BFD --->
 <!---<CFIF #M2LDone# IS 0 AND #SavMajID# NEQ 'BAP ' >---> 
 <CFIF MS2FL EQ 0 AND S2FLIQ GT 0>
	 <CFOUTPUT> 
	<TABLE BORDER="1" CELLPADDING="2">
 	<TR>
		<TH COLSPAN = "3">Social Sciences 200 Level for FMM BFD ( 1 of 3 )</TH>
	 </TR>
 	<TR>
    	<TD ALIGN = "CENTER" >#S2FLIQ#</TD>
    	<TD ALIGN = "CENTER" >GEN241</TD>
    	<TD ALIGN = "CENTER" >Economics</TD>
   
  	</TR>
  	<TR>
   		<TD ALIGN = "CENTER" >      </TD>
    	<TD ALIGN = "CENTER" >GEN247</TD>
    	<TD ALIGN = "CENTER" >Sociology</TD>
 	 </TR>
  	<TR>
   	 <TD ALIGN = "CENTER" >      </TD>
    	<TD ALIGN = "CENTER" >GEN248</TD>
    	<TD ALIGN = "CENTER" >Anthropology</TD>
  	</TR>
</TABLE>
</CFOUTPUT>
     <BR>
</CFIF>
<!--- ============================================================================================== --->
<!--- Social Sciences 200 Level for BHM --->
 <!---<CFIF #M2LDone# IS 0 AND #SavMajID# NEQ 'BAP ' >---> 
 <CFIF MS2HL EQ 0 AND S2HLIQ GT 0>
	 <CFOUTPUT> 
	<TABLE BORDER="1" CELLPADDING="2">
 	<TR>
		<TH COLSPAN = "3">Social Sciences 200 Level for FMM BFD ( 1 of 3 )</TH>
	 </TR>
 	<TR>
    	<TD ALIGN = "CENTER" >#S2HLIQ#</TD>
    	<TD ALIGN = "CENTER" >GEN244</TD>
    	<TD ALIGN = "CENTER" >Psychology</TD>
   
  	</TR>
  	<TR>
   		<TD ALIGN = "CENTER" >      </TD>
    	<TD ALIGN = "CENTER" >GEN247</TD>
    	<TD ALIGN = "CENTER" >Sociology</TD>
 	 </TR>
  	<TR>
   	 <TD ALIGN = "CENTER" >      </TD>
    	<TD ALIGN = "CENTER" >GEN248</TD>
    	<TD ALIGN = "CENTER" >Anthropology</TD>
  	</TR>
</TABLE>
</CFOUTPUT>
     <BR>
</CFIF>
<!--- ============================================================================================== --->
<!--- Social Science 200 Level --->   
<!---<CFIF #S2LDone# LT 2>--->
<CFOUTPUT>
<!--- BHM, BFD and FMM have their own Social Science 200 Levels processed above ---> 
<CFIF #SavMajID# NEQ 'BHM '>
  <!---Major cannot be HM--->
	<CFIF MS2L LT 2 AND S2LIQ GT 0>
		<!---  will need to calculate Ideal Quarter --->
    	<CFIF S2LIQ EQ 68>
        	<CFSET S2LIQ1 = 6>
            <CFSET S2LIQ2 = 8>
          <CFELSEIF S2LIQ EQ 69>
            	<CFSET S2LIQ1 = 6>
            	<CFSET S2LIQ2 = 9>
               <CFELSEIF S2LIQ EQ 78>
            		<CFSET S2LIQ1 = 7>
           		 	<CFSET S2LIQ2 = 8>
                    <CFELSEIF S2LIQ EQ 79>
            			<CFSET S2LIQ1 = 7>
           		 		<CFSET S2LIQ2 = 9>
                       <CFELSEIF S2LIQ EQ 71>
            				<CFSET S2LIQ1 = 7>
           		 			<CFSET S2LIQ2 = 10>
                            </CFIF>             
	<TABLE BORDER="1" CELLPADDING="2">
	 <TR>
		<TH COLSPAN = "3">Social Science 200 Level <CFIF MS2L EQ 0>
    ( 2 of 4 )
   	<CFELSE>
    ( 1 of 3 Remaining) 
    </CFIF></TH>
 	</TR>
  	<TR>
    <!---- if there is one course left to take there will be one Ideal quarter, with two classes left there will be two ideal quarters --->
    	<TD ALIGN = "CENTER" ><CFIF MS2L EQ 1> #S2LIQ2# <CFELSE> #S2LIQ1# & #S2LIQ2# </TD></CFIF>
     		<CFIF NOT(#GenSavDone# IS "GEN241")>
    			<TD ALIGN = "CENTER" >GEN241</TD>
   				<TD ALIGN = "CENTER" >Economics</TD>
     		<CFELSE>
     			<TD ALIGN = "RIGHT" >Economics</TD><TD> 241 already taken</TD>
     		</CFIF>   
  		</TR>
  		<!----------------------------------->
    	<CFIF NOT(#GenSavDone# IS "GEN244")>
  		<TR>
    		<TD ALIGN = "CENTER" >      </TD>
    		<TD ALIGN = "CENTER" >GEN244</TD>
    		<TD ALIGN = "CENTER" >Psychology</TD>
  		</TR>
    	<CFELSE>
     		<TD></TD><TD ALIGN = "RIGHT" >Psychology</TD><TD> 244 already taken</TD>
    	</CFIF>
        <!----------------------------------->
    	<CFIF NOT(#GenSavDone# IS "GEN247")>
  		<TR>
    		<TD ALIGN = "CENTER" >      </TD>
    		<TD ALIGN = "CENTER" >GEN247</TD>
    		<TD ALIGN = "CENTER" >Sociology</TD>
  		</TR>
    	<CFELSE>
     		<TD></TD><TD ALIGN = "RIGHT">Sociology</TD><TD> 247 already taken</TD>
    	</CFIF>
        <!----------------------------------->
    	<CFIF NOT(#GenSavDone# IS "GEN248")>
   		<TR>
    		<TD ALIGN = "CENTER" >      </TD>
   			<TD ALIGN = "CENTER" >GEN248</TD>
    		<TD ALIGN = "CENTER" >Anthropology</TD>
 	 	</TR>
     	<CFELSE>
     		<TD></TD><TD ALIGN = "RIGHT" >Anthropology</TD><TD> 248 already taken</TD>
    	</CFIF>
        <!-----------------------------------> 
 
	</TABLE>
    	 <BR>
	</CFIF>
    </CFIF>
    </CFOUTPUT>

<!--- ============================================================================================== --->
<!--- Humanities 200 Level --->
 <!---<CFIF #H2LDone# IS 0>--->
 <CFIF MH2L EQ 0 AND H2LIQ GT 0>
 	<CFOUTPUT>
	<TABLE BORDER="1" CELLPADDING="2">
 	<TR>
		<TH COLSPAN = "3">Humanities 200 Level ( 1 of 5)</TH>
 	</TR>
 	<TR>
    	<TD ALIGN = "CENTER" >#H2LIQ#</TD>
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
    </CFOUTPUT>
     <BR>
</CFIF>
<!--- ============================================================================================== --->
<!--- Fine Arts & Humanities 300 Level --->
 <!---<CFIF #F3LDone# IS 0>--->
<CFIF MF3L EQ 0 AND F3LIQ GT 0>
	<CFOUTPUT>
	<TABLE BORDER="1" CELLPADDING="2">
 	<TR>
		<TH COLSPAN = "3">Fine Arts & Humanities 300 Level ( 1 of 3 )</TH>
 	</TR>
 	<TR>
    	<TD ALIGN = "CENTER" >#F3LIQ#</TD>
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
    </CFOUTPUT>
     <BR>
     </CFIF>
<!--- ============================================================================================== --->
<!--- Life & Physical Science 300 Level --->
<!---<CFIF #L3LDone# IS 0>--->
<CFIF ML3L EQ 0 AND L3LIQ GT 0>    
	<CFOUTPUT>
	<TABLE BORDER="1" CELLPADDING="2">
 	<TR>
		<TH COLSPAN = "3">Life & Physical Science 300 Level ( 1 of 2 )</TH>
 	</TR>
 	<TR>
    	<TD ALIGN = "CENTER" >#L3LIQ#</TD>
    	<TD ALIGN = "CENTER" >GEN360</TD>
    	<TD ALIGN = "CENTER" >Seminar in Life Science</TD>
	</TR>
  	<TR>
    	<TD ALIGN = "CENTER" >      </TD>
    	<TD ALIGN = "CENTER" >GEN380</TD>
    	<TD ALIGN = "CENTER" >Seminar in Physical Science</TD>
  	</TR>
	</TABLE>
    </CFOUTPUT>
     <BR>
 </CFIF>
 <!--- ============================================================================================== --->
 <!--- Social Sciences 300 Level --->
  <!---<CFIF #S3LDone# IS 0>--->
<CFIF MS3L EQ 0 AND S3LIQ GT 0>
	<CFOUTPUT>
	<TABLE BORDER="1" CELLPADDING="2">
 	<TR>
		<TH COLSPAN = "3">Social Sciences 300 Level ( 1 of 2 )</TH>
 	</TR>
 	<TR>
    	<TD ALIGN = "CENTER" >#S3LIQ#</TD>
    	<TD ALIGN = "CENTER" >GEN340</TD>
    	<TD ALIGN = "CENTER" >Social Psychology</TD>
	</TR>
  	<TR>
    	<TD ALIGN = "CENTER" >      </TD>
    	<TD ALIGN = "CENTER" >GEN345</TD>
    	<TD ALIGN = "CENTER" >Seminar in Social Sciences</TD>
  	</TR>
	</TABLE>
    </CFOUTPUT>
     <BR>
</CFIF>
<!--- ============================================================================================== --->
<!--- end of gen ed electives --->

</BODY>
</HTML>