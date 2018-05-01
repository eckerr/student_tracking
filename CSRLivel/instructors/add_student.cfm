<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Add Student</title>
<link href="../main.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="input_student.cfm">Go Back</a></li>

</ul>
</div>
<cfform name="save_student" id="form1" method="post" action="save_student.cfm">
<fieldset><legend>Last Name comma First Name. Student ID in the next field</legend>
      <input type="hidden" name="MajorID" value="16" />
      <input type="hidden" name="LevelID" value="1" />
	  <input type="hidden" name="Scodecurrent" value="000" />
      <input type="hidden" name="Scodenext" value="000" />
      


	<p><label>Student Name:</label>
      <cfinput	type="text"
	  			name="SName"
				size="30"
				required="yes"
				message="Student Name is required"><br /><span style="margin-left:136px;">i.e. Lunn, Terry</span></p>
	
      <p><label>Student ID:</label>
      <cfinput 	type="text" 
	  			name="SIDNumber" 
				size="10"
                maxlength="10"
				required="yes"
				message="StudentID is Required"><br /><span style="margin-left:136px;">must be 10 characters or end in IS</span></p>

        <p class="submit"><label>Submit:</label><input type="submit" value="submit" />&nbsp;&nbsp;
       
        <span style="color: #000;">Reset: </span> <input type="reset" value="reset" /></p>
	
		
  </fieldset>
</cfform>
</div>
</body>
</html>
