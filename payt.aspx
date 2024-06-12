<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="timer.checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>


            <p id="am">
        <%String tot = Request["total"]; %> rzp_test_aRrCSbbCyMJPHJ   var amount = Document.getElementById('am');
            </p>
            
            var amount = "100";

            var options = {
                "key": "rzp_test_ndmZJJRYSsKF9e",
                "amount": amount,
                "currency": "INR",
                "name": "Acme Corp",
                "description": "Test Transaction",
                
                "image": "https://example.com/your_logo",
                "handler": function (response) {
                    window.location.href = "thankyou.aspx";
                },

                "theme": {
                    "color": "#3399cc"  
                }
            };

            var rzp1 = new Razorpay(options);

            rzp1.on('payment.failed', function (response) {
                alert("Payment failed. Please try again later.");
            });

            document.getElementById('Button1').onclick = function (e) {
                rzp1.open();
                e.preventDefault();
            };
        </script>
    </form>
</body>
</html>