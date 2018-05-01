<!--- ASClassCodeForm.cfm --->



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Class Code Search Form</title>
</head>

<body>
<!--- class code search form --->
<FORM ACTION= "ASformClassCode_action.cfm" METHOD="POST">

Please enter the <b>Class Code Prefix</b> and <b>Number</b> and then click <B>Process</B>.
<P>
<table>
 <tr>
  <td>
    Class Code Prefix:
  </td>
  <td>  
	<INPUT TYPE="text" NAME="ClassCode"
    size="4"
    maxlength="4" />
  </td>
 </tr>
 <tr>
   <td>
        Number:
   </td>
   <td>     
     <INPUT TYPE="text" NAME="ClassNum" 
     size="3"
     maxlength="3"/>
   </td>
 </tr>
 </table>  
<INPUT TYPE="submit" VALUE="Process" />
</FORM>

<BR />
<BR />
<A HREF="ASMaint.cfm">Return to Maintenance Menu</A>


</body>
</html>