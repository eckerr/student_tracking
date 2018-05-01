<CFCOMPONENT DISPLAYNAME="ClassDAO" OUTPUT="NO" HINT="I am the Class DAO class">

<!--- Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />

	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the ClassDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewClass" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="class" REQUIRED="YES" TYPE="com.csr.oop.beans.Class" HINT="I am the Class bean" />
    <cfset var qInsert  = '' />
    <cfset var boolSuccess = true />
    
   <!---   <cftry>--->
        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >
         insert into Tbl_Class(
           studentID, programCodeID, courseID)
         values(
         <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.class.getStudentID()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.class.getProgramCodeID()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER" 
            VALUE="#arguments.class.getCourseID()#" />
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
    SELECT iD, studentID, programCodeID, courseID FROM Tbl_Class
    WHERE studentID = 
    <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
        VALUE="#arguments.class.getStudentID()#" />
         AND 
          programCodeID =
    <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
        VALUE="#arguments.class.getProgramCodeID()#" />
        AND
          courseID =
    <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
        VALUE="#arguments.class.getCourseID()#" />
        
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
  <cffunction NAME="getClassByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return a Class bean populated with data for the specific class" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the class you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objClass = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, studentID, programCodeID, courseID
      FROM Tbl_Class
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the class ID, decrypt the class name and number and create an 
	   	  	        instance of the class bean and return it  --->
                 
       <cfset objClass = createObject('component', 'com.csr.oop.beans.Class').init(
	      ID = qSearch.ID, studentID = qSearch.studentID, programCodeID = qSearch.programCodeID, 
		  courseID = qSearch.courseID) />
    </cfif>
    <cfreturn objClass />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateClass" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the all class details." >
     <cfargument NAME="class" REQUIRED="YES"
       TYPE="com.csr.oop.beans.Class"
       HINT="I am the Class bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Tbl_Class
            SET 
             studentID = <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.class.getStudentID()#" />,
			 programCodeID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.class.getProgramCodeID()#" />,
			 courseID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
              VALUE="#arguments.class.getCourseID()#" />,
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.class.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteClassByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete a class from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the all class you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_Class
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
        <cffunction name="saveClass" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving a Class, either by
              creating a new entry or updating an existing one" >
              <cfargument name="class" required="YES" 
                type="com.csr.oop.beans.Class" 
                hint="I am  the Class bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.class)>
                    <cfset success = updateClass(arguments.class) />
                  <cfelse>
                    <cfset success = createNewClass(arguments.class) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific class 
              exists within the database, using the ID as a check"> 
              <cfargument name="class" required="true"
                 type = "com.csr.oop.beans.Class" hint="I am the Class bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_Class
                         WHERE ID = <cfqueryparam VALUE="#arguments.class.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
        </cffunction>  
   
</CFCOMPONENT>