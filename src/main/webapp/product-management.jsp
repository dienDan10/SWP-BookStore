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
                    <div class="card mb-4">
                        <div class="card-header pb-0">
                            <h6>Product Management</h6>
                        </div>
                        <div class="d-flex">
                            <a href="#" class="btn btn-sm btn-info mb-0 d-lg-block ms-3" data-bs-toggle="modal"
                                data-bs-target="#addBookModal">Add Book</a>
                        </div>
                        <div class="card-body px-0 pt-0 pb-2">
                            <div class="table-responsive p-2">
                                <table class="table align-items-center mb-0" id="my-table">
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
                                                Publisher</th>
                                            <th
                                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                Quantity</th>
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
                                                        <div class="d-flex flex-column justify-content-center flex-fill">
                                                            <h6 class="mb-0 text-sm text-wrap w-100 w-md-80">${book.name}</h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="align-middle text-center">
                                                    <span class="text-secondary text-xs font-weight-bold">${book.publisher.name}</span>
                                                </td>
                                                <td class="align-middle text-center">
                                                    <span class="text-secondary text-xs font-weight-bold">${book.quantity}</span>
                                                </td>
                                                <td class="align-middle text-center text-sm">
                                                    <a href="/book-detail?id=${book.id}" target="_blank" class="badge badge-sm bg-gradient-success">View</a>
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
                                                    <a href="/delete-product?bookId=${book.id}" onclick="if (!confirm('Do you want to delete?')) return false"
                                                       class="badge badge-sm bg-gradient-success">Delete</a>
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

        <!-- pop up add book -->
        <div class="modal fade" id="addBookModal" tabindex="-1" aria-labelledby="addBookModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-special">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addBookModalLabel">Add New Book</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <!-- Form fields go here -->
                        <form action="/add-product" class="add-book-form" enctype="multipart/form-data" method="post">
                            <div class="mb-3">
                                <label for="bookName" class="form-label">Name</label>
                                <input type="text" class="form-control" id="bookName" required
                                       name="bookName" aria-describedby="bookNameHelp">
                            </div>
                            <div class="mb-3 col-lg-5 me-lg-5 d-inline-block">
                                <label for="bookDescription" class="form-label">Description</label>
                                <input class="form-control" id="bookDescription" required name="description">
                            </div>
                            <div class="mb-3 col-lg-6 d-inline-block">

                                <label for="bookPublishedDate" class="form-label">Published Date</label>
                                <div id="error-message" style="color: red; display: none; font-size: 0.75rem"> Cannot Be In The Future.</div>
                                <input type="date" class="form-control" required id="bookPublishedDate" name="publishedDate">

                            </div>
                            <div class="mb-3 col-12 col-lg-5 me-lg-5 d-inline-block text-container">
                                <label for="author" class="form-label">Author Name</label>
                                <input type="text" class="form-control" list="authorList"
                                       id="author" name="author" required>
                                <datalist id="authorList">
                                    <c:forEach items="${authors}" var="author">
                                        <option value="${author.name}">${author.name}</option>
                                    </c:forEach>
                                </datalist>
                            </div>
                            <div class="mb-3 col-lg-6 d-inline-block">
                                <label for="publisher" class="form-label">Publisher Name</label>
                                <select class="form-select" id="publisher" name="publisherId" required>
                                    <c:forEach items="${publishers}" var="publisher">
                                        <option value="${publisher.id}">${publisher.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="mb-3 col-lg-3 d-inline-block">
                                <label for="bookCategory" class="form-label">Category Name</label>
                                <select class="form-select" id="bookCategory" name="categoryId" required>
                                    <c:forEach items="${categories}" var="category">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3 col-lg-2 me-lg-5 d-inline-block">
                                <label for="bookQuantity" class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="bookQuantity" name="quantity" required>
                            </div>
                            <div class="mb-3 col-lg-3 d-inline-block">
                                <label for="bookNumberOfPages" class="form-label">Number of Pages</label>
                                <input type="number" class="form-control" id="bookNumberOfPages" name="pageNum" required>
                            </div>
                            <div class="mb-3 col-lg-3 d-inline-block">
                                <label for="bookPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" id="bookPrice" name="price" required>
                            </div>
                            <div class="mb-3 col-lg-5 me-lg-5 d-inline-block">
                                <label for="imgFront" class="form-label">Front Image</label>
                                <input type="file" class="form-control form-control-lg " id="imgFront" name="imgFront" >
                            </div>
                            <div class="mb-3 col-lg-6 d-inline-block">
                                <label for="imgBack" class="form-label">Back Image</label>
                                <input type="file" class="form-control form-control-lg" id="imgBack" name="imgBack" >
                            </div>
                            <div class="mb-3">
                                <label for="bookSummary" class="form-label">Summary</label>
                                <textarea class="form-control" id="bookSummary" rows="5" name="summary" required></textarea>
                            </div>
                            <div class="modal-footer">
                                <p type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</p>
                                <button type="submit" class="btn btn-primary">Save Book</button>
                            </div>
                        </form>
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

    <!--  Data Table  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>

    <script>
        document.querySelector(".add-book-form").addEventListener("submit", function(event) {
            // Get the input date value
            const dateInput = document.getElementById("bookPublishedDate").value;
            const errorMessage = document.getElementById("error-message");

            // Convert the input date to a JavaScript Date object
            const inputDate = new Date(dateInput);

            // Get the current date and set the time to midnight to compare only dates
            const currentDate = new Date();
            currentDate.setHours(0, 0, 0, 0);

            // Check if the input date is in the future
            if (inputDate > currentDate) {
                // If it is, prevent form submission and show error message
                event.preventDefault();
                errorMessage.style.display = "inline";
            } else {
                // Otherwise, hide error message
                errorMessage.style.display = "none";
            }
        });
    </script>


    <!-- Delete -->
    <script>
        new DataTable('#my-table');
    </script>
</body>

</html>