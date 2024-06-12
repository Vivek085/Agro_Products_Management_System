<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="agro.login" %>
<%  %>
<html>
    <head>
        <title>Registration</title>
        <link rel="stylesheet" href="css/logstyls.css">
        </head>
<body>
<div class="main"></div>
    <div class="center">
      
        <form action="login.aspx"  method="POST">

             <div class="leftsi">
                <h2>Register Here</h2>
                <br>
                <label style="margin-left:5%;" id="fname"> Name :</label>  <input type="text" id="fname" name="name"> <br><br>

                <label style="margin-left:5%;" for="Gender">Gender:       </label>  
                <input class="mal" type="radio" id ="Male"name="Gender">
                <span id="male">Male</span>
                <input class="fem" type="radio"id="Female"name="Gender">

                <span id="Female"> Female</span><br><br>
                

                <label style="margin-left:5%;" for="UserType">Type of User:</label> <select id="utype"name="UserType">
                    <option value="Customer">Customer</option>
                    <option value="Owner">Owner</option>
                    <option value="Delivery Person">Delivery Person</option>
                </select> <br><br>

                <label style="margin-left:5%;" for="Date Of Birth">Date Of Birth: </label>  <input type="date" id="dob" name="DOB"> <br><br>

                <label style="margin-left:5%;" for="ContactNumber">Contact Number:</label> <input type="tel" id="contactno"name="ContactNumber">  <br><br>

                <label style="margin-left:5%;" for="Email">Email:</label> <input type="email" id="email" name="email">  <br><br>

                <label style="margin-left:5%;" for="Password">Password:</label>  <input type="password" id="pword"name="Password">  <br><br>

                <!-- <label for="Confirm Password">Confirm Password:</label> <input type="password" id="cpassword" name="conform"> <br><br> -->

                <label style="margin-left:5%;" for="Address">Address: </Address></label> <textarea name="Address" id="address" placeholder="Address"></textarea>  <br><br>
          
          
                <input type="submit" id="submitbtn"name="Submit"value="Register">
          
            </div>
                
        </form>
      <% Response.Redirect("name here" + Request["fname"]); %>

    <body>
</html>
