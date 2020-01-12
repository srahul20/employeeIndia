<%@page import="emp.DbHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  DbHandler obj=new DbHandler();
  String value=request.getParameter("value");
  String unm=(String)session.getAttribute("unm");


  if(value.contains("update")){
	  String pid=request.getParameter("pid");
	  String prog=request.getParameter("prog");
	  boolean res=obj.updateProject(pid,prog);
	  if(res)
	  {
		  response.sendRedirect(request.getContextPath()+"/student.jsp");
	  }
	  else{}
  }
  else if(value.contains("project"))
  {
	  String pid=request.getParameter("pid");
	  System.out.print(pid);
	  boolean res=obj.setProject(pid,unm);
	  if(res)
	  {
		  response.sendRedirect(request.getContextPath()+"/student.jsp");
	  }
	  else{}
  }else if(value.contains("remjobs"))
  {
	  String jobid=request.getParameter("jobid");
	  boolean result=obj.getAppliedJobs(jobid, unm);
	  if(result){
		  if(obj.removeAppliedJobs(jobid,unm))
		  response.sendRedirect(request.getContextPath()+"/sheader.jsp?value=jobs");
		  
	  }
	
	  
  }
  else if(value.contains("jobs")){
	  String jobid=request.getParameter("jobid");
	   boolean res=obj.setJobs(jobid,unm);
	  if(res)
	  {
		  response.sendRedirect(request.getContextPath()+"/sheader.jsp?value=jobs");
	  }
	  else{}
  }else if(value.contains("remove")){
	  String pid=request.getParameter("pid");
	  boolean res=obj.removeProject(pid);
	  if(res)
	  {
		  response.sendRedirect(request.getContextPath()+"/student.jsp");
	  }
	  else{}
  }else if(value.contains("update")){
	  String pid=request.getParameter("pid");
	  String prog=request.getParameter("prog");
	  boolean res=obj.updateProject(pid,prog);
	  if(res)
	  {
		  response.sendRedirect(request.getContextPath()+"/student.jsp");
	  }
	  else{}
  }
%>

</body>
</html>