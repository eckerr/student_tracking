<CFCOMPONENT DISPLAYNAME="ProgramCode" OUTPUT="false" HINT="I am the  ProgramCode class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "name" TYPE="STRING" DEFAULT="" />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
    <cfset Variables.instance.name = '' />
    
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
    		HINT= "I am the constructor method for the All ProgramCode class">
    	<cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0 
        	HINT="I am the  ID" />
		<CFARGUMENT NAME="name" TYPE="string" REQUIRED="true" 
             DEFAULT="" HINT="I am the programCode's name" />

        <cfscript>
			setID (arguments.iD);
			setName(arguments.name);
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
    
    <cffunction NAME="setName" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the programCode's name into the Variables.instance scope" >
    <cfargument NAME="name" REQUIRED="true" TYPE="STRING"
        HINT="I am the programCode's name." />	
			<cfset Variables.instance.name = arguments.name />	
    </cffunction>

    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn Variables.instance.iD />
    </cffunction>
 
    <cffunction NAME="getName" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the programCode's name.">
    <cfreturn Variables.instance.name />
    </cffunction>
   
    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>