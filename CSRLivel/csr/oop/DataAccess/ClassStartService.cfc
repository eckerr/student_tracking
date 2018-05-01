<cfcomponent displayname="ClassStartService" output="NO"
   hint="I am the ClassStartSVC Class used to interact with the ClassStart package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.ClassStartDAO = '' />
   <cfset variables.instance.ClassStartGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the ClassStartSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.ClassStartDAO = createObject('component', 'ClassStartDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.ClassStartGW = createObject('component', 'ClassStartGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a ClassStart into the database">
		<cfargument name="classStart" required="YES"
          type="com.csr.oop.beans.ClassStart" hint="I am the ClassStart bean" />
          <cfreturn variables.instance.ClassStartDAO.saveClassStart(arguments.classStart) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific ClassStart from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the ClassStart you wish to search for" />
       <cfreturn variables.instance.ClassStartDAO.getClassStartByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific ClassStart from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the ClassStart you wish to delete" />
       <cfreturn variables.instance.ClassStartDAO.deleteClassStartByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryClassStart" access="public" output="NO"
       hint="I run a query of every ClassStart within the database table">
       <!--- Call the query method from the ClassStart gateway and return the query object  --->
	   <cfreturn variables.instance.ClassStartGW.getEveryClassStart() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every ClassStart based on their classStart Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassStartGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>