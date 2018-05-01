
<!--- Set first2 to the first two letters of the name for sorting --->
<cfset Form.first2 = left(#SName#,2)>

<!--- Begin Encrypt Code --->
<cfset Form.SName= Encrypt("#Form.SName#", "snamILIS0720")>
<cfset Form.SIDNumber = Encrypt("#Form.SIDNumber#", "sidnILIS0720")>
<!--- End Encrypt code --->

<!--- Edit or update? --->
<cfif IsDefined("FORM.StudentID")>
    <!--- Update movie --->
    <cfupdate datasource="csrmain" tablename="Students">
<cfelse>
    <!--- Add movie --->
    <cfinsert datasource="csrmain" tablename="Students">
</cfif>

<!--- When done go back to movie list --->
<cflocation url="show_students.cfm" addtoken="no">
