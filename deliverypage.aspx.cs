using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace agro
{
    public partial class deliverypage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind data to the dropdown component
                BindDropdownData();
            }
        }

        private void BindDropdownData()
        {
            // Connection string to connect to MySQL database
            string connectionString = "Server=localhost;Database=agro;Uid=root;Pwd=root;";

            // Create MySqlConnection object
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                // Open the database connection
                connection.Open();

                // Create SQL query to retrieve data from the database
                string query = "select * from orderstage";

                // Create MySqlCommand object
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    // Execute the SQL query
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        // Bind data to the dropdown component
                        deliverystage.DataSource = reader;
                        deliverystage.DataTextField = "orderstage";
                        deliverystage.DataValueField = "osid";
                        deliverystage.DataBind();
                    }
                }
            }

            // Add a default item to the dropdown list
            deliverystage.Items.Insert(0, new ListItem("Select an item", "0"));
        }

    }
}