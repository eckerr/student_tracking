<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Save Student</title>
<link href="../main.css" rel="stylesheet" type="text/css" />
</head>
 <!--- Encrption starts here --->
<cfset Form.SIDNumber = TRIM(FORM.SIDNumber)>
<cfset Form.SIDNumber = Encrypt("#Form.SIDNumber#","sidnILIS0720")>
<!--- Encrption finishes here --->

<cfquery name="checkID" datasource="csrmain">
SELECT StudentID
FROM Students
WHERE SIDNumber='#Form.SIDNumber#'
</cfquery>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="input_student.cfm">Check Student</a></li>
<li><a href="add_student.cfm">Go Back</a></li>

</ul>
</div>


<cfif checkID.recordcount GTE 1>
<h3> There is a student already in the database with the same ID</h3>

<h3>Select [Check Student] to see who the ID belongs to or,<br />select [Go Back] and renter the new student as you may have mistyped the student ID. <br />
</h3>
<cfabort>
</cfif>
<!--- if the student ID is unique add new student --->

<!--- Set first2 to the first two letters of the name for sorting --->
<cfset Form.first2 = left(#SName#,2)>

 <!--- Encrption starts here --->
<cfset Form.SName = Encrypt("#SName#","snamILIS0720")>
<!--- Encrption finishes here --->

<cfinsert tablename="Students" datasource="csrmain">

<!--- go get new StudentID to pass on to add event page --->
<cfquery name="getmaxid" datasource="csrmain">
SELECT StudentID
FROM Students
WHERE StudentID = (
SELECT MAX(StudentID) AS smax
FROM Students)
</cfquery>
<!--- Pass new StudentID to add even page --->
<cfoutput>
<cflocation url="add_new_event.cfm?StudentID=#getmaxid.StudentID#" addtoken="no">
</cfoutput>
</div>
</body>
</html>
