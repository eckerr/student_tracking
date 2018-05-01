<cfcomponent displayname="AdvisorService" output="NO"
   hint="I am the AdvisorSVC Class used to interact with the Advisor package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.AdvisorDAO = '' />
   <cfset variables.instance.AdvisorGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the AdvisorSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.AdvisorDAO = createObject('component', 'AdvisorDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.AdvisorGW = createObject('component', 'AdvisorGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update an Advisor into the database">
		<cfargument name="advisor" required="YES"
          type="com.csr.oop.beans.Advisor" hint="I am the Advisor bean" />
          <cfreturn variables.instance.AdvisorDAO.saveAdvisor(arguments.advisor) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Advisor from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Advisor you wish to search for" />
       <cfreturn variables.instance.AdvisorDAO.getAdvisorByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Advisor from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Advisor you wish to delete" />
       <cfreturn variables.instance.AdvisorDAO.deleteAdvisorByID(arguments.ID) />
    </cffunction>
            

  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryAdvisor" access="public" output="NO"
       hint="I run a query of every Advisor within the database table">
       <!--- Call the query method from the Advisor gateway and return the query object  --->
	   <cfreturn variables.instance.AdvisorGW.getEveryAdvisor() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every Advisor based on their name" >
       <cfargument name="nameFilter"  required="YES"   TYPE="STRING"
          hint="I am the name filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.AdvisorGW.filterByName(nameFilter) />
    </cffunction> 

    <cffunction name="filterByUsername" access="PUBLIC" output="NO" 
       hint="I run a query of every Advisor based on their username" >
       <cfargument name="usernameFilter"  required="YES" type="STRING"
          hint="I am the username filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.AdvisorGW.filterByUsername(usernameFilter) />
    </cffunction> 
     
    <cffunction name="filterByPassword" access="PUBLIC" output="NO" 
       hint="I run a query of every Advisor based on their password" >
       <cfargument name="passwordFilter"  required="YES" type="STRING"
          hint="I am the password filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.AdvisorGW.filterByPassword(passwordFilter) />
    </cffunction>      
     
    <cffunction name="FilterBySalt" access="PUBLIC" output="NO" 
       hint="I run a query of every Advisor based on their salt" >
       <cfargument name="saltFilter"  required="YES" type="STRING"
          hint="I am the salt filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.AdvisorGW.filterBySalt(saltFilter) />
    </cffunction>      
        
</cfcomponent>