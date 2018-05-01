<CFCOMPONENT DISPLAYNAME="MajorDAO" OUTPUT="NO" HINT="I am the Major DAO class">

<!--- Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />

	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the MajorDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewMajor" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="major" REQUIRED="YES" TYPE="com.csr.oop.beans.Major" HINT="I am the Major bean" />
    <cfset var qInsert  = '' />
    <cfset var insertResult = 0 />
    <cfset var boolSuccess = true />
    
<!---      <cftry>
--->        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >
         insert into Tbl_Major(
           code, name, programDescrip, programCode, advisorID)
         values(
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.major.getCode()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.major.getName()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.major.getProgramDescrip()#" />, 
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.major.getProgramCode()#" />,            
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"  NULL="#not len(trim(arguments.major.getAdvisorID()))#"
            VALUE="#arguments.major.getAdvisorID()#" />  
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
    SELECT iD, programDescrip FROM Tbl_Major
    WHERE programDescrip = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
    VALUE="#arguments.Major.getprogramDescrip()#" />
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
  <cffunction NAME="getMajorByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an Major bean populated with data for the specific major" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the Major you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objMajor = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, code, name, programDescrip, shiftDescrip, programCode, advisorID
      FROM Tbl_Major
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the Major ID, create an 
	   	  	        instance of the Major bean and return it  --->
                                                
       <cfset objMajor = createObject('component', 'com.csr.oop.beans.Major').init(
	      ID = qSearch.ID, code = qSearch.code, name = qSearch.name,
		  programDescrip = qSearch.programDescrip, programCode = qSearch.programCode, 
		  advisorID = qSearch.advisorID) />
    </cfif>
    <cfreturn objMajor />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateMajor" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the all major details." >
     <cfargument NAME="major" REQUIRED="YES"
       TYPE="com.csr.oop.beans.Major"
       HINT="I am the Major bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Tbl_Major
            SET 
             code = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.major.getCode()#" />,
			 name = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.major.getName()#" />,
			 programDescrip = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.major.getProgramDescrip()#" />,
			 programCode = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.major.getProgramCode()#" />,     
			 advisorID = <cfqueryparam  CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.major.getAdvisorID()#" />
                          		
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.major.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteMajorByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete an Major from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the all major you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_Major
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
        <cffunction name="saveMajor" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving a Major, either by
              creating a new entry or updating an existing one" >
              <cfargument name="major" required="YES" 
                type="com.csr.oop.beans.Major" 
                hint="I am  the Major bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.major)>
                    <cfset success = updateMajor(arguments.major) />
                  <cfelse>
                    <cfset success = createNewMajor(arguments.major) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific major 
              exists within the database, using the ID as a check"> 
              <cfargument name="major" required="true"
                 type = "com.csr.oop.beans.Major" hint="I am the Major bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_Major
                         WHERE ID = <cfqueryparam VALUE="#arguments.major.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
        </cffunction>  
   
</CFCOMPONENT>