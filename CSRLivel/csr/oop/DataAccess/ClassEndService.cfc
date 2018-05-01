<cfcomponent displayname="ClassEndService" output="NO"
   hint="I am the ClassEndSVC Class used to interact with the ClassEnd package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.ClassEndDAO = '' />
   <cfset variables.instance.ClassEndGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the ClassEndSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.ClassEndDAO = createObject('component', 'ClassEndDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.ClassEndGW = createObject('component', 'ClassEndGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a ClassEnd into the database">
		<cfargument name="classEnd" required="YES"
          type="com.csr.oop.beans.ClassEnd" hint="I am the ClassEnd bean" />
          <cfreturn variables.instance.ClassEndDAO.saveClassEnd(arguments.classEnd) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific ClassEnd from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the ClassEnd you wish to search for" />
       <cfreturn variables.instance.ClassEndDAO.getClassEndByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific ClassEnd from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the ClassEnd you wish to delete" />
       <cfreturn variables.instance.ClassEndDAO.deleteClassEndByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryClassEnd" access="public" output="NO"
       hint="I run a query of every ClassEnd within the database table">
       <!--- Call the query method from the ClassEnd gateway and return the query object  --->
	   <cfreturn variables.instance.ClassEndGW.getEveryClassEnd() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every ClassEnd based on their classEnd Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassEndGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>