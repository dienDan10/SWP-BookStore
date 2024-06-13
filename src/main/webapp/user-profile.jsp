<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Tài khoản</title>
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
        .btn_5 {
            border: 1px solid #B08EAD;
            margin-left: 12px;
            background-color: transparent;
            color: #B08EAD;
            border-radius: 2px;
            transition: 0.2s linear;
        }

        .btn_5:hover {
            background-color: #B08EAD;
            color: #fff;
        }

        .table {
            font-size: 15px;
        }

        @media screen and (max-width: 759px) {
            .table {
                width: 100% !important;
                font-size: 14px;
            }

        }
    </style>
</head>

<body>
<!--::header part start::-->
<%@ include file="components/header.jsp"%>
<!-- Header part end-->


<!--================login_part Area =================-->
<section class="login_part my-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-10 col-md-12 mx-auto">
                <div class="login_part_form mx-auto" style="display: block; height: auto">
                    <div class="login_part_form_iner d-flex flex-column flex-md-row align-items-center align-items-md-center justify-content-around" >
                        <div class="d-flex flex-column align-items-center mb-5">
                            <div class="rounded-circle overflow-hidden mb-5"
                                 style="width: 150px; height: 150px;">
                                <img src="${user.imageURL}"
                                     class="w-100 h-100" style="object-position: center; object-fit: cover"
                                     alt="">
                            </div>
                            <button class="btn_3" data-toggle="modal" data-target="#change-user-info">Chỉnh sửa</button>
                        </div>
                       <table class="table w-50">
                           <tbody>
                                <tr>
                                    <td>Họ và Tên: </td>

                                    <td>${user.name}</td>
                                </tr>
                                <tr>
                                    <td>Username: </td>

                                    <td>${user.username}</td>
                                </tr>
                                <tr>
                                    <td>Email: </td>

                                    <td>${user.email}</td>
                                </tr>
                                <tr>
                                    <td>Số điện thoại: </td>

                                    <td>${user.phoneNumber}</td>
                                </tr>
                                <tr>
                                    <td>Giới tính: </td>

                                    <td>${user.gender ? "Nam" : "Nữ"}</td>
                                </tr>
                                <tr>
                                    <td>Ngày sinh: </td>

                                    <td>${user.birthDate}</td>
                                </tr>
                                <tr>
                                    <td>Password: </td>

                                    <td>**********
                                        <span>
                                            <button class="btn_5" data-toggle="modal" data-target="#change-password-modal">Thay đổi</button>
                                        </span>
                                    </td>
                                </tr>
                           </tbody>
                       </table>
                    </div>

                    <!-- ========== CHANGE USER INFO MODAL ================ -->
                    <div class="modal fade" id="change-user-info" tabindex="-1" aria-labelledby="change-address-modal" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content rounded-0">
                                <div class="modal-header">
                                    <h5 class="modal-title">Thêm địa chỉ mới</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action="/update-profile" method="POST" class="update-user-profile-form" enctype="multipart/form-data">
                                    <div class="modal-body">

                                        <table class="w-100">
                                            <tbody>
                                            <tr class="mb-3">
                                                <td><p>Họ và Tên:</p></td>
                                                <td><input type="text" class="form-control" name="name" value="${user.name}" required></td>
                                            </tr>
                                            <tr class="mb-3">
                                                <td><p>Username:</p></td>
                                                <td><input type="text" class="form-control" name="username" value="${user.username}"></td>
                                            </tr>
                                            <tr class="mb-3">
                                                <td><p>Số điện thoại: </p></td>
                                                <td><input type="number" class="form-control" name="phone" value="${user.phoneNumber}" onkeydown="if(event.key==='.'){event.preventDefault();}"></td>
                                            </tr>
                                            <tr class="mb-3">
                                                <td><p>Ngày sinh: </p></td>
                                                <td>
                                                    <input type="date" class="form-control" name="birth" value="${user.birthDate}" id="user-birth-date">
                                                    <div id="error-message" class="font-italic text-danger" style="font-size: 12px; display: none"> Cannot Be In The Future.</div>
                                                </td>
                                            </tr>

                                            <tr class="" style="height: 60px">
                                                <td><p>Ảnh đại diện: </p></td>
                                                <td>
                                                    <div class="input-group">
                                                        <div class="custom-file" id="customFile">
                                                            <input type="file" class="custom-file-input" id="inputFile" name="user-picture" >
                                                            <label class="custom-file-label" for="inputFile">Choose file</label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><p>Giới tính: </p></td>
                                                <td>
                                                    <div class="d-flex flex-row justify-content-start">
                                                        <div class="form-check d-flex align-items-center mr-5">
                                                            <input class="form-check-input" type="radio" name="gender" id="male" value="1" ${user.gender ? "checked" : ""}>
                                                            <label class="form-check-label" for="male">
                                                                <p>Nam</p>
                                                            </label>
                                                        </div>
                                                        <div class="form-check d-flex align-items-center">
                                                            <input class="form-check-input" type="radio" name="gender" id="female" value="0" ${user.gender ? "" : "checked"}>
                                                            <label class="form-check-label" for="female">
                                                                <p>Nữ</p>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn_1">Lưu</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- ========== CHANGE USER INFO MODAL END HERE================ -->
                </div>
            </div>

        </div>
    </div>
