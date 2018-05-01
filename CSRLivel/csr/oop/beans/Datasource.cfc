<CFCOMPONENT DISPLAYNAME="Datasource" OUTPUT="NO" HINT="I am the Datasource Class">

<cfproperty NAME="DSName" TYPE="STRING" DEFAULT="" />
<cfproperty NAME="username" TYPE="STRING" DEFAULT="" />
<cfproperty NAME="password" TYPE="STRING" DEFAULT="" />

<!---  Pseudo-constructor --->
<cfset Variables.instance = structNew()>
<cfset Variables.instance.DSName = "" />
<cfset Variables.instance.username = ""/>
<cfset Variables.instance.password = ""/>


	<CFFUNCTION NAME="init" ACCESS="PUBLIC" OUTPUT="NO"
       RETURNTYPE="any" 
       HINT="I am the constructor method for the Datasource Class">
		<CFARGUMENT NAME="DSName" TYPE="string" REQUIRED="yes" 
           HINT="I am the name of the datasource." />
        <CFARGUMENT NAME="username" TYPE="string" REQUIRED="yes" 
           HINT="I am the username for the datasource." />
       <CFARGUMENT NAME="password" TYPE="string" REQUIRED="yes" 
           HINT="I am the password for the datasource." />
       <!--- Set the initial values of the Bean --->
       <cfscript>
	   		Variables.instance.DSName = arguments.DSName;
	   		Variables.instance.username = arguments.username;
	   		Variables.instance.password = arguments.password;
		</cfscript>
        
        <cfreturn this />         
	</CFFUNCTION>
    
    <!--- getters / accessors --->
    <cffunction NAME="getDSName" ACCESS="PUBLIC" OUTPUT="NO"
       HINT="I return the datasource name">
       <cfreturn Variables.instance.DSName />
    </cffunction>
    
     <cffunction NAME="getUserName" ACCESS="PUBLIC" OUTPUT="NO"
       HINT="I return the username for the datasource">
       <cfreturn Variables.instance.username />
    </cffunction>

    <cffunction NAME="getPassword" ACCESS="PUBLIC" OUTPUT="NO"
       HINT="I return the password for the datasource">
       <cfreturn Variables.instance.password />
    </cffunction>    
    
</CFCOMPONENT>