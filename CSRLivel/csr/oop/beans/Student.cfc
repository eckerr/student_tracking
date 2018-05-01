<CFCOMPONENT DISPLAYNAME="Student" OUTPUT="false" HINT="I am the  Student class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "studentName" TYPE="STRING" DEFAULT="" />
<cfproperty name = "addr1" TYPE="STRING" DEFAULT="" />
<cfproperty name = "sCity" TYPE="STRING" DEFAULT="" />
<cfproperty name = "state" TYPE="STRING" DEFAULT="" />
<cfproperty name = "zip" TYPE="STRING" DEFAULT="" />
<cfproperty name = "phone" TYPE="STRING" DEFAULT="" />
<cfproperty name = "workPhone" TYPE="STRING" DEFAULT="" />
<cfproperty name = "otherPhone" TYPE="STRING" DEFAULT="" />
<cfproperty name = "mobileNumber" TYPE="STRING" DEFAULT="" />
<cfproperty name = "stuNum" TYPE="STRING" DEFAULT="" />
<cfproperty name = "programDescrip" TYPE="STRING" DEFAULT="" />
<cfproperty name = "shiftDescrip" TYPE="STRING" DEFAULT="" />
<cfproperty name = "sexDesc" TYPE="STRING" DEFAULT="" />
<cfproperty name = "dateStarted" TYPE="DATE" DEFAULT="" />
<cfproperty name = "expDateStart" TYPE="DATE" DEFAULT="" />
<cfproperty name = "enrollStat" TYPE="STRING" DEFAULT="" />
<cfproperty name = "gradeLevel" TYPE="STRING" DEFAULT="" />
<cfproperty name = "email" TYPE="STRING" DEFAULT="" />
<cfproperty name = "otherEmail" TYPE="STRING" DEFAULT="" />
<cfproperty name = "sap" TYPE="STRING" DEFAULT="" />
<cfproperty name = "dob" TYPE="DATE" DEFAULT="" />
<cfproperty name = "dobMonth" TYPE="STRING" DEFAULT="" />
<cfproperty name = "statusDesc" TYPE="STRING" DEFAULT="" />
<cfproperty name = "lda" TYPE="DATE" DEFAULT="" />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
	<cfset Variables.instance.studentName = '' />
    <cfset Variables.instance.addr1 = '' />
    <cfset Variables.instance.sCity = '' />
    <cfset Variables.instance.state = '' />
    <cfset Variables.instance.zip = '' />
    <cfset Variables.instance.phone = '' />
    <cfset Variables.instance.workPhone = '' />
    <cfset Variables.instance.otherPhone = '' />
    <cfset Variables.instance.mobileNumber = '' />
    <cfset Variables.instance.stuNum = '' />
    <cfset Variables.instance.programDescrip = '' />
    <cfset Variables.instance.shiftDescrip = '' />
    <cfset Variables.instance.sexDesc = '' />    
    <cfset Variables.instance.dateStarted = '' />
    <cfset Variables.instance.expDateStart = '' />    
    <cfset Variables.instance.enrollStat = '' />
    <cfset Variables.instance.gradeLevel = '' />
    <cfset Variables.instance.email = '' />
    <cfset Variables.instance.otherEmail = '' />
    <cfset Variables.instance.sap = '' />
    <cfset Variables.instance.dob = '' />
    <cfset Variables.instance.dobMonth = '' />
    <cfset Variables.instance.statusDesc = '' />
    <cfset Variables.instance.lda = '' />
    
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
    		HINT= "I am the constructor method for the All Student class">
    	<cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0 
        	HINT="I am the  ID" />
		<CFARGUMENT NAME="studentName" TYPE="string" REQUIRED="true" DEFAULT="" 
        	HINT="I am the studentName" />
		<CFARGUMENT NAME="addr1" TYPE="string" REQUIRED="true" 
             DEFAULT="" HINT="I am the student's address" />
        <CFARGUMENT NAME="sCity" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's city" />
        <CFARGUMENT NAME="state" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's state of residence" />
         <CFARGUMENT NAME="zip" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's zipcode" />
      	<CFARGUMENT NAME="phone" TYPE="string" REQUIRED="true"         
            DEFAULT="" HINT="I am the student's home phone" /> 
        <CFARGUMENT NAME="workPhone" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's work phone" />
        <CFARGUMENT NAME="otherPhone" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's other phone" />
        <CFARGUMENT NAME="mobileNumber" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's cell phone" />
        <CFARGUMENT NAME="stuNum" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's school ID number" />
        <CFARGUMENT NAME="programDescrip" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's degree program" />
        <CFARGUMENT NAME="shiftDescrip" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's traditional or evening program" />
        <CFARGUMENT NAME="sexDesc" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's gender" />       
        <CFARGUMENT NAME="dateStarted"  TYPE="DATE" REQUIRED="true" 
            DEFAULT="" HINT="I am the date the student started the program" />
        <CFARGUMENT NAME="expDateStart" TYPE="DATE" REQUIRED="true"
            DEFAULT="" HINT="I an the date the student was expected to start" />  
        <CFARGUMENT NAME="enrollStat" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's status (active, pending graduate, etc." />
        <CFARGUMENT NAME="gradeLevel" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's level in school (1st year, etc.)" />
        <CFARGUMENT NAME="email" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's email" />
        <CFARGUMENT NAME="otherEmail" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's other email" />
        <CFARGUMENT NAME="sap" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the sap (satisfactory academic progress rating)" />
        <CFARGUMENT NAME="dob"  TYPE="String" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's date of birth" />
        <CFARGUMENT NAME="dobMonth"  TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's birth month" />
        <CFARGUMENT NAME="statusDesc" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's status description" />
        <CFARGUMENT NAME="lda" TYPE="DATE" REQUIRED="true" 
            DEFAULT="" HINT="I am the student's last date of attendance (lda)" />               
                  
        <cfscript>
			setID (arguments.iD);
			setStudentName(arguments.studentName);
			setAddr1(arguments.addr1);
			setSCity(arguments.sCity);
			setState(arguments.state);
			setZip(arguments.zip);
			setPhone(arguments.phone);
			setWorkPhone(arguments.workPhone);
			setOtherPhone(arguments.otherPhone);
			setMobileNumber(arguments.mobileNumber);
			setStuNum(arguments.stuNum);
			setProgramDescrip(arguments.programDescrip);
			setShiftDescrip(arguments.shiftDescrip);
			setSexDesc(arguments.sexDesc);						
			setDateStarted(arguments.dateStarted);
			setExpDateStart(arguments.expDateStart);			
			setEnrollStat(arguments.enrollStat);
			setGradeLevel(arguments.gradeLevel);
			setEmail(arguments.email);
			setOtherEmail(arguments.otherEmail);
			setSap(arguments.sap);
			setDob(arguments.dob);
			setDobMonth(arguments.dobMonth);
			setStatusDesc(arguments.statusDesc);
			setLda(arguments.lda);
		</cfscript>
		<CFRETURN this>
	</CFFUNCTION>
    <!--- setters / mutators --->
    <cffunction NAME="setID" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the ID into the Variables.instance scope.">
    <cfargument NAME="iD" REQUIRED="true" TYPE="Numeric" 
       HINT="I am the  ID"/>
			<cfset Variables.instance.iD = arguments.iD />          
    </cffunction>
    
    <cffunction NAME="setStudentName" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the  student name into the Variables.instance scope.">
    <cfargument NAME="studentName" REQUIRED="true" TYPE="STRING" 
        HINT="I am the  student name"/>
			<cfset Variables.instance.studentName = arguments.studentName />
    </cffunction>
    
    <cffunction NAME="setAddr1" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the student's address into the Variables.instance scope" >
    <cfargument NAME="addr1" REQUIRED="true" TYPE="STRING"
        HINT="I am the  ID Number." />	
			<cfset Variables.instance.addr1 = arguments.addr1 />	
    </cffunction>

    <cffunction NAME="setSCity" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's city into the Variables.instance scope" >
    <cfargument NAME="sCity" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's city." />	
			<cfset Variables.instance.sCity = arguments.sCity />	
    </cffunction>
    
     <cffunction NAME="setState" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's State of residence into the Variables.instance scope" >
    <cfargument NAME="state" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's State of residence." />	
			<cfset Variables.instance.state = arguments.state />	
    </cffunction>
   
    <cffunction NAME="setZip" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's zipcode into the Variables.instance scope" >
    <cfargument NAME="zip" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's zipcode." />	
			<cfset Variables.instance.zip = arguments.zip />	
    </cffunction>
    
    <cffunction NAME="setPhone" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's phone into the Variables.instance scope" >
    <cfargument NAME="phone" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's phone." />	
			<cfset Variables.instance.phone = arguments.phone />	
    </cffunction>

    <cffunction NAME="setWorkPhone" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's workPhone into the Variables.instance scope" >
    <cfargument NAME="workPhone" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's work phone." />	
			<cfset Variables.instance.workPhone = arguments.workPhone />	
    </cffunction>

    <cffunction NAME="setOtherPhone" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's other phone into the Variables.instance scope" >
    <cfargument NAME="otherPhone" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's other phone." />	
			<cfset Variables.instance.otherPhone = arguments.otherPhone />	
    </cffunction>
    
    <cffunction NAME="setMobileNumber" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's cell phone into the Variables.instance scope" >
    <cfargument NAME="mobileNumber" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's cell phone number." />	
			<cfset Variables.instance.mobileNumber = arguments.mobileNumber />	
    </cffunction>

    <cffunction NAME="setStuNum" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's school ID number into the Variables.instance scope" >
    <cfargument NAME="stuNum" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's school ID number." />	
			<cfset Variables.instance.stuNum = arguments.stuNum />	
    </cffunction>

    <cffunction NAME="setProgramDescrip" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's program description (major field) into the Variables.instance scope" >
    <cfargument NAME="programDescrip" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's program description (major field)." />	
			<cfset Variables.instance.programDescrip = arguments.programDescrip />	
    </cffunction>

    <cffunction NAME="setShiftDescrip" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's program type(traditional, evening) into the Variables.instance scope" >
    <cfargument NAME="shiftDescrip" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's program type (traditional or evening)." />	
			<cfset Variables.instance.shiftDescrip = arguments.shiftDescrip />	
    </cffunction>

    <cffunction NAME="setSexDesc" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's gender into the Variables.instance scope" >
    <cfargument NAME="sexDesc" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's gender." />	
			<cfset Variables.instance.sexDesc = arguments.sexDesc />	
    </cffunction>

    <cffunction NAME="setDateStarted" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's program start date into the Variables.instance scope" >
    <cfargument NAME="dateStarted" REQUIRED="true"   TYPE="DATE"
        HINT="I am the student's program start date." />	
			<cfset Variables.instance.dateStarted = arguments.dateStarted />	
    </cffunction>
    
    <cffunction NAME="setExpDateStart" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's expected start date into the Variables.instance scope" >
    <cfargument NAME="expDateStart" REQUIRED="true"  TYPE="DATE"
        HINT="I am the student's expected start date." />	
			<cfset Variables.instance.expDateStart = arguments.expDateStart />	
    </cffunction>    
    
    <cffunction NAME="setEnrollStat" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's enroll status into the Variables.instance scope" >
    <cfargument NAME="enrollStat" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's enroll stat." />	
			<cfset Variables.instance.enrollStat = arguments.enrollStat />	
    </cffunction>

    <cffunction NAME="setGradeLevel" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's grade level (1st year, etc.) into the Variables.instance scope" >
    <cfargument NAME="gradeLevel" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's grade level (1st year, etc.)." />	
			<cfset Variables.instance.gradeLevel = arguments.gradeLevel />	
    </cffunction>
 
     <cffunction NAME="setEmail" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's email into the Variables.instance scope" >
    <cfargument NAME="email" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's email." />	
			<cfset Variables.instance.email = arguments.email />	
    </cffunction>

    <cffunction NAME="setOtherEmail" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's other email into the Variables.instance scope" >
    <cfargument NAME="otherEmail" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's grade level (1st year, etc.)." />	
			<cfset Variables.instance.otherEmail = arguments.otherEmail />	
    </cffunction>

    <cffunction NAME="setSap" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's Satisfactory Academic Progress status into the Variables.instance scope" >
    <cfargument NAME="sap" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's SAP)." />	
			<cfset Variables.instance.sap = arguments.sap />	
    </cffunction>

    <cffunction NAME="setDob" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's date of birth into the Variables.instance scope" >
    <cfargument NAME="dob" REQUIRED="true"   TYPE="ANY"
        HINT="I am the student's date of birth." />	
			<cfset Variables.instance.dob = arguments.dob />	
    </cffunction>

    <cffunction NAME="setDobMonth" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's birth month into the Variables.instance scope" >
    <cfargument NAME="dobMonth" REQUIRED="true"   TYPE="STRING"
        HINT="I am the student's birth month." />	
			<cfset Variables.instance.dobMonth = arguments.dobMonth />	
    </cffunction>

    <cffunction NAME="setStatusDesc" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's status desc (????, etc.) into the Variables.instance scope" >
    <cfargument NAME="statusDesc" REQUIRED="true" TYPE="STRING"
        HINT="I am the student's statusDesc (???, etc.)." />	
			<cfset Variables.instance.statusDesc = arguments.statusDesc />	
    </cffunction>

    <cffunction NAME="setLda" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the student's last date of attendance into the Variables.instance scope" >
    <cfargument NAME="lda" REQUIRED="true"  TYPE="DATE"
        HINT="I am the student's last date of attendance" />	
			<cfset Variables.instance.lda = arguments.lda />	
    </cffunction>


    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn Variables.instance.iD />
    </cffunction>
 
     <cffunction NAME="getStudentName" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the studentName.">
    <cfreturn Variables.instance.studentName />
    </cffunction>

    <cffunction NAME="getAddr1" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the students street address.">
    <cfreturn Variables.instance.addr1 />
    </cffunction>
   
    <cffunction NAME="getSCity" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's city.">
    <cfreturn Variables.instance.scity />
    </cffunction>

    <cffunction NAME="getState" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's state of residence.">
    <cfreturn Variables.instance.state />
    </cffunction>
    
    <cffunction NAME="getZip" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's zipcode.">
    <cfreturn Variables.instance.zip />
    </cffunction>

    <cffunction NAME="getPhone" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's phone number.">
    <cfreturn Variables.instance.phone />
    </cffunction>

    <cffunction NAME="getWorkPhone" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's work phone number.">
    <cfreturn Variables.instance.workPhone />
    </cffunction>

    <cffunction NAME="getOtherPhone" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's other phone number.">
    <cfreturn Variables.instance.otherPhone />
    </cffunction>

    <cffunction NAME="getMobileNumber" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's cell phone number.">
    <cfreturn Variables.instance.mobileNumber />
    </cffunction>

    <cffunction NAME="getStuNum" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's school ID number.">
    <cfreturn Variables.instance.stuNum />
    </cffunction>

    <cffunction NAME="getProgramDescrip" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's program descrip (major).">
    <cfreturn Variables.instance.programDescrip />
    </cffunction>

    <cffunction NAME="getShiftDescrip" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's program description (traditional or evening).">
    <cfreturn Variables.instance.shiftDescrip />
    </cffunction>
    
    <cffunction NAME="getSexDesc" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's gender.">
    <cfreturn Variables.instance.sexDesc />
    </cffunction>    

    <cffunction NAME="getDateStarted" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's entry date into the program.">
    <cfreturn Variables.instance.dateStarted />
    </cffunction>

    <cffunction NAME="getExpDateStart" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's entry date into the program.">
    <cfreturn Variables.instance.expDateStart />
    </cffunction>

    <cffunction NAME="getEnrollStat" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's enrollment status (active, pending grad, etc.">
    <cfreturn Variables.instance.enrollStat />
    </cffunction>

    <cffunction NAME="getGradeLevel" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's grade level (1st year, etc.).">
    <cfreturn Variables.instance.gradeLevel />
    </cffunction>

    <cffunction NAME="getEmail" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's email address.">
    <cfreturn Variables.instance.email />
    </cffunction>

    <cffunction NAME="getOtherEmail" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's other email address.">
    <cfreturn Variables.instance.otherEmail />
    </cffunction>

    <cffunction NAME="getSap" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's SAP status.">
    <cfreturn Variables.instance.sap />
    </cffunction>

    <cffunction NAME="getDob" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's date of birth.">
    <cfreturn Variables.instance.Dob />
    </cffunction>

    <cffunction NAME="getDobMonth" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's birth month.">
    <cfreturn Variables.instance.dobMonth />
    </cffunction>

    <cffunction NAME="getStatusDesc" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's status description.">
    <cfreturn Variables.instance.statusDesc />
    </cffunction>
                
     <cffunction NAME="getLda" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's last date of attendance.">
    <cfreturn Variables.instance.lda />
    </cffunction>
                
   
    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>