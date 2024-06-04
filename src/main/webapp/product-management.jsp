<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <title>
        Product Management
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
    <aside
        class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 "
        id="sidenav-main">
        <div class="sidenav-header">
            <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
                aria-hidden="true" id="iconSidenav"></i>
            <a class="navbar-brand m-0" href="dashboard.jsp" target="_blank">
                <img src="assets/img/logo-ct-dark.png" class="navbar-brand-img h-100" alt="main_logo">
                <span class="ms-1 font-weight-bold">Admin</span>
            </a>
        </div>
        <hr class="horizontal dark mt-0">
        <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link " href="dashboard.jsp">
                        <div
                            class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                            <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
                        </div>
                        <span class="nav-link-text ms-1">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="tables.html">
                        <div
                            class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                            <i class="ni ni-money-coins text-warning text-sm opacity-10"></i>
                        </div>
                        <span class="nav-link-text ms-1">Sales</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="accountmanagement.html">
                        <div
                            class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                            <i class="ni ni-world-2 text-warning text-sm opacity-10"></i>
                        </div>
                        <span class="nav-link-text ms-1">Account Management</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="productmanagement.html">
                        <div
                            class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                            <i class="ni ni-cart text-warning text-sm opacity-10"></i>
                        </div>
                        <span class="nav-link-text ms-1">Product Management</span>
                    </a>
                </li>
            </ul>
        </div>
    </aside>
    <main class="main-content position-relative border-radius-lg ">
        <!-- Navbar -->
        <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur"
            data-scroll="false">
            <div class="container-fluid py-1 px-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                        <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white"
                                href="javascript:;">Pages</a></li>
                        <li class="breadcrumb-item text-sm text-white active" aria-current="page">Product Management
                        </li>
                    </ol>
                    <h6 class="font-weight-bolder text-white mb-0">Product Management</h6>
                </nav>
                <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                    <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                        <div class="input-group">
                            <span class="input-group-text text-body"><i class="fas fa-search"
                                    aria-hidden="true"></i></span>
                            <input type="text" class="form-control" placeholder="Type here...">
                        </div>
                    </div>
                    <ul class="navbar-nav  justify-content-end">
                        <li class="nav-item d-flex align-items-center">
                            <a href="javascript:;" class="nav-link text-white font-weight-bold px-0">
                                <i class="fa fa-user me-sm-1"></i>
                                <span class="d-sm-inline d-none">Sign In</span>
                            </a>
                        </li>
                        <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                            <a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
                                <div class="sidenav-toggler-inner">
                                    <i class="sidenav-toggler-line bg-white"></i>
                                    <i class="sidenav-toggler-line bg-white"></i>
                                    <i class="sidenav-toggler-line bg-white"></i>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="container-fluid py-4">
            <div class="row">
                <div class="col-12">
                    <div class="card mb-4">
                        <div class="card-header pb-0">
                            <h6>Product Management</h6>
                        </div>
                        <div class="d-flex">
                            <a href="#" class="btn btn-sm btn-info mb-0 d-none d-lg-block" data-bs-toggle="modal"
                                data-bs-target="#addBookModal" style="margin: 0 auto;">Add Book</a>
                        </div>
                        <div class="card-body px-0 pt-0 pb-2">
                            <div class="table-responsive p-0">
                                <table class="table align-items-center mb-0">
                                    <thead>
                                        <tr>
                                            <th
                                                class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                                ID</th>
                                            <th
                                                class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                Name</th>
                                            <th
                                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                Quantity</th>
                                            <th
                                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                Rating</th>
                                            <th
                                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                Action</th>
                                            <th
                                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                Action</th>
                                            <th
                                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${books}" var="book">
                                            <tr>
                                                <td>
                                                    <p class="text-xs font-weight-bold mb-0">${book.id}</p>
                                                </td>
                                                <td>
                                                    <div class="d-flex px-2 py-1">
                                                        <div>
                                                            <img src="${book.imageFront}" class="avatar avatar-sm me-3"
                                                                 alt="user1">
                                                        </div>
                                                        <div class="d-flex flex-column justify-content-center">
                                                            <h6 class="mb-0 text-sm">${book.name}</h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="align-middle text-center">
                                                    <span class="text-secondary text-xs font-weight-bold">${book.quantity}</span>
                                                </td>
                                                <td class="align-middle text-center">
                                                    <span class="text-secondary text-xs font-weight-bold">${book.averageRating}</span>
                                                </td>
                                                <td class="align-middle text-center text-sm">
                                                    <a href="#" class="badge badge-sm bg-gradient-success"
                                                       data-bs-toggle="modal" data-bs-target="#bookModal">View</a>
                                                </td>
                                                <td class="align-middle text-center text-sm">
                                                    <a href="#" class="badge badge-sm bg-gradient-success"
                                                       data-bs-toggle="modal" data-bs-target="#productModal">Update</a>
                                                </td>
                                                <!-- <td class="align-middle text-center text-sm">
                                                    <a href="https://example.com/delete-link"
                                                        class="badge badge-sm bg-gradient-success">Delete</a>
                                                </td> -->
                                                <td class="align-middle text-center text-sm">
                                                    <a href="/delete-product?bookId=${book.id}" onclick="confirmDelete()"
                                                       class="badge badge-sm bg-gradient-success">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td>
                                                <p class="text-xs font-weight-bold mb-0">1</p>
                                            </td>
                                            <td>
                                                <div class="d-flex px-2 py-1">
                                                    <div>
                                                        <img src="assets/img/sach.jpg" class="avatar avatar-sm me-3"
                                                            alt="user1">
                                                    </div>
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">Sách Chữa Lành Nỗi Đau</h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="align-middle text-center">
                                                <span class="text-secondary text-xs font-weight-bold">100</span>
                                            </td>
                                            <td class="align-middle text-center">
                                                <span class="text-secondary text-xs font-weight-bold">5.0</span>
                                            </td>
                                            <td class="align-middle text-center text-sm">
                                                <a href="#" class="badge badge-sm bg-gradient-success"
                                                    data-bs-toggle="modal" data-bs-target="#bookModal">View</a>
                                            </td>
                                            <td class="align-middle text-center text-sm">
                                                <a href="#" class="badge badge-sm bg-gradient-success"
                                                    data-bs-toggle="modal" data-bs-target="#productModal">Update</a>
                                            </td>
                                            <!-- <td class="align-middle text-center text-sm">
                                                <a href="https://example.com/delete-link"
                                                    class="badge badge-sm bg-gradient-success">Delete</a>
                                            </td> -->
                                            <td class="align-middle text-center text-sm">
                                                <a href="#" onclick="confirmDelete('https://example.com/delete-link')"
                                                    class="badge badge-sm bg-gradient-success">Delete</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- pop up add book -->
        <div class="modal fade" id="addBookModal" tabindex="-1" aria-labelledby="addBookModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addBookModalLabel">Add New Book</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Form fields go here -->
                        <form>
                            <div class="mb-3">
                                <label for="bookName" class="form-label">Name</label>
                                <input type="text" class="form-control" id="bookName" aria-describedby="bookNameHelp">
                            </div>
                            <div class="mb-3">
                                <label for="bookDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="bookDescription" rows="3"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="bookPublishedDate" class="form-label">Published Date</label>
                                <input type="date" class="form-control" id="bookPublishedDate">
                            </div>
                            <div class="mb-3">
                                <label for="bookAuthorName" class="form-label">Author Name</label>
                                <input type="text" class="form-control" id="bookAuthorName">
                            </div>
                            <div class="mb-3">
                                <label for="bookCategoryName" class="form-label">Category Name</label>
                                <input type="text" class="form-control" id="bookCategoryName">
                            </div>
                            <div class="mb-3">
                                <label for="bookNumberOfPages" class="form-label">Number of Pages</label>
                                <input type="number" class="form-control" id="bookNumberOfPages">
                            </div>
                            <div class="mb-3">
                                <label for="bookPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" id="bookPrice">
                            </div>
                            <div class="mb-3">
                                <label for="bookSummary" class="form-label">Summary</label>
                                <textarea class="form-control" id="bookSummary" rows="3"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save Book</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- popup view book -->
        <div class="modal fade" id="bookModal" tabindex="-1" aria-labelledby="bookModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="bookModalLabel">Book Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" value="Name" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <textarea class="form-control" rows="3" readonly>Description</textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Published Date</label>
                                <input type="text" class="form-control" value="Published Date"
                                    readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Author Name</label>
                                <input type="text" class="form-control" value="Author Name" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Category Name</label>
                                <input type="text" class="form-control" value="Category Name"
                                    readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Number of Pages</label>
                                <input type="text" class="form-control" value="200" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Price</label>
                                <input type="text" class="form-control" value="100000" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Summary</label>
                                <textarea class="form-control" rows="3" readonly>Summary</textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- popup Update book -->
        <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="productModalLabel">Update Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="text" class="form-control" aria-describedby="nameHelp"
                                    placeholder="Enter name">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <textarea class="form-control" rows="3"
                                    placeholder="Enter description"></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Published Date</label>
                                <input type="date" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Author Name</label>
                                <input type="text" class="form-control" placeholder="Enter author name">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Category Name</label>
                                <input type="text" class="form-control"
                                    placeholder="Enter category name">
                            </div>
                            <div class="mb-3">
                                <label for="numberOfPages" class="form-label">Number of Pages</label>
                                <input type="number" class="form-control" id="numberOfPages"
                                    placeholder="Enter number of pages">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Price</label>
                                <input type="number" class="form-control" placeholder="Enter price">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Summary</label>
                                <textarea class="form-control" rows="3"
                                    placeholder="Enter summary"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </div>
        </div>

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

    <!-- Delete -->
    <script>
        function confirmDelete() {
          if (!confirm("Are you sure you want to delete?")) {
                return false;
          }
        }
        </script>
</body>

</html>