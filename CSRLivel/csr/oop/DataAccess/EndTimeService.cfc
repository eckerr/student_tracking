<cfcomponent displayname="EndTimeService" output="NO"
   hint="I am the EndTimeSVC Class used to interact with the EndTime package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.EndTimeDAO = '' />
   <cfset variables.instance.EndTimeGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the EndTimeSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.EndTimeDAO = createObject('component', 'EndTimeDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.EndTimeGW = createObject('component', 'EndTimeGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a EndTime into the database">
		<cfargument name="endTime" required="YES"
          type="com.csr.oop.beans.EndTime" hint="I am the EndTime bean" />
          <cfreturn variables.instance.EndTimeDAO.saveEndTime(arguments.endTime) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific EndTime from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the EndTime you wish to search for" />
       <cfreturn variables.instance.EndTimeDAO.getEndTimeByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific EndTime from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the EndTime you wish to delete" />
       <cfreturn variables.instance.EndTimeDAO.deleteEndTimeByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryEndTime" access="public" output="NO"
       hint="I run a query of every EndTime within the database table">
       <!--- Call the query method from the EndTime gateway and return the query object  --->
	   <cfreturn variables.instance.EndTimeGW.getEveryEndTime() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every EndTime based on their endTime Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EndTimeGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>