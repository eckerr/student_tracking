<cfcomponent displayname="MajorGateway" output="NO"
   hint="I am the MajorGateway Class">

   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.datasource = '' />
   
	<cffunction name="init" access="public" output="NO" 
       returntype="any" hint="I am the constructor method for the 
           MajorGateway Class"> 
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
    <cffunction name="getEveryMajor" access="PUBLIC" output="NO"
       hint="I run a query of every Major within the database table">
       <cfreturn filterEveryMajor() />
     </cffunction>
     
     <cffunction name="filterByCode" access="PUBLIC" output="NO"
         hint="I run a query of every Major within the database table based upon a 
            required filter">
         <cfargument name="codeFilter" required="YES" type="STRING" 
             hint="I am the code filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var MajorFilter = structNew()/>
             <cfset MajorFilter.code = arguments.codeFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryMajor(filter = MajorFilter) />
             </cffunction> 
             
     <cffunction name="filterByName" access="PUBLIC" output="NO"
         hint="I run a query of every Major within the database table based upon a 
            required filter  -- Major Name ">
         <cfargument name="nameFilter" required="YES" type="STRING" 
             hint="I am the major name filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.name = arguments.nameFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryMajor(filter) />
             </cffunction>   
                                         
          <cffunction name="filterByProgramDescrip" access="PUBLIC" 
             output="NO" hint="I filter by majors program description (major)" >
                <cfargument name="programDescripFilter" required="YES" type="STRING"
                   hint="I am the program descrip (major) to search for" />
                <!--- Create and populate a structure object containing the filter to pass through --->
                <cfset var MajorFilter = structNew()>
                <cfset MajorFilter.programDescrip = arguments.programDescripFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryMajor(filter = MajorFilter) />
             </cffunction>

     <cffunction name="filterByProgramCode" access="PUBLIC" output="NO"
         hint="I run a query of every Major within the database table based upon a 
            required filter  -- program code ">
         <cfargument name="programCodeFilter" required="YES" type="STRING" 
             hint="I am the major program code filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.programCode = arguments.programCodeFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryMajor(filter) />
             </cffunction>   
                             
     <cffunction name="filterByAdvisorID" access="PUBLIC" output="NO"
         hint="I run a query of every Major within the database table based upon a 
            required filter  -- advisor Id ">
         <cfargument name="advisorIDFilter" required="YES" type="STRING" 
             hint="I am the advisor ID filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.advisorID = arguments.advisorIDFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryMajor(filter) />
             </cffunction>   
                                    
         <!--- PRIVATE METHODS --->
         <cffunction name="filterEveryMajor" access="PRIVATE" output="NO"
          hint="I run a query and will return all Major records. If a filter 
             has been applied, I will refine the search using the filter information 
             sent to me">
             <cfargument name="filter" required="NO" type="STRUCT" 
                default="#structNew()#"  hint="I am a structure used to filter the query" />
             <cfset var qSearch = '' />
                <cfquery name="qSearch" 
                   datasource="#variables.instance.datasource.getDSName()#" 
                   username="#variables.instance.datasource.getUsername()#" 
                   password="#variables.instance.datasource.getPassword()#" >
                   SELECT  ID, code, name, programDescrip, programCode, advisorID
      				FROM Tbl_Major
                   WHERE 1 = 1
                         
                <cfif NOT structIsEmpty(arguments.filter)>
                   <!--- A filter has been provided. Let's find out which filter it is, 
				      and apply the necessary clause to the SQL  --->
                      
                      <!--- Perform an exact match on the code  --->                                
                      <cfif structKeyExists(arguments.filter, 'code')>
                          AND code =  
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.code#" />
                     </cfif>
                      <!--- Perform an exact match on the major name  --->
                      <cfif structKeyExists(arguments.filter, 'name')>
                          AND name = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.name#" />
                     </cfif>
                     
                     <!--- Here, we want to find exact program description matches  --->
                     <cfif structKeyExists(arguments.filter, 'programDescrip')>
                          AND programDescrip = 
                         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.programDescrip#" />
                    </cfif>
                   
                     <!--- Here, we want to find exact program code matches  --->
                     <cfif structKeyExists(arguments.filter, 'programCode')>
                          AND programCode = 
                         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.programCode#" />
                    </cfif>
                     <!--- Here, we want to find exact advisor ID matches  --->
                     <cfif structKeyExists(arguments.filter, 'advisorID')>
                          AND advisorID = 
                         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.advisorID#" />
                    </cfif>                 
                 </cfif>
                 </cfquery>            
                 <cfreturn #qSearch# />
             </cffunction>
</cfcomponent>