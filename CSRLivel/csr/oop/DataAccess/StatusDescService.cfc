<cfcomponent displayname="StatusDescService" output="NO"
   hint="I am the StatusDescSVC Class used to interact with the StatusDesc package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.StatusDescDAO = '' />
   <cfset variables.instance.StatusDescGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the StatusDescSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.StatusDescDAO = createObject('component', 'StatusDescDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.StatusDescGW = createObject('component', 'StatusDescGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a StatusDesc into the database">
		<cfargument name="statusDesc" required="YES"
          type="com.csr.oop.beans.StatusDesc" hint="I am the StatusDesc bean" />
          <cfreturn variables.instance.StatusDescDAO.saveStatusDesc(arguments.statusDesc) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific StatusDesc from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the StatusDesc you wish to search for" />
       <cfreturn variables.instance.StatusDescDAO.getStatusDescByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific StatusDesc from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the StatusDesc you wish to delete" />
       <cfreturn variables.instance.StatusDescDAO.deleteStatusDescByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryStatusDesc" access="public" output="NO"
       hint="I run a query of every StatusDesc within the database table">
       <!--- Call the query method from the StatusDesc gateway and return the query object  --->
	   <cfreturn variables.instance.StatusDescGW.getEveryStatusDesc() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every StatusDesc based on their statusDesc Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.StatusDescGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>