<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Find Student</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../main.css" rel="stylesheet" type="text/css">
</head>

<body onLoad="document.input_student.SIDNumber.focus();">
<div id="wrapper">

<div id="logo">&nbsp;</div>
<div class="indentmenu">
<ul>
<li><a href="../logoff.cfm">Log Off</a></li>
<li><a href="save_event.cfm">Go Back</a></li>

</ul>
</div>
        
        <!--- Search form --->
<cfform action="find_student.cfm" name="input_student" method="POST">
          
<fieldset><legend>Input the Student ID - If left blank you will get all students </legend>
   <p><label>StudentID:</label>
            <cfinput type="text" name="SIDNumber" value=""></p>            

        <p class="submit"> <label>Submit:</label> <input type="submit" value="Search"></p>
        <p class="submit"> <label>Reset:</label> <input type="reset" value="Reset"></p>
<p>&nbsp;</p>
</fieldset>
</cfform>

<div id="footer">&nbsp;<br> </div>

</div>
</body>
</html>
