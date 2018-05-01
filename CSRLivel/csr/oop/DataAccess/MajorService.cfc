<cfcomponent displayname="MajorService" output="NO"
   hint="I am the MajorSVC Class used to interact with the Major package"
    extends="com.csr.oop.utils.CoreUtils" >
   
   <!--- Pseudo-constructor  --->
   <cfset variables.instance = structNew() />
   <cfset variables.instance.MajorDAO = '' />
   <cfset variables.instance.MajorGW = '' />
   <cffunction name="init" access="PUBLIC" output="NO"
      returntype="ANY" hint="I am the constructor method for the MajorSVC Class" >
    <cfargument name="datasource" required="YES"
       type="com.csr.oop.beans.Datasource"
       hint="I am the datasource object" />
         
   <!--- Set the initial values of the bean  --->
   <cfscript>
     // instantiate the Data Access Object 
	 variables.instance.MajorDAO = createObject('component', 'MajorDAO').init(arguments.datasource);
	 // instantiate the Gateway
	 variables.instance.MajorGW = createObject('component', 'MajorGateway').init(arguments.datasource);
   </cfscript>
   <cfreturn this />
   </cffunction>
   
   <!--- CRUD METHODS  --->
   
	<cffunction name="save" access="public"  output="NO"
       hint="I save or update a Major into the database">
		<cfargument name="major" required="YES"
          type="com.csr.oop.beans.Major" hint="I am the Major bean" />
          <cfreturn variables.instance.MajorDAO.saveMajor(arguments.major) />
	</cffunction>
    <cffunction name="read" access="PUBLIC" output= "NO"
       hint="I obtain details for a specific Major from the database" >
     <cfargument name="ID" required="YES" type="NUMERIC" 
        hint="I am the ID of the Major you wish to search for" />
       <cfreturn variables.instance.MajorDAO.getMajorByID(arguments.ID) />
     </cffunction>  
    <cffunction name="delete" access="PUBLIC" output="NO"
       hint="I delete a specific Major from the database" >
       <cfargument name="ID" required="YES" type="NUMERIC"
          hint="I am the ID of the Major you wish to delete" />
       <cfreturn variables.instance.MajorDAO.deleteMajorByID(arguments.ID) />
    </cffunction>
            
  <!--- GATEWAY METHODS  --->
   
	<cffunction name="getEveryMajor" access="public" output="NO"
       hint="I run a query of every Major within the database table">
       <!--- Call the query method from the Major gateway and return the query object  --->
	   <cfreturn variables.instance.MajorGW.getEveryMajor() />
	</cffunction>
    
    <cffunction name="filterByCode" access="PUBLIC" output="NO" 
       hint="I run a query of every Major based on their code" >
       <cfargument name="codeFilter"  required="YES" type="STRING"
          hint="I am the code filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.MajorGW.filterByCode(codeFilter) />
    </cffunction> 

    <cffunction name="filterByName" access="PUBLIC" output="NO" 
       hint="I run a query of every Major based on their major Name" >
       <cfargument name="nameFilter"  required="YES" type="STRING"
          hint="I am the name filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.MajorGW.filterByName(nameFilter) />
    </cffunction> 
    
     <cffunction name="filterByProgramDescrip" access="PUBLIC" output="NO" 
       hint="I run a query of every Major based on their program description (major)" >
       <cfargument name="programDescripFilter"  required="YES" type="STRING"
          hint="I am the program description (major) filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.MajorGW.filterByProgramDescrip(programDescripFilter) />
    </cffunction>      
     
   <cffunction name="filterByProgramCode" access="PUBLIC" output="NO" 
       hint="I run a query of every Major based on their program code (major)" >
       <cfargument name="programCodeFilter"  required="YES" type="STRING"
          hint="I am the program code (major) filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.MajorGW.filterByProgramCode(programCodeFilter) />
    </cffunction>
    
        <cffunction name="filterByAdvisorID" access="PUBLIC" output="NO" 
       hint="I run a query of every Major based on their advisorID" >
       <cfargument name="advisorIDFilter"  required="YES" type="STRING"
          hint="I am the advisor ID filter" />
          
          <!--- Send the structure into the query method and return the query object  --->
          <cfreturn variables.instance.MajorGW.filterByAdvisorID(advisorIDFilter) />
    </cffunction>         
</cfcomponent>