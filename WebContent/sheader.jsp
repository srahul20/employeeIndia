<%@page import="emp.DbHandler"%>
<%@page import="java.sql.ResultSet"%>
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

  <title>EmployeeIndia - volunteer</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">


  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body>

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">EMPLOYEE INDIA</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="student.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>PROFILE</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Edit Profile</h6>
            <a class="collapse-item" href="buttons.html">Resume</a>
            <a class="collapse-item" href="cards.html">Skill Set</a>
            <a class="collapse-item" href="buttons.html">Forgot Password</a>
            <a class="collapse-item" href="cards.html">Change password</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>JOBS</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Type : </h6>
            <a class="collapse-item" href="sheader.jsp?value=jobs">All jobs</a>
            <a class="collapse-item" href="sheader.jsp?value=jobs">Govt. jobs</a>
            <a class="collapse-item" href="sheader.jsp?value=jobs">International jobs</a>
            <a class="collapse-item" href="sheader.jsp?value=jobs">Private</a>
          </div>
        </div>
      </li>
<%
	
     String value=request.getParameter("value");

    DbHandler obj=new DbHandler();
    String unm= (String) session.getAttribute("unm");

   ResultSet rset1=obj.getDetailEmployee(unm);
   String fname="",lname="";
   if(rset1.next()){
     fname=rset1.getString("fname");
     lname=rset1.getString("lname");
   }
