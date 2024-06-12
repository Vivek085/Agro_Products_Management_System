<%@ Page Language="C#" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail"%>


<html>
    <head>
        <title>Registration</title>
        <link rel="stylesheet" href="css/regi.css">
        <style>

 
        </style>
        </head>
<body>
        <form action="#" id="regisration" method="POST" runat="server">
            <div class="leftsi">
                <h2>Profile</h2>
                        <br>
                        <label style="margin-left:5%;" id="uname"> Name :</label>          <input type="text" runat="server" id="fname" name="fname"> 
                            <asp:RequiredFieldValidator ID="reqname" runat="server" ForeColor="Red" ControlToValidate="fname" ErrorMessage= " * " >  </asp:RequiredFieldValidator>
                               
                <br>

                <br />
                        <label style="margin-left:5%;" >Gender:</label>  
                        <input class="mal" type="radio"  runat="server" id="male" name="gender" value="male">
                        Male
                        <input class="femal" type="radio"  runat="server" id="female" name="gender" value="female"> Female
                    
                            
                      <br>
                         <br>
                

                        <label style="margin-left:5%;" for="UserType">Type of User:</label> <select runat="server" id="utype" name="UserType">
                            <option>  </option>
                            <option value="Customer">Customer</option>
                         
                        </select>
                 <asp:RequiredFieldValidator ID="requtype" runat="server" ForeColor="Red" ControlToValidate="utype" ErrorMessage= " * " >  </asp:RequiredFieldValidator>
                <br>
                      
                        <br>


                        <label style="margin-left:5%;" for="Date Of Birth">Date Of Birth: </label>        <input type="date" runat="server" id="dob" name="DOB">
                <asp:RequiredFieldValidator ID="reqdob" runat="server" ForeColor="Red" ControlToValidate="dob" ErrorMessage= " * " >  </asp:RequiredFieldValidator>
                <br />

               
<br>

                        <label style="margin-left:5%;" for="ContactNumber"> Contact Number:</label>     <input type="tel" runat="server" id="contactno" name="ContactNumber">
               
                <asp:RequiredFieldValidator ID="reqcontno" runat="server" ForeColor="Red" ControlToValidate="contactno" ErrorMessage= " * " >  </asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="contactno" Font-Size="XX-Small" ForeColor="Red" ValidationExpression="^[0-9]{10}$" ErrorMessage="Please enter a 10-digit phone number."></asp:RegularExpressionValidator>
                        <br>

                        <label style="margin-left:5%;" for="Email">Email:</label>             <input type="email" runat="server" id="email">
                
                <asp:RequiredFieldValidator ID="reqemail" runat="server" ForeColor="Red" ControlToValidate="email" ErrorMessage= " * " >  </asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="emailaddvalid" runat="server" ControlToValidate="email" ForeColor="Red" Font-Size="XX-Small" ErrorMessage="Invalid email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                        <br>

                        <label style="margin-left:5%;" for="Password" > Password:</label>                 <input type="password" runat="server" id="pword"  name="Password"> 
                        <asp:RequiredFieldValidator ID="reqpwd" runat="server" ForeColor="Red" ControlToValidate="pword" ErrorMessage= " * " >  </asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="pword" Font-Size="XX-Small" ForeColor="Red" ErrorMessage="Password contain at least 8 characters and contain at least 1 uppercase , 1 lowercase letter, and 1 digit" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"></asp:RegularExpressionValidator>

                            <br />
                
               <br>
                        

                        <!-- <label for="Confirm Password">Confirm Password:</label> <input type="password" id="cpassword" name="conform"> <br><br> -->

                        <label style="margin-left:5%;" for="Address" > Address:</label>       <textarea name="Address" runat="server" id="address"  placeholder="Address"></textarea> 
                        <asp:RequiredFieldValidator ID="reqaddress" runat="server" ForeColor="Red" ControlToValidate="address" ErrorMessage= " * " >  </asp:RequiredFieldValidator>     <br />
         <br />

          
                        <input runat="server" type="submit" id="submitbtn" value="Update"><br><br>
          

                             
     <%

     if (Request["submitbtn"] != null)
     {
        
     }

       %>



            </div>
           
            </form>
  
    <body>
</html>
