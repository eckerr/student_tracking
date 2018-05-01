<CFCOMPONENT DISPLAYNAME="Course" OUTPUT="false" HINT="I am the  Course class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "userName" TYPE="STRING" DEFAULT="" />
<cfproperty name = "password" TYPE="STRING" DEFAULT="" />
<cfproperty name = "salt" TYPE="STRING" DEFAULT="" />
<cfproperty name = "instructor" TYPE="STRING" DEFAULT="" />
<cfproperty name = "teacherDescrip" TYPE="STRING" DEFAULT="" />
<cfproperty name = "teacherEmail" TYPE="STRING" DEFAULT="" />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
    <cfset Variables.instance.userName = '' />
    <cfset Variables.instance.password = '' />
     <cfset Variables.instance.salt = '' />
    <cfset Variables.instance.instructor = '' />
    <cfset Variables.instance.teacherDescrip = '' />
    <cfset Variables.instance.teacherEmail = '' />    
    
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
    		HINT= "I am the constructor method for the All Course class">
    	<cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0 
        	HINT="I am the  ID" />
		<CFARGUMENT NAME="userName" TYPE="string" REQUIRED="true" 
             DEFAULT="" HINT="I am the instructor's user name" />
        <CFARGUMENT NAME="password" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the instructor password" />
         <CFARGUMENT NAME="salt" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the instructor salt" />
      	<CFARGUMENT NAME="instructor" TYPE="string" REQUIRED="true"         
            DEFAULT="" HINT="I am the instructor (school provided)" /> 
        <CFARGUMENT NAME="teacherDescrip" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am an additional name for the instructor" />
         <CFARGUMENT NAME="teacherEmail" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am an email address for the instructor" />
       <cfscript>
			setID (arguments.iD);
			setUserName(arguments.userName);
			setPassword(arguments.password);
			setSalt(arguments.salt);
			setInstructor(arguments.instructor);
			setTeacherDescrip(arguments.teacherDescrip);
			setTeacherEmail(arguments.teacherEmail);
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
    
    <cffunction NAME="setUserName" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the instructor's user name into the Variables.instance scope" >
    <cfargument NAME="userName" REQUIRED="true" TYPE="STRING"
        HINT="I am the instructor's user name." />	
			<cfset Variables.instance.userName = arguments.userName />	
    </cffunction>

    <cffunction NAME="setPassword" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the instructor's password into the Variables.instance scope" >
    <cfargument NAME="password" REQUIRED="true" TYPE="STRING"
        HINT="I am the instrucor's password." />	
			<cfset Variables.instance.password = arguments.password />	
    </cffunction>
    
    <cffunction NAME="setSalt" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the instructor's salt into the Variables.instance scope" >
    <cfargument NAME="salt" REQUIRED="true" TYPE="STRING"
        HINT="I am the instructor's salt." />	
			<cfset Variables.instance.salt = arguments.salt />	
    </cffunction>
    
    <cffunction NAME="setInstructor" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the instructor name in the Variables.instance scope" >
    <cfargument NAME="instructor" REQUIRED="true" TYPE="STRING"
        HINT="I am the intructor name." />	
			<cfset Variables.instance.instructor = arguments.instructor />	
    </cffunction>

    <cffunction NAME="setTeacherDescrip" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the teacher's descriptive name into the Variables.instance scope" >
    <cfargument NAME="teacherDescrip" REQUIRED="true" TYPE="STRING"
        HINT="I am the teacher's descriptive name." />	
			<cfset Variables.instance.teacherDescrip = arguments.teacherDescrip />	
    </cffunction>

    <cffunction NAME="setTeacherEmail" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the teacher's email into the Variables.instance scope" >
    <cfargument NAME="teacherEmail" REQUIRED="true" TYPE="STRING"
        HINT="I am the teacher's email." />	
			<cfset Variables.instance.teacherEmail = arguments.teacherEmail />	
    </cffunction>


    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn Variables.instance.iD />
    </cffunction>
 
    <cffunction NAME="getUserName" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the instructor's user name.">
    <cfreturn Variables.instance.userName />
    </cffunction>
   
    <cffunction NAME="getPassword" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the instructor's password.">
    <cfreturn Variables.instance.password />
    </cffunction>

    <cffunction NAME="getSalt" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the instructor's salt.">
    <cfreturn Variables.instance.salt />
    </cffunction>

    <cffunction NAME="getInstructor" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the instructor name.">
    <cfreturn Variables.instance.instructor />
    </cffunction>

    <cffunction NAME="getTeacherDescrip" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the instructor name.">
    <cfreturn Variables.instance.teacherDescrip />
    </cffunction>

    <cffunction NAME="getTeacherEmail" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the teacher's email.">
    <cfreturn Variables.instance.teacherEmail />
    </cffunction>
   
    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>