%>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>OTHERS</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Others : </h6>
            <a class="collapse-item" href="">Ask Query</a>
            <a class="collapse-item" href="">Solve Problem</a>
            <a class="collapse-item" href="">Work on Project</a>
            <a class="collapse-item" href="">Buy Project</a>
           </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="sheader.jsp?value=jobs">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>COMPANIES</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="">
          <i class="fas fa-fw fa-table"></i>
          <span>TESTS</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

 <li class="nav-item">
        <a class="nav-link" href="logout.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>LOG OUT</span></a>
      </li>


      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

         
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><b>WELCOME <h4 style="color: black;"><%out.print(fname.toUpperCase()); %></h4></b></span>
              
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        
        
         <div class="container-fluid">
        
        <%
           if(value.contains("jobs")){
           
        %>
        
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            JOBS</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  <th>Job Id</th>
                    <th>Name</th>
                    <th>Position</th>
                    <th>Office</th>
                    <th>View</th>
                    <th>Apply</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                  <th>Job Id</th>
                    <th>Name</th>
                    <th>Position</th>
                    <th>Office</th>
                    <th>View</th>
                    <th>Apply</th>
                  </tr>
                </tfoot>
                <tbody>
                <%
            ResultSet rjob=obj.getJobs();
            String jobid="",jname="",pos="",off="";
            while(rjob.next()){
            	jobid=rjob.getString("jobid");
                jname=rjob.getString("name");
                pos=rjob.getString("pos");
                off=rjob.getString("office");
            
        %>
                  <tr>
                  <td><%out.print(jobid); %></td>
                  <td><%out.print(jname.toUpperCase()); %></td>
                  <td><%out.print(pos.toUpperCase()); %></td>
                  <td><%out.print(off.toUpperCase()); %></td>
                  <td><a href="sheader.jsp?value=view&jobid=<%out.print(jobid); %>" class="btn btn-primary">VIEW</a></td>
                <%if(obj.getAppliedJobs(jobid,unm)){ %>
                  <td><a href="process.jsp?value=remjobs&jobid=<%out.print(jobid); %>" class="btn btn-secondary">APPLIED</a></td>
                  <%}else{ %>
                  <td><a href="process.jsp?value=jobs&jobid=<%out.print(jobid); %>" class="btn btn-success">APPLY</a></td>
                  <%} %>
                  </tr>
                  <%} %>
                      </tbody>
              </table>
              
            </div>
          </div>
         </div>





      </div>
             
             <%}
           else if(value.contains("project")){
        	    %>
        	 
        	     <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Projects</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  
                    <th>PID</th>
                    <th>Company Name</th>
                    <th>Project Name</th>
                    <th>Score</th>
                    <th>View Project</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                  
                    <th>PID</th>
                    <th>Company Name</th>
                    <th>Project Name</th>
                    <th>Score</th>
                    <th>View Project</th>
                  </tr>
                </tfoot>
                <tbody>
                <%
                     ResultSet rset=obj.getProjects();
                while(rset.next()){
                	String id=rset.getString("pid"),cname=rset.getString("name"),name=rset.getString("pname"),score="50";
                     String taken=rset.getString("taken");
                     if(taken.contains("null")){
                	%>
                  <tr>
                  <td><%out.print(id); %></td>
                  <td><%out.print(cname.toUpperCase()); %></td>
                  <td><%out.print(name.toUpperCase()); %></td>
                  <td><%out.print(score) ;%></td>
                  <td><a href="sheader.jsp?value=details&pid=<%out.print(id); %>" class="btn btn-success">VIEW DETAILS</a></td>
                  </tr>

<%
                     }

                }
%>
                      </tbody>
                      
              </table>
        	  
        	  
        	   
 <% 
 }
           else if(value.contains("details"))
           {
        	   String pid=request.getParameter("pid");
        	   ResultSet rset=obj.getProjectDetails(pid);
        	   if(rset.next()){
        		   String cname=rset.getString("name"),name=rset.getString("pname"),des=rset.getString("des"),oth=rset.getString("oth");
        	   
 %>
  
  				<div class="container">
  				<div class="row">
  				<h3><label>Project ID :</label>
  				<b style="color: red;">#<%out.print(pid); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Company Name :</label>
  				<b style="color: red;"><%out.print(cname.toUpperCase()); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Project Name :</label>
  				<b style="color: red;"><%out.print(name.toUpperCase()); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Description :</label>
  				<b style="color: red;"><%out.print(des); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Others :</label>
  				<b style="color: red;"><%out.print(oth); %></b></h3>
  				</div>
  				<div class="row">
  				<a href="process.jsp?value=project&pid=<%out.print(pid); %>" class="btn btn-success">START WORKING</a>
  				</div>
  				</div>
  
             
             
 <%}
 
 }
           else if(value.contains("view")){
        	   String jobid=request.getParameter("jobid");
        	   ResultSet rset=obj.getJobDetails(jobid); 
        	   if(rset.next()){
        		 String name=rset.getString("name"),pos=rset.getString("pos"),office=rset.getString("office"),
        				   sallary=rset.getString("sallary"),des=rset.getString("des"),more=rset.getString("more");
        		   
      %>
      
      
      				<div class="container">
  				<div class="row">
  				<h3><label>JOB ID :</label>
  				<b style="color: red;">#<%out.print(jobid); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Company Name :</label>
  				<b style="color: red;"><%out.print(name); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Position :</label>
  				<b style="color: red;"><%out.print(pos); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Office :</label>
  				<b style="color: red;"><%out.print(office); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Sallary :</label>
  				<b style="color: red;"><%out.print(sallary); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Description :</label>
  				<b style="color: red;"><%out.print(des); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Other :</label>
  				<b style="color: red;"><%out.print(more); %></b></h3>
  				</div>
  				<div class="row">
  				<a href="process.jsp?value=jobs&jobid=<%out.print(jobid); %>" class="btn btn-success">APPLY NOW</a>
  				</div>
  				</div>
  
      
      
      <%  		   
        	   }
        	   
           }else if(value.contains("VIEW")){
        	   
        	   String pid=request.getParameter("pid");
        	   ResultSet rset=obj.getProjectDetails(pid);
        	   if(rset.next()){
        		   String cname=rset.getString("name"),name=rset.getString("pname"),des=rset.getString("des"),oth=rset.getString("oth");
            	   
        		   %>
        		       			
  				<div class="container">
  				<div class="row">
  				<h3><label>Project ID :</label>
  				<b style="color: red;">#<%out.print(pid); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Company Name :</label>
  				<b style="color: red;"><%out.print(cname); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Project Name :</label>
  				<b style="color: red;"><%out.print(name); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Description :</label>
  				<b style="color: red;"><%out.print(des); %></b></h3>
  				</div>
  				<div class="row">
  				<h3><label>Others :</label>
  				<b style="color: red;"><%out.print(oth); %></b></h3>
  				</div>
  				<div class="row">
  				<a href="process.jsp?value=remove&pid=<%out.print(pid);%>" class="btn btn-success">Remove Project </a>
  				<br>
  				</div>
  				<div class="row"><br></div>
  				<div class="row">
  				<br>
  				<form action="process.jsp?value=update&pid=<%out.print(pid); %>" method="post">
  				<input type="number" name="prog" placeholder="Enter percentage" maxlength="100" required="required"><b>%</b>
  			     <input type="submit" value="UPDATE PROGRESS" class="btn btn-secondary">
  				</form>
  				</div>
  				</div>
  
        	
        		   
        <%		   
        	   }
           }
 
 %>   
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