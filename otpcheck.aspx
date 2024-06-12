<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="otpcheck.aspx.cs" Inherits="agro.otpcheck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <link rel="stylesheet" href="css/logfps.css">
</head>
<body>
    <form id="otpverification" runat="server">
             <div class="center">
        <h1>Login</h1>
            <label style="margin-left:5%;" for="otp">OTP</label>
            <input style="margin-left:15%;" id="otpenter" placeholder="Enter OTP" type="text" name="otp">
            <br>
            <br>
            <input style="margin-left:35%;" type="submit" value="Login">
            <br><br />

 
        </div>
    </form>
</body>
</html>
