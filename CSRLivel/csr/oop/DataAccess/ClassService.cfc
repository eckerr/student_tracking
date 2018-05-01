<cfcomponent displayname="ClassService" output="NO"
   hint="I am the ClassSVC Class used to interact with the Class package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.ClassDAO = '' />
   <cfset variables.instance.ClassGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the ClassSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.ClassDAO = createObject('component', 'ClassDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.ClassGW = createObject('component', 'ClassGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Class into the database">
		<cfargument name="class" required="YES"
          type="com.csr.oop.beans.Class" hint="I am the Class bean" />
          <cfreturn variables.instance.ClassDAO.saveClass(arguments.class) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Class from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Class you wish to search for" />
       <cfreturn variables.instance.ClassDAO.getClassByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Class from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Class you wish to delete" />
       <cfreturn variables.instance.ClassDAO.deleteClassByID(arguments.ID) />
    </cffunction>
            

  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryClass" access="public" output="NO"
       hint="I run a query of every Class within the database table">
       <!--- Call the query method from the Class gateway and return the query object  --->
	   <cfreturn variables.instance.ClassGW.getEveryClass() />
	</cffunction>
    
    <cffunction name="filterByStudentID" access="PUBLIC" output="NO" 
       hint="I run a query of every Class based on their studentID" >
       <cfargument name="studentIDFilter"  required="YES"  TYPE="NUMERIC"
          hint="I am the studentID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassGW.filterByStudentID(studentIDFilter) />
    </cffunction> 

    <cffunction name="filterByProgramCodeID" access="PUBLIC" output="NO" 
       hint="I run a query of every Class based on their programCodeID" >
       <cfargument name="programCodeIDFilter"  required="YES" type="NUMERIC"
          hint="I am the programCodeID filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassGW.filterByProgramCodeID(programCodeIDFilter) />
    </cffunction> 
     
    <cffunction name="filterByCourseID" access="PUBLIC" output="NO" 
       hint="I run a query of every Class based on their course Id" >
       <cfargument name="courseIDFilter"  required="YES" type="NUMERIC"
          hint="I am the courseID lookup filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassGW.filterByCourseID(courseIDFilter) />
    </cffunction>      
     
    <cffunction name="FilterByCSection" access="PUBLIC" output="NO" 
       hint="I run a query of every Class based on their class section" >
       <cfargument name="cSectionFilter"  required="YES" type="STRING"
          hint="I am the class section filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.ClassGW.filterByCSection(cSectionFilter) />
    </cffunction>      
   
</cfcomponent>