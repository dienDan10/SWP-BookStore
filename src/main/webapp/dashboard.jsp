<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="img/favicon.jpeg">
  <title>
   Dashboard
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
  <link rel="stylesheet" href="css/toast.css">
</head>

<body class="g-sidenav-show   bg-gray-100">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>
  <%@include file="components/dashboard-aside.jsp"%>
  <main class="main-content position-relative border-radius-lg ">
    <!-- Navbar -->
    <%@include file="components/dashboard-navbar.jsp"%>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
          <a class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">Tổng lợi nhuận </p>
                    <h5 class="font-weight-bolder">
                      10000$
                    </h5>
                    <p class="mb-0">

                      Tổng lợi nhuận
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                    <i class="ni ni-money-coins text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
          <a class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">Tổng khách hàng </p>
                    <h5 class="font-weight-bolder">
                      ${userNumber - 1}
                    </h5>
                    <p class="mb-0">Tổng khách hàng quản lý</p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-danger shadow-danger text-center rounded-circle">
                    <i class="ni ni-world text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="col-xl-4 col-sm-6 mb-4">
          <a class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">Tổng sản phẩm</p>
                    <h5 class="font-weight-bolder">
                      ${bookNumber}
                    </h5>
                    <p class="mb-0">
                      Tổng sản phẩm quản lý
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
                    <i class="ni ni-cart text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>


        <div class="col-xl-4 col-sm-6 mb-4 mb-xl-0 ">
          <a class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">Tổng THU NHẬP</p>
                    <h5 class="font-weight-bolder">
                      10000$
                    </h5>
                    <p class="mb-0">

                      Tổng thu nhập 7 ngày gần nhất
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                    <i class="ni ni-money-coins text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>

        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
          <a class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">TỔNG PHẢN HỒI</p>
                    <h5 class="font-weight-bolder">
                      50
                    </h5>
                    <p class="mb-0">

                      Tổng số phản hồi
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-danger shadow-danger text-center rounded-circle">
                    <i class="ni ni-world text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>

        <div class="col-xl-4 col-sm-6 mb-4">
          <a class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">TỔNG ĐƠN HÀNG</p>
                    <h5 class="font-weight-bolder">
                      ${orderNumber}
                    </h5>
                    <p class="mb-0">
                      Tổng số đơn hàng
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
                    <i class="ni ni-cart text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>

        <h1 style="font-size: 24px; font-weight: bold; text-align: center; margin-bottom: 20px; margin-top: 30px;">TOP
          10 SẢN PHẨM BÁN CHẠY</h1>
        <table style="width:100%; border-collapse: collapse; font-size: 14px; ">
          <thead>
          <tr style="background-color: #5E72E4; color: white;">
            <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">ID</th>
            <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Tên sản phẩm</th>
            <th style="padding: 8px; text-align: left; border: 1px solid #ddd;">Tổng số lượng</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td style="padding: 8px; border: 1px solid #ddd;">1</td>
            <td style="padding: 8px; border: 1px solid #ddd;">Sản phẩm 1</td>
            <td style="padding: 8px; border: 1px solid #ddd;">1000</td>
          </tr>

          </tr>
          </tbody>
        </table>

      </div>
    </div>
  </main>
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

  <!--   Core JS Files   -->
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="assets/js/plugins/chartjs.min.js"></script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/argon-dashboard.min.js?v=2.0.4"></script>
<script src="js/toast.js"></script>
</body>

</html>