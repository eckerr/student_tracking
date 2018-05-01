<CFCOMPONENT DISPLAYNAME="SAP" OUTPUT="false" HINT="I am the  SAP class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "sapText" TYPE="STRING" DEFAULT="" />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
    <cfset Variables.instance.sapText = '' />
    
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
    		HINT= "I am the constructor method for the All SAP class">
    	<cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0 
        	HINT="I am the  ID" />
		<CFARGUMENT NAME="sapText" TYPE="string" REQUIRED="true" 
             DEFAULT="" HINT="I am the student's sap" />

        <cfscript>
			setID (arguments.iD);
			setSAPText(arguments.sapText);
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
    
    <cffunction NAME="setSAPText" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the meeting sap into the Variables.instance scope" >
    <cfargument NAME="sapText" REQUIRED="true" TYPE="STRING"
        HINT="I am the meeting sap." />	
			<cfset Variables.instance.sapText = arguments.sapText />	
    </cffunction>

    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn Variables.instance.iD />
    </cffunction>
 
    <cffunction NAME="getSAPText" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the sap.">
    <cfreturn Variables.instance.sapText />
    </cffunction>
   
    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>