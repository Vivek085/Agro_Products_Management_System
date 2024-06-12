<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetpassword.aspx.cs" Inherits="agro.forgetpassword" %>

<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail"%>
 <%

     if (Request["submitbtn"] != null)
     {
         try
         {
             MySqlConnection connection = new MySqlConnection("server=127.0.0.1;uid=root;pwd=root;database=agro");
             connection.Open();

             //problem  su aave che?
             // user id naa basis par kar
             // mari mai unique chesus email su email? haa

             string emailtbx, passtbx,conpasstbx;
             emailtbx = Request["usermail"];
             passtbx = Request["newpass"];
             conpasstbx = Request["confirmpass"];
             if (passtbx == conpasstbx)
             {
                 string update = " UPDATE register SET pass='" + passtbx + "' WHERE  email='" + emailtbx + "'";
                 //Response.Write(update);
                 using (MySqlCommand cmd = new MySqlCommand(update, connection))
                 {
                     int rowsAffected = cmd.ExecuteNonQuery();

                     if (rowsAffected > 0)
                     {
                         Response.Write("<script>alert('PassWord Updated Successfully.')</script>");
                         Response.Redirect("login.aspx");
                     }
                     else
                     {
                         Response.Write("<script>alert('PassWord Updated get Failed.')</script>");
                     }
                 }
             }
             else
             {
                 Response.Write("<script>alert('PassWord both candidates value must be same.')</script>");
                 Response.Redirect("forgetpassword.aspx");
             }

             connection.Close();

         }
         catch (Exception error)
         {
             Response.Write(error.Message);
         }
     }


        %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> fpass </title>
    <style>
        input {
            border: 1px solid black;
            border-radius: 6px;
        }

        td {
            text-align: center;
        }

        .sub {
            border: none;
            background-color: #35ca2a;
         /* background-image: linear-gradient(#13b03f,#d3d03c); */
            color: rgb(19, 18, 18);
            padding: 8px 40px;
            margin-left: 105%;
            text-transform: uppercase;
            font-size: 14px;
        }
    </style>
        <link rel="stylesheet" href="css/logfps.css">
   
</head>
<body>
    <form id="forgetpassword" runat="server">
       <div class="forgetpass">
        <h1>Change Password</h1>
            <!-- <label for="Username">Username</label>
            <input type="text" id="uname" name="uname"> -->

                        <label for="Username">Email</label>
                        <input style="margin-left:22%;" placeholder="Emaili" required runat="server" type="email" id="usermail"> &nbsp <br><br>
         
                       <!-- <label for="Email OTP">OTP</label>
                  
                        <input style="margin-left:22%;" placeholder="Enter OTP" type="text" id="emailotp" name="emailotp"><br><br> -->
                
                        <label for="New Password">New </label>&nbsp
                   
                        <input style="margin-left:20%;" placeholder="New Password" required runat="server" type="password" id="newpass"> <br><br>
                  
                        <label for="Confirm Password">Confirm</label>&nbsp
                    
                        <input style="margin-left:17%;" placeholder="Confirm Password" required runat="server" type="password" id="confirmpass">&nbsp <br><br>
                   
                        <input style="margin-left:5%;" class="sub" runat="server" type="submit" id="submitbtn" value="Submit"><br><br>
           

            <!-- <div class="pass"><a href="Login.html">Login</a><span> -->
            <!--<a class="register" href="registration.html">Register</a>-->
    </div>
    </form>

   
</body>
</html>
