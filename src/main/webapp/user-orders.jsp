<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Đơn hàng</title>
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
  <link rel="stylesheet" href="css/user-orders.css">
</head>

<body>
<!--::header part start::-->
<%@ include file="components/header.jsp"%>
<!-- Header part end-->


<!--================Checkout Area =================-->
<section class="checkout_area section_padding" style="padding-top: 80px">
  <div class="container">
    <div class="billing_details">
        <div class="row">
          <div class="col-md-12">
            <!-- Nav tabs -->
            <div class="card">
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home"
                     role="tab" aria-controls="home" aria-selected="true">
                    <i class="fa-solid fa-clock"></i>
                    <span>Đang Xử Lý</span>
                  </a>
                </li>
                <li class="nav-item" role="presentation">
                  <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile"
                     role="tab" aria-controls="profile" aria-selected="false">
                    <i class="fa-solid fa-truck-fast"></i>
                    <span>Đang Giao</span>
                  </a>
                </li>
                <li class="nav-item" role="presentation">
                  <a class="nav-link" id="messages-tab" data-toggle="tab" href="#messages"
                     role="tab" aria-controls="messages" aria-selected="false">
                    <i class="fa-solid fa-circle-check"></i>
                    <span>Đã Nhận</span>
                  </a>
                </li>
                <li class="nav-item" role="presentation">
                  <a class="nav-link" id="settings-tab" data-toggle="tab" href="#settings"
                     role="tab" aria-controls="settings" aria-selected="false">
                    <i class="fa-solid fa-ban"></i>
                    <span>Đã Hủy</span>
                  </a>
                </li>
              </ul>

              <!-- Tab panes -->
              <div class="tab-content">
                <div class="tab-pane fade show active" id="home" role="tabpanel"
                     aria-labelledby="home-tab">
                  <div class="orders">
                    <c:forEach var="order" items="${processingOrders}">
                      <div class="order">
                        <div class="status pb-3">
                          <i class="fa-solid fa-clock"></i>
                          <span class="ml-2">Đang xử lý</span>
                        </div>
                        <c:forEach var="item" items="${order.orderDetails}">
                          <div class="item d-flex flex-row">
                            <div class="item-picture">
                              <img src="${item.book.imageFront}" alt="">
                            </div>
                            <div class="item-name">
                              ${item.book.name} <br>
                              <span class="quantity">Số lượng: ${item.quantity}</span>
                            </div>
                            <div class="item-price">
                                ${item.book.price * item.quantity}
                            </div>
                          </div>
                        </c:forEach>
                        <div class="order-footer">
                          <a class="btn_5" href="/view-order-detail?orderId=${order.id}">Chi tiết</a>
                          <div class="order-total">
                            Tổng tiền: <span class="order-price">${order.payment.amount}</span>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                  <c:if test="${processingOrders.size() == 0}">
                    <div class="no-order">
                      <img src="https://frontend.tikicdn.com/_desktop-next/static/img/account/empty-order.png" class="no-order-img">
                      <p>Chưa có đơn hàng</p>
                    </div>
                  </c:if>
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel"
                     aria-labelledby="profile-tab">
                  <div class="orders">
                    <c:forEach var="order" items="${deliveringOrders}">
                      <div class="order">
                        <div class="status pb-3">
                          <i class="fa-solid fa-truck-fast"></i>
                          <span class="ml-2">Đang giao</span>
                        </div>
                        <c:forEach var="item" items="${order.orderDetails}">
                          <div class="item d-flex flex-row">
                            <div class="item-picture">
                              <img src="${item.book.imageFront}" alt="">
                            </div>
                            <div class="item-name">
                                ${item.book.name} <br>
                              <span class="quantity">Số lượng: ${item.quantity}</span>
                            </div>
                            <div class="item-price">
                                ${item.book.price * item.quantity}
                            </div>
                          </div>
                        </c:forEach>
                        <div class="order-footer">
                          <a class="btn_5" href="/view-order-detail?orderId=${order.id}">Chi tiết</a>
                          <div class="order-total">
                            Tổng tiền: <span class="order-price">${order.payment.amount}</span>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                  <c:if test="${deliveringOrders.size() == 0}">
                    <div class="no-order">
                      <img src="https://frontend.tikicdn.com/_desktop-next/static/img/account/empty-order.png" class="no-order-img">
                      <p>Chưa có đơn hàng</p>
                    </div>
                  </c:if>
                </div>
                <div class="tab-pane fade" id="messages" role="tabpanel"
                     aria-labelledby="messages-tab">
                  <div class="orders">
                    <c:forEach var="order" items="${receivedOrders}">
                      <div class="order">
                        <div class="status pb-3">
                          <i class="fa-solid fa-circle-check"></i>
                          <span class="ml-2">Đã nhận</span>
                        </div>
                        <c:forEach var="item" items="${order.orderDetails}">
                          <div class="item d-flex flex-row">
                            <div class="item-picture">
                              <img src="${item.book.imageFront}" alt="">
                            </div>
                            <div class="item-name">
                                ${item.book.name} <br>
                              <span class="quantity">Số lượng: ${item.quantity}</span>
                            </div>
                            <div class="item-price">
                                ${item.book.price * item.quantity}
                            </div>
                          </div>
                        </c:forEach>
                        <div class="order-footer">
                          <a class="btn_5" href="/view-order-detail?orderId=${order.id}">Chi tiết</a>
                          <div class="order-total">
                            Tổng tiền: <span class="order-price">${order.payment.amount}</span>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                  <c:if test="${receivedOrders.size() == 0}">
                    <div class="no-order">
                      <img src="https://frontend.tikicdn.com/_desktop-next/static/img/account/empty-order.png" class="no-order-img">
                      <p>Chưa có đơn hàng</p>
                    </div>
                  </c:if>
                </div>
                <div class="tab-pane fade" id="settings" role="tabpanel"
                     aria-labelledby="settings-tab">
                  <div class="orders">
                    <c:forEach var="order" items="${cancelledOrders}">
                      <div class="order">
                        <div class="status pb-3">
                          <i class="fa-solid fa-ban"></i>
                          <span class="ml-2">Đã hủy</span>
                        </div>
                        <c:forEach var="item" items="${order.orderDetails}">
                          <div class="item d-flex flex-row">
                            <div class="item-picture">
                              <img src="${item.book.imageFront}" alt="">
                            </div>
                            <div class="item-name">
                                ${item.book.name} <br>
                              <span class="quantity">Số lượng: ${item.quantity}</span>
                            </div>
                            <div class="item-price">
                                ${item.book.price * item.quantity}
                            </div>
                          </div>
                        </c:forEach>
                        <div class="order-footer">
                          <a class="btn_5" href="/view-order-detail?orderId=${order.id}">Chi tiết</a>
                          <div class="order-total">
                            Tổng tiền: <span class="order-price">${order.payment.amount}</span>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                  <c:if test="${cancelledOrders.size() == 0}">
                    <div class="no-order">
                      <img src="https://frontend.tikicdn.com/_desktop-next/static/img/account/empty-order.png" class="no-order-img">
                      <p>Chưa có đơn hàng</p>
                    </div>
                  </c:if>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
  </div>
</section>
<!--================End Checkout Area =================-->

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
<script>
  // const items = document.querySelectorAll('.disabled');
  // items.forEach(item => {
  //   item.addEventListener('click', (e) => {
  //     e.preventDefault();
  //     return false;
  //   })
  // });

  //format price
  function formatPrice() {
    const prices = document.querySelectorAll('.item-price');
    prices.forEach(price => {
      let formatted = price.textContent;
      formatted = formatted.replace(/\B(?=(\d{3})+(?!\d))/g, ".");
      price.textContent = formatted + 'đ';
    })

    const orderPrices = document.querySelectorAll('.order-price');
    orderPrices.forEach(order => {
      let formatted = order.textContent;
      formatted = formatted.replace(/\B(?=(\d{3})+(?!\d))/g, ".");
      order.textContent = formatted + 'đ';
    })

  }

  formatPrice();

  // document.querySelectorAll('.payment-type').forEach(type => {
  //   type.addEventListener('click', function() {
  //     document.querySelector('.btn_order').textContent = type.getAttribute('button-name');
  //   });
  // });

</script>
</body>

</html>
