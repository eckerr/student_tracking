<cfcomponent displayname="CourseService" output="NO"
   hint="I am the CourseSVC Class used to interact with the Course package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.CourseDAO = '' />
   <cfset variables.instance.CourseGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the CourseSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.CourseDAO = createObject('component', 'CourseDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.CourseGW = createObject('component', 'CourseGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Course into the database">
		<cfargument name="course" required="YES"
          type="com.csr.oop.beans.Course" hint="I am the Course bean" />
          <cfreturn variables.instance.CourseDAO.saveCourse(arguments.course) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Course from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Course you wish to search for" />
       <cfreturn variables.instance.CourseDAO.getCourseByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Course from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Course you wish to delete" />
       <cfreturn variables.instance.CourseDAO.deleteCourseByID(arguments.ID) />
    </cffunction>
            

  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryCourse" access="public" output="NO"
       hint="I run a query of every Course within the database table">
       <!--- Call the query method from the Course gateway and return the query object  --->
	   <cfreturn variables.instance.CourseGW.getEveryCourse() />
	</cffunction>
    
    <cffunction name="filterByTermCourseSect" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on the termCodeID classSchedDescription name
         and course section" >
       <cfargument name="tCS1Filter"  required="YES"  TYPE="NUMERIC"
          hint="I am the termCourseSect1 filter" />
       <cfargument name="tCS2Filter" REQUIRED="YES" TYPE="STRING"
          HINT="I am the termCourseSect2 filter" />
       <cfargument name="tCS3Filter" REQUIRED="YES" TYPE="STRING"
          HINT="I am the termCourseSect3 filter" />    
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.CourseGW.filterByTermCourseSect(tCS1Filter, tCS2Filter, tCS3Filter) />
    </cffunction> 

    <cffunction name="filterByClassSchedDescrip" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on the classSchedDescription name" >
       <cfargument name="classSchedDescripFilter"  required="YES" type="STRING"
          hint="I am the classSchedDescrip filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.CourseGW.filterByClassSchedDescrip(classSchedDescripFilter) />
    </cffunction> 

    <cffunction name="filterByCode" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on their code" >
       <cfargument name="codeFilter"  required="YES" type="STRING"
          hint="I am the course code filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.CourseGW.filterByCode(codeFilter) />
    </cffunction> 
     
    <cffunction name="filterByCourseCode" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on their course courseCode" >
       <cfargument name="courseCodeFilter"  required="YES" type="STRING"
          hint="I am the course courseCode filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.CourseGW.filterByCourseCode(courseCodeFilter) />
    </cffunction>      
     
    <cffunction name="filterByCourseDescrip" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on their course description" >
       <cfargument name="courseDescripFilter"  required="YES" type="STRING"
          hint="I am the course description filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.CourseGW.filterByCourseDescrip(courseDescripFilter) />
    </cffunction>
    
    <cffunction name="filterByAdClassSchedID" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on their adClassSchedID" >
       <cfargument name="adClassSchedIDFilter"  required="YES" type="STRING"
          hint="I am the adClassSchedID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.CourseGW.filterByAdClassSchedID(adClassSchedIDFilter) />
    </cffunction>                    
     
    <cffunction name="filterByRoomNumber" access="PUBLIC" output="NO" 
       hint="I run a query of every Class based on their room" >
       <cfargument name="roomNumberFilter"  required="YES" type="STRING"
          hint="I am the room number filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassGW.filterByRoomNumber(roomNumberFilter) />
    </cffunction>      
     
    <cffunction name="filterByCSection" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on their section" >
       <cfargument name="cSectionFilter"  required="YES" type="STRING"
          hint="I am the cSection filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.CourseGW.filterByCSection(cSectionFilter) />
    </cffunction>                       

    <cffunction name="filterByBuildingID" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on building ID" >
       <cfargument name="buildingIDFilter"  required="YES" type="NUMERIC"
          hint="I am the class building ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassGW.filterByBuildingID(buildingIDFilter) />
    </cffunction>      
     
    <cffunction name="filterByMeetTimeID" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on the meet time ID" >
       <cfargument name="meetTimeIDFilter"  required="YES" type="NUMERIC"
          hint="I am the meet time ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassGW.filterByMeetTimeID(meetTimeIDFilter) />
    </cffunction>      
     
    <cffunction name="filterByStartTimeID" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on their start time ID" >
       <cfargument name="startTimeIDFilter"  required="YES" type="NUMERIC"
          hint="I am the start time ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassGW.filterByStartTimeID(startTimeIDFilter) />
    </cffunction>      
     
    <cffunction name="filterByEndTimeID" access="PUBLIC" output="NO" 
       hint="I run a query of every Class based on their end time" >
       <cfargument name="endTimeIDFilter"  required="YES" type="NUMERIC"
          hint="I am the end time ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassGW.filterByEndTimeID(endTimeIDFilter) />
    </cffunction>      
     
    <cffunction name="filterByDaysID" access="PUBLIC" output="NO" 
       hint="I run a query of every course based on their days ID" >
       <cfargument name="daysIDFilter"  required="YES" type="NUMERIC"
          hint="I am the days ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassGW.filterByDaysID(daysIDFilter) />
    </cffunction>      
     
    <cffunction name="filterByDay_orderID" access="PUBLIC" output="NO" 
       hint="I run a query of every course based on their day order code" >
       <cfargument name="day_orderIDFilter"  required="YES" type="NUMERIC"
          hint="I am the day_order ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassGW.filterByDay_orderID(day_orderIDFilter) />
    </cffunction> 
    
    <cffunction name="filterByClassStartID" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on their class start date" >
       <cfargument name="classStartIDFilter"  required="YES" type="NUMERIC"
          hint="I am the class start date filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.CourseGW.filterByClassStartID(classStartIDFilter) />
    </cffunction>                    
     
    <cffunction name="filterByClassEndID" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on their class end date" >
       <cfargument name="classEndIDFilter"  required="YES" type="NUMERIC"
          hint="I am the class end date filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.CourseGW.filterByClassEndID(classEndIDFilter) />
    </cffunction>                    
     
     <cffunction name="filterByTermCodeID" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on their term code" >
       <cfargument name="termCodeIDFilter"  required="YES" type="NUMERIC"
          hint="I am the term code ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.CourseGW.filterByTermCodeID(termCodeIDFilter) />
    </cffunction>                    
     
   <cffunction name="filterByTeacherID" access="PUBLIC" output="NO" 
       hint="I run a query of every Course based on their teacher ID" >
       <cfargument name="teacherIDFilter"  required="YES" type="NUMERIC"
          hint="I am the teacher ID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.CourseGW.filterByTeacherID(teacherIDFilter) />
    </cffunction>                    
     
</cfcomponent>