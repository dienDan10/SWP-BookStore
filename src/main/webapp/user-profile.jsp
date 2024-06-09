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
<section class="login_part my-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-10 col-md-12 mx-auto">
                <div class="login_part_form mx-auto" style="display: block; height: auto">
                    <div class="login_part_form_iner d-flex flex-column flex-sm-row align-items-center align-items-sm-start justify-content-around" >
                        <div class="d-flex flex-column align-items-center mb-5 mb-sm-0">
                            <div class="rounded-circle overflow-hidden mb-5"
                                 style="width: 150px; height: 150px;">
                                <img src="${user.imageURL}"
                                     class="w-100 h-100 object-fit-cover" style="object-position: center;"
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
</script>

</body>

</html>