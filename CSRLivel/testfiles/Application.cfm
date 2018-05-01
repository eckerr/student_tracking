<!--- 
  Filename:     Application.cfm
  Created by:   Nate Weiss (NMW)
  Please Note:  Executes for every page request
--->

<!--- redirect to secure site--->
 <cfset objRequest = GetPageContext().GetRequest() />
  
 <!--- Get requested URL from request object. --->
<cfset strUrl = objRequest.GetRequestUrl().Append(
 "?" & objRequest.GetQueryString()
).ToString()
/>

<cfif strUrl IS "http://64.205.204.206/csr/index.cfm?">
<cflocation url="https://iliscsr.aiiresources.com/csr" addtoken="no">
<cfelseif strUrl IS "https://iliscsr.aiiresources.com/csr">
<cflocation url="https://iliscsr.aiiresources.com/csr/LoginForm.cfm" addtoken="no">
</cfif>
  
<!--- Name our app, and enable Session variables --->
<cfapplication
  name="CSR"
  sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(0,0,5,0)#" >

<!--- If user is not logged in, force them to now --->  
<cfif NOT IsDefined("SESSION.Auth.IsLoggedIn")>
  <!--- If the user is now submitting "Login" form, --->
  <!--- Include "Login Check" code to validate user --->
<cfif IsDefined("Form.csrUserLogin")>
    <cfinclude template="LoginCheck.cfm">
</cfif> 
	<cfinclude template="LoginForm.cfm"> 
<cfabort>
</cfif>