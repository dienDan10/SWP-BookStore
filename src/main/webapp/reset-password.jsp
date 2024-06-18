<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Reset Password</title>
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
                        <h3>Last Step! <br>
                            Enter your new password</h3>
                        <p class="mb-5">For your safety, please enter a password with
                            more than 8 characters.
                            <br />
                            Text and numbers included.</p>
                        <form class="row contact_form" action="${context}/reset-password" method="post" novalidate="novalidate">
                            <div class="col-md-12 form-group p_star mb-4">
                                <input type="password" class="form-control" id="password" name="password" value=""
                                       placeholder="Password">
                            </div>
                            <div class="col-md-12 form-group p_star mb-4">
                                <input type="password" class="form-control" id="re-password" name="" value=""
                                       placeholder="Re-enter Password">
                                <div class="msg text-danger font-italic"></div>
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="creat_account d-flex align-items-center mb-3">
                                    <input type="checkbox" id="f-option" name="selector">
                                    <label for="f-option">See password</label>
                                </div>
                                <button type="submit" value="submit" class="btn_3 btn-submit">
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
<script>
    // matching password
    const password = document.querySelector('#password');
    const rePassword = document.querySelector('#re-password');
    const msg = document.querySelector('.msg');
    const btn = document.querySelector('.btn-submit');
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

    // see password
    const seePassword = document.querySelector('#f-option');
    seePassword.onclick = function() {
        if (seePassword.checked) {
            password.setAttribute('type', 'text');
            rePassword.setAttribute('type', 'text');
        } else {
            password.setAttribute('type', 'password');
            rePassword.setAttribute('type', 'Password');
        }
    }
</script>

</body>

</html>