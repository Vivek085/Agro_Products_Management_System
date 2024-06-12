<%@ Page Language="C#"%>

<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail"%>
<%@Import Namespace="System.Security.Cryptography" %>
<%
    MySqlConnection ConnectToDB()
    {
        try
        {
            string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=agro";
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            return connection;
        }
        catch (Exception error)
        {
            return null;
        }
    }
    void DeleteFromOTPTable(int OTPID)
    {
        try
        {
            MySqlConnection connection = ConnectToDB();
            connection.Open();
            string Query = "delete from tbl_otp_information where otpid = " + OTPID;
            MySqlCommand command = new MySqlCommand(Query, connection);
            command.ExecuteNonQuery();
            CloseConnection(ref connection);
        }
        catch (Exception error)
        {
        }
    }
    void CloseConnection(ref MySqlConnection connection)
    {
        try
        {
            if (connection != null)
                connection.Close();
        }
        catch (Exception error)
        { }
    }
    void ActivateAccount(int UserID)
    {
        try
        {
            MySqlConnection connection = ConnectToDB();
            connection.Open();
            string Query = "update tbl_user set is_enabled = 'y' where user_id = " + UserID + "";
            MySqlCommand command = new MySqlCommand(Query, connection);
            command.ExecuteNonQuery();
            CloseConnection(ref connection);
        }
        catch (Exception error)
        { }
    }
    if(Request["submit"] != null)
    {
        Response.Write("here");
        try
        {
            if (!string.IsNullOrEmpty(Request["otp"]) && !string.IsNullOrEmpty(Request["token"]))
            {
                int token = Convert.ToInt32(Request["token"]);
                int otp = Convert.ToInt32(Request["otp"]);
                MySqlConnection connection = ConnectToDB();

                if (connection != null)
                {
                    connection.Open();
                    long UserID = Convert.ToInt32(Session["User_ID_From_Registration"]);
                    string query = "select * from tbl_otp_information where OTPID = "+token+" and OTPNUMBER = "+otp+" and user_id = "+UserID+" and time > 0;";
                    MySqlCommand command = new MySqlCommand(query,connection);

                    MySqlDataReader result = command.ExecuteReader();
                    DataTable DT = new DataTable();
                    DT.Load(result);

                    int number_of_rows = DT.Rows.Count;
                    Response.Write(query);
                    Response.Write(number_of_rows);
                    if (true) {
                        if (number_of_rows == 0)
                            Response.Write("<script>if(confirm('OTP is not matched')) document.location = 'OTPValidations.aspx';else  document.location = 'OTPValidations.aspx';</script>");
                        else
                        {
                            //ActivateAccount((int)UserID);
                            //DeleteFromOTPTable(token);


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


                            string fname= Session["fname"].ToString();
                            string gender = Session["gender"].ToString();
                            string utype = Session["utype"].ToString();
                            string dob = Session["dob"].ToString();
                            string conno = Session["contactno"].ToString();
                            string add = Session["addr"].ToString();
                            string pswdss = Session["pword"].ToString();
                            string pswd = GeneratePasswordHash(pswdss);
                            string email = Session["email"].ToString();
                            string Query = "insert into register(user_name,gender,utype,dob,contact,email,pass,address) value('"+fname+"','"+gender+"','"+utype+"','"+dob+"','"+conno+"','"+email+"','"+pswd+"','"+add+"')";
                            Response.Write(Query);
                            MySqlCommand comman = new MySqlCommand(Query,connection);
                            comman.ExecuteNonQuery();
                            Response.Redirect("login.aspx");
                        }
                    }

                    connection.Close();
                }
                else
                    Response.Write("<script>if(confirm('not connected to server')) document.location = 'OTPValidations.aspx';else  document.location = 'OTPValidations.aspx';</script>");
            }
        }
        catch (Exception error)
        {
            Response.Write(error.Message);
        }

    }

%>



<!DOCTYPE html>

<html>
    <head>
        <title>Enter OTP </title>
    </head>

    <link rel="stylesheet" href="css/logfps.css">
</head>
<body>
    <form id="login" runat="server">
             <div class="center">
                 <h1>OTP verify</h1>
               <label style="margin-left:8%;" for="token">Token</labe> <input style="margin-left:18%;" type = "number" runat="server" id = "token" required><br><br>
                <lable style="margin-left:8%; for="otp">OTP</lable> <input style="margin-left:20.5%;" type = "number" runat="server" id = "otp" required><br></br>
                <input type = "submit" id ="submit" runat="server" value="Verification"><br><br>
            </form>
    </body>
</html>
