<HTML>
<HEAD>
 <TITLE> If 5 </TITLE>
 </HEAD>
 
 <BODY>
 
 <!--- Get day of week --->
 <CFSET dow=DayOfWeek(Now())>
 
 <!--- Let the user know --->
 <CFIF dow IS 1>
 <!--- it is sunday --->
 It is the weekend! But make the most of it, tomorrow it is back to work.
 
 <CFELSEIF dow IS 7>
 <!--- it is saturday --->
 It is the weekend, and better still tomorrow is also the weekend!
 <CFELSE >
 <!--- no it is not the weekend --->
 It is not the weekend yet, fortunately!!!
 </CFIF>
 
 </BODY>
 </HTML>
 