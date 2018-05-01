<cfcomponent displayname="DaysService" output="NO"
   hint="I am the DaysSVC Class used to interact with the Days package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.DaysDAO = '' />
   <cfset variables.instance.DaysGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the DaysSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.DaysDAO = createObject('component', 'DaysDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.DaysGW = createObject('component', 'DaysGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Days into the database">
		<cfargument name="days" required="YES"
          type="com.csr.oop.beans.Days" hint="I am the Days bean" />
          <cfreturn variables.instance.DaysDAO.saveDays(arguments.days) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Days from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Days you wish to search for" />
       <cfreturn variables.instance.DaysDAO.getDaysByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Days from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Days you wish to delete" />
       <cfreturn variables.instance.DaysDAO.deleteDaysByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryDays" access="public" output="NO"
       hint="I run a query of every Days within the database table">
       <!--- Call the query method from the Days gateway and return the query object  --->
	   <cfreturn variables.instance.DaysGW.getEveryDays() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every Days based on their days Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.DaysGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>