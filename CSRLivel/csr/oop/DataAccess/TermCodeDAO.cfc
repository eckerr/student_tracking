<CFCOMPONENT DISPLAYNAME="TermCodeDAO" OUTPUT="NO" HINT="I am the TermCode DAO class">

<!--- Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />

	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the TermCodeDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewTermCode" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="termCode" REQUIRED="YES" TYPE="com.csr.oop.beans.TermCode" HINT="I am the TermCode bean" />
    <cfset var qInsert  = '' />
    <cfset var insertResult = 0 />
    <cfset var boolSuccess = true />
    
<!---      <cftry>
--->        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >
         insert into Tbl_TermCode(
           name)
         values(
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.termCode.getName()#" />
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
    SELECT iD, name FROM Tbl_TermCode
    WHERE name = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
    VALUE="#arguments.TermCode.getName()#" />
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
  <cffunction NAME="getTermCodeByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an TermCode bean populated with data for the specific termCode" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the TermCode you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objTermCode = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, name
      FROM Tbl_TermCode
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the TermCode ID, create an 
	   	  	        instance of the TermCode bean and return it  --->
                                                
       <cfset objTermCode = createObject('component', 'com.csr.oop.beans.TermCode').init(
	      ID = qSearch.ID, name = qSearch.name) />
    </cfif>
    <cfreturn objTermCode />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateTermCode" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the all termCode details." >
     <cfargument NAME="termCode" REQUIRED="YES"
       TYPE="com.csr.oop.beans.TermCode"
       HINT="I am the TermCode bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Tbl_TermCode
            SET 
			 name = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.termCode.getName()#" />
                         		
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.termCode.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteTermCodeByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete an TermCode from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the all termCode you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_TermCode
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
        <cffunction name="saveTermCode" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving a TermCode, either by
              creating a new entry or updating an existing one" >
              <cfargument name="termCode" required="YES" 
                type="com.csr.oop.beans.TermCode" 
                hint="I am  the TermCode bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.termCode)>
                    <cfset success = updateTermCode(arguments.termCode) />
                  <cfelse>
                    <cfset success = createNewTermCode(arguments.termCode) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific termCode 
              exists within the database, using the ID as a check"> 
              <cfargument name="termCode" required="true"
                 type = "com.csr.oop.beans.TermCode" hint="I am the TermCode bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_TermCode
                         WHERE ID = <cfqueryparam VALUE="#arguments.termCode.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
        </cffunction>  
   
</CFCOMPONENT>