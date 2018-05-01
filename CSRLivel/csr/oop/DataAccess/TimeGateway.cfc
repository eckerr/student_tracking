<cfcomponent displayname="TimeGateway" output="NO"
   hint="I am the TimeGateway Class">

   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.datasource = '' />
   
	<cffunction name="init" access="public" output="NO" 
       returntype="any" hint="I am the constructor method for the 
           TimeGateway Class"> 
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
    <cffunction name="getEveryTime" access="PUBLIC" output="NO"
       hint="I run a query of every Time within the database table">
       <cfreturn filterEveryTime() />
     </cffunction>
     
     <cffunction name="filterByTMeet" access="PUBLIC" output="NO"
         hint="I run a query of every Time within the database table based upon a 
            required filter  -- meet time ">
         <cfargument name="tMeetFilter" required="YES" type="STRING" 
             hint="I am the meet time filter" /> 
             <!--- Create and populate a structure object containing the filter to pass through  --->
             <cfset var filter = structNew()/>
             <cfset filter.tMeet = arguments.tMeetFilter />
             <!--- Send the structure into the query method and return the query object --->
                <cfreturn filterEveryTime(filter) />
             </cffunction>   
                                         
         <!--- PRIVATE METHODS --->
         <cffunction name="filterEveryTime" access="PRIVATE" output="NO"
          hint="I run a query and will return all Time records. If a filter 
             has been applied, I will refine the search using the filter information 
             sent to me">
             <cfargument name="filter" required="NO" type="STRUCT" 
                default="#structNew()#"  hint="I am a structure used to filter the query" />
             <cfset var qSearch = '' />
                <cfquery name="qSearch" 
                   datasource="#variables.instance.datasource.getDSName()#" 
                   username="#variables.instance.datasource.getUsername()#" 
                   password="#variables.instance.datasource.getPassword()#" >
                   SELECT  ID, tMeet
      				FROM Tbl_Time
                   WHERE 1 = 1
                         
                <cfif NOT structIsEmpty(arguments.filter)>
                   <!--- A filter has been provided. Let's find out which filter it is, 
				      and apply the necessary clause to the SQL  --->
                      

                      <!--- Perform an exact match on the time name  --->
                      <cfif structKeyExists(arguments.filter, 'tMeet')>
                          AND tMeet = 
                          <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
                            VALUE="#arguments.filter.tMeet#" />
                     </cfif>
                     
                   </cfif>                 
                 </cfif>
                 </cfquery>            
                 <cfreturn #qSearch# />
             </cffunction>
</cfcomponent>