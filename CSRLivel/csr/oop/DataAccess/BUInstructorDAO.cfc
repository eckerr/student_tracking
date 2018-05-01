<CFCOMPONENT DISPLAYNAME="InstructorDAO" OUTPUT="NO" HINT="I am the Instructor DAO class">

<!=== Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />


	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the InstructorDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewInstructor" ACCESS="PRIVATE" OUTPUT="YES" RETURNTYPE="NUMERIC" HINT="I insert a new record into the database." >
    <cfargument NAME="instructor" REQUIRED="YES" TYPE="com.csr.oop.beans.Instructor" HINT="I am the instructor bean" />
    <cfset var qInsert  = '' />
    <cfset var insertResult = 0 />
    <cfquery NAME="qInsert"
    DATASOURCE="#Variables.instance.datasource.getDSName()#"
    USERNAME="#variables.instance.datasource.getUsername()#"
    PASSWORD="#variables.instance.datasource.getPassword()#"
    >
    INSERT INTO Instructor(
    iname, iusername, ipassword, istatus, iEmp_ID, istatinactive, iemail)
    VALUES(
    <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
       VALUE="#arguments.instructor.getiName()#" />,
    <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
       VALUE="#arguments.instructor.getiUsername()#" />,
    <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
       VALUE="#arguments.instructor.getiPassword()#" />,
     <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
       VALUE="#arguments.instructor.getiStatus()#" />,
    <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
       VALUE="#arguments.instructor.getiEmp_ID()#" />,
    <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
       VALUE="#arguments.instructor.getiStatInactive()#" />,  
    <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
       VALUE="#arguments.instructor.getiEmail()#" />  
    )
    </cfquery>
    <!--- Here, we search for the newly added record to retrieve it's ID number to pass to the bean  --->
    <cfquery NAME="findID"
     DATASOURCE="#Variables.instance.datasource.getDSName()#"
     USERNAME="#variables.instance.datasource.getUsername()#"
     PASSWORD="#variables.instance.datasource.getPassword()#"
    >
    SELECT iD, iname FROM Instructor
    WHERE iname = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
    VALUE="#arguments.instructor.getiName()#" />
    </cfquery>
        <!--- Here, we return the generatedKey value, which is an auto-generated value from the Database --->
    <cfif findID.RecordCount>
           <cfset insertResult = #findID.id# />
         <cfreturn insertResult />
    </cfif>
 
  </cffunction>
  
  <!--- READ  ---> 
  <cffunction NAME="getUserByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an Instructor bean populated with data for the specific instructor" >
  <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC"
     HINT="I am the ID of the instructor you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objInstructor = '' />
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, iname, iusername, ipassword, istatus, iEmp_ID, istatinactive, iemail
      FROM Instructor
      WHERE ID = <cfqueryparam cfsqltype="cf_sql_integer"
        value = "#arguments.ID#" />
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the instructorID, create an instance of the 
	             instructor bean and return it  --->
       <cfset objInstructor = createObject('component', 'com.csr.oop.beans.Instructor').init(
	      ID = qSearch.ID, iname = qSearch.iname,
		  iusername = qSearch.iusername, ipassword = qSearch.ipassword,
		  istatus = qSearch.istatus, iEmp_ID = qSearch.iEmp_ID, istatinactive = qSearch.istatinactive,
		  iemail = qSearch.iemail) />
    </cfif>
    <cfreturn objInstructor />                  
  </cffunction>
  
  <cffunction NAME="updateInstructor" ACCESS="PRIVATE" OUTPUT="NO"
     HINT="I update the instructor's details." >
     <cfargument NAME="instructor" REQUIRED="YES"
       TYPE="com.csr.oop.beans.Instructor"
       HINT="I am the Instructor bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Instructor
            SET 
             iname = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getiName()#" />,
             iusername = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getiUsername()#" />,
			 ipassword = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getiPassword()#" />,
			 istatus = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getiStatus()#" />,
			 iEmp_ID = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getiEmp_ID()#" />,
			 iStatInactive = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getiStatInactive()#" />,
			 iemail = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getiEmail()#" />		
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.Instructor.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteInstructorByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete a user from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the user you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Instructor
            WHERE ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
               VALUE="#arguments.ID#" />
            </cfquery>
            <cfcatch TYPE="DATABASE">
               <cfset boolSuccess = false />
            </cfcatch>
          </cftry>
         <cfreturn boolSuccess />
        </cffunction> 
      
        <!--- SAVE  ---> 
        <cffunction name="saveUser" access="PUBLIC" output="NO"
           returntype="STRING" hint="I handle saving an Instructor, either by
              creating a new entry or updating an existing one" >
              <cfargument name="instructor" required="YES" 
                type="com.csr.oop.beans.Instructor" 
                hint="I am  the instructor bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.instructor)>
                    <cfset success = updateInstructor(arguments.instructor) />
                  <cfelse>
                    <cfset success = createNewInstructor(arguments.Instructor) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific instructor 
              exists within the database, using the ID as a check"> 
              <cfargument name="Instructor" required="true"
                 type = "com.csr.oop.beans.Instructor" hint="I am the instructor bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Instructor
                         WHERE ID = <cfqueryparam VALUE="#arguments.instructor.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
                </cffunction>  
                                      

  
</CFCOMPONENT>