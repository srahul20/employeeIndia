<%@page import="java.sql.ResultSet"%>
<%@page import="emp.DbHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">'
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: white;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}


@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>
<%
  DbHandler obj=new DbHandler();
  String value=request.getParameter("value");
%>
<div class="sidenav">
  <a href="query.jsp?value=posts" class="btn btn-danger">Home</a>
  <a href="#about" class="btn btn-primary">Ask-Question</a>
  <a href="#services" class="btn btn-secondary">Solve-Question</a>
  <a href="#clients" class="btn btn-success">Create-Channel</a>
    <a href="#about" class="btn btn-primary">Subscribe-Channel</a>
  <a href="#contact" class="btn btn-danger">LogOut</a>
</div>

<div class="main">
 
  <div class="container">

    <div class="row">

  
        <!-- Sidebar Widgets Column -->
      <div class="col-md-4" >
        <div class="card my-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search for...">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
            </div>
          </div>
        </div>

   
        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">Categories</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">Web Technology</a>
                  </li>
                  <li>
                    <a href="#">Science</a>
                  </li>
                  <li>
                    <a href="#">Education</a>
                  </li>
                  <li>
                    <a href="#">Fiction</a>
                  </li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">Programming</a>
                  </li>
                  <li>
                    <a href="#">News</a>
                  </li>
                  <li>
                    <a href="">Future of Technology</a>
                  </li>
                  <li>
                    <a href="#">Others</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">Your Channel <a href="query.jsp?value=create" class="btn btn-danger">Create Channel </a></h5>
          <div class="card-body">
          <% 
            String em=(String)session.getAttribute("unm");
          ResultSet r=obj.getChannels(em); 
          if(!r.next()){
          %>
           Your channels will appear here
           <%}else{ 
                while(r.next()){
                	String name=r.getString("cname"),cid=r.getString("cid");
           %>
         * <a href="" ><b><%out.print(name.toUpperCase()); %></b></a><br>
          
          <%} }%></div>
        </div>


        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">Subscribed Channels  <a href="query.jsp?value=channels" class="btn btn-danger">Subscribe!</a></h5>
          <div class="card-body">   
           Subscribed channels will appear here
          </div>
        </div>

      </div>
  
  
      <!-- Blog Entries Column -->
      <div class="col-md-8">

     <!-- Search Widget -->


   <% if(value.contains("posts")){ %>
  


        <h1 class="my-4">Posts
          <small>By your subscribed channel</small>
        </h1>

        <!-- Blog Post -->
      <input class="form-control" id="myInput" type="text" placeholder="Search Posts">
       <br>
        
      
        
        <%for(int i=0;i<5;i++){ %>
        <div class="card mb-4" id="myDIV">
          <img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
          <div class="card-body">
           <a href=""> <h2 class="card-title">Post Title</h2></a>
            <a href=""><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p></a>
           <br> <a href="#" class="btn btn-primary">Read More &rarr;</a>
          </div>
          
        </div>
        
        
       
<%}
        }else if(value.contains("channels")){ 
        
        ResultSet rset=obj.getChanels();
     
        %>
        <h1 class="my-4">Channel
          <small>Suggestions</small>
        </h1>
          
          
            <input class="form-control" id="myInput" type="text" placeholder="Search Channel Name">
 <br>
 <%       
        while(rset.next()){
        String name=rset.getString("cname"),cid=rset.getString("cid"),des=rset.getString("des"),
        		cat=rset.getString("cat"),img=rset.getString("logo");
        %>
    
   <div class="card mb-4" id="myDIV">
          <img class="card-img-top" src="images/default.png" alt="Card image cap" style="height: 300px">
          <div class="card-body">
      <a href=""><b><h1 class="card-title" style="color: red;"><%out.print(name.toUpperCase()); %></h1></b></a>
       <b>   <h3><p class="card-text"><%out.print(des); %></p></h3></b><br>
            <a href="query.jsp?value=subscribe&cid=<%out.print(cid); %>"  class="btn btn-primary"  >Subscribe </a>
            <a href="query.jsp?value=showdetails&cid=<%out.print(cid); %>" class="btn btn-secondary" >View more </a>
          </div>
          </div>
       
  
  
  
  <%} }else if(value.contains("create")){
  
  
  %>
  
  <div class="container">
  <h1 style="text-align: center;">Create Channel</h1>
  <form action="query.jsp?value=dbcr" method="post">
     <div class="row"><h2>Channel ID :</h2><h3 style="color: red;"><b> #<%out.print(obj.getChId()); %></b></h3></div>
<br>
     <div class="form-group">
    <h3> <label>Channel Name:</label>
      <input type="text" class="form-control" placeholder="Example ScienceFanda, Technowire etc." name="name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out Channel Name.</div>
    </div>
       <div class="form-group">
   <h3>   <label>Email:</label></h3>
      <input type="text" class="form-control" placeholder="<%out.print(session.getAttribute("unm")); %>" name="email" disabled="disabled">
      <div class="valid-feedback">Valid.</div>
    </div>
     
   <h3>   <label>Description:</label></h3>
         <textarea rows="10" cols="100" name="des" placeholder="Enter Channel Description" required></textarea>
         
    <h3> <label>Other:</label></h3>
         <textarea rows="10" cols="100" name="oth" placeholder="Additional Channel Description" required></textarea>
  <br><br>
         <h3> <label>Category:</label></h3>
        <select class="browser-default custom-select" required="required" name="sel">
  <option selected>Open this select menu</option>
  <option value="web">Web Technology</option>
  <option value="education">Education</option>
  <option value="science">Science</option>
  <option value="fiction">Fiction</option>
  <option value="program">Programming</option>
  <option value="news">News</option>
  <option value="future">Future of Technology</option>
  <option value="others">Others</option>
</select>
<br><br>
  <input type="submit" class="btn btn-primary" style="text-align: center;" value="Create Channel">
  </form>
  
</div>
<br><br><br>
       
       
       
  
</div>
  
  
  
  
  

  <%} else if(value.contains("dbcr")){
	  
	  String name=request.getParameter("name"),email=(String)session.getAttribute("unm"),des=request.getParameter("des"),
			  oth=request.getParameter("oth"),sel=request.getParameter("sel"),cid=obj.getChId();
	  
	  System.out.print(name+email+des+oth+sel+cid);
	  
	  boolean res=obj.insertChannel(cid,name,email,des,oth,sel,"default.peg");
	  if(res)
	  {
		  
	  response.sendRedirect(request.getContextPath()+"/query.jsp?value=posts");
	  }
	  
  }else if (value.contains("subscribe")){
	  String cid=request.getParameter("cid"),email=(String)session.getAttribute("unm");
	  boolean res=obj.insertSubsChannel(cid, email);
	  if(res)
	  {
		  response.sendRedirect(request.getContextPath() +"/query.jsp?value=channels");
	  }
	  
	  
  }else if(value.contains("showdetails")){
	  
	  String cid=request.getParameter("cid");
	  ResultSet rset=obj.getChannelDetails(cid);
	  if(rset.next()){
		     String name=rset.getString("cname"),oth=rset.getString("oth"),des=rset.getString("des"),
		        		cat=rset.getString("cat"),img=rset.getString("logo"),sel=rset.getString("cat");
		     
	  
	%>
	
	<div class="container">
  <h1 style="text-align: center;"> Channel Details</h1>
  <form action="query.jsp?value=dbcr" method="post">
     <div class="row"><h2>Channel ID :</h2><h3 style="color: red;"><b> #<%out.print(cid); %></b></h3></div>
<br>
     <div class="form-group">
    <h3> <label>Channel Name:</label>
  <h2>    <input type="text" class="form-control" placeholder="<%out.print(name.toUpperCase());%>" disabled="disabled">
      </h2> </div>
     
   <h3>   <label>Description:</label></h3>
         <textarea rows="10" cols="100" name="des" disabled="disabled"><%out.print(des); %></textarea>
         
    <h3> <label>Other:</label></h3>
         <textarea rows="10" cols="100" name="oth" disabled="disabled" ><%out.print(oth); %></textarea>
  <br><br>
         <h3> <label>Category:</label></h3>
 <input type="text" value="<%out.print(sel);%>" disabled="disabled">
<br><br>
<a href="query.jsp?value=subscribe&cid=<%out.print(cid); %>" class="btn btn-danger">Subscribe</a>
  </form>
  
</div>
<br><br><br>
       
       
       
  
</div>
	
	
	
	<%  
	  } }
  
  %>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   
   <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myDIV *").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

      </div>


    </div>
    <!-- /.row -->

  </div>
 


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


         </div>

      </div>
      <!-- /.container-fluid -->
<br><br><br>
      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Employee India 2019</span>
          </div>
        </div>
      </footer>
 
 
 </div>
   
</body>
</html> 
    