<title>Process Majors</title><!---
Name:        movie_process.cfm
Author:      Ben Forta (ben@forta.com)
Description: Dual purpose edit page
Created:     4/20/02
--->

<!--- Edit or update? --->
<cfif IsDefined("FORM.CourseID")>
    <!--- Update movie --->
    <cfupdate datasource="csrmain" tablename="Courses">
<cfelse>
    <!--- Add movie --->
    <cfinsert datasource="csrmain" tablename="Courses">
</cfif>

<!--- When done go back to movie list --->
<cflocation url="show_courses.cfm" addtoken="no">
