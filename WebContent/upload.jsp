<%@page import="java.sql.ResultSet"%>
<%@page import="emp.DbHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="pick.css">
</head>
<body>
<%

String unm=(String)session.getAttribute("unm");
DbHandler obj=new DbHandler();  
String qual=request.getParameter("qual"),course=request.getParameter("course"),
  spec=request.getParameter("spec"),coll=request.getParameter("coll"),
  optradio=request.getParameter("optradio"),year=request.getParameter("year"),
  skills=request.getParameter("skills"),location=request.getParameter("location");
 String value=request.getParameter("value");
 System.out.println(qual+course+spec+coll+optradio+year+location+skills);
 if(value.contains("update")){
	ResultSet rset=obj.getProfile(unm);
	if(rset.next()){
	 if(coll.contains(""))
	 {
		 coll=rset.getString("college");
	 }
	 if(year.contains(""))
	 {
		 year=rset.getString("pyear");
	 }
	 if(skills.contains(""))
	 {
		 skills=rset.getString("skills");
	 }
	 if(location.contains(""))
	 {
		 location=rset.getString("jobloc");
	 }
	}
 }
 boolean res=obj.updateCProfile(unm,qual,course,coll,spec,year,location,skills,optradio);
 
 if(res){
%>
	<div id="login-box">
		      <div class="left-box">
		        <h1> Details</h1>
		      
		       <p><h4>SKILLS :</h4><h5 style="color: red;"><% out.print(skills.toUpperCase()); %></h5></p> 
		       <p><h4>LOCATION:</h4><h5 style="color: red;"><% out.print(location.toUpperCase()); %></h5></p> 
		       <p><h4>COURSE TYPE:</h4><h5 style="color: red;"><% out.print(course.toUpperCase()); %></h5></p> 
		       
		      <a href="completeProfile.jsp" class=" btn btn-primary">CHANGE DETAILS</a>
		       
		        </div>
		        <div class="right-box">
		        <h1>UPLOAD CV/RESUME</h1>
		        <form action="Auth?name=<%out.print(unm); %>" enctype="multipart/form-data" method="post">
		          <input type="file" name="file" required="required">
		          <input type="submit" value="submit" >
		          <br><br>
		          
		             </form> 
		             UPLOAD CV/RESUME
		             <br>
		             <a href="student.jsp" class="btn btn-success">CONTINUE WITHOUT ULPOADING</a>
		        </div>
		       
		    </div>
<%}
 else{
 %><h1 style="text-align: center">SOME ERROR OCCURED</h1>
 <br>
 <a href="completeProfile.jsp" class="btn btn-primary">TRY-AGAIN</a>
 <%} %>
</body>
</html>