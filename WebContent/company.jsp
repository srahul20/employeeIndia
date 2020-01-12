<%@page import="java.sql.ResultSet"%>
<%@page import="emp.DbHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html lang="en">

<head>

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

<body id="page-top">


<%
	DbHandler obj=new DbHandler();
    String name=(String)session.getAttribute("unm");
%>

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

    <div id="content-wrapper">

      <div class="container-fluid">

        <div class="row">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-comments"></i>
                </div>
                <div class="mr-5">Active Posts</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="cheader.jsp?value=active">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-list"></i>
                </div>
                <div class="mr-5">Applications</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
                    </div>
        </div>

              <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            HIRE AN EMPLOYEE</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  
                    <th>Name</th>
                    <th>Qualification</th>
                    <th>Skills</th>
                    <th>Email</th>
                    <th>Score</th>
                    <th>View Profile</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                  
                    <th>Name</th>
                    <th>Qualification</th>
                    <th>Skills</th>
                    <th>Email</th>
                    <th>Score</th>
                    <th>View Profile</th>
                  </tr>
                </tfoot>
                <tbody>
                <%
                    ResultSet rset=obj.getEmployee();
                while(rset.next()){
                    String fname=rset.getString("fname"),email=rset.getString("email");
                    ResultSet cset=obj.getProfile(email);
                    if(cset.next()){
                    	String qual=cset.getString("qual"),skills=cset.getString("skills"),score=obj.getScore(email);
                 
                %>
                  <tr>
                  <td><%out.print(fname.toUpperCase()); %></td>
                  <td><%out.print(qual.toUpperCase()); %></td>
                  <td><%out.print(skills); %></td>
                  <td><%out.print(email); %></td>
                  <td><%out.print(score) ;%></td>
                  <td><a href="cheader.jsp?value=profile&email=<%out.print(email); %>" class="btn btn-primary">VIEW PROFILE</a></td>
                  </tr>

<%
                }

                }
%>
                      </tbody>
                      
              </table>
            </div>
          </div>
         </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Employee India 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
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
    