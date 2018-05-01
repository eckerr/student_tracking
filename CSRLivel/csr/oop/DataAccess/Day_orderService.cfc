<cfcomponent displayname="Day_orderService" output="NO"
   hint="I am the Day_orderSVC Class used to interact with the Day_order package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.Day_orderDAO = '' />
   <cfset variables.instance.Day_orderGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the Day_orderSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.Day_orderDAO = createObject('component', 'Day_orderDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.Day_orderGW = createObject('component', 'Day_orderGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Day_order into the database">
		<cfargument name="day_order" required="YES"
          type="com.csr.oop.beans.Day_order" hint="I am the Day_order bean" />
          <cfreturn variables.instance.Day_orderDAO.saveDay_order(arguments.day_order) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Day_order from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Day_order you wish to search for" />
       <cfreturn variables.instance.Day_orderDAO.getDay_orderByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Day_order from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Day_order you wish to delete" />
       <cfreturn variables.instance.Day_orderDAO.deleteDay_orderByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryDay_order" access="public" output="NO"
       hint="I run a query of every Day_order within the database table">
       <!--- Call the query method from the Day_order gateway and return the query object  --->
	   <cfreturn variables.instance.Day_orderGW.getEveryDay_order() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every Day_order based on their day_order Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.Day_orderGW.filterByName(nameFilter) />
    </cffunction> 
    
            
</cfcomponent>