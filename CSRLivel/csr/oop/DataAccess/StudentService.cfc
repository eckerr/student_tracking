<cfcomponent displayname="StudentService" output="NO"
   hint="I am the StudentSVC Class used to interact with the Student package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.StudentDAO = '' />
   <cfset variables.instance.StudentGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the StudentSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.StudentDAO = createObject('component', 'StudentDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.StudentGW = createObject('component', 'StudentGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Student into the database">
		<cfargument name="student" required="YES"
          type="com.csr.oop.beans.Student" hint="I am the Student bean" />
          <cfreturn variables.instance.StudentDAO.saveStudent(arguments.student) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Student from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Student you wish to search for" />
       <cfreturn variables.instance.StudentDAO.getStudentByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Student from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Student you wish to delete" />
       <cfreturn variables.instance.StudentDAO.deleteStudentByID(arguments.ID) />
    </cffunction>
            

  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryStudent" access="public" output="NO"
       hint="I run a query of every Student within the database table">
       <!--- Call the query method from the Student gateway and return the query object  --->
	   <cfreturn variables.instance.StudentGW.getEveryStudent() />
	</cffunction>
    <cffunction name="filterByDobMonth" access="PUBLIC" output="NO" 
       hint="I run a query of every Student based on their birth month" >
       <cfargument name="dobMonthFilter"  required="YES" type="STRING"
          hint="I am the birth month filter" />
       <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.StudentGW.filterByDobMonth(dobMonthFilter) />
    </cffunction> 

    <cffunction name="filterByStudentName" access="PUBLIC" output="NO" 
       hint="I run a query of every Student based on their studentName" >
       <cfargument name="studentNameFilter"  required="YES" type="STRING"
          hint="I am the student name filter" />
       <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.StudentGW.filterByStudentName(studentNameFilter) />
    </cffunction> 
    
    <cffunction name="filterByProgramDescrip" access="PUBLIC" output="NO" 
       hint="I run a query of every Student based on their program description (major)" >
       <cfargument name="programDescripFilter"  required="YES" type="STRING"
       HINT="I am the program description filter" />
    <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.StudentGW.filterByProgramDescrip(programDescripFilter) />
    </cffunction>      
     
</cfcomponent>