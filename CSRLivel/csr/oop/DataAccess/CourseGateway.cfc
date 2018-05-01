<cfcomponent displayname="CourseGateway" output="NO"
   hint="I am the CourseGateway Class">

   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.datasource = '' />
   
	<cffunction name="init" access="public" output="NO" 
       returntype="any" hint="I am the constructor method for the 
           CourseGateway Class"> 
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
    <cffunction name="getEveryCourse" access="PUBLIC" output="NO"
       hint="I run a query of every Course within the database table">
       <cfreturn filterEveryCourse() />
     </cffunction>

     <cffunction name="filterByTermCourseSect" access="PUBLIC" output="NO"
         hint="I run a query of every Course within the database table based upon a 
            required filter">
         <cfargument name="tCS1Filter" required="YES" type="STRING" 
             hint="I am the tcs term filter" />
         <cfargument name="tCS2Filter" required="YES" type="STRING" 
             hint="I am the tcs course filter" />
         <cfargument name="tCS3Filter" required="YES" type="STRING" 
             hint="I am the tcs section filter" />
     
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var CourseFilter = structNew()/>
             <cfset CourseFilter.termCourseSect.termCodeID = arguments.tCS1Filter />
             <cfset CourseFilter.termCourseSect.classSchedDescrip = arguments.tCS2Filter />
             <cfset CourseFilter.termCourseSect.cSection = arguments.tCS3Filter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryCourse(filter = CourseFilter) />
             </cffunction>   
                  
     <cffunction name="filterByClassSchedDescrip" access="PUBLIC" output="NO"
         hint="I run a query of every Course within the database table based upon a 
            required filter">
         <cfargument name="classSchedDescripFilter" required="YES" type="STRING" 
             hint="I am the class scheduling name filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var CourseFilter = structNew()/>
             <cfset CourseFilter.classSchedDescrip = arguments.classSchedDescripFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryCourse(filter = CourseFilter) />
             </cffunction>   
             
          <cffunction name="filterByCode" access="PUBLIC" 
             output="NO" hint="I filter by courses code" >
                <cfargument name="codeFilter" required="YES" type="STRING"
                   hint="I am the code to search for" />
                <!--- Create and populate a structure object containing the filter to pass through --->
                <cfset var CourseFilter = structNew()>
                <cfset CourseFilter.code = arguments.code />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryCourse(filter = CourseFilter) />
             </cffunction>

     <cffunction name="filterByCourseCode" access="PUBLIC" output="NO"
         hint="I run a query of every Course within the database table based upon a 
            required filter  -- course Code ">
         <cfargument name="courseCodeFilter" required="YES" type="STRING" 
             hint="I am the course code filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.courseCode = arguments.courseCodeFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryCourse(filter) />
             </cffunction>   
                             
     <cffunction name="filterByCourseDescrip" access="PUBLIC" output="NO"
         hint="I run a query of every Course within the database table based upon a 
            required filter  -- course description ">
         <cfargument name="courseDescripFilter" required="YES" type="STRING" 
             hint="I am the course description filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.courseDescrip = arguments.courseDescripFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryCourse(filter) />
             </cffunction>
             
     <cffunction name="filterByAdClassSchedID" access="PUBLIC" output="NO"
         hint="I run a query of every class within the database table based upon a 
            required filter  -- adClassSchedID ">
         <cfargument name="adClassSchedIDFilter" required="YES" type="STRING" 
             hint="I am the adClassSchedID filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.adClassSchedID = arguments.adClassSchedIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter) />
             </cffunction>   
                             
     <cffunction name="filterByRoomNumber" access="PUBLIC" output="NO"
         hint="I run a query of every Class within the database table based upon a 
            required filter  -- room ">
         <cfargument name="roomNumberFilter" required="YES" type="STRING" 
             hint="I am the room filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.room = arguments.roomNumberFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter) />
             </cffunction>   
                             
     <cffunction name="filterByCSection" access="PUBLIC" output="NO"
         hint="I run a query of every class within the database table based upon a 
            required filter  -- course Section ">
         <cfargument name="cSectionFilter" required="YES" type="STRING" 
             hint="I am the course section filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.cSection = arguments.cSectionFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter) />
             </cffunction>   
                             
      <cffunction name="filterByBuildingID" access="PUBLIC" 
         output="NO" hint="I filter by building" >
            <cfargument name="buildingIDFilter" required="YES" type="NUMERIC"
               hint="I am the password to search for" />
            <!--- Create and populate a structure object containing the filter to pass through --->
            <cfset var ClassFilter = structNew()>
            <cfset ClassFilter.buildingID = arguments.buildingID />
            <!--- Send the structure into the query method and return the query object --->
            <cfreturn filterEveryClass(filter = ClassFilter) />
     </cffunction>

     <cffunction name="filterByStartTimeID" access="PUBLIC" output="NO"
         hint="I run a query of every Class within the database table based upon a 
            required filter  -- start time ">
         <cfargument name="startTimeIDFilter" required="YES" type="NUMERIC" 
             hint="I am the start time filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.startTimeID = arguments.startTimeIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter) />
     </cffunction>   
                                      
     <cffunction name="filterByEndTimeID" access="PUBLIC" output="NO"
         hint="I run a query of every Class within the database table based upon a 
            required filter  -- end time ">
         <cfargument name="endTimeIDFilter" required="YES" type="NUMERIC" 
             hint="I am the end time filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.endTimeID = arguments.endTimeIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter) />
     </cffunction>   
                                      
     <cffunction name="filterByDaysID" access="PUBLIC" output="NO"
         hint="I run a query of every Class within the database table based upon a 
            required filter  -- start time ">
         <cfargument name="daysFilter" required="YES" type="NUMERIC" 
             hint="I am the days filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>

             <cfset filter.daysID = arguments.daysIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter) />
     </cffunction>   
                                      
     <cffunction name="filterByDay_orderID" access="PUBLIC" output="NO"
         hint="I run a query of every Class within the database table based upon a 
            required filter  -- day_orderID ">
         <cfargument name="day_orderIDFilter" required="YES" type="NUMERIC" 
             hint="I am the day_order filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.day_orderID = arguments.day_orderIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter) />
     </cffunction>
     
     <cffunction name="filterByClassStartID" access="PUBLIC" output="NO"
         hint="I run a query of every class within the database table based upon a 
            required filter  -- classStart ">
         <cfargument name="classStartIDFilter" required="YES" type="NUMERIC" 
             hint="I am the class start filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.classStartID = arguments.classStartIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter) />
             </cffunction>   
                             
     <cffunction name="filterByClassEndID" access="PUBLIC" output="NO"
         hint="I run a query of every class within the database table based upon a 
            required filter  -- classEnd ">
         <cfargument name="classEndIDFilter" required="YES" type="NUMERIC" 
             hint="I am the class end date filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.classEndID = arguments.classEndIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter) />
             </cffunction>   
                             
      <cffunction name="filterByTermCodeID" access="PUBLIC" output="NO"
         hint="I run a query of every class within the database table based upon a 
            required filter  -- term code ">
         <cfargument name="termCodeIDFilter" required="YES" type="NUMERIC" 
             hint="I am the term code filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.termCodeID = arguments.termCodeIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter) />
             </cffunction>   
                             
    <cffunction name="filterByTeacherID" access="PUBLIC" output="NO"
         hint="I run a query of every class within the database table based upon a 
            required filter  -- teacher ID ">
         <cfargument name="teacherIDFilter" required="YES" type="NUMERIC" 
             hint="I am the teacher filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.teacherID = arguments.teacherIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter) />
             </cffunction>   
                             
                                         
         
         <!--- PRIVATE METHODS --->
         <cffunction name="filterEveryCourse" access="PRIVATE" output="NO"
          hint="I run a query and will return all Course records. If a filter 
             has been applied, I will refine the search using the filter information 
             sent to me">
             <cfargument name="filter" required="NO" type="STRUCT" 
                default="#structNew()#"  hint="I am a structure used to filter the query" />
 			 <cfset var encCourseName = ''/>
             <cfset var qSearch = '' />
                <cfquery name="qSearch" 
                   datasource="#variables.instance.datasource.getDSName()#" 
                   username="#variables.instance.datasource.getUsername()#" 
                   password="#variables.instance.datasource.getPassword()#" >
                   SELECT  ID, classSchedDescrip, code, courseCode, courseDescrip,
                   adClassSchedID, roomNumber,  cSection, buildingID, startTimeID, endTimeID, 
                   daysID, day_orderID, classStartID, classEndID, termCodeID, teacherID
                   FROM Tbl_Course

                   WHERE 1 = 1

                <cfif NOT structIsEmpty(arguments.filter)>
                   <!--- A filter has been provided. Let's find out which filter it is, 
				      and apply the necessary clause to the SQL  --->
                      
                      <!--- Perform an exact match on the TermCourseSect  --->           
                      <cfif structKeyExists(arguments.filter, 'termCourseSect')>
                           AND termCodeID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.termCourseSect.termCodeID#" />
                          AND classSchedDescrip = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.termCourseSect.classSchedDescrip#" />
                          AND cSection = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.termCourseSect.cSection#" />    
                     </cfif>
                      <!--- Perform an exact match on the classSchedDescrip  --->           
                      <cfif structKeyExists(arguments.filter, 'classSchedDescrip')>
                          AND classSchedDescrip = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.classSchedDescrip#" />
                     </cfif>
                     <!--- Here, we want to find exact code matches  --->
                     <cfif structKeyExists(arguments.filter, 'code')>
                          AND code = 
                         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.code#" />
                    </cfif>
                   
                      <!--- Perform an exact match on the courseCode  --->
                      <cfif structKeyExists(arguments.filter, 'courseCode')>
                          AND courseCode = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.courseCode#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on the course description  --->
                      <cfif structKeyExists(arguments.filter, 'courseDescrip')>
                          AND courseDescrip = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.courseDescrip#" />
                     </cfif>

                      <!--- Perform an exact match on the adClassSchedID  --->
                      <cfif structKeyExists(arguments.filter, 'adClassSchedID')>
                          AND adClassSchedID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.adClassSchedID#" />
                     </cfif>                                                           
                     
                      <!--- Perform an exact match on the class room  --->
                      <cfif structKeyExists(arguments.filter, 'roomNumber')>
                          AND room = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.roomNumber#" />
                     </cfif>
                   
                      <!--- Perform an exact match on the class section  --->
                      <cfif structKeyExists(arguments.filter, 'cSection')>
                          AND cSection = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.cSection#" />
                     </cfif>                  

                      <!--- Perform an exact match on the class buildingID  --->
                      <cfif structKeyExists(arguments.filter, 'buildingID')>
                          AND buildingID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.buildingID#" />
                     </cfif>
                   
                     <!--- Perform an exact comparison on the start time ID  --->
                      <cfif structKeyExists(arguments.filter, 'startTimeID')>
                          AND startTimeID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.startTimeID#" />
                      </cfif>
                            
                    <!--- Perform an exact comparison on the end time  --->
                      <cfif structKeyExists(arguments.filter, 'endTimeID')>
                          AND endTimeID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.endTimeID#" />
                      </cfif>
                            
                    <!--- Perform an exact comparison on the days ID --->
                      <cfif structKeyExists(arguments.filter, 'daysID')>
                          AND daysID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.daysID#" />
                      </cfif>
                            
                   <!--- Perform an exact comparison on the day order ID --->
                      <cfif structKeyExists(arguments.filter, 'day_orderID')>
                          AND day_orderID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.day_orderID#" />                            
                     </cfif>
                     
                      <!--- Perform an exact match on the classStartID  --->
                      <cfif structKeyExists(arguments.filter, 'classStartID')>
                          AND classStartID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.classStartID#" />
                     </cfif>                                                           
                     
                      <!--- Perform an exact match on the classEnd ID --->
                      <cfif structKeyExists(arguments.filter, 'classEndID')>
                          AND classEndID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.classEndID#" />
                     </cfif>                                                           
                     
                      <!--- Perform an exact match on the term code ID --->
                      <cfif structKeyExists(arguments.filter, 'termCodeID')>
                          AND termCodeID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.termCodeID#" />
                     </cfif>                                                           
                     
                      <!--- Perform an exact match on the teacher ID --->
                      <cfif structKeyExists(arguments.filter, 'teacherID')>
                          AND teacherID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.teacherID#" />
                     </cfif>                                                           
                     
                   </cfif>
                     </cfquery>            
                 <cfreturn #qSearch# />
             </cffunction>
</cfcomponent>