<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
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
<!--    Font awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <style>
        .btn-google-login {
            color: #B08EAD !important;
        }
        .btn-google-login:hover {
            color: #fff !important;
            cursor: pointer;
        }
    </style>
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
                    <h2>login</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!--================login_part Area =================-->
<section class="login_part section_padding ">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6">
                <div class="login_part_text text-center">
                    <div class="login_part_text_iner">
                        <h2>Khách hàng mới?</h2>
                        <p>Đọc sách mỗi ngày giúp bạn tiến gần hơn tới thành công và ước mơ,
                            vậy nên sao không bắt đầu từ hôm nay.</p>
                        <a href="/register" class="btn_3">Create an Account</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="login_part_form">
                    <div class="login_part_form_iner">
                        <h3>Chào bạn trở lại ! <br>
                            Đăng nhập ngay</h3>
                        <form class="row contact_form" action="/login" method="post" novalidate="novalidate">

                            <c:if test="${not empty loginError}">
                                <div class="alert alert-danger alert-dismissible fade show col-md-12" role="alert">
                                    <strong>Error!</strong> ${loginError}.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:if>
                            <c:if test="${not empty emailError}">
                                <div class="alert alert-danger alert-dismissible fade show col-md-12" role="alert">
                                    <strong>Error!</strong> ${emailError}.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:if>
                            <c:if test="${not empty emailSuccess}">
                                <div class="alert alert-success alert-dismissible fade show col-md-12" role="alert">
                                    <strong>Success!</strong> ${emailSuccess}.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:if>
                            <c:if test="${not empty successMsg}">
                                <div class="alert alert-success alert-dismissible fade show col-md-12" role="alert">
                                    <strong>Success!</strong> ${successMsg}.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <c:remove var="successMsg" scope="session"></c:remove>
                            </c:if>

                            <div class="col-md-12 form-group p_star mb-4">
                                <input type="email" class="form-control" id="email" name="email" value=""
                                       placeholder="Email">
                            </div>
                            <div class="col-md-12 form-group p_star mb-4">
                                <input type="password" class="form-control" id="password" name="password" value=""
                                       placeholder="Password">
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="creat_account d-flex align-items-center justify-content-between">
                                    <div class="d-flex align-items-center">
                                        <input type="checkbox" id="f-option" name="selector">
                                        <label for="f-option">See password</label>
                                    </div>

                                    <a class="lost_pass" href="#" data-toggle="modal" data-target="#exampleModal">forget password?</a>
                                </div>

                                <button type="submit" value="submit" class="btn_3">
                                    log in
                                </button>

                                <p class="text-center">or</p>

                                <a class="btn_3 btn-google-login" style="margin-top: 15px;" href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/google-login&response_type=code&client_id=1076562173012-o60tjmrvu1e503kk1t1ent1411po522p.apps.googleusercontent.com&approval_prompt=force">
                                    <div class="d-flex gap-3 align-items-center justify-content-center">
                                        <i class="fa-brands fa-google" style="font-size: 20px; margin-right: 20px"></i>
                                        Login with google
                                    </div>
                                </a>
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
<footer class="footer_part">
    <div class="footer_iner section_bg">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-lg-8">
                    <div class="footer_menu">
                        <div class="footer_logo">
                            <a href="index.jsp"><img src="img/logo.png" alt="#"></a>
                        </div>
                        <div class="footer_menu_item">
                            <a href="index.jsp">Home</a>
                            <a href="about.html">About</a>
                            <a href="product_list.html">Products</a>
                            <a href="#">Pages</a>
                            <a href="blog.html">Blog</a>
                            <a href="contact.html">Contact</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="social_icon">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="copyright_part">
        <div class="container">
            <div class="row ">
                <div class="col-lg-12">
                    <div class="copyright_text">
                        <P><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></P>
                        <div class="copyright_link">
                            <a href="#">Turms & Conditions</a>
                            <a href="#">FAQ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--::footer_part end::-->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h2 class="modal-title fs-5" id="exampleModalLabel">Forget password</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="p-3">
                <p class="fs-6 mb-3">
                    We will send an email with a link to reset your password.
                    <br />
                    Please enter your email to reset password:
                </p>
                <form action="/forgot-password" class="form" method="POST">
                    <div class="form-group mb-3">
                        <input type="email" class="form-control" name="email">
                    </div>
                    <button class="btn_1">Send</button>
                </form>
            </div>
        </div>
    </div>
</div>

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
<script src="js/contact.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<!-- custom js -->
<script src="js/custom.js"></script>

<script>
       const password = document.querySelector('#password');
       const seePassword = document.querySelector('#f-option');
        // implement see password
       seePassword.onclick = function() {
           if (seePassword.checked) {
               password.setAttribute('type', 'text');
           } else {
               password.setAttribute('type', 'password');
           }
       }

</script>

</body>

</html>