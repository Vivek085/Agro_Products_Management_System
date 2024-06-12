<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deliverypage.aspx.cs" Inherits="agro.deliverypage" %>

<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail"%>

<!DOCTYPE html>
<html>
    <%
        if (Session["email"] != null)
        {
            String emailss = Session["email"].ToString();
            String uid = Session["userid"].ToString();


        %>
<head>
    <title>Delivery Person Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f1f1f1;
        }

        h1 {
            margin-top: 0;
        }

        .product-info, .customer-details, .delivery-stage {
            background-color: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        .product-info p, .customer-details p {
            margin: 5px 0;
        }

        .product-info form {
            display: inline-block;
            margin-top: 10px;
        }

        .product-info select, .product-info input[type="submit"] {
            margin-right: 10px;
            padding: 5px;
            border-radius: 3px;
        }

        .product-info input[type="submit"] {
            background-color: #44c030;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .product-info input[type="submit"]:hover {
            background-color: #010101;
            color: #fafcfe;
        }
        .ups{
             background-color: #44c030;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .ups:hover {
             background-color: #010101;
            color: #fafcfe;
        }
    </style>
</head>
<body>


    <%

        try
        {
            string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=agro";
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            connection.Open();

            String deliver = "SELECT u.id, u.user_name, u.contact, u.address, p.name, p.price,oa.deliver_person_id, oa.order_id, ord.order_id, ord.customer_id, orit.order_id, orit.pid FROM deliver_assign oa JOIN orders as ord ON oa.order_id = ord.order_id JOIN register as u ON u.id = ord.customer_id JOIN order_items as orit ON ord.order_id = orit.order_id JOIN products as p ON orit.pid = p.pid where deliver_person_id="+uid+" ";
            MySqlCommand cmd = new MySqlCommand(deliver, connection);


            MySqlDataReader row = cmd.ExecuteReader();
            while (row.Read())
            {


        %>
    
    <div class="customer-details">
        <h1>Customer Details</h1>
        <p>Customer Name: <%=row["name"].ToString() %></p>
        <p>Address: <%=row["address"].ToString() %></p>
        <p>Phone Number: (+91) <%=row["contact"]%> </p>
    </div>

    <div class="product-info">
        <h1>Product Information</h1>
        <p>Product Name: <%=row["name"] %></p>
        <p>Payment Method: </p>
        <p>Price: <%=row["price"] %></p>
    
        <h1>Delivery Stage</h1>
        <p>Current Stage: Out for Delivery</p>
        <form action="" method="post" >
            <select name="deliverystage" id="deliverystage" runat="server" >
               <option></option>
            </select>
            <input  type="submit" value="Update Delivery Stage">
            <%// Response.Write("<button id='updates' href='deliverpage.aspx?pid="+row["pid"]+"' name='buynow' runat='server' > Update delivery stage </button> ");

                Response.Write("<button class='ups' id='updates' href='deliverpage.aspx?oid="+row["order_id"]+"&os="+Request["deliverystage"]+"' name='buynow' runat='server' > Update delivery stage </button> ");


                        }
                        row.Close();

                        if(Request["updates"] != null)
                        {

                            String upd = "update orders set order_stage="+Request[""]+" where order_id="+Request["oid"]+" ";
                            MySqlCommand comman = new MySqlCommand(upd, connection);
                            int app = comman.ExecuteNonQuery();


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
    </div>
</body>
</html>

