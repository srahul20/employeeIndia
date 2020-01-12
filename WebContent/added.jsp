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

DbHandler obj=new DbHandler() ;
String aa=(String)session.getAttribute("tid");

String value=(String) session.getAttribute("value");

if(value.contains("update")){
	 String ques=request.getParameter("question"),a=request.getParameter("a"),b=request.getParameter("b"),
				c=request.getParameter("c"),d=request.getParameter("d"),ans=request.getParameter("answer"),
				set=request.getParameter("set");
	 String qid=(String) session.getAttribute("qid");
	 boolean re=obj.updateQuestion(qid,aa,ques, a, b, c, d, ans, set);
		if(re)
		{ 
			 session.removeAttribute("value");
			response.sendRedirect(request.getContextPath()+"/addques.jsp?value=add&tid="+aa);

			}
		
}
else if(value.contains("add")){
	
   String ques=request.getParameter("question"),a=request.getParameter("a"),b=request.getParameter("b"),
	c=request.getParameter("c"),d=request.getParameter("d"),ans=request.getParameter("answer"),
	set=request.getParameter("set");
	boolean re=obj.insertQuestion(aa, ques, a, b, c, d, ans, set);
	if(re)
	{

		 session.removeAttribute("value");
		response.sendRedirect(request.getContextPath()+"/addques.jsp?value=add&tid="+aa);

		}
	
}	
	
%>
</body>
</html>