<cfcomponent displayname="WeekService" output="NO"
   hint="I am the WeekSVC Class used to interact with the Week package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.WeekDAO = '' />
   <cfset variables.instance.WeekGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the WeekSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.WeekDAO = createObject('component', 'WeekDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.WeekGW = createObject('component', 'WeekGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Week into the database">
		<cfargument name="week" required="YES"
          type="com.csr.oop.beans.Week" hint="I am the Week bean" />
          <cfreturn variables.instance.WeekDAO.saveWeek(arguments.week) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Week from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Week you wish to search for" />
       <cfreturn variables.instance.WeekDAO.getWeekByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Week from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Week you wish to delete" />
       <cfreturn variables.instance.WeekDAO.deleteWeekByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryWeek" access="public" output="NO"
       hint="I run a query of every Week within the database table">
       <!--- Call the query method from the Week gateway and return the query object  --->
	   <cfreturn variables.instance.WeekGW.getEveryWeek() />
	</cffunction>
    
    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every Week based on their week Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.WeekGW.filterByName(nameFilter) />
    </cffunction> 
    
     <cffunction name="filterByWNum" access="PUBLIC" output="NO" 
       hint="I run a query of every Week based on their week number" >
       <cfargument name="wNumFilter"  required="YES" type="STRING"
          hint="I am the week number filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.WeekGW.filterByWNum(wNumFilter) />
    </cffunction>      
            
</cfcomponent>