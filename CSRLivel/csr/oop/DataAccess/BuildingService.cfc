<cfcomponent displayname="BuildingService" output="NO"
   hint="I am the BuildingSVC Class used to interact with the Building package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.BuildingDAO = '' />
   <cfset variables.instance.BuildingGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the BuildingSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.BuildingDAO = createObject('component', 'BuildingDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.BuildingGW = createObject('component', 'BuildingGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Building into the database">
		<cfargument name="building" required="YES"
          type="com.csr.oop.beans.Building" hint="I am the Building bean" />
          <cfreturn variables.instance.BuildingDAO.saveBuilding(arguments.building) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Building from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Building you wish to search for" />
       <cfreturn variables.instance.BuildingDAO.getBuildingByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Building from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Building you wish to delete" />
       <cfreturn variables.instance.BuildingDAO.deleteBuildingByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryBuilding" access="public" output="NO"
       hint="I run a query of every Building within the database table">
       <!--- Call the query method from the Building gateway and return the query object  --->
	   <cfreturn variables.instance.BuildingGW.getEveryBuilding() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every Building based on their building Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.BuildingGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>