
<%@page import="emp.DbHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

  String value=request.getParameter("value");
System.out.print(value);

String t=request.getParameter("t");

  DbHandler obj=new DbHandler();
System.out.print(t);
if(value.contains("signin"))
{
	String email=request.getParameter("email"),pwd=request.getParameter("pwd");
	boolean res=obj.checkUser(pwd,email,t);
	if(res==true){
	session.setAttribute("unm", email);
	if(t.contains("employee")){
	response.sendRedirect(request.getContextPath()+"/student.jsp");
	}else
		response.sendRedirect(request.getContextPath()+"/company.jsp");	
	}
	else
		response.sendRedirect(request.getContextPath()+"/loginsign.jsp#login");	
	
}
else if(value.contains("reg")){
	String fname =request.getParameter("fname"),lname=request.getParameter("lname"),
	email=request.getParameter("email"),pwd=request.getParameter("pwd"),
	cpwd=request.getParameter("cpwd"),phone=request.getParameter("phone"),
	gender=request.getParameter("optradio"),type=request.getParameter("radio");
   out.print(fname+lname+gender+type+pwd+email);
  
   
  boolean res= obj.InsertIntoUsers(fname, lname, email, pwd, phone, gender, type);
    
    if(res==true)
    {
    	session.setAttribute("unm", email);
    	if(type.contains("employee")){
    	response.sendRedirect(request.getContextPath()+"/student.jsp");
    	}else{
    		response.sendRedirect(request.getContextPath()+"/company.jsp");
    	    
    	}
    	
    	}
    else
    {
    	out.print("error");
    }

}else{
	
	
}
%>
</body>
</html>