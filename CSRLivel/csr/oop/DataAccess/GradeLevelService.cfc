<cfcomponent displayname="GradeLevelService" output="NO"
   hint="I am the GradeLevelSVC Class used to interact with the GradeLevel package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.GradeLevelDAO = '' />
   <cfset variables.instance.GradeLevelGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the GradeLevelSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.GradeLevelDAO = createObject('component', 'GradeLevelDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.GradeLevelGW = createObject('component', 'GradeLevelGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a GradeLevel into the database">
		<cfargument name="gradeLevel" required="YES"
          type="com.csr.oop.beans.GradeLevel" hint="I am the GradeLevel bean" />
          <cfreturn variables.instance.GradeLevelDAO.saveGradeLevel(arguments.gradeLevel) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific GradeLevel from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the GradeLevel you wish to search for" />
       <cfreturn variables.instance.GradeLevelDAO.getGradeLevelByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific GradeLevel from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the GradeLevel you wish to delete" />
       <cfreturn variables.instance.GradeLevelDAO.deleteGradeLevelByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryGradeLevel" access="public" output="NO"
       hint="I run a query of every GradeLevel within the database table">
       <!--- Call the query method from the GradeLevel gateway and return the query object  --->
	   <cfreturn variables.instance.GradeLevelGW.getEveryGradeLevel() />
	</cffunction>
    
    <cffunction name="filterByLevelName" access="PUBLIC" output="NO" 
       hint="I run a query of every GradeLevel based on their gradeLevel Name" >
       <cfargument name="levelNameFilter"  required="YES" type="STRING"
          hint="I am the level name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.GradeLevelGW.filterByLevelName(levelNameFilter) />
    </cffunction> 
    
            
</cfcomponent>