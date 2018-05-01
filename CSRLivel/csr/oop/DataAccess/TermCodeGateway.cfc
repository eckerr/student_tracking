<cfcomponent displayname="TermCodeGateway" output="NO"
   hint="I am the TermCodeGateway Class">

   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.datasource = '' />
   
	<cffunction name="init" access="public" output="NO" 
       returntype="any" hint="I am the constructor method for the 
           TermCodeGateway Class"> 
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
    <cffunction name="getEveryTermCode" access="PUBLIC" output="NO"
       hint="I run a query of every TermCode within the database table">
       <cfreturn filterEveryTermCode() />
     </cffunction>
     
     <cffunction name="filterByName" access="PUBLIC" output="NO"
         hint="I run a query of every TermCode within the database table based upon a 
            required filter  -- TermCode Name ">
         <cfargument name="nameFilter" required="YES" type="STRING" 
             hint="I am the termCode name filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.name = arguments.nameFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryTermCode(filter) />
     </cffunction>   
                                         
         <!--- PRIVATE METHODS --->
         <cffunction name="filterEveryTermCode" access="PRIVATE" output="NO"
          hint="I run a query and will return all TermCode records. If a filter 
             has been applied, I will refine the search using the filter information 
             sent to me">
             <cfargument name="filter" required="NO" type="STRUCT" 
                default="#structNew()#"  hint="I am a structure used to filter the query" />
             <cfset var qSearch = '' />
                <cfquery name="qSearch" 
                   datasource="#variables.instance.datasource.getDSName()#" 
                   username="#variables.instance.datasource.getUsername()#" 
                   password="#variables.instance.datasource.getPassword()#" >
                   SELECT  ID, name
      				FROM Tbl_TermCode
                   WHERE 1 = 1
                         
                <cfif NOT structIsEmpty(arguments.filter)>
                   <!--- A filter has been provided. Let's find out which filter it is, 
				      and apply the necessary clause to the SQL  --->
                      

                      <!--- Perform an exact match on the termCode name  --->
                      <cfif structKeyExists(arguments.filter, 'name')>
                          AND name = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.name#" />
                     </cfif>
                
                 </cfif>
                 </cfquery>            
                 <cfreturn #qSearch# />
        </cffunction>
</cfcomponent>