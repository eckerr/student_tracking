<cfcomponent displayname="AdvStatusService" output="NO"
   hint="I am the AdvStatusSVC Class used to interact with the AdvStatus package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.AdvStatusDAO = '' />
   <cfset variables.instance.AdvStatusGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the AdvStatusSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.AdvStatusDAO = createObject('component', 'AdvStatusDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.AdvStatusGW = createObject('component', 'AdvStatusGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a AdvStatus into the database">
		<cfargument name="advStatus" required="YES"
          type="com.csr.oop.beans.AdvStatus" hint="I am the AdvStatus bean" />
          <cfreturn variables.instance.AdvStatusDAO.saveAdvStatus(arguments.advStatus) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific AdvStatus from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the AdvStatus you wish to search for" />
       <cfreturn variables.instance.AdvStatusDAO.getAdvStatusByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific AdvStatus from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the AdvStatus you wish to delete" />
       <cfreturn variables.instance.AdvStatusDAO.deleteAdvStatusByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryAdvStatus" access="public" output="NO"
       hint="I run a query of every AdvStatus within the database table">
       <!--- Call the query method from the AdvStatus gateway and return the query object  --->
	   <cfreturn variables.instance.AdvStatusGW.getEveryAdvStatus() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every AdvStatus based on their advStatus Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.AdvStatusGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>