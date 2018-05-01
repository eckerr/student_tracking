
<!--- Students ID list--->
<CFQUERY NAME = "stuIDList" datasource="StudentsAudit">
SELECT * FROM StudentTab 

</CFQUERY>
<!---<CFDUMP VAR="#stuIDList#" >--->
<CFLOOP STARTROW="1" <!---ENDROW= "10"---> QUERY="stuIDList">
<!--- ============================================================================================== --->
<!--- ============================================================================================== --->
<!--- SDSO.cfm  based on 
 StudentDetScheduleOut.cfm 
Author: Ed Kerr
Date: 10/2/11   revised 3/18/13
Description: Data drill down details page
--->

<!--- T E S T   D A T A --->
<CFSET STUID='309201'>
    
<!--- get records from database ---> 
<CFSET StuIdIn=#STUID#>
<!--- If the student ID is only 5 characters long, need to add a blank space at front--->
<CFIF Len(StuIdIn) EQ 5>
       <CFSET StuIdIn = ' ' & StuIdIn>
</CFIF>




<!--- Students stuff--->
<CFQUERY NAME = "stuStuff" datasource="AllSchoolAudit">
SELECT * FROM StudentRecs
WHERE StuId = '#StuIdIn#'
</CFQUERY>




<!---<BODY>--->

<cfoutput query="stuStuff" >

