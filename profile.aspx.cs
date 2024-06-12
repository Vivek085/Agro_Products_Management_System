using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace agro
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                filldata();
            }
        }

        void filldata()
        {
            String sessi = Session["email"].ToString(); ;
            string connectionString = "Server=localhost;Database=agro;Uid=root;Pwd=root;";

            // Create MySqlConnection object
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                // Open the database connection
                connection.Open();

                // Create SQL query to retrieve data from the database
                string query = "select * from regiter where email='" + sessi + "'";

                // Create MySqlCommand object
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            fname.Value = reader.GetString("user_name");

                        }
                    }


                }

            }
        }
    }
}