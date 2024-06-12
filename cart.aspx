<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="agro.cart" %>

<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%
        
            String useridg="";
       
             try
                {
                    string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=agro";
                    MySqlConnection connection = new MySqlConnection(ConnectionString);
                    connection.Open();

                    String cartadata = "  select c.Cart_id,c.customer_id,c.cre_date,p.pid,p.name,p.price,p.image,r.email,ci.cart_id,ci.pid,ci.qut  from cart c join cart_items ci ON c.Cart_id = ci.cart_id join products p ON ci.pid=p.pid join register r ON c.customer_id=r.id where =r.id='" + useridg + "'";
                    
                    MySqlCommand cartval = new MySqlCommand(cartadata, connection);
                    Session["se"] = cartval;
                    // Response.Redirect("try.aspx");
                    MySqlDataReader cart = cartval.ExecuteReader();
                    %>
        
            <section  class="fruit_section">
            <div style="margin-bottom:2%"  class="container">
              <h2 class="custom_heading">Cart</h2>
              <p class="custom_heading-text">
              </p>
        <%
                    while (cart.Read())
                    {
                        %>
                     <div class="row layout_padding2">
                      <div class="col-md-8">
                       

                      <div class="fruit_detail-box">
                        <h3>
                        <%=cart["p.name"].ToString() %>
                        </h3>
                        <p class="mt-4 mb-5">
                         $ <% =cart["p.price"].ToString()%>
                        </p>
                           <p class="mt-4 mb-5">
                              *
                        </p>
                        <div>
                        <button class="minus-btn" type="button" runat="server" id="less" name="less">-</button>
                        <input class="quantity-input" type="number" id="qut" runat="server" value="" name="qut" min="1" max="20">
                        <button class="plus-btn" type="button" runat="server" id="add" name="add">+</button>
                              <%
                                  string cid = "";

                                  ////// select * from orders o join order_items io ON o.order_id = io.order_id join products p ON io.pid = p.pid;

                                  %>

                                        <input style="" type="number"


                            <%

                                  Response.Write("<a id='buynow' href='remove?pid="+cid+"' class='text-uppercase custom_dark-btn' name='buynow' runat='server' >   Buy Now </a> ");
                                  Response.Write("<a id='remove' href='?pid="+cid+"' class='text-uppercase custom_orange-btn mr-3' name='remove' runat='server'>  Remove </a>");

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
                    
                          %>
            
                
                        </div>
                      </div>
                    </div>


          
                    <div class="col-md-4 d-flex justify-content-center align-items-center">
                      <div class="fruit_img-box d-flex justify-content-center align-items-center">
                        <img src="admin/productImg/<%=trimPath(cart["p.image"].ToString())%>" alt="Product" width="250px" />
                      </div>
                    </div>
                  </div>
                    <hr size="2" width="95%" color="black" />

        <%
                    }
                }

                 catch (Exception error)
                {
                    Response.Write(error);
                }


        %>


    </form>
</body>
</html>