<!---Set up variables to schedule out the student's classes--->
<CFSET MCCounter = #MajNeed#>
<CFSET GECounter = #GenNeed#>
<CFSET QuOut = 1> <!--- QuOut represents next quarter information--->
<CFSET MCOut = 0> <!--- MCOut represents maximum number of classes per quarter for scheduling --->
<CFSET MID = Trim(#MajorID#)>
<CFSET PT = #DayEv#>
<CFSET MstuId = #StuId#>
<CFSET MstuLastName=#stuLastName#>
<CFSET MstuFirstName = #stuFirstName#>
<CFSET MstuStat = #StuStat#> 
<CFSET MperComp = #PerComp#>
<CFSET MdayEv = #DayEv#>
<CFSET MmajID = #MajorID#>
<CFSET MME1 = #ME1F#>
<CFSET MME2 = #ME2F#>
<CFSET MME3 = #ME3F#>

<CFSET MF2FL = #F2FL#>
<CFSET MF2L = #F2L#>
<CFSET MF3L = #F3L#>
<CFSET MH2L = #H2L#>
<CFSET ML3L = #L3L#>
<CFSET MM2L = #M2L#>
<CFSET MS2FL = #S2FL#>
<CFSET MS2HL= #S2HL#>
<CFSET MS2L = #S2L#>
<CFSET MS3L = #S3L#>

<CFSET MGenSav = #GENSav#>

<cfswitch expression="#MID#"> 
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


</cfoutput>
<!---get the required classes in the student's major--->
<CFQUERY NAME = "classes" datasource="AllSchoolAudit">
SELECT a.courseCode, c.courseName, c.coursePre, c.#IQuSet# AS IQuOut, a.StuId, a.FlagDone, c.IPR, c.NPR1, c.NPR2, c.NPR3, c.NPR4, c.NPR5
 FROM AuditRecs a, ClassInfoRecs c
WHERE a.StuId = '#StuIdIn#' AND NOT c.coursePre = 'GEN' AND a.FlagDone = 0 AND a.courseCode = c.courseCode AND c.#GrpSet# = 0
<!---ORDER BY c.#IQuSet#, a.courseCode--->
</CFQUERY>
<!---make sure something was found--->
<CFIF classes.RecordCount IS 0>
	<!---nothing found, go back to student list--->
    <CFLOCATION URL=#list_page#>
    </cfif>  
<cfoutput query="classes">
<!---Here is where we write records to the schedule out file--->
<!--- ============================================================================================== --->
<!--- Start by writing all required major classes  for student to the file --->
 		<CFQUERY NAME = "schedOutStuff" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #IQuOut#, '#courseCode#', '#courseName#', #IPR#, '#NPR1#', '#NPR2#', '#NPR3#','#NPR4# ', '#NPR5#', ' ')
    	</cfquery>
</cfoutput>

 
<!--- ============================================================================================== --->
 
<!---get the remaining required GEN ED classes--->
<CFQUERY NAME = "GEclasses" datasource="AllSchoolAudit">
SELECT a.courseCode, c.courseName, c.coursePre, c.#IQuSet# AS IqOut, a.StuId, a.FlagDone, c.IPR, c.NPR1, c.NPR2, c.NPR3, c.NPR4, c.NPR5, c.#GrpSet# AS GrpOut  
 FROM AuditRecs a, ClassInfoRecs c
WHERE a.StuId = '#StuIdIn#' AND c.coursePre = 'GEN' AND a.FlagDone = 0 AND c.#GrpSet# = 0 AND a.courseCode = c.courseCode 
<!---ORDER BY c.#IQuSet#, a.courseCode--->
</CFQUERY>
<cfoutput query="GEclasses">
<!---Here is where we write records to the schedule out file--->
<!--- ============================================================================================== --->
<!--- Start by writing all required GEN ED classes  for student to the file --->
 		<CFQUERY NAME = "schedOutGEStuff" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #IQOut#, '#courseCode#', '#courseName#', #IPR#, '#NPR1#', '#NPR2#', '#NPR3#','#NPR4# ', '#NPR5#', ' ')
    	</cfquery>
</cfoutput> 
<!---<CFOUTPUT> --->     
<!--- ============================================================================================== --->
<!--- If there are any major electives, get the elective info then write them to file ---> 
<cfswitch expression="#MID#"> 
    <cfcase value= 'BAP'>
    	
      <CFIF MME1 EQ 0 >
        <!--- get the information about the elective --->
      	<CFQUERY NAME="MME1" DATASOURCE="AllSchoolAudit">
  		SELECT CourseCode, CourseName, #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  		WHERE CourseCode = 'MJE701'
		</CFQUERY>
		<CFOUTPUT QUERY="MME1">
		<CFSET BAPME1CC = #CourseCode#>
		<CFSET BAPME1CN = #CourseName#>
		<CFSET BAPME1IQ = #IQOut#>
		<CFSET BAPME1IPR = #IPR#>
		<CFSET BAPME1NPR1 = #NPR1#>
		<CFSET BAPME1NPR2 = #NPR2#>
		<CFSET BAPME1NPR3 = #NPR3#>
		<CFSET BAPME1NPR4 = #NPR4#>
		<CFSET BAPME1NPR5 = #NPR5#>
		BAPME1IQ = #BAPME1IQ# <BR />
		</CFOUTPUT>
       BAP major elective 1 required <Br />
      	<!--- write it to the file --->
        <CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5,                GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #BAPME1IQ#, '#BAPME1CC#',                      '#BAPME1CN#', #BAPME1IPR#, '#BAPME1NPR1#', '#BAPME1NPR2#', '#BAPME1NPR3#','#BAPME1NPR4# ', '#BAPME1NPR5#', ' ')
    	</cfquery>
       </CFIF>
       <CFIF MME2 EQ 0>
       <!--- get the information about the elective --->
       	   <CFQUERY NAME="MME2" DATASOURCE="AllSchoolAudit">
  		SELECT CourseCode, CourseName, #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  			WHERE CourseCode = 'MJE702'
		</CFQUERY>
		<CFOUTPUT QUERY="MME2">
		<CFSET BAPME2CC = #CourseCode#>
		<CFSET BAPME2CN = #CourseName#>
		<CFSET BAPME2IQ = #IQOut#>
		<CFSET BAPME2IPR = #IPR#>
		<CFSET BAPME2NPR1 = #NPR1#>
		<CFSET BAPME2NPR2 = #NPR2#>
		<CFSET BAPME2NPR3 = #NPR3#>
		<CFSET BAPME2NPR4 = #NPR4#>
		<CFSET BAPME2NPR5 = #NPR5#>
		BAPME2IQ = #BAPME2IQ# <BR />
		</CFOUTPUT>
            <CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, 		               GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #BAPME2IQ#, '#BAPME2CC#',              '#BAPME2CN#', #BAPME2IPR#, '#BAPME2NPR1#', '#BAPME2NPR2#', '#BAPME2NPR3#','#BAPME2NPR4# ', '#BAPME2NPR5#', ' ')
    	</cfquery>
        </CFIF>    
       	BAP major elective 2 required <Br />       	
     </cfcase> 
     <cfcase value= 'ID'> 
       <CFIF MME1 EQ 0 >
        <!--- get the information about the elective --->
      	<CFQUERY NAME="IDE1" DATASOURCE="AllSchoolAudit">
  		SELECT CourseCode, CourseName, #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  		WHERE CourseCode = 'MJE713'
		</CFQUERY>
		<CFOUTPUT QUERY="IDE1">
		<CFSET IDME1CC = #CourseCode#>
		<CFSET IDME1CN = #CourseName#>
		<CFSET IDME1IQ = #IQOut#>
		<CFSET IDME1IPR = #IPR#>
		<CFSET IDME1NPR1 = #NPR1#>
		<CFSET IDME1NPR2 = #NPR2#>
		<CFSET IDME1NPR3 = #NPR3#>
		<CFSET IDME1NPR4 = #NPR4#>
		<CFSET IDBAPE1NPR5 = #NPR5#>
		IDME1IQ = #IDME1IQ# <BR />
		</CFOUTPUT>
       ID major elective 1 required <Br />
      	<!--- write it to the file --->
        <CFQUERY NAME = "MEIDOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5,                GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #IDME1IQ#, '#IDME1CC#',                      '#IDME1CN#', #IDME1IPR#, '#IDME1NPR1#', '#IDME1NPR2#', '#IDME1NPR3#','#IDME1NPR4# ', '#IDME1NPR5#', ' ')
    	</cfquery>
       </CFIF>
       major elective 1 required <Br />
    </cfcase> 
     <cfcase value= 'DFVP'> 
       <CFIF MME1 EQ 0 >
       <!--- get the information about the elective --->
      	<CFQUERY NAME="DFVPMME1" DATASOURCE="AllSchoolAudit">
  		SELECT CourseCode, CourseName, #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  		WHERE CourseCode = 'MJE721'
		</CFQUERY>
		<CFOUTPUT QUERY="MME1">
		<CFSET DFVPME1CC = #CourseCode#>
		<CFSET DFVPME1CN = #CourseName#>
		<CFSET DFVPME1IQ = #IQOut#>
		<CFSET DFVPME1IPR = #IPR#>
		<CFSET DFVPME1NPR1 = #NPR1#>
		<CFSET DFVPME1NPR2 = #NPR2#>
		<CFSET DFVPME1NPR3 = #NPR3#>
		<CFSET DFVPME1NPR4 = #NPR4#>
		<CFSET DFVPE1NPR5 = #NPR5#>
		DFVPME1IQ = #DFVPME1IQ# <BR />
		</CFOUTPUT>
       DFVP major elective 1 required <Br />
      	<!--- write it to the file --->
        <CFQUERY NAME = "MEDFVPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5,                GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #DFVPME1IQ#, '#DFVPME1CC#',                      '#DFVPME1CN#', #DFVPME1IPR#, '#DFVPME1NPR1#', '#DFVPME1NPR2#', '#DFVPME1NPR3#','#DFVPME1NPR4# ', '#DFVPME1NPR5#', ' ')
    	</cfquery>
       </CFIF>
    </cfcase>   
    <cfdefaultcase> 
        default case:  do nothing <Br />
    </cfdefaultcase>
</cfswitch>

<!---  get ideal quarter for Gen Ed Electives  --->

<CFQUERY NAME="F2FLA" DATASOURCE="AllSchoolAudit">
  SELECT #IQuSet# AS IQOUT, IPR, NPR1, NPR2, NPR3, NPR4, NPR5 FROM ClassInfoRecs
  WHERE CourseCode = 'GEL882'
</CFQUERY>
<CFOUTPUT QUERY="F2FLA">
<CFSET F2FLIQ = #IQOut#>
<CFSET F2FLIPR = #IPR#>
<CFSET F2FLNPR1 = #NPR1#>
<CFSET F2FLNPR2 = #NPR2#>
<CFSET F2FLNPR3 = #NPR3#>
<CFSET F2FLNPR4 = #NPR4#>
<CFSET F2FLNPR5 = #NPR5#>
F2FLIQ = #F2FLIQ# <BR />
</CFOUTPUT>
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
F2LIQ = #F2LIQ# <BR />
</CFOUTPUT>
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
M2LIQ = #M2LIQ# <BR />
</CFOUTPUT>
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
H2LIQ = #H2LIQ# <BR />
</CFOUTPUT>
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
S2LIQ = #S2LIQ# <BR />
</CFOUTPUT>
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
L3LIQ = #L3LIQ# <BR />
</CFOUTPUT>
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
F3LIQ = #F3LIQ# <BR />
</CFOUTPUT>
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
S3LIQ = #S3LIQ# <BR />
</CFOUTPUT>
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
S2HLIQ = #S2HLIQ# <BR />
</CFOUTPUT>
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
S2FLIQ = #S2FLIQ# <BR />
</CFOUTPUT>


<!--- ============================================================================================== --->
<!--- Write any elective gen eds to file --->
<!--- ============================================================================================== --->

 <CFIF MM2L EQ 0 AND M2LIQ GT 0>
       mathematics 200 Level needed <Br />
       <CFSET MECC = 'GEL813'>
       		<CFSET MECN = 'GEN 250 || 253 || 257'>
            <CFSET MIQ = #M2LIQ#>
            <CFSET MIPR = #M2LIPR#>
           
            	<CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #MIQ#, '#MECC#', '#MECN#', #MIPR#, '#M2LNPR1#', '#M2LNPR2#', '#M2LNPR3#','#M2LNPR4# ', '#M2LNPR5#', ' ')
    	</cfquery>
</CFIF>
<!--- ============================================================================================== --->
 <CFIF MH2L EQ 0 AND H2LIQ GT 0>
       Humanities 200 Level needed <Br />
       <CFSET MECC = 'GEL813'>
       		<CFSET MECN = 'GEN223-225-228-230-231'>
            <CFSET MIQ = #H2LIQ#>
            <CFSET MIPR = #H2LIPR#>
           
            	<CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #MIQ#, '#MECC#', '#MECN#', #MIPR#, '#H2LNPR1#', '#H2LNPR2#', '#H2LNPR3#','#H2LNPR4# ', '#H2LNPR5#', ' ')
    	</cfquery>
</CFIF>
<!--- ============================================================================================== --->
 <CFIF MF2L EQ 0 AND F2LIQ GT 0>
       Fine Arts 200 Level needed <Br />
       <CFSET MECC = 'GEL833'>
       		<CFSET MECN = 'GEN 205 - 211 - 212'>
            <CFSET MIQ = #F2LIQ#>
            <CFSET MIPR = #F2LIPR#>
            <CFSET MNPR1 = '       '>
            <CFSET MNPR2 = '       '>
            <CFSET MNPR3 = '       '>
            	<CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #MIQ#, '#MECC#', '#MECN#', #MIPR#, '#F2LNPR1#', '#F2LNPR2#', '#F2LNPR3#','#F2LNPR4# ', '#F2LNPR5#', ' ')
    	</cfquery>
</CFIF>
<!--- ============================================================================================== --->
 <CFIF MS2L EQ 0 AND S2LIQ GT 0>
       Social Science 200 Level needed <Br />
       <CFSET MECC = 'GEL844'>
       		<CFSET MECN = 'GEN241 - 244 - 247 - 248'>
            <CFSET MIQ = #S2LIQ#>
            	<CFIF MIQ LT 13> <!--- must be HM --->
                	<CFSET FirstMIQ = MIQ>
                    <CFSET SecondMIQ = 0>
                <CFELSE>
                	<CFSET FirstMIQ = MIQ \ 10> <!--- integer division to get the tens digit only --->
                    <CFSET SecondMIQ = MIQ MOD 10> <!--- modulus to get the singles digit only --->
                </CFIF>
            <CFSET MIPR = #S2LIPR#>
            	<CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #FirstMIQ#, '#MECC#', '#MECN#', #MIPR#, '#S2LNPR1#', '#S2LNPR2#', '#S2LNPR3#','#S2LNPR4# ', '#S2LNPR5#', ' ')
    	</cfquery>
 <CFELSEIF MS2L EQ 1 AND S2LIQ GT 0 AND NOT MID EQ 'BHM'> <!--- 2nd class needs to be taken still if this is not HM --->
 			<CFSET MECC = 'GEL844'>
       		<CFSET MECN = 'GEN241 - 244 - 247 - 248'>
            <CFSET MIQ = #S2LIQ#>
            <CFSET SecondMIQ = MIQ MOD 10> <!--- modulus to get the singles digit only --->
            <CFSET MIPR = #S2LIPR#>
            <!--- Second class only needs to be written --->
            	<CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #SecondMIQ#, '#MECC#', '#MECN#', #MIPR#, '#S2LNPR1#', '#S2LNPR2#', '#S2LNPR3#','#S2LNPR4# ', '#S2LNPR5#', '#MGenSav#')
    	</cfquery>       
</CFIF>
<!--- ============================================================================================== --->
 <CFIF ML3L EQ 0 AND L3LIQ GT 0>
       Life & Physical Science 300 Level needed <Br />
       <CFSET MECC = 'GEL852'>
       		<CFSET MECN = 'GEN360 - 380'>
            <CFSET MIQ = #L3LIQ#>
            <CFSET MIPR = #L3LIPR#>
            
            	<CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #MIQ#, '#MECC#', '#MECN#', #MIPR#, '#L3LNPR1#', '#L3LNPR2#', '#L3LNPR3#','#L3LNPR4# ', '#L3LNPR5#', ' ')
    	</cfquery>
</CFIF>
<!--- ============================================================================================== --->
 <CFIF MF3L EQ 0 AND F3LIQ GT 0>
       Fine Arts & Humanities 300 Level needed <Br />
       <CFSET MECC = 'GEL813'>
       		<CFSET MECN = 'GEN310 - 325 - 329'>
            <CFSET MIQ = #F3LIQ#>
            <CFSET MIPR = #F3LIPR#>
           
            	<CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #MIQ#, '#MECC#', '#MECN#', #MIPR#, '#F3LNPR1#', '#F3LNPR2#', '#F3LNPR3#','#F3LNPR4# ', '#F3LNPR5#', ' ')
    	</cfquery>
</CFIF>
<!--- ============================================================================================== --->
 <CFIF MS3L EQ 0 AND S3LIQ GT 0>
       Social Science 300 Level needed <Br />
       <CFSET MECC = 'GEL872'>
       		<CFSET MECN = 'GEN340 or 345'>
            <CFSET MIQ = #S3LIQ#>
            <CFSET MIPR = #S3LIPR#>
            
            	<CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #MIQ#, '#MECC#', '#MECN#', #MIPR#, '#S3LNPR1#', '#S3LNPR2#', '#S3LNPR3#','#S3LNPR4# ', '#S3LNPR5#', ' ')
    	</cfquery>
</CFIF>
<!--- ============================================================================================== --->
 <CFIF MF2FL EQ 0 AND F2FLIQ GT 0>
       Fine Arts FD, GD, MAA 200 Level needed <Br />
       <CFSET MECC = 'GEL882'>
       		<CFSET MECN = 'GEN211 or 212'>
            <CFSET MIQ = #F2FLIQ#>
            <CFSET MIPR = #F2FLIPR#>
           
            	<CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #MIQ#, '#MECC#', '#MECN#', #MIPR#, '#F2FLNPR1#', '#F2FLNPR2#', '#F2FLNPR3#','#F2FLNPR4# ', '#F2FLNPR5#', ' ')
    	</cfquery>
</CFIF>
<!--- ============================================================================================== --->
 <CFIF MS2HL EQ 0 AND S2HLIQ GT 0>
       Social Science HM 200 Level needed <Br />
       <CFSET MECC = 'GEL893'>
       		<CFSET MECN = 'GEN244 - 247 - 248'>
            <CFSET MIQ = #S2HLIQ#>
            <CFSET MIPR = #S2HLIPR#>
           
            	<CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #MIQ#, '#MECC#', '#MECN#', #MIPR#, '#S2HLNPR1#', '#S2HLNPR2#', '#S2HlNPR3#','#S2HlNPR4# ', '#S2HLNPR5#', ' ')
    	</cfquery>
</CFIF>
<!--- ============================================================================================== --->
 <CFIF MS2FL EQ 0 AND S2FLIQ GT 0>
       Social Science FMM FD 200 Level needed <Br />
       <CFSET MECC = 'GEL913'>
       		<CFSET MECN = 'GEN241 - 247 - 248'>
            <CFSET MIQ = #S2FLIQ#>
            <CFSET MIPR = #S2FLIPR#>
        
            	<CFQUERY NAME = "MEBAPOUT" datasource="AllSchoolAudit">
     	 INSERT INTO SchedOut
      		(QuOut, StuID, StuLastName, StuFirstName, StuStat, PerComp,  DayEv, MajorID, IQu, courseCode, CourseName, IPR, NPR1, NPR2, NPR3, NPR4, NPR5, GenSav)
      	VALUES
      		(#QuOut#, '#MstuId#', '#MstuLastName#', '#MstuFirstName#','#MstuStat#',#MperComp#,#MdayEv#, '#MmajID#', #MIQ#, '#MECC#', '#MECN#', #MIPR#, '#S2FLNPR1#', '#S2FLNPR2#', '#S2FLNPR3#','#S2FLNPR4# ', '#S2FLNPR5#', ' ')
    	</cfquery>
</CFIF>
<!--- ============================================================================================== --->

</CFLOOP>
Completed doing what it is doing
<!--- </BODY>
</HTML>--->