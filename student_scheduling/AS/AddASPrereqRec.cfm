<CFQUERY datasource="AllSchoolAudit"
  Name="MajC">
  Select MajorCode, MajorName from ProgramInfo
  ORDER BY MajorName
  </CFQUERY>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<!--- New ASPrereqInfo form --->
<FORM ACTION="InsertASPrereqRec.cfm" method="POST">

<TABLE ALIGN="center" bgcolor="#00FFFF">
   <TR>
     <TH colspan="2">
     <font size="+1">Add new prereq info</font>
     </TH>
   </TR>
   <TR>
       <TD>
          Major Code:
       </TD>
       <TD>
       <!--- degree type list --->
       <SELECT NAME="MajorCode">
       <CFOUTPUT QUERY="MajC">
         <OPTION Value='#MajorCode#'>#MajorCode# - #MajorName#</OPTION>
         </CFOUTPUT>
        </SELECT>
       </TD>
     </TR>
       <TR>
       <TD>
          Course Code:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="CourseCode"
          MESSAGE=" Course Code is required!"
          REQUIRED="YES"
          SIZE="7"
          MAXLENGTH="7">
        </TD>
     </TR>
      <TR>
       <TD>
          Prereq Code:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="PrereqCode"
          SIZE="7"
          maxlength="7">
        </TD>
     </TR>
     <TR>
        <TD colspan="2" align="center">
            <input type="submit" value="insert" />
        </TD>
      </TR>
     </TABLE>   
     </FORM>       
          
</body>
</html>