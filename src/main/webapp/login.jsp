<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Đăng nhập</title>
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
    <link rel="stylesheet" href="css/toast.css">
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
                    <h2>Đăng nhập</h2>
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
                        <a href="${context}/register" class="btn_3">Đăng ký</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="login_part_form">
                    <div class="login_part_form_iner">
                        <h3>Chào bạn trở lại ! <br>
                            Đăng nhập ngay</h3>
                        <form class="row contact_form" action="${context}/login" method="post" novalidate="novalidate">
                            <c:if test="${not empty emailError}">
                                <div class="alert alert-danger alert-dismissible fade show col-md-12" role="alert">
                                    <strong>Error!</strong> ${emailError}.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:if>
                            <div class="col-md-12 form-group p_star mb-4">
                                <input type="email" class="form-control" id="email" name="email" value="${param.email}"
                                       placeholder="Email" required>
                            </div>
                            <div class="col-md-12 form-group p_star mb-4">
                                <input type="password" class="form-control" id="password" name="password" value=""
                                       placeholder="Password" required>
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="creat_account d-flex align-items-center justify-content-between">
                                    <div class="d-flex align-items-center">
                                        <input type="checkbox" id="f-option" name="selector">
                                        <label for="f-option">Hiện mật khẩu</label>
                                    </div>

                                    <a class="lost_pass" href="#" data-toggle="modal" data-target="#exampleModal">Quên mật khẩu?</a>
                                </div>

                                <button type="submit" value="submit" class="btn_3">
                                    Đăng nhập
                                </button>

                                <p class="text-center" style="font-size: 12px">hoặc</p>

                                <a class="btn_3 btn-google-login" style="margin-top: 15px;" href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080${context}/google-login&response_type=code&client_id=1076562173012-o60tjmrvu1e503kk1t1ent1411po522p.apps.googleusercontent.com&approval_prompt=force">
                                    <div class="d-flex gap-3 align-items-center justify-content-center">
                                        <i class="fa-brands fa-google" style="font-size: 20px; margin-right: 20px"></i>
                                        Đăng nhập với Google
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
<%@ include file="components/footer.jsp"%>
<!--::footer_part end::-->

<!-- Modal forget password -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h2 class="modal-title fs-5" id="exampleModalLabel">Quên mật khẩu</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="p-3">
                <p class="fs-6 mb-3">
                    Chúng tôi sẽ gửi link reset mật khẩu về email của bạn.
                    <br />
                    Làm ơn hãy điền email để được xác minh:
                </p>
                <form action="/forgot-password" class="form" method="POST">
                    <div class="form-group mb-3">
                        <input type="email" class="form-control" name="email">
                    </div>
                    <button class="btn_1 text-uppercase" style="font-family: 'Inter', Arial, Helvetica, sans-serif">Gửi</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!--Toast box here-->
<c:if test="${not empty successMsg}">
    <div class="hidden" id="msg" type="success">${successMsg}</div>
    <c:remove var="successMsg" scope="session"></c:remove>
</c:if>
<c:if test="${not empty errMsg}">
    <div class="hidden" id="msg" type="error">${errMsg}</div>
    <c:remove var="errMsg" scope="session"></c:remove>
</c:if>
<c:if test="${not empty invalidMsg}">
    <div class="hidden" id="msg" type="invalid">${invalidMsg}</div>
    <c:remove var="invalidMsg" scope="session"></c:remove>
</c:if>
<div id="toastBox"></div>
<!--Toast box end here-->

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

<script src="js/toast.js"></script>

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