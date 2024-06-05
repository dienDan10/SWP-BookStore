<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Address</title>
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
        .hover-pointer:hover {
            cursor: pointer;
        }
    </style>
</head>

<body>
<!--::header part start::-->
<%@ include file="components/header.jsp"%>
<!-- Header part end-->


<!--================Address part Area =================-->
<section class="login_part">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12 col-md-12 mx-auto">
                <div class="login_part_form w-100">
                    <h4 class="mb-3">Sổ địa chỉ</h4>
                    <div class="addresses" style="font-family: 'Inter', 'Helvetica Neue', sans-serif">
                        <div class="new mb-3">
                            <a href="#" class="d-inline-block w-100 py-3 d-flex justify-content-center align-items-center"
                               data-toggle="modal" data-target="#add-new-address-modal"
                               style="background-color: #f4edf278; color: #4B3049; font-size: 16px">
                                <i class="fa-solid fa-plus mr-3"></i>
                                <span>Thêm địa chỉ mới</span>
                            </a>
                        </div>
<%--======================= MODAL FOR ADD NEW ADDRESS ======================--%>
                        <div class="modal fade" id="add-new-address-modal" tabindex="-1" aria-labelledby="change-address-modal" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content rounded-0">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Thêm địa chỉ mới</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="" method="POST">
                                        <div class="modal-body">

                                            <table class="w-100">
                                                <tbody>
                                                <tr class="mb-3">
                                                    <td><p>Số điện thoại:</p></td>
                                                    <td><input type="text" class="form-control" name="receiver"></td>
                                                </tr>
                                                <tr class="mb-3">
                                                    <td><p>Người nhận:</p></td>
                                                    <td><input type="text" class="form-control" name="receiver"></td>
                                                </tr>
                                                <tr class="mb-3">
                                                    <td><p>Tỉnh/Thành phố: </p></td>
                                                    <td><input type="text" class="form-control" name="receiver"></td>
                                                </tr>
                                                <tr class="mb-3">
                                                    <td><p>Quận huyện: </p></td>
                                                    <td><input type="text" class="form-control" name="receiver"></td>
                                                </tr>
                                                <tr class="mb-3">
                                                    <td><p>Phường xã:</p></td>
                                                    <td><input type="text" class="form-control" name="receiver"></td>
                                                </tr>
                                                <tr class="mb-3">
                                                    <td><p>Thôn xóm:</p></td>
                                                    <td><input type="text" class="form-control" name="receiver"></td>
                                                </tr>
                                                <tr class="mb-3">
                                                    <td><p>Chi tiết:</p></td>
                                                    <td><input type="text" class="form-control" name="receiver"></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn_1">Lưu Địa Chỉ</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
<%--======================= MODAL FOR ADD NEW ADDRESS END HERE======================--%>
                        <c:choose>
                            <c:when test="${addresses.size() != 0}">
                                <c:forEach var="address" items="${addresses}">
                                    <div class="address p-3 d-flex flex-row mb-3" style="background-color: #f4edf278; color: #4B3049">
                                        <div class="info flex-fill">
                                            <div class="receiver-name">
                                                <span class="text-uppercase">${address.receiver}</span>
                                                <c:if test="${address.isDefault()}">
                                                    <span style="font-size: 14px" class="ml-4">
                                                        <i class="fa-regular fa-circle-check"></i>
                                                        Địa chỉ mặc định
                                                    </span>
                                                </c:if>
                                            </div>
                                            <div class="address">
                                                <span>Địa chỉ:</span>
                                                ${address.detail}, ${address.village}, ${address.town}, ${address.district}, ${address.province}
                                            </div>
                                            <div class="phone">
                                                <span>Điện thoại: </span>
                                                ${address.phone}
                                            </div>
                                        </div>
                                        <h5 class="align-self-center mr-2 mb-0 hover-pointer" data-toggle="modal" data-target="#change-address-${address.id}">Chỉnh sửa</h5>
                                        <c:if test="${!address.isDefault()}">
                                            <div style="color: #4B3049" class="align-self-center ml-2 mr-2 hover-pointer" address-id="${address.id}">
                                                <i class="fa-solid fa-trash-can"></i>
                                            </div>
                                        </c:if>
                                        <!--===================== MODAL FOR UPDATE ADDRESS ==================================-->
                                        <div class="modal fade" id="change-address-${address.id}" tabindex="-1" aria-labelledby="change-address-modal" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content rounded-0">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Chỉnh sửa địa chỉ</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <form action="" method="POST">
                                                        <div class="modal-body">

                                                            <table class="w-100">
                                                                <tbody>
                                                                <tr class="mb-3">
                                                                    <td><p>Số điện thoại:</p></td>
                                                                    <td><input type="text" class="form-control" name="phone" value="${address.phone}"></td>
                                                                </tr>
                                                                <tr class="mb-3">
                                                                    <td><p>Người nhận:</p></td>
                                                                    <td><input type="text" class="form-control" name="receiver" value="${address.receiver}"></td>
                                                                </tr>
                                                                <tr class="mb-3">
                                                                    <td><p>Tỉnh/Thành phố: </p></td>
                                                                    <td><input type="text" class="form-control" name="province" value="${address.province}"></td>
                                                                </tr>
                                                                <tr class="mb-3">
                                                                    <td><p>Quận huyện: </p></td>
                                                                    <td><input type="text" class="form-control" name="district" value="${address.district}"></td>
                                                                </tr>
                                                                <tr class="mb-3">
                                                                    <td><p>Phường xã:</p></td>
                                                                    <td><input type="text" class="form-control" name="town" value="${address.town}"></td>
                                                                </tr>
                                                                <tr class="mb-3">
                                                                    <td><p>Thôn xóm:</p></td>
                                                                    <td><input type="text" class="form-control" name="village" value="${address.village}"></td>
                                                                </tr>
                                                                <tr class="mb-3">
                                                                    <td><p>Chi tiết:</p></td>
                                                                    <td><input type="text" class="form-control" name="detail" value="${address.detail}"></td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                            <c:if test="${!address.isDefault()}">
                                                                <div class="mt-4">
                                                                    <input type="checkbox" value="true" id="setAsDefault-${address.id}" name="isDefault">
                                                                    <label for="setAsDefault-${address.id}" class="ml-3">
                                                                        <p>Đặt làm mặc định</p>
                                                                    </label>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn_1">Lưu Địa Chỉ</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <!--===================== MODAL FOR UPDATE ADDRESS END HERE==================================-->
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <h5>Bạn chưa có địa chỉ giao hàng nào</h5>
                            </c:otherwise>
                        </c:choose>
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