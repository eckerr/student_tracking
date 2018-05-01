<title>Process Majors</title><!---
Name:        movie_process.cfm
Author:      Ben Forta (ben@forta.com)
Description: Dual purpose edit page
Created:     4/20/02
--->

<!--- Edit or update? --->
<cfif IsDefined("FORM.MajorID")>
    <!--- Update movie --->
    <cfupdate datasource="csrmain" tablename="Majors">
<cfelse>
    <!--- Add movie --->
    <cfinsert datasource="csrmain" tablename="Majors">
</cfif>

<!--- When done go back to movie list --->
<cflocation url="show_majors.cfm" addtoken="no">
