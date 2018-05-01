<!--- ASStuIDForm.cfm --->



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Student ID Search Form</title>
</head>

<body>
<!--- student id search form --->
<FORM ACTION= "ASformStuSearch_action.cfm" METHOD="POST">

Please enter the <b>Student ID</b> or <b>Last Name</b> and then click <B>Process</B>.
<P>
Student ID:
<INPUT TYPE="text" NAME="StudentID" />
<br />
<INPUT TYPE="submit" VALUE="Process" />
<br />
<br />
(first letter of last name must be capitalized)
</FORM>

<BR />
<BR />
<A HREF="ASMainMenu.cfm">Return to Main Menu</A>


</body>
</html>