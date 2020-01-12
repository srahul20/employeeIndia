<%@page import="java.sql.ResultSet"%>
<%@page import="emp.DbHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<!--
highest qualification
course
specialization
university/college
course type ...full part correspondence
passing year
other qualification
key skills
!-->
<%
   String value=request.getParameter("value");
  System.out.print(value);
   if(value.contains("complete")){
%>
<div class="container">
<form action="upload.jsp?value=com" method="post">

     <div class="form-group">
     <b> <label>HIGHEST QUALIFICATION :  *</label></b>
   
      <select class="form-control" name="qual" size=".5px">
        <option>GRADUATION</option>
        <option disabled="disabled">COMMING SOON</option>
       
         </select>
  
    </div>
   <div class="form-group">
     <b> <label>COURSE :  *</label></b>
   
      <select class="form-control" name="course" size=".5px">
        <option>BTECH</option>
        <option disabled="disabled">COMMING SOON</option>
         </select>
  
    </div>
   <div class="form-group">
      <b><label >SPECIALIZATION :  *</label></b>
   
      <select class="form-control" name="spec" size=".5px">
        <option>CSE</option>
        <option>IT</option>
        <option disabled="disabled">COMMING SOON</option>
        
      </select>
  
    </div>
   <div class="form-group">
     <b> <label>UNIVERSITY/COLLEGE :  *</label></b>
      <input type="text" class="form-control"  placeholder="Enter University/College" name="coll" required="required">
    </div>
   <div class="form-group">
     <b> <label >COURSE TYPE :  *</label></b><br>
      <label class="radio-inline">
   <b>   <input type="radio" name="optradio" value="full" checked>FULL TIME</b>
    </label>
    
    <b>  <input type="radio" name="optradio" value="part">PART TIME</b>
  
  <b>  <input type="radio" name="optradio" value="corr">CORRESPONDENCE</b>
    
 
    </div>
   <div class="form-group">
     <b> <label>PASSING YEAR :  *</label></b><br>
      <input type="number" placeholder="Enter Year of Passing" name="year" required="required" maxlength="4">
    </div>
   <div class="form-group">
     <b> <label >KEY SKILLS :  *  (Seperated by , )</label></b>
      <input type="text" class="form-control"  placeholder="Enter Key Skills" name="skills" required="required">
    </div>
     <div class="form-group">
     <b> <label >JOB LOCATION :   * </label></b>
      <input type="text" class="form-control"  placeholder="Enter JOB Location" name="location" required="required">
    </div>
    <input type="submit" value="ADD" class="btn btn-success">
    <input type="reset" value="reset" class="btn btn-danger">
</form>
</div>   
<%}else if(value.contains("edit")){ 
   DbHandler obj=new DbHandler();
   String email=(String) session.getAttribute("unm");
   ResultSet rset=obj.getProfile(email);
   if(rset.next()){
   String qual=rset.getString("qual"),course=rset.getString("course"),
		   spec=rset.getString("spec"),coll=rset.getString("college"),
		   optradio=rset.getString("ctype"),year=rset.getString("pyear"),
		   skills=rset.getString("skills"),location=rset.getString("jobloc");
		   


%>
<div class="container">
<form action="upload.jsp?value=update" method="post">

     <div class="form-group">
     <b> <label>HIGHEST QUALIFICATION :  *</label></b>
   
      <select class="form-control" name="qual" size=".5px">
        <option>GRADUATION</option>
        <option disabled="disabled">COMMING SOON</option>
       
         </select>
  
    </div>
   <div class="form-group">
     <b> <label>COURSE :  *</label></b>
   
      <select class="form-control" name="course" size=".5px">
        <option>BTECH</option>
        <option disabled="disabled">COMMING SOON</option>
         </select>
  
    </div>
   <div class="form-group">
      <b><label >SPECIALIZATION :  *</label></b>
   
      <select class="form-control" name="spec" size=".5px">
        <%if(spec.contains("CSE")){ %>
        <option selected="selected">CSE</option>
        <option>IT</option>
        <%}else{ %>
        <option>CSE</option>
        <option selected="selected">IT</option>
        <%} %>
        <option disabled="disabled">COMMING SOON</option>
        
      </select>
  
    </div>
   <div class="form-group">
     <b> <label>UNIVERSITY/COLLEGE :  *</label></b>
      <input type="text" class="form-control"  placeholder="<%out.print(coll); %>" name="coll" >
    </div>
   <div class="form-group">
     <b> <label >COURSE TYPE :  *</label></b><br>
      <label class="radio-inline">
      <%if(optradio.contains("full")){ %>
   <b>   <input type="radio" name="optradio" value="full" checked>FULL TIME</b>
    </label>
    
    <b>  <input type="radio" name="optradio" value="part">PART TIME</b>
  
  <b>  <input type="radio" name="optradio" value="corr">CORRESPONDENCE</b>
    <%}else if(optradio.contains("part")){ %>
   <b>   <input type="radio" name="optradio" value="full">FULL TIME</b>
    
    <b>  <input type="radio" name="optradio" value="part" checked="checked">PART TIME</b>
  
  <b>  <input type="radio" name="optradio" value="corr">CORRESPONDENCE</b>
     <%}else{ %>
     <b>   <input type="radio" name="optradio" value="full">FULL TIME</b>
    </label>
    
    <b>  <input type="radio" name="optradio" value="part">PART TIME</b>
  
  <b>  <input type="radio" name="optradio" value="corr" checked="checked">CORRESPONDENCE</b>
   <%} %>
 
    </div>
   <div class="form-group">
     <b> <label>PASSING YEAR :  *</label></b><br>
      <input type="number" placeholder="<%out.print(year) ;%>" name="year"  maxlength="4">
    </div>
   <div class="form-group">
     <b> <label >KEY SKILLS :  *  (Seperated by , )</label></b>
      <input type="text" class="form-control"  placeholder="<%out.print(skills); %>" name="skills" >
    </div>
     <div class="form-group">
     <b> <label >JOB LOCATION :   * </label></b>
      <input type="text" class="form-control"  placeholder="<%out.print(location); %>" name="location" >
    </div>
    <input type="submit" value="ADD" class="btn btn-success">
    <input type="reset" value="reset" class="btn btn-danger">
</form>
</div>   


<%} 

}%>
</body>
</html>