<CFCOMPONENT DISPLAYNAME="Week" OUTPUT="false" HINT="I am the  Week class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "name" TYPE="STRING" DEFAULT="" />
<cfproperty name = "wNum" TYPE="NUMERIC" DEFAULT="" />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
    <cfset Variables.instance.name = '' />
    <cfset Variables.instance.wNum = 0 />
    
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
    		HINT= "I am the constructor method for the All Week class">
    	<cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0 
        	HINT="I am the  ID" />
		<CFARGUMENT NAME="name" TYPE="string" REQUIRED="true" 
             DEFAULT="" HINT="I am the week's name" />
        <CFARGUMENT NAME="wNum"  TYPE="NUMERIC" REQUIRED="true" 
            DEFAULT="" HINT="I am the number of the week" />

        <cfscript>
			setID (arguments.iD);
			setName(arguments.name);
			setwNum(arguments.wNum);
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
       HINT="I set the week's name into the Variables.instance scope" >
    <cfargument NAME="name" REQUIRED="true" TYPE="STRING"
        HINT="I am the week's name." />	
			<cfset Variables.instance.name = arguments.name />	
    </cffunction>

    <cffunction NAME="setWNum" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the week's displayable number into the Variables.instance scope" >
    <cfargument NAME="wNum" REQUIRED="true" TYPE="STRING"
        HINT="I am the display number for the week." />	
			<cfset Variables.instance.wNum = arguments.wNum />	
    </cffunction>

    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn Variables.instance.iD />
    </cffunction>
 
    <cffunction NAME="getName" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the week's name.">
    <cfreturn Variables.instance.name />
    </cffunction>

    <cffunction NAME="getWNum" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the week's number.">
    <cfreturn Variables.instance.programDescrip />
    </cffunction>
   
    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>