<CFCOMPONENT DISPLAYNAME="AdvisorDAO" OUTPUT="NO" HINT="I am the Advisor DAO class">

<!--- Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />

	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the AdvisorDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewAdvisor" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="advisor" REQUIRED="YES" TYPE="com.csr.oop.beans.Advisor" HINT="I am the Advisor bean" />
    <cfset var qInsert  = '' />
    <cfset var boolSuccess = true />
    
   <!---   <cftry>--->
        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >
         insert into Tbl_Advisor(
           name, username, password, salt)
         values(
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.advisor.getName()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.advisor.getUsername()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.advisor.getPassword()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.advisor.getSalt()#" />  
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
    SELECT iD, name, username, password, salt FROM Tbl_Advisor
    WHERE username = 
    <cfqueryparam  CFSQLTYPE="CF_SQL_INTEGER"
        VALUE="#arguments.advisor.getUsername()#" />
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
  <cffunction NAME="getAdvisorByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an Advisor bean populated with data for the specific advisor" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the advisor you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objAdvisor = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, name, username, password, salt
      FROM Tbl_Advisor
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the advisor ID, decrypt the advisor name and number and create an 
	   	  	        instance of the advisor bean and return it  --->
                 
       <cfset objAdvisor = createObject('component', 'com.csr.oop.beans.Advisor').init(
	      ID = qSearch.ID, name = qSearch.name, username = qSearch.username, 
		  password = qSearch.password, salt = qSearch.salt) />
    </cfif>
    <cfreturn objAdvisor />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateAdvisor" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the advisor details." >
     <cfargument NAME="advisor" REQUIRED="YES"
       TYPE="com.csr.oop.beans.Advisor"
       HINT="I am the Advisor bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Tbl_Advisor
            SET 
             name = <cfqueryparam  CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.advisor.getName()#" />,
			 username = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.advisor.getUsername()#" />,
			 password = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.advisor.getPassword()#" />,
			 salt = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.advisor.salt#" />
                          		
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.advisor.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteAdvisorByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete an advisor from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the advisor you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_Advisor
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
        <cffunction name="saveAdvisor" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving an Advisor, either by
              creating a new entry or updating an existing one" >
              <cfargument name="advisor" required="YES" 
                type="com.csr.oop.beans.Advisor" 
                hint="I am  the Advisor bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.advisor)>
                    <cfset success = updateAdvisor(arguments.advisor) />
                  <cfelse>
                    <cfset success = createNewAdvisor(arguments.advisor) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific advisor 
              exists within the database, using the ID as a check"> 
              <cfargument name="advisor" required="true"
                 type = "com.csr.oop.beans.Advisor" hint="I am the Advisor bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_Advisor
                         WHERE ID = <cfqueryparam VALUE="#arguments.advisor.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
        </cffunction>  
   
</CFCOMPONENT>