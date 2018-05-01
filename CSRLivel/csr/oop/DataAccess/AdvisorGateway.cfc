<cfcomponent displayname="AdvisorGateway" output="NO"
   hint="I am the AdvisorGateway Class">

   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.datasource = '' />
   
	<cffunction name="init" access="public" output="NO" 
       returntype="any" hint="I am the constructor method for the 
           AdvisorGateway Class"> 
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
    <cffunction name="getEveryAdvisor" access="PUBLIC" output="NO"
       hint="I run a query of every Advisor within the database table">
       <cfreturn filterEveryAdvisor() />
     </cffunction>
     
     <cffunction name="filterByName" access="PUBLIC" output="NO"
         hint="I run a query of every Advisor within the database table based upon a 
            required filter">
         <cfargument name="nameFilter" required="YES"  TYPE="NUMERIC" 
             hint="I am the name filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var AdvisorFilter = structNew()/>
             <cfset AdvisorFilter.name = arguments.nameFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryAdvisor(filter = AdvisorFilter) />
             </cffunction>   
             
      <cffunction name="filterByUsername" access="PUBLIC" 
             output="NO" hint="I filter by username" >
                <cfargument name="usernameFilter" required="YES" type="NUMERIC"
                   hint="I am the username to search for" />
                <!--- Create and populate a structure object containing the filter to pass through --->
                <cfset var AdvisorFilter = structNew()>
                <cfset AdvisorFilter.username = arguments.username />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryAdvisor(filter = AdvisorFilter) />
       </cffunction>

       <cffunction name="filterByPassword" access="PUBLIC" 
             output="NO" hint="I filter by password" >
                <cfargument name="passwordFilter" required="YES" type="STRING"
                   hint="I am the password to search for" />
                <!--- Create and populate a structure object containing the filter to pass through --->
                <cfset var AdvisorFilter = structNew()>
                <cfset AdvisorFilter.password = arguments.password />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryAdvisor(filter = AdvisorFilter) />
       </cffunction>

     <cffunction name="filterBySalt" access="PUBLIC" output="NO"
         hint="I run a query of every Advisor within the database table based upon a 
            required filter  -- salt ">
         <cfargument name="saltFilter" required="YES" type="STRING" 
             hint="I am the password salt filter" /> 
             <!--- Create and populate a structure object containng the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.salt = arguments.saltFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryAdvisor(filter) />
             </cffunction>
                             
                                      
         <!--- PRIVATE METHODS --->
         <cffunction name="filterEveryAdvisor" access="PRIVATE" output="NO"
          hint="I run a query and will return all Advisor records. If a filter 
             has been applied, I will refine the search using the filter information 
             sent to me">
             <cfargument name="filter" required="NO" type="STRUCT" 
                default="#structNew()#"  hint="I am a structure used to filter the query" />
 			 <cfset var encAdvisorName = ''/>
             <cfset var qSearch = '' />
                <cfquery name="qSearch" 
                   datasource="#variables.instance.datasource.getDSName()#" 
                   username="#variables.instance.datasource.getUsername()#" 
                   password="#variables.instance.datasource.getPassword()#" >
                   SELECT  ID, name, username, password, salt
                   FROM Tbl_Advisor

                   WHERE 1 = 1
       
                <cfif NOT structIsEmpty(arguments.filter)>
                   <!--- A filter has been provided. Let's find out which filter it is, 
				      and apply the necessary clause to the SQL  --->

                     <!--- Perform an exact match on the advisor name  --->
                     <cfif structKeyExists(arguments.filter, 'name')>
                          AND name = 
                          <cfqueryparam  CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.name#" />
                     </cfif>
                     <!--- Here, we want to find exact username  --->
                     <cfif structKeyExists(arguments.filter, 'username')>
                          AND username = 
                         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.username#" />
                    </cfif>
                       <!--- Perform an exact match on the password  --->
                      <cfif structKeyExists(arguments.filter, 'password')>
                          AND password = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.password#" />
                     </cfif>
                   
                      <!--- Perform an exact match on the salt  --->
                      <cfif structKeyExists(arguments.filter, 'salt')>
                          AND salt = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.salt#" />
                     </cfif>
                  
                   </cfif>
                     </cfquery>            
                 <cfreturn #qSearch# />
             </cffunction>
</cfcomponent>