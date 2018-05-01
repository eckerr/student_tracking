<cfcomponent displayname="EventGateway" output="NO"
   hint="I am the EventGateway Class">

   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.datasource = '' />
   
	<cffunction name="init" access="public" output="NO" 
       returntype="any" hint="I am the constructor method for the 
           EventGateway Class"> 
		<cfargument name="datasource" required="yes"
           type="com.csr.oop.beans.Datasource" 
           hint="I am the datasource object" />
           <!--- Set the initial value of the property  ---> 
           <cfscript>
		     variables.instance.datasource = arguments.datasource;
		   </cfscript>
         <cfreturn this />
	</cffunction>
    <!--- PUBLIC METHODS  --->
    <cffunction name="getEveryEvent" access="PUBLIC" output="NO"
       hint="I run a query of every Event within the database table">
       <cfreturn filterEveryEvent() />
     </cffunction>
     
          <cffunction name="filterByInputDate" access="PUBLIC" 
             output="NO" hint="I filter by input date" >
                <cfargument name="inputDateFilter" required="YES" type="DATE"
                   hint="I am the input Date to search for" />
                <!--- Create and populate a structure object containing the filter to pass through --->
                <cfset var EventFilter = structNew()>
                <cfset EventFilter.inputDate = arguments.inputDate />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter = EventFilter) />
             </cffunction>

     <cffunction name="filterByAbsence" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter ">
         <cfargument name="absenceFilter" required="YES" type="NUMERIC" 
             hint="I am the absence filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.absence = arguments.absenceFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>   
                             
     <cffunction name="filterByTardiness" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter ">
         <cfargument name="tardinessFilter" required="YES" type="NUMERIC" 
             hint="I am the tardiness filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.tardiness = arguments.tardinessFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>   
                             
     <cffunction name="filterByPoorQualityWork" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter ">
         <cfargument name="poorQualityWorkFilter" required="YES" type="NUMERIC" 
             hint="I am the poor quality work filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.poorQualityWork = arguments.poorQualityWorkFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>   
                             
      <cffunction name="filterByMissingWork" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="missingWorkFilter" required="YES" type="NUMERIC" 
             hint="I am the missing work filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.missingWork = arguments.missingWorkFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByNotPrepared" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="notPreparedFilter" required="YES" type="NUMERIC" 
             hint="I am the not prepared filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.notPrepared = arguments.notPreparedFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByBehavior" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="behaviorFilter" required="YES" type="NUMERIC" 
             hint="I am the behavior filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.behavior = arguments.behaviorFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByPersonal" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="personalFilter" required="YES" type="NUMERIC" 
             hint="I am the personal filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.personal = arguments.personalFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByFinancial" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="financialFilter" required="YES" type="NUMERIC" 
             hint="I am the financial filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.financial = arguments.financialFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByDrugsAlcohol" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="drugsAlcoholFilter" required="YES" type="NUMERIC" 
             hint="I am the drugsAlcohol filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.drugsAlcohol = arguments.drugsAlcoholFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByPlagiarism" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="palagiarismFilter" required="YES" type="NUMERIC" 
             hint="I am the plagiarism filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.plagiarism = arguments.plagiarismFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByFamilyIssues" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="familyIssuesFilter" required="YES" type="NUMERIC" 
             hint="I am the family issues filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.familyIssues = arguments.familyIssuesFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByTransportation" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="transportationFilter" required="YES" type="NUMERIC" 
             hint="I am the transportation filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.transportation = arguments.transportationFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByChildCare" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="childCareFilter" required="YES" type="NUMERIC" 
             hint="I am the child care filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.childCare = arguments.childCareFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByOther" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="otherFilter" required="YES" type="NUMERIC" 
             hint="I am the other filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.other = arguments.otherFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByInstTalkedToStudent" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="instTalkedToStudentFilter" required="YES" type="NUMERIC" 
             hint="I am the instructor talked to student filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.instTalkedToStudent = arguments.instTalkedToStudentFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByAdvTalkedToStudent" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="advTalkedToStudentFilter" required="YES" type="NUMERIC" 
             hint="I am the advisor talked to student filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.advTalkedToStudent = arguments.advTalkedToStudentFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByAssignedTo" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="assignedToFilter" required="YES" type="NUMERIC" 
             hint="I am the assigned to filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.assignedTo = arguments.assignedToFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByAssignedDate" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="assignedDateFilter" required="YES" type="DATE" 
             hint="I am the assigned date filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.assignedDate = arguments.assignedDateFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByAdvisorID" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="advisorIDFilter" required="YES" type="NUMERIC" 
             hint="I am the advisor ID filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.advisorID = arguments.advisorIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByAdvStatus" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="advStatusFilter" required="YES" type="NUMERIC" 
             hint="I am the advising status filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.advStatus = arguments.advStatusFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByCourseID" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="courseIDFilter" required="YES" type="NUMERIC" 
             hint="I am the course ID filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.courseID = arguments.courseIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByInstructorID" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="instructorIDFilter" required="YES" type="NUMERIC" 
             hint="I am the instructor ID filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.instructorID = arguments.instructorIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByWeekID" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="weekIDFilter" required="YES" type="NUMERIC" 
             hint="I am the week Id filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.weekID = arguments.weekIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByStudentID" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="studentIDFilter" required="YES" type="NUMERIC" 
             hint="I am the student ID filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.studentID = arguments.studentIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByGradeLevelID" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="gradeLevelIDFilter" required="YES" type="NUMERIC" 
             hint="I am the grade level ID filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.gradeLevelID = arguments.gradeLevelIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByMajorID" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="majorIDFilter" required="YES" type="NUMERIC" 
             hint="I am the majorID filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.majorID = arguments.majorIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
     <cffunction name="filterByTermCodeID" access="PUBLIC" output="NO"
         hint="I run a query of every Event within the database table based upon a 
            required filter  ">
         <cfargument name="termCodeIDFilter" required="YES" type="NUMERIC" 
             hint="I am the termCodeID filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.termCodeID = arguments.termCodeIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryEvent(filter) />
             </cffunction>                             
         
         <!--- PRIVATE METHODS --->
         <cffunction name="filterEveryEvent" access="PRIVATE" output="NO"
          hint="I run a query and will return all Event records. If a filter 
             has been applied, I will refine the search using the filter information 
             sent to me">
             <cfargument name="filter" required="NO" type="STRUCT" 
                default="#structNew()#"  hint="I am a structure used to filter the query" />
 			 <cfset var encEventName = ''/>
             <cfset var qSearch = '' />
                <cfquery name="qSearch" 
                   datasource="#variables.instance.datasource.getDSName()#" 
                   username="#variables.instance.datasource.getUsername()#" 
                   password="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, inputDate, instructorMemo, absence, tardiness, poorQualityWork, missingWork,
           notPrepared, behavior, personal, financial, drugsAlcohol, plagiarism, 
           familyIssues, tansportation, childCare, other, instTalkedToStudent, advTalkedToStudent,
           assignedTo, assignedDate, advisorID, advisorNote, advStatus, courseID, instructorID,
           weekID, studentID, gradeLevelID, majorID, termCodeID
      FROM Tbl_Event

                   WHERE 1 = 1
                         
                <cfif NOT structIsEmpty(arguments.filter)>
                   <!--- A filter has been provided. Let's find out which filter it is, 
				      and apply the necessary clause to the SQL  --->
                      
                      <!--- Perform an exact match on the input date  --->                            
                      <cfif structKeyExists(arguments.filter, 'inputDate')>
                          AND inputDate = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_DATE" 
                            VALUE="#arguments.filter.inputDate#" />
                     </cfif>
                     <!--- Here, we want to find exact absence matches  --->
                     <cfif structKeyExists(arguments.filter, 'absence')>
                          AND absence = 
                         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.absence#" />
                    </cfif>
                       <!--- Perform an exact match on the tardiness  --->
                      <cfif structKeyExists(arguments.filter, 'tardiness')>
                          AND tardiness = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.tardiness#" />
                     </cfif>
                   
                      <!--- Perform an exact match on the poor quality work  --->
                      <cfif structKeyExists(arguments.filter, 'poorQualityWork')>
                          AND poorQualityWork = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.poorQualityWork#" />
                     </cfif>
                   
                      <!--- Perform an exact match on the missingWork  --->
                      <cfif structKeyExists(arguments.filter, 'missingWork')>
                          AND missingWork = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.missingWork#" />
                     </cfif>
                   
                      <!--- Perform an exact comparison on not prepared  --->
                      <cfif structKeyExists(arguments.filter, 'notPrepared')>
                          AND notPrepared = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.notPrepared#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on behavior  --->
                      <cfif structKeyExists(arguments.filter, 'behavior')>
                          AND behavior = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.behavior#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on personal  --->
                      <cfif structKeyExists(arguments.filter, 'personal')>
                          AND personal = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.personal#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on financial  --->
                      <cfif structKeyExists(arguments.filter, 'financial')>
                          AND financial = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.financial#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on drugs alcohol  --->
                      <cfif structKeyExists(arguments.filter, 'drugsAlcohol')>
                          AND drugsAlcohol = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.drugsAlcohol#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on plagiarism  --->
                      <cfif structKeyExists(arguments.filter, 'plagiarism')>
                          AND plagiarism = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.plagiarism#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on family issues  --->
                      <cfif structKeyExists(arguments.filter, 'familyIssues')>
                          AND familyIssues = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.familyIssues#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on transportation  --->
                      <cfif structKeyExists(arguments.filter, 'transportation')>
                          AND transportation = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.transportation#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on child care  --->
                      <cfif structKeyExists(arguments.filter, 'childCare')>
                          AND childCare = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.childCare#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on the other  --->
                      <cfif structKeyExists(arguments.filter, 'other')>
                          AND other = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.other#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on instructor talked to student  --->
                      <cfif structKeyExists(arguments.filter, 'instTalkedToStudent')>
                          AND instTalkedToStudent = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.instTalkedToStudent#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on advisor talked to student  --->
                      <cfif structKeyExists(arguments.filter, 'advTalkedToStudent')>
                          AND advTalkedToStudent = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.advTalkedToStudent#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on assigned to  --->
                      <cfif structKeyExists(arguments.filter, 'assignedTo')>
                          AND assignedTo = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.assignedTo#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on assigned date  --->
                      <cfif structKeyExists(arguments.filter, 'assignedDate')>
                          AND assignedDate = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_DATE" 
                            VALUE="#arguments.filter.assignedDate#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on the advisor ID  --->
                      <cfif structKeyExists(arguments.filter, 'advisorID')>
                          AND advisorID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.advisorID#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on advising status  --->
                      <cfif structKeyExists(arguments.filter, 'advStatus')>
                          AND advStatus = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.advStatus#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on the course ID  --->
                      <cfif structKeyExists(arguments.filter, 'courseID')>
                          AND courseID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.courseID#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on the InstructorID  --->
                      <cfif structKeyExists(arguments.filter, 'instructorID')>
                          AND instructorID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.instructorID#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on the week ID  --->
                      <cfif structKeyExists(arguments.filter, 'weekID')>
                          AND weekID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.weekID#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on the student ID  --->
                      <cfif structKeyExists(arguments.filter, 'studentID')>
                          AND studentID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.studentID#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on the grade level ID  --->
                      <cfif structKeyExists(arguments.filter, 'gradeLevelID')>
                          AND gradeLevelID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.gradeLevelID#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on the major ID  --->
                      <cfif structKeyExists(arguments.filter, 'majorID')>
                          AND majorID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.majorID#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on the termCodeID  --->
                      <cfif structKeyExists(arguments.filter, 'termCodeID')>
                          AND termCodeID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.termCodeID#" />
                     </cfif>
                   
                   </cfif>
                     </cfquery>            
                 <cfreturn #qSearch# />
             </cffunction>
</cfcomponent>