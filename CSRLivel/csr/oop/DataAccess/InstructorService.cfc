<cfcomponent displayname="InstructorService" output="NO"
   hint="I am the InstructorSVC Class used to interact with the Instructor package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.InstructorDAO = '' />
   <cfset variables.instance.InstructorGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the InstructorSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.InstructorDAO = createObject('component', 'InstructorDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.InstructorGW = createObject('component', 'InstructorGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Instructor into the database">
		<cfargument name="instructor" required="YES"
          type="com.csr.oop.beans.Instructor" hint="I am the Instructor bean" />
          <cfreturn variables.instance.InstructorDAO.saveInstructor(arguments.instructor) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Instructor from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Instructor you wish to search for" />
       <cfreturn variables.instance.InstructorDAO.getInstructorByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Instructor from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Instructor you wish to delete" />
       <cfreturn variables.instance.InstructorDAO.deleteInstructorByID(arguments.ID) />
    </cffunction>
            

  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryInstructor" access="public" output="NO"
       hint="I run a query of every Instructor within the database table">
       <!--- Call the query method from the Instructor gateway and return the query object  --->
	   <cfreturn variables.instance.InstructorGW.getEveryInstructor() />
	</cffunction>
    
    <cffunction name="filterByUserName" access="PUBLIC" output="NO" 
       hint="I run a query of every Instructor based on their username" >
       <cfargument name="userNameFilter"  required="YES" type="STRING"
          hint="I am the instructor username filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.InstructorGW.filterByUsername(userNameFilter) />
    </cffunction> 
     
    <cffunction name="filterByPassword" access="PUBLIC" output="NO" 
       hint="I run a query of every Instructor based on their password" >
       <cfargument name="passwordFilter"  required="YES" type="STRING"
          hint="I am the password filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.InstructorGW.filterbyPassword(passwordFilter) />
    </cffunction>      
     
     <cffunction name="filterBySalt" access="PUBLIC" output="NO" 
       hint="I run a query of every Instructor based on their salt" >
       <cfargument name="saltFilter"  required="YES" type="STRING"
          hint="I am the instructor salt filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.InstructorGW.filterbySalt(saltFilter) />
    </cffunction>      
     
    <cffunction name="filterByInstructor" access="PUBLIC" output="NO" 
       hint="I run a query of every Instructor based on their name" >
       <cfargument name="instructorFilter"  required="YES" type="STRING"
          hint="I am the instructor filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.InstructorGW.filterbyInstructor(instructorFilter) />
    </cffunction>      
     
    <cffunction name="filterByTeacherDescrip" access="PUBLIC" output="NO" 
       hint="I run a query of every Instructor based on their teacher description" >
       <cfargument name="teacherDescripFilter"  required="YES" type="STRING"
          hint="I am the teacher description filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.InstructorGW.filterbyTeacherDescrip(teacherDescripFilter) />
    </cffunction>      
     
    <cffunction name="filterByTeacherEmail" access="PUBLIC" output="NO" 
       hint="I run a query of every Instructor based on their teacher email" >
       <cfargument name="teacherEmailFilter"  required="YES" type="STRING"
          hint="I am the teacher email filter" />
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.InstructorGW.filterbyTeacherEmail(teacherEmailFilter) />
    </cffunction>      
     
</cfcomponent>