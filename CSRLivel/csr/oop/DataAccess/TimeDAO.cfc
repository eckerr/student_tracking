<CFCOMPONENT DISPLAYNAME="TimeDAO" OUTPUT="NO" HINT="I am the Time DAO class">

<!--- Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />

	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the TimeDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewTime" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="time" REQUIRED="YES" TYPE="com.csr.oop.beans.Time" HINT="I am the Time bean" />
    <cfset var qInsert  = '' />
    <cfset var insertResult = 0 />
    <cfset var boolSuccess = true />
    
<!---      <cftry>
--->        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >
         insert into Tbl_Time(
           tMeet)
         values(
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.time.getTMeet()#" />
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
    SELECT iD, tMeet FROM Tbl_Time
    WHERE tMeet = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
    VALUE="#arguments.Time.getTMeet()#" />
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
  <cffunction NAME="getTimeByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an Time bean populated with data for the specific time" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the Time you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objTime = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, tMeet
      FROM Tbl_Time
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the Time ID, create an 
	   	  	        instance of the Time bean and return it  --->
                                                
       <cfset objTime = createObject('component', 'com.csr.oop.beans.Time').init(
	      ID = qSearch.ID, tMeet = qSearch.tMeet) />
    </cfif>
    <cfreturn objTime />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateTime" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the all time details." >
     <cfargument NAME="time" REQUIRED="YES"
       TYPE="com.csr.oop.beans.Time"
       HINT="I am the Time bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Tbl_Time
            SET 
			 tMeet = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.time.getTMeet()#" />
                         		
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.time.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteTimeByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete an Time from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the all time you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_Time
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
        <cffunction name="saveTime" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving a Time, either by
              creating a new entry or updating an existing one" >
              <cfargument name="time" required="YES" 
                type="com.csr.oop.beans.Time" 
                hint="I am  the Time bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.time)>
                    <cfset success = updateTime(arguments.time) />
                  <cfelse>
                    <cfset success = createNewTime(arguments.time) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific time 
              exists within the database, using the ID as a check"> 
              <cfargument name="time" required="true"
                 type = "com.csr.oop.beans.Time" hint="I am the Time bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_Time
                         WHERE ID = <cfqueryparam VALUE="#arguments.time.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
        </cffunction>  
   
</CFCOMPONENT>