<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="try.aspx.cs" Inherits="agro._try" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%  String se = Session["se"].ToString();
              Response.Write(se); %>
           
        </div>
    </form>
</body>
</html>
