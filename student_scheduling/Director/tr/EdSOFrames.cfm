<!--- EdSOFrames.cfm  
   Description: frames for scheduling aid Schedule out
   
   --->
<CFSET SIDN = #URL.Sid#>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Scheduling Aid</title>
</head>
<!--- set up the two frames --->
<FRAMESET COLS="50%,50%">
<CFOUTPUT>
  <FRAME NAME="MajFrame" SRC="StudentDetScheduleOut.cfm?Sid=#SIDN#">
  <FRAME NAME="GEFrame"  SRC="GenEdDetailF.cfm?Sid=#SIDN#">
</CFOUTPUT>
</FRAMESET><noframes></noframes>  
