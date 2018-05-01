<cfcomponent displayname="InstructorGateway" output="NO"
   hint="I am the InstructorGateway Class">

   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.datasource = '' />
   
	<cffunction name="init" access="public" output="NO" 
       returntype="any" hint="I am the constructor method for the 
           InstructorGateway Class"> 
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
    <cffunction name="getEveryInstructor" access="PUBLIC" output="NO"
       hint="I run a query of every Instructor within the database table">
       <cfreturn filterEveryInstructor() />
     </cffunction>
     
      <cffunction name="filterByUserName" access="PUBLIC" 
             output="NO" hint="I filter by instructors user name" >
                <cfargument name="userNameFilter" required="YES" type="STRING"
                   hint="I am the userName to search for" />
                <!--- Create and populate a structure object containing the filter to pass through --->
                <cfset var InstructorFilter = structNew()>
                <cfset InstructorFilter.userName = arguments.userName />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryInstructor(filter = InstructorFilter) />
       </cffunction>

       <cffunction name="filterByPassword" access="PUBLIC" 
             output="NO" hint="I filter by instructors password" >
                <cfargument name="passwordFilter" required="YES" type="STRING"
                   hint="I am the password to search for" />
                <!--- Create and populate a structure object containing the filter to pass through --->
                <cfset var InstructorFilter = structNew()>
                <cfset InstructorFilter.password = arguments.password />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryInstructor(filter = InstructorFilter) />
       </cffunction>

      <cffunction name="filterBySalt" access="PUBLIC" 
         output="NO" hint="I filter by instructors password" >
            <cfargument name="saltFilter" required="YES" type="STRING"
               hint="I am the password to search for" />
            <!--- Create and populate a structure object containing the filter to pass through --->
            <cfset var InstructorFilter = structNew()>
            <cfset InstructorFilter.salt = arguments.salt />
            <!--- Send the structure into the query method and return the query object --->
            <cfreturn filterEveryInstructor(filter = InstructorFilter) />
     </cffunction>

     <cffunction name="filterByInstructor" access="PUBLIC" output="NO"
         hint="I run a query of every Instructor within the database table based upon a 
            required filter  -- instructor ">
         <cfargument name="instructorFilter" required="YES" type="STRING" 
             hint="I am the instructor filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.instructor = arguments.instructorFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryInstructor(filter) />
             </cffunction>   
                             
     <cffunction name="filterByTeacherDescrip" access="PUBLIC" output="NO"
         hint="I run a query of every Instructor within the database table based upon a 
            required filter  -- teacher description ">
         <cfargument name="teacherDescripFilter" required="YES" type="STRING" 
             hint="I am the teacher descriptive name filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.teacherDescrip = arguments.teacherDescripFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryInstructor(filter) />
             </cffunction>   
                             
     <cffunction name="filterByTeacherEmail" access="PUBLIC" output="NO"
         hint="I run a query of every Instructor within the database table based upon a 
            required filter  -- teacher email ">
         <cfargument name="teacherEmailFilter" required="YES" type="STRING" 
             hint="I am the teacher email filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.teacherEmail = arguments.teacherEmailFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryInstructor(filter) />
             </cffunction>   
                                      
         <!--- PRIVATE METHODS --->
         <cffunction name="filterEveryInstructor" access="PRIVATE" output="NO"
          hint="I run a query and will return all Instructor records. If a filter 
             has been applied, I will refine the search using the filter information 
             sent to me">
             <cfargument name="filter" required="NO" type="STRUCT" 
                default="#structNew()#"  hint="I am a structure used to filter the query" />
 			 <cfset var encInstructorName = ''/>
             <cfset var qSearch = '' />
                <cfquery name="qSearch" 
                   datasource="#variables.instance.datasource.getDSName()#" 
                   username="#variables.instance.datasource.getUsername()#" 
                   password="#variables.instance.datasource.getPassword()#" >
                   SELECT  ID, userName, password, salt, instructor, teacherDescrip, teacherEmail
                   FROM Tbl_Instructor

                   WHERE 1 = 1
       
                <cfif NOT structIsEmpty(arguments.filter)>
                   <!--- A filter has been provided. Let's find out which filter it is, 
				      and apply the necessary clause to the SQL  --->
                     <!--- Here, we want to find exact code matches  --->
                     <cfif structKeyExists(arguments.filter, 'userName')>
                          AND userName = 
                         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.userName#" />
                    </cfif>
                       <!--- Perform an exact match on the password  --->
                      <cfif structKeyExists(arguments.filter, 'password')>
                          AND password = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.password#" />
                     </cfif>
                   
                      <!--- Perform an exact match on the instructor salt  --->
                      <cfif structKeyExists(arguments.filter, 'salt')>
                          AND salt = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.salt#" />
                     </cfif>
                   
                      <!--- Perform an exact match on the instructor name  --->
                      <cfif structKeyExists(arguments.filter, 'instructor')>
                          AND instructor = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.instructor#" />
                     </cfif>
                   
                      <!--- Perform an exact comparison on the teacher description  --->
                      <cfif structKeyExists(arguments.filter, 'teacherDescrip')>
                          AND teacherDescrip = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.teacherDescrip#" />
                     </cfif>
                   
                    <!--- Perform an exact comparison on the teacher email  --->
                      <cfif structKeyExists(arguments.filter, 'teacherEmail')>
                          AND teacherEmail = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.teacherEmail#" />
                     </cfif>
                   
                   </cfif>
                     </cfquery>            
                 <cfreturn #qSearch# />
             </cffunction>
</cfcomponent>