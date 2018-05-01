<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Process Results</title>
</head>

<body>
<cfparam name="Form.Absence" default="">
<cfparam name="Form.Tardiness" default="">
<cfparam name="Form.PoorQltyWork" default="">
<cfparam name="Form.MissingWork" default="">
<cfparam name="Form.NotPrepared" default="">
<cfparam name="Form.Personal" default="">
<cfparam name="Form.Plagerism" default="">
<cfparam name="Form.InstructorNote" default="">
<cfparam name="Form.Other" default="">
<cfparam name="Form.Behavior" default="">
<cfparam name="Form.TalkedtoStudent" default="">
<cfparam name="Form.Financial" default="">
<cfparam name="Form.DrugsAlcohol" default="">

<cfupdate datasource="csrmain" tablename="Events">
<cflocation url="save_event.cfm">
</body>
</html>
