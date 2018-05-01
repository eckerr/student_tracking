<CFCOMPONENT DISPLAYNAME="Time" OUTPUT="false" HINT="I am the  Time class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "tMeet" TYPE="STRING" DEFAULT="" />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
    <cfset Variables.instance.tMeet = '' />
    
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
    		HINT= "I am the constructor method for the All Time class">
    	<cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0 
        	HINT="I am the  ID" />
		<CFARGUMENT NAME="tMeet" TYPE="string" REQUIRED="true" 
             DEFAULT="" HINT="I am the meeting time" />

        <cfscript>
			setID (arguments.iD);
			setTMeet(arguments.tMeet);
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
    
    <cffunction NAME="setTMeet" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the meeting time into the Variables.instance scope" >
    <cfargument NAME="tMeet" REQUIRED="true" TYPE="STRING"
        HINT="I am the meeting time." />	
			<cfset Variables.instance.tMeet = arguments.tMeet />	
    </cffunction>

    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn Variables.instance.iD />
    </cffunction>
 
    <cffunction NAME="getTMeet" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the meeting time.">
    <cfreturn Variables.instance.tMeet />
    </cffunction>
   
    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>