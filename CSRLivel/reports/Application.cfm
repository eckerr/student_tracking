<!--- 
  Filename:     Application.cfm
  Created by:   Nate Weiss (NMW)
  Please Note:  Executes for every page request
--->


  
<!--- Name our app, and enable Session variables --->
<cfapplication
  name="csrmain"
  sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(0,0,20,0)#" >

<!--- If user is not logged in, force them to now --->  
<cfif NOT IsDefined("SESSION.Auth.IsLoggedIn")>
  <!--- If the user is now submitting "Login" form, --->
  <!--- Include "Login Check" code to validate user --->
	<cflocation url="https://iliscsr.aiiresources.com/csr" addtoken="no"> 
<cfabort>
</cfif>