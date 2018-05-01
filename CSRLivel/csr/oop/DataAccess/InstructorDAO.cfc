<CFCOMPONENT DISPLAYNAME="InstructorDAO" OUTPUT="NO" HINT="I am the Instructor DAO class">

<!--- Pseudo-constructor --->
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
    <cffunction NAME="createNewInstructor" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="instructor" REQUIRED="YES" TYPE="com.csr.oop.beans.Instructor" HINT="I am the Instructor bean" />
    <cfset var qInsert  = '' />
    <cfset var boolSuccess = true />
    
   <!---   <cftry>--->
        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >
         insert into Tbl_Instructor(
           userName, password, salt, instructor, teacherDescrip, teacherEmail)
         values(
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.instructor.getUserName()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.instructor.getPassword()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.instructor.getSalt()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.instructor.getInstructor()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.instructor.getTeacherDescrip()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.instructor.getTeacherEmail()#" />                              
         )
          </cfquery>
 <!---           <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
     </cftry>--->
    <!--- <cfreturn boolSuccess /> --->    

	<!---      Here, we search for the newly added record to retrieve it's ID number to pass to the bean ---> 
    <cfquery NAME="findID"
     DATASOURCE="#Variables.instance.datasource.getDSName()#"
     USERNAME="#variables.instance.datasource.getUsername()#"
     PASSWORD="#variables.instance.datasource.getPassword()#"
    >
    SELECT iD, teacherDescrip FROM Tbl_Instructor
    WHERE teacherDescrip = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
    VALUE="#arguments.instructor.getTeacherDescrip()#" />
    </cfquery>
         Here, we return the generatedKey value, which is an auto-generated value from the Database --->
    <cfif findID.RecordCount>
           <cfset insertResult = #findID.id# />
         <cfreturn insertResult />
        <cfelse>
         <cfreturn 0 />          
    </cfif>
 
  </cffunction>
  
  <!--- READ  ---> 
  <cffunction NAME="getInstructorByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an Instructor bean populated with data for the specific Instructor" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the Instructor you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objInstructor = '' />
    <cfset var decInstructorName = '' />
    <cfset var decStuNum = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, userName, password, salt, instructor, teacherDescrip, teacherEmail
      FROM Tbl_Instructor
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the Instructor ID, decrypt the Instructor name and number and create an 
	   	  	        instance of the Instructor bean and return it  --->
                 
       <cfset objInstructor = createObject('component', 'com.csr.oop.beans.Instructor').init(
	      ID = qSearch.ID, userName = qSearch.userName, password = qSearch.password,
		  salt = qSearch.salt, instructor = qSearch.instructor, 
		  teacherDescrip = qSearch.teacherDescrip, teacherEmail = qSearch.teacherEmail ) />
    </cfif>
    <cfreturn objInstructor />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateInstructor" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the all instructor details." >
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
            UPDATE Tbl_Instructor
            SET 
			 userName = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getUserName()#" />,
			 password = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getPassword()#" />,
			 salt = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getSalt()#" />,
			 instructor = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getInstructor()#" />,
			 teacherDescrip = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getTeacherDescrip()#" />,
             teacherEmail = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.instructor.getTeacherEmail()#" />
                          		
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.instructor.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteInstructorByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete an Instructor from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the all instructor you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_Instructor
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
        <cffunction name="saveInstructor" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving a Instructor, either by
              creating a new entry or updating an existing one" >
              <cfargument name="instructor" required="YES" 
                type="com.csr.oop.beans.Instructor" 
                hint="I am  the Instructor bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.instructor)>
                    <cfset success = updateInstructor(arguments.instructor) />
                  <cfelse>
                    <cfset success = createNewInstructor(arguments.instructor) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific instructor 
              exists within the database, using the ID as a check"> 
              <cfargument name="instructor" required="true"
                 type = "com.csr.oop.beans.Instructor" hint="I am the Instructor bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_Instructor
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