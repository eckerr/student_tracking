<cfcomponent displayname="ProgramCodeService" output="NO"
   hint="I am the ProgramCodeSVC Class used to interact with the ProgramCode package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.ProgramCodeDAO = '' />
   <cfset variables.instance.ProgramCodeGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the ProgramCodeSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.ProgramCodeDAO = createObject('component', 'ProgramCodeDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.ProgramCodeGW = createObject('component', 'ProgramCodeGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a ProgramCode into the database">
		<cfargument name="programCode" required="YES"
          type="com.csr.oop.beans.ProgramCode" hint="I am the ProgramCode bean" />
          <cfreturn variables.instance.ProgramCodeDAO.saveProgramCode(arguments.programCode) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific ProgramCode from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the ProgramCode you wish to search for" />
       <cfreturn variables.instance.ProgramCodeDAO.getProgramCodeByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific ProgramCode from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the ProgramCode you wish to delete" />
       <cfreturn variables.instance.ProgramCodeDAO.deleteProgramCodeByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryProgramCode" access="public" output="NO"
       hint="I run a query of every ProgramCode within the database table">
       <!--- Call the query method from the ProgramCode gateway and return the query object  --->
	   <cfreturn variables.instance.ProgramCodeGW.getEveryProgramCode() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every ProgramCode based on their programCode Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ProgramCodeGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>