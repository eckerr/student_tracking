<CFCOMPONENT DISPLAYNAME="Advisor" OUTPUT="false" HINT="I am the  Class class">
<cfproperty NAME = "iD" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "name" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "username" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "password" TYPE="NUMERIC" DEFAULT= 0 />
<cfproperty name = "salt" TYPE="STRING" DEFAULT="" />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
	<cfset Variables.instance.iD = 0 />
	<cfset Variables.instance.name = 0 />
    <cfset Variables.instance.username = 0 />
    <cfset Variables.instance.password = 0 />
    <cfset Variables.instance.salt = '' />
            
	<CFFUNCTION NAME="init" ACCESS="public"  OUTPUT="false" RETURNTYPE="any" 
    		HINT= "I am the constructor method for the All Class class">
    	<cfargument NAME="iD" TYPE="NUMERIC" REQUIRED="true" DEFAULT = 0 
        	HINT="I am the ID" />
		<CFARGUMENT NAME="name" TYPE="numeric" REQUIRED="true" DEFAULT="" 
        	HINT="I am the advisor name" />
		<CFARGUMENT NAME="username" TYPE="numeric" REQUIRED="true" 
             DEFAULT="" HINT="I am the advisor's username" />
        <CFARGUMENT NAME="password" TYPE="numeric" REQUIRED="true" 
            DEFAULT="" HINT="I am the advisor's password" />
        <CFARGUMENT NAME="salt" TYPE="string" REQUIRED="true" 
            DEFAULT="" HINT="I am the advisor's salt" />
            
       <cfscript>
			setID (arguments.iD);
			setName(arguments.name);
			setUsername(arguments.username);
			setPassword(arguments.password);
			setSalt(arguments.salt);
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
       HINT="I set the advisor name into the Variables.instance scope.">
    <cfargument NAME="name" REQUIRED="true" TYPE="numeric" 
        HINT="I am the advisor name"/>
			<cfset Variables.instance.name = arguments.name />
    </cffunction>
    
    <cffunction NAME="setUsername" ACCESS="PRIVATE" OUTPUT="false" 
       HINT="I set the advisor username into the Variables.instance scope" >
    <cfargument NAME="username" REQUIRED="true" TYPE="numeric"
        HINT="I am the advisor username." />	
			<cfset Variables.instance.username = arguments.username />	
    </cffunction>

    <cffunction NAME="setPassword" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the advisor password into the Variables.instance scope" >
    <cfargument NAME="password" REQUIRED="true" TYPE="numeric"
        HINT="I am the advisor password." />	
			<cfset Variables.instance.password = arguments.password />	
    </cffunction>
    
     <cffunction NAME="setSalt" ACCESS="PRIVATE" OUTPUT="false" 
        HINT="I set the password salt into the Variables.instance scope" >
    <cfargument NAME="salt" REQUIRED="true" TYPE="STRING"
        HINT="I am the password salt." />	
			<cfset Variables.instance.salt = arguments.salt />	
    </cffunction>
   

    <!--- getters / accessors --->
    <cffunction NAME="getID" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the  ID.">
    <cfreturn Variables.instance.iD />
    </cffunction>
 
     <cffunction NAME="getName" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the advisor name.">
    <cfreturn Variables.instance.studentID />
    </cffunction>

    <cffunction NAME="getUsername" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the advisor username.">
    <cfreturn Variables.instance.username />
    </cffunction>
   
    <cffunction NAME="getPassword" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the password.">
    <cfreturn Variables.instance.password />
    </cffunction>

    <cffunction NAME="getSalt" ACCESS="PUBLIC" OUTPUT="false"
        HINT="I return the password salt.">
    <cfreturn Variables.instance.salt />
    </cffunction>
       
    <!--- utility --->
    <cffunction NAME="getMemento" ACCESS="PUBLIC" OUTPUT="NO" HINT="I return a dumped struct of the Variables.instance scope">
    <cfreturn Variables.instance />
    </cffunction>
    
</CFCOMPONENT>