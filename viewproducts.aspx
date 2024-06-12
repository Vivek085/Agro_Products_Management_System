<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewproducts.aspx.cs" Inherits="agro.viewproducts" %>

<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail" %>


<!DOCTYPE html>
<%
    

    %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" method="post" runat="server">
           <a href="index.aspx" class="text-uppercase custom_orange-btn mr-3">
            Home
              </a><br /><br />

          <%
             
              String uid = Session["userid"].ToString();

                  string trimPath(string Path)
                  {
                      try
                      {
                          if (Path != null)
                          {
                              string[] separatedPath = Path.Split('/');
                              string FinalPath = separatedPath[separatedPath.Length - 1];
                              return FinalPath;
                          }
                          return "";
                      }
                      catch (Exception error)
                      {
                          return "";
                      }
                  }

                  try
                  {
                      string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=agro";
                      MySqlConnection connection = new MySqlConnection(ConnectionString);
                      connection.Open();


                      string query = "SELECT pid,name,price,image,description,deleval FROM products";


                   %>

   <section  class="fruit_section">
    <div style="margin-bottom:2%"  class="container">
      <h2 class="custom_heading">PRODUCT</h2>
      <p class="custom_heading-text">
      </p>
        <% 
            string imp = "";
            // List<int> pid = new List<int>();
            MySqlCommand cmd = new MySqlCommand(query, connection);
            MySqlDataReader row = cmd.ExecuteReader();
            String imgp = "";


            while (row.Read())
            { %>
      <div class="row layout_padding2">
        <div class="col-md-8">
                       
            <%
        if ((bool)row["deleval"] == true)
          {
                %>

          <div class="fruit_detail-box">
            <h3>
            <%=row["name"].ToString() %>
            </h3>
            <p class="mt-4 mb-5">
             <%// =row["description"].ToString()%>
            </p>
               <p class="mt-4 mb-5">
                   $ <%=row["price"].ToString()%>
            </p>
            <div>
            
                  <%
    String pidg = row["pid"].ToString();
    imgp = row["image"].ToString();
    String qut = Request["qut"];
    ////// select * from orders o join order_items io ON o.order_id = io.order_id join products p ON io.pid = p.pid;
    Response.Write("<a id='buynow' href='buyproduct.aspx?pid=" + pidg + "' class='text-uppercase custom_dark-btn' name='buynow' runat='server' >   Buy Now </a> ");
    Response.Write("<a id='addtocart' href='addtocart.aspx?pid=" + pidg + "&qut=" + qut + "&add=" + 1 + "' class='text-uppercase custom_orange-btn mr-3' name='addtocart' runat='server'>  add to cart </a>");

                    %>
            
                
            </div>
          </div>
        </div>
          
        <div class="col-md-4 d-flex justify-content-center align-items-center">
          <div class="fruit_img-box d-flex justify-content-center align-items-center">
              <%
    Response.Write("<a href='productinfo.aspx?pid=" + pidg + "' runat='server'>" +
    "<img src='admin/productImg/" + trimPath(row["image"].ToString()) + "' alt='Product' width='250px'/>" +
    "</a>");
                  %>
          <p>Click On imgae for more Info.</p>
          </div>
        </div>
      </div>
        <hr size="2" width="95%" color="black" />
      <%   
                  }
              }



          }
          catch (Exception error)
          {
              Response.Write(error);
          }

                %>
       
  </section>

        

    </form>
</body>
</html>
