<CFCOMPONENT DISPLAYNAME="CourseDAO" OUTPUT="NO" HINT="I am the Course DAO class">

<!--- Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />

	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the CourseDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewCourse" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="course" REQUIRED="YES" TYPE="com.csr.oop.beans.Course" HINT="I am the Course bean" />
    <cfset var qInsert  = '' />
    <cfset var boolSuccess = true />
    
   <!---   <cftry>--->
        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >
         insert into Tbl_Course(
           classSchedDescrip, code, courseCode, courseDescrip, adClassSchedID,
           roomNumber,  cSection, buildingID, startTimeID, endTimeID, daysID, day_orderID,
           classStartID, classEndID, termCodeID, teacherID)
         values(
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.course.getClassSchedDescrip()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.course.getCode()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.course.getCourseCode()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.course.getCourseDescrip()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.course.getAdClassSchedID()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.course.getRoomNumber()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.course.getCSection()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.course.getBuildingID()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.course.getStartTimeID()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.course.getEndTimeID()#" />,                           
         <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.course.getDaysID()#" />,                                   
         <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.course.getDay_orderID()#" />,
         <cfqueryparam CFSQLTYPE="CF_INTEGER" 
            VALUE="#arguments.course.getClassStartID()#" />,
         <cfqueryparam CFSQLTYPE="CF_INTEGER" 
            VALUE="#arguments.course.getClassEndID()#" />,
          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.course.getTermCodeID()#" />,
          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.course.getTeacherID()#" />
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
    SELECT iD, termCodeID, classSchedDescrip, cSection FROM Tbl_Course
    WHERE classSchedDescrip = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
    VALUE="#arguments.course.getClassSchedDescrip()#" /> 
    AND cSection = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
    VALUE="#arguments.course.getCSection()#" />
    AND termCodeID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
    VALUE="#arguments.course.getTermCodeID()#" /> 
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
  <cffunction NAME="getCourseByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an Course bean populated with data for the specific Course" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the Course you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objCourse = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, classSchedDescrip, code, courseCode, courseDescrip, adClassSchedID,   	       	      roomNumber,  cSection, buildingID, startTimeID, endTimeID, daysID, day_orderID,
      classStartID, classEndID, termCodeID, teacherID
      FROM Tbl_Course
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the Course ID, decrypt the Course name and number and create an 
	   	  	        instance of the Course bean and return it  --->
                 
       <cfset objCourse = createObject('component', 'com.csr.oop.beans.Course').init(
	      ID = qSearch.ID, classSchedDescrip = qSearch.classSchedDescrip,
		  code = qSearch.code,
		  courseCode = qSearch.courseCode, courseDescrip = qSearch.courseDescrip, 
		  adClassSchedID = qSearch.adClassSchedID, roomNumber = qSearch.roomNumber,
		  cSection = qSearch.cSection, buildingID = qSearch.buildingID, 
		  startTimeID = qSearch.startTimeID, endTimeID = qSearch.endTimeID, 
		  daysID = qSearch.daysID, day_orderID = qSearch.day_orderID, 
		  classStartID = qSearch.classStartID, classEndID = qSearch.classEndID,
		  termCodeID = qSearch.termCodeID, teacherID = qSearch.teacherID) />
    </cfif>
    <cfreturn objCourse />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateCourse" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the all course details." >
     <cfargument NAME="course" REQUIRED="YES"
       TYPE="com.csr.oop.beans.Course"
       HINT="I am the Course bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Tbl_Course
            SET 
             classSchedDescrip = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.course.getClassSchedDescrip()#" />,
			 code = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.course.getCode()#" />,
			 courseCode = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.course.getCourseCode()#" />,
			 courseDescrip = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.course.getCourseDescrip()#" />,
			 adClassSchedID = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.course.getAdClassSchedID()#" />,              
			 roomNumber = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.course.getRoomNumber()#" />,
			 cSection = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.course.getCSection()#" />,              
			 buildingID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.course.getBuildingID()#" />,
             startTimeID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.course.getStartTimeID()#" />
             endTimeID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.course.getEndTimeID()#" />
             daysID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.course.getDaysID()#" />
             day_orderID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.course.getDay_orderID()#" />
			 classStartID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.course.getClassStartID()#" />,              
			 classEndID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.course.getClassEndID()#" />,              
			 termCodeID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.course.getTermCodeID()#" />,              
			 teacherID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.course.getTeacherID()#" />              
                         		
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.course.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteCourseByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete an Course from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the all course you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_Course
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
        <cffunction name="saveCourse" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving a Course, either by
              creating a new entry or updating an existing one" >
              <cfargument name="course" required="YES" 
                type="com.csr.oop.beans.Course" 
                hint="I am  the Course bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.course)>
                    <cfset success = updateCourse(arguments.course) />
                  <cfelse>
                    <cfset success = createNewCourse(arguments.course) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific course 
              exists within the database, using the ID as a check"> 
              <cfargument name="course" required="true"
                 type = "com.csr.oop.beans.Course" hint="I am the Course bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_Course
                         WHERE ID = <cfqueryparam VALUE="#arguments.course.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
        </cffunction>  
   
</CFCOMPONENT>