<CFCOMPONENT DISPLAYNAME="StudentDAO" OUTPUT="NO" HINT="I am the Student DAO class">

<!--- Pseudo-constructor --->
<cfset Variables.instance = structNew()/>
<cfset Variables.instance.datasource = "" />

	<CFFUNCTION NAME="init" ACCESS="public" RETURNTYPE="any" OUTPUT="NO" HINT="I am the constructor method for the StudentDAO Class">
		<CFARGUMENT NAME="datasource" TYPE="com.csr.oop.beans.Datasource" REQUIRED="yes" HINT="I am the datasource object" />
        <!--- set the initial values of the bean --->
        <cfscript>
		  Variables.instance.datasource = arguments.datasource;
		</cfscript>  
        
		<CFRETURN this>
	</CFFUNCTION>
    
    <!--- CREATE --->
    <cffunction NAME="createNewStudent" ACCESS="PUBLIC" OUTPUT="NO" RETURNTYPE="BOOLEAN"  
    		HINT="I insert a new record into the database." >
    <cfargument NAME="student" REQUIRED="YES" TYPE="com.csr.oop.beans.Student" HINT="I am the Student bean" />
    <cfset var qInsert  = '' />
    <cfset var boolSuccess = true />
    
    <!--- set up encrypted variables  --->
    <cfset var encStudentName = Encrypt ("#Trim(arguments.student.getStudentName())#", "#Application.key#") />
    <cfset var encStuNum = Encrypt ("#Trim(arguments.student.getStuNum())#", "#Application.key#") />
    <!----------------------------------->
    
   <!---   <cftry>--->
        <cfquery NAME="qInsert"
         DATASOURCE="#Variables.instance.datasource.getDSName()#"
         USERNAME="#variables.instance.datasource.getUsername()#"
         PASSWORD="#variables.instance.datasource.getPassword()#"
         >

         insert into Tbl_Student(
           studentName, addr1, sCity, state, zip, phone, workPhone, otherPhone, mobileNumber, stuNum,
           programDescrip, shiftDescrip, sexDesc, dateStarted, expDateStart, enrollStat, gradeLevel, 
           email, otherEmail, sap, dob, dobMonth, statusDesc, lda)
         values(
		 <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#encStudentName#" />,      
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getAddr1()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getSCity()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getState()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getZip()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getPhone()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getWorkPhone()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getOtherPhone()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getMobileNumber()#" />,  
		 <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#encStuNum#" />,          
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getProgramDescrip()#" />, 
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getShiftDescrip()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getSexDesc()#" />,            
         <cfqueryparam  CFSQLTYPE="CF_SQL_DATE" 
            VALUE="#arguments.student.getDateStarted()#" />, 
         <cfqueryparam CFSQLTYPE="CF_SQL_DATE" 
            VALUE="#arguments.student.getExpDateStart()#" />,    
         <cfqueryparam   CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getEnrollStat()#" />, 
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getGradeLevel()#" />, 
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getEmail()#" />,
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getOtherEmail()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getSap()#" />,
         <cfqueryparam   CFSQLTYPE="CF_SQL_VARCHAR" NULL="#not len(trim(arguments.student.getDob()))#" 
            VALUE="#arguments.student.getDob()#" />, 
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"  NULL="#not len(trim(arguments.student.getDobMonth()))#"
            VALUE="#arguments.student.getDobMonth()#" />,  
         <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR" 
            VALUE="#arguments.student.getStatusDesc()#" />,
         <cfqueryparam   CFSQLTYPE="CF_SQL_DATE" 
            VALUE="#arguments.student.getLda()#" />               
                           
         )
         </cfquery>
 <!---           <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
     </cftry>--->
     <cfreturn boolSuccess />     

<!---   
    <!--- Here, we search for the newly added record to retrieve it's ID number to pass to the bean  --->
    <cfquery NAME="findID"
     DATASOURCE="#Variables.instance.datasource.getDSName()#"
     USERNAME="#variables.instance.datasource.getUsername()#"
     PASSWORD="#variables.instance.datasource.getPassword()#"
    >
    SELECT iD, iname FROM Tbl_Student
    WHERE iname = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
    VALUE="Encrypt(#arguments.Student.getiName()#, '#Application.key#')" />
    </cfquery>
        <!--- Here, we return the generatedKey value, which is an auto-generated value from the Database --->
    <cfif findID.RecordCount>
           <cfset insertResult = #findID.id# />
         <cfreturn insertResult />
    </cfif>
---> 
  </cffunction>
  
  <!--- READ  ---> 
  <cffunction NAME="getStudentByID" ACCESS="PUBLIC" OUTPUT="NO"
     HINT="I return an Student bean populated with data for the specific student" >
    <cfargument NAME="ID" REQUIRED="YES"  TYPE="NUMERIC" DEFAULT= 1
     HINT="I am the ID of the Student you wish to search for" />
    <cfset var qSearch = '' />
    <cfset var objStudent = '' />
    <cfset var decStudentName = '' />
    <cfset var decStuNum = '' />
 
    <cfquery NAME="qSearch"
      DATASOURCE="#Variables.instance.datasource.getDSName()#"
      USERNAME="#variables.instance.datasource.getUsername()#"
      PASSWORD="#variables.instance.datasource.getPassword()#" >
      SELECT  ID, studentName, addr1, sCity, state, zip, phone, workPhone, otherPhone, mobileNumber, stuNum,
           programDescrip, shiftDescrip, sexDesc, dateStarted, expDateStart, enrollStat, gradeLevel, email, 
           otherEmail, sap, dob, dobMonth, statusDesc, lda
      FROM Tbl_Student
      WHERE ID = #arguments.ID#
    </cfquery>
    <cfif qSearch.RecordCount>
       <!--- If a record has been returned for the Student ID, decrypt the student name and number and create an 
	   	  	        instance of the Student bean and return it  --->
                 
    <!--- set up decrypted variables  --->
    <cfset decStudentName = Decrypt ("#qSearch.studentName#", "#Application.key#") />
    <cfset decStuNum =      Decrypt ("#qSearch.stuNum#",      "#Application.key#") />
    <!----------------------------------->
                 
                               
       <cfset objStudent = createObject('component', 'com.csr.oop.beans.Student').init(
	      ID = qSearch.ID, studentName = decStudentName,
		  addr1 = qSearch.addr1, sCity = qSearch.sCity,
		  state = qSearch.state, zip = qSearch.zip, phone = qSearch.phone,
		  workPhone = qSearch.workPhone, otherPhone = qSearch.otherPhone, mobileNumber = qSearch.mobileNumber,
		  stuNum = decStuNum, programDescrip = qSearch.programDescrip, shiftDescrip = qSearch.shiftDescrip,	
		  dateStarted = qSearch.dateStarted, expDateStart = qSearch.expDateStart,
		  enrollStat = qSearch.enrollStat, gradeLevel = qSearch.gradeLevel, email = qSearch.email,
		  otherEmail = qSearch.otherEmail, sap = qSearch.sap, dob = qSearch.dob, dobMonth = qSearch.dobMonth,
		  statusDesc = qSearch.statusDesc, lda = qSearch.lda ) />
    </cfif>
    <cfreturn objStudent />                  
  </cffunction>
  
    <!--- UPDATE  --->
  <cffunction NAME="updateStudent" ACCESS="PRIVATE" OUTPUT="NO"
     RETURNTYPE="BOOLEAN"  HINT="I update the all student details." >
     <cfargument NAME="student" REQUIRED="YES"
       TYPE="com.csr.oop.beans.Student"
       HINT="I am the Student bean" />
       <cfset var qUpdate = '' />
       <cfset var boolSuccess = true />
    <!--- set up encrypted variables  --->
    <cfset var encStudentName = Encrypt ("#Trim(arguments.student.getStudentName())#", "#Application.key#") />
    <cfset var encStuNum = Encrypt      ("#Trim(arguments.student.getStuNum())#",      "#Application.key#") />
    <!----------------------------------->
         <cftry>
            <cfquery NAME="qUpdate"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            UPDATE Tbl_Student
            SET 
             studentName = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#encStudentName#" />,
             addr1 = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getAddr1()#" />,
			 sCity = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getSCity()#" />,
			 state = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getState()#" />,
			 zip = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getZip()#" />,
			 phone = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getPhone()#" />,
			 workPhone = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getWorkPhone()#" />,
			 otherPhone = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getOtherPhone()#" />,
			 mobileNumber = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getMobileNumber()#" />,
			 stuNum = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#encStuNum#" />,
			 programDescrip = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getProgramDescrip()#" />,
			 shiftDescrip = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getShiftDescrip()#" />,
			 sexDesc = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getSexDesc()#" />,     
			 dateStarted = <cfqueryparam  CFSQLTYPE="CF_SQL_DATE"
              VALUE="#arguments.student.getDateStarted()#" />,
			 expDateStart = <cfqueryparam  CFSQLTYPE="CF_SQL_DATE"
              VALUE="#arguments.student.getExpDateStart()#" />,
			 enrollStat = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getEnrollStat()#" />,
			 gradeLevel = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getGradeLevel()#" />,
			 email = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getEmail()#" />,
			 otherEmail = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getOtherEmail()#" />,
			 sap = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getSap()#" />,
			 dob = <cfqueryparam  CFSQLTYPE="CF_SQL_DATE"
              VALUE="#arguments.student.getDob()#" />,
			 dobMonth = <cfqueryparam  CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getDobMonth()#" />,
			 statusDesc = <cfqueryparam CFSQLTYPE="CF_SQL_VARCHAR"
              VALUE="#arguments.student.getStatusDesc()#" />,
			 lda = <cfqueryparam  CFSQLTYPE="CF_SQL_DATE"
              VALUE="#arguments.student.getLda()#" />
              
                          		
            WHERE
              ID = <cfqueryparam CFSQLTYPE="CF_SQL_INTEGER"
                VALUE="#arguments.student.getID()#" />  
            </cfquery>
            <cfcatch TYPE="DATABASE">
            	<cfset boolSuccess = FALSE />
            </cfcatch>
           </cftry>
         <cfreturn boolSuccess />     
       </cffunction>
       
       <!--- DELETE  --->
       <cffunction NAME="deleteStudentByID" ACCESS="PUBLIC" OUTPUT="NO" 
          RETURNTYPE="BOOLEAN" HINT="I delete an Student from the database" >
          <cfargument NAME="ID" REQUIRED="YES" TYPE="NUMERIC"
            HINT="I am the id of the all student you wish to delete" />
          <cfset var qDelete = '' />
          <cfset var boolSuccess = true />
          <cftry>
            <cfquery NAME="qDelete"
            DATASOURCE="#Variables.instance.datasource.getDSName()#"
            USERNAME="#variables.instance.datasource.getUsername()#"
            PASSWORD="#variables.instance.datasource.getPassword()#" >
            DELETE FROM Tbl_Student
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
        <cffunction name="saveStudent" access="PUBLIC" output="NO"
            RETURNTYPE="BOOLEAN" hint="I handle saving a Student, either by
              creating a new entry or updating an existing one" >
              <cfargument name="student" required="YES" 
                type="com.csr.oop.beans.Student" 
                hint="I am  the Student bean" />
                <cfset var success = '' />
                  <cfif exists(arguments.student)>
                    <cfset success = updateStudent(arguments.student) />
                  <cfelse>
                    <cfset success = createNewStudent(arguments.student) />
                  </cfif>
                  <cfreturn success />
        </cffunction>
              
		<!--- EXISTS --->
        <cffunction name="exists" access="PRIVATE" output="NO"
           returntype="BOOLEAN" hint="I check to see if a specific student 
              exists within the database, using the ID as a check"> 
              <cfargument name="student" required="true"
                 type = "com.csr.oop.beans.Student" hint="I am the Student bean" >
                   <cfset var qExists = "">
                     <cfquery name="qExists"
                      DATASOURCE="#Variables.instance.datasource.getDSName()#"
                      USERNAME="#variables.instance.datasource.getUsername()#"
                      PASSWORD="#variables.instance.datasource.getPassword()#"
                      maxrows="1" >
                         SELECT count(1) as idexists
                         FROM Tbl_Student
                         WHERE ID = <cfqueryparam VALUE="#arguments.student.getID()#"
                          CFSQLTYPE="CF_SQL_INTEGER" />
                     </cfquery>
  						<cfif qExists.idexists>
              			  <cfreturn true />
                        <cfelse>
                          <cfreturn false />
                        </cfif>
        </cffunction>  
   
</CFCOMPONENT>