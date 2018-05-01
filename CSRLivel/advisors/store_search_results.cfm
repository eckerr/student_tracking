<!--- Store search results on server for use later --->
<cfset SESSION.CQuarter = #Form.CQuarter#>
<cfset SESSION.CYear = #Form.CYear#>
<cfset SESSION.StudentID = #Form.StudentID#>
<cfset SESSION.Assignedto = #Form.Assignedto#>
<cfset SESSION.WeekID = #Form.WeekID#>
<cfset SESSION.MajorID = #Form.MajorID#>
<cfset SESSION.LevelID = #Form.LevelID#>
<cfset SESSION.InstructorID = #Form.InstructorID#>
<cfset SESSION.CourseID = #Form.CourseID#>

<!--- Jump to search results page --->
<cflocation url="search_results.cfm" addtoken="no">


