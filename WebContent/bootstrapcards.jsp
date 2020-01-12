<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Card</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body> 
 
<div class="container">
  <h2>Cards Columns</h2>
  <p>The .card-columns class creates a masonry-like grid of cards. The layout will automatically adjust as you insert more cards.</p>
  <p><strong>Note:</strong> The cards are displayed vertically on small screens (less than 576px):</p>
  <div class="card-columns">
    <div class="card bg-primary">
      <div class="card-body text-center">
        <p class="card-text">Some text inside the first card</p>
      </div>
    </div>
    <div class="card bg-warning">
      <div class="card-body text-center">
        <p class="card-text">Some text inside the second card</p>
      </div>
    </div>
    <div class="card bg-success">
      <div class="card-body text-center">
        <p class="card-text">Some text inside the third card</p>
      </div>
    </div>
    <div class="card bg-danger">
      <div class="card-body text-center">
        <p class="card-text">Some text inside the fourth card</p>
      </div>
    </div>  
    <div class="card bg-light">
      <div class="card-body text-center">
        <p class="card-text">Some text inside the fifth card</p>
      </div>
    </div>
    <div class="card bg-info">
      <div class="card-body text-center">
        <p class="card-text">Some text inside the sixth card</p>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <h2>Card Deck</h2>
  <p>The .card-deck class creates an <strong>equal height and width</strong> grid of cards. The layout will automatically adjust as you insert more cards.</p>
  <p>In this example we have added extra content to the first card, to make it taller. Notice how the other cards follow.</p>
  <p><strong>Note:</strong> The cards are displayed vertically on small screens (less than 576px):</p>
  <div class="card-deck">
    <div class="card bg-primary">
      <div class="card-body text-center">
        <p class="card-text">Some text inside the first card</p>
        <p class="card-text">Some more text to increase the height</p>
        <p class="card-text">Some more text to increase the height</p>
        <p class="card-text">Some more text to increase the height</p>
      </div>
    </div>
    <div class="card bg-warning">
      <div class="card-body text-center">
        <p class="card-text">Some text inside the second card</p>
      </div>
    </div>
    <div class="card bg-success">
      <div class="card-body text-center">
        <p class="card-text">Some text inside the third card</p>
      </div>
    </div>
    <div class="card bg-danger">
      <div class="card-body text-center">
        <p class="card-text">Some text inside the fourth card</p>
      </div>
    </div>  
  </div>
</div>


<br><br><br><br><br>


<div class="container">

<div class="row">
<%  int k=1;
for(int i=1;i<20;i++){ %>
 <%if(i%4!=0){ %> 
  <div class="col-md-4">
    <div class="card bg-primary">
      <div class="card-body text-center">
        <p class="card-text">Some text inside the first card</p>
        <p class="card-text">Some more text to increase the height</p>
        <p class="card-text">Some more text to increase the height</p>
        <p class="card-text">Some more text to increase the height</p>
      </div>
    </div>
   </div>
   <%if(i==(4*k)-1){out.print("</div><br><br>");} %>
  <%} else{
              out.print("<div class='row'>");k=k+1;
  %> 
    
   
   
  <%}
 } %>  
  
   </div> 
<br><br><br>
</div>


<br>

<br><br><br><br><br>


<div class="container">

<div class="row">
<%  int l=1;
for(int i=1;i<20;i++){ %>
 <%if(i%4!=0){ %> 
  <div class="col-md-4">
     <div class="card" style="width:400px">
    <img class="card-img-top" src="img/1.jpg" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">John Doe</h4>
      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
      <a href="#" class="btn btn-primary stretched-link">See Profile</a>
    </div>
  </div>
    </div>
   <%if(i==(4*l)-1){out.print("</div><br><br>");} %>
  <%} else{
              out.print("<div class='row'>");l=l+1;
  %> 
    
   
   
  <%}
 } %>  
  
   </div> 
<br><br><br>
</div>




</body>
</html>
    