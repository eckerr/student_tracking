<cfcomponent displayname="TimeService" output="NO"
   hint="I am the TimeSVC Class used to interact with the Time package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.TimeDAO = '' />
   <cfset variables.instance.TimeGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the TimeSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.TimeDAO = createObject('component', 'TimeDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.TimeGW = createObject('component', 'TimeGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Time into the database">
		<cfargument name="time" required="YES"
          type="com.csr.oop.beans.Time" hint="I am the Time bean" />
          <cfreturn variables.instance.TimeDAO.saveTime(arguments.time) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Time from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Time you wish to search for" />
       <cfreturn variables.instance.TimeDAO.getTimeByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Time from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Time you wish to delete" />
       <cfreturn variables.instance.TimeDAO.deleteTimeByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryTime" access="public" output="NO"
       hint="I run a query of every Time within the database table">
       <!--- Call the query method from the Time gateway and return the query object  --->
	   <cfreturn variables.instance.TimeGW.getEveryTime() />
	</cffunction>
    
    <cffunction name="filterByTMeet" access="PUBLIC" output="NO" 
       hint="I run a query of every Time based on their meet time" >
       <cfargument name="tMeetFilter"  required="YES" type="STRING"
          hint="I am the meet time filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.TimeGW.filterByTMeet(tMeetFilter) />
    </cffunction> 
    
            
</cfcomponent>