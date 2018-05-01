<CFCOMPONENT DISPLAYNAME="EventDAO" OUTPUT="NO" HINT="I am the Event DAO class">

<!--- Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />

	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the EventDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewEvent" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="event" REQUIRED="YES" TYPE="com.csr.oop.beans.Event" HINT="I am the Event bean" />
    <cfset var qInsert  = '' />
    <cfset var boolSuccess = true />
    
   <!---   <cftry>--->
        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >
         insert into Tbl_Event(
           inputDate, instructorMemo, absence, tardiness, poorQualityWork, missingWork,
           notPrepared, behavior, personal, financial, drugsAlcohol, plagiarism, 
           familyIssues, tansportation, childCare, other, instTalkedToStudent, advTalkedToStudent,
           assignedTo, assignedDate, advisorID, advisorNote, advStatus, courseID, instructorID,
           weekID, studentID, gradeLevelID, majorID, termCodeID)
         values(
         <cfqueryparam  CFSQLTYPE="CF_SQL_DATE"
            VALUE="#arguments.event.getInputDate()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.event.getInstructorMemo()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getAbsence()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getTardiness()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getPoorQualityWork()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getMissingWork()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getNotPrepared()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getBehavior()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getPersonal()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getFinancial()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getDrugsAlcohol()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getPlagiarism()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getFamilyIssues()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getTransportation()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getChildCare()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getOther()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getInstTalkedToStudent()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getAdvTalkedToStudent()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getAssignedTo()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_DATE"
            VALUE="#arguments.event.getAssignedDate()#" />,
          <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getAdvisorID()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.event.getAdvisorNote()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getAdvStatus()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getCourseID()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getInstructorID()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getWeekID()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getStudentID()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getGradeLevelID()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getMajorID()#" />,
         <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.event.getTermCodeID()#" />
         )
         </cfquery>
 <!---           <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
     </cftry>--->
    <!--- <cfreturn boolSuccess /> --->    

	<!---      Here, we search for the newly added record to retrieve it's ID number to pass to the bean ---> 
    <cfquery NAME="findID"
     DATASOURCE="#Variables.instance.datasource.getDSName()#"
     USERNAME="#variables.instance.datasource.getUsername()#"
     PASSWORD="#variables.instance.datasource.getPassword()#"
    >
    SELECT iD, inputDate, studentID, instructorID, courseID, weekID, instructorMemo FROM Tbl_Event
    WHERE 
    	inputDate = <cfqueryparam  CFSQLTYPE="CF_SQL_DATE"
              VALUE="#arguments.event.getInputDate()#" /> AND
     	studentID = <cfqueryparam   CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getStudentID()#" /> AND
    	instructorID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getInstructorID()#" /> AND
    	courseID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getCourseID()#" /> AND
    	weekID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getWeekID()#" /> AND
    	instructorMemo = <cfqueryparam  CFSQLTYPE="CF_SQL_DATE"
              VALUE="#arguments.event.getInstructorMemo()#" />
             
    </cfquery>
         Here, we return the generatedKey value, which is an auto-generated value from the Database --->
    <cfif findID.RecordCount>
           <cfset insertResult = #findID.id# />
         <cfreturn insertResult />
    <cfelse>
         <cfreturn 0 />              
    </cfif>
 
  </cffunction>
  
  <!--- READ  ---> 
  <cffunction NAME="getEventByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an Event bean populated with data for the specific Event" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the Event you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objEvent = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, inputDate, instructorMemo, absence, tardiness, poorQualityWork, missingWork,
           notPrepared, behavior, personal, financial, drugsAlcohol, plagiarism, 
           familyIssues, tansportation, childCare, other, instTalkedToStudent, advTalkedToStudent,
           assignedTo, assignedDate, advisorID, advisorNote, advStatus, courseID, instructorID,
           weekID, studentID, gradeLevelID, majorID, termCodeID
      FROM Tbl_Event
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the Event ID, decrypt the Event name and number and create an 
	   	  	        instance of the Event bean and return it  --->
                 
       <cfset objEvent = createObject('component', 'com.csr.oop.beans.Event').init(
	      ID = qSearch.ID, inputDate = qSearch.inputDate,
		  instructorMemo = qSearch.instructorMemo, absence = qSearch.absence,
		  tardiness = qSearch.tardiness, poorQualityWork = qSearch.poorQualityWork,
		  missingWork = qSearch.missingWork, notPrepared = qSearch.notPrepared, 
		  behavior = qSearch.behavior, personal = qSearch.personal, financial = qSearch.financial,
		  drugsAlcohol = qSearch.drugsAlcohol, plagiarism = qSearch.plagiarism, 
		  familyIssues = qSearch.familyIssues, transportation = qSearch.transportation,
		  childCare = qSearch.childCare, other = qSearch.other, 
		  instTalkedToStudent = qSearch.instTalkedToStudent, 
		  advTalkedToStudent = qSearch.advTalkedToStudent, assignedTo = qSearch.assignedTo,
		  assignedDate = qSearch.assignedDate, advisorID = qSearch.advisorID, 
		  advisorNote = qSearch.advisorNote, advStatus = qSearch.advStatus, 
		  courseID = qSearch.courseID, instructorID = qSearch.instructorID, 
		  weekID = qSearch.weekID, studentID = qSearch.studentID, 
		  gradeLevelID = qSearch.gradeLevelID, majorID = qSearch.majorID, 
		  termCodeID = qSearch.termCodeID) />
    </cfif>
    <cfreturn objEvent />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateEvent" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the all event details." >
     <cfargument NAME="event" REQUIRED="YES"
       TYPE="com.csr.oop.beans.Event"
       HINT="I am the Event bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Tbl_Event
            SET 
             inputDate = <cfqueryparam CFSQLTYPE="CF_SQL_DATE"
              VALUE="#arguments.event.getInputDate()#" />,
			 instructorMemo = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.event.getInstructorMemo()#" />,
			 absence = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getAbsence()#" />,
			 tardiness = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getTardiness()#" />,
			 poorQualityWork = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getPoorQualityWork()#" />,
			 missingWork = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getMissingWork()#" />,
			 notPrepared = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getNotPrepared()#" />,
			 behavior = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getBehavior()#" />,
			 personal = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getPersonal()#" />,
			 financial = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getFinancial()#" />,
			 drugsAlcohol = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getDrugsAlcohol()#" />,
			 plagiarism = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getPlagiarism()#" />,
			 familyIssues = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getFamilyIssues()#" />,
			 transportation = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getTransportation()#" />,
			 childCare = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getChildCare()#" />,
			 other = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getOther()#" />,
			 instTalkedToStudent = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getInstTalkedToStudent()#" />,
			 advTalkedToStudent = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getAdvTalkedToStudent()#" />,
			 assignedTo = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getAssignedTo()#" />,
             assignedDate = <cfqueryparam CFSQLTYPE="CF_SQL_DATE"
              VALUE="#arguments.event.getAssignedDate()#" />,
			 advisorID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getAdvisorID()#" />,             
			 advisorNote = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.event.getAdvisorNote()#" />,
			 advStatus = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getAdvStatus()#" />,
			 courseID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getCourseID()#" />,
			 instructorID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getInstructorID()#" />,
			 weekID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getWeekID()#" />,
			 studentID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getStudentID()#" />,
			 gradeLevelID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getGradeLevelID()#" />,
			 majorID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getMajorID()#" />,
			 termCodeID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.event.getTermCodeID()#" />
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.event.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteEventByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete an Event from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the all event you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_Event
            WHERE ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
               VALUE="#arguments.ID#" />
            </cfquery>
            <cfcatch TYPE="DATABASE">
               <cfset boolSuccess = false />
            </cfcatch>
          </cftry>
         <cfreturn boolSuccess />
        </cffunction> 
      
        <!--- SAVE  ---> 
        <cffunction name="saveEvent" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving a Event, either by
              creating a new entry or updating an existing one" >
              <cfargument name="event" required="YES" 
                type="com.csr.oop.beans.Event" 
                hint="I am  the Event bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.event)>
                    <cfset success = updateEvent(arguments.event) />
                  <cfelse>
                    <cfset success = createNewEvent(arguments.event) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific event 
              exists within the database, using the ID as a check"> 
              <cfargument name="event" required="true"
                 type = "com.csr.oop.beans.Event" hint="I am the Event bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_Event
                         WHERE ID = <cfqueryparam VALUE="#arguments.event.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
        </cffunction>  
   
</CFCOMPONENT>