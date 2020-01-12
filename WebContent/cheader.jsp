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
%>
  <div id="content-wrapper">
        <div class="container-fluid">
   <%
     if(value.equals("jobs")){
    	 String id=obj.getJobId();
    	 System.out.print(id);
    	 System.out.print(value);
   %>
	
	<div class="container">
		<div class="jumbotron" style="background-color: gray;">
		 <h2 style="text-align: center;"> POST JOB </h2>
		</div>	<br>

<form action="companymain.jsp?value=jobs&id=<%out.print(id); %>" class="was-validated" method="post"> 
    <div class="row">
    <div class="form-group">
      <h2>JOB ID:<b style="color: red;"># <%out.print(id);%></h2></b>
    </div>
    </div>
    <div class="form-group">
      <label>Company Name:</label>
      <input type="text" class="form-control" placeholder="Example TCS,Wipro etc." name="name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Company Name.</div>
    </div>
    
    <div class="form-group">
      <label>Position:</label>
      <input type="text" class="form-control" placeholder="Example Senior developer" name="pos" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label>Office:</label>
      <input type="text" class="form-control" placeholder="Example Noida,Delhi" name="office" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label>Sallary:</label>
      <input type="number" class="form-control" placeholder="Enter sallary" name="sal" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
  <label>Job Description:*</label>
  <textarea class="form-control rounded-0" name="desc" rows="10"></textarea>
</div>
<div class="form-group">
<label>Other Description:*</label>
  <textarea class="form-control rounded-0" name="more" rows="10" placeholder="example accomodation,travelling expense etc."></textarea>
</div>
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" required> I agree on T&C.
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check T&C to continue.</div>
      </label>    
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
		
		</div>
	
	</div>

<%}
     else if(value.contains("tests")){
    	 String unm=(String) session.getAttribute("unm");
   %>

<div class="container">

<div class="jumbotron" style="background-color: gray;">

<b><h2 style="color:black;text-align: center;">TEST PANEL</h2></b>
</div>


<div class="container-fluid">

<div class="row">
<div class="col-md-6">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-comments"></i>
                </div>
                <div class="mr-5">CREATE TEST</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="cheader.jsp?value=createtest">
                <span class="float-left">Create Test</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          
         
</div>

<div class="col-md-6">
                <div class="card text-white bg-warning o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-list"></i>
                </div>
                <div class="mr-5">VIEW TEST/RESULT</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Test/Result</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>         
</div>
</div>
<br><br>
           <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            TEST STATUS</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  
                    <th>Test Id</th>
                    <th>Company Name</th>
                    <th>Test Name</th>
                    <th>Status</th>
                    <th>Add Questions</th>
                    <th>Edit</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                      <th>Test Id</th>
                    <th>Company Name</th>
                    <th>Test Name</th>
                    <th>Status</th>
                    <th>Add Questions</th>
                    <th>Edit</th>
                    <th>Delete</th>
                    </tr>
                </tfoot>
                <tbody>
                <%
              
                ResultSet rset2=obj.getTests(unm);
                while(rset2.next()){
                
                    String projid=rset2.getString("tid"),name=rset2.getString("cname");
                   	String pname=rset2.getString("tname");
                 
                %>
                  <tr>
                  <td><%out.print(projid.toUpperCase()); %></td>
                  <td><%out.print(name.toUpperCase()); %></td>
                  <td><%out.print(pname.toUpperCase()); %></td>
                  <td><b style="color: green;">ACTIVE</b></td>
                  <td><a href="addques.jsp?value=add&tid=<%out.print(projid); %>" class="btn btn-primary">ADD QUESTIONS </a></td>
                  <td><a href="edtest.jsp?value=edit&tid=<%out.print(projid); %>" class="btn btn-secondary">EDIT </a></td>
                  <td><a href="edtest.jsp?value=delete&tid=<%out.print(projid); %>" class="btn btn-danger">DELETE</a></td>
                  
                  </tr>

<%
                }

                
%>
                      </tbody>
                      
              </table>
            </div>
          </div>
         </div>


</div>

<%}
     else if(value.contains("project")){
    	 String id=obj.getProjectId();
    	 
   %>
   
   <div class="container">
		<div class="jumbotron" style="background-color: gray;">
		 <h2 style="text-align: center;"> POST PROJECT </h2>
		</div>	<br>

<form action="companymain.jsp?value=project&id=<%out.print(id); %>" class="was-validated" method="post"> 
    <div class="row">
    <div class="form-group">
      <h2>Project ID:<b style="color: red;"># <%out.print(id);%></h2></b>
    </div>
    </div>
    <div class="form-group">
      <label>Company Name:</label>
      <input type="text" class="form-control" placeholder="Example TCS,Wipro etc." name="name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Company Name.</div>
    </div>
    
    <div class="form-group">
      <label>Project Name:</label>
      <input type="text" class="form-control" placeholder="Example OLX" name="pname" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
  <label>Project Description:*</label>
  <textarea class="form-control rounded-0" name="desc" rows="10"></textarea>
</div>
<div class="form-group">
<label>Other Description:*</label>
  <textarea class="form-control rounded-0" name="more" rows="10" placeholder="example time,resources etc."></textarea>
</div>
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" required> I agree on T&C.
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check T&C to continue.</div>
      </label>    
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
		
		</div>
	
	</div>
   
   
   
   
   
   <%}else if(value.contains("profile")){
         String email=request.getParameter("email");
         ResultSet rset=obj.getProfile(email);
         ResultSet rset2=obj.getDetailEmployee(email);
          if(rset.next()){
        	  String qual=rset.getString("qual"),course=rset.getString("course"),jloc=rset.getString("jobloc"),
        			  skills=rset.getString("skills"),pyear=rset.getString("pyear"),coll=rset.getString("college"),
        			  ctype=rset.getString("ctype"),spec=rset.getString("spec"),resume=rset.getString("cv");
        	  
        	  
    %>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
    
  <div class="container">  
<div class="row">
    <div class="col-md-5">
    <%if(rset2.next()){ 
       String fname=rset2.getString("fname"),pimg=rset2.getString("pimg");
    %>
    <h2>Profile Image</h2>
  <div class="card" style="width:400px">
    <img class="card-img-top" src="images/<%out.print(pimg); %>" alt="Card image" style="width:100%;height: 500px;">
    <div class="card-body">
      <h4 class="card-title"><%out.print(fname.toUpperCase()); %></h4>
      <a href="DownloadServlet?value=<%out.print(resume); %>" class="btn btn-primary">Download CV/RESUME</a>
    </div>
  </div>
  </div>
  <%} %>
    
    
    <div class="col-md-7">
    
    <h2 style="text-align: center;">Personel Information</h2>
    <h3>
    <label for="email">Email:</label>
    <input type="email" class="form-control" disabled="disabled" placeholder="<%out.print(email); %>" name="email">
    <label for="pwd">Qualification:</label>
    <input type="password" disabled="disabled" class="form-control" id="pwd" placeholder="<%out.print(qual.toUpperCase()); %>" name="pswd">
    <label for="email">Cource:</label>
    <input type="email" class="form-control"  disabled="disabled" id="email" placeholder="<%out.print(course.toUpperCase()); %>" name="email">
    <label for="pwd">Specialization:</label>
    <input type="password" class="form-control"  disabled="disabled" id="pwd" placeholder="<%out.print(spec.toUpperCase()); %>" name="pswd">
    <label for="email">College:</label>
    <input type="email" class="form-control" id="email" disabled="disabled" placeholder="<%out.print(coll.toUpperCase()); %>" name="email">
    <label for="pwd">Course Type:</label>
    <input type="password" class="form-control" id="pwd" disabled="disabled" placeholder="<%out.print(ctype.toUpperCase()); %>" name="pswd">
    <label for="email">Passing Year:</label>
    <input type="email" class="form-control" id="email" disabled="disabled" placeholder="<%out.print(pyear); %>" name="email">
    <label for="pwd">Job Location:</label>
    <input type="password" class="form-control" id="pwd" disabled="disabled" placeholder="<%out.print(jloc.toUpperCase()); %>" name="pswd">
    </h3>
  </div>
     </div>
    
    
    <%}} else if(value.contains("active")){
    	String unm=(String) session.getAttribute("unm");
    
    	ResultSet rset=obj.getJobByHiere(unm);
    	
   %>
   
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Active Jobs</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  
                    <th>Job Id</th>
                    <th>Name</th>
                    <th>Position</th>
                    <th>Office</th>
                    <th>Salary</th>
                      <th>View</th>
                    <th>Edit</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                  
                    <th>Job Id</th>
                    <th>Name</th>
                    <th>Position</th>
                    <th>Office</th>
                    <th>Salary</th>
                    <th>View</th>
                    <th>Edit</th>
                    <th>Delete</th>
                  </tr>
                </tfoot>
                <tbody>
                <%
                while(rset.next()){
                
                    String jobid=rset.getString("jobid"),name=rset.getString("name");
                   	String pos=rset.getString("pos"),office=rset.getString("office"),salary=rset.getString("sallary");
                 
                %>
                  <tr>
                  <td><%out.print(jobid.toUpperCase()); %></td>
                  <td><%out.print(name.toUpperCase()); %></td>
                  <td><%out.print(pos.toUpperCase()); %></td>
                  <td><%out.print(office.toUpperCase()); %></td>
                  <td><%out.print(salary) ;%></td>
                  <td><a href="" class="btn btn-primary">VIEW </a></td>
                  <td><a href="" class="btn btn-secondary">EDIT </a></td>
                  <td><a href="" class="btn btn-danger">DELETE</a></td>
                  
                  </tr>

<%
                }

                
%>
                      </tbody>
                      
              </table>
            </div>
          </div>
         </div>

      </div>
   
   
   
   
   
           <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Active Projects</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  
                    <th>Project Id</th>
                    <th>Company Name</th>
                    <th>Project Name</th>
                    <th>View Progress</th>
                    <th>Edit</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Project Id</th>
                    <th>Company Name</th>
                    <th>Project Name</th>
                    <th>View Progress</th>
                    <th>Edit</th>
                    <th>Delete</th></tr>
                </tfoot>
                <tbody>
                <%
              
                ResultSet rset2=obj.getProjectByHiere(unm);
                while(rset2.next()){
                
                    String projid=rset2.getString("pid"),name=rset2.getString("name");
                   	String pname=rset2.getString("pname");
                 
                %>
                  <tr>
                  <td><%out.print(projid.toUpperCase()); %></td>
                  <td><%out.print(name.toUpperCase()); %></td>
                  <td><%out.print(pname.toUpperCase()); %></td>
                  <td><a href="" class="btn btn-primary">VIEW PROGRESS</a></td>
                  <td><a href="" class="btn btn-secondary">EDIT </a></td>
                  <td><a href="" class="btn btn-danger">DELETE</a></td>
                  
                  </tr>

<%
                }

                
%>
                      </tbody>
                      
              </table>
            </div>
          </div>
         </div>

      </div>
   
   
   
   <%} else if(value.contains("createtest")){
	   String unm=(String) session.getAttribute("unm");
	   %>
   <div class="container">
   <div class="jumbotron" style="background-color: gray;">
   <b><h2 style="text-align: center;color: black;">TEST PANEL</h2></b>
   </div>
   <div class="jumbotron">
      <div class="row">
  <form action="cheader.jsp?value=questions&tid=<%out.print(obj.getTestid());%>" method="post">
    <div class="form-group">
      <h2>TEST ID:<b style="color: red;"> #<%out.print(obj.getTestid());%></h2></b>
    </div>
    </div><br>
    <div class="form-group">
      <label><h3>Company Name:</h3></label>
      <input type="text" class="form-control" placeholder="Example TCS,Wipro etc." name="name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Company Name.</div>
    </div>
    <div class="form-group">
      <label><h3>Test Name:</h3></label>
      <input type="text" class="form-control" placeholder="National Talent Hunt" name="tname" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Test Name.</div>
    </div>
    <div class="form-group">
      <label><h3>Test Marks:</h3></label>
      <input type="number" class="form-control" placeholder="Example 80,100" name="marks" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Marks.</div>
    </div>
    <div class="form-group">
      <label><h3>Test Start Date:</h3></label>
      <input type="date" class="form-control" name="sdate" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Time.</div>
    </div>
    <div class="form-group">
      <label><h3>Test End Date:</h3></label>
      <input type="date" class="form-control" name="edate" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Time.</div>
    </div>
        <div class="form-group">
      <label><h3>Test Start Time:</h3></label>
      <input type="time" class="form-control"  name="stime" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Time.</div>
    </div>
    <div class="form-group">
      <label><h3>Test End Time:</h3></label>
      <input type="time" class="form-control"  name="etime" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Time.</div>
    </div>
    <div class="form-group">
      <label><h3>Test Duration Time:</h3></label>
      <input type="number" class="form-control" placeholder="Example 30,60 (min)" name="time" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Time.</div>
    </div>
        <div class="form-group">
      <label><h3>Instructions: (Minimum 3)</h3></label>
      <input type="text" class="form-control" placeholder="Test is of 25 marks" name="in1" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" placeholder="Total time is 30 min" name="in2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" placeholder="Do not close browser" name="in3" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" placeholder="Phones are not allowed" name="in4">
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" placeholder="Other" name="in5" >
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" placeholder="Other" name="in6" >
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div><br>
      <input type="text" class="form-control" placeholder="Other" name="in7" >
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Instruction.</div>
   
    </div>
    <input type="submit" class="btn btn-success" value="Generate Test">
    
 </form>
   
   </div>
   </div>
   
   
   <%}else if (value.contains("questions")){ 
      String name=request.getParameter("name"),tname=request.getParameter("tname"),
    		  marks=request.getParameter("marks"),time=request.getParameter("time"),
    		ins1=request.getParameter("in1"),ins2=request.getParameter("in2"),
    		ins3=request.getParameter("in3"),ins4=request.getParameter("in4"),
    		ins5=request.getParameter("in5"),ins6=request.getParameter("in6"),
    		ins7=request.getParameter("in7"),sdate=request.getParameter("sdate"),
    		edate=request.getParameter("edate"),stime=request.getParameter("stime"),
    		etime=request.getParameter("etime"),unm=(String) session.getAttribute("unm");
      
      if(ins4.contains("null"))
      {
    	  ins4="0";
      }
      if(ins5.contains("null"))
      {
    	  ins5="0";
      }
      if(ins6.contains("null"))
      {
    	  ins6="0";
      }
      if(ins7.contains("null"))
      {
    	  ins7="0";
      }
   
      boolean res=obj.createTest(unm,name,tname,marks,time,sdate,edate,stime,etime,ins1,ins2,ins3,ins4,ins5,ins6,ins7);
if(true){
	String tid=request.getParameter("tid");
   response.sendRedirect(request.getContextPath()+"/addques.jsp?value=add&tid="+tid);
     }
   } else if(value.contains("postques")){ 

String ques=request.getParameter("ques"),a=request.getParameter("a"),b=request.getParameter("b"),
c=request.getParameter("c"),d=request.getParameter("d"),ans=request.getParameter("ans"),
set=request.getParameter("set"),tid=request.getParameter("tid");
boolean re=obj.insertQuestion(tid, ques, a, b, c, d, ans, set);
if(re)
{
	response.sendRedirect(request.getContextPath()+"/cheader.jsp?value=questions&tid="+tid);

	}
} %>
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