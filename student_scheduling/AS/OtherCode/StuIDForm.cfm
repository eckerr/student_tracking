<!--- StuIDForm.cfm --->



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Student ID Search Form</title>
</head>

<body>
<!--- student id search form --->
<FORM ACTION= "formStuSearch_action.cfm" METHOD="POST">

Please enter the <b>Student ID</b> or <b>Last Name</b> and then click <B>Process</B>.
<P>
Student ID:
<INPUT TYPE="text" NAME="StudentID" />
<br />
<INPUT TYPE="submit" VALUE="Process" />
</FORM>

<BR />
<BR />
<A HREF="SAMainMenu.cfm">Return to Main Menu</A>


</body>
</html>