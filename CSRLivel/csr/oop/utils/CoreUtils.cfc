<cfcomponent displayname="coreUtils" output="false" hint="I am the coreUtils abstract class">
	<cffunction name="getMemento" access="public" output="NO"
       hint="I return the variables.instance struct">
		<cfreturn variables.instance />
	</cffunction>
</cfcomponent>