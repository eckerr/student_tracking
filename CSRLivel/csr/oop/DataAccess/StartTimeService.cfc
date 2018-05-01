<cfcomponent displayname="StartTimeService" output="NO"
   hint="I am the StartTimeSVC Class used to interact with the StartTime package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.StartTimeDAO = '' />
   <cfset variables.instance.StartTimeGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the StartTimeSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.StartTimeDAO = createObject('component', 'StartTimeDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.StartTimeGW = createObject('component', 'StartTimeGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a StartTime into the database">
		<cfargument name="startTime" required="YES"
          type="com.csr.oop.beans.StartTime" hint="I am the StartTime bean" />
          <cfreturn variables.instance.StartTimeDAO.saveStartTime(arguments.startTime) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific StartTime from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the StartTime you wish to search for" />
       <cfreturn variables.instance.StartTimeDAO.getStartTimeByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific StartTime from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the StartTime you wish to delete" />
       <cfreturn variables.instance.StartTimeDAO.deleteStartTimeByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryStartTime" access="public" output="NO"
       hint="I run a query of every StartTime within the database table">
       <!--- Call the query method from the StartTime gateway and return the query object  --->
	   <cfreturn variables.instance.StartTimeGW.getEveryStartTime() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every StartTime based on their startTime Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.StartTimeGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>