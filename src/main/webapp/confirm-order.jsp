<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>pillloMart</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<!--::header part start::-->
<%@ include file="components/header.jsp"%>
<!-- Header part end-->

<!-- breadcrumb part start-->
<section class="breadcrumb_part">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb_iner">
                    <h2>confirmation</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!--================ confirmation part start =================-->
<section class="confirmation_part section_padding">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="confirmation_tittle">
                    <span>Thank you. Your order has been received.</span>
                </div>
            </div>
            <div class="col-lg-6 col-lx-4">
                <div class="single_confirmation_details">
                    <h4>order info</h4>
                    <ul>
                        <li>
                            <p>order number</p><span>: 60235</span>
                        </li>
                        <li>
                            <p>data</p><span>: Oct 03, 2017</span>
                        </li>
                        <li>
                            <p>total</p><span>: USD 2210</span>
                        </li>
                        <li>
                            <p>mayment methord</p><span>: Check payments</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6 col-lx-4">
                <div class="single_confirmation_details">
                    <h4>Billing Address</h4>
                    <ul>
                        <li>
                            <p>Street</p><span>: 56/8</span>
                        </li>
                        <li>
                            <p>city</p><span>: Los Angeles</span>
                        </li>
                        <li>
                            <p>country</p><span>: United States</span>
                        </li>
                        <li>
                            <p>postcode</p><span>: 36952</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6 col-lx-4">
                <div class="single_confirmation_details">
                    <h4>shipping Address</h4>
                    <ul>
                        <li>
                            <p>Street</p><span>: 56/8</span>
                        </li>
                        <li>
                            <p>city</p><span>: Los Angeles</span>
                        </li>
                        <li>
                            <p>country</p><span>: United States</span>
                        </li>
                        <li>
                            <p>postcode</p><span>: 36952</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="order_details_iner">
                    <h3>Order Details</h3>
                    <table class="table table-borderless">
                        <thead>
                        <tr>
                            <th scope="col" colspan="2">Product</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th colspan="2"><span>Pixelstore fresh Blackberry</span></th>
                            <th>x02</th>
                            <th> <span>$720.00</span></th>
                        </tr>
                        <tr>
                            <th colspan="2"><span>Pixelstore fresh Blackberry</span></th>
                            <th>x02</th>
                            <th> <span>$720.00</span></th>
                        </tr>
                        <tr>
                            <th colspan="2"><span>Pixelstore fresh Blackberry</span></th>
                            <th>x02</th>
                            <th> <span>$720.00</span></th>
                        </tr>
                        <tr>
                            <th colspan="3">Subtotal</th>
                            <th> <span>$2160.00</span></th>
                        </tr>
                        <tr>
                            <th colspan="3">shipping</th>
                            <th><span>flat rate: $50.00</span></th>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th scope="col" colspan="3">Quantity</th>
                            <th scope="col">Total</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================ confirmation part end =================-->

<!--::footer_part start::-->
<%@ include file="components/footer.jsp"%>
<!--::footer_part end::-->

<!-- jquery plugins here-->
<script src="js/jquery-1.12.1.min.js"></script>
<!-- popper js -->
<script src="js/popper.min.js"></script>
<!-- bootstrap js -->
<script src="js/bootstrap.min.js"></script>
<!-- easing js -->
<script src="js/jquery.magnific-popup.js"></script>
<!-- swiper js -->
<script src="js/swiper.min.js"></script>
<!-- swiper js -->
<script src="js/mixitup.min.js"></script>
<!-- particles js -->
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<!-- slick js -->
<script src="js/slick.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<!-- custom js -->
<script src="js/custom.js"></script>
</body>

</html>