<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="agro.logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <%       Session.Clear();
         Response.Write("<script>alert('Logout');window.open('login.aspx','_blank').focus();window.close();</script>");
          //Response.Redirect("login.aspx");

       %>
    </form>
</body>
</html>
