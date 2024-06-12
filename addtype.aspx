<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addtype.aspx.cs" Inherits="agro.admin.addtype" %>


<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail"%>


<%
   if (Session["email"] != null && Session["utype"] != "admin")
    {
      String emailss =Session["email"].ToString();

    %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="assets/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="assets/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="assets/css/bootstrap-datepicker.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="sidebar-light">
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="navbar-menu-wrapper d-flex align-items-stretch justify-content-between">
        <ul class="navbar-nav mr-lg-2 d-none d-lg-flex">
          <li class="nav-item nav-toggler-item">
            <button class="navbar-toggler align-self-center" type="button" data-toggle="minimize">
              <span class="mdi mdi-menu"></span>
            </button>
          </li>
          
        </ul>
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="index.html"><img src="assets/images/logo.png" alt="logo"/></a>
          <a class="navbar-brand brand-logo-mini" href="index.html"><img src="assets/images/logo.png" alt="logo"/></a>
        </div>
        <ul class="navbar-nav navbar-nav-right">
          
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <span class="nav-profile-name">Admin</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="../logout.aspx" >
                <i class="mdi mdi-logout text-primary"></i>
                Logout
              </a>
            </div>
          </li>
          
          <li class="nav-item nav-toggler-item-right d-lg-none">
            <button class="navbar-toggler align-self-center" type="button" data-toggle="offcanvas">
              <span class="mdi mdi-menu"></span>
            </button>
          </li>
        </ul>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="index.aspx">
              <i class="mdi mdi-view-quilt menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="addtype.aspx">
              <i class="mdi mdi-view-headline menu-icon"></i>
              <span class="menu-title">Category</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="form.aspx">
              <i class="mdi mdi-view-headline menu-icon"></i>
              <span class="menu-title">Product</span>
            </a>
          </li>
         <li class="nav-item">
            <a class="nav-link" href="customer.aspx">
              <i class="mdi mdi-grid-large menu-icon"></i>
              <span class="menu-title">Customer</span>
            </a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="customer.aspx">
              <i class="mdi mdi-grid-large menu-icon"></i>
              <span class="menu-title">Deliver Person</span>
            </a>
          </li>
		  <li class="nav-item">
            <a class="nav-link" href="showprod.aspx">
              <i class="mdi mdi-airplay menu-icon"></i>
              <span class="menu-title">Product View</span>
            </a>
          </li>
          
        </ul>
      </nav>
      
      <!-- partial 
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">
		  	<h1 class="card-title ml10">Basic form elements</h1>
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <form class="forms-sample">
                    <div class="form-group">
                      <label for="exampleInputName1">Name</label>
                      <input type="text" class="form-control" id="exampleInputName1" placeholder="Name">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail3">Email address</label>
                      <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Email">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword4">Password</label>
                      <input type="password" class="form-control" id="exampleInputPassword4" placeholder="Password">
                    </div>
                    <div class="form-group">
                      <label for="exampleSelectGender">Gender</label>
                        <select class="form-control" id="exampleSelectGender">
                          <option>Male</option>
                          <option>Female</option>
                        </select>
                      </div>
                    <div class="form-group">
                      <label>File upload</label>
                      <input type="file" name="img[]" class="file-upload-default">
                      <div class="input-group col-xs-12">
                        <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                        <span class="input-group-append">
                          <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                        </span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">City</label>
                      <input type="text" class="form-control" id="exampleInputCity1" placeholder="Location">
                    </div>
                    <div class="form-group">
                      <label for="exampleTextarea1">Textarea</label>
                      <textarea class="form-control" id="exampleTextarea1" rows="4"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">Submit</button>
                    <button class="btn btn-light">Cancel</button>
                  </form>
                </div>
              </div>
            </div>
            
		 </div>
        
		</div>
        <!-- content-wrapper ends -->
      
        
<div class="container">

  <section>
  
  <form action="" method="post" class="add-product-form" runat="server" enctype="multipart/form-data">
     <h3>Add a new product Type</h3>
     <input type="text" id="catagory" name="catagory" placeholder="Enter the catagory of Product" runat="server" class="box" required>
     <input type="submit" value="add the product Type" id="add_type" name="add_type" class="btn">
  </form>


      <%
          if (Request["add_type"] != null) {
           
              try

              {
                  string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=agro";
                  MySqlConnection connection = new MySqlConnection(ConnectionString);

                  connection.Open();

                  String cat = Request["catagory"].ToString();
                  

                  //Response.Redirect("login.aspx");

                  string inpt = "insert into catagory (catagory) value('"+cat+"')";
                  // Response.Write(inp);
                  MySqlCommand comman = new MySqlCommand(inpt,connection);
                  comman.ExecuteNonQuery();


              }
              catch (Exception error)
              {
                  Response.Write(error);
              }
          }

          else
          {

          }
          /*protected void btnUpload_Click(object sender, EventArgs e)
{
    string fileName = fileUploadControl.FileName;
    string filePath = Server.MapPath("~/uploads/") + fileName;
    fileUploadControl.SaveAs(filePath);

    string connectionString = "Server=localhost;Database=myDatabase;Uid=myUsername;Pwd=myPassword;";
    MySqlConnection connection = new MySqlConnection(connectionString);
    MySqlCommand command = new MySqlCommand("INSERT INTO files (file_path) VALUES (@filePath)", connection);
    command.Parameters.AddWithValue("@filePath", filePath);

    try
    {
        connection.Open();
        command.ExecuteNonQuery();
    }
    catch (Exception ex)
    {
        // Handle the exception
    }
    finally
    {
        connection.Close();
    }
}
*/

          %>

</div>
  

        <!-- partial:../../partials/_footer.html -->
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright ©  . All rights reserved.</span>
          </div>
        </footer>
        <!-- partial -->
      </div>

      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="assets/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="assets/js/Chart.min.js"></script>
  <script src="assets/js/bootstrap-datepicker.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="assets/js/off-canvas.js"></script>
  <script src="assets/js/hoverable-collapse.js"></script>
  <script src="assets/js/template.js"></script>
  <script src="assets/js/settings.js"></script>
  <script src="assets/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="assets/js/dashboard.js"></script>
  <!-- End custom js for this page-->
</body>
     <%
          
         }
                else
                {
                    Response.Redirect("login.aspx");
                }

        %>
</html>

