<CFQUERY datasource="AllSchoolAudit"
  Name="DegTyp">
  Select DegreeType, DegreeCode from DegreeTypeInfo
  </CFQUERY>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<!--- New ASProgramInfo form --->
<FORM ACTION="InsertASProgramRecs.cfm" method="POST">

<TABLE ALIGN="center" bgcolor="#00FFFF">
   <TR>
     <TH colspan="2">
     <font size="+1">Add new program info</font>
     </TH>
   </TR>
   <TR>
       <TD>
          Program Code:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="ProgramCode"
          MESSAGE=" Program Code is required!"
          value="UNDG"
          REQUIRED="YES"
          SIZE="5"
          MAXLENGTH="5">
        </TD>
     </TR>
      <TR>
       <TD>
          Program Name:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="ProgramName"
          MESSAGE=" Program Name is required!"
          REQUIRED="YES"
          value="Undergraduate"
          SIZE="40"
          MAXLENGTH="40">
        </TD>
     </TR>
           <TR>
       <TD>
          Degree Type:
       </TD>
       <TD>
       <!--- degree type list --->
       <SELECT NAME="DegreeCode">
       <CFOUTPUT QUERY="DegTyp">
         <OPTION Value='#DegreeCode#'>#DegreeType#</OPTION>
         </CFOUTPUT>
        </SELECT>
       </TD>
     </TR>
       <TR>
       <TD>
          Major Code:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="MajorCode"
          MESSAGE=" Major Code is required!"
          REQUIRED="YES"
          SIZE="5"
          MAXLENGTH="5">
        </TD>
     </TR>
      <TR>
       <TD>
          Major Name:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="MajorName"
          SIZE="40"
          maxlength="40">
        </TD>
     </TR>
     <TR>
       <TD>
          Major Courses Required:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="MajReq"       
          SIZE="2"
          value="45"
          VALIDATE="INTEGER">
        </TD>
     </TR>
     <TR>
       <TD>
          Gen Ed Courses Required:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="GenReq"       
          SIZE="2"
          value="15"
          VALIDATE="INTEGER">
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