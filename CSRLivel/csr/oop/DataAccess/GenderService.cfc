<cfcomponent displayname="GenderService" output="NO"
   hint="I am the GenderSVC Class used to interact with the Gender package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.GenderDAO = '' />
   <cfset variables.instance.GenderGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the GenderSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.GenderDAO = createObject('component', 'GenderDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.GenderGW = createObject('component', 'GenderGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Gender into the database">
		<cfargument name="gender" required="YES"
          type="com.csr.oop.beans.Gender" hint="I am the Gender bean" />
          <cfreturn variables.instance.GenderDAO.saveGender(arguments.gender) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Gender from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Gender you wish to search for" />
       <cfreturn variables.instance.GenderDAO.getGenderByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Gender from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Gender you wish to delete" />
       <cfreturn variables.instance.GenderDAO.deleteGenderByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryGender" access="public" output="NO"
       hint="I run a query of every Gender within the database table">
       <!--- Call the query method from the Gender gateway and return the query object  --->
	   <cfreturn variables.instance.GenderGW.getEveryGender() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every Gender based on their gender Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.GenderGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>