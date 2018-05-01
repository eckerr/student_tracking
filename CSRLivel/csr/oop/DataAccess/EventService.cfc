<cfcomponent displayname="EventService" output="NO"
   hint="I am the EventSVC Class used to interact with the Event package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.EventDAO = '' />
   <cfset variables.instance.EventGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the EventSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.EventDAO = createObject('component', 'EventDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.EventGW = createObject('component', 'EventGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Event into the database">
		<cfargument name="event" required="YES"
          type="com.csr.oop.beans.Event" hint="I am the Event bean" />
          <cfreturn variables.instance.EventDAO.saveEvent(arguments.event) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Event from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Event you wish to search for" />
       <cfreturn variables.instance.EventDAO.getEventByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Event from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Event you wish to delete" />
       <cfreturn variables.instance.EventDAO.deleteEventByID(arguments.ID) />
    </cffunction>
            

  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryEvent" access="public" output="NO"
       hint="I run a query of every Event within the database table">
       <!--- Call the query method from the Event gateway and return the query object  --->
	   <cfreturn variables.instance.EventGW.getEveryEvent() />
	</cffunction>
    
    <cffunction name="filterByInputDate" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on the input date" >
       <cfargument name="inputDateFilter"  required="YES" type="DATE"
          hint="I am the input date filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByInputDate(inputDateFilter) />
    </cffunction> 

    <cffunction name="filterByAbsence" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based absence" >
       <cfargument name="absenceFilter"  required="YES" type="NUMERIC"
          hint="I am the event absence filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByAbsence(absenceFilter) />
    </cffunction> 
     
    <cffunction name="filterByTardiness" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on tardiness" >
       <cfargument name="tardinessFilter"  required="YES" type="NUMERIC"
          hint="I am the tardiness filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByTardiness(tardinessFilter) />
    </cffunction>      
     
    <cffunction name="filterByPoorQualityWork" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on poor quality work" >
       <cfargument name="poorQualityWorkFilter"  required="YES" type="NUMERIC"
          hint="I am the poor quality work filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByPoorQualityWork(poorQualityWorkFilter) />
    </cffunction>      
     
    <cffunction name="filterByMissingWork" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on missing work" >
       <cfargument name="missingWorkFilter"  required="YES" type="NUMERIC"
          hint="I am the missing work filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByMissingWork(missingWorkFilter) />
    </cffunction>      
     
     <cffunction name="filterByNotPrepared" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on not prepared" >
       <cfargument name="notPreparedFilter"  required="YES" type="NUMERIC"
          hint="I am the not prepared filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByNotPrepared(notPreparedFilter) />
    </cffunction>      
     
    <cffunction name="filterByBehavior" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on behavior" >
       <cfargument name="behaviorFilter"  required="YES" type="NUMERIC"
          hint="I am the behavior filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByBehavior(behaviorFilter) />
    </cffunction>      
     
    <cffunction name="filterByPersonal" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on personal" >
       <cfargument name="personalFilter"  required="YES" type="NUMERIC"
          hint="I am the personal filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByPersonal(personalFilter) />
    </cffunction>      
     
    <cffunction name="filterByFinancial" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on financial" >
       <cfargument name="financialFilter"  required="YES" type="NUMERIC"
          hint="I am the financial filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByFinancial(financialFilter) />
    </cffunction>      
     
    <cffunction name="filterByDrugsAlcohol" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on drugs alcohol" >
       <cfargument name="drugsAlcoholFilter"  required="YES" type="NUMERIC"
          hint="I am the drugs / alcohol filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByDrugsAlcohol(drugsAlcoholFilter) />
    </cffunction>      
     
    <cffunction name="filterByPlagiarism" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on plagiarism" >
       <cfargument name="plagiarismFilter"  required="YES" type="NUMERIC"
          hint="I am the plagiarism filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByPlagiarism(plagiarismFilter) />
    </cffunction>      
     
    <cffunction name="filterByFamilyIssues" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on family issues" >
       <cfargument name="familyIssuesFilter"  required="YES" type="NUMERIC"
          hint="I am the family issues filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByFamilyIssues(familyIssuesFilter) />
    </cffunction>      
     
    <cffunction name="filterByTransportation" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on transportation" >
       <cfargument name="transportationFilter"  required="YES" type="NUMERIC"
          hint="I am the transportation filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByTransportation(transportationFilter) />
    </cffunction>      
     
    <cffunction name="filterByChildCare" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on child care" >
       <cfargument name="childCareFilter"  required="YES" type="NUMERIC"
          hint="I am the child care filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByChildCare(childCareFilter) />
    </cffunction>      
     
    <cffunction name="filterByOther" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on Other" >
       <cfargument name="otherFilter"  required="YES" type="NUMERIC"
          hint="I am the other filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByOther(otherFilter) />
    </cffunction>      
     
    <cffunction name="filterByInstTalkedToStudent" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on instructor talked to student" >
       <cfargument name="instTalkedToStudentFilter"  required="YES" type="NUMERIC"
          hint="I am the instructor talked to student filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByInstTalkedToStudent(instTalkedToStudentFilter) />
    </cffunction>      
     
    <cffunction name="filterByAdvTalkedToStudent" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on advisor talked to student" >
       <cfargument name="advTalkedToStudentFilter"  required="YES" type="NUMERIC"
          hint="I am the advisor talked to student filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByAdvTalkedToStudent(advTalkedToStudentFilter) />
    </cffunction>      
     
    <cffunction name="filterByAssignedTo" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on Assigned To" >
       <cfargument name="assignedToFilter"  required="YES" type="NUMERIC"
          hint="I am the assigned to filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByAssignedTo(assignedToFilter) />
    </cffunction>      
     
    <cffunction name="filterByAssignedDate" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on assigned date" >
       <cfargument name="assignedDateFilter"  required="YES" type="DATE"
          hint="I am the assigned date filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByAssignedDate(assignedDateFilter) />
    </cffunction>      
     
    <cffunction name="filterByAdvisorID" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on advisor ID" >
       <cfargument name="advisorIDFilter"  required="YES" type="NUMERIC"
          hint="I am the advisor id filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByAdvisorID(advisorIDFilter) />
    </cffunction>      
     
    <cffunction name="filterByAdvStatus" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on advising status" >
       <cfargument name="advStatusFilter"  required="YES" type="NUMERIC"
          hint="I am the advising status filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByAdvStatus(advStatusFilter) />
    </cffunction>      
     
    <cffunction name="filterByCourseID" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on course id" >
       <cfargument name="courseIDFilter"  required="YES" type="NUMERIC"
          hint="I am the course ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByCourseID(courseIDFilter) />
    </cffunction>      
     
    <cffunction name="filterByInstructorID" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on instructor ID" >
       <cfargument name="instructorIDFilter"  required="YES" type="NUMERIC"
          hint="I am the instructor ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByInstructorID(instructorIDFilter) />
    </cffunction>      
     
    <cffunction name="filterByWeekID" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on week ID" >
       <cfargument name="weekIDFilter"  required="YES" type="NUMERIC"
          hint="I am the weekID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByWeekID(weekIDFilter) />
    </cffunction>      
     
    <cffunction name="filterByStudentID" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on student ID" >
       <cfargument name="studentIDFilter"  required="YES" type="NUMERIC"
          hint="I am the student ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByStudentID(studentIDFilter) />
    </cffunction>      
     
    <cffunction name="filterByGradeLevel" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on grade level" >
       <cfargument name="gradeLevelFilter"  required="YES" type="NUMERIC"
          hint="I am the grade level filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByGradeLevel(gradeLevelFilter) />
    </cffunction>      
     
    <cffunction name="filterByMajorID" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on major ID" >
       <cfargument name="majorIDFilter"  required="YES" type="NUMERIC"
          hint="I am the major ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByMajorID(majorIDFilter) />
    </cffunction>      
     
    <cffunction name="filterByTermCodeID" access="PUBLIC" output="NO" 
       hint="I run a query of every Event based on termCodeID" >
       <cfargument name="termCodeIDFilter"  required="YES" type="NUMERIC"
          hint="I am the termCodeID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EventGW.filterByTermCodeID(termCodeIDFilter) />
    </cffunction>      
     
</cfcomponent>