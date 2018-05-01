<CFCOMPONENT DISPLAYNAME="EnrollStatDAO" OUTPUT="NO" HINT="I am the EnrollStat DAO class">

<!--- Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />

	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the EnrollStatDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewEnrollStat" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="enrollStat" REQUIRED="YES" TYPE="com.csr.oop.beans.EnrollStat" HINT="I am the EnrollStat bean" />
    <cfset var qInsert  = '' />
    <cfset var insertResult = 0 />
    <cfset var boolSuccess = true />
    
<!---      <cftry>
--->        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >
         insert into Tbl_EnrollStat(
           name)
         values(
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.enrollStat.getName()#" />
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
    SELECT iD, name FROM Tbl_EnrollStat
    WHERE name = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
    VALUE="#arguments.EnrollStat.getName()#" />
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
  <cffunction NAME="getEnrollStatByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an EnrollStat bean populated with data for the specific enrollStat" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the EnrollStat you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objEnrollStat = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, name
      FROM Tbl_EnrollStat
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the EnrollStat ID, create an 
	   	  	        instance of the EnrollStat bean and return it  --->
                                                
       <cfset objEnrollStat = createObject('component', 'com.csr.oop.beans.EnrollStat').init(
	      ID = qSearch.ID, name = qSearch.name) />
    </cfif>
    <cfreturn objEnrollStat />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateEnrollStat" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the all enrollStat details." >
     <cfargument NAME="enrollStat" REQUIRED="YES"
       TYPE="com.csr.oop.beans.EnrollStat"
       HINT="I am the EnrollStat bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Tbl_EnrollStat
            SET 
			 name = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.enrollStat.getName()#" />
                         		
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.enrollStat.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteEnrollStatByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete an EnrollStat from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the all enrollStat you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_EnrollStat
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
        <cffunction name="saveEnrollStat" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving a EnrollStat, either by
              creating a new entry or updating an existing one" >
              <cfargument name="enrollStat" required="YES" 
                type="com.csr.oop.beans.EnrollStat" 
                hint="I am  the EnrollStat bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.enrollStat)>
                    <cfset success = updateEnrollStat(arguments.enrollStat) />
                  <cfelse>
                    <cfset success = createNewEnrollStat(arguments.enrollStat) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific enrollStat 
              exists within the database, using the ID as a check"> 
              <cfargument name="enrollStat" required="true"
                 type = "com.csr.oop.beans.EnrollStat" hint="I am the EnrollStat bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_EnrollStat
                         WHERE ID = <cfqueryparam VALUE="#arguments.enrollStat.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
        </cffunction>  
   
</CFCOMPONENT>