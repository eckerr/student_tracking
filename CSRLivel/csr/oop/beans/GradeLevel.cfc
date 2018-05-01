<CFCOMPONENT DISPLAYNAME="GradeLevel" OUTPUT="false" HINT="I am the  GradeLevel class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "levelName" TYPE="STRING" DEFAULT="" />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
    <cfset Variables.instance.levelName = '' />
    
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
    		HINT= "I am the constructor method for the All GradeLevel class">
    	<cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0 
        	HINT="I am the  ID" />
		<CFARGUMENT NAME="levelName" TYPE="string" REQUIRED="true" 
             DEFAULT="" HINT="I am the gradeLevel's name" />

        <cfscript>
			setID (arguments.iD);
			setLevelName(arguments.levelName);
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
    
    <cffunction NAME="setLevelName" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the gradeLevel's name into the Variables.instance scope" >
    <cfargument NAME="levelName" REQUIRED="true" TYPE="STRING"
        HINT="I am the gradeLevel's name." />	
			<cfset Variables.instance.levelName = arguments.levelName />	
    </cffunction>

    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn Variables.instance.iD />
    </cffunction>
 
    <cffunction NAME="getLevelName" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the gradeLevel's name.">
    <cfreturn Variables.instance.levelName />
    </cffunction>
   
    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>