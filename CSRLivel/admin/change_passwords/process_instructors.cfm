

<!--- Begin Encrypt Code --->
<cfset Form.IUserName= Encrypt("#Form.IUserName#", "iuserILIS0720")>
<cfset Form.IPassword = Encrypt("#Form.IPassword#", "ipassILIS0720")>
<!--- End Encrypt code --->

<!--- Edit or update? --->
<cfif IsDefined("FORM.InstructorID")>
    <!--- Update movie --->
    <cfupdate datasource="csrmain" tablename="Instructors">
<cfelse>
    <!--- Add movie --->
    <cfinsert datasource="csrmain" tablename="Instructors">
</cfif>

<!--- When done go back to movie list --->
<cflocation url="show_instructors.cfm" addtoken="no">