</section>

<!--================login_part end =================-->

<!--============== MODAL FOR CHANGE PASSWORD ========================-->
<div class="modal fade" id="change-password-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Đổi mật khẩu</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/change-password" method="POST">
                <div class="modal-body">
                    <table class="w-100">
                        <tbody>
                        <tr style="height: 50px">
                            <td><p>Mật khẩu cũ:</p></td>
                            <td><input type="password" class="form-control old-password" name="old-password" min="1" required></td>
                        </tr>
                        <tr style="height: 50px">
                            <td><p>Mật khẩu mới:</p></td>
                            <td>
                                <input type="password" class="form-control new-password" name="new-password" required>
                                <p class="text-danger font-italic new-password-msg" style="font-size: 14px"></p>
                            </td>
                        </tr>
                        <tr style="height: 50px">
                            <td><p>Nhập lại: </p></td>
                            <td>
                                <input type="password" class="form-control re-new-password" name="re-new-password" required>
                                <p class="text-danger font-italic re-password-msg" style="font-size: 14px"></p>
                            </td>
                        </tr>
                        <tr style="height: 50px">
                            <td></td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <input type="checkbox" id="f-option" class="see-password">
                                    <label for="f-option" class="mb-0 ml-3"> <p>See password</p></label>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <p style="font-size: 14px; font-style: italic">(Xin hãy dùng forget password nếu bạn đăng nhập bằng Google)</p>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn_3 btn-change-password" disabled>Lưu</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--============== MODAL FOR CHANGE PASSWORD END HERE ========================-->

<!--::footer_part start::-->
<%@ include file="components/footer.jsp"%>
<!--::footer_part end::-->
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

<script src="js/toast.js"></script>
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
    // validate date input
    document.querySelector(".update-user-profile-form").addEventListener("submit", function(event) {
        // Get the input date value
        const dateInput = document.getElementById("user-birth-date").value;
        const errorMessage = document.getElementById("error-message");

        // Convert the input date to a JavaScript Date object
        const inputDate = new Date(dateInput);

        // Get the current date and set the time to midnight to compare only dates
        const currentDate = new Date();
        currentDate.setHours(0, 0, 0, 0);

        // Check if the input date is in the future
        if (inputDate > currentDate) {
            // If it is, prevent form submission and show error message
            event.preventDefault();
            errorMessage.style.display = "inline";
        } else {
            // Otherwise, hide error message
            errorMessage.style.display = "none";
        }
    });
    $(document).ready(function () {
        $('#inputFile').on('change', function () {
            // Get the selected file name
            var fileName = $(this).val().split('\\').pop();
            // Update the label with the selected file name
            $(this).next('.custom-file-label').html(fileName);
        });
    });

    // see password function
    const btnSeePass = document.querySelector('.see-password');
    const oldPass = document.querySelector('.old-password');
    const newPass = document.querySelector('.new-password');
    const reNewPass = document.querySelector('.re-new-password');
    const rePassMsg = document.querySelector('.re-password-msg');
    const newPassMsg = document.querySelector('.new-password-msg');
    const btnChangePass = document.querySelector('.btn-change-password');

    btnSeePass.addEventListener('click', function() {
       if (btnSeePass.checked) {
           oldPass.setAttribute('type', 'text');
           newPass.setAttribute('type', 'text');
           reNewPass.setAttribute('type', 'text');
       }  else {
           oldPass.setAttribute('type', 'password');
           newPass.setAttribute('type', 'password');
           reNewPass.setAttribute('type', 'password');
       }
    });

    // validate change password input
    reNewPass.addEventListener('input', function () {
       const val1 = newPass.value;
       const val2 = reNewPass.value;
       if (val1 !== val2) {
            rePassMsg.textContent = "Mật khẩu không khớp";
            btnChangePass.disabled = true;
       } else {
           rePassMsg.textContent = "";
           btnChangePass.disabled = false;
       }
    });

    newPass.addEventListener('focus', function() {
        newPassMsg.textContent = "Mật khẩu cần ít nhất 8 ký tự, cả chữ và số";
    });
    newPass.addEventListener('blur', function() {
        newPassMsg.textContent = "";
    });

</script>

</body>

</html>