<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="agro.index" %>

<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>


<%
   
   if (Session["email"] != null && Session["utype"] != "Customer")
    {
      String emailss =Session["email"].ToString();
        String uid = Session["userid"].ToString();



%>

  

<!DOCTYPE html> 
<html>
<head runat="server">
  <!-- Basic -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>AGRO</title>

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
</head>

<body>
  <form method="post">
  <div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
          <a class="navbar-brand" href="index.php">
            <img src="imgA/black.png" alt="" /><span>
              AGRO
            </span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav  ">
                <li class="nav-item active">
                  <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                  <li class="nav-item">
                  <a class="nav-link" href="viewproducts.aspx">Products</a>
                </li>
                 
                  <!--
                       <li>
                    <lu class="dropdown">
                      <button onclick="myFunction()" class="dropbtn">PRODUCT</button>
                      <li id="myDropdown" class="dropdown-content">
                        <a href="#">SEED</a>
                        <a href="#">fertilizer</a>
                        <a href="#">Pesticide</a>
                        <a href="#">Equipments</a>
                      </li>
                    </lu>-->
                    
                    <script>
                        /* When the user clicks on the button, 
                        toggle between hiding and showing the dropdown content */
                        function myFunction() {
                            document.getElementById("myDropdown").classList.toggle("show");
                        }

                        // Close the dropdown if the user clicks outside of it
                        window.onclick = function (event) {
                            if (!event.target.matches('.dropbtn')) {
                                var dropdowns = document.getElementsByClassName("dropdown-content");
                                var i;
                                for (i = 0; i < dropdowns.length; i++) {
                                    var openDropdown = dropdowns[i];
                                    if (openDropdown.classList.contains('show')) {
                                        openDropdown.classList.remove('show');
                                    }
                                }
                            }
                        }
                    </script>
                 <!-- </li>-->
             
                <li class="nav-item">
                  <a class="nav-link" href="buyproduct.aspx">My Orders</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="profile.aspx">Profile</a>
                </li>
                <li class="nav-item">
                    <%

                        String total = "";
                        String countp = "";

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
           
             
        </p>

        <%

            }
            catch (Exception error)
            {
                Response.Write(error);
            }

                        %>
                  <a class="nav-link" style="padding-top:unset" href="addtocart.aspx"><% Response.Write(countp +" ");%>Cart</a>
                </li>
              </ul>
             <!-- <form class="form-inline my-2 my-lg-0 ml-0 ml-lg-4 mb-3 mb-lg-0">
                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
              </form>-->
            </div>
            <div class="quote_btn-container ml-0 ml-lg-4 d-flex justify-content-center" >
            <button class="text-uppercase custom_orange-btn mr-3" id="logout" runat="server" name="logout"> Logout </button>
                <%
                if (Request["logout"] != null)
                {
                        Response.Redirect("logout.aspx");
                }
                  

                    %>
            
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
    <!-- slider section -->
    <section class=" slider_section position-relative">
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="slider_item-box">
              <div class="slider_item-container">
                <div class="container">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="slider_item-detail">
                        <div>
                          <h1>
                            Welcome to <br />
                            Our AGRO Shop
                          </h1>
                          <p>
                            There are many variations of product.
                          </p>
                            <!--
                          <div class="d-flex">
                            <a href="" class="text-uppercase custom_orange-btn mr-3">
                              Shop Now
                            </a>
                            <a href="" class="text-uppercase custom_dark-btn">
                              Contact Us
                            </a>
                          </div>-->
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="slider_img-box">
                        <div>
                          <img src="imgA/blackagro.jpg" alt="" class="" />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="slider_item-box">
              <div class="slider_item-container">
                <div class="container">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="slider_item-detail">
                        <div>
                          <h1>
                            Welcome to <br />
                            Our AGRO Shop
                          </h1>
                          <p>
                            There are many variations of product.
                          </p>
                            <!--
                          <div class="d-flex">
                            <a href="" class="text-uppercase custom_orange-btn mr-3">
                              Shop Now
                            </a>
                            <a href="" class="text-uppercase custom_dark-btn">
                              Contact Us
                            </a>
                          </div>-->
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="slider_img-box">
                        <div>
                          <img src="imgA/plant.jpg" alt="" class="" />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="slider_item-box">
              <div class="slider_item-container">
                <div class="container">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="slider_item-detail">
                        <div>
                          <h1>
                            Welcome to <br />
                            Our AGRO Shop
                          </h1>
                          <p>
                            There are many variations of product.
                          </p>
                            <!--
                          <div class="d-flex">
                            <a href="" class="text-uppercase custom_orange-btn mr-3">
                              Shop Now
                            </a>
                            <a href="" class="text-uppercase custom_dark-btn">
                              Contact Us
                            </a>
                          </div>-->
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="slider_img-box">
                        <div>
                          <img src="imgA/agro.jpg" alt="" class="" />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="custom_carousel-control">
          <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </section>

    <!-- end slider section -->
  </div>

  <!-- service section -->

  <section class="service_section layout_padding ">
    <div class="container">
      <h2 class="custom_heading">Our Services</h2>
      <p class="custom_heading-text">
        ------------------
      </p>
      <div class=" layout_padding2">
        <div class="card-deck">
          <div class="card">
            <img class="card-img-top" src="imgA/seedpack.png" alt="Card image cap" />
            <div class="card-body">
              <h5 class="card-title">SEEDS</h5>
              <p class="card-text">
                There are many variations of seeds.
              </p>
            </div>
          </div>
          <div class="card">
            <img class="card-img-top" src="imgA/euip2.png" alt="Card image cap" />
            <div class="card-body">
              <h5 class="card-title">Equipments </h5>
              <p class="card-text">
                Equipments
              </p>
            </div>
          </div>
          <div class="card">
            <img class="card-img-top" src="imgA/pesti2.png" alt="Card image cap" />
            <div class="card-body">
              <h5 class="card-title">SEED</h5>
              <p class="card-text">
                Pesticide
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="d-flex justify-content-center">
        <a href="" class="custom_dark-btn">
          Read More
        </a>
      </div>
    </div>
  </section>

  <!-- end service section -->

  <!-- fruits section -->

      <!--
  <section class="fruit_section">
    <div class="container">
      <h2 class="custom_heading">PRODUCT</h2>
      <p class="custom_heading-text">
        There are many variations of passages of Lorem Ipsum available, but
        the majority have
      </p>
      <div class="row layout_padding2">
        <div class="col-md-8">
          <div class="fruit_detail-box">
            <h3>
              Best SEED
            </h3>
            <p class="mt-4 mb-5">
             BEST SEEDS
            </p>
           <!-- <div>
              <a href="" class="custom_dark-btn">
                Buy Now
              </a>-->
              <!-- 
            </div>
          </div>
        </div>
        <div class="col-md-4 d-flex justify-content-center align-items-center">
          <div class="fruit_img-box d-flex justify-content-center align-items-center">
            <img src="imgA/seedpack.png" alt="" class="" width="250px" />
          </div>
        </div>
      </div>
      <div class="row layout_padding2">
        <div class="col-md-8">
          <div class="fruit_detail-box">
            <h3>
              Machines
            </h3>
            <p class="mt-4 mb-5">
             Muchines for rent.
            </p>
           <!--  <div>
              <a href="" class="custom_dark-btn">
                Buy Now
              </a>
            </div>-->
      <!-- 
          </div>
        </div>
        <div class="col-md-4 d-flex justify-content-center align-items-center">
          <div class="fruit_img-box d-flex justify-content-center ">
            <img src="imgA/tractor.png" alt="" class="" width="100px" />
          </div>
        </div>
      </div>
      <div class="row layout_padding2-top layout_padding-bottom">
        <div class="col-md-8">
          <div class="fruit_detail-box">
            <h3>
              Best Organic furtilizer
            </h3>
            <p class="mt-4 mb-5">
            Organic furtilizer
            </p>
           <!--  <div>
              <a href="" class="custom_dark-btn">
                Buy Now
              </a>
            </div>-->
      <!-- 
          </div>
        </div>
        <div class="col-md-4 d-flex justify-content-center align-items-center">
          <div class="fruit_img-box d-flex justify-content-center align-items-center">
            <img src="imgA/furtilizer.png" alt="" class="" width="250px" />
          </div>
        </div>
      </div>
    </div>
  </section>-->

  <!-- end fruits section -->

  <!-- tasty section -->
  <section class="tasty_section">
    <div class="container_fluid">
      <h2>
        AGRO
      </h2>
    </div>
  </section>
            
  <!-- end tasty section -->

  <!-- client section -->

  <section class="client_section layout_padding">
    <div class="container">
      <h2 class="custom_heading">Testimonial</h2>
      <p class="custom_heading-text">
        ============================================
      </p>
      <div>
        <div id="carouselExampleControls-2" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="client_container layout_padding2">
                <div class="client_img-box">
                  <img src="imgA/agro.jpg" alt="" />
                </div>
                <div class="client_detail">
                  <h3>
                    AGRO
                  </h3>
                  <p class="custom_heading-text">
                   ++++++++++++++++++++++++++++++++++++
                   <br/>
                   ====================================
                  </p>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="client_container layout_padding2">
                <div class="client_img-box">
                  <img src="imgA/agro.jpg" alt="" />
                </div>
                <div class="client_detail">
                  <h3>
                    AGRO
                  </h3>
                  <p class="custom_heading-text">
                   =================================
                  </p>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="client_container layout_padding2">
                <div class="client_img-box">
                  <img src="imgA/bluetrctor.jpg" alt="" />
                </div>
                <div class="client_detail">
                  <h3>
                    AGRO
                  </h3>
                  <p class="custom_heading-text">
                   +++++++++++++++++++++++++++++++++++++
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="custom_carousel-control">
            <a class="carousel-control-prev" href="#carouselExampleControls-2" role="button" data-slide="prev">
              <span class="" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls-2" role="button" data-slide="next">
              <span class="" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

        </div>
      </div>
    </div>
  </section>

  <!-- end client section -->

  <!-- contact section -->
      <!-- 
  <section class="contact_section layout_padding">
    <div class="container">
      <h2 class="font-weight-bold">
        Contact Us
      </h2>
      <div class="row">
        <div class="col-md-8 mr-auto">
          <form action="">
            <div class="contact_form-container">
              <div>
                <div>
                  <input type="text" placeholder="Name">
                </div>
                <div>
                  <input type="text" placeholder="Phone Number">
                </div>
                <div>
                  <input type="email" placeholder="Email">
                </div>

                <div class="mt-5">
                  <input type="text" placeholder="Message">
                </div>
                <div class="mt-5">
                  <button type="submit">
                    send
                  </button>
                </div>
              </div>

            </div>

          </form>
        </div>
      </div>
    </div>
  </section> -->
  <!-- end contact section -->


  <!-- map section 
  <section class="map_section">
    <div id="map" class="h-100 w-100 ">
    </div>
  </section>

   end map section -->

  <section class="info_section layout_padding">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <h5>
            product
          </h5>
          <ul>
            <li>
              Seed
            </li>
            <li>
              pesticide
            </li>
            <li>
              furtilizer
            </li>
            <li>
              machine
            </li>
            <li>
              Equipments
            </li>
            <li>
              PH meter
            </li>
            <li>
             -------
            </li>
            <li>
              =======
            </li>
          </ul>
        </div>
        <div class="col-md-3">
          <h5>
            product
          </h5>
          <ul>
            <li>
              Seed
            </li>
            <li>
              pesticide
            </li>
            <li>
              furtilizer
            </li>
            <li>
              machine
            </li>
            <li>
              Equipments
            </li>
            <li>
              PH meter
            </li>
            <li>
             -------
            </li>
            <li>
              =======
            </li>
          </ul>
        </div>
        <div class="col-md-3">
          <h5>
            product
          </h5>
          <ul>
            <li>
              Seed
            </li>
            <li>
              pesticide
            </li>
            <li>
              furtilizer
            </li>
            <li>
              machine
            </li>
            <li>
              Equipments
            </li>
            <li>
              PH meter
            </li>
            <li>
             -------
            </li>
            <li>
              =======
            </li>
          </ul>
        </div>
        <div class="col-md-3">
          <div class="social_container">
            <h5>
              Follow Us
            </h5>
            <div class="social-box">
              <a href="">
                <img src="images/fb.png" alt="">
              </a>

              <a href="">
                <img src="images/twitter.png" alt="">
              </a>
              <a href="">
                <img src="images/linkedin.png" alt="">
              </a>
              <a href="">
                <img src="images/instagram.png" alt="">
              </a>
            </div>
          </div>
       <!--    <div class="subscribe_container">
            <h5>
              Subscribe Now
            </h5>
            <div class="form_container">
              <form action="">
                <input type="email">
                <button type="submit">
                  Subscribe
                </button>-->
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>



  <!-- footer section -->
  <section class="container-fluid footer_section">
    <p>
      Copyright &copy;  All Rights Reserved By VIVEK & SHIVAM
     <!-- <a href="https:/.php.design/">Free.php Templates</a> -->
    </p>
  </section>
  <!-- footer section -->

  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
<!--
  <script>
    // This example adds a marker to indicate the position of Bondi Beach in Sydney,
    // Australia.
    function initMap() {
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 11,
        center: {
          lat: 40.645037,
          lng: -73.880224
        },
      });

      var image = 'images/maps-and-flags.png';
      var beachMarker = new google.maps.Marker({
        position: {
          lat: 40.645037,
          lng: -73.880224
        },
        map: map,
        icon: image
      });
    }
  </script>
   google map js -->
  </form>
 
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8eaHt9Dh5H57Zh0xVTqxVdBFCvFMqFjQ&callback=initMap">
  </script>
  <!-- end google map js -->
  
  
</body>

    <%
          
         }
                else
                {
                    Response.Redirect("login.aspx");
                }

        %>

 

</html>