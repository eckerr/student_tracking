<!--- InsertASProgramRecs --->

<!--- Insert ProgramInfo new record --->
<CFQUERY DATASOURCE="AllSchoolAudit"> 
          INSERT INTO ProgramInfo(ProgramCode,
			                    ProgramName,
                                DegreeCode,
			                    MajorCode,
			                    MajorName,
                                MajReq,
                                GenReq)
          VALUES('#Ucase(Trim(FORM.ProgramCode))#',
                 '#Trim(FORM.ProgramName)#',
                 '#Ucase(Trim(FORM.DegreeCode))#',
                 '#Ucase(Trim(FORM.MajorCode))#',
                 '#Trim(FORM.MajorName)#',
                 #FORM.MajReq#,
                 #FORM.GenReq#)                              
</CFQUERY>

<!--- give feedback that it was entered --->
<CFOUTPUT>
 New Program entered <B>#Ucase(FORM.ProgramCode)#  #Ucase(FORM.MajorCode)#   #FORM.MajorName# </B>added to the table 
</CFOUTPUT>