<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--- Here you retrieve the data that's going to be printed --->

<cfquery datasource="csrmain" name="qGetRecords">
SELECT *
FROM Events, Students, Instructors, Courses
WHERE (Absence = 'x' OR Tardiness = 'x' OR PoorQltyWork = 'x' OR MissingWork = 'x' OR NotPrepared = 'x' OR Other = 'x' ) AND Events.CourseID = Courses.CourseID AND Events.StudentID = Students.StudentID AND Events.InstructorID = Instructors.InstructorID AND Qtr = #Quarter(Now())# AND YearStamp = #Year(Now())#
<cfif #FORM.weekrangeID# IS 1>
AND WeekID BETWEEN 1 AND 3
</cfif>
<cfif #FORM.weekrangeID# IS 4>
AND WeekID BETWEEN 4 AND 6
</cfif> 
<cfif #FORM.weekrangeID# IS 7>
AND WeekID BETWEEN 7 AND 9
</cfif>
ORDER BY IName, InputDate DESC
</cfquery>
<!--- Now let's create the page that will be printed --->

<head>
<title>Progress Report</title>

<style type="text/css">
<!--
.boxleft {
	width: 300px;
	float:left;
	text-align:left;
}

.boxright {
	width: 300px;
	float: right;
	text-align: left;
}

 .weeks {
	 width: 100%;
	 padding-bottom: 5px;
	 border-bottom: 2px solid #868686;
	 margin-bottom: 5px;
}
 
 .content {
	 width:100%;
	 margin-top: 5px;
	 border-top: 2px solid #868686;
	 padding-top: 5px;
	
}

	 
-->
</style>
</head>
<body onload="Javascript:window.print();">
<cfoutput query="qGetRecords">
<div id="container">
<blockquote><div id="logo"><img src="../../images/schaumburg_logo.gif" alt="ILIS Logo" /></div>
<div id="title">Academic Progress Report</div>
<div class="weeks">Week: #weekID#</div>


<cfset decr_sname=Decrypt(SName, "snamILIS0720")>

<cfset lname = ListFirst(#decr_sname#)>
<cfset fname = ListLast(#decr_sname#)>
<cfset fullname = fname&" "&lname>

<span class="boxleft">Student: #fullname#</span> <span class="boxright">Instructor: #IName#</span><br />
<span class="boxleft">Course: #CourseCode#</span> <span class="boxright">Date: #DateFormat(Now())#</span><br />



<div class="content">
<strong>From the Office of the Dean:</strong> The College continuously assesses  the progress that students are making toward successful completion of their courses. Based on our observation and your behavior we find that <strong>you are in danger of failing this course:</strong> 
  <cfif #Other# IS 'x'>
<p>You have received a failing grade for this course at mid-quarter. Your failure may be based on incomplete assignments, absences, tardiness or  poor quality work. See your instructor immediately after class to discuss your situation and together you may be able find a solution to this issue.
</p>
</cfif>
<cfif #Absence# IS 'x'>
<p>The College is concerned about your absences. Missing  classes puts an undue hardship on you. What you are learning in this class requires that you be present. A lot of material is covered in a very short period of time and when you are absent, you fall behind. You need to be in every scheduled class, on time, and ready to work. Attendance is one of the keys to success and is a good trait to develop as you prepare for your career after graduation and part of being a professional.</p>
</cfif>
<cfif #Tardiness# IS 'x'>
<p>You have been tardy for class. Because of the amount of material covered, classes must begin on time. When you come in late, you place an undue burden on yourself and your classmates.  Sometimes things occur that cause us to be late. You should plan on being early to any appointment, meeting or class so that if something does occur, you will still be on time.  Being on time is a good trait to develop as you prepare for your career after graduation and part of being a professional.</p>
</cfif>
<cfif #PoorQltyWork# IS 'x'>
  There are some concerns about the quality of the work you are submitting. As you are well aware, the College tries to work with our students to develop their talents and skills.   For help in improving the quality of your work, see your instructor to explain areas for your improvement.  We are trying to prepare all of our students for the high expectations of their careers once they graduate.
</cfif>
<cfif #MissingWork# IS 'x'>
<p>Based on your instructor's records, you are missing assignments. If the records are in error, please see your instructor to correct them. If your work is truly missing, you need to see your instructor to resolve this issue. Assignments are expected to be turned in on time and completed as well as you can. Late assignments or poor quality work establishes bad habits for your performance once you get into your career. It is necessary to speak with your instructor privately at your earliest convenience to address this missing work. </p>
</cfif>
<cfif #NotPrepared# IS 'x'>
  You are coming to class unprepared. Each class period is demanding in what must be accomplished and what you have to learn. When you come to class unprepared, you add to the demands of that particular class.  If there are issues which are causing you to come to class unprepared, please speak with your instructor privately to see if these issues can be resolved those issues. It is expected that you come to class ready and prepared to learn and do what is asked of you. This is what is expected of you in your career also.
</cfif>
</div>

<div id="footer">
  <p>Since your future success is in jeopardy, please see your instructor as soon as possible.  Please check your course syllabus for contact information. If you do not address this situation  immediately, your grade may be adversely affected.
  </p>
</div></blockquote>

<p STYLE="page-break-before: always;">&nbsp;</p>
</cfoutput>
</body>
</html>


