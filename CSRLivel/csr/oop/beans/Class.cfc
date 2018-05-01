<CFCOMPONENT DISPLAYNAME="Class" OUTPUT="false" HINT="I am the  Class class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "studentID" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "programCodeID" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "courseID" TYPE="NUMERIC" DEFAULT= 0 />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
	<cfset Variables.instance.studentID = 0 />
    <cfset Variables.instance.programCodeID = 0 />
    <cfset Variables.instance.courseID = 0 />
            
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
    		HINT= "I am the constructor method for the All Class class">
    	<cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0 
        	HINT="I am the  ID" />
		<CFARGUMENT NAME="studentID" TYPE="numeric" REQUIRED="true" DEFAULT="" 
        	HINT="I am the student lookup id" />
		<CFARGUMENT NAME="programCodeID" TYPE="numeric" REQUIRED="true" 
             DEFAULT="" HINT="I am the program Code's lookup id" />
        <CFARGUMENT NAME="courseID" TYPE="numeric" REQUIRED="true" 
            DEFAULT="" HINT="I am the course's lookup id" />
            
       <cfscript>
			setID (arguments.iD);
			setStudentID(arguments.studentID);
			setProgramCodeID(arguments.programCodeID);
			setCourseID(arguments.courseID);
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
    
    <cffunction NAME="setStudentID" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the student lookup id into the Variables.instance scope.">
    <cfargument NAME="studentID" REQUIRED="true" TYPE="numeric" 
        HINT="I am the student lookup id"/>
			<cfset Variables.instance.studentID = arguments.studentID />
    </cffunction>
    
    <cffunction NAME="setProgramCodeID" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the program codes's lookup Id into the Variables.instance scope" >
    <cfargument NAME="programCodeID" REQUIRED="true" TYPE="numeric"
        HINT="I am the program code's lookup id." />	
			<cfset Variables.instance.programCodeID = arguments.programCodeID />	
    </cffunction>

    <cffunction NAME="setCourseID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the course's lookup id into the Variables.instance scope" >
    <cfargument NAME="courseID" REQUIRED="true" TYPE="numeric"
        HINT="I am the course's lookup id." />	
			<cfset Variables.instance.courseID = arguments.courseID />	
    </cffunction>
    
    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn Variables.instance.iD />
    </cffunction>
 
     <cffunction NAME="getStudentID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the student's lookup id.">
    <cfreturn Variables.instance.studentID />
    </cffunction>

    <cffunction NAME="getProgramCodeID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the program code's lookup id.">
    <cfreturn Variables.instance.programCodeID />
    </cffunction>
   
    <cffunction NAME="getCourseID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the course's lookup id.">
    <cfreturn Variables.instance.courseID />
    </cffunction>

    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>