<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Order Detail</title>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="css/toast.css">
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
                    <h2>Chi tiết đơn hàng</h2>
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
                    <span>Cảm ơn bạn. Đơn hàng của bạn đã được nhận.</span>
                </div>
            </div>
            <div class="col-lg-6 col-lx-4">
                <div class="single_confirmation_details">
                    <h4>Đơn hàng</h4>
                    <ul>
                        <li>
                            <p>Mã đơn hàng</p><span>: ${order.id}</span>
                        </li>
                        <li>
                            <p>Ngày tạo</p><span>: ${order.createdTime}</span>
                        </li>
                        <li>
                            <p>Đơn giá</p><span class="order-price">: USD 2210</span>
                        </li>
                        <li>
                            <p>Trạng thái</p><span>: ${order.status}</span>
                        </li>
                    </ul>
                    <h4 class="mt-5">Thanh toán</h4>
                    <ul>
                        <li>
                            <p>Hình thức thanh toán</p><span>: ${order.payment.type}</span>
                        </li>
                        <li>
                            <p>Trạng thái</p><span>: ${order.payment.status}</span>
                        </li>
                        <li>
                            <p>Giá trị</p><span class="payment-price">: ${order.payment.amount}</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6 col-lx-4">
                <div class="single_confirmation_details">
                    <h4>Địa chỉ giao hàng</h4>
                    <ul>
                        <li class="mb-2">
                            <p>Người nhận</p><span>: ${order.address.receiver}</span>
                        </li>
                        <li class="mb-2">
                            <p>Số điện thoại</p><span>: ${order.address.phone}</span>
                        </li>
                        <li class="mb-2">
                            <p>Tỉnh/T.Phố</p><span>: ${order.address.province}</span>
                        </li>
                        <li class="mb-2">
                            <p>Quận/Huyện</p><span>: ${order.address.district}</span>
                        </li>
                        <li class="mb-2">
                            <p>Phường xã</p><span>: ${order.address.town}</span>
                        </li>
                        <li class="mb-2">
                            <p>Thôn Xóm</p><span>: ${order.address.village}</span>
                        </li>
                        <li class="mb-2">
                            <p>Chi tiết</p><span>: ${order.address.detail}</span>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="order_details_iner">
                    <h3>Chi tiết đơn hàng</h3>
                    <table class="table table-borderless" style="font-family: 'Inter', sans-serif">
                        <thead>
                        <tr>
                            <th scope="col" colspan="2">Sản phẩm</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Tổng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${order.orderDetails}">
                            <tr>
                                <th colspan="2"><span>${item.bookName}</span></th>
                                <th>x${item.quantity}</th>
                                <th> <span class="item-price">${item.price}</span></th>
                            </tr>
                        </c:forEach>
                        <tr>
                            <th colspan="3">shipping</th>
                            <th><span>Cước phí: 0đ</span></th>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th scope="col" colspan="3">Tổng</th>
                            <th scope="col" class="detail-total">500.000đ</th>
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
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<!-- custom js -->
<script src="js/custom.js"></script>
<script src="js/toast.js"></script>
<script>
    function formatPrice() {
        const itemPrices = document.querySelectorAll('.item-price');
        let total = 0;
        itemPrices.forEach(item => {
            total += parseInt(item.textContent);
            console.log(item.textContent);
            item.textContent = item.textContent.replace(/\B(?=(\d{3})+(?!\d))/g, ".") + 'đ';
        });
        document.querySelector('.detail-total').textContent = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + 'đ';
        document.querySelector('.order-price').textContent = ': ' + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + 'đ';
        document.querySelector('.payment-price').textContent = ': ' + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + 'đ';
    }

    formatPrice();
</script>
</body>

</html>