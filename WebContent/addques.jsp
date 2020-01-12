<%@page import="java.sql.ResultSet"%>
<%@page import="emp.DbHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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
     String tid=request.getParameter("tid");
  System.out.print(tid);
      session.setAttribute("tid", tid);

  if(value.contains("add")){
	
	  if(tid==null){
		  tid=(String)session.getAttribute("tid");
	  }
      session.setAttribute("value","add");
  %>
    <div class="container">
   <div class="jumbotron" style="background-color: gray;">
   <h2 style="color: black;text-align: center;">POST QUESTIONS</h2>
   </div>
   <div class="row">
   
        <form action="added.jsp" method="post">
            <table cellpadding="10">
                       
                
                <tr>
                    <td><b>Question:</b></td>
                    <td><textarea rows="10" cols="100" name="question" required></textarea></td>
                </tr>
                
                <tr>
                    <td><b>A:</b></td>
                    <td><textarea rows="2" cols="100" name="a" required></textarea></td>
                </tr>

                <tr>
                    <td><b>B:</b></td>
                    <td><textarea rows="2" cols="100" name="b" required></textarea></td>
                </tr>

                <tr>
                    <td><b>C:</b></td>
                    <td><textarea rows="2" cols="100" name="c" required></textarea></td>
                </tr>

                <tr>
                    <td><b>D:</b></td>
                    <td><textarea rows="2" cols="100" name="d" required></textarea></td>
                </tr>
                
                <tr>
                <td><b>Answer:</b></td>
                <td>  <input type="radio" name="answer" value="A" required> A &nbsp;
                <input type="radio" name="answer" value="B"> B &nbsp;
                <input type="radio" name="answer" value="C"> C &nbsp;
                <input type="radio" name="answer" value="D"> D &nbsp;
                </td>
                </tr>

                <tr>
                <td><b>Set:</b></td>
                <td>  <input type="radio" name="set" value="1" required> 1 &nbsp;
                <input type="radio" name="set" value="2"> 2 &nbsp;
                <input type="radio" name="set" value="3"> 3
                </td>
                </tr>

                <tr>
                    <td colspan="2" align="center"><input type="submit" class="btn btn-success" value="Add"/></td>
                </tr>
            </table>
        </form>        
    </div>
    <br><br><br><br>
               <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Set 1 Questions</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Answer</th>
                    <th>Edit</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                 
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Answer</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tfoot>
                <tbody>
                <%
                ResultSet rset2=obj.getSetQuestions(tid,"1");
                while(rset2.next()){
                
                    String ques=rset2.getString("ques"),o1=rset2.getString("o1"),o2=rset2.getString("o2"),o3=rset2.getString("o3"),o4=rset2.getString("o4"),ans=rset2.getString("ans");
                   String qid=rset2.getString("qid");
                 
                %>
                  <tr>
                  <td><%out.print(ques); %></td>
                  <td><%out.print(o1); %></td>
                  <td><%out.print(o2); %></td>
                  <td><%out.print(o3); %></td>
                  <td><%out.print(o4); %></td>
                  <td><%out.print(ans); %></td>
                  <td><a href="addques.jsp?value=edit&qid=<%out.print(qid); %>" class="btn btn-secondary">EDIT </a></td>
                  <td><a href="addques.jsp?value=delete&qid=<%out.print(qid); %>&tid=<%out.print(tid); %>" class="btn btn-danger">DELETE</a></td>
                  
                  </tr>

<%
                }

                
%>
                      </tbody>
                      
              </table>
            </div>
          </div>
         </div>
    <br><br>
                   <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Set 2 Questions</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Answer</th>
                    <th>Edit</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                 
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Answer</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tfoot>
                <tbody>
                <%
                ResultSet rset3=obj.getSetQuestions(tid,"2");
                while(rset3.next()){
                
                    String ques=rset3.getString("ques"),o1=rset3.getString("o1"),o2=rset3.getString("o2"),o3=rset3.getString("o3"),o4=rset3.getString("o4"),ans=rset3.getString("ans");
                    String qid=rset3.getString("qid");
                 
                %>
                  <tr>
                  <td><%out.print(ques); %></td>
                  <td><%out.print(o1); %></td>
                  <td><%out.print(o2); %></td>
                  <td><%out.print(o3); %></td>
                  <td><%out.print(o4); %></td>
                  <td><%out.print(ans); %></td>
                  <td><a href="addques.jsp?value=edit&qid=<%out.print(qid); %>" class="btn btn-secondary">EDIT </a></td>
                  <td><a href="addques.jsp?value=delete&qid=<%out.print(qid); %>&tid=<%out.print(tid); %>" class="btn btn-danger">DELETE</a></td>
                  
                  </tr>

<%
                }

                
%>
                      </tbody>
                      
              </table>
            </div>
          </div>
         </div>
         <br><br>
         
                   <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Set 3 Questions</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Answer</th>
                    <th>Edit</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                 
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Answer</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tfoot>
                <tbody>
                <%
                ResultSet rset4=obj.getSetQuestions(tid,"3");
                while(rset4.next()){
                
                    String ques=rset4.getString("ques"),o1=rset4.getString("o1"),o2=rset4.getString("o2"),o3=rset4.getString("o3"),o4=rset4.getString("o4"),ans=rset4.getString("ans");
                    String qid=rset4.getString("qid");
                %>
                  <tr>
                  <td><%out.print(ques); %></td>
                  <td><%out.print(o1); %></td>
                  <td><%out.print(o2); %></td>
                  <td><%out.print(o3); %></td>
                  <td><%out.print(o4); %></td>
                  <td><%out.print(ans); %></td>
                  <td><a href="addques.jsp?value=edit&qid=<%out.print(qid); %>" class="btn btn-secondary">EDIT </a></td>
                  <td><a href="addques.jsp?value=delete&qid=<%out.print(qid); %>&tid=<%out.print(tid); %>" class="btn btn-danger">DELETE</a></td>
                  
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
   
<%}else if(value.contains("postques")){ 

	String ques=request.getParameter("ques"),a=request.getParameter("a"),b=request.getParameter("b"),
	c=request.getParameter("c"),d=request.getParameter("d"),ans=request.getParameter("ans"),
	set=request.getParameter("set");
	boolean re=obj.insertQuestion(tid, ques, a, b, c, d, ans, set);
	if(re)
	{
		response.sendRedirect(request.getContextPath()+"/addques.jsp?value=add&tid="+tid);

		}
	} 
	
else if(value.contains("edit")){
	String qid=request.getParameter("qid");
	 ResultSet rset=obj.getQuesDetail(qid);
	 if(rset.next()){

         String ques=rset.getString("ques"),o1=rset.getString("o1"),o2=rset.getString("o2"),o3=rset.getString("o3"),o4=rset.getString("o4"),ans=rset.getString("ans");
         String set=rset.getString("set1"),tid1=rset.getString("tid");
         session.setAttribute("qid", qid);
         session.setAttribute("tid", tid1);
         session.setAttribute("value", "update");
	%>

    <div class="container">
   <div class="jumbotron" style="background-color: gray;">
   <h2 style="color: black;text-align: center;">UPDATE QUESTIONS</h2>
   </div>
   <div class="row">
   
        <form action="added.jsp">
            <table cellpadding="10">
                       
                
                <tr>
                    <td><b>Question:</b></td>
                    <td><textarea rows="10" cols="100" name="question" required><%out.print(ques); %></textarea></td>
                </tr>
                
                <tr>
                    <td><b>A:</b></td>
                    <td><textarea rows="2" cols="100" name="a" required><%out.print(o1); %></textarea></td>
                </tr>

                <tr>
                    <td><b>B:</b></td>
                    <td><textarea rows="2" cols="100" name="b" required><%out.print(o2); %></textarea></td>
                </tr>

                <tr>
                    <td><b>C:</b></td>
                    <td><textarea rows="2" cols="100" name="c" required><%out.print(o3); %></textarea></td>
                </tr>

                <tr>
                    <td><b>D:</b></td>
                    <td><textarea rows="2" cols="100" name="d" required><%out.print(o4); %></textarea></td>
                </tr>
                
                <tr>
                <td><b>Answer:</b></td>
                <%if(ans.contains("A")){ %>
                <td>  <input type="radio" name="answer" value="A" checked="checked"> A &nbsp;
                <input type="radio" name="answer" value="B"> B &nbsp;
                <input type="radio" name="answer" value="C"> C &nbsp;
                <input type="radio" name="answer" value="D"> D &nbsp;
                </td>
                <%}else if(ans.contains("B")) {%>
                <td>  <input type="radio" name="answer" value="A"> A &nbsp;
                <input type="radio" name="answer" value="B" checked="checked"> B &nbsp;
                <input type="radio" name="answer" value="C"> C &nbsp;
                <input type="radio" name="answer" value="D"> D &nbsp;
                <%} else if(ans.contains("C")){ %>
                <td>  <input type="radio" name="answer" value="A"> A &nbsp;
                <input type="radio" name="answer" value="B"> B &nbsp;
                <input type="radio" name="answer" value="C" checked="checked"> C &nbsp;
                <input type="radio" name="answer" value="D"> D &nbsp;
                <%}else{ %>
                <td>  <input type="radio" name="answer" value="A"> A &nbsp;
                <input type="radio" name="answer" value="B"> B &nbsp;
                <input type="radio" name="answer" value="C"> C &nbsp;
                <input type="radio" name="answer" value="D" checked="checked"> D &nbsp;
                <%} %>
                </tr>

                <tr>
                <td><b>Set:</b></td>
                <td> 
                <%if(set.contains("1")){ %>
                 <input type="radio" name="set" value="1" checked="checked"> 1 &nbsp;
                <input type="radio" name="set" value="2"> 2 &nbsp;
                <input type="radio" name="set" value="3"> 3
                <%}else if(set.contains("2")){ %>
              
                <input type="radio" name="set" value="1"> 1 &nbsp;
                <input type="radio" name="set" value="2" checked="checked"> 2 &nbsp;
                <input type="radio" name="set" value="3"> 3
                <%}else{ %>
                
                 <input type="radio" name="set" value="1"> 1 &nbsp;
                <input type="radio" name="set" value="2"> 2 &nbsp;
                <input type="radio" name="set" value="3" checked="checked"> 3
                <%} %>
                </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                    <input type="submit" class="btn btn-success" value="Update"/></td>
                </tr>
            </table>
        </form>        
    </div>


<%
}
                }else if(value.contains("delete"))
                {
                   String qid= request.getParameter("qid");
                   tid=request.getParameter("tid");
                   session.setAttribute("tid", tid);
                   boolean res=obj.deleteQues(qid);
                   if(res){
                	   response.sendRedirect(request.getContextPath()+"/addques.jsp?value=add&tid="+tid);
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