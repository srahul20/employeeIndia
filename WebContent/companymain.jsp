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
   String value=request.getParameter("value");
   String unm=(String)session.getAttribute("unm");
   DbHandler obj=new DbHandler();
   if(value.contains("jobs")){ 
	   
    String jobid=request.getParameter("id"),name=request.getParameter("name"),
    		pos=request.getParameter("pos"),office=request.getParameter("office"),
    		sal=request.getParameter("sal"),desc=request.getParameter("desc"),
    		more=request.getParameter("more");
     boolean res=obj.postJob(jobid,name,pos,office,sal,desc,more,unm);
     if(res)
     {
    	 response.sendRedirect(request.getContextPath() +"/company.jsp");
     }

}
   else if(value.contains("project"))
   {
	   String pid=request.getParameter("id"),name=request.getParameter("name"),
			   pname=request.getParameter("pname"),desc=request.getParameter("desc"),
			   more=request.getParameter("more");
	   boolean res=obj.postProject(pid,name,pname,desc,more,"0",unm);
	     if(res)
	     {
	    	 response.sendRedirect(request.getContextPath() +"/company.jsp");
	     }

   }


%>
some error occured
</body>
</html>