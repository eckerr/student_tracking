<CFCOMPONENT DISPLAYNAME="Major" OUTPUT="false" HINT="I am the  Major class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "code" TYPE="STRING" DEFAULT="" />
<cfproperty name = "name" TYPE="STRING" DEFAULT="" />
<cfproperty name = "programDescrip" TYPE="STRING" DEFAULT="" />
<cfproperty name = "programCode" TYPE="STRING" DEFAULT="" />
<cfproperty name = "advisorID" TYPE="STRING" DEFAULT="" />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
	<cfset Variables.instance.code = '' />
    <cfset Variables.instance.name = '' />
    <cfset Variables.instance.programDescrip = '' />
    <cfset Variables.instance.programCode = '' />    
    <cfset Variables.instance.advisorID = '' />
    
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
    		HINT= "I am the constructor method for the All Major class">
    	<cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0 
        	HINT="I am the  ID" />
		<CFARGUMENT NAME="code" TYPE="string" REQUIRED="true" DEFAULT="" 
        	HINT="I am the major code" />
		<CFARGUMENT NAME="name" TYPE="string" REQUIRED="true" 
             DEFAULT="" HINT="I am the major's name" />
        <CFARGUMENT NAME="programDescrip" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the major's degree program" />
        <CFARGUMENT NAME="programCode" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the major's program code" />       
        <CFARGUMENT NAME="advisorID"  TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the major's advisor ID" />

        <cfscript>
			setID (arguments.iD);
			setCode(arguments.code);
			setName(arguments.name);
			setProgramDescrip(arguments.programDescrip);
			setProgramCode(arguments.programCode);						
			setAdvisorID(arguments.advisorID);
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
    
    <cffunction NAME="setCode" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the  major code into the Variables.instance scope.">
    <cfargument NAME="code" REQUIRED="true" TYPE="STRING" 
        HINT="I am the  major code"/>
			<cfset Variables.instance.code = arguments.code />
    </cffunction>
    
    <cffunction NAME="setName" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the major's name into the Variables.instance scope" >
    <cfargument NAME="name" REQUIRED="true" TYPE="STRING"
        HINT="I am the major's name." />	
			<cfset Variables.instance.name = arguments.name />	
    </cffunction>

    <cffunction NAME="setProgramDescrip" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the major's program description (major field) into the Variables.instance scope" >
    <cfargument NAME="programDescrip" REQUIRED="true" TYPE="STRING"
        HINT="I am the major's program description (major field)." />	
			<cfset Variables.instance.programDescrip = arguments.programDescrip />	
    </cffunction>

    <cffunction NAME="setProgramCode" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the major's program code into the Variables.instance scope" >
    <cfargument NAME="programCode" REQUIRED="true" TYPE="STRING"
        HINT="I am the major's program code." />	
			<cfset Variables.instance.programCode = arguments.programCode />	
    </cffunction>

    <cffunction NAME="setAdvisorID" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the major's advisor id into the Variables.instance scope" >
    <cfargument NAME="advisorID" REQUIRED="true"   TYPE="STRING"
        HINT="I am the major's advisor ID." />	
			<cfset Variables.instance.advisorID = arguments.advisorID />	
    </cffunction>

    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn Variables.instance.iD />
    </cffunction>
 
     <cffunction NAME="getCode" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the major code.">
    <cfreturn Variables.instance.code />
    </cffunction>

    <cffunction NAME="getName" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the majors name.">
    <cfreturn Variables.instance.name />
    </cffunction>

    <cffunction NAME="getProgramDescrip" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the major's program descrip (major).">
    <cfreturn Variables.instance.programDescrip />
    </cffunction>

    <cffunction NAME="getProgramCode" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the major's program code.">
    <cfreturn Variables.instance.programCode />
    </cffunction>    

    <cffunction NAME="getAdvisorID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the major's AdvisorID.">
    <cfreturn Variables.instance.advisorID />
    </cffunction>
   
    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>