<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
                    <h2>Register</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!--================login_part Area =================-->
<section class="login_part section_padding ">
    <div class="container">
        <div class="row align-items-center justify-content-center">

            <div class="col-lg-6 col-md-6">
                <div class="login_part_form">
                    <div class="login_part_form_iner">
                        <h3>Khách Hàng Mới ? <br>
                            Đăng ký tại đây</h3>
                        <form class="row contact_form myform" action="/register" method="post" novalidate="novalidate">
                            <div class="col-md-12 form-group p_star mb-4">
                                <input type="text" class="form-control" id="name" name="name" value="${param.name}"
                                       placeholder="Name">
                            </div>
                            <div class="col-md-12 form-group p_star mb-4">
                                <input type="email" class="form-control ${not empty emailExist ? 'is-invalid' : ''}" id="email" name="email" value="${param.email}"
                                       placeholder="Email">
                                <c:if test="${not empty emailExist}">
                                    <div class="font-italic text-danger">${emailExist}</div>
                                </c:if>
                            </div>
                            <div class="col-md-12 form-group p_star mb-4">
                                <input type="password" class="form-control" id="password" name="password" value=""
                                       placeholder="Password">
                                <div class="font-italic text-danger password-constraint"></div>
                            </div>
                            <div class="col-md-12 form-group p_star mb-4">
                                <input type="password" class="form-control" id="re-password" name="re-password" value=""
                                       placeholder="Re-enter password">
                                <div class="text-danger font-italic msg"></div>
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="creat_account d-flex align-items-center mb-3">
                                        <input type="checkbox" id="f-option" name="selector">
                                        <label for="f-option">See password</label>
                                </div>
                                <div>
                                    <div class="g-recaptcha" data-sitekey="6LePUuwpAAAAANteno4UNkHQ-IWcK6KwiGLH3QAD"></div>
                                    <div class="fst-italic text-danger captcha-msg" ></div>
                                </div>
                                <button type="submit" value="submit" class="btn_3 btn-register" disabled>
                                    Register
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
    const rePassword = document.querySelector('#re-password');
    const seePassword = document.querySelector('#f-option');
    // implement see password
    seePassword.onclick = function() {
        if (seePassword.checked) {
            password.setAttribute('type', 'text');
            rePassword.setAttribute('type', 'text');
        } else {
            password.setAttribute('type', 'password');
            rePassword.setAttribute('type', 'Password');
        }
    }

    // implement matching password
    const msg = document.querySelector('.msg');
    const btn = document.querySelector('.btn-register');
    rePassword.addEventListener('input', () => {
        const val1 = password.value;
        const val2 = rePassword.value;
        if (val1 !== val2) {
            msg.textContent = "Your password doesn't match!";
            btn.disabled = true;
        } else {
            msg.textContent = "";
            btn.disabled = false;
        }
    });

    // implement cautions when create password
    const constraint = document.querySelector('.password-constraint');
    password.onfocus = function() {
        constraint.textContent = 'For your safety, password should contains at least 8 character, text and number included';
    };
    password.onblur = function() {
        constraint.textContent = '';
    };

    // implement captcha
    const form = document.querySelector('.myform');
    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const isValid = validateRecaptcha();
        if (isValid) {
            form.submit();
        } else {

        }
    })
    function validateRecaptcha() {
        const response = grecaptcha.getResponse();
        if (response.length === 0) {
            document.querySelector('.captcha-msg').textContent = "Please finish the captcha";
            return false;
        }
        return true;
    }

</script>

</body>

</html>