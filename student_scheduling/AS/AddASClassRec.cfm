<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<!--- New ASClassInfo form --->
<FORM ACTION="InsertASClassRecs.cfm" method="POST">

<TABLE ALIGN="center" bgcolor="#00FFFF">
   <TR>
     <TH colspan="2">
     <font size="+1">Add new course info</font>
     </TH>
   </TR>
 <!---  <TR>
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
     </TR>--->
     <TR>
       <TD>
          CoursePrefix:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="CoursePre"
          MESSAGE=" Course Prefix is required!"
          REQUIRED="YES"
          SIZE="4"
          MAXLENGTH="4">
        </TD>
     </TR>
      <TR>
       <TD>
          Course Number:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="CourseNum"
          MESSAGE=" Course Number is required!"
          REQUIRED="YES"
          VALIDATE="INTEGER"
          SIZE="3"
          MAXLENGTH="3">
        </TD>
     </TR>
       <TR>
       <TD>
          Course Name:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="CourseName"
          MESSAGE=" Course Name is required!"
          REQUIRED="YES"
          SIZE="40"
          MAXLENGTH="40">
        </TD>
     </TR>
      <TR>
       <TD>
          Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="IQu"
          SIZE="2">
        </TD>
     </TR>
     <TR>
       <TD>
          Course Level:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="CLevel"       
          SIZE="3">
        </TD>
     </TR>
<!---     <TR>
       <TD>
           MAA Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="MAAIQu"
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          GAD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="GADIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
       
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          FM Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="FMIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
       
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          FD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="FDIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
    
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          VFX Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="VFXIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
        
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          WDIM Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="WDIMIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
     
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          ILD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="ILDIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
         
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          ID Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="IDIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
          
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          HM Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="HMIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
   
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          GD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="GDIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
       
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          AUD Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="AUDIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
          
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          ADV Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="ADVIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
     
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          DPH Ideal Quarter:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="DPHIQu"
          REQUIRED="NO"
          VALIDATE="INTEGER"
       
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
     <TR>
       <TD>
          Is Prerequisite?
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="IPR"
          REQUIRED="NO"
          VALIDATE="INTEGER"
        
          SIZE="1"
          MAXLENGTH="1">
        </TD>
     </TR>
	 
	 <TR>
       <TD>
          General Education Group:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="GEGroup"
          REQUIRED="NO"
          VALIDATE="INTEGER"
          
          SIZE="2"
          MAXLENGTH="2">
        </TD>
     </TR>
      </TR><TR>
       <TD>
          Needs PreReq 1:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="NPR1"
          REQUIRED="NO"
         
          SIZE="7"
          MAXLENGTH="7">
        </TD>
     </TR>
      </TR>
      </TR><TR>
       <TD>
          Needs PreReq 2:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="NPR2"
          REQUIRED="NO"
         
          SIZE="7"
          MAXLENGTH="7">
        </TD>
     </TR>
      </TR>
      </TR><TR>
       <TD>
          Needs PreReq 3:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="NPR3"
          REQUIRED="NO"
         
          SIZE="7"
          MAXLENGTH="7">
        </TD>
     </TR>
     <TR>
       <TD>
          Pre req met:
       </TD>
       <TD>
          <INPUT TYPE="TEXT"
          NAME="PRM"
          REQUIRED="NO"
          VALIDATE="INTEGER"
          d
          SIZE="1"
          MAXLENGTH="1">
        </TD>
     </TR>
     --->
     
     
     <TR>
        <TD colspan="2" align="center">
            <input type="submit" value="insert" />
        </TD>
      </TR>
     </TABLE>   
     </FORM>       
          
</body>
</html>