<CFCOMPONENT DISPLAYNAME="GradeLevelDAO" OUTPUT="NO" HINT="I am the GradeLevel DAO class">

<!--- Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />

	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the GradeLevelDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewGradeLevel" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="gradeLevel" REQUIRED="YES" TYPE="com.csr.oop.beans.GradeLevel" HINT="I am the GradeLevel bean" />
    <cfset var qInsert  = '' />
    <cfset var insertResult = 0 />
    <cfset var boolSuccess = true />
    
<!---      <cftry>
--->        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >
         insert into Tbl_GradeLevel(
           levelName)
         values(
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.gradeLevel.getLevelName()#" />
         )
         </cfquery>
<!---            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
     </cftry>--->
     
<!---     <cfreturn boolSuccess /> --->    

  
<!---      Here, we search for the newly added record to retrieve it's ID number to pass to the bean ---> 
    <cfquery NAME="findID"
     DATASOURCE="#Variables.instance.datasource.getDSName()#"
     USERNAME="#variables.instance.datasource.getUsername()#"
     PASSWORD="#variables.instance.datasource.getPassword()#"
    >
    SELECT iD, levelName FROM Tbl_GradeLevel
    WHERE levelName = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
    VALUE="#arguments.gradeLevel.getLevelName()#" />
    </cfquery>
   <!--- Here, we return the generatedKey value, which is an auto-generated value from the Database --->
    <cfif findID.RecordCount>
           <cfset insertResult = #findID.id# />
         <cfreturn insertResult />
    <cfelse>
         <cfreturn 0 />     
    </cfif>
 
  </cffunction>
  
  <!--- READ  ---> 
  <cffunction NAME="getGradeLevelByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an GradeLevel bean populated with data for the specific gradeLevel" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the GradeLevel you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objGradeLevel = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, levelName
      FROM Tbl_GradeLevel
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the GradeLevel ID, create an 
	   	  	        instance of the GradeLevel bean and return it  --->
                                                
       <cfset objGradeLevel = createObject('component', 'com.csr.oop.beans.GradeLevel').init(
	      ID = qSearch.ID, levelName = qSearch.levelName) />
    </cfif>
    <cfreturn objGradeLevel />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateGradeLevel" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the all gradeLevel details." >
     <cfargument NAME="gradeLevel" REQUIRED="YES"
       TYPE="com.csr.oop.beans.GradeLevel"
       HINT="I am the GradeLevel bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Tbl_GradeLevel
            SET 
			 name = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.gradeLevel.getName()#" />
                         		
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.gradeLevel.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteGradeLevelByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete an GradeLevel from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the all gradeLevel you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_GradeLevel
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
        <cffunction name="saveGradeLevel" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving a GradeLevel, either by
              creating a new entry or updating an existing one" >
              <cfargument name="gradeLevel" required="YES" 
                type="com.csr.oop.beans.GradeLevel" 
                hint="I am  the GradeLevel bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.gradeLevel)>
                    <cfset success = updateGradeLevel(arguments.gradeLevel) />
                  <cfelse>
                    <cfset success = createNewGradeLevel(arguments.gradeLevel) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific gradeLevel 
              exists within the database, using the ID as a check"> 
              <cfargument name="gradeLevel" required="true"
                 type = "com.csr.oop.beans.GradeLevel" hint="I am the GradeLevel bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_GradeLevel
                         WHERE ID = <cfqueryparam VALUE="#arguments.gradeLevel.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
        </cffunction>  
   
</CFCOMPONENT>