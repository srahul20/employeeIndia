<%@page import="java.sql.ResultSet"%>
<%@page import="emp.DbHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>EMPLOYEE INDIA</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">


</head>
<body>

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" style="color: white;">EMPLOYEE INDIA</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

  
    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="company.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" href="cheader.jsp?value=jobs" id="pagesDropdown" role="button"  aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Post Jobs</span>
        </a>
              </li>
      <li class="nav-item">
        <a class="nav-link" href="cheader.jsp?value=tests">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Post Tests</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="cheader.jsp?value=project">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Post Project</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Log out</span></a>
      </li>
    </ul>
<%
		String value=request.getParameter("value");
		DbHandler obj=new DbHandler();
		String tid=request.getParameter("tid");
%>
  <div id="content-wrapper">
  <div class="container-fluid">

<%
    if(value.contains("edit")){
 	   String unm=(String) session.getAttribute("unm");
 	   ResultSet rset=obj.getTestDetail(tid);
 	   if(rset.next()){
 		  String name=rset.getString("cname"),tname=rset.getString("tname"),
 	    		  marks=rset.getString("marks"),time=rset.getString("time1"),
 	    		ins1=rset.getString("in1"),ins2=rset.getString("in2"),
 	    		ins3=rset.getString("in3"),ins4=rset.getString("in4"),
 	    		ins5=rset.getString("in5"),ins6=rset.getString("in6"),
 	    		ins7=rset.getString("in7"),sdate=rset.getString("sdate"),
 	    		edate=rset.getString("edate"),stime=rset.getString("stime"),
 	    		etime=rset.getString("etime");
 	      
%>
  <div class="container">
   <div class="jumbotron" style="background-color: gray;">
   <b><h2 style="text-align: center;color: black;">TEST PANEL</h2></b>
   </div>
   <div class="jumbotron">
      <div class="row">
  <form action="edtest.jsp?value=update&tid=<%out.print(tid);%>" method="post">
    <div class="form-group">
      <h2>TEST ID:<b style="color: red;"> #<%out.print(tid);%></h2></b>
    </div>
    </div><br>
    <div class="form-group">
      <label><h3>Company Name:</h3></label>
      <input type="text" class="form-control" placeholder="Example TCS,Wipro etc." value="<%out.print(name); %>" name="name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Company Name.</div>
    </div>
    <div class="form-group">
      <label><h3>Test Name:</h3></label>
      <input type="text" class="form-control" value="<%out.print(tname); %>" placeholder="National Talent Hunt" name="tname" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Test Name.</div>
    </div>
    <div class="form-group">
      <label><h3>Test Marks:</h3></label>
      <input type="number" class="form-control" value="<%out.print(marks); %>" placeholder="Example 80,100" name="marks" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Marks.</div>
    </div>
    <div class="form-group">
      <label><h3>Test Start Date:</h3></label>
      <input type="date" class="form-control" value="<%out.print(sdate); %>" name="sdate" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Time.</div>
    </div>
    <div class="form-group">
      <label><h3>Test End Date:</h3></label>
      <input type="date" class="form-control" value="<%out.print(edate); %>" name="edate" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Time.</div>
    </div>
        <div class="form-group">
      <label><h3>Test Start Time:</h3></label>
      <input type="time" class="form-control" value="<%out.print(stime); %>"  name="stime" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Time.</div>
    </div>
    <div class="form-group">
      <label><h3>Test End Time:</h3></label>
      <input type="time" class="form-control"  value="<%out.print(etime); %>" name="etime" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Time.</div>
    </div>
    <div class="form-group">
      <label><h3>Test Duration Time:</h3></label>
      <input type="number" class="form-control" value="<%out.print(time); %>" placeholder="Example 30,60 (min)" name="time" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Time.</div>
    </div>
        <div class="form-group">
      <label><h3>Instructions: (Minimum 3)</h3></label>
      <input type="text" class="form-control" value="<%out.print(ins1); %>" placeholder="Test is of 25 marks" name="in1" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" value="<%out.print(ins2); %>" placeholder="Total time is 30 min" name="in2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" value="<%out.print(ins3); %>" placeholder="Do not close browser" name="in3" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" value="<%out.print(ins4); %>" placeholder="Phones are not allowed" name="in4">
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" value="<%out.print(ins5); %>" placeholder="Other" name="in5" >
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" value="<%out.print(ins6); %>" placeholder="Other" name="in6" >
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" value="<%out.print(ins7); %>" placeholder="Other" name="in7" >
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div>
   
    </div>
    <input type="submit" class="btn btn-success" value="Update Test">
    
 </form>
   
   </div>
   </div>
   
 
<%}}else if(value.contains("delete")){
	
	boolean res=obj.deleteTests(tid);
	if(res)
	{
		response.sendRedirect(request.getContextPath()+"/cheader.jsp?value=tests");
	}
} 



else if(value.contains("update")){
	
	 String name=request.getParameter("name"),tname=request.getParameter("tname"),
   		  marks=request.getParameter("marks"),time=request.getParameter("time"),
   		ins1=request.getParameter("in1"),ins2=request.getParameter("in2"),
   		ins3=request.getParameter("in3"),ins4=request.getParameter("in4"),
   		ins5=request.getParameter("in5"),ins6=request.getParameter("in6"),
   		ins7=request.getParameter("in7"),sdate=request.getParameter("sdate"),
   		edate=request.getParameter("edate"),stime=request.getParameter("stime"),
   		etime=request.getParameter("etime"),tid1=request.getParameter("tid");
     
	 if(ins4==null)
     {
   	  ins4="0";
     }
     if(ins5==null)
     {
   	  ins5="0";
     }
     if(ins6==null)
     {
   	  ins6="0";
     }
     if(ins7==null)
     {
   	  ins7="0";
     }
	 
     boolean res=obj.updateTest(tid1,name,tname,marks,time,sdate,edate,stime,etime,ins1,ins2,ins3,ins4,ins5,ins6,ins7);
	if(res)
	{
		response.sendRedirect(request.getContextPath()+"/cheader.jsp?value=tests");
	}

}
%>




</div>
</div>


<!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/chart.js/Chart.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>


</body>
</html>