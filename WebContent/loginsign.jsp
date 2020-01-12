<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>sign in </title>
<style type="text/css">

.register{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
    margin-top: 3%;
    padding: 3%;
}
.register-left{
    text-align: center;
    color: #fff;
    margin-top: 4%;
    
}
.register-left input{
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    width: 60%;
    background: #f8f9fa;
    font-weight: bold;
    color: #383d41;
    margin-top: 30%;
    margin-bottom: 3%;
    cursor: pointer;
}
.register-right{
    background: #f8f9fa;
    border-top-left-radius: 10% 50%;
    border-bottom-left-radius: 10% 50%;
}
.register-left img{
    margin-top: 15%;
    margin-bottom: 5%;
    width: 25%;
    -webkit-animation: mover 2s infinite  alternate;
    animation: mover 1s infinite  alternate;
}
@-webkit-keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
@keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
.register-left p{
    font-weight: lighter;
    padding: 12%;
    margin-top: -9%;
}
.register .register-form{
    padding: 10%;
    margin-top: 10%;
}
.btnRegister{
    float: right;
    margin-top: 10%;
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
    width: 50%;
    cursor: pointer;
}
.register .nav-tabs{
    margin-top: 3%;
    border: none;
    background: #0062cc;
    border-radius: 1.5rem;
    width: 28%;
    float: right;
}
.register .nav-tabs .nav-link{
    padding: 2%;
    height: 34px;
    font-weight: 600;
    color: #fff;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
}
.register .nav-tabs .nav-link:hover{
    border: none;
}
.register .nav-tabs .nav-link.active{
    width: 100px;
    color: #0062cc;
    border: 2px solid #0062cc;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}
.register-heading{
    text-align: center;
    margin-top: 8%;
    margin-bottom: -15%;
    color: #495057;
}
</style>
<style type="text/css">
.login-container{
    margin-top: 5%;
    margin-bottom: 5%;
}
.login-logo{
    position: relative;
    margin-left: -15.5%;
}
.login-logo img{
    position: absolute;
    width: 20%;
    margin-top: -5%;
    background: #282726;
    border-radius: 4.5rem;
    padding: 5%;
}
.login-form-1{
    padding: 9%;
    background:#282726;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-1 h3{
    text-align: center;
    margin-bottom:12%;
    color:#fff;
}
.login-form-2{
    padding: 9%;
    background: #f05837;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-2 h3{
    text-align: center;
    margin-bottom:12%;
    color: #fff;
}
.btnSubmit{
    font-weight: 600;
    width: 50%;
    color: #282726;
    background-color: #fff;
    border: none;
    border-radius: 1.5rem;
    padding:2%;
}
.btnForgetPwd{
    color: #fff;
    font-weight: 600;
    text-decoration: none;
}
.btnForgetPwd:hover{
    text-decoration:none;
    color:#fff;
}</style>
</head>
<body>
<%@include file="header.jsp" %>
<section id="login">
<div class="container login-container">
            <div class="row">
            
                <div class="col-md-6 login-form-1">
                    <h3>Login Volunteer/Employee</h3>
                    <form action="register.jsp?value=signin&t=employee" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="email" placeholder="Your Email *" />
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="pwd" placeholder="Your Password *" />
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btnSubmit" value="Login" />
                        </div>
                        <div class="form-group">
                            <a href="#" class="btnForgetPwd">Forget Password?</a>
                        </div>
                    </form>
                </div>
                
                
                <div class="col-md-6 login-form-2">
                    <div class="login-logo">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                    </div>
                    <h3>Login Hirer/Recruiter</h3>
                       <form action="register.jsp?value=signin&t=hirer" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="email" placeholder="Your Email *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="pwd" placeholder="Your Password *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btnSubmit" value="Login" />
                        </div>
                        <div class="form-group">

                            <a href="#" class="btnForgetPwd" value="Login">Forget Password?</a>
                        </div>
                  </form>
                </div>
                
            </div><br><br>
          <h3> Don't have account :( SignUp here   :  <a href="#signup">SignUp Now</a></h3>
        </div>
        </section>
        <br>
        <br>
        <section id="signup">
        <div class="container">
       
        <h1 style="text-align: center;">Don't have an account. </h1><br>
        <h3>Don't worry, we will create it for you. </h3><br>
       
        <form action="register.jsp?value=register" method="post">
        <div class="form-group">
      <label for="name">First name :  *</label>
      <input type="text" class="form-control" id="fname" placeholder="Enter first name" name="fname" required="required">
    </div>
    <div class="form-group">
      <label for="name">Last name :  *</label>
      <input type="text" class="form-control" id="lname" placeholder="Enter last name" name="lname" required="required">
    </div>
    <div class="form-group">
      <label for="email">Email :  *</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required="required">
    </div>
    <div class="form-group">
      <label for="pwd">Password : *</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required="required">
    </div>
    <div class="form-group">
      <label for="pwd">Confirm Password : *</label>
      <input type="password" class="form-control" id="cpwd" placeholder="Confirm password" name="cpwd" required="required">
    </div>
    <div class="form-group">
      <label for="phone">Phone no : *</label>
      <input type="number" class="form-control" id="phonr" placeholder="Enter Phone no" name="phone" required="required">
    </div>
   <div class="form-group">
   <label for="gender">Gender : *</label><br>
  <label class="radio-inline">
      <input type="radio" name="optradio" value="male" checked>Male
    </label>
    <label class="radio-inline">
      <input type="radio" name="optradio" value="female">Female
    </label>
  </div>
  <div class="form-group">
   <label for="gender">Who you are : *</label><br>
  <label class="radio-inline">
      <input type="radio" name="radio" value="employee" checked>Employee 
    </label>
    <label class="radio-inline">
      <input type="radio" name="radio" value="hirer">Hirer 
    </label>
  </div>
 
 
  <button type="submit" class="btn btn-primary">Submit</button>
  
  </form>
        
       
        </div>
       
        </section>
        
        <%@include file="footer.jsp" %>
</body>
</html>