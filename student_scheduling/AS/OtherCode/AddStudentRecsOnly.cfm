
	<cfset this.datasource = "StudentsAudit">
	
	
		<cfquery datasource="#this.datasource#">


      INSERT INTO StudentTab
      (StuID, StuLastName, StuFirstName, DayEv, TotNeed, MajNeed, GenNeed, StuStat, PerComp, MajComp, GenComp, Inprog, MajorID, SchProgram, M2L, H2L, F2L, S2L, L3L, F3L, S3L, GenSav)
      VALUES


      ('394211', 'Piszczek', 'Nicholas R.      ', 0, 36, 24, 12, 'Freshman', 2, 6, 3, 3, 'VFX ', 'UNDG', 0, 0, 0, 0, 0, 0, 0, ''),


    </cfquery>
Successfully added records to AuditRecs
