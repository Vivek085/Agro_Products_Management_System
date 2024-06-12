<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addtocart.aspx.cs" Inherits="agro.addtocart" %>

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
    <style>
 .quantity-box {
  display: flex;
  align-items: center;
  justify-content: center;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 100px;
}

.quantity-input {
  text-align: center;
  border: none;
  width: 50%;
}

.minus-btn, .plus-btn {
  display: flex; align-items: center; justify-content: center; background-color: #f5f5f5; border: none; width: 25%; height: 100%; cursor: pointer;
}

.minus-btn:hover, .plus-btn:hover {
  background-color: #e6e6e6;
}
    </style>

</head>
<body>
    <form id="form1" method="post" action="#" runat="server">
         <a href="index.aspx" class="text-uppercase custom_orange-btn mr-3">
            Home
              </a>

        <h2>
            <p></p>
        </h2>
       
            <%
   if (Session["email"] != null)
      {
        String emailss = Session["email"].ToString();
                    String uid = Session["userid"].ToString();
  
                String countp = "";
                String total = "";
                String fordate = "";
                String cartid = "";
                    String p_id="";
                try
                {
                    string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=agro";
                    MySqlConnection connection = new MySqlConnection(ConnectionString);
                    connection.Open();

                    String cartc = "select sum(p.price) as total ,count(ci.pid) as prod from cart as c join cart_items as ci on c.Cart_id=ci.cart_id join products as p on ci.pid=p.pid join register as r on c.customer_id=r.id where id="+uid+"";
                    MySqlCommand cartval = new MySqlCommand(cartc,connection);

                   
                    MySqlDataReader cart = cartval.ExecuteReader();
                    while (cart.Read())
                    {
                        total = cart["total"].ToString();
                        countp = cart["prod"].ToString();

                    }
                    cart.Close();
                    %>

        <p>
            Total Products : <%Response.Write(countp);%>
            Total Price : <% Response.Write(total); %>
             
        </p>


        <%

            }
            catch (Exception error)
            {
                Response.Write(error);
            }


            string qutu = "";
            string ct_id = "";
            String pidf = "";
            String qutdata="";
            /*int userid;*/

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

            /*   string useridg = "";
   */
            if (Request["add"] != null)
            {
                try
                {
                    string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=agro";
                    MySqlConnection connection = new MySqlConnection(ConnectionString);
                    connection.Open();

                    //String emailss = "20bmiit011@gmail.com";//Session["email"].ToString();
                    /// get customer id
                   /* String seluserid = "select id from register where email='" + emailss + "'";
                    Response.Write(seluserid);

                    MySqlCommand cmd = new MySqlCommand(seluserid, connection);
                    MySqlDataReader row = cmd.ExecuteReader();
                        
                    while (row.Read())
                    {
                        useridg = row["id"].ToString();
                        userid = int.Parse(useridg);
                    }

                    row.Close();*/

                    DateTime currdate = DateTime.Now.Date;
                    fordate = currdate.ToString("yyyy-MM-dd");

                    /// in cart
                    String incart = "insert into cart(customer_id,cre_date) values(" + uid + ",'" + fordate + "')";

                    MySqlCommand comman = new MySqlCommand(incart, connection);
                    int rowcartin = comman.ExecuteNonQuery();

                    /// get cartid
                    String selcartitme = "select Cart_id from cart where customer_id=" + uid + "";

                    MySqlCommand cmdcart = new MySqlCommand(selcartitme, connection);
                    Session["se"] = cmdcart;
                    // Response.Redirect("try.aspx");
                    MySqlDataReader rowcart = cmdcart.ExecuteReader();

                    while (rowcart.Read())
                    {
                        cartid = rowcart.GetString(0);
                    }

                    rowcart.Close();

                    //// in cart item
                    String incart_items = "insert into cart_items(cart_id,pid,qut_ci)values('" + cartid + "','"+Request["pid"]+"','1')";
                    Response.Write(incart_items);
                    Session["se"] = incart_items;
                    //Response.Redirect("try.aspx");
                    MySqlCommand comcartitem = new MySqlCommand(incart_items, connection);
                    int rowcartitem = comcartitem.ExecuteNonQuery();

                    if (rowcartin > 0 && rowcartitem > 0)
                    {

                        Response.Write("<script> alert('Product Added to cart') document.location = 'cart.aspx';</script>");

                    }

                }

                catch (Exception error)
                {
                    Response.Write(error);
                }
            }


            try
            {
                // get all detail of cart with  join
                string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=agro";
                MySqlConnection connection = new MySqlConnection(ConnectionString);
                connection.Open();

                String cartadata = "  select c.Cart_id,c.customer_id,c.cre_date,p.pid,p.name,p.price,p.image,r.email,ci.cart_id,ci.pid,ci.qut_ci  from cart c join cart_items ci ON c.Cart_id = ci.cart_id join products p ON ci.pid=p.pid join register r ON c.customer_id=r.id where r.id = "+uid+"";

                MySqlCommand cartval = new MySqlCommand(cartadata,connection);

                //  Response.Redirect("try.aspx");
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

                // qutu = cart["qut"].ToString();
                ct_id = cart["cart_id"].ToString();
                pidf = cart["pid"].ToString();


                        %>
                     <div class="row layout_padding2">
                      <div class="col-md-8">
                       

                      <div class="fruit_detail-box">
                        <h3>
                        <%=cart["name"].ToString() %> <%=cart["pid"].ToString()%>
                        </h3>
                        <p class="mt-4 mb-5">
                         $ <% =cart["price"].ToString()%>
                        </p>
                      <%  Response.Write("<a id='addu' style='height:35px; Width:28px; text-align: center; ' href='addtocart.aspx?upq="+pidf+"' class='text-uppercase custom_dark-btn' name='addu' runat='server'> + </a> ");%>
                              
                    <%
                        Int32 qut = Int32.Parse(cart["qut_ci"].ToString());
                      //  Response.Write("<input type=\"number\" name=\"quttb\" id=\"quttb\" min=\"1\" value=\" "+qut+" \"  runat=\"server\">");
                        Response.Write(qut);
                        %>
                        
                        

                     <%  Response.Write("<a id='lessu' style='height:35px; Width:28px;' href='addtocart.aspx?upq="+pidf+"' class='text-uppercase custom_dark-btn' name='lessu' runat='server'> - </a> ");
                              string cid = "";

                         %>
                            <br><br>
                            <%

                                  Response.Write("<a id='buynow' href='buyproduct.aspx?cart="+ct_id+"' class='text-uppercase custom_dark-btn' name='buynow' runat='server'>   Buy Now </a> ");
                                  Response.Write("<a id='remove' href='addtocart.aspx?removeproduct="+pidf+"' class='text-uppercase custom_orange-btn mr-3' name='remove' runat='server'>  Remove </a>");

                                %>       
                      </div>
                    </div>
          
                    <div class="col-md-4 d-flex justify-content-center align-items-center">
                      <div class="fruit_img-box d-flex justify-content-center align-items-center">
                        <img src="admin/productImg/<%=trimPath(cart["image"].ToString())%>" alt="Product" width="250px" />
                      </div>
                    </div>
                  </div>
                    <hr size="2" width="95%" color="black" />

        <%
            }
                cart.Close();
               %>  
               

                <%


                        if(Request["remove"] != null)
                        {
                            String dele="delete from cart_items where pid='"+Request["removeproduct"]+"'";
                            //Session["se"] = dele;
                            //  Response.Redirect("try.aspx");
                            MySqlCommand command = new MySqlCommand(dele, connection);
                            int delrow =  command.ExecuteNonQuery();
                            if(delrow > 0)
                            {
                                Response.Write("<script>alert('Product remove.') document.location = 'addtocart.aspx'</script>");
                            }

                        }

                        String sesctqut = "select qut_ci from cart_items where pid='"+Request["upq"]+"'";

                        MySqlCommand cmd = new MySqlCommand(sesctqut, connection);
                        MySqlDataReader row = cmd.ExecuteReader();
                        while (row.Read())
                        {
                            qutdata = row["qut_ci"].ToString();
                        }

                        if (Request["addu"] != null)
                        {
                            int q = Int32.Parse(qutdata);
                            q += 1;
                            Response.Write("qut" + q);
                             Session["se"] = qutdata;
                            Response.Redirect("ter.aspx");
                            //update qut  ++
                            String addq = "update cart_items set qut_ci=" + q + " where pid=" + Request["upq"] + "";
                            Session["se"] = qutdata;
                        //    Response.Redirect("ter.aspx");
                            MySqlCommand comman = new MySqlCommand(addq, connection);
                            int rowcartin = comman.ExecuteNonQuery();
                            Response.Redirect("addtocart.aspx");

                        }

                        if (Request["lessu"] != null)
                        {

                            int q = Int32.Parse(qutdata);
                            q -= 1;
                            // update qut --
                            Response.Write("qut" + q);
                            String lessq = "update cart_items set qut_ci=" + q + " where pid=" + Request["upq"] + "";
                            Session["se"] = q;
                             Response.Redirect("ter.aspx");

                            MySqlCommand comman = new MySqlCommand(lessq, connection);
                            int rowcartin = comman.ExecuteNonQuery();
                            Response.Redirect("addtocart.aspx");
                        }

                       

                    }

                    catch (Exception error)
                    {
                        Response.Write(error);
                    }

%>

               

                <%
                        try
                        {
                            string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=agro";
                            MySqlConnection connection = new MySqlConnection(ConnectionString);
                            connection.Open();

                            Response.Write("<a href='buyproduct.aspx?cart="+ct_id+"' style='margin-left: 40%;' id='checkout' class='text-uppercase custom_dark-btn' name='checkout' runat='server'>  Checkout </a>");
                           // Response.Write("<a href='addtocart?cart="+ct_id+"' style='margin-left: 40%;' id='removeall'  class='text-uppercase custom_orange-btn mr-3' name='removeall' runat='server'>  Remove All </a>");


                            if (Request["removeall"] != null)
                            {
                                String remoall = "delete from Cart where Cart_id="+Request["cart"]+"";
                                String remo = "delete from cart_items where cart_id=" + Request["cart"] + "";
                                Session["se"] = remo;
                                //  Response.Redirect("try.aspx
                                MySqlCommand cmdall = new MySqlCommand(remoall, connection);
                                int remall = cmdall.ExecuteNonQuery();
                                MySqlCommand comcartitem = new MySqlCommand(remo, connection);
                                int rowcartitem = comcartitem.ExecuteNonQuery();
                                if (rowcartitem > 0 && remall > 0)
                                {
                                    Response.Write("<script>alert('Product All remove from cart.') document.location = 'viewproducts.aspx'</script>");
                                }
                            }

                            
                        }
                        catch (Exception error)
                        {
                            Response.Write(error);
                        }
                    }
                    else
                    {
                        Response.Redirect("login.aspx");
                    }

%>


    </form>
</body>
</html>


<!-- SELECT o.order_id, o.Cart_id ,o.customer_id, o.order_date, o.total_amount, oi.pid, oi.o_qut, oi.price, p.name, p.image FROM orders o LEFT JOIN order_items oi ON o.order_id = oi.order_id JOIN products p ON  oi.pid = p.pid is null or JOIN Cart c on c.Cart_id=o.Cart_id JOIN cart_items ci on c.Cart_id=ci.cart_id JOIN products p ON  oi.pid = ci.pid;

    SELECT o.order_id, o.Cart_id ,o.customer_id, o.order_date, o.total_amount, oi.pid, oi.o_qut, oi.price, p.name, p.image FROM orders o JOIN order_items oi ON o.order_id = oi.order_id JOIN Cart c on c.Cart_id=o.Cart_id JOIN cart_items ci on c.Cart_id=ci.cart_id JOIN products p ON  oi.pid = p.pid;

-->
