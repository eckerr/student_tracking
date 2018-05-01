<!--- InsertASPrereqRec --->

<!--- Insert PrereqInfo new record --->
<CFQUERY DATASOURCE="AllSchoolAudit"> 
          INSERT INTO PrereqInfo(MajorCode,
			                    CourseCode,
                                PrereqCode)
          VALUES('#Ucase(Trim(FORM.MajorCode))#',
                 '#Ucase(Trim(FORM.CourseCode))#',
                 '#Ucase(Trim(FORM.PrereqCode))#')                              
</CFQUERY>

<!--- give feedback that it was entered --->
<CFOUTPUT>
 New Prereq entered <B>#FORM.MajorCode#  #Ucase(FORM.CourseCode)# - #Ucase(FORM.PrereqCode)# </B>added to the table 
</CFOUTPUT>