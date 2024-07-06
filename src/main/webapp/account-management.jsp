<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <title>
    Account Management
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
  <%-- Data Table --%>
  <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css">
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
        <div class="col-12">
          <div class="card mb-3 rounded-1">
            <div class="card-header pb-0">
              <h6>Quản lý tài khoản</h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-3">
                <table class="table align-items-center mb-0 table-hover" id="my-table" style="width: 100%">
<%--                  Table Head--%>
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary  text-xxs font-weight-bolder opacity-7 ps-2">ID</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Người dùng</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Vai trò</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Trạng thái
                      </th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Hoạt động
                      </th>
                    </tr>
                  </thead>
<%--                  Table Body--%>
                  <tbody>
                    <c:forEach var="user" items="${users}">
                      <tr>
                        <td>
                          <p class="text-xs font-weight-bold mb-0">${user.id}</p>
                        </td>
                        <td>
                          <div class="d-flex px-2 py-1">
                            <div>
                              <img src="${context}/img/user-image/${user.imageURL}" style="object-fit: cover; object-position: center" class="avatar avatar-sm me-3" alt="user1">
                            </div>
                            <div class="d-flex flex-column justify-content-center">
                              <h6 class="mb-0 text-sm">${user.name}</h6>
                              <p class="text-xs text-secondary mb-0">${user.email}</p>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="text-xs font-weight-bold mb-0">${user.roles.get(user.roles.size() - 1).name}</p>
                        </td>
                        <td class="align-middle text-center text-sm">
                          <a href="${context}/change-user-status?id=${user.id}"
                             onclick="if(!confirm('Do you want to change the user\'s status?')) return false"
                             class="badge badge-sm ${user.isActive() ? "bg-gradient-success" : "bg-gradient-danger"} ">
                              ${user.isActive() ? "Hoạt động" : "Bị chặn"}
                          </a>
                        </td>
                        <td class="align-middle text-center text-sm">
                          <a href="#" class="badge badge-sm bg-gradient-success" data-bs-toggle="modal" data-bs-target="#user-${user.id}">Xem</a>
                        </td>
                        <!-- Modal -->
                        <div class="modal fade" id="user-${user.id}" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="userModalLabel">Thông tin người dùng</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <form action="${context}/update-user-role" method="post">
                                <div class="modal-body">
                                  <div class="mb-3">
                                    <label for="name" class="form-label">Tên</label>
                                    <input type="text" class="form-control" id="name" aria-describedby="nameHelp" value="${user.name}" readonly>
                                  </div>
                                  <div class="mb-3 d-inline-block col-md-6 me-md-4">
                                    <label for="username" class="form-label">Tên người dùng</label>
                                    <input type="text" class="form-control" id="username" aria-describedby="usernameHelp" value="${user.username}" readonly>
                                  </div>
                                  <div class="mb-3 d-inline-block ms-md-2 col-md-5">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <input type="tel" class="form-control" id="phone" aria-describedby="phoneHelp" value="${user.phoneNumber}" readonly>
                                  </div>

                                  <div class="mb-3 d-inline-block col-md-6 me-md-4">
                                    <label for="birthdate" class="form-label">Ngày sinh</label>
                                    <input type="text" class="form-control" id="birthdate" aria-describedby="birthdateHelp" value="${user.birthDate}" readonly>
                                  </div>
                                  <div class="mb-3 d-inline-block ms-md-2 col-md-5">
                                    <label for="gender" class="form-label">Giới tính</label>
                                    <input type="text" class="form-control" id="gender" aria-describedby="genderHelp" value="${user.gender ? "Male" : "Female"}" readonly>
                                  </div>
                                  <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="hidden" name="email" value="${user.email}" />
                                    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" value="${user.email}" readonly>
                                  </div>
                                  <label class="form-label me-5">Vai trò</label>
                                  <div class="col-md-3 d-inline-block">
                                    <input type="checkbox" class="mb-3 me-1" onclick="return false;"
                                      ${user.hasRole('USER') ? "checked" : ""}>User
                                  </div>
                                  <div class="col-md-3 d-inline-block">
                                    <input type="checkbox" class="mb-3 me-1" name="role" value="SELLER"
                                      ${user.hasRole('SELLER') ? "checked" : ""}>Seller
                                  </div>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                  <button type="submit" class="btn btn-primary">Lưu</button>
                                </div>
                              </form>
                            </div>
                          </div>
                        </div>
                        <%--End Modal<--%>
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


    <!-- ---------------------------------------------------------------- -->





  </main>
  <!--   Core JS Files   -->
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/argon-dashboard.min.js?v=2.0.4"></script>

  <!--  Data Table  -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>

  <script>
    new DataTable('#my-table');
  </script>

</body>

</html>