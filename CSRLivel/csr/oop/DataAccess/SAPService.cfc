<cfcomponent displayname="SAPService" output="NO"
   hint="I am the SAPSVC Class used to interact with the SAP package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.SAPDAO = '' />
   <cfset variables.instance.SAPGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the SAPSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.SAPDAO = createObject('component', 'SAPDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.SAPGW = createObject('component', 'SAPGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a SAP into the database">
		<cfargument name="sap" required="YES"
          type="com.csr.oop.beans.SAP" hint="I am the SAP bean" />
          <cfreturn variables.instance.SAPDAO.saveSAP(arguments.sap) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific SAP from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the SAP you wish to search for" />
       <cfreturn variables.instance.SAPDAO.getSAPByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific SAP from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the SAP you wish to delete" />
       <cfreturn variables.instance.SAPDAO.deleteSAPByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEverySAP" access="public" output="NO"
       hint="I run a query of every SAP within the database table">
       <!--- Call the query method from the SAP gateway and return the query object  --->
	   <cfreturn variables.instance.SAPGW.getEverySAP() />
	</cffunction>
    
    <cffunction name="filterBySAPText" access="PUBLIC" output="NO" 
       hint="I run a query of every SAP based on their meet sap" >
       <cfargument name="sapTextFilter"  required="YES" type="STRING"
          hint="I am the meet sap filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.SAPGW.filterBySAPText(sapTextFilter) />
    </cffunction> 
    
            
</cfcomponent>