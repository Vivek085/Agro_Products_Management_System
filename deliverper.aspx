<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deliverper.aspx.cs" Inherits="agro.deliverper" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html>
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
    </style>
</head>
<body>
    
    <div class="customer-details">
        <h1>Customer Details</h1>
        <p>Customer Name: John Doe</p>
        <p>Address: 1234 Elm Street, Apt 567</p>
        <p>Phone Number: (555) 123-4567</p>
    </div>

    <div class="product-info">
        <h1>Product Information</h1>
        <p>Product Name: Product A</p>
        <p>Payment Method: Cash on Delivery</p>
        <p>Price: $19.99</p>
    
        <h1>Delivery Stage</h1>
        <p>Current Stage: Out for Delivery</p>
        <form action="#" method="post" runat="server">
            <select name="deliveryStage" id="deliveryStage" runat="server">
                <option value="out_for_delivery">Out for Delivery</option>
                <option value="delivered">Delivered</option>
                <option value="returned">Returned</option>
            </select>
            <input type="submit" id="update" name="update" value="Update Delivery Stage" runat="server">
        </form>
    </div>
</body>
</html>
