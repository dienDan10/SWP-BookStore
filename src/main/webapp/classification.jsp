<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <title>
        Classification Management
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
    <style>
        .dt-search > label {
            display: none;
        }
    </style>
</head>

<body class="g-sidenav-show   bg-gray-100">
<div class="min-height-300 bg-primary position-absolute w-100"></div>
<%@include file="components/dashboard-aside.jsp"%>
<main class="main-content position-relative border-radius-lg ">
    <!-- Navbar -->
    <%@include file="components/dashboard-navbar.jsp"%>
    <!-- End Navbar -->

    <div class="container-fluid py-4 justify-content-center">
        <div class="row justify-content-center">
            <!-- ----------------------Category--------------------------------- -->
            <div class="col-12 col-lg-6">
                <div class="card mb-4 rounded-1">
                    <div class="card-header pb-0">
                        <h6>Quản Lý Thể Loại</h6>
                    </div>
                    <div class="d-flex">
                        <a href="#" class="btn btn-sm btn-info mb-0 d-none d-lg-block" data-bs-toggle="modal"
                           data-bs-target="#addCategoryModal" style="margin: 0 auto;">Thêm mới</a>
                    </div>
                    <div class="card-body px-0 pt-0 pb-2">
                        <div class="table-responsive px-3">
                            <table class="table align-items-center mb-0 table-hover" id="category-table" style="width: 100%">
                                <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">ID</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Tên</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Hoạt động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="category" items="${categories}">
                                    <tr>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">${category.id}</p>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">${category.name}</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <a href="#" class="badge badge-sm bg-gradient-success" data-bs-toggle="modal" data-bs-target="#category-${category.id}">Cập Nhật</a>
                                            <a href="${context}/delete-category?categoryId=${category.id}" onclick="if (!confirm('Do you want to delete?')) return false"
                                               class="badge badge-sm bg-gradient-danger">Xóa</a>
                                        </td>
                                    </tr>
                                    <!-- popup Update Category -->
                                    <div class="modal fade" id="category-${category.id}" tabindex="-1" aria-labelledby="categoryModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-special">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="categoryModalLabel">Cập Nhật Thể Loại</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="${context}/update-category" category-id="${category.id}" method="post">
                                                        <input type="hidden" name="id" value="${category.id}">
                                                        <div class="mb-3">
                                                            <label for="categoryName-u" class="form-label">Tên</label>
                                                            <input type="text" class="form-control" id="categoryName-u" required
                                                                   name="categoryName" aria-describedby="categoryNameHelp" value="${category.name}">
                                                        </div>
                                                        <div class="modal-footer">
                                                            <p type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</p>
                                                            <button type="submit" class="btn btn-primary">Lưu </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- popup Update category end here -->
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ---------------------- Publisher --------------------------------- -->
            <div class="col-12 col-lg-6">
                <div class="card mb-4 rounded-1">
                    <div class="card-header pb-0">
                        <h6>Quản Lý Nhà Xuất Bản</h6>
                    </div>
                    <div class="d-flex">
                        <a href="#" class="btn btn-sm btn-info mb-0 d-none d-lg-block" data-bs-toggle="modal"
                           data-bs-target="#addPublisherModal" style="margin: 0 auto;">Thêm mới</a>
                    </div>
                    <div class="card-body px-0 pt-0 pb-2">
                        <div class="table-responsive px-3">
                            <table class="table align-items-center mb-0 table-hover" id="publisher-table" style="width: 100%">
                                <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">ID</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Tên</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Hoạt động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="publisher" items="${publishers}">
                                    <tr>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">${publisher.id}</p>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">${publisher.name}</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <a href="#" class="badge badge-sm bg-gradient-success"
                                               data-bs-toggle="modal" data-bs-target="#publisher-${publisher.id}">Cập Nhật</a>
                                            <a href="${context}/delete-publisher?publisherId=${publisher.id}" onclick="if (!confirm('Do you want to delete?')) return false"
                                               class="badge badge-sm bg-gradient-danger">Xóa</a>
                                        </td>
                                    </tr>
                                    <!-- popup Update Publisher -->
                                    <div class="modal fade" id="publisher-${publisher.id}" tabindex="-1" aria-labelledby="publisherModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-special">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="publisherModalLabel">Cập Nhật Nhà Xuất Bản</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="${context}/update-publisher" publisher-id="${publisher.id}" method="post">
                                                        <input type="hidden" name="id" value="${publisher.id}">
                                                        <div class="mb-3">
                                                            <label for="publisherName-u" class="form-label">Tên</label>
                                                            <input type="text" class="form-control" id="publisherName-u" required
                                                                   name="publisherName" aria-describedby="publisherNameHelp" value="${publisher.name}">
                                                        </div>
                                                        <div class="modal-footer">
                                                            <p type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</p>
                                                            <button type="submit" class="btn btn-primary">Lưu</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- popup Update publisher end here -->
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ---------------------- Author --------------------------------- -->
    <div class="container-fluid py-4 justify-content-center">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card mb-4 rounded-1">
                    <div class="card-header pb-0">
                        <h6>Quản Lý Tác Giả</h6>
                    </div>
                    <div class="d-flex">
                        <a href="#" class="btn btn-sm btn-info mb-0 d-none d-lg-block" data-bs-toggle="modal"
                           data-bs-target="#addAuthorModal" style="margin: 0 auto;">Thêm mới</a>
                    </div>
                    <div class="card-body px-0 pt-0 pb-2">
                        <div class="table-responsive px-3">
                            <table class="table align-items-center mb-0 table-hover" id="author-table" style="width: 100%">
                                <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-start">ID</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Tên</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Hoạt động</th>
                                </tr>
                                </thead>
                                    <tbody>
                                    <c:forEach var="author" items="${authors}">
                                    <tr>
                                        <td class="text-start">
                                            <p class="text-xs font-weight-bold mb-0">${author.id}</p>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">${author.name}</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <a href="#" class="badge badge-sm bg-gradient-success"
                                               data-bs-toggle="modal" data-bs-target="#author-${author.id}">Cập Nhật</a>
                                            <a href="${context}/delete-author?authorId=${author.id}" onclick="if (!confirm('Do you want to delete?')) return false"
                                               class="badge badge-sm bg-gradient-danger">Xóa</a>
                                        </td>
                                    </tr>
                                        <!-- popup Update Author -->
                                        <div class="modal fade" id="author-${author.id}" tabindex="-1" aria-labelledby="authorModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-special">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="authorModalLabel">Cập Nhật Tác Giả</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="${context}/update-author" author-id="${author.id}" method="post">
                                                            <input type="hidden" name="id" value="${author.id}">
                                                            <div class="mb-3">
                                                                <label for="authorName-u" class="form-label">Tên</label>
                                                                <input type="text" class="form-control" id="authorName-u" required
                                                                       name="authorName" aria-describedby="authorNameHelp" value="${author.name}">
                                                            </div>
                                                            <div class="modal-footer">
                                                                <p type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</p>
                                                                <button type="submit" class="btn btn-primary">Lưu</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- popup Update author end here -->
                                    </c:forEach>
                                    </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="mb-5"></div>

    <!-- pop up add category -->
    <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCategoryLabel">Thêm thể loại mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Form fields go here -->
                    <form action="${context}/add-category" method="post">
                        <div class="mb-3">
                            <label for="categoryName" class="form-label">Tên</label>
                            <input type="text" class="form-control" id="categoryName" name="categoryName" aria-describedby="categoryNameHelp">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

    <!-- pop up add author -->
    <div class="modal fade" id="addAuthorModal" tabindex="-1" aria-labelledby="addAuthorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addAuthorModalLabel">Thêm Tác Giả Mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Form fields go here -->
                    <form action="${context}/add-author" method="post">
                        <div class="mb-3">
                            <label for="authorName" class="form-label">Tên</label>
                            <input type="text" class="form-control" id="authorName" name="authorName" aria-describedby="authorNameHelp">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Lưu </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- pop up add publisher -->
    <div class="modal fade" id="addPublisherModal" tabindex="-1" aria-labelledby="addPublisherLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addPublisherModalLabel">Thêm Nhà Xuất Bản</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Form fields go here -->
                    <form action="${context}/add-publisher" method="post">
                        <div class="mb-3">
                            <label for="publisherName" class="form-label">Tên</label>
                            <input type="text" class="form-control" id="publisherName" name="publisherName" aria-describedby="publisherNameHelp">
                        </div>
                        <div class="modal-footer">
                            <p type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</p>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                        </div>
                    </form>
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
    new DataTable("#author-table", {
        "pageLength": 5,
        "lengthMenu": [5,10,15,20],
        "initComplete": function() {
            var $searchInput = $('.dt-input');
            $searchInput.attr('placeholder', 'Search...'); // Add placeholder
        }
    });
    new DataTable("#publisher-table", {
        "pageLength": 5,
        "lengthMenu": [5,10,15,20],
        "initComplete": function() {
            var $searchInput = $('.dt-input');
            $searchInput.attr('placeholder', 'Search...'); // Add placeholder
        }
    });
    new DataTable("#category-table", {
        "pageLength": 5,
        "lengthMenu": [5,10,15,20],
        "initComplete": function() {
            var $searchInput = $('.dt-input');
            $searchInput.attr('placeholder', 'Search...'); // Add placeholder
        }
    })
</script>
</body>

</html>
