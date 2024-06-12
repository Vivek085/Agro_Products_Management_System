<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buyproduct.aspx.cs" Inherits="agro.buyproduct" EnableEventValidation = "false" %>

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
    <form id="form1" action="" method="post" runat="server">
        
        <%
            if (Session["email"] != null)
            {
                String emailss = Session["email"].ToString();
                String uid = Session["userid"].ToString();
                if (!Page.IsPostBack)
                {
                    String total = "";
                    String fordate = "";

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

                        //// Product buy now
                        if(Request["pid"] != null)
                        {
                            String orid = "";
                            String id = "";
                            String cartid = "";
                            DateTime currdate = DateTime.Now.Date;
                            fordate = currdate.ToString("yyyy-MM-dd");
                            String inorders = "insert into orders (customer_id,order_date,order_stage) values("+uid+",'"+fordate+"',2)";
                            Session["se"] = inorders;
                            //Response.Redirect("try.aspx");
                            MySqlCommand cmdor = new MySqlCommand(inorders, connection);
                            cmdor.ExecuteNonQuery();
                            int orit;
                            int idt;
                            String qut="";
                            if(Request["qut"] != null)
                            {
                                qut = Request["qut"].ToString();
                            }
                            else
                            {
                                qut = "1";
                            }
                            String seleorid = "select * from orders where customer_id='"+uid+"'";
                            MySqlCommand cmin = new MySqlCommand(seleorid, connection);
                            MySqlDataReader celid = cmin.ExecuteReader();
                            while(celid.Read())
                            {
                                id = celid["order_id"].ToString();
                                cartid = celid["Cart_id"].ToString();
                            }
                            celid.Close();
                            //"select order_id from orders where pid='"+Request["pid"]+"' AND Cart_id='NULL' ";

                            if (id != null && cartid == null)
                            {
                                String inorder_items = "insert into order_items order_id,pid,o_qut values(" + id + "," + Request["pid"] + "," + qut + ")";
                                MySqlCommand cmdorit = new MySqlCommand(inorder_items, connection);
                                orit = cmdorit.ExecuteNonQuery();

                                /* if (orit > 0 && ord > 0)
                                 {
                                     Response.Write("<script>alert('')</script>");
                                 }
 */
                            }

                        }


                        if (Request["cart"] != null)
                        {
                            DateTime currdate = DateTime.Now.Date;
                            fordate = currdate.ToString("yyyy-MM-dd");
                            String orde = "insert into orders (customer_id,order_date,total_amount,Cart_id,order_stage) values("+uid+",'"+fordate+"','"+Request["cartid"]+"',2)";
                            MySqlCommand orderin = new MySqlCommand(orde,connection);
                            orderin.ExecuteNonQuery();

                        }



                        String cartadata = "select c.Cart_id,c.customer_id,c.cre_date,p.pid,p.name,p.price,p.image,r.email,ci.cart_id,ci.pid,ci.qut_ci  from cart c join cart_items ci ON c.Cart_id = ci.cart_id join products p ON ci.pid=p.pid join register r ON c.customer_id=r.id where r.id = "+uid+"";
                        MySqlCommand cartval = new MySqlCommand(cartadata, connection);
                        Response.Write("here");
                        //  Response.Redirect("try.aspx");
                        MySqlDataReader cart = cartval.ExecuteReader();
                        while (cart.Read())
                        {

                    %>

                   <p>Name: <%=cart["name"].ToString()%></p>
                   <p>Qut : <%=cart["qut_ci"].ToString()%></p>
                   <p>Price: <%=cart["price"].ToString()%></p>
                   <img src="admin/productImg/<%=trimPath(cart["image"].ToString())%>" alt="Product" width="150px" />
                    
                     <%
                         }
                         cart.Close();


                         String cartc = "select sum(p.price) as total ,count(ci.pid) as prod from cart as c join cart_items as ci on c.Cart_id=ci.cart_id join products as p on ci.pid=p.pid join register as r on c.customer_id=r.id where id="+uid+" ";
                         MySqlCommand cmd = new MySqlCommand(cartc, connection);

                         //  Response.Redirect("try.aspx");
                         MySqlDataReader tot = cmd.ExecuteReader();
                         while (tot.Read())
                         {
                             total = tot["total"].ToString();
                    %>

                     <p id="total" >Total<% = tot["total"].ToString()%></p>  

        <%

            }
              tot.Close();
             Session["total"] = total;

              Response.Write("<a id='pay' style='margin-left: 50%;' href='pay.aspx?total="+total+"' class='text-uppercase custom_orange-btn mr-3' name='pay' runat='server'> Process of pay </a>");
                     
            %>


               <br><br>
        <%
                }
                catch (Exception error)
                {
                    Response.Write(error);
                }
              
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
