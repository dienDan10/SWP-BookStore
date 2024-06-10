<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Checkout</title>
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
                    <h2>checkout</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!--================Checkout Area =================-->
<section class="checkout_area section_padding">
    <div class="container">
        <div class="billing_details">
            <form action="/confirm-order" method="POST">
                <div class="row">
                    <div class="col-lg-6">
                        <h3>Xác Nhận Địa Chỉ</h3>
                        <c:forEach var="address" items="${addresses}">
                            <div class="address p-3 d-flex flex-row mb-3" style="background-color: #f4edf278; color: #4B3049">
                                <div class="mr-3 align-self-center">
                                    <input type="radio" name="addressId" value="${address.id}" ${address.isDefault() ? "checked" : ""}>
                                </div>
                                <div class="info flex-fill">
                                    <div class="receiver-name">
                                        <span class="text-uppercase">${address.receiver}</span>
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
                            </div>
                        </c:forEach>

                    </div>
                    <div class="col-lg-6">

                        <div class="order_box">
                            <h2>Đơn hàng của bạn</h2>
                            <ul class="list" style="font-family: 'Inter', 'Helvetica Neue', sans-serif">
                                <li>
                                    <a href="#" class="disabled">Sản phẩm
                                        <span>Tổng</span>
                                    </a>
                                </li>
                                <c:forEach var="item" items="${items}">
                                    <input type="hidden" name="cartId" value="${item.id}">
                                    <li>
                                        <a href="#" class="d-flex mb-2 disabled">
                                    <span class="flex-fill" style="line-height: 20px">
                                        ${item.book.name}
                                    </span>
                                            <span class="middle">x ${item.quantity}</span>
                                            <span class="ml-4 item-price">${item.book.price * item.quantity}</span>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <ul class="list list_2" style="font-family: 'Inter', 'Helvetica Neue', sans-serif">
                                <li>
                                    <a href="#" class="disabled">Shipping
                                        <span>Cước phí: 0đ</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="disabled">Tổng
                                        <span class="total-price">$2210.00</span>
                                    </a>
                                </li>
                            </ul>
                            <div class="payment_item">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option5" name="payment-method" class="payment-type" button-name="Đặt hàng" value="orderReceived" checked/>
                                    <label for="f-option5" style="font-family: 'Inter', 'Helvetica Neue', sans-serif">
                                        <span class="d-inline-block" style="margin-top: 3px;">Thanh toán khi nhận hàng</span>
                                    </label>
                                    <div class="check"></div>
                                </div>
                                <p>
                                    Thanh toán sau khi đã nhận được và kiểm tra đơn hàng, thông qua người
                                    trung gian là nhân viên giao hàng.
                                </p>
                            </div>
                            <div class="payment_item">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option6" name="payment-method" button-name="Thanh toán" class="payment-type" value="vnpay"/>
                                    <label for="f-option6" style="font-family: 'Inter', 'Helvetica Neue', sans-serif">
                                        <span class="d-inline-block" style="margin-top: 3px;">VNpay</span>
                                    </label>
                                    <div class="check"></div>
                                </div>
                                <p>
                                    Thanh toán thông qua cổng giao dịch của VNPAY dưới nhiều hình
                                    thức như thẻ nội địa, thẻ quốc tế, quét mã QR.
                                </p>
                            </div>
                            <div class="creat_account">
                                <input type="checkbox" id="f-option4" name="selector" required/>
                                <label for="f-option4">I’ve read and accept the </label>
                                <a href="#" onclick="return false">terms & conditions*</a>
                            </div>
                            <button class="btn_3 col-12 btn_order" href="#">Đặt hàng</button>
                        </div>

                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!--================End Checkout Area =================-->
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
<script src="js/contact.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<!-- custom js -->
<script src="js/custom.js"></script>
<script src="js/toast.js"></script>
<script>
    const items = document.querySelectorAll('.disabled');
    items.forEach(item => {
        item.addEventListener('click', (e) => {
            e.preventDefault();
            return false;
        })
    });

    // format price
    function formatPrice() {
        const prices = document.querySelectorAll('.item-price');
        let total = 0;
        prices.forEach(price => {
            let formatted = price.textContent;
            total += parseInt(formatted);
            formatted = formatted.replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            price .textContent = formatted + 'đ';
        })

        const totalPrice = document.querySelector('.total-price');
        totalPrice.textContent = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + 'đ';

    }

  formatPrice();

    document.querySelectorAll('.payment-type').forEach(type => {
        type.addEventListener('click', function() {
           document.querySelector('.btn_order').textContent = type.getAttribute('button-name');
        });
    });

</script>
</body>

</html>