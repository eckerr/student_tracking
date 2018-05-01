<!--- ASModifyAddPrereqRec --->

<!--- Are we inserting a new rec or editing an existing one? --->
<CFSET ModifyClass = IsDefined("Form.RecKey")>

<CFIF ModifyClass>
    <!--- we are modifying an existing class --->
   <CFQUERY datasource="AllSchoolAudit">
   UPDATE PrereqInfo
    SET  CourseCode='#Trim(FORM.CourseCode)#',
       <!--- MajorCode='#Trim(FORM.MajorCode)#',--->
        PrereqCode='#Trim(FORM.PrereqCode)#'
    WHERE RecKey=#FORM.RecKey#
    </CFQUERY> 
    <CFOUTPUT>
 Prereq change made <B> #Ucase(FORM.CourseCode)# - #Ucase(FORM.PrereqCode)# </B> 
</CFOUTPUT>
       

<CFELSE>

    <!--- we are adding a new class --->


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
</CFIF>