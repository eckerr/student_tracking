<cfcomponent displayname="EnrollStatService" output="NO"
   hint="I am the EnrollStatSVC Class used to interact with the EnrollStat package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.EnrollStatDAO = '' />
   <cfset variables.instance.EnrollStatGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the EnrollStatSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.EnrollStatDAO = createObject('component', 'EnrollStatDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.EnrollStatGW = createObject('component', 'EnrollStatGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a EnrollStat into the database">
		<cfargument name="enrollStat" required="YES"
          type="com.csr.oop.beans.EnrollStat" hint="I am the EnrollStat bean" />
          <cfreturn variables.instance.EnrollStatDAO.saveEnrollStat(arguments.enrollStat) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific EnrollStat from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the EnrollStat you wish to search for" />
       <cfreturn variables.instance.EnrollStatDAO.getEnrollStatByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific EnrollStat from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the EnrollStat you wish to delete" />
       <cfreturn variables.instance.EnrollStatDAO.deleteEnrollStatByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryEnrollStat" access="public" output="NO"
       hint="I run a query of every EnrollStat within the database table">
       <!--- Call the query method from the EnrollStat gateway and return the query object  --->
	   <cfreturn variables.instance.EnrollStatGW.getEveryEnrollStat() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every EnrollStat based on their enrollStat Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.EnrollStatGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>