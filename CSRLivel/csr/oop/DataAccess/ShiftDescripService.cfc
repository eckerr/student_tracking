<cfcomponent displayname="ShiftDescripService" output="NO"
   hint="I am the ShiftDescripSVC Class used to interact with the ShiftDescrip package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.ShiftDescripDAO = '' />
   <cfset variables.instance.ShiftDescripGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the ShiftDescripSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.ShiftDescripDAO = createObject('component', 'ShiftDescripDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.ShiftDescripGW = createObject('component', 'ShiftDescripGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a ShiftDescrip into the database">
		<cfargument name="shiftDescrip" required="YES"
          type="com.csr.oop.beans.ShiftDescrip" hint="I am the ShiftDescrip bean" />
          <cfreturn variables.instance.ShiftDescripDAO.saveShiftDescrip(arguments.shiftDescrip) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific ShiftDescrip from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the ShiftDescrip you wish to search for" />
       <cfreturn variables.instance.ShiftDescripDAO.getShiftDescripByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific ShiftDescrip from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the ShiftDescrip you wish to delete" />
       <cfreturn variables.instance.ShiftDescripDAO.deleteShiftDescripByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryShiftDescrip" access="public" output="NO"
       hint="I run a query of every ShiftDescrip within the database table">
       <!--- Call the query method from the ShiftDescrip gateway and return the query object  --->
	   <cfreturn variables.instance.ShiftDescripGW.getEveryShiftDescrip() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every ShiftDescrip based on their shiftDescrip Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ShiftDescripGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>