<CFCOMPONENT DISPLAYNAME="ClassEndDAO" OUTPUT="NO" HINT="I am the ClassEnd DAO class">

<!--- Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />

	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the ClassEndDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewClassEnd" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="classEnd" REQUIRED="YES" TYPE="com.csr.oop.beans.ClassEnd" HINT="I am the ClassEnd bean" />
    <cfset var qInsert  = '' />
    <cfset var insertResult = 0 />
    <cfset var boolSuccess = true />
    
<!---      <cftry>
--->        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >
         insert into Tbl_ClassEnd(
           name)
         values(
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.classEnd.getName()#" />
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
    SELECT iD, name FROM Tbl_ClassEnd
    WHERE name = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
    VALUE="#arguments.classEnd.getName()#" />
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
  <cffunction NAME="getClassEndByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an ClassEnd bean populated with data for the specific ClassEnd" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the ClassEnd you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objClassEnd = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, name
      FROM Tbl_ClassEnd
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the ClassEnd ID, create an 
	   	  	        instance of the ClassEnd bean and return it  --->
                                                
       <cfset objClassEnd = createObject('component', 'com.csr.oop.beans.ClassEnd').init(
	      ID = qSearch.ID, name = qSearch.name) />
    </cfif>
    <cfreturn objClassEnd />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateClassEnd" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the all ClassEnd details." >
     <cfargument NAME="classEnd" REQUIRED="YES"
       TYPE="com.csr.oop.beans.ClassEnd"
       HINT="I am the ClassEnd bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Tbl_ClassEnd
            SET 
			 name = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.classEnd.getName()#" />
                         		
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.classEnd.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteClassEndByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete an ClassEnd from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the all ClassEnd you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_ClassEnd
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
        <cffunction name="saveClassEnd" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving a ClassEnd, either by
              creating a new entry or updating an existing one" >
              <cfargument name="classEnd" required="YES" 
                type="com.csr.oop.beans.ClassEnd" 
                hint="I am  the ClassEnd bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.classEnd)>
                    <cfset success = updateClassEnd(arguments.classEnd) />
                  <cfelse>
                    <cfset success = createNewClassEnd(arguments.classEnd) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific ClassEnd 
              exists within the database, using the ID as a check"> 
              <cfargument name="classEnd" required="true"
                 type = "com.csr.oop.beans.ClassEnd" hint="I am the ClassEnd bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_ClassEnd
                         WHERE ID = <cfqueryparam VALUE="#arguments.classEnd.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
        </cffunction>  
   
</CFCOMPONENT>