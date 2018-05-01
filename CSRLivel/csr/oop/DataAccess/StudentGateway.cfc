<cfcomponent displayname="StudentGateway" output="NO"
   hint="I am the StudentGateway Class">

   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.datasource = '' />
   
	<cffunction name="init" access="public" output="NO" 
       returntype="any" hint="I am the constructor method for the 
           StudentGateway Class"> 
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
    <cffunction name="getEveryStudent" access="PUBLIC" output="NO"
       hint="I run a query of every Student within the database table">
       <cfreturn filterEveryStudent() />
     </cffunction>
     
     <cffunction name="filterByDobMonth" access="PUBLIC" output="NO"
         hint="I run a query of every Student within the database table based upon a 
            required filter">
         <cfargument name="dobMonthFilter" required="YES" type="STRING" 
             hint="I am the birth month filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var StudentFilter = structNew()/>
             <cfset StudentFilter.dobMonth = arguments.dobMonthFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryStudent(filter = StudentFilter) />
             </cffunction>   
             
          <cffunction name="filterByProgramDescrip" access="PUBLIC" 
             output="NO" hint="I filter by students program description (major)" >
                <cfargument name="programDescripFilter" required="YES" type="STRING"
                   hint="I am the program descrip (major) to search for" />
                <!--- Create and populate a structure object containing the filter to pass through --->
                <cfset var StudentFilter = structNew()>
                <cfset StudentFilter.programDescrip = arguments.programDescrip />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryStudent(filter = StudentFilter) />
             </cffunction>

     <cffunction name="filterByStudentName" access="PUBLIC" output="NO"
         hint="I run a query of every Student within the database table based upon a 
            required filter  -- Student Name ">
         <cfargument name="studentNameFilter" required="YES" type="STRING" 
             hint="I am the studentName filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.studentName = arguments.studentNameFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryStudent(filter) />
             </cffunction>   
                             
         
         <!--- PRIVATE METHODS --->
         <cffunction name="filterEveryStudent" access="PRIVATE" output="NO"
          hint="I run a query and will return all Student records. If a filter 
             has been applied, I will refine the search using the filter information 
             sent to me">
             <cfargument name="filter" required="NO" type="STRUCT" 
                default="#structNew()#"  hint="I am a structure used to filter the query" />
 			 <cfset var encStudentName = ''/>
             <cfset var qSearch = '' />
                <cfquery name="qSearch" 
                   datasource="#variables.instance.datasource.getDSName()#" 
                   username="#variables.instance.datasource.getUsername()#" 
                   password="#variables.instance.datasource.getPassword()#" >
                   SELECT  ID, studentName, addr1, sCity, state, zip, phone, workPhone, otherPhone, mobileNumber, stuNum,
                   programDescrip, shiftDescrip, sexDesc, dateStarted, expDateStart, enrollStat, gradeLevel, email, 
                   otherEmail, sap, dob, dobMonth, statusDesc, lda
                   FROM Tbl_Student

                   WHERE 1 = 1
                         
                <cfif NOT structIsEmpty(arguments.filter)>
                   <!--- A filter has been provided. Let's find out which filter it is, 
				      and apply the necessary clause to the SQL  --->
                      <!--- Perform a LIKE comparison on the dobMonth  --->
                                 
                      <cfif structKeyExists(arguments.filter, 'dobMonth')>
                          AND dobMonth LIKE 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.dobMonth#" />
                     </cfif>
                     <!--- Here, we want to find exact program description matches  --->
                     <cfif structKeyExists(arguments.filter, 'programDescrip')>
                          AND programDescrip = 
                         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.programDescrip#" />
                    </cfif>
                      <!--- Perform an exact comparison on the studentName  --->
                      <cfif structKeyExists(arguments.filter, 'studentName')>
                          <cfset encStudentName = Encrypt ("#Trim(arguments.filter.studentName)#", "#Application.key#") />
                          AND studentName = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#encStudentName#" />
                     </cfif>
                   
                   </cfif>
                     </cfquery>            
                 <cfreturn #qSearch# />
             </cffunction>
</cfcomponent>