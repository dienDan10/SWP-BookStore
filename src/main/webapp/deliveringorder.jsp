<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<c:set var="context" value="${pageContext.request.contextPath}"/>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <title>
    Delivering Orders
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
</head>

<body class="g-sidenav-show   bg-gray-100">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>
  <%@include file="components/dashboard-aside.jsp"%>
  <main class="main-content position-relative border-radius-lg ">
    <!-- Navbar -->
    <%@include file="components/dashboard-navbar.jsp" %>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
<%--      Order Management Navbar--%>
      <div class="row">
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <a href="${context}/manage-order" class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">ĐƠN HÀNG MỚI </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
                    <i class="ni ni-fat-add text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <a href="${context}/view-delivering-order" class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">ĐƠN HÀNG ĐANG GIAO</p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
                    <i class="ni ni-delivery-fast text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="col-xl-3 col-sm-6">
          <a href="${context}/view-received-order" class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">ĐƠN HÀNG ĐÃ NHẬN</p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-info text-center rounded-circle">
                    <i class="ni ni-check-bold text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <a href="${context}/view-cancel-order" class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">ĐƠN HÀNG ĐÃ HỦY</p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-danger shadow-danger text-center rounded-circle">
                    <i class="ni ni-fat-remove text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>
      </div>
<%--      End Order Management Navbar--%>
      <div class="row mt-4">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>Đơn hàng đang giao </h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                        ID</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                        Tên tài khoản</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                        Ngày đặt hàng</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                        Ngày giao hàng</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                        Tổng tiền</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                        Trạng thái</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                        Hoạt động</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                        Hoạt động</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${orders}" var="order">
                    <tr>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">${order.id}</p>
                      </td>
                      <td>
                        <div class="d-flex px-2 py-1">
                           <div>
                            <img src="${context}/img/user-image/${order.user.imageURL}" class="avatar avatar-sm me-3"
                                 style="object-fit: cover; object-position: center" alt="user1">
                          </div> 
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">${order.user.name}</h6>
                          </div>
                        </div>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold order-date">${order.createdTime}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold order-date">${order.deliverTime}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold amount">${order.payment.amount}</span>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="text-secondary text-xs font-weight-bold">${order.status}</span>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <a href="${context}/view-order-detail?orderId=${order.id}" class="badge badge-sm bg-gradient-success" target="_blank">Xem</a>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <a href="${context}/cancel-order?id=${order.id}" onclick="if (!confirm('Do you want to cancel this order?')) return false"
                           class="badge badge-sm bg-gradient-danger">Hủy</a>
                      </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

  <!--   Core JS Files   -->
  <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="assets/js/argon-dashboard.min.js?v=2.0.4"></script>
  <script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="js/format-order-date.js"></script>
  <script>
    function formatPrice() {
      document.querySelectorAll('.amount').forEach(item => {
        item.textContent = item.textContent.replace(/\B(?=(\d{3})+(?!\d))/g, ".") + 'đ';
      });
    }
    formatPrice();
  </script>
</body>

</html>