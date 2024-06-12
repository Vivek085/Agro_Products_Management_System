<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="agro.login1" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail"%>
<%@Import Namespace="System.Security.Cryptography" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="css/logfps.css">
</head>
<body>
    <form id="login" action="#" runat="server">
           <%
  
            String emc, pac;
            emc = "";
            pac = "";

            if (!IsPostBack)
            {
                HttpCookie ca = Request.Cookies["email"];
                HttpCookie pa = Request.Cookies["pass"];

                if (ca != null && pa != null)
                {
                    emc = ca.Value;

                    pac = pa.Value;
                }
            }
    
  
    if((emc == "") && (pac == ""))
    {

        Response.Write("<div class='center'>");
        Response.Write("<h1>Login</h1>");
        Response.Write("<lable  style=\"margin-left:10%\" >Email</lable>");
        Response.Write("<input  type=\"email\" style=\"margin-left:13%;  padding: 4px 34.5px;\" name=\"email_id\" ID=\"email_id\" value=\" \" placeholder=\"Enter your Email\" runat=\"server\" required> <br><br>");
        Response.Write("<lable  style='margin-left:10%'>Password</lable>");
        Response.Write("<input  style=\"margin-left:5%;  padding: 4px 35px;\" type=\"password\" ID=\"pass_word\" name=\"pass_word\" value=\" \" placeholder=\"Enter your password\" required ><br><br>");
        Response.Write("<input type=\"checkbox\"  style=\"margin-left:33%\" ID=\"remberme\" name=\"remberme\" > Remamber me <br><br>");
    }
    else
    {
        Response.Write("<div class='center'>");
        Response.Write("<h1>Login</h1>");
        Response.Write("<lable  style=\"margin-left:10%\">Email</lable>");
        Response.Write("<input  type=\"email\"  style=\"margin-left:13%;  padding: 4px 34.5px;\" name=\"email_id\" ID=\"email_id\" value=\" "+emc+" \" placeholder=\"Enter your Email\" runat=\"server\" required > <br><br>");
        Response.Write("<lable  style='margin-left:10%'>Password</lable>");
        Response.Write("<input  style=\"margin-left:5%;  padding: 4px 35px;\" type=\"password\" ID=\"pass_word\" name=\"pass_word\" value=\"" + pac + "\" placeholder=\"Enter your password\" required ><br><br>");
        Response.Write("<input type=\"checkbox\"  style=\"margin-left:33%\" name=\"remberme\" ID=\"remberme\"> Remamber me <br><br>"); 
    }



               
               %>
      <input class="subbtn" id="subb" type="submit" runat="server" value="Login">
                 <br><br> <a style="margin-left:7%" href="forgetpassword.aspx">Forget Password</a>
               <a style="margin-left:15%"> not register ?  </a><span><a
                            href="registration.aspx">  Register</a></span></div>
            
    <%
        // Session["email"] = Request["email"];
        //Session["pass"] = Request["pass"];

         bool HasSqlInjection(string input)
{
    // Define a list of SQL keywords and operators to check for
    string[] sqlKeywords = { "SELECT", "UPDATE", "DELETE", "INSERT", "INTO", "VALUES", "FROM", "WHERE", "OR", "AND", "NOT", "LIKE", "BETWEEN", "UNION", "JOIN", "ON", "ORDER BY", "GROUP BY", "HAVING", "LIMIT", "OFFSET", "UNION ALL", "DROP", "CREATE", "ALTER", "TRUNCATE", "TABLE", "INDEX", "CONSTRAINT", "PRIMARY KEY", "FOREIGN KEY", "CHECK", "DEFAULT", "CASCADE", "REFERENCES", "SET", "AS", "CASE", "WHEN", "THEN", "ELSE", "END", "COUNT", "SUM", "MAX", "MIN", "AVG", "DISTINCT", "TOP" };
    string[] sqlOperators = { "=", "<>", ">", "<", ">=", "<=", "LIKE", "IN", "IS", "NOT" };
    string[] sqlComments = { "--", "/", "/", ";" };

    // Check for SQL keywords, operators, and comments in the input string
    foreach (string keyword in sqlKeywords)
    {
        if (input.IndexOf(keyword, StringComparison.OrdinalIgnoreCase) >= 0)
        {
            return true;
        }
    }
    foreach (string op in sqlOperators)
    {
        if (input.Contains(op))
        {
            return true;
        }
    }
    foreach (string comment in sqlComments)
    {
        if (input.Contains(comment))
        {
            return true;
        }
    }

    return false;
}
       
        String remme = Request["remberme"];
        String emailtbx = Request["email_id"];
        // Session["mailtb"]=Request["email"];
        //Session["passtb"]=Request[""];
        String passtbx = Request["pass_word"];

        if (Request["remberme"] != null)
        {
            HttpCookie cookie = new HttpCookie("email");
            HttpCookie cookie1 = new HttpCookie("pass");
            cookie.Value = emailtbx;
            cookie1.Value = passtbx;
            cookie.Expires = DateTime.Now.AddMinutes(300);
            cookie1.Expires = DateTime.Now.AddMinutes(300);
            Response.Cookies.Add(cookie);
            Response.Cookies.Add(cookie1);
        }


        if (Request["subb"] != null)
        {

            try
            {
                MySqlConnection connection = new MySqlConnection("server=127.0.0.1;uid=root;pwd=root;database=agro");
                connection.Open();

                String logq = "select id,utype,pass,email from register where email='"+emailtbx+"'";
                MySqlCommand cmd = new MySqlCommand(logq, connection);
                MySqlDataReader reader = cmd.ExecuteReader();

                string pass = "";
                string emailr = "";
                string utype = "";
                String uid = "";
                while (reader.Read())
                {
                    utype += reader["utype"].ToString();
                    emailr += reader["email"].ToString();
                    pass += reader["pass"].ToString();
                    uid += reader["id"].ToString();
                }

                //  Response.Write("DB "+pass);

                    string GeneratePasswordHash(string password)
                                {
                                    using (SHA256 sha256 = SHA256.Create())
                                    {
                                        // Convert the password string to a byte array.
                                        byte[] passwordBytes = Encoding.UTF8.GetBytes(password);

                                        // Generate the hash value from the password byte array.
                                        byte[] hashBytes = sha256.ComputeHash(passwordBytes);

                                        // Convert the hash byte array to a string.
                                        string hash = BitConverter.ToString(hashBytes).Replace("-", "");

                                        return hash;
                                    }
                                }


                if ((emailtbx) == emailr && GeneratePasswordHash(passtbx) == pass || passtbx == pass)
                {
                    Session["email"] = emailtbx;
                    Session["user"] = utype;
                    Session["userid"] = uid;

                    if (utype == "Customer")
                    {
                        Response.Redirect("index.aspx");
                    }

                    else if (utype == "admin")
                    {
                        Response.Redirect("~/admin/index.aspx");
                    }
                     else if (utype == "Delivery Person")
                    {
                        Response.Redirect("deliverypage.aspx");
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password')</script>");
                }

                connection.Close();
            }

            catch (Exception error) { Response.Write(error);
            }

        }


    %>
        
    </form>
</body>

</html>


