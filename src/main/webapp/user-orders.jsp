<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
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
                <li class="nav-item " role="presentation">
                  <a class="nav-link nav-link-special-1" id="profile-tab" data-toggle="tab" href="#profile"
                     role="tab" aria-controls="profile" aria-selected="false">
                    <i class="fa-solid fa-truck-fast"></i>
                    <span>Đang Giao</span>
                  </a>
                </li>
                <li class="nav-item" role="presentation">
                  <a class="nav-link nav-link-special-2" id="messages-tab" data-toggle="tab" href="#messages"
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
                              <img src="${item.bookImageFront}" alt="">
                            </div>
                            <div class="item-name">
                              ${item.bookName} <br>
                              <span class="quantity">Số lượng: ${item.quantity}</span>
                            </div>
                            <div class="item-price">
                                ${item.price}
                            </div>
                          </div>
                        </c:forEach>
                        <div class="order-footer">
                          <a class="btn_5" href="${context}/view-order-detail?orderId=${order.id}">Chi tiết</a>
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
                              <img src="${item.bookImageFront}" alt="">
                            </div>
                            <div class="item-name">
                                ${item.bookName} <br>
                              <span class="quantity">Số lượng: ${item.quantity}</span>
                            </div>
                            <div class="item-price">
                                ${item.price}
                            </div>
                          </div>
                        </c:forEach>
                        <div class="order-footer">
                          <a class="btn_5" href="${context}/view-order-detail?orderId=${order.id}">Chi tiết</a>
                          <a class="btn_5 ml-2" href="${context}/receive-order?orderId=${order.id}"
                            onclick="if(!confirm('Bạn có chắc muốn nhận đơn hàng này?')) return false"
                          >Nhận hàng</a>
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
                              <img src="${item.bookImageFront}" alt="">
                            </div>
                            <div class="item-name">
                                ${item.bookName} <br>
                              <span class="quantity">Số lượng: ${item.quantity}</span>
                            </div>
                            <div class="d-flex flex-column justify-content-start align-items-end">
                              <div class="item-price mb-1">
                                  ${item.price}
                              </div>
                              <c:if test="${!item.isRated()}">
                                <a class="btn_6" href="#" data-toggle="modal" data-target="#product-rating-${item.id}">Đánh giá</a>
                                <!-- Modal Rating Product-->
                                <div class="modal fade" id="product-rating-${item.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">${item.bookName}</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <form action="${context}/rating?orderDetailId=${item.id}" method="POST" class="rating-form">
                                        <input type="hidden" name="bookId" value="${item.bookId}">
                                        <div class="modal-body">
                                          <div>
                                            <h5 class="text-center">Đánh giá</h5>
                                            <div class="wrapper">
                                              <input type="checkbox" id="st1" class="input-star" name="star" value="5" />
                                              <label for="st1"></label>
                                              <input type="checkbox" id="st2" class="input-star" name="star" value="4" />
                                              <label for="st2"></label>
                                              <input type="checkbox" id="st3" class="input-star" name="star" value="3" />
                                              <label for="st3"></label>
                                              <input type="checkbox" id="st4" class="input-star" name="star" value="2" />
                                              <label for="st4"></label>
                                              <input type="checkbox" id="st5" class="input-star" name="star" value="1" />
                                              <label for="st5"></label>
                                            </div>
                                          </div>
                                          <hr>
                                          <div>
                                            <h5 class="text-center">Bình luận</h5>
                                            <input type="text" class="form-control" placeholder="Tiêu đề" name="title" required>
                                            <textarea class="form-control mt-3" rows="5" style="min-height: 100px" placeholder="Nội dung" name="content" required></textarea>
                                          </div>
                                        </div>
                                        <div class="modal-footer">
                                          <button type="submit" class="btn_5">Lưu</button>
                                        </div>
                                      </form>
                                    </div>
                                  </div>
                                </div>
                                <!-- Modal Rating Product end here-->
                              </c:if>
                            </div>
                          </div>
                        </c:forEach>
                        <div class="order-footer">
                          <a class="btn_5" href="${context}/view-order-detail?orderId=${order.id}">Chi tiết</a>
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
                              <img src="${item.bookImageFront}" alt="">
                            </div>
                            <div class="item-name">
                                ${item.bookName} <br>
                              <span class="quantity">Số lượng: ${item.quantity}</span>
                            </div>
                            <div class="item-price">
                                ${item.price}
                            </div>
                          </div>
                        </c:forEach>
                        <div class="order-footer">
                          <a class="btn_5" href="${context}/view-order-detail?orderId=${order.id}">Chi tiết</a>
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
<div style="display: none" page="${not empty page ? page : 'none'}" class="page"></div>
<c:remove var="page" scope="session"></c:remove>
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
  const page = document.querySelector('.page').getAttribute('page');
  if (page === '1') {
    document.querySelector('.nav-link-special-1').click();
  } else if (page === '2') {
    document.querySelector('.nav-link-special-2').click();
  }


</script>
</body>

</html>
