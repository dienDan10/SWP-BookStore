<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="img/favicon.jpeg">
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
    <link rel="stylesheet" href="css/toast.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
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
                    <div class="card mb-4 rounded-1 px-2">
                        <div class="card-header pb-0">
                            <h6>Product Management</h6>
                        </div>
                        <div class="d-flex">
                            <a href="#" class="btn btn-sm btn-info d-lg-block ms-3 my-2" data-bs-toggle="modal"
                                data-bs-target="#addBookModal">Add Book</a>
                            <a href="#" class="btn btn-sm btn-info d-lg-block ms-3 my-2" data-bs-toggle="modal"
                               data-bs-target="#import-excel">Import Excel</a>
                        </div>
                        <div class="card-body px-0 pt-0 pb-2">
                            <div class="table-responsive p-2">
                                <table class="table align-items-center mb-0 table-hover" id="my-table" style="width: 100%">
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
                                                            <img src="${context}${book.imageFront}" class="avatar avatar-sm me-3"
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
                                                    <a href="${context}/book-detail?id=${book.id}" target="_blank" class="badge badge-sm bg-gradient-success">View</a>
                                                </td>
                                                <td class="align-middle text-center text-sm">
                                                    <a href="#" class="badge badge-sm bg-gradient-success"
                                                       data-bs-toggle="modal" data-bs-target="#book-${book.id}">Update</a>
                                                </td>
                                                <td class="align-middle text-center text-sm">
                                                    <a href="${context}/delete-product?bookId=${book.id}" onclick="if (!confirm('Do you want to delete?')) return false"
                                                       class="badge badge-sm bg-gradient-success">Delete</a>
                                                </td>
                                            </tr>
                                            <!-- popup Update book -->
                                            <div class="modal fade" id="book-${book.id}" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-special">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="productModalLabel">Update Product</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="${context}/update-product" class="update-book-form" book-id="${book.id}" enctype="multipart/form-data" method="post">
                                                                <input type="hidden" name="id" value="${book.id}">
                                                                <div class="mb-3">
                                                                    <label for="bookName-u" class="form-label">Name</label>
                                                                    <input type="text" class="form-control" id="bookName-u" required
                                                                           name="bookName" aria-describedby="bookNameHelp" value="${book.name}">
                                                                </div>
                                                                <div class="mb-3 col-lg-5 me-lg-5 d-inline-block">
                                                                    <label for="bookDescription-u" class="form-label">Description</label>
                                                                    <input class="form-control" id="bookDescription-u" required name="description" value="${book.description}">
                                                                </div>
                                                                <div class="mb-3 col-lg-6 d-inline-block">
                                                                    <label for="bookPublishedDate-${book.id}" class="form-label">Published Date</label>
                                                                    <div id="error-message-${book.id}" class="error-message-date" style="color: red; display: none; font-size: 0.75rem"> Cannot Be In The Future.</div>
                                                                    <input type="date" class="form-control published-date-input" required id="bookPublishedDate-${book.id}" name="publishedDate" value="${book.publishedDate}">
                                                                </div>
                                                                <div class="mb-3 col-12 col-lg-5 me-lg-5 d-inline-block text-container">
                                                                    <label for="author-u" class="form-label">Author Name</label>
                                                                    <input type="text" class="form-control" list="authorList"
                                                                           id="author-u" name="author" required  value="${book.author.name}">
                                                                    <datalist id="authorList-u">
                                                                        <c:forEach items="${authors}" var="author">
                                                                            <option value="${author.name}">${author.name}</option>
                                                                        </c:forEach>
                                                                    </datalist>
                                                                </div>
                                                                <div class="mb-3 col-lg-6 d-inline-block">
                                                                    <label for="publisher-u" class="form-label">Publisher Name</label>
                                                                    <select class="form-select" id="publisher-u" name="publisherId" required  value="${book.publisher.name}">
                                                                        <c:forEach items="${publishers}" var="publisher">
                                                                            <c:choose>
                                                                                <c:when test="${book.publisher.id == publisher.id}">
                                                                                    <option value="${publisher.id}" selected>${publisher.name}</option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <option value="${publisher.id}">${publisher.name}</option>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>

                                                                <div class="mb-3 col-lg-3 d-inline-block">
                                                                    <label for="bookCategory-u" class="form-label">Category Name</label>
                                                                    <select class="form-select" id="bookCategory-u" name="categoryId" required value="${book.category.name}">
                                                                        <c:forEach items="${categories}" var="category">
                                                                            <c:choose>
                                                                                <c:when test="${book.category.id == category.id}">
                                                                                    <option value="${category.id}" selected>${category.name}</option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <option value="${category.id}">${category.name}</option>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <div class="mb-3 col-lg-2 me-lg-5 d-inline-block">
                                                                    <label for="bookQuantity-u" class="form-label">Quantity</label>
                                                                    <input type="number" class="form-control" id="bookQuantity-u" name="quantity" min="0" required value="${book.quantity}" onkeydown="if(event.key==='.'){event.preventDefault();}"  oninput="event.target.value = event.target.value.replace(/[^0-9]*/g,'');">
                                                                </div>
                                                                <div class="mb-3 col-lg-3 d-inline-block">
                                                                    <label for="bookNumberOfPages-u" class="form-label">Number of Pages</label>
                                                                    <input type="number" class="form-control" id="bookNumberOfPages-u" name="pageNum" min="10" required value="${book.pageCount}" onkeydown="if(event.key==='.'){event.preventDefault();}"  oninput="event.target.value = event.target.value.replace(/[^0-9]*/g,'');">
                                                                </div>
                                                                <div class="mb-3 col-lg-3 d-inline-block">
                                                                    <label for="bookPrice-u" class="form-label">Price</label>
                                                                    <input type="number" class="form-control book-prices" id="bookPrice-u" name="price" required value="${book.price}" onkeydown="if(event.key==='.'){event.preventDefault();}"  oninput="event.target.value = event.target.value.replace(/[^0-9]*/g,'');">
                                                                </div>
                                                                <div class="mb-3 col-lg-5 me-lg-5 d-inline-block">
                                                                    <label for="imgFront-u" class="form-label">Front Image</label>
                                                                    <input type="file" class="form-control form-control-lg " id="imgFront-u" name="imgFront">
                                                                </div>
                                                                <div class="mb-3 col-lg-6 d-inline-block">
                                                                    <label for="imgBack-u" class="form-label">Back Image</label>
                                                                    <input type="file" class="form-control form-control-lg" id="imgBack-u" name="imgBack">
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="bookSummary-u" class="form-label">Summary</label>
                                                                    <textarea class="form-control" id="bookSummary-u" rows="5" name="summary" required>${book.summary}</textarea>
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
                                            <!-- popup Update book end here -->
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
                        <form action="${context}/add-product" class="add-book-form" enctype="multipart/form-data" method="post">
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
                                <input type="number" class="form-control" id="bookQuantity" min="0" name="quantity" required onkeydown="if(event.key==='.'){event.preventDefault();}"  oninput="event.target.value = event.target.value.replace(/[^0-9]*/g,'');">
                            </div>
                            <div class="mb-3 col-lg-3 d-inline-block">
                                <label for="bookNumberOfPages" class="form-label">Number of Pages</label>
                                <input type="number" class="form-control" id="bookNumberOfPages" name="pageNum" min="10" required onkeydown="if(event.key==='.'){event.preventDefault();}"  oninput="event.target.value = event.target.value.replace(/[^0-9]*/g,'');">
                            </div>
                            <div class="mb-3 col-lg-3 d-inline-block">
                                <label for="bookPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" id="bookPrice" name="price" min="1000" onkeydown="if(event.key==='.'){event.preventDefault();}"  oninput="event.target.value = event.target.value.replace(/[^0-9]*/g,'');" required>
                            </div>
                            <div class="mb-3 col-lg-5 me-lg-5 d-inline-block">
                                <label for="imgFront" class="form-label">Front Image</label>
                                <input type="file" class="form-control form-control-lg " id="imgFront" name="imgFront" accept=".jpeg,.jpg,.png,.webp" required>
                            </div>
                            <div class="mb-3 col-lg-6 d-inline-block">
                                <label for="imgBack" class="form-label">Back Image</label>
                                <input type="file" class="form-control form-control-lg" id="imgBack" name="imgBack" accept=".jpeg,.jpg,.png,.webp" required>
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

        <!--POP UP IMPORT EXCEL-->
        <!-- Modal -->
        <div class="modal fade" id="import-excel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Excel Import</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form" action="${context}/excel-import" enctype="multipart/form-data" method="POST">
                            <div class="form-group mb-3">
                                <label>Excel file</label>
                                <input type="file" name="excel" class="form-control" accept=".xlsx" required>
                                <div class="fst-italic fs-6">(.xlsx file only)</div>
                            </div>
                            <div class="form-group mb-3">
                                <label>Upload pictures</label>
                                <input type="file" name="images" class="form-control" multiple required accept=".jpg, .jpeg, .png, .webp">
                                <div class="fst-italic">(.jpg, .jpeg, .png, .webp only)</div>
                            </div>
                            <button class="btn btn-primary mt-3">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--POP UP IMPORT EXCEL END-->
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
    <!-- Github buttons -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="assets/js/argon-dashboard.min.js?v=2.0.4"></script>

    <!--  Data Table  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
    <script src="js/toast.js"></script>
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

        document.querySelectorAll(".update-book-form").forEach(form => form.addEventListener('submit', function(event) {
            // Get the input date value
            const form = event.target;
            const bookId = form.getAttribute('book-id');
            const dateInput = document.querySelector("#bookPublishedDate-" + bookId).value;
            const errorMessage = document.getElementById("error-message-" + bookId);

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
        }));


        // format book price
        function formatBookPrice() {
            document.querySelectorAll('.book-prices').forEach(book => {
                const newValue = parseInt(book.value);
                book.value = newValue;
            })
        }
        formatBookPrice();
    </script>


    <!-- Delete -->
    <script>
        new DataTable('#my-table');
    </script>
</body>

</html>