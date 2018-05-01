<cfcomponent displayname="TermCodeService" output="NO"
   hint="I am the TermCodeSVC Class used to interact with the TermCode package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.TermCodeDAO = '' />
   <cfset variables.instance.TermCodeGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the TermCodeSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.TermCodeDAO = createObject('component', 'TermCodeDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.TermCodeGW = createObject('component', 'TermCodeGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a TermCode into the database">
		<cfargument name="termCode" required="YES"
          type="com.csr.oop.beans.TermCode" hint="I am the TermCode bean" />
          <cfreturn variables.instance.TermCodeDAO.saveTermCode(arguments.termCode) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific TermCode from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the TermCode you wish to search for" />
       <cfreturn variables.instance.TermCodeDAO.getTermCodeByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific TermCode from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the TermCode you wish to delete" />
       <cfreturn variables.instance.TermCodeDAO.deleteTermCodeByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryTermCode" access="public" output="NO"
       hint="I run a query of every TermCode within the database table">
       <!--- Call the query method from the TermCode gateway and return the query object  --->
	   <cfreturn variables.instance.TermCodeGW.getEveryTermCode() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every TermCode based on their termCode Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.TermCodeGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>