<title>Process Advisors</title><!---
Name:        movie_process.cfm
Author:      Ben Forta (ben@forta.com)
Description: Dual purpose edit page
Created:     4/20/02
--->

<!--- Begin Encrypt Code --->
<cfset Form.AUserName= Encrypt("#Form.AUserName#", "iuserILIS0720")>
<cfset Form.APassword = Encrypt("#Form.APassword#", "ipassILIS0720")>
<!--- End Encrypt code --->

<!--- Edit or update? --->
<cfif IsDefined("FORM.AdvisorID")>
    <!--- Update movie --->
    <cfupdate datasource="csrmain" tablename="Advisors">
<cfelse>
    <!--- Add movie --->
    <cfinsert datasource="csrmain" tablename="Advisors">
</cfif>

<!--- When done go back to movie list --->
<cflocation url="../select_advisor.cfm" addtoken="no">
