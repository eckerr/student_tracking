<!--- Include back and next 

Filename: IncludeBackNext.cfm 
   adds the back and next links to move through file
--->

<!--- create next and back links --->
<CFOUTPUT>
  <!--- show link for Back if needed --->
  <CFIF StartRowBack GT 0>
   <A HREF="#CGI.SCRIPT_NAME#?StartRow=#StartRowBack#">
    <IMG SRC="../images/BrowseBack.gif" WIDTH="40" HEIGHT="16"
    ALT="Back #RowsPerPage# Records" BORDER="0"></A>
  </CFIF>
  <!--- show link for Next if needed --->
  <CFIF StartRowNext LTE TotalRows>
     <A HREF="#CGI.SCRIPT_NAME#?StartRow=#StartRowNext#">
        <IMG SRC="../images/BrowseNext.gif" WIDTH="40" HEIGHT="16"
          ALT="Next #RowsPerPage# Records" BORDER="0"></A>
  </CFIF>
</CFOUTPUT>  