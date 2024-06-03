<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Cart</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- icon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- magnific popup CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Font awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
    <style>

        /* Keyframes for the vibration animation */
        @keyframes vibrate {
            0% { transform: translateX(0); }
            25% { transform: translateX(-2px); }
            50% { transform: translateX(2px); }
            75% { transform: translateX(-2px); }
            100% { transform: translateX(0); }
        }

        /* Apply the animation on hover */
        .fa-trash-can:hover {
            animation: vibrate 0.5s linear 2; /* Animation lasts 1 second with 2 iterations */
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
                    <h2>cart list</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!--================Cart Area =================-->
<section class="cart_area section_padding">
    <div class="container">
        <div class="cart_inner">
            <div class="table-responsive">
                <form action="#" method="POST">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Product</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody class="table-body">
                        <c:forEach var="item" items="${carts}">
                            <tr>
                                <td class="d-flex align-items-center">
                                    <div class="d-flex align-items-center mr-2">
                                        <input class="form-check-input" style="width: 16px; height: 16px" type="checkbox" name="id" value="${item.id}">
                                    </div>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="${item.book.imageFront}" alt="" />
                                        </div>
                                        <div class="media-body">
                                            <p>${item.book.name}</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5 class="item-price">
                                        <fmt:formatNumber type = "number" minFractionDigits = "3" value = "${item.book.price}" />đ
                                    </h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <a class="input-number-decrement btn-update" style="color: #212529" href="#?" action="minus" cart-id="${item.id}">
                                            <i class="ti-minus"></i>
                                        </a>
                                        <input class="item-quantity" type="number" value="${item.quantity}" min="1" max="20" readonly>
                                        <a class="input-number-increment btn-update" style="color: #212529" href="#?" action="plus" cart-id="${item.id}">
                                            <i class="ti-plus"></i>
                                        </a>
                                    </div>
                                </td>
                                <td>
                                    <h5 class="item-total-price">$720.00</h5>
                                </td>
                                <td class="text-center">
                                    <a href="#" class="btn-delete" cart-id="${item.id}">
                                        <i class="fa-solid fa-trash-can text-danger h5"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${carts.size() != 0}">
                            <tr class="total-row">
                                <td></td>
                                <td></td>
                                <td>
                                    <h5>Total</h5>
                                </td>
                                <td>
                                    <h5 class="total-price">$2160.00</h5>
                                </td>
                                <td></td>
                            </tr>
                        </c:if>

                        </tbody>
                    </table>
                    <c:if test="${carts.size() != 0}">
                        <div class="checkout_btn_inner d-flex justify-content-between" style="font-family: 'Inter', 'Helvetica Neue', sans-serif">
                            <a class="btn_1" href="#">Tiếp Tục Mua Sắm</a>
                            <button class="btn_1 checkout_btn_1" href="#">Tiến Hành Thanh Toán</button>
                        </div>
                    </c:if>
                    <c:if test="${carts.size() == 0}">
                        <h5>Bạn chưa có sản phẩm nào trong giỏ hàng</h5>
                    </c:if>

                </form>
            </div>
        </div>
    </div>
</section>
<!--================End Cart Area =================-->
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="js/cart.js"></script>

</body>

</html>