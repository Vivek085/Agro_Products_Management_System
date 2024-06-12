<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productinfo.aspx.cs" Inherits="agro.productinfo" %>

<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        h2 {
            font-size: 20px;
            margin-top: 30px;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            margin-bottom: 15px;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        textarea {
            width: 100%;
            resize: vertical;
        }

        select {
            width: 100%;
            height: 30px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #fdfdfd;
            border: 1px solid #28a745;
            color:black;
        }

        div.review {
            margin-bottom: 20px;
            border: 1px solid #ccc;
            padding: 10px;
        }

        div.review p {
            margin: 0;
        }
    </style>
</head>
<body>
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
              string query = "SELECT pid,name,price,image,description FROM products where pid="+Request["pid"]+"";
              string imp = "";
              String imgp = "";
              // List<int> pid = new List<int>();
              MySqlCommand cmd = new MySqlCommand(query, connection);
              MySqlDataReader row = cmd.ExecuteReader();
              while (row.Read())
              {

              %>

    <h1><% =row["name"] %></h1>
    <img style="height: 400px; width: 600px; " src="admin/productImg/<%=trimPath(row["image"].ToString())%>" >
    <p><%=row["description"] %>.</p>
    <p>Price: <%=row["price"]%> </p>
    <form id="form1" runat="server" action="#" method="post">

       
         <input type="submit" value="Add to Cart" runat="server" >
   
    
        <input type="submit" value="Buy Now" runat="server" >
  
  
  

       <!-- <div class="review">
            <p>Review 2:</p>
            <p>Review content goes here. Curabitur euismod dapibus libero, eget tincidunt eros facilisis in. Sed rutrum felis quam, at scelerisque sem laoreet a.</p>
            <p>Rating: 5 Stars</p>
        </div>
        <div class="review">
            <p>Review 3:</p>
            <p>Review content goes here. Ut tempus dui id ex vehicula tempus. Fusce eu turpis at ex eleifend cursus ut in mauris.</p>
            <p>Rating: 3 Stars</p>
        </div>-->

    </form>
   

     <!--   //  select re.review_text,re.review_rate,re.user_id,re.pid,us.name,us.id from reviews re JOIN register us ON re.user_id=us.id where pid=24
    -->
         
    <%
            }
            row.Close();%>

  
            <%
        }

        catch (Exception error)
        {
            Response.Write(error);
        }


%>
    <form id="revie" method="post">
      <h2>Give Review</h2>
    
        <label for="review">Your Review:</label><br>
        <textarea id="review" name="review" rows="4" cols="50" runat="server" ></textarea><br><br>
        <label for="rating">Rating:</label>
        <select id="rating" name="rating" runat="server">
            <option>Select rate</option>
            <option value="5">5 Stars</option>
            <option value="4">4 Stars</option>
            <option value="3">3 Stars</option>
            <option value="2">2 Stars</option>
            <option value="1">1 Star</option>
        </select><br><br>
        <input type="submit" id="givereview" value="Submit Review" runat="server" >
        </form>
    <%
        try
        {

            string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=agro";
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            connection.Open();
            
            String buycheck = "select o.customer_id,o.order_id,oi.pid,oi.order_id from orders o join order_items as oi on o.order_id=oi.order_id where oi.pid="+Request["pid"]+"";
            MySqlCommand cmd1 = new MySqlCommand(buycheck, connection);
            MySqlDataReader row1 = cmd1.ExecuteReader();
            int i=0;
            if (row1.HasRows)
            {
                i = 1;
               
            }
            row1.Close();
            if(Request["givereview"] != null)
            {
                if(i > 0)
                    {
                          String rein = " insert into reviews(review_text,review_rate,user_id,pid) values('"+Request["review"]+"','"+Request["rating"]+"','"+uid+"','"+Request["pid"]+"')";
                    }
                    else
                    {
                        Response.Write("<script>alert('for that you need to buy that product.')</script>");
                    }
            }

        %>


    <h2>View Rewiew :</h2>
    <% 
        // string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=agro";
        //MySqlConnection connection = new MySqlConnection(ConnectionString);
        //connection.Open();

        String revi = "select re.review_text,re.review_rate,re.user_id,re.pid,us.user_name,us.id from reviews re JOIN register us ON re.user_id=us.id where pid="+Request["pid"]+"";
        MySqlCommand cmd = new MySqlCommand(revi, connection);
        MySqlDataReader row = cmd.ExecuteReader();
        if (row.HasRows)
        {
            while (row.Read())
            {

        %>
    <div class="review">
        <p><%=row["name"] %></p>
            <p><%=row["review_text"] %>.</p>
            <p>Rating: <%=row["review_rate"] %> Stars</p>
        </div>
    <%
                }
            }
            else
            {
                Response.Write("Review Not Available.");
            }
        }
        catch(Exception e)
        {
            Response.Write(e);
        }

        %>
    <br />
    <br />
    <%

        
        %>

</body>
</html>
