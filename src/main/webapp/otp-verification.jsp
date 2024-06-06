<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Verification</title>
    <link rel="icon" href="img/favicon.jpeg">
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
    <!--    Font awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
</head>

<body>
<!--::header part start::-->
<%@ include file="components/header.jsp"%>
<!-- Header part end-->


<!--================login_part Area =================-->
<section class="login_part">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 mx-auto">
                <div class="login_part_form">
                    <div class="login_part_form_iner">
                        <h3 style="margin-bottom: 20px">Last Step! <br>
                            Verify yourself</h3>
                        <p class="mb-5">An authentication code had been sent to your email (${userdto.email}).
                            <br />
                            This code will expired soon.
                            <br />
                            Please enter the code in the form below to complete your registration.</p>
                        <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                            <div class="col-md-12 form-group p_star mb-4">
                                <input type="text" class="form-control ${not empty otpErr ? 'is-invalid' : ''}" id="code" name="otp" value=""
                                       placeholder="Your Code">
                                <c:if test="${not empty otpErr}">
                                    <div class="font-italic text-danger">${otpErr}</div>
                                </c:if>

                            </div>
                            <div class="col-md-12 form-group">

                                <button type="submit" value="submit" class="btn_3">
                                    Submit
                                </button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================login_part end =================-->

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
<script src="js/jquery.nice-select.min.js"></script>
<!-- slick js -->
<script src="js/slick.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/contact.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<!-- custom js -->
<script src="js/custom.js"></script>


</body>

</html>