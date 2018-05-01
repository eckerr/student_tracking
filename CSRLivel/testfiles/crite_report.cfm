<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--- Here you retrieve the data that's going to be printed --->

<cfquery datasource="csrmaintest" name="countrecords">

SELECT Count(*) AS total, Count(Absence) AS total_absence, Count(Tardiness) AS total_tardy 
FROM Events
WHERE Qtr = #Quarter(Now())# AND YearStamp = #Year(Now())#

</cfquery>
<!--- Now let's create the page that will be printed --->

<cfset percent_absence = Round((#countrecords.total_absence#/#countrecords.total#)*100)>
<cfset percent_tardy = Round((#countrecords.total_tardy#/#countrecords.total#)*100)>
<body>
<cfoutput>
#countrecords.total#(<br />
#countrecords.total_absence#&nbsp;&nbsp;&nbsp;&nbsp;#percent_absence#% <br />
#countrecords.total_tardy#&nbsp;&nbsp;&nbsp;&nbsp;#percent_tardy#%

</cfoutput>

</body>
</html>


