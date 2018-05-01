<cfcomponent displayname="ClassGateway" output="NO"
   hint="I am the ClassGateway Class">

   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.datasource = '' />
   
	<cffunction name="init" access="public" output="NO" 
       returntype="any" hint="I am the constructor method for the 
           ClassGateway Class"> 
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
    <cffunction name="getEveryClass" access="PUBLIC" output="NO"
       hint="I run a query of every Class within the database table">
       <cfreturn filterEveryClass() />
     </cffunction>
     
     <cffunction name="filterByStudentID" access="PUBLIC" output="NO"
         hint="I run a query of every Class within the database table based upon a 
            required filter">
         <cfargument name="studentIDFilter" required="YES"  TYPE="NUMERIC" 
             hint="I am the studentID filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var ClassFilter = structNew()/>
             <cfset ClassFilter.studentID = arguments.studentIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter = ClassFilter) />
             </cffunction>   
             
      <cffunction name="filterByProgramCodeID" access="PUBLIC" 
             output="NO" hint="I filter by programCodeID" >
                <cfargument name="programCodeIDFilter" required="YES" type="NUMERIC"
                   hint="I am the programCodeID to search for" />
                <!--- Create and populate a structure object containing the filter to pass through --->
                <cfset var ClassFilter = structNew()>
                <cfset ClassFilter.programCodeID = arguments.programCodeID />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter = ClassFilter) />
       </cffunction>

       <cffunction name="filterByCourseID" access="PUBLIC" 
             output="NO" hint="I filter by courseID" >
                <cfargument name="courseIDFilter" required="YES" type="STRING"
                   hint="I am the courseID to search for" />
                <!--- Create and populate a structure object containing the filter to pass through --->
                <cfset var ClassFilter = structNew()>
                <cfset ClassFilter.courseID = arguments.courseID />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryClass(filter = ClassFilter) />
       </cffunction>
                                              
         <!--- PRIVATE METHODS --->
         <cffunction name="filterEveryClass" access="PRIVATE" output="NO"
          hint="I run a query and will return all Class records. If a filter 
             has been applied, I will refine the search using the filter information 
             sent to me">
             <cfargument name="filter" required="NO" type="STRUCT" 
                default="#structNew()#"  hint="I am a structure used to filter the query" />
 			 <cfset var encClassName = ''/>
             <cfset var qSearch = '' />
                <cfquery name="qSearch" 
                   datasource="#variables.instance.datasource.getDSName()#" 
                   username="#variables.instance.datasource.getUsername()#" 
                   password="#variables.instance.datasource.getPassword()#" >
                   SELECT  ID, studentID, programCodeID, courseID
                   FROM Tbl_Class

                   WHERE 1 = 1
       
                <cfif NOT structIsEmpty(arguments.filter)>
                   <!--- A filter has been provided. Let's find out which filter it is, 
				      and apply the necessary clause to the SQL  --->
                      <!--- Perform an exact match on the student lookup id  --->                            
                      <cfif structKeyExists(arguments.filter, 'studentID')>
                          AND studentID = 
                          <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.studentID#" />
                     </cfif>
                     <!--- Here, we want to find exact programCode lookup id matches  --->
                     <cfif structKeyExists(arguments.filter, 'programCodeID')>
                          AND programCodeID = 
                         <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.programCodeID#" />
                    </cfif>
                       <!--- Perform an exact match on the courseID lookup  --->
                      <cfif structKeyExists(arguments.filter, 'courseID')>
                          AND courseID = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
                            VALUE="#arguments.filter.courseID#" />
                     </cfif>
                   
                   </cfif>
                     </cfquery>            
                 <cfreturn #qSearch# />
             </cffunction>
</cfcomponent